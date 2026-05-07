Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582F7CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1NONxnec+n06CLcBCODwxosB4SRQUb5g6JkJE9QSFI=; b=dlPnZuASfkGzaoOTGO3iE+qIBX
	0YU42TvYztzWk8lHOrbydtK7UjAi9qU5qeveVzDcb0kvD4vGMJWTeb39CT0t+wiThTARV18vQFfN9
	6mEjiUMROHBzX4jEeynQvi4hBdQCUIFDk4/Ejm45LzeS7qXep+pLUOQa5RNyNSyEwN1VFF2RPMQVh
	i0aFRBGucn1x0X0yA1mwBtXWwqbG68ygC9jc/xZQ55kuKC5CiwxcSX3o64LDZHiBhJMZa0M5HFP1g
	VKxxukc2/zGyLxG3hW6YVphHzYGUkiq6A/MHIIJRy5X6d5vPBSp//jQSPK4GrP1y3/zYn1A/z7kOj
	uVcWuMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKutA-00000003J1L-2vFO;
	Thu, 07 May 2026 09:19:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKut9-00000003J0K-0HwU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:19:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso72985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145560; x=1778750360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1NONxnec+n06CLcBCODwxosB4SRQUb5g6JkJE9QSFI=;
        b=kBRrnmaQRpFKq864kBv27F4Tf2eMSYXPeD0GP3BHOEFVNCdFoTnReYxQha+Uk1xKu/
         yw+UUJzfzydss2FwW0YiaKXFoRYYbm7SY3SrowJbE4q7O24vy1BYVkUhm9xTlongId7v
         nN/RybJplyPHkLeg+niPzdwmzGMztcKiaZAaq/qx3vzD9gtsLWVfGPjNQAsuSFG0Ez03
         GJhbjUwqWLMMpoYXBNvFFescF3za+ydI3zkJ6WE6ypuBDPNn332NZRbGDtYAzvA8BXq2
         E7ve8cB8NVCZrsz65KQikx2FYETpzJ4mdgpJ73gIcVXjAYqGXOL52sjmM09MJu2Iw5i9
         qOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145560; x=1778750360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1NONxnec+n06CLcBCODwxosB4SRQUb5g6JkJE9QSFI=;
        b=Eha3touuqAMAzF1/Q3KCgmr/BIl858E0tSi7HLF+/P7xDnibW+G1DSkGCLk120tWGq
         U4zCSHYNCcEXHJrlGIlb1lT9KNL0cgepO5O0Gh1EeKc2xPf3piKz63/e0JFzoSzierg7
         kHVyrrELW8XqyLhz5JvfEesRb+w22t+N9XQSmZbmZ3UNDUTRZyW4WSk8bx29OxVkgGkg
         qtyakMJzO5VZ5fXOX4V+oIpHXQn43YK1SxBsa33KJWfFTt/cRwYl9Gnh4IlftzIT03tZ
         hld+/54WdA6Wy5x7vsPIai79ZCjh+erwANsEKgPGLM23JosZSjaoR8RG/GZZQngGmAR9
         aBjg==
X-Forwarded-Encrypted: i=1; AFNElJ+U0RPAI7S++ckeNmlsNoigxwuxNFXAPNCOZcWHiu5yCxQEo69nGKJdPWa8CWSYed/4x2FpTEkahFED+RWla8S6@lists.infradead.org
X-Gm-Message-State: AOJu0YxWXC7mehf20RFSjHK89ege6Ayw1vuNntn+ex3LswSe8LNK2n0A
	N01uE7GkU3q2iSRhWo2jmwebqwLUMJ5PMVSaD2g1PgbyE+sMs8tCTagA1d3FqieJgg==
