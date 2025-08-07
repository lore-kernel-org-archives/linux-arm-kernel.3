Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302A6C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ew/LMoL3hX7QGRoqJTNKTE5nWlFJaJ6Bt5NtIdG/+30=; b=MlwU3Mb3cd7GanjVSwsqflWKI/
	74THLHeBs2UYT2GPbZVwt1Mr/W3bIiTS3QoQq8CIxLqgYkdKBgtym2HA8oAkVAFKxvm0C/FkaQYK1
	Y7cIQDjMYB4IH5GiapT2wHRu++IeVtWgSyEzWg1nFnYQmNgOeiV7Qk+30UgZxfPEQlp6maxJg7g93
	9smqi3LQeobcJrVwrKx9jGMtwHAMluJv4LEwNaEUxbeA8TvrK62UOEUGsMCpgodWo6DpjstU2sMEd
	qJ0vfoif6dpsmUXvE5WbmyQnfP/KOmhRpGM2ATqmkx6FVPEUPE42C/2xIOkysMruJeQzNdB1TfIia
	v/DE4a9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2YU-000000010cs-3pWv;
	Thu, 07 Aug 2025 15:29:22 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2Ty-00000000zhk-0CsO;
	Thu, 07 Aug 2025 15:24:43 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b4281fabee0so777354a12.2;
        Thu, 07 Aug 2025 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754580281; x=1755185081; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ew/LMoL3hX7QGRoqJTNKTE5nWlFJaJ6Bt5NtIdG/+30=;
        b=bGVGtsPx30eNI9u+krl582Luwkr3gqzRiBdVGrWcyVKVGf3MJYLJj+elVj0FFrTkyx
         CC1vJyGA/RTedBgfVaC+RRSPmS+EF8NaHIumcgB9gca0Bzdovme8i/jUW4Nq5/frgoJE
         8GOmr5/P+/TjzBWTS7LFiX3PdBx6IfQCeWFTC2+faHvH2dJVfC7LMCFAsk7sLQ9ifSrG
         cNakxpCqhibiQ1eJIE0ghMfhRPLDRD620i9ZqGQ+qZq+0S0ip/s04m0ovelgmwlUSK2l
         xc+wtUuO+qGu3XUHGII30Xekjqo85Wa47vh5hOlH7uEoAjYzoUgsy0egb+8akjc5SxV5
         4ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754580281; x=1755185081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ew/LMoL3hX7QGRoqJTNKTE5nWlFJaJ6Bt5NtIdG/+30=;
        b=qwl4o+vUdDn7TEqt+nuk+w6Hgh/v0nF+Bdp1Kz3KgUSVKu9IeJNmFELWNt+Wdx44rj
         RrHy5ZVBQbqnhrqvxNWEC+fbdpU7cDSk23j6wXqH+1RwaFRyJZDuPH1PdKCN7PCp+9fl
         HeUpA0ydjnLeCeGV/Eg6E3YBcF/F2vwvrgVdUS1S/WojYnuXAtXcaEwilbbuuNBZFBHF
         L+mepDbh6mx+rh2eOQH2Ct1VjcD2OCTaNz0U4BpsfEApsf4kQEq5kaPNnLtyFl/Djm4J
         AlRp8Z/r7qeBAfl5IoMXONg9YBQmjyEoby+bAdYnHsUR+IDUfiA78N0aAEJXfS3+srm0
         FoQA==
X-Forwarded-Encrypted: i=1; AJvYcCVXBbUX5OcE20GuI0/bkGvyv7Lkkx8BZ/MUjMvasqpuSnVj7uqkpP2Kod2Z1ZiLJ0WY2Da6Rjn7ejbRiKe2o5E=@lists.infradead.org, AJvYcCXbGs8sJqqMIhbeB0QGpwA3LK+K+8ZBGSBntRNiyJFD20zmOIoLryACqoqN8vT+VK+0td7cyGGpbVeQTTPMoZhl@lists.infradead.org
X-Gm-Message-State: AOJu0YwjGO1jeBoOyLONmyKws8wDxgNQYlc78JpUHnEsZn5WHT0i2wqo
	Z8a/GA2c9/vo7ExP/S6SHw9723noon+ZRzZDmzWVAcLQCsKzNgmhyLF6
X-Gm-Gg: ASbGncsCNs7NKvuhKmPLxlP74SC2HDmsYJiKWWBNV7GYtKnb40dBwM9q29lk979Myfu
	nIVbVQUAQfVhfRxQHnbytD8dZaBSK8ga32Oa+MiJiQNFaLiwS3dR1d//RVJ0rJR2okyRdq+KB7b
	2KeCDl9OdbXnfjCDUdm/P3VRTiG+NT36WvdjunYWbD2iryj33yzgkDrs6V7bWuR4wrymraPCEC6
	ZoO2kzDVa3GgzdfDeWzTVXQmY9IUobJpd+MRylo6Z95/KXvSyID1z1HTn9KP1PUWB/FexfK+B7U
	HQ8FEHh/JRpjHlBNzFeqm4SRmDSz7Gxkqf/VnAM/PlehR40kxJNtQZVqZvSauYgnSK0eS2Ry8S6
	3T6f4PD5IJ83APY527tCAlfIPFongHQ4y319xyuTB+JOfbXDsNw7hIGcT3RELSyCL2CjLxw8=
