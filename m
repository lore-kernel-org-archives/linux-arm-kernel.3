Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FBBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPrcGGvEf1e6P4d7hpsNvKZqUN+qMke5YpauuSzuEx4=; b=VOqOJ1zOmwtNZboql/At1kU6WH
	8LtUpLlOXvOki7mZj8EzQI9fvFQout6ZccNC0YPBfGB22HoW8anCb5nnEs620wjpBMe/27SBF0bin
	uF2TpNK3vkY+bNpCY8vbvI9s3CLdAY0hHRRRx4sw90vE5KXeLZr8FYjX3qxd8DnjY5axebtPg/jR6
	/gn5Efx8Rm4E1WIQ450A7GxSeKd7rYRyBYyHDp0wk5QtSOKAx3rUbPHFtfhZEPHgPx4boPRAM7pfZ
	x/OVtkQxhhPLM5yTZauJ132QGWjm4FWS12JjPT5mDRLjAQ+TW7K+MWgAqrRBhoCORLaAWf1MgZHXC
	YmQa7Wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaK1-00000004loG-3NIf;
	Sun, 16 Aug 2026 12:50:41 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvaJy-00000004ln0-3u9Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 12:50:40 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47db714766aso2092870f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 05:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786884637; x=1787489437;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPrcGGvEf1e6P4d7hpsNvKZqUN+qMke5YpauuSzuEx4=;
        b=TJabbinEOIxLSZe7pw/hxw5DFcXBWh5/vx3rlm4Xeykb3M7YKbWV4en2D2bxqkgKBb
         63OdmQwp3QuheGQ4vqmZBJ2A/PQv/qrmrwlBo02BAeJVyGRrC+naMU7gzyyB4onh0BHs
         Hwy7k4qykROjqKowp3OlH0IGBcGFui6Kmq/BlSUc6aRaKTlJzAzfqI8RWfHcOMHH0G1y
         eRx6DIjBerfYW8W0i4EDKyhU0suPNgAIFKhfuTMamIwYQo8qfX7FAf7MLK95Goyez5cS
         olAqO++ZLJk18vpxBg9leH6z6E+SOI3k6f4uPN7iZxvCxuqxkPHLiMnwWUbm33oGb91/
         1q0A==
X-Forwarded-Encrypted: i=1; AHgh+RpCjRC8MgnQeC0S/fmDQ9vgee/vLTWCgdYgEbrOQoA328wkEo9s4q1AafyvX+kef+uxnY7XdSUr0K46ygNCkhFY@lists.infradead.org
X-Gm-Message-State: AOJu0YxTUm6VpDDgONGRPfldtpnJbDPJvUM5OxmasGY5YdHANvtllg8H
	LEoDkJzDQ9oAfVVdECdWSI/mAi+yhLZseS0pF44wsO8GAaxSSjuN+paD
X-Gm-Gg: AR+sD12UHWAqTPrhgVq07kPplpOhlMXBDl1eNrpBCB8G34uyvsxnKazchNYbdg4Sder
	mVY9EqgRQlKkFT+KdE1mJJn7SUc6d/pu1ScFAVrQqIPRYimNCdF3a/+FWu1Fazq2urYEbWfpQP5
	m+hzkXlJx2yaZgEbwOQoBOfrZSPDDpcQ0jqj2cm0DpP2hPIxZ8zioSXXGB7YdIl+4UJplAUJVYS
	JK6EgJaHy4ai91tz3bVMBhSMyHiGGH72ca8/2IIDdZGo6tUSBq6w+MoC7A/natIzrdzSq7TjaAJ
	1GNwI3Tgztn5kJONwfZWfDbf+81sLRhZezWyCNisvyoEugvsKVU0wmUdOSDOsuKEdI5ao5a+NbA
	Bgb8d2YWEjpIJ+6U30Gcn20wm57ZXEZW917oCLJ966INFGTMNwt6tv9zJ3NjzmPI69kNLDFSrk0
	6lMoNG2Sbll0w86CDQpZSrSbzwCqHey8Bzki2CPEYiK6gE/WBAc0NOiAtmLFuQk9xR2cnwzTb/g
	rNnH0IBhHAuY1g66O2cGEc2hLvnszDCAl4N2+Lt/tmGA/g54g3iAl3Rg9fHVTlgZIZZjfWUKJwX
	f9I=
