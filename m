Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364ADF46122
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmvoSlI6zhEDXgvnhN85AXx/F1wuELhxcozcM5H9OTc=; b=Gc8jS4w19Gaa4E
	NalwxMRs6JdV5xVZLi/4AyUNDbyesMS950k5a/hrr458Bd5i1ysVSkygtpGEh4Ecd3VTS9gCBECUx
	NGUpPI5LhBAoPGLpZQrPj8/mdV0lFE4WPa1TsD/ge+zySYaX0v+nbEtURRnrgx8K8RMQEMNzvp0Le
	6PaJ/5f7ZuLKy1/UaEMXvmSW4zHTKv2b0JaYH0/aqwVjrvzuxlRqesxkIjEqJbxHthcSMR7GaoqEk
	CA5uKtbXoi4PsWRDUZab1Vq7Tjqxcm+648AQ85mzKnLs44gUZ6jEdtQLAVT5Z2sBfrx44EuXaMtCK
	Bv/Mr7Ny09v3AyVw3hMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fsd-0000000GtUb-2njf;
	Mon, 23 Mar 2026 14:03:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fsb-0000000GtTx-1D31
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774274620;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmvoSlI6zhEDXgvnhN85AXx/F1wuELhxcozcM5H9OTc=;
	b=gNuPcMcn6B+awu2yUConfjfyprRynsz99muhxqPLDQ/icwqY0zIGWpaXSitsO7jCEr8o+X
	6MV1JB+vzcI1pQfszGxp51uKlxyy5mRp7fgJ+dvRzvpeO0g21m7SAIrBJbrltTGbsuPIzB
	fO0oUEoM+ElZ5i/S4zzwzB7nPxTvoJE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-Tfk0LkFBMtKvn1PtgzqfDA-1; Mon, 23 Mar 2026 10:03:36 -0400
X-MC-Unique: Tfk0LkFBMtKvn1PtgzqfDA-1
X-Mimecast-MFC-AGG-ID: Tfk0LkFBMtKvn1PtgzqfDA_1774274615
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439a85832c0so154846f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 07:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274615; x=1774879415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmvoSlI6zhEDXgvnhN85AXx/F1wuELhxcozcM5H9OTc=;
        b=hleETd1LJXHuhpDG9+AFroy/w9EK345VrGf2HbqCfWwJByn8O3rn11IhvkBVtFIUiW
         54oTSiivKqAywgztLz3lbrGR40Zr136HpM7VL7NPuVkfGgtHRp+TshRWiz+UGPHIDgYY
         +V6R+tcHGfbJsRKsJqEGdpjW980gILHb+AWh8sGm+Ss9pOZhdpJyfsq2M23OSBoCroBc
         0Kb9U4EZrHECCA1SRW5UmEuXiqWGh2CetwqNBnOEcmFv59uO2pC0i0inVp0YczTRoF/z
         CFDx0eYwHWUaFXCXreLNgWnSmNgs3I1M1Nhqw1c/JKt1qaJcycikHBW0xUtB0LWzmQgQ
         vgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXp9Y/A3vG24B3FNWE196jmfh3iEofh1ni/Z+2wevJ8hahcilrMSS8ByoZFrupEioUkrNLnPqpK3j2+xbUZpOX@lists.infradead.org
X-Gm-Message-State: AOJu0YwjAU905QPCFbSo7SMCTW+8CxUHVWXoqNmoC4bPWfxOrKISZaLH
	Pa2heYyV6yIt+IVNz9rayATq/GbZ1r2L3HgV1kFBfJNfHhsni8pGwzqDFyNoPuyuRIhpxTdlxoF
	cagwL9CaMgd15BMLrwnD3PX3WE/v6Jiw+x5WESeAq9IV2XhhXLV31M/dhCtWVtQtcDhN+Njx2YL
	MK
X-Gm-Gg: ATEYQzx6NWy1yR3ldMGfxSHMi/e3AQAW69DJlmjT9hUoIImWM1hOPJlEnWBuuh0ZOY7
	bzbruWl/rDbIg9vz91BDYskww/3RoB/qrGqHggZnv28ionS235ZFTsG3GB6tGf5LYQg2llyMro4
	HyS31yscJ/yhVGqRFkMEpdswqod47PpTFXoufFdgm8kJ0IQbqXRunRZpe4Wbrywze97wJj+zTof
	FmAS3zAZfSKJDpFGzTa4rs9z331x4CtnzFV7+Jo+Yxq5Uxf1bBqh7/TUSC6qFpKH4dJIF8L4J+d
	JDFH193yw0hm+rBrwuLwxcynrpPa6KC5o7AiujwYCRXDqbV5SVRidUlcnNuC8x1YlryVPOIekjK
	BOJDAVtdnJ/Shx3O+90g5nmfm6NrbfAmQMmraj0KRvO5HDzxFGb78R/BNuoiw7YeKoBbDtw==
X-Received: by 2002:a05:6000:26c4:b0:43b:4aba:8f35 with SMTP id ffacd0b85a97d-43b6424e48bmr18732364f8f.12.1774274614956;
        Mon, 23 Mar 2026 07:03:34 -0700 (PDT)
X-Received: by 2002:a05:6000:26c4:b0:43b:4aba:8f35 with SMTP id ffacd0b85a97d-43b6424e48bmr18732291f8f.12.1774274614356;
        Mon, 23 Mar 2026 07:03:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm29923424f8f.18.2026.03.23.07.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:03:33 -0700 (PDT)
Message-ID: <a3e212d4-78c6-49d0-982a-2baf9b0ddfd7@redhat.com>
Date: Mon, 23 Mar 2026 15:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/tegra241-cmdqv: Update uAPI to clarify HYP_OWN
 requirement
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, jgg@nvidia.com, kevin.tian@intel.com
Cc: joro@8bytes.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, skolothumtho@nvidia.com
References: <cover.1773361875.git.nicolinc@nvidia.com>
 <9ef47d0db2d7b8207fef1ef4437de6efa08565b6.1773361875.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <9ef47d0db2d7b8207fef1ef4437de6efa08565b6.1773361875.git.nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YMFubn-l3xZwebBPPi-OurZNUMCefnsBW9zCsF6PuE4_1774274615
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_070341_398305_155DD013 
X-CRM114-Status: GOOD (  17.75  )
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
Reply-To: eric.auger@redhat.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 3/13/26 1:36 AM, Nicolin Chen wrote:
> From hardware implementation perspective, a guest tegra241-cmdqv hardware
> is different than the host hardware:
>  - Host HW is backed by a VINTF (HYP_OWN=1)
>  - Guest HW is backed by a VINTF (HYP_OWN=0)
>
> The kernel driver has an implementation requirement of the HYP_OWN bit in
> the VM. So, VMM must follow that to allow the same copy of Linux to work.
>
> Add this requirement to the uAPI, which is currently missing.
>
> Fixes: 4dc0d12474f9 ("iommu/tegra241-cmdqv: Add user-space use support")
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/uapi/linux/iommufd.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 1dafbc552d37d..f63edbe71d542 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -1052,6 +1052,11 @@ struct iommu_fault_alloc {
>  enum iommu_viommu_type {
>  	IOMMU_VIOMMU_TYPE_DEFAULT = 0,
>  	IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
> +	/*
> +	 * TEGRA241_CMDQV requirements (otherwise, VCMDQs will not work)
> +	 * - Kernel will allocate a VINTF (HYP_OWN=0) to back this VIOMMU. So,
> +	 *   VMM must wire the HYP_OWN bit to 0 in guest VINTF_CONFIG register
> +	 */
>  	IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
>  };
>  