X-Gm-Gg: AeBDietWQTVfg2H1ybgtLPPk+Dqb1XQBVcHeSozqhXTTWwICPCJx/TzwF27ve8+YldV
	bJaXzfok820UkubUN7m7x2wlp83qr8Mn88lmKB3FZKX23rkNwTfPDrdO+v4xiy+mgfnWM45Atr6
	0wmybR6mEA9vP4Q2IpqgRBoTnoG9avEDuZzZWuCppqYNwbKqLkAIjbpCBJcLaW2+FuteVVDApcs
	UhPg20sQ1zPfmTO4Yd3v6sEZnqA0SI80qqqF7uG33tB7KAioMRKBD2nx2rMyvAuTl9IbLvQJRWG
	ae25T0qYEd1EHRG3GOlkK82aiVSlhMiMxa/T2reaoLOFLJ/3ECqYP+S7nSCVKgLjGs4oHOh9eD4
	+xh2DvM7txAGVyD6dye5dzAadi6u36VZJgldIpV81Y+3w91ZLiCOyVqcsigCxSCudL4kYUPpRHI
	yLQVJaxLKLABR4dIOjU2TiAVEr9cDk8YH+ch5/c4Yyu69sn9sokm89cJK3lcU0kdUD8+KcfM0Zk
	pnSsIMKTPTz8dxf
X-Received: by 2002:a05:600d:844a:10b0:48a:5d95:d33e with SMTP id 5b1f17b1804b1-48e5d45d196mr626835e9.6.1778145559566;
        Thu, 07 May 2026 02:19:19 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-450524831cdsm20663750f8f.5.2026.05.07.02.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:19:18 -0700 (PDT)
Date: Thu, 7 May 2026 09:19:14 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 1/9] iommu/arm-smmu-v3: Add struct arm_smmu_cmd to
 represent the HW format command
Message-ID: <afxZEgun2BjHJ-WJ@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_021923_134540_73D3BCAA 
X-CRM114-Status: GOOD (  22.93  )
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

