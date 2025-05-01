Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219C3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHbWfxb7riN/WtroGUK+VXjEfthZmcusFJtNgqNin+w=; b=XcPxONsB0Z6RUeRjXUsk0NQt+s
	niPTjsQTxDJvBNDGC0nGXTPDGR50kSfNX+mK14RUo7bEQQN/7KCy70ZS5E/9rKsH5GbBmJ6NG1H44
	fh+V6OXwxihrf0DonAnaQaqc9rT2eveIWZ/ol1dTEqWulePGRRhtXAw3yrSU2KIhh8qFXdZqgPrnz
	j6HSPRivGDM7RyDcAO1nKhN72aB3lApXQ7hwfGqv9QxFY5QMNnoLBLOMAPNpluDgiZk4X6xUku73b
	Y41qt5uRVZH4UA1eDvgxgBra4HH1uP0ASJlZak5J4sA6ncR/8b50FhDjAL5HIZmZ5N2jyMoJB6TqI
	cwYoyVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQxa-0000000FAv9-1IXz;
	Thu, 01 May 2025 10:16:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQtL-0000000FAHD-2xT7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:11:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06365106F;
	Thu,  1 May 2025 03:11:33 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A25C13F673;
	Thu,  1 May 2025 03:11:38 -0700 (PDT)
Date: Thu, 1 May 2025 11:11:36 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 08/42] arm64: sysreg: Add registers trapped by
 HFG{R,W}TR2_EL2
Message-ID: <20250501101136.GE1859293@e124191.cambridge.arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-9-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426122836.3341523-9-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_031143_787506_D0438E55 
X-CRM114-Status: GOOD (  14.56  )
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

On Sat, Apr 26, 2025 at 01:28:02PM +0100, Marc Zyngier wrote:
> Bulk addition of all the system registers trapped by HFG{R,W}TR2_EL2.
> 
> The descriptions are extracted from the BSD-licenced JSON file part
> of the 2025-03 drop from ARM.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/tools/sysreg | 395 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 395 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 6433a3ebcef49..7969e632492bb 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2068,6 +2068,26 @@ Field	1	A
>  Field	0	M
>  EndSysreg
>  
> +Sysreg	SCTLR_EL12      3	5	1	0	0
> +Mapping	SCTLR_EL1
> +EndSysreg
> +
> +Sysreg	SCTLRALIAS_EL1  3	0	1	4	6
> +Mapping	SCTLR_EL1
> +EndSysreg
> +
> +Sysreg	ACTLR_EL1	3	0	1	0	1
> +Field   63:0    IMPDEF
> +EndSysreg
> +
> +Sysreg	ACTLR_EL12      3	5	1	0	1
> +Mapping	ACTLR_EL1
> +EndSysreg
> +
> +Sysreg	ACTLRALIAS_EL1  3	0	1	4	5
> +Mapping	ACTLR_EL1
> +EndSysreg
> +

Do you want to update CPACR_EL1 while you're at it, so that it matches
CPACRMASK_EL1?

>  Sysreg	CPACR_EL1	3	0	1	0	2
>  Res0	63:30
>  Field	29	E0POE
> @@ -2081,6 +2101,323 @@ Field	17:16	ZEN
>  Res0	15:0
>  EndSysreg
>  
> +Sysreg	CPACR_EL12      3	5	1	0	2
> +Mapping	CPACR_EL1
> +EndSysreg
> +
> +Sysreg	CPACRALIAS_EL1  3	0	1	4	4
> +Mapping	CPACR_EL1
> +EndSysreg
> +
> +Sysreg	ACTLRMASK_EL1	3	0	1	4	1
> +Field	63:0	IMPDEF
> +EndSysreg
> +
> +Sysreg	ACTLRMASK_EL12	3	5	1	4	1
> +Mapping	ACTLRMASK_EL1
> +EndSysreg
> +
> +Sysreg	CPACRMASK_EL1	3	0	1	4	2
> +Res0	63:32
> +Field	31	TCPAC
> +Field	30	TAM
> +Field	29	E0POE
> +Field	28	TTA
> +Res0	27:25	
> +Field	24	SMEN
> +Res0	23:21	
> +Field	20	FPEN
> +Res0	19:17	
> +Field	16	ZEN
> +Res0	15:0
> +EndSysreg
> +
> +Sysreg	CPACRMASK_EL12	3	5	1	4	2
> +Mapping CPACRMASK_EL1
> +EndSysreg
> +

[..]

Thanks,
Joey

