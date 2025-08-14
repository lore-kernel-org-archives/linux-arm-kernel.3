Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467C7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 05:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWt6BU4ydQcskePjM48WyIphi4bH1hWcoYxLwg8oThI=; b=Yd4OtO2oRhV38YPNYd2QL3JA9k
	dpmj93bulW8S09hbyYW+NL5MVQCLHCngWBQgSj6xczWK/EYAGO4ebCbRXHNmBzlnjZBsWigB0xBHQ
	qAFLE7HO6h7REP54M2wOEx/ruAwULAyPBoMqgCuxOUIwPAyV0XA5Q3C8b9ZCODcQ4UDK/TPfPLYYF
	iJa7jlwFnBQc+I6FObZrBWk6r257KvI54+20H5DhOa41aNt02HVHQIc76gxDRaF6kJ8XPB2y+1AWv
	viyK/K1ZfxuCKfEdEPU67PNoXTE6cY3WxqYF70cottED8h2j7cg3fzmIBNVEG1MR5u6Z4XT6wrbki
	YfMgmt+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQUc-0000000Fp1j-3dM2;
	Thu, 14 Aug 2025 05:27:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQS3-0000000Foun-2URe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 05:24:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75E861691;
	Wed, 13 Aug 2025 22:24:25 -0700 (PDT)
Received: from [10.163.65.190] (unknown [10.163.65.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 002643F63F;
	Wed, 13 Aug 2025 22:24:29 -0700 (PDT)
Message-ID: <c21e0636-ca68-4c56-893a-c31fa9de5e36@arm.com>
Date: Thu, 14 Aug 2025 10:54:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: sysreg: Fix and tidyup sysreg field definitions
To: Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
 broonie@kernel.org, oliver.upton@linux.dev, robh@kernel.org,
 james.morse@arm.com
References: <20250808123744.2087648-1-tabba@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250808123744.2087648-1-tabba@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_222435_678704_F385E870 
X-CRM114-Status: GOOD (  21.91  )
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

On 08/08/25 6:07 PM, Fuad Tabba wrote:
> Fix the value of ID_PFR1_EL1.Security NSACR_RFR to be 0b0010, as per
> DDI0601/2025-06, which wasn't correctly set when introduced in commit
> 1224308075f1 ("arm64/sysreg: Convert ID_PFR1_EL1 to automatic generation").

0b0010 checks out to be the value for NSACR_RFR in ID_PFR1_EL1.Security
sysreg field per ARM DDI 0487 L.b as well and the above mentioned commit
added the wrong value.

> 
> While at it, remove redundant definition of RCWSMASK_EL1, fix typos, and
> convert the only instance of spacing with spaces to tabs.
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
> Note that NSACR_RFR isn't used in the kernel as far as I could tell, so
> I didn't add a 'Fixes' tag.

Agreed - 'Fixes' tag is not required.

> 
> Based on Linux 6.16
> ---
>  arch/arm64/tools/sysreg | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 8a8cf6874298..475494d65306 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -31,7 +31,7 @@
>  # Mapping	<name_EL1>
>  # EndSysreg
>  
> -# Where multiple system regsiters are not VHE aliases but share a
> +# Where multiple system registers are not VHE aliases but share a
>  # common layout, a SysregFields block can be used to describe the
>  # shared layout:
>  
> @@ -54,7 +54,7 @@
>  #
>  # In general it is recommended that new enumeration items be named for the
>  # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
> -# item ACCDATA) though it may be more taseful to do something else.
> +# item ACCDATA) though it may be more tasteful to do something else.
>  
>  Sysreg	OSDTRRX_EL1	2	0	0	0	2
>  Res0	63:32
> @@ -377,8 +377,8 @@ Sysreg	SPMOVSCLR_EL0	2	3	9	12	3
>  Field	63:0	P
>  EndSysreg
>  
> -Sysreg	SPMZR_EL0       2	3	9	12	4
> -Field   63:0      P
> +Sysreg	SPMZR_EL0	2	3	9	12	4
> +Field   63:0	P
>  EndSysreg

Is this the only instance in the file with spaces instead of tabs ?

>  
>  Sysreg	SPMSELR_EL0	2	3	9	12	5
> @@ -474,7 +474,7 @@ EndEnum
>  Enum	7:4	Security
>  	0b0000	NI
>  	0b0001	EL3
> -	0b0001	NSACR_RFR
> +	0b0010	NSACR_RFR
>  EndEnum
>  UnsignedEnum	3:0	ProgMod
>  	0b0000	NI
> @@ -2441,10 +2441,6 @@ Sysreg	PFAR_EL12	3	5	6	0	5
>  Mapping	PFAR_EL1
>  EndSysreg
>  
> -Sysreg	RCWSMASK_EL1	3	0	13	0	3
> -Field	63:0	RCWSMASK
> -EndSysreg
> -

RCWSMASK_EL1 was redundant here.

>  Sysreg	SCTLR2_EL1      3	0	1	0	3
>  Res0    63:13
>  Field   12      CPTM0
> 
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
LTGM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