On Fri, May 01, 2026 at 11:29:10AM -0300, Jason Gunthorpe wrote:
> Like STE/CD, add a wrapper struct around the u64 array to represent the
> already FIELD_PREP'd command data. Unlike the STE/CD this is a u64
> because the command submission path will have the swap to le64.
> 
> This makes the API clearer when a u64 is referring to a formatted
> command and makes the following changes easier to follow.
> 
> Move the command constants out of the struct and into an enum alongside
> the rest of the constants defining the HW format so the entire HW format
> is self contained and independent of struct arm_smmu_cmdq_ent.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 48 ++++++++++++---------
>  1 file changed, 28 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index ef42df4753ec4d..092179f689e9f1 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -390,6 +390,10 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
>  
>  #define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
>  
> +struct arm_smmu_cmd {
> +	u64 data[CMDQ_ENT_DWORDS];
> +};
> +
>  /*
>   * This is used to size the command queue and therefore must be at least
>   * BITS_PER_LONG so that the valid_map works correctly (it relies on the
> @@ -426,6 +430,8 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
>  #define CMDQ_ATC_1_SIZE			GENMASK_ULL(5, 0)
>  #define CMDQ_ATC_1_ADDR_MASK		GENMASK_ULL(63, 12)
>  
> +#define ATC_INV_SIZE_ALL 52
> +
>  #define CMDQ_PRI_0_SSID			GENMASK_ULL(31, 12)
>  #define CMDQ_PRI_0_SID			GENMASK_ULL(63, 32)
>  #define CMDQ_PRI_1_GRPID		GENMASK_ULL(8, 0)
> @@ -447,6 +453,28 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
>  #define CMDQ_SYNC_0_MSIDATA		GENMASK_ULL(63, 32)
>  #define CMDQ_SYNC_1_MSIADDR_MASK	GENMASK_ULL(51, 2)
>  
> +enum arm_smmu_cmdq_opcode {
> +	CMDQ_OP_PREFETCH_CFG = 0x1,
> +	CMDQ_OP_CFGI_STE = 0x3,
> +	CMDQ_OP_CFGI_ALL = 0x4,
> +	CMDQ_OP_CFGI_CD = 0x5,
> +	CMDQ_OP_CFGI_CD_ALL = 0x6,
> +	CMDQ_OP_TLBI_NH_ALL = 0x10,
> +	CMDQ_OP_TLBI_NH_ASID = 0x11,
> +	CMDQ_OP_TLBI_NH_VA = 0x12,
> +	CMDQ_OP_TLBI_NH_VAA = 0x13,
> +	CMDQ_OP_TLBI_EL2_ALL = 0x20,
> +	CMDQ_OP_TLBI_EL2_ASID = 0x21,
> +	CMDQ_OP_TLBI_EL2_VA = 0x22,
> +	CMDQ_OP_TLBI_S12_VMALL = 0x28,
> +	CMDQ_OP_TLBI_S2_IPA = 0x2a,
> +	CMDQ_OP_TLBI_NSNH_ALL = 0x30,
> +	CMDQ_OP_ATC_INV = 0x40,
> +	CMDQ_OP_PRI_RESP = 0x41,
> +	CMDQ_OP_RESUME = 0x44,
> +	CMDQ_OP_CMD_SYNC = 0x46,
> +};
> +
>  /* Event queue */
>  #define EVTQ_ENT_SZ_SHIFT		5
>  #define EVTQ_ENT_DWORDS			((1 << EVTQ_ENT_SZ_SHIFT) >> 3)
> @@ -520,15 +548,10 @@ struct arm_smmu_cmdq_ent {
>  
>  	/* Command-specific fields */
>  	union {
> -		#define CMDQ_OP_PREFETCH_CFG	0x1
>  		struct {
>  			u32			sid;
>  		} prefetch;
>  
> -		#define CMDQ_OP_CFGI_STE	0x3
> -		#define CMDQ_OP_CFGI_ALL	0x4
> -		#define CMDQ_OP_CFGI_CD		0x5
> -		#define CMDQ_OP_CFGI_CD_ALL	0x6
>  		struct {
>  			u32			sid;
>  			u32			ssid;
> @@ -538,16 +561,6 @@ struct arm_smmu_cmdq_ent {
>  			};
>  		} cfgi;
>  
> -		#define CMDQ_OP_TLBI_NH_ALL     0x10
> -		#define CMDQ_OP_TLBI_NH_ASID	0x11
> -		#define CMDQ_OP_TLBI_NH_VA	0x12
> -		#define CMDQ_OP_TLBI_NH_VAA	0x13
> -		#define CMDQ_OP_TLBI_EL2_ALL	0x20
> -		#define CMDQ_OP_TLBI_EL2_ASID	0x21
> -		#define CMDQ_OP_TLBI_EL2_VA	0x22
> -		#define CMDQ_OP_TLBI_S12_VMALL	0x28
> -		#define CMDQ_OP_TLBI_S2_IPA	0x2a
> -		#define CMDQ_OP_TLBI_NSNH_ALL	0x30
>  		struct {
>  			u8			num;
>  			u8			scale;
> @@ -559,8 +572,6 @@ struct arm_smmu_cmdq_ent {
>  			u64			addr;
>  		} tlbi;
>  
> -		#define CMDQ_OP_ATC_INV		0x40
> -		#define ATC_INV_SIZE_ALL	52
>  		struct {
>  			u32			sid;
>  			u32			ssid;
> @@ -569,7 +580,6 @@ struct arm_smmu_cmdq_ent {
>  			bool			global;
>  		} atc;
>  
> -		#define CMDQ_OP_PRI_RESP	0x41
>  		struct {
>  			u32			sid;
>  			u32			ssid;
> @@ -577,14 +587,12 @@ struct arm_smmu_cmdq_ent {
>  			enum pri_resp		resp;
>  		} pri;
>  
> -		#define CMDQ_OP_RESUME		0x44
>  		struct {
>  			u32			sid;
>  			u16			stag;
>  			u8			resp;
>  		} resume;
>  
> -		#define CMDQ_OP_CMD_SYNC	0x46
>  		struct {
>  			u64			msiaddr;
>  		} sync;
> -- 
> 2.43.0
> 

