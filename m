Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECEFC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d7vS40rYvw8brUay1AuwTlIijasoRsP5SIdJYiBzWo=; b=faYWg+o36u3xKr+C/0JGXStwNu
	0NpDH7mvr2I6drGX/Y3boafktPw8tIgX+zlAh1EwYeGXMH7Enf86ztitG3Ej/F3Wr/S/4NIQSRnJK
	iFn2ARIf5GoLElADOuSBeZlpSskAKeJ6vMGQzn7LwzzkTWrwDvtd+sKQakE5Q+sP0MRtlf1TYx9oG
	Izlx6tM9ch/grlD8ZVAp0tFW7cfJT9ILqwnFThzKaTVuEBY2FyvKjD6hlcJQR4dSIyEGmxQg6bev+
	0BEm9P+YeS3iDFiON6gqgYB737IDVMiOO5cBjUD3+6SPas1UPys5BdKjCNRTN4AC+o2O4UP+yFY+d
	8fKobFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8et-00000005Txm-19VN;
	Tue, 08 Jul 2025 13:46:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8Q6-00000005Rjv-1Sf3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:31:39 +0000
Date: Tue, 8 Jul 2025 15:31:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751981496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2d7vS40rYvw8brUay1AuwTlIijasoRsP5SIdJYiBzWo=;
	b=Jr/wD7/3Psk+yzcDAp/4R5LG0ULE94i7AcVzyGSyff9Vy6+U5bmz1Ph9CQbD2aLOsQRP8V
	cIsUs5KFjqwCu4xnR8/8ndfXNv1FJpdMjyN3A/v/LpsJ3ly7MlhIkIgfvlJqSVtwymwOag
	qpFJhD45yZ6COedK6GXUQFeDoafS/JRH+CYcB/Eho5J92ZN/vmfIKbxLb2/tG8r2c9TCgB
	zH+OQUs6/yfP117naULj7vXDca+mLegJj+SZgMc248K+6Df7/uEZu/9aRHki2ckJZJDTGo
	56ZWV59F+IeVjOegfNpEDMKSNEs7mPquGl8vRxUCv/ndVw4fTlY65O6pkD8xAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751981496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2d7vS40rYvw8brUay1AuwTlIijasoRsP5SIdJYiBzWo=;
	b=IaMKETVwMomUmbk9fwh5BMVICT0FHlGDBDsmfq4p+vckNb38q9zA2Nv5Qf4d3xF6BtsR/Y
	VKWJgi8/6Y3fEhAw==
From: Nam Cao <namcao@linutronix.de>
To: Will Deacon <will@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 17/22] arm64: mm: Add page fault trace points
Message-ID: <20250708133135.afWClD2E@linutronix.de>
References: <cover.1747649899.git.namcao@linutronix.de>
 <61063f55e2c2df6db69cb63eac9d6653f38fbfbd.1747649899.git.namcao@linutronix.de>
 <aG0aIKzxApp9j7X0@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG0aIKzxApp9j7X0@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_063138_524204_42D07C80 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 08, 2025 at 02:16:16PM +0100, Will Deacon wrote:
> As per the discussion with Steve on v6, I still object to relying on the
> arch code to call all these different trace helpers (rv, kprobes, perf)
> in the right place and consistently with each other.
> 
> In:
> 
> https://lore.kernel.org/r/20250519120837.794f6738@batman.local.home
> 
> Steve suggested wrapping some of this up in a core function to help with
> that.

I have dropped this one from my latest version, so that the series can move
forward while we figure this part out.

Best regards,
Nam

