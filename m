Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EA3D44145
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnItVhoY0Lh4ZLV1sF8rYZtnMRWqPjsgUKn0khqX+aY=; b=4FT4EkxsC2/4ZcYLeQXbsihDyg
	ia0VDbZT42YcXBiQJ021AcZEiktCYhYauMYemBgUqiM2TNxmLS40scOIfvXaqus71BMRsBEJdRmtv
	xvqvHQegXdKgDT+Bee4+MhT2/TUdOtBBkQayLJlD/+hv4zyu5zIYhJWOelt5cdo0WQhszhRe4zHkh
	Hq/96wULPmOW+qi40VOO9ZWbXEaeZLBqurA/WB+1s3rOmU9y1mqKfGVl33QkcnFs28ZvlZLU8mt+1
	pP8QUdgEgeHC51FVjOk+uPWf0ITyhTLkFAP5iZw98Mf+AKiqmwl1GUPVW9A/gWfMDDsDyzgo/tzXs
	9VYYEbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTysx-00000000HoM-1bjx;
	Fri, 12 Dec 2025 08:52:23 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTysv-00000000Hnx-0QsE;
	Fri, 12 Dec 2025 08:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765529517; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G2a/yMRoNYEYX32qsSh9klxJhkz42oM/Rs6xEqUkj0GCib3cTPtgakDODcACfn3fPOSdTjp5nCQ4HrmJngxT8hhyZf7P9E6vA3a5QwC4fSg7T189qetTRc0W3hnqp3yRgbsWkW2LxdAe1R679CZ3AROCYtTbM3vG2pMgTd1muF8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765529517; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xnItVhoY0Lh4ZLV1sF8rYZtnMRWqPjsgUKn0khqX+aY=; 
	b=BI76Zs6kc6v3+Stj5VlhmI+2TOP8RS8JG2lFviNZwApLZgZGTiGjkPb3B23h98BKyjHhWOwR5elzisMyHTr9GLo9tG3k6uQhHC4Zpk8IjIMrPvqVV99Ra4CWOpcZwPRvjoLuY6va0bntFhXR45YVOngOmGaOFbGTDj19AAmBGEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765529517;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xnItVhoY0Lh4ZLV1sF8rYZtnMRWqPjsgUKn0khqX+aY=;
	b=frIILijI+V7VsU7x9gFc0FgCtswAJVCRHVYaKIzxLkHrpO68qTVpwrcmRFR3+WkL
	mt4ffUw6Br0SsK57xAw4CqvUYtbl0gczF3m/vK4EvR/LI05DhyHqQ76aHxc/37MVr5V
	VI/8jNg2/7GGPYhGECQCln5VIG2Jznk0GfV7S9cA=
Received: by mx.zohomail.com with SMTPS id 1765529515530660.6512833937438;
	Fri, 12 Dec 2025 00:51:55 -0800 (PST)
Message-ID: <ea3241f1-14a4-44a0-9d85-3fa2a2f6f1ae@collabora.com>
Date: Fri, 12 Dec 2025 09:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 iommu@lists.linux.dev, jgg@ziepe.ca, joro@8bytes.org, kernel@collabora.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, mchehab@kernel.org,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, robh@kernel.org,
 robin.murphy@arm.com
References: <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <20251212033157.3036182-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20251212033157.3036182-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_005221_199431_192E924A 
X-CRM114-Status: GOOD (  10.36  )
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


Le 12/12/2025 à 04:31, Jianfeng Liu a écrit :
> Hi,
>
> On Thu, 11 Sep 2025 17:57:13 +0200, Benjamin Gaignard wrote:
>> +#ifdef CONFIG_VSI_IOMMU
>> +void vsi_iommu_restore_ctx(struct iommu_domain *domain);
>> +#else
>> +static inline void vsi_iommu_restore_ctx(struct iommu_domain *domain) {}
>> +#endif
> After applying this patch to v6.18, I get error when building this driver
> as module:
>
> drivers/iommu/vsi-iommu.c:541:6: error: redefinition of 'vsi_iommu_restore_ctx'
>    541 | void vsi_iommu_restore_ctx(struct iommu_domain *domain)
>     |      ^~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/iommu/vsi-iommu.c:31:
> ./include/linux/vsi-iommu.h:18:20: note: previous definition of 'vsi_iommu_restore_ctx' with type 'void(struct iommu_domain *)'
> 18 | static inline void vsi_iommu_restore_ctx(struct iommu_domain *domain) {}
>     |                    ^~~~~~~~~~~~~~~~~~~~~
>
> I have to use:
> #if IS_ENABLED(CONFIG_VSI_IOMMU)
> instead.

I have fix in my internal v10 branch:
https://gitlab.collabora.com/linux/for-upstream/-/commits/verisilicon_mmu_v10
I don't plan to send this update because that will change nothing about code duplication remarks.

Thanks for the report.
Regards,
Benjamin

> Best regards,
> Jianfeng
>

