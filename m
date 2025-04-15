Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13E9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9c/jqs0ImTq23JWKqJ6pgYTsopt6CaO9c3noHLUB4W0=; b=KMV+JRj8uGdD5ueLZ6hQR675TS
	XrVVOs2OQGBd+185BXQ3oqXJb9JOKsDO2ekZu7MazUua5fJStqMulaWBTj7EZqwK07fbbrf8+hmiQ
	pTRdHZMj3abzUy+zOK7W0SSPrLlomJRmpmLaU/dFdcj/iDQX0Np5qTN1dz130WmtU5gQjDIbw5Tu6
	xIrmt6/eIdZauORvXwkWCNmMuTqvg/HOALZsoCM3pKNeUg2LUoZLtyatQzyNKTcsLzl+q/N20c2IM
	ETirBkWFQ/MKXyoRkZonn1pK3ieWyColHnkCONh7rGC2PQNrPwsn60Eqo6u7hBePx5jo0jzDBOARg
	OACxVYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k2E-00000006YfH-2nVe;
	Tue, 15 Apr 2025 17:25:22 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jkX-00000006Vmc-3GJ1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:07:07 +0000
Date: Tue, 15 Apr 2025 10:06:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744736821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9c/jqs0ImTq23JWKqJ6pgYTsopt6CaO9c3noHLUB4W0=;
	b=t1kNm8gOBoKSdP89u+A7EqbQrPcqmy3FSsr20RSggxMlDMceadc1SOwc3wxueBIeHEFgQb
	1pUp4ktDIRycIBlsGuHyc8X+c29lVHjM5bUsiHKMcq4dLuWV4X6GDZqkFS1n7vHKBz90y7
	+HXBR0DmYT9IVl99GPClah6fjMSTe9c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Message-ID: <Z_6SKjdvje1Lpeo3@linux.dev>
References: <20250415154711.1698544-1-scott@os.amperecomputing.com>
 <20250415154711.1698544-2-scott@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415154711.1698544-2-scott@os.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_100706_021361_FEF56118 
X-CRM114-Status: GOOD (  20.79  )
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

Hi,

On Tue, Apr 15, 2025 at 08:47:11AM -0700, D Scott Phillips wrote:
> Updates to HCR_EL2 can rarely corrupt simultaneous translations from
> either earlier translations (back to the previous dsb) or later
> translations (up to the next isb). Put a dsb before and isb after writes
> to HCR_EL2.
> 
> Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
> ---
>  arch/arm64/Kconfig              | 13 +++++++++++++
>  arch/arm64/include/asm/sysreg.h |  7 +++++++
>  arch/arm64/kernel/cpu_errata.c  | 14 ++++++++++++++
>  arch/arm64/tools/cpucaps        |  1 +
>  4 files changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e5fd87446a3b8..2a2e1c8de6a16 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -481,6 +481,19 @@ config AMPERE_ERRATUM_AC03_CPU_38
>  
>  	  If unsure, say Y.
>  
> +config AMPERE_ERRATUM_AC04_CPU_23
> +        bool "AmpereOne: AC04_CPU_23:  Failure to synchronize writes to HCR_EL2 may corrupt address translations."
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around Ampere
> +	  errata AC04_CPU_23 on AmpereOne.
> +
> +	  Updates to HCR_EL2 can rarely corrupt simultaneous translations from
> +	  either earlier translations (back to the previous dsb) or later
> +	  translations (up to the next isb).
> +
> +	  If unsure, say Y.
> +
>  config ARM64_WORKAROUND_CLEAN_CACHE
>  	bool
>  
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index e7781f7e7f7a7..253de5bc68834 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1142,6 +1142,10 @@
>  	(IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC03_CPU_36) &&	\
>  	 __sysreg_is_hcr_el2(r) &&				\
>  	 alternative_has_cap_unlikely(ARM64_WORKAROUND_AMPERE_AC03_CPU_36))
> +#define __hcr_el2_ac04_cpu_23(r)				\
> +	(IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC04_CPU_23) &&	\
> +	 __sysreg_is_hcr_el2(r) &&				\
> +	 alternative_has_cap_unlikely(ARM64_WORKAROUND_AMPERE_AC04_CPU_23))
>  
>  /*
>   * The "Z" constraint normally means a zero immediate, but when combined with
> @@ -1154,6 +1158,9 @@
>  		asm volatile("mrs %0, daif; msr daifset, #0xf;"	\
>  			     "msr hcr_el2, %x1; msr daif, %0"	\
>  		: "=&r"(__daif) : "rZ" (__val));		\
> +	} else if (__hcr_el2_ac04_cpu_23(r)) {			\
> +		asm volatile("dsb nsh; msr hcr_el2, %x0; isb"	\
> +			     : : "rZ" (__val));			\

At least from your erratum description it isn't clear to me that this
eliminates the problem and only narrows the window of opportunity.
Couldn't the implementation speculatively fetch translations with an
unsynchronized HCR up to the ISB? Do we know what translation regimes
are affected by the erratum?

Thanks,
Oliver

