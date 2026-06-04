Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B676CD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 16:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9orPrlUBfpDOI7jIo4bTJeWXXTVxhyM5Awxa0kulX4U=; b=P+Zw15nLYrd5OjlAb4qeUypA5s
	a000pehFGwssNNwr1eoKFZFm3qm7//LkzkJyykDhOkrU8Ws0/P32tuxsEq8gheJKpzFaq751bPsod
	XfwokrA7GQojdIXPU0iA8PRUIsQF5Bo1mL0e8z3ikPoNXYXmaIPfrQZLjx8lfQ1onmVFZT8opRgSm
	f+9OZ6dZWaZZWxY3oiy4hL9OmYXOlbaa2Ew8atykE2+NGUpQ6w5yKu8TH1BSoTyidGprH9vh98FdC
	107/sP2FG4zRYEH60E7SSUXbXc7WXnUi65kMDfW0fvSNe+rrernihgWQedG6xPZ3OHnxgMciW/oYS
	q5KlEgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBGy-0000000H6aX-2l1D;
	Thu, 04 Jun 2026 16:50:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVBGu-0000000H6Zj-3Wgk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 16:50:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B09104973;
	Thu,  4 Jun 2026 09:50:14 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69B6A3F7D8;
	Thu,  4 Jun 2026 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780591819; bh=38JUf3SZ3VZqsjB6ynqgMt4h1xyvY4kOLChEDF6u4d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9dQ6haN/Phb4x7EJ9nXX4Ifq3IDaQ6kHbMraTI54HI8i1ea/p2XV+NUMIvr4+DsI
	 kV8Cwns9sWiYe2i+9JVDFs5JS4LLzzfPD/NLHnfYe88SopVvS5wDynFR6tg9lnoIWl
	 F9TIr62X0u7ngaCkrZ3JjstbwZ3B11i9jkTU+d1E=
Date: Thu, 4 Jun 2026 17:50:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 4/5] KVM: arm64: Omit tag sync on stage-2 mappings of
 the zero page
Message-ID: <aiGsx2Ls676t7-iJ@arm.com>
References: <20260604151151.150377-7-ardb+git@google.com>
 <20260604151151.150377-11-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604151151.150377-11-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_095021_611749_C309DB4D 
X-CRM114-Status: GOOD (  10.94  )
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

On Thu, Jun 04, 2026 at 05:11:56PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Commit
> 
>    f620d66af316 ("arm64: mte: Do not flag the zero page as PG_mte_tagged")
> 
> removed the PG_mte_tagged flag from the zero page, but missed a KVM code
> path that may set this flag on the zero page when it is used in a
> stage-2 CoW mapping of anonymous memory.
> 
> So disregard the zero page explicitly in sanitise_mte_tags().
> 
> Fixes: f620d66af316 ("arm64: mte: Do not flag the zero page as PG_mte_tagged")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