X-Google-Smtp-Source: AGHT+IHkQcwhpJOI1M0Mm3omZFlsgigoUyyKVcPwpWwDpZoSYqv1zcJ16uBSjAmw7KuWTV/GF3AM+A==
X-Received: by 2002:a17:90b:4a04:b0:31e:6f0a:6a1a with SMTP id 98e67ed59e1d1-32166dfac71mr10079562a91.3.1754580280872;
        Thu, 07 Aug 2025 08:24:40 -0700 (PDT)
Received: from [192.168.0.29] (static-158-13-61-95.ipcom.comunitel.net. [95.61.13.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9e30sm15818001a12.25.2025.08.07.08.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 08:24:39 -0700 (PDT)
Message-ID: <2d179e08-c6f4-4e0d-8d2c-10c643e96d5e@gmail.com>
Date: Thu, 7 Aug 2025 17:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iommu/mediatek: Add a flag DL_WITH_MULTI_LARB
To: zhengnan chen <zhengnan.chen@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250807095756.11840-1-zhengnan.chen@mediatek.com>
 <20250807095756.11840-3-zhengnan.chen@mediatek.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250807095756.11840-3-zhengnan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_082442_109026_92664838 
X-CRM114-Status: GOOD (  27.24  )
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

On 07/08/2025 11:57, zhengnan chen wrote:
> From: "zhengnan chen" <zhengnan.chen@mediatek.com>
> 
> Add DL_WITH_MULTI_LARB flag to support the HW which connect with
> multiple larbs. Prepare for mt8189. In mt8189, the display connect
> with larb1 and larb2 at the same time. Thus, we should add link
> between disp-dev with these two larbs.
> 
> Signed-off-by: zhengnan chen <zhengnan.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iommu/mtk_iommu.c | 56 ++++++++++++++++++++++++++++++---------
>   1 file changed, 43 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0e0285348d2b..7af47c59b10b 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -147,6 +147,7 @@
>   #define TF_PORT_TO_ADDR_MT8173		BIT(18)
>   #define INT_ID_PORT_WIDTH_6		BIT(19)
>   #define CFG_IFA_MASTER_IN_ATF		BIT(20)
> +#define DL_WITH_MULTI_LARB		BIT(21)
>   
>   #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
>   				((((pdata)->flags) & (mask)) == (_x))
> @@ -865,6 +866,7 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
>   	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
>   	struct device_link *link;
>   	struct device *larbdev;
> +	unsigned long larbid_msk = 0;
>   	unsigned int larbid, larbidx, i;
>   
>   	if (!MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
> @@ -872,30 +874,50 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
>   
>   	/*
>   	 * Link the consumer device with the smi-larb device(supplier).
> -	 * The device that connects with each a larb is a independent HW.
> -	 * All the ports in each a device should be in the same larbs.
> +	 * w/DL_WITH_MULTI_LARB: the master may connect with multi larbs,
> +	 * we should create device link with each larb.
> +	 * w/o DL_WITH_MULTI_LARB: the master must connect with one larb,
> +	 * otherwise fail.
>   	 */
>   	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
>   	if (larbid >= MTK_LARB_NR_MAX)
>   		return ERR_PTR(-EINVAL);
>   
> +	larbid_msk |= BIT(larbid);
> +
>   	for (i = 1; i < fwspec->num_ids; i++) {
>   		larbidx = MTK_M4U_TO_LARB(fwspec->ids[i]);
> -		if (larbid != larbidx) {
> +		if (MTK_IOMMU_HAS_FLAG(data->plat_data, DL_WITH_MULTI_LARB)) {
> +			larbid_msk |= BIT(larbidx);
> +		} else if (larbid != larbidx) {
>   			dev_err(dev, "Can only use one larb. Fail@larb%d-%d.\n",
>   				larbid, larbidx);
>   			return ERR_PTR(-EINVAL);
>   		}
>   	}
> -	larbdev = data->larb_imu[larbid].dev;
> -	if (!larbdev)
> -		return ERR_PTR(-EINVAL);
>   
> -	link = device_link_add(dev, larbdev,
> -			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> -	if (!link)
> -		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
> +	for_each_set_bit(larbid, &larbid_msk, 32) {
> +		larbdev = data->larb_imu[larbid].dev;
> +		if (!larbdev)
> +			return ERR_PTR(-EINVAL);
> +
> +		link = device_link_add(dev, larbdev,
> +				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
> +		if (!link) {
> +			dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
> +			goto link_remove;
> +		}
> +	}
> +
>   	return &data->iommu;
> +
> +link_remove:
> +	for_each_set_bit(i, &larbid_msk, larbid) {
> +		larbdev = data->larb_imu[i].dev;
> +		device_link_remove(dev, larbdev);
> +	}
> +
> +	return ERR_PTR(-ENODEV);
>   }
>   
>   static void mtk_iommu_release_device(struct device *dev)
> @@ -903,11 +925,19 @@ static void mtk_iommu_release_device(struct device *dev)
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>   	struct mtk_iommu_data *data;
>   	struct device *larbdev;
> -	unsigned int larbid;
> +	unsigned int larbid, i;
> +	unsigned long larbid_msk = 0;
>   
>   	data = dev_iommu_priv_get(dev);
> -	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
> -		larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
> +	if (!MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
> +		return;
> +
> +	for (i = 0; i < fwspec->num_ids; i++) {
> +		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
> +		larbid_msk |= BIT(larbid);
> +	}
> +
> +	for_each_set_bit(larbid, &larbid_msk, 32) {
>   		larbdev = data->larb_imu[larbid].dev;
>   		device_link_remove(dev, larbdev);
>   	}


