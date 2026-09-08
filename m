Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F89CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3NjIWFcEJdYq3DlGueiEK5h/c3x8imRp1UzNgnF9LE=; b=AsnQ+P9s6LrQn5PMx4Ip5O81um
	/5CvH52heZ6nPTEOZO1kJdDSM8lz00AW70lLCI6Dvhma6opH5ui8/KCoMMJ7NxUQB7PibD6Wijbr9
	gai+b+5DdOextEV9SOLF2VDWvIAyciG2S24cpEZhp49kmVNql3pQUZklA/HG9t2Jv1zIajHajdSu7
	Lpb0hQ9AqH2715CFKeLOi9lobUkOC/yaGk/kBUkpEv2stj9WMHgRORSA5wtKhnTQKx5W8rdg1BDE4
	otDNA56IpwcOXkxNLByhWb1lgKU8vG7OYyDiKYKGrQj//O4cemSjTQKk9Z9lOX9cjvwAAbehl1RWN
	oFh3MbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yXy-00000009cbr-3nR5;
	Tue, 08 Sep 2026 16:19:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yXx-00000009cbI-0TxV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:19:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 903C31476;
	Tue,  8 Sep 2026 09:19:40 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 806B63F7B4;
	Tue,  8 Sep 2026 09:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884384; bh=dR7gu87uNwDxeR+EZwq4z+4Id2o1CljMYJwUBZ26JdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKLA+kcpxksCOfvmdrVLpPFISwpSyiOLfwWXfXkZWOp0i7GgObZfbMEBxdGq5+bmM
	 b5On4nUY5nFQfZ8maY6lbag/3Quj5Masczbyo6SKQCFTByuvLdWVNvwXeA/2qD1GBh
	 /uVIQpTwW0V8APMeWVfbJlWnIXEew3lp6hPxKTyY=
Date: Tue, 8 Sep 2026 17:19:35 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	nd <nd@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"oupton@kernel.org" <oupton@kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: sysreg: Make write_sysreg_s() select XZR
 without optimisation
Message-ID: <aqA1l_86CGSeL_2B@J2N7QTR9R3>
References: <20260904174855.76185-1-sascha.bischoff@arm.com>
 <20260904174855.76185-2-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904174855.76185-2-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_091945_199288_0E052558 
X-CRM114-Status: GOOD (  20.36  )
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

On Fri, Sep 04, 2026 at 06:49:25PM +0100, Sascha Bischoff wrote:
> write_sysreg_s() tests whether its local __val variable is constant when
> deciding whether to use XZR. Compilers only recognise that __val was
> initialised with a constant zero after constant propagation.
> 
> With optimisation disabled, the fallback path therefore selects an
> arbitrary general-purpose register. This is incorrect for instructions
> such as GIC CDEOI, where Rt must be XZR rather than a register containing
> zero.

Which CONFIG_* option needs to be selected for that to happen?

I'm struggling to see how other usage of __builtin_constant_p() wouldn't
blow up in such a configuration, so knowing that would help to
investigate and test.

> Test the macro argument directly so that constant zero selects XZR
> regardless of the optimisation level.
> 
> Fixes: e9ad390a4812 ("arm64/sysreg: Fix GIC CDEOI instruction encoding")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/include/asm/sysreg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 7aa08d59d4944..a80bede50f865 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1204,7 +1204,7 @@
>  #define write_sysreg_s(v, r) do {					\
>  	u64 __val = (u64)(v);						\
>  	u32 __maybe_unused __check_r = (u32)(r);			\
> -	if (__builtin_constant_p(__val) && __val == 0)			\
> +	if (__builtin_constant_p(v) && (u64)(v) == 0)			\

It's not safe to use 'v' here, since 'v' could be an expression with
side-effects, and we must not evaluate it multiple times.

I think we should just enxcode the GIC instructions manually. While they
are SYS/SYSL instructions, they *aren't* MSR/MRS, and using
write_sysreg_s() is a hack.

Mark.

>  		asm volatile(__msr_s(r, "xzr"));			\
>  	else								\
>  		asm volatile(__msr_s(r, "%x0") : : "r" (__val));	\
> -- 
> 2.34.1

