Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56D3D0E6C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 11:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eI4Qj6qTL1skfL35BV+mv8RhB1noI0KPetJJRz4wCvo=; b=UQ30ufuSjnAJano+j/3qXGxuDm
	m215JLUwNb1AD7kSDhPAk/+jZOSgbVxxiRovHUUvn1K6EU+D1/lsJVYy78EeJ5wyTmO2oQUEkLKXN
	tpjHPa0wdfZ7ycMgIuMeYhQuWJz1+HiZLBnEKfTMVojkA+mOoikgANXQvcxl0Wt+RG9NXvmsNwWz5
	yyQVuSfBtvGpZ1KZBHVr4zLFCPg2NL8Zau9KpTHRhUFnO6umPswxJIPth9Ep7kFGP1fcbHis9dqn1
	3ETEGzjSR7jnTC578/ogOln2+b3Vuan2Nyit+R+8bxXGhDKZkt/z3gHcGooCuCnP0/OZlgxzrrV8D
	/f7Qw/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNrPZ-0000000DEJq-2vIv;
	Tue, 25 Nov 2025 11:40:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNrPW-0000000DEJM-2Gzp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 11:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E052243BC6;
	Tue, 25 Nov 2025 11:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D32C19421;
	Tue, 25 Nov 2025 11:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764070841;
	bh=zoilOKj8xpK77BIBvwS1r4ulMQuZUA1mGpZf+vNcPGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpl8KS9As1NDLm97kiFeu1IfxvwOid1I4+QFq2AkU2cPQli+YNstBvz0OPIUmCQkr
	 ybD4oqRTade84WAbIbdD1Thc0GWnIbGV/nyhfHBYDM6K0CiPg2Ha9S3YuMUb3Dke6m
	 8Pg5JuFMZ+gomLeoAzn0qxeY/azwbx3XIhwGF7DDDnURej080I6/b3HkUXfTyKJSlp
	 kqhF7C9RZbRZUXhHIdN8oc1xcfMd5B9CL5mUfoMiOWfkCXcERJddMRq94FIb6oTtc3
	 ZWhqQtuaDi3scWijkOQDfSS6ZW0ZQ4TypCtbF2Zw5rNuAhtHC4qcE4LibVdk4fPOJA
	 37dOlyB7OklDg==
Date: Tue, 25 Nov 2025 11:40:36 +0000
From: Will Deacon <will@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	rostedt@goodmis.org, Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 15/16] srcu: Optimize SRCU-fast-updown for arm64
Message-ID: <aSWVtDcuyuw4DlvZ@willie-the-truck>
References: <bb177afd-eea8-4a2a-9600-e36ada26a500@paulmck-laptop>
 <20251105203216.2701005-15-paulmck@kernel.org>
 <aQ9AoauJKLYeYvrn@willie-the-truck>
 <d53a5852-f84a-4dae-9bf4-312751880452@paulmck-laptop>
 <aRHLV8lLX0fxQICR@willie-the-truck>
 <ab6cd1c2-39c5-4b39-9585-6123835a6229@paulmck-laptop>
 <aSRX1HKNdks5pHsd@willie-the-truck>
 <c632fb32-dccb-4c61-9b2e-d0c2b55fb2e4@paulmck-laptop>
 <aSTgh8B0SiKz2t5c@pavilion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSTgh8B0SiKz2t5c@pavilion.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_034042_629465_4C9D051C 
X-CRM114-Status: GOOD (  16.05  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Nov 24, 2025 at 11:47:35PM +0100, Frederic Weisbecker wrote:
> Le Mon, Nov 24, 2025 at 09:20:25AM -0800, Paul E. McKenney a écrit :
> > On Mon, Nov 24, 2025 at 01:04:20PM +0000, Will Deacon wrote:
> > > It landed in Linus' tree here:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64?id=535fdfc5a228524552ee8810c9175e877e127c27
> > 
> > Again, thank you, and Breno has started backporting it for use in
> > our fleet.
> > 
> > > Please can you drop the SRCU change from -next? It still shows up in
> > > 20251121.
> > 
> > This one?
> > 
> > 11f748499236 ("srcu: Optimize SRCU-fast-updown for arm64")
> > 
> > if so, Frederic, could you please drop this commit?
> 
> Dropped, thanks!
> 
> (And I'm glad to do so given how error-prone it can be).

Thank you, both!

Will

