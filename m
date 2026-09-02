Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4816C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+vEOyqPDv7rU89jwmnevj+9dxsKc/yKY2uAhwHha8M=; b=PrJ2hATtawRQ7jkoMdZTCrp78q
	Y4tWlfyJeazOJTjcNrJU9RjLqBOw6ZP3DTD8CJtkQBy1JrVljpL2dfJpYh7Ek5GwF/6/8XNaynu+6
	4Z7CFaOeO8Wqij/iLdaKQ9dLk/n5AKq+AcIhYvy/kCMbYwLFb33rDDDXErXMvHqkh8kV1BngPCnfC
	ieDBjg8nkEERQilRJBmwp5b9GmBHPUNg2eEaks9b/D955ham54iXYL+LfPa74gbbjdx+KM8D4Xqma
	J0tBkjFJbh/+Xh517jttSzNIfxrv4GO++WeXiazURpJodND5SsnW9cWASgVrggBl4vJiFQHupGNET
	7ehKF8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tF2-0000000FzEL-05nw;
	Wed, 02 Sep 2026 22:15:36 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tEy-0000000FzCw-3CPI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 22:15:34 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482ea739de2so926028f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 15:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387326; x=1788992126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+vEOyqPDv7rU89jwmnevj+9dxsKc/yKY2uAhwHha8M=;
        b=RlzBu/axFBnjrFYUvwIvK3l2hO/7NhtedPj4qyMl5fLy8+mnXEgxVGvGxc7huf+qxC
         npDW/cDURj4LRpWW0ovHEN4iBqzeZ9Waxjk0BTqfl3gohZGsYJ4fxd+mUqcYwGkJiiom
         l/eXmRu81EsONXqynSPhl0xVjGzRdoqW60F35kKtr96K5HDnnrfilis7H1G36x43qPYf
         MePvsJ6NRoPhWyIBdfOdqzAueY8ADsvch0bCA9BsM/+4PtW9uf0Wux25Hqk19wPq18oZ
         Sp65H2bp13FKfJ782XUl8SSgCqZj3JhrRgM3DHXYbkF2fSw2Ze2AroNo4DGNcz/cJzWq
         q2qA==
X-Forwarded-Encrypted: i=1; AKwUvBzCXRquS8RynMOroUXMvbz8hMoTf6ge4erbxWLk4N6xj0AqTNu5p91Juc7e3wIXmmj5n0t9k1dfJ1W7RrbNdtUg@lists.infradead.org
X-Gm-Message-State: AFuF++lCL+oILM4YJJpxl38uOIeXb0R+I4yiltA6MLjkTN87PUxEI/yy
	n/EkVH6eeIoGotX+DDNQKij6FjfxcOg0xz5zEH93ta1gKFbdzeKPyy7M
X-Gm-Gg: AYBFou30/519VMyUxjQ3z3Jqy1we9OxE0GTj0h8jP/RGuGbXmf/hEfNmb/Q7/whm+IW
	qTbXj5R9rMydsKOJ/nwZdZmp0pqkLZtcxIr45Z0ierbhuefdX3WeBz/3JJFg6mpYQxMUw16fUt2
	1rS3LCFbKohV2QluQTEH7AhhG0OAwU11SesQVrlMLIKXqA/MTZTmCG+wANGketJjDbM2LimkeR+
	6jUsn1E719LaZOr2SDB+yBYj4z9IguhstK5hM2u10CjMk43c8IXeis5gdYwKQGeDfh8hlDyjvX4
	GXvDqli+MZVCM444QTdYK7AiB1VJKaDqHD+vrgA9zGpOyLCKRWCWTBqgIGXsnv1SIC24Ynd+Nrr
	fGKbN6sq3+aXiC4Mhw3AqCmc53koNx/Va5q0IqUkNS6hK5ru93n+VJbI8kg+rjGYqX7fBo5ut7t
	P8pP0c6H9gJOH9ApQ4NriWNhkMK0iW7ttix7dL3qIG++GpaBluAbK1Kkh6jovwCnvGEkFYOomN7
	lhS5v6A0ci1OFBYmiibdY7Egu+S2eM0bkFK3OrOk085lUQdXpKlwxvyZP7M3I2OzDAk39d5FZFV
	JwA=
X-Received: by 2002:a05:6000:4208:b0:484:4769:18a4 with SMTP id ffacd0b85a97d-48488f10236mr16624383f8f.14.1788387326455;
        Wed, 02 Sep 2026 15:15:26 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm8301961f8f.19.2026.09.02.15.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 15:15:25 -0700 (PDT)
Message-ID: <9bb0ee66-d313-4a07-af4c-ffd002b55dee@reactivated.net>
Date: Wed, 2 Sep 2026 23:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
 <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_151532_989956_FB11BDC2 
X-CRM114-Status: GOOD (  17.62  )
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

On 02/09/2026 18:57, Daniel Drake wrote:
> +static int bcm2712_iommu_blocking_attach(struct iommu_domain *blocking_domain,
> +					 struct device *dev,
> +					 struct iommu_domain *old)
> +{
> +	struct bcm2712_iommu *mmu = dev_iommu_priv_get(dev);
> +	int ret = 0;
> +
> +	scoped_guard(spinlock_irqsave, &mmu->hw_lock) {
> +		/*
> +		 * Completely block DMA by disabling both the bypass window
> +		 * and the translation aperture.
> +		 */
> +		bcm2712_iommu_writel(mmu, MMMU_BYPASS_START_OFFSET, 0);
> +		bcm2712_iommu_writel(mmu, MMMU_BYPASS_END_OFFSET, 0);
> +		bcm2712_iommu_writel(mmu, MMMU_ADDR_CAP_OFFSET,
> +				     MMMU_ADDR_CAP_ENABLE);
> +		bcm2712_iommu_writel(mmu, MMMU_ILLEGAL_ADR_OFFSET, 0);
> +		ret = bcm2712_iommu_clear_and_enable(mmu);
> +		mmu->domain = NULL;
> +	}

My understanding is that when the IOMMU is enabled, the address cap 
represents the highest permittable memory address; requests for anything 
higher would abort. So I had hoped to achieve blocking mode by setting 
ENABLE | 0 in ADDR_CAP, thinking that would set a cap of 0, and hence 
memory accesses would fail.

But a Sashiko review pointed out that actually this value would produce 
a translation aperture of 256MB, because of the way the register works. 
And I confirmed this experimentally, Sashiko is right.

I also confirmed experimentally that setting value 0 to ADDR_CAP (i.e. 
dropping the enable bit too), with the IOMMU enabled, results in a full 
unrestricted bypass/identity mode.

So unless someone from RPi/Broadcom can inform otherwise, I'm going to 
conclude that the hardware doesn't support blocking mode and remove the 
blocking domain implementation.

This will cause the iommu layer to fall back to creating an empty paging 
domain when blocking mode is requested, which seems appropriate if the 
hardware doesn't offer a more direct way of blocking all memory access.

Daniel


