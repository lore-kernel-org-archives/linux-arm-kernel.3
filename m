Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725FFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5GdEv1gYkrutMa/9eRDoSEN3dnm0xb5aQFmw17wydw=; b=K+MWzQIb/FoeYY4PhxkxKXYpCo
	NmBTIjBjHhQPrzErgh7xrUvE6DNGw2/BlgZKcjF8usu2cCogphkHTdvVyUR9r0Oe4PBLaJhzzSBFz
	cPZ+J5ZvplTCRmRDkAjjNA4gDj6PTt2jvdR4BtM+e7Qbh1x6n88/U6YtPFXkrV3HqM8UO8tb5fmQ0
	xY2fvHI4ExtZqKteViJMCre4SYUCQwM5Ww5xkg3OU0M9AwUajbiAZNbRlvmXAs1xVaVL01Qvg+Inm
	UmK/1ixiSJyHpfKqwL/4TjXKun8zjwf9RFAn3S8rT21/NXckfZ0T9SJqdtehp9h60sF19KKVaiQz5
	nHEWJ/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weF26-0000000FEog-37wv;
	Mon, 29 Jun 2026 16:40:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weF24-0000000FEoK-3jnE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:40:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c9df229032so54095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782751228; x=1783356028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5GdEv1gYkrutMa/9eRDoSEN3dnm0xb5aQFmw17wydw=;
        b=oXfMvrHy/TaN6Bob9fuheVPMfdjHfKc9J3EB92thOIAMWML0DPb9M73ufkHg3BIODf
         iA66FYkxxF1Wit6I6MLS4lytsv4h7x2nuCs/0QmvLzpDiyFlrh1iyw+5NdK7ulNk9POq
         u2EIDBE6ffFbP9xTMK5EImWcm0GvL2udWDJpUMk6g/xYget7pHcO/JMhxdC6VuLNHRlv
         MhAfe1WhypGZ8ZSOyp8f78RtlYymfOwLj1IHyqaxo+iBd9chCIBewlSFYb2ecxDw9+cd
         /5G1y5v8541q4M/ymaSffTSnyrG7ss5DbpAG/LCzYcv3fL9lTG0NCH3y4ynU/UfiZT2K
         g4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751228; x=1783356028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5GdEv1gYkrutMa/9eRDoSEN3dnm0xb5aQFmw17wydw=;
        b=rjxEOy4r/fEcHUkf46W4Qi6oVSqsrCseT0a3Jg8sBIutq+8YVt04eeUeVXfp9N0xVz
         jYJ3VObyjGDkGH4HASooCIyS8aixC8kNxMO6wylylfcGngyIbsoJAZQYCzvMWmlo2rkF
         rIZTZG8U0bVlIBvStc5L48EtgsIspcq4PviO9lrG7M1yKiWCY/DPkGl5x7Sh2cS/F7XR
         A52nJmq3k0rMIsEozhmYJVxiObiBSBeDE8eYJJt3/VLuWQyXoK5Z47AewEussqu1xQyp
         +OjdYSTTdSxi9W9RkYMLjQwzuHREQ/giVbASoq1qdO4MtPawELNYrP4yLjioG0fZJGmj
         QyKA==
X-Forwarded-Encrypted: i=1; AHgh+RpKM2ioqL7VZDTVPFX3idHlX/fG3kkn3q0zG2n/Gb/+qOmwQRUDN0cNPqfttJSkQvPoVdrdIfZ00OmUNTuepUP8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3D7DyK21NbQvAs0OQG2bRsx4nBjhm5gdyv3bqBVlEswwWoAmu
	s09WezWGgsgpzNhoSirQnxZt6tgFVw1a50Uug0Hfyr6Gnq5HBqJjVaIanutn9l/MFA==
