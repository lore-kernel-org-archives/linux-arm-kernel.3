Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBBDCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHlqZ33kqSgxzclW+++/4fLBWPO+QKv12py5Kd89L3U=; b=SgCf8URzZ2/uo5Se9XU13T/Wdh
	u1LZcNubnL99NOexwXF4duKLFZiWskfOjHvgoIs4o9cSac8VUoJCMEWl7SygeYHE8lRPUAFuIwAFX
	yw9mHUGBqxoZ9+1mid23jO6l1sZ31J/+O/NUb257CmA4FNgLP96+G1VN0NE9EofoDa1yFmsO8vLdV
	fXuuvYA925jcsSdHP4uhX9UqF7P7VDpo5PygAMleBriFsAiMTsooYvQ1FGQu5J+t26ZGhfan9xh/J
	LHw6WRjMHDLrMcUVOjAItatRC3zISe2OxQNePNVJ7q7c7n2IaDmHPM6qyTUwEiiFPLZpQ0L6Vg4TR
	/9D8lbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWL0-000000082LP-0sm8;
	Tue, 16 Sep 2025 14:07:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWKx-000000082Ky-36fF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:07:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41CB712FC;
	Tue, 16 Sep 2025 07:07:06 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD6B43F673;
	Tue, 16 Sep 2025 07:07:11 -0700 (PDT)
Date: Tue, 16 Sep 2025 15:07:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 4/6] arm64: futex: refactor futex atomic
 operation
Message-ID: <aMlvDVfeztaVyOnL@J2N7QTR9R3.cambridge.arm.com>
References: <aMRQIeIdyiWVR8a0@arm.com>
 <aMfrR0vserl/hfZ3@e129823.arm.com>
 <aMhrscd1gz_syMtL@arm.com>
 <aMh4q4-xAPHnaOul@willie-the-truck>
 <aMkLb6jPiSbzeRWL@arm.com>
 <aMk1qxS3htyaTgEQ@e129823.arm.com>
 <aMlcf5oUNZU65u_I@J2N7QTR9R3.cambridge.arm.com>
 <aMllyaObyciHEEFX@e129823.arm.com>
 <aMlp_Covl57nnVoe@J2N7QTR9R3.cambridge.arm.com>
 <aMls+MSR33BRrCMA@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMls+MSR33BRrCMA@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_070715_815262_6859BA98 
X-CRM114-Status: GOOD (  17.57  )
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

On Tue, Sep 16, 2025 at 02:58:16PM +0100, Yeoreum Yun wrote:
> Hi Mark,
> 
> [...]
> > > I think it's enough to use usafe_get_user() instead of get_user() in here
> > > since when FEAT_LSUI enabled, it doeesn't need to call
> > > uaccess_ttbr0_enable()/disable().
> >
> > Regardless of uaccess_ttbr0_enable() and uaccess_ttbr0_disable()
> > specifically, API-wise unsafe_get_user() is only supposed to be called
> > between user_access_begin() and user_access_end(), and there's some
> > stuff we probably want to add there (e.g. might_fault(), which
> > unsafe_get_user() lacks today).
> >
> > Do we call those?
> 
> Yes when you're available.
> As you mention, the difference seems might_fault(),
> But I'm not sure whether that would be a reason to validate to use
> get_user() instead of unsafe_get_user() taking a increase of instruction
> of "nop" -- uaccess_ttbr0_enable()/disable() in LSUI
> except the reason for DEUBG purpose.

I think the practical impact of those NOPs is going to be neglible, and
not worth optimizing for unless/until we have data demonstrating
otherwise.

If we want to strictly avoid those NOPs, I think that we should do a
more general cleanup, and e.g. have variants of user_access_begin() and
user_access_end() that do not mess with TTBR0. I don't think we need to
do that for this series.

For now, I think that you should either:

* Use get_user().

* Use user_access_begin() .. user_access_end() wrapping both
  unsafe_get_user() and the user cmpxchg.

Thanks,
Mark.

