Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE48C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZlxHE/PMbbkteqFpAZs5FG6AXCNdqDMrVPzocoft9A=; b=BoZsgXYqCZ153LLul+fkixdeD+
	KTH9cTHmH+MBxPY0W2JAfufmBZxQNsPGGkI5bpRojD1vy4+S2lF0717Mx38ma/r+R8pZVSq4Ueab+
	8BkNwrmBuknBbOWbjXxGd6xGaqAWFB/g8PwygzGCCxF4/7J++42V8pdq8MHZ2hfKcF6WBhGMdIwSh
	gkKqZ9ZMy733IrunfR+RiwhHN2TOiSIEZl3c4vwd1wz/CPfcMXWMdmzktCi75B0zDWJSAfhcf1QHx
	tz1HJGr45JdF2lGRZlTzML3sBdsC/IqHz4E05fX6DsOTA18LPs3TpFj1M8L7axvrdVDIVA2diL/af
	YoGc3RpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kD2-00000006aoS-0Jfh;
	Tue, 15 Apr 2025 17:36:32 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jpr-00000006Whq-1MCW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:12:36 +0000
Date: Tue, 15 Apr 2025 10:12:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744737152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UZlxHE/PMbbkteqFpAZs5FG6AXCNdqDMrVPzocoft9A=;
	b=YJA0Hd6969e9muOdARDfAIzNX7YV3lzqLiQMrcIJ8oQO07vov55VixBq+G81cQHzPMegxs
	ZNg3GYzIgyjlqElFtCeT4NvRCuQLlou5VjBsntXSdZNvroYfj67Z2D+68kazZahR19ZZxG
	TGhqLOI/EM0wX2e4tL9beWLl4ZEDSdw=
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
Subject: Re: [PATCH 1/2] arm64: errata: Work around AmpereOne's erratum
 AC03_CPU_36
Message-ID: <Z_6Te1TjMqyXChvQ@linux.dev>
References: <20250415154711.1698544-1-scott@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415154711.1698544-1-scott@os.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_101235_499945_6375622F 
X-CRM114-Status: GOOD (  20.60  )
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

On Tue, Apr 15, 2025 at 08:47:10AM -0700, D Scott Phillips wrote:
> AC03_CPU_36 can cause asynchronous exceptions to be routed to the wrong
> exception level if an async exception coincides with an update to the
> controls for the target exception level in HCR_EL2. On affected
> machines, always do writes to HCR_EL2 with async exceptions blocked.
> 
> Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
> ---
>  arch/arm64/Kconfig              | 17 +++++++++++++++++
>  arch/arm64/include/asm/sysreg.h | 18 ++++++++++++++++--
>  arch/arm64/kernel/cpu_errata.c  | 14 ++++++++++++++
>  arch/arm64/tools/cpucaps        |  1 +
>  4 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a182295e6f08b..e5fd87446a3b8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -445,6 +445,23 @@ menu "Kernel Features"
>  
>  menu "ARM errata workarounds via the alternatives framework"
>  
> +config AMPERE_ERRATUM_AC03_CPU_36
> +        bool "AmpereOne: AC03_CPU_36: CPU can take an invalid exception, if an asynchronous exception to EL2 occurs while EL2 software is changing the EL2 exception controls."
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around Ampere
> +	  errata AC03_CPU_36 on AmpereOne.
> +
> +	  If an async exception happens at the same time as an update to the
> +	  controls for the target EL for async exceptions, an exception can be
> +	  delivered to the wrong EL. For example, an EL may be routed from EL2
> +	  to EL1.
> +
> +	  The workaround masks all asynchronous exception types when writing
> +	  to HCR_EL2.
> +
> +	  If unsure, say Y.
> +
>  config AMPERE_ERRATUM_AC03_CPU_38
>          bool "AmpereOne: AC03_CPU_38: Certain bits in the Virtualization Translation Control Register and Translation Control Registers do not follow RES0 semantics"
>  	default y
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 2639d3633073d..e7781f7e7f7a7 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1136,14 +1136,28 @@
>  	__val;							\
>  })
>  
> +#define __sysreg_is_hcr_el2(r)					\
> +	(__builtin_strcmp("hcr_el2", __stringify(r)) == 0)

This looks fragile. What about:

	write_sysreg(hcr, HCR_EL2);

or:

	write_sysreg_s(hcr, SYS_HCR_EL2);


Thanks,
Oliver

