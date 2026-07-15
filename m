Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11B3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m53R6Qi+zQcNj87e/Jawa3dfMVvzT1k6XowiuqLX1eY=; b=AQFZ9cTEcbPXVaL/gcWp6My65p
	E55TzNcDDR4DqW5asvQbKaYTdUgtXnLYJGtx6XSqSu6LH1Qrv2smImRsD1C/SQ4rhmXYIJE3LDnSe
	1AVAnmjn5NuXjpq3A2vhJd+9pZQ9qRIo9oBwMSHRSc56FTHexS+K7HQ9jCkjzuXJxGbD/frFpLb+f
	HjYx39sZg14a9X0Ic9Mn31tSQx80NYLX6me5h49hNc/nfbkRUPJZAcV6Lg6FPepfa1Wy0YZb61/64
	CDi76X/ujJ1lQvwz6uHMQTWoOwI1oOSUkjWsMr3G8jFHJhSuhXwB9X3Bor6xvoWwtblCgMz6eiIOb
	OBh5jxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5ge-0000000FpPd-1GkS;
	Wed, 15 Jul 2026 19:54:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5gc-0000000FpP7-1em3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:54:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cacef7d299so2055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784145270; x=1784750070; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m53R6Qi+zQcNj87e/Jawa3dfMVvzT1k6XowiuqLX1eY=;
        b=EwtkalUQm7VuR6sVW6yA27eVvOiXxcCy/UhSVLa/WYbiQH5iF+Fptri1cvHx5YmeeM
         NEXJ5M1nILhqpoooarEUHJL3MVdK6Y/dqlw7HetvN6sCXA6LVs6TtIkWhWzAjeLpfkaC
         lj72Dj9BZJuz6lnGHu0NYv04sGJDvHS+B13WoEWJTkIS6iKO02+7GBCFnCwl64tduoDR
         VHeYpZZa9NGbZZY4JtZnq44J1OTj2xrPSpC6vRYRqrgWEDRDKe4Ufy3GVz7vKuHW42St
         tx9CnsS3eg18gnguXpxca+ok+FFZXpHx3C619brRWEU+P99DB2LhNfAyKO0HdrP+tXJ2
         dyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784145270; x=1784750070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m53R6Qi+zQcNj87e/Jawa3dfMVvzT1k6XowiuqLX1eY=;
        b=gP2ehtq6xLXKIh1pqhQiCCYdxK766T+c9Oo8zAmjcX1Mxs2XtAfExzwfi1LrLofLyf
         McDZLzzpHGOGy2NbTWu3Kwgqulez+vso8qOiXk4m+9+Z7fwB/fbJMp5vvhcGtZGWUUD1
         ojf5DevS0DUPaBp9fsMprZi5hbWcv9JiHanH9e/5zpyxy6J06iyBsmxx/zqm6hsFuP56
         k9BYIZJ57HUVStw84a3I97yXWPCIf1LrwkQOrkoeSzwij1uKxpTEYs7hz9Zwk/NV7uso
         9ojzHpazJPqwxsJzljpds9VjIBZsPmTb7T1QEz3rMirQ7Y+Vf9q5sTHm0C6tdemfsHGi
         8O2g==
X-Forwarded-Encrypted: i=1; AHgh+RrzSeNvQdFcjqlorfl4g9KUpXyREziNfqB3e+Fma5a88ltBpveLUieIPtNBMZ4g1z9S84h9udxyWS45/O746R6p@lists.infradead.org
X-Gm-Message-State: AOJu0YwsmJNtEzvYhR2rJphxcGRU/lTUT8rz0RskfFqNQcD3/kse7zJP
	6y1l5MV2igfbDpFLcvU7/QDZL2L19BOf9Qk2Oz65l6c4jtOhVtHsXIhY0XvWNnHGaA==
X-Gm-Gg: AfdE7cnhMnF4D/m1o1x3hDypMlXSwr5jv1mcwZOnZB/ba8B4KjmSanWgrZxfr4o0rpR
	oeUCWtwEAlpV8u44Z+MZlaXkXWhzOmSEtTaqHvREZ/QXWkTtuj4/zHRzSO+MpvgGQfp1AjNJ/IC
	Q4ZsYRckJopRX+stGGJvIQezJp/uQTIdZ407w6JRhgci9C1rbZT5tFrq2LIqdfaAFhyAWLSUjK3
	tWRVP3Z7ACVI8D5LhIjm0QtCNkqpbn6fvQZaQLA3S+1wZsItH8uWRUejD2JwLQyFs53PfLi/m/+
	d1HndcPYJ3dsNpWJZc7a9hsc8imlck9G9rCge4pBtRT/ZWmbf+ArVfZV85h7D4OnjKtYFBnHu2y
	lwRUnVB1uYfMqthErQUBYr1V265DDV96cc06TvDZey7mW7gcu10y3ObEu/4kga72vc92X3EagPk
	od6ajUhiymOWZfO4LFX1wnuPgXbudGhW25lxFkwvBAVATWRCo=
X-Received: by 2002:a17:902:e804:b0:2ca:bf8e:360b with SMTP id d9443c01a7336-2cf1a93edebmr466595ad.9.1784145269137;
        Wed, 15 Jul 2026 12:54:29 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f271ddbsm3883142b3a.18.2026.07.15.12.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:54:27 -0700 (PDT)
