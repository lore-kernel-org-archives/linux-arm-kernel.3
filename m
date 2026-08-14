Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAA7C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rH19XpzJqW08+W7mG+VpaQ4KF0ayb7gJPWy2w+2WSfo=; b=LvroYf8jr/i6dDR5hSdIsJObX4
	ujt0Cq8X4gLAd9lRiC8TxxNFHkU0AoM48kZDc1VbcI7i8QqjZcS7XJ38Vtg22d0CdUfEqHaUg90vx
	Hj0HHU6JPSXj0aG30taaCf8m1xQlM+ksz5OTMwrizISfbdvWjZILMPwYvrUcSyX3+YW8Drk6Yn9kU
	QIvREHIWRc7bJtGw6Ah9A5mv+M3ZFmqZu9uWUfuv1qSpKymZRkRfJqiPohBxWpfDs2Sqa6bhXsX20
	gVUArdAuUlgcW9mqCYc4sLTZBFhRtlbNX8zePaZXM3Shm0+xz3Cpax1BwQcUgDdfrwDPq9fro4peh
	qV8MHblA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wushQ-00000002mCu-3IBW;
	Fri, 14 Aug 2026 14:15:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wushO-00000002mCA-29rT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 14:15:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d3b440b97aso89735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786716953; x=1787321753; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rH19XpzJqW08+W7mG+VpaQ4KF0ayb7gJPWy2w+2WSfo=;
        b=RJYAqBxLapo1h0MAuioCsASr+ai9wz6xJTjpXf+8bp2W32Hbm6jWHXGKyjZ1v9uc3q
         4kECF0kISzMZ0+nLIZt/NFe79tyRX0Gi7ilbp1Nz9byh46bKn0IP1XmrxAHg62j2xRZX
         IDfwQlw+LrJcf4JvdGJF1shTRT/NLEBEY+NSk0qwlB1wVHNz54oe8lTBVLdKK9EPbwfD
         nTDQMJGq/PRC4+3iYouiAgr6oRw3bRPnmNDJ7F6Em1TBhczgUYV3y0gVpQtDVVv2miQf
         uBPjkg0wbtJyTrbw6q+qfWRewJwoXcNZyiNdzbWDq8WLu5Z5vDm+TUGIl2kgY0AId5eQ
         Egkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716953; x=1787321753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rH19XpzJqW08+W7mG+VpaQ4KF0ayb7gJPWy2w+2WSfo=;
        b=RgFtapsapfhaR98M+a0Tud3O+DUe6TGOVEatmg1MVhHlZ/wxgzJ+eVUUE+QrBhjyqS
         EJ+5oJjfPkSBTJb2gYCm6M6wYZP5A9yJF78SVYhZL2dxzD/fA5nahPo2khIo3zDDT0f0
         JROSyWRC9kalwCHNXH1PQTF9ukgwWGwhVeVsb7Z3KobT3f4AZV08tgmwgT5Nj60dwLrF
         1xJUnwAGbyMZYGZC3AnyNCT44RysgHIp2W6ipY3kbtN8aJUHeIE013nLZ+EQHN8twnKb
         I4U3eCpdgQzP85Eq3ApJoKa6yln/NV8TyXwo2kGgP0EToLItraqiwvYcIdfHNPiXEbhV
         0r/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp5iP/PfFRjyTbbrMTODIXSnP5vBfoW+lqRtP8CxTugt3V1TPCdMOIWhTETV2b0Xm7zbmfYDSKQGx1Tp2qJwrNI@lists.infradead.org
X-Gm-Message-State: AOJu0YyCdgj9CLAc+yN5P7a8+BFPXPo9hNZER7zgFiOz33pOsmKsbF5l
	D3vB6QG2k82lEwULyNFDDwu7aaVtk28Ww6eBJCbGclcrg4y+g8TmIuVWX/EBiLnxtptYxk5qwLQ
	t3RJJ3w==