X-Received: by 2002:a05:6000:184c:b0:481:314b:b041 with SMTP id ffacd0b85a97d-4816075f4f5mr30224247f8f.7.1786884636404;
        Sun, 16 Aug 2026 05:50:36 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f219e12sm22222287f8f.10.2026.08.16.05.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 05:50:34 -0700 (PDT)
Message-ID: <abc25cfd-0c7d-4719-b6af-9034c87e9f88@reactivated.net>
Date: Sun, 16 Aug 2026 13:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
From: Daniel Drake <dan@reactivated.net>
To: Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <3e7ba95b-51e7-48e4-aea5-f86db1739ac2@arm.com> <amlE8rEgryPqrUZd@ziepe.ca>
 <d6bb859e-c1e7-428e-b765-7b471e1ce005@reactivated.net>
Content-Language: en-US
In-Reply-To: <d6bb859e-c1e7-428e-b765-7b471e1ce005@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_055038_979851_CD7DAAD2 
X-CRM114-Status: GOOD (  26.66  )
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

On 31/07/2026 21:22, Daniel Drake wrote:
> The aperture could be placed anywhere, but the key idea in the current 
> driver structure is that we deliberately place it above physical memory, 
> so that we can have the bypass window operational for all regular 
> physical addresses, meaning that iommu-unaware devices can operate as 
> normal.
> 
> Each of the 3-4 IOMMUs has around 5 devices hardwired into it. When the 
> IOMMU is switched on (effectively via setting CTRL_OPERATING_FLAGS), 
> *all* of the hardwired devices are subject to the IOMMU operation, 
> uniformly. There is no gating where you can have one of the devices in 
> standard passthrough mode and the rest using the IOMMU. Also there is no 
> Stream ID in the transactions, there is no way to configure per-device 
> page tables.
> 
> Among the devices hardwired to the IOMMUs we might have:
>   - Devices already set up by the firmware and relying on regular access
>     to physical memory
>   - Devices that don't require large contiguous DMA allocations and would
>     prefer not to have the translation overhead of the iommu
>   - Devices that handle scatter-gather natively and prefer not to have
>     the translation overhead of the iommu
>   - & devices that want to use the IOMMU :) so that they can work with
>     large contiguous allocations which are actually scattered in
>     underlying physical memory
> 
> So we have multiple needs to tend to, which is why the driver currently 
> sets up the bypass in the regular address space (serving the first 3 
> above), and the IOMMU aperture in a high, unused part of the address 
> space (for the devices that do want to take advantage of the IOMMU).
> 
> Are those good enough reasons to set up the driver in this way? Or are 
> there other approaches to consider?

Reading the thread again I'm sensing that it would be preferred to go 
with a more conventional IOMMU setup, rather than trying to cover all of 
the above in a single configuration.

For the next revision I am thinking:
  1. Paging domain has the aperture at address 0, without bypass/identity
     region i.e. some degree of memory protection is present
  2. Identity domain is complete iommu bypass (as-is)

This allows the system admin to choose between the iommu benefits (and 
associated minor overhead) OR the non-iommu bypass mode. That choice 
would apply to all of the devices hardwired to the iommu in question -- 
we wouldn't attempt to support mixing identity and paging approaches at 
the same time as was originally proposed.

Regarding devices set up by the firmware that require ongoing access to 
RAM, of which the display controller is probably the only case, we can 
use the existing mechanism that allows the firmware to communicate such 
requirements.

The iommu driver will do:
	.get_resv_regions = iommu_dma_get_resv_regions,

Then on the DT side, I would ask Raspberry Pi to provide a firmware 
adjustment in future versions. It already dynamically programs the 
framebuffer as a memreserve property, a hole in the memory map and as a 
simple-framebuffer node. We would need this additionally programmed as 
reserved-memory:

  reserved-memory {
	fw_fb: framebuffer@3f800000 {
		reg = <0x0 0x3f800000 0x0 0x800000>;
		iommu-addresses = <&vc4 0x0 0x3f800000 0x0 0x800000>;
	};
  }

and also a link back from vc4:

	vc4: gpu {
		memory-region = <&fw_fb>;
	};

This will cause the iommu driver to set up the initial page tables with 
the above memory region as an identity mapping. This is done before 
paging mode is activated, so once the iommu is actually switched on, the 
display controller will enjoy uninterrupted access to that framebuffer.

Let me know if anything sounds off!

Daniel