Date: Wed, 15 Jul 2026 19:54:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] iommu/arm-smmu-v3-iommufd: Reject unsupported
 bits in invalidation commands
Message-ID: <alflbbClvEp_k6u-@google.com>
References: <cover.1784054606.git.nicolinc@nvidia.com>
 <5c70a336821e3cea176356470d94ff18329ff867.1784054606.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c70a336821e3cea176356470d94ff18329ff867.1784054606.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_125430_458060_32F38D1F 
X-CRM114-Status: GOOD (  22.59  )
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

On Tue, Jul 14, 2026 at 11:48:48AM -0700, Nicolin Chen wrote:
> The arm_vsmmu_cache_invalidate() op hands a guest's invalidation commands
> to the trusted main command queue after enforcing only the VMID or the SID,
> and passes the rest of the command through to the queue unchanged.
> 

[...]

> +
> +static int arm_vsmmu_validate_user_cmd(struct arm_vsmmu *vsmmu, u64 data[2])
> +{
> +	struct arm_smmu_device *smmu = vsmmu->smmu;
> +	u64 allowed[2] = { CMDQ_0_OP };
> +
> +	/* Collect the fields userspace is allowed to set for each opcode */
> +	switch (data[0] & CMDQ_0_OP) {
> +	case CMDQ_OP_TLBI_NH_VA:
> +		/* An SMMU with 8-bit ASIDs treats the upper 8 bits as RES0 */
> +		allowed[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID,
> +					 GENMASK(smmu->asid_bits - 1, 0));
> +		fallthrough;
> +	case CMDQ_OP_TLBI_NH_VAA:
> +		/* NUM/SCALE/TG/TTL are range fields gated on FEAT_RANGE_INV */
> +		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> +			if (arm_vsmmu_validate_range(smmu, data))
> +				return -EIO;
> +			allowed[0] |= CMDQ_TLBI_0_NUM | CMDQ_TLBI_0_SCALE;
> +			allowed[1] |= CMDQ_TLBI_1_TG | CMDQ_TLBI_1_TTL;
> +			/* SCALE bit 25 (values above 31) is RES0 without DS */
> +			if (!(smmu->features & ARM_SMMU_FEAT_DS))
> +				allowed[0] &= ~FIELD_PREP(CMDQ_TLBI_0_SCALE,
> +							  BIT(5));
> +		}
> +		allowed[0] |= CMDQ_TLBI_0_VMID;
> +		allowed[1] |= CMDQ_TLBI_1_LEAF | CMDQ_TLBI_1_VA_MASK;
> +		break;
> +	case CMDQ_OP_TLBI_NH_ASID:
> +		/* An SMMU with 8-bit ASIDs treats the upper 8 bits as RES0 */
> +		allowed[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID,
> +					 GENMASK(smmu->asid_bits - 1, 0));
> +		fallthrough;
> +	case CMDQ_OP_TLBI_NH_ALL:
> +		allowed[0] |= CMDQ_TLBI_0_VMID;
> +		break;
> +	case CMDQ_OP_ATC_INV:
> +		/* ATC_INV is illegal unless the SMMU implements ATS */
> +		if (!(smmu->features & ARM_SMMU_FEAT_ATS))
> +			return -EIO;
> +		/* A Size above 52 (invalidate-all) may raise a CERROR_ILL */
> +		if (FIELD_GET(CMDQ_ATC_1_SIZE, data[1]) > ATC_INV_SIZE_ALL)
> +			return -EIO;
> +		/*
> +		 * SSV/SSID/Global need substream support. SSID and Global are
> +		 * IGNORED (not RES0) when SSV == 0, so they need no SSV check.
> +		 */
> +		if (smmu->ssid_bits)
> +			allowed[0] |= CMDQ_0_SSV | CMDQ_ATC_0_SSID |
> +				      CMDQ_ATC_0_GLOBAL;
> +		allowed[0] |= CMDQ_ATC_0_SID;
> +		allowed[1] |= CMDQ_ATC_1_SIZE | CMDQ_ATC_1_ADDR_MASK;
> +		break;
> +	case CMDQ_OP_CFGI_CD:
> +		/* No SSV for CFGI_CD; SSID requires substream support */
> +		if (smmu->ssid_bits)
> +			allowed[0] |= CMDQ_CFGI_0_SSID;
> +		allowed[1] |= CMDQ_CFGI_1_LEAF;
> +		fallthrough;
> +	case CMDQ_OP_CFGI_CD_ALL:
> +		allowed[0] |= CMDQ_CFGI_0_SID;
> +		break;

Nit: Although, the convert_user_cmd would check the CMDQ_OP again, it
seems like validate_user_cmd would return 0 for an unsupported cmd that
doesn't match any of the above cases, should we add a default case and
return -EIO there?

> +	}
> +
> +	/*
> +	 * Reject any other bit, e.g. a RES0 bit or a Secure bit, before the
> +	 * command reaches the trusted main cmdq, so a guest cannot wedge the
> +	 * shared queue for every device with a CERROR_ILL.
> +	 *
> +	 * By contrast, an out-of-range address or ID value does not need a
> +	 * check: the spec defines it as CONSTRAINED UNPREDICTABLE, which is
> +	 * scoped to the guest itself and does not raise a CERROR_ILL.
> +	 */
> +	if ((data[0] & ~allowed[0]) || (data[1] & ~allowed[1]))
> +		return -EIO;
> +	return 0;
> +}
> +

Apart from that,
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