X-Gm-Gg: AR+sD12ROXbAinVSxRMZXTZEUF4DC0TDHzxPZxKEeT0GyHNlcdHZ/0c0QYtsCNLxvF2
	4xQ0+9R50oWeFhkBjB8gT0s99c6QaJCcYSn5q4EAaAVDA68sjr4FmkxBFQk8Vh8djGivC3bjqEB
	EgYbEsxQYSR5UeN1sIuOV+flGYV8sM/yuIeGiWjKK+QOHiEzhfGqGPfH2fFYGI+U0qgdEY2TVc0
	t2ir+of2gyic2tC0v9w37gZ00ukRdZ+nKHBAWUdBT/PlIlmNbZGayrb9zIlHM7jCxW1X8iqXVPk
	u15BDgRUtegA3q9Rq86C7q80uMHZYG6/AbaIlV/i7Yx2sBB7wk9VHRuIMhdKXsCYVsvoE8pLS9D
	Vq1RGsHZiIwwkU2Rh1xyPglhh5BN1M/vwQYlKpAg9P36mJs9G/VcevidPdFQGmH8qkTCvBTRETh
	8S+2epvsMa7Da3AS6Hor6939WD6lYaWKY645fnLJvetmDK7/ytXk4IenyJ8Ur0AufCefLyoFCa/
	zNo47GSFZ8VopbF75MCAw+OSqGaF2W2Nw==
X-Received: by 2002:a17:903:15c8:b0:2ca:6bf:5bac with SMTP id d9443c01a7336-2d3af24fa75mr9130205ad.8.1786716952002;
        Fri, 14 Aug 2026 07:15:52 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f8csm551513b3a.35.2026.08.14.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:15:50 -0700 (PDT)
Date: Fri, 14 Aug 2026 14:15:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Dmitry Malkin <dma@nebius.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow nested attach for PCI
 bridges without vDEVICE
Message-ID: <an8jEbT9pAUYfsvR@google.com>
References: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_071554_582673_61311B2C 
X-CRM114-Status: GOOD (  19.67  )
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

On Fri, Aug 14, 2026 at 10:07:09AM +0000, Dmitry Malkin wrote:

Hi Dmitry,

[...]

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -5,6 +5,8 @@
>  
>  #include <uapi/linux/iommufd.h>
>  
> +#include <linux/pci.h>
> +
>  #include "arm-smmu-v3.h"
>  
>  void *arm_smmu_hw_info(struct device *dev, u32 *length,
> @@ -118,6 +120,17 @@ int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
>  		if (cfg == STRTAB_STE_0_CFG_ABORT ||
>  		    cfg == STRTAB_STE_0_CFG_BYPASS)
>  			return 0;
> +		/*
> +		 * Group-wide domain attachment also visits host PCI bridges. Such a
> +		 * bridge is not exposed to the VM and therefore has no virtual SID.
> +		 */
> +		if (dev_is_pci(state->master->dev) &&
> +		    pci_is_bridge(to_pci_dev(state->master->dev))) {
> +			dev_info_ratelimited(state->master->dev,
> +					     "skipping vDEVICE requirement for translated nested domain: cfg=%u ret=%d\n",
> +					     cfg, ret);
> +			return 0;
> +		}
>  		return ret;
>  	}


I agree that this is needed for old bridges. However, should this check
actually live higher up in IOMMUFD? Instead of the SMMU driver deciding
to bypass the error, what if iommufd itself intercepts the vDEVICE 
mapping failure during the group iteration? If IOMMUFD sees that the 
device lacking a vDEVICE is an IOMMU group alias/bridge, it could 
explicitly tell the underlying driver to proceed with a NULL vmaster?

Also, regarding RID aliasing: while it's true the host bridge doesn't 
need a vDEVICE for its own host-consumed DMAs (like AER/PME), are we
confident this won't break guest-injected events if the bridge aliases
the downstream endpoint's traffic? For e.g. if the "real" endpoint's
traffic is aliased to the bridge's RID and the bridge has no vmaster,
won't we lose the ability to inject IO Page faults into the guest?

Thanks,
Praan