X-Gm-Gg: AfdE7cnZVe0TfLsPRDZpbivTS/gaLNi+DoVJuJEBDJnfp3zdrMUQ2UM1fLrKq+lSuLM
	pS50dFR/DT1tjivi90rofyRVd2UFDpAmkilNQxUdjBywu+XtQUkVjw+uxmgniJjxdSKBp2fzzc7
	GHx4OaCfdiTC53/uYcqk1+VKMqbMetmS1PEjxZ1mrMXGmTsjxAr2TpE7Me3KZsx9kIKU3GLuFqC
	QcfXPUYfYVH3YzJXPgaD4+4GQoprH1ibCIkXu7F5Tay9HaxldCE5jTAabPmVSd4v8UJMKwNVuQv
	mAv+uP3N/4Vbx7btg+7FugZRT0gVW4bSmfHaKbVEk8R3AC44NrLD8/z47i1JiB+5DHw5SOWN9+E
	t0rPkB2tYMaghGOazRwhHpOnGPta0fy0aRPoxu9Xb28sJTcWXH/+nhO46OUg4phsuAXiao9NhGd
	31lAy3PWDD9W6nstsY/bkdQGBrslO+JbFDBLCH6Uw06Ijybkg=
X-Received: by 2002:a17:903:1844:b0:2c7:f688:f22f with SMTP id d9443c01a7336-2ca2cff7977mr338545ad.13.1782751227357;
        Mon, 29 Jun 2026 09:40:27 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a00029d3sm35570b3a.20.2026.06.29.09.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:40:26 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:40:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v6 7/7] iommu/arm-smmu-v3: Detect
 ARM_SMMU_OPT_KDUMP_ADOPT in probe()
Message-ID: <akKf9S1TURJJq6em@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <8f43bbe920466359465f2083cfd09a15ee8e5ff1.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f43bbe920466359465f2083cfd09a15ee8e5ff1.1779265413.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_094028_956117_9594FB8E 
X-CRM114-Status: GOOD (  22.78  )
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

On Wed, May 20, 2026 at 10:03:24AM -0700, Nicolin Chen wrote:
> arm_smmu_device_hw_probe() runs before arm_smmu_init_structures(), so it's
> natural to decide whether the kdump kernel must adopt the crashed kernel's
> stream table.
> 
> Given that memremap is used to adopt the old stream table, set this option
> only on a coherent SMMU.
> 
> And make sure SMMU isn't in Service Failure Mode.
> 
> Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
> Cc: stable@vger.kernel.org # v6.12+
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 31 +++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 851bcebfdb3d4..fb34c3ffee9fe 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5353,6 +5353,33 @@ static void arm_smmu_get_httu(struct arm_smmu_device *smmu, u32 reg)
>  			  hw_features, fw_features);
>  }
>  
> +static void arm_smmu_device_hw_probe_kdump(struct arm_smmu_device *smmu)
> +{
> +	u32 gerror, gerrorn, active;
> +
> +	/* No adoption if SMMU is disabled (i.e., there is no in-flight DMA) */
> +	if (!(readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_SMMUEN))
> +		return;
> +
> +	/* For now, only support a coherent SMMU that works with MEMREMAP_WB */
> +	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY)) {
> +		dev_warn(smmu->dev,
> +			 "kdump: non-coherent SMMU unsupported; reset to block all DMAs\n");
> +		return;
> +	}

We seem to be checking it here right at the beginning, let's remove the
redundant checks downstream?

> +
> +	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
> +	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
> +	active = gerror ^ gerrorn;
> +	if (active & GERROR_SFM_ERR) {
> +		dev_warn(smmu->dev,
> +			 "kdump: SMMU in Service Failure Mode, must reset\n");
> +		return;
> +	}
> +
> +	smmu->options |= ARM_SMMU_OPT_KDUMP_ADOPT;
> +}
> +
>  static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  {
>  	u32 reg;
> @@ -5567,6 +5594,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  
>  	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
>  		 smmu->oas, smmu->features);
> +
> +	if (is_kdump_kernel())
> +		arm_smmu_device_hw_probe_kdump(smmu);
> +
>  	return 0;
>  }
  
Apart from that nit,

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

