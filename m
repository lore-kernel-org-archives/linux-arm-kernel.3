Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB0C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3E8q6SLFA2ZLcc8B4L7d4FJiaa1UbNh29dUR+fF9fY=; b=yVji6mYsxt8QFIgTzL9oWmUvVk
	q6bquC93w1VENoHvm9o5blo2Ty+39NIz9SlaF+mEkmQ7gEI6YnvqtcYPllYwepTnN1lk5sFZDnReO
	PDQcqCWvis503P39rW/i/reuR2M9rbYhaCQHgZ03l0c3mfgtB63GtZo+UilxBL7uosD4Mva0xeCY/
	zpHIwHSdBVp3/dBOpLwD9/5bQvQ9zk0n01W3lEFRARcHeGzMJZT5f4dbOI5G/JwGtFVQWsx5OMyoj
	ccJCr1CQZBMovFm3p+G6KJ9XHIztbEEp+9vbYN68suE0fAKdAcEdSIYRV5iETcxvqOHNMomy2MB5P
	b+5HJA/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptkn-0000000DXuM-01bd;
	Fri, 31 Jul 2026 20:22:49 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptkk-0000000DXtU-3TZK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:22:48 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de008b020so1037565f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 13:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785529364; x=1786134164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3E8q6SLFA2ZLcc8B4L7d4FJiaa1UbNh29dUR+fF9fY=;
        b=FaOs41wjM50u6rmGlEBfohBtotsHzlmS6sgTIZdt34mhdyvQtkSfL+2728k4JIjEuA
         RnLOoNd3P+YxJ4ICxmMDins5a44L6fluXGpatQ7JKrIc6WyqehQqn23v5ry80TQzIRGs
         7cQuFBQ5cz6FlK1KJV16nSaqQItTyDJaO7AiMZelNtfhmfYe4zF8sGO560YGNRnFca1N
         hZ2U8jzzHY9gSR/GtROG5B2RjM8998PTFBWVkkyxAcfmG8WbHZi5wq7FVSxj2sEbTTnE
         pYoWtX+yI2KhlTir54//jy1OOlH/RR3ofUWSn78Fvt/eLxEgcSL2hqW/QBWfNOsL0cH2
         qLyg==
X-Forwarded-Encrypted: i=1; AHgh+RqxAZ149aZNrDJX9YG0petYKw731TQw7bin/avV/4THrYGOsep/swtv2vceCM/tg1wWeMDAhMg/yohzgWOVOQoV@lists.infradead.org
X-Gm-Message-State: AOJu0YzF7ua9kiyX7UIrxVPZ2OCrlXM5TOHnXHu7F45f08ggdXB7E3Dg
	j+RKgo5/KnkHhWcmdZvNzUbLdbyspRZiYJiQuYy09N9b16hcc4BDKJ8d
X-Gm-Gg: AR+sD13MhZ9S845myVdMVG+9zY+e9uJ8fmP78LOc34ukw2J/eXMtg9Mkx4bRKulUBxF
	8EluUTr6VQIiUzmbrssTnb1FuuVG6UnrMclLHJuPN6SPTvq6MOOuBK/7yDBWeZBE2b/8JT8t5h8
	nGa9iqxklXmuafVjhQSMryVpEnZIcSQhlEKnHWzFkvTQmxSgUzq/Wp1gQdBgviKbi75aUcZQ/aR
	cogWMC7nUoHxAiwrS0/+O3hm/YqKSAH3dDPhToWrlAanLO8aF2gj1Ii/QDvxulObVv7I3IE9NaH
	JthUPmCO6kteCM8da7xPXWsrWNq74XZkw3DvwcBK4jJIgnT87XkY6YKr4CpISMGii/XfyBijzn4
	qjkt02OEJI+8M3mm4f3w0HgcOdaeXRordJEhjgkMN5ZfG9kjleZJ1B0yRoi0smsN09wdbwhDF9p
	Hgyeom7qmUYKYoQYtWgMkyylzBVMoOmjyEO3PeFd6OSwD4+5uO3147Gxua5a2KK46X1Z2zod6BZ
	/eJuwnjI6sO1UPLKrPxJqmzDQMGvGHD9aXghAvwOcNp8+lBfubCx3YqV02l8gIXnsUd
X-Received: by 2002:a05:6000:25f3:b0:47f:90f1:68c8 with SMTP id ffacd0b85a97d-47fd32b19d0mr7598242f8f.1.1785529364463;
        Fri, 31 Jul 2026 13:22:44 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562a38sm9066484f8f.21.2026.07.31.13.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 13:22:43 -0700 (PDT)
Message-ID: <d6bb859e-c1e7-428e-b765-7b471e1ce005@reactivated.net>
Date: Fri, 31 Jul 2026 21:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
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
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <amlE8rEgryPqrUZd@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_132246_904609_992D9A7C 
X-CRM114-Status: GOOD (  29.22  )
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

On 29/07/2026 01:10, Jason Gunthorpe wrote:
> If paging is attached then it sets MMMU_CTRL_OPERATING_FLAGS and
> places the aperture at 40G. Based on the comments about blocking I
> wonder if the "bypass" even works when paging is on?
> 
> If blocking is attached then it sets MMMU_CTRL_OPERATING_FLAGS with
> some 0 address cap which aborts everything?

The hardware lets two regions be configured:

1. Bypass window
Configured as BYPASS_START_OFFSET..BYPASS_END_OFFSET
Any device access to addresses in this range go straight through to the 
same addresses in physical memory. There is no PT translation.

2. IOVA Aperture
Configured as BYPASS_END_OFFSET..ADDR_CAP_OFFSET
Any device access to addresses in this region go through page table 
translation before reaching physical memory.

The bypass must come before the aperture.

Access to any address above ADDR_CAP_OFFSET will abort.

So the blocking domain is implemented by setting both of those ranges to 
0, which means ADDR_CAP_OFFSET=0 as part of that. (I'm going with the 
interpretation that a blocking domain is like a killswitch and should 
abort all memory accesses.)

However, the blocking domain implementation should be removed (see below).

The bypass works fine when paging is on - did you spot something that 
makes you suspect otherwise?

> It looks to me like some of those comments and choices don't reflect
> what the driver actually does. Since there is only ever one
> translation we never need to be worried about where the aperture is,
> it could be anything so long as the HW gives it priority to bypass.
> 
> Could the aperture be placed at 0 with the bypass fully disabled? Then
> it would basically be a normal iommu.
Please let me know which comments/choices you are finding unclear, I 
tried to make this driver readable and would like to fix that.

The aperture could be placed anywhere, but the key idea in the current 
driver structure is that we deliberately place it above physical memory, 
so that we can have the bypass window operational for all regular 
physical addresses, meaning that iommu-unaware devices can operate as 
normal.

Each of the 3-4 IOMMUs has around 5 devices hardwired into it. When the 
IOMMU is switched on (effectively via setting CTRL_OPERATING_FLAGS), 
*all* of the hardwired devices are subject to the IOMMU operation, 
uniformly. There is no gating where you can have one of the devices in 
standard passthrough mode and the rest using the IOMMU. Also there is no 
Stream ID in the transactions, there is no way to configure per-device 
page tables.

Among the devices hardwired to the IOMMUs we might have:
  - Devices already set up by the firmware and relying on regular access
    to physical memory
  - Devices that don't require large contiguous DMA allocations and would
    prefer not to have the translation overhead of the iommu
  - Devices that handle scatter-gather natively and prefer not to have
    the translation overhead of the iommu
  - & devices that want to use the IOMMU :) so that they can work with
    large contiguous allocations which are actually scattered in
    underlying physical memory

So we have multiple needs to tend to, which is why the driver currently 
sets up the bypass in the regular address space (serving the first 3 
above), and the IOMMU aperture in a high, unused part of the address 
space (for the devices that do want to take advantage of the IOMMU).

Are those good enough reasons to set up the driver in this way? Or are 
there other approaches to consider?

Let's take an example where the aperture gets placed at address 0 (and 
hence there is no bypass window). Now it is operating more like a 
"normal" IOMMU (except without per-device configurable behaviour, stream 
IDs, etc). The system boots and the firmware sets up the display 
controller rendering some early boot screens. Then the kernel boots and 
takes over the framebuffer using efifb or simpledrm. Then it loads a 
device driver for, let's say, an image processor. This turns on one of 
the iommus and puts it in paging mode. The aperture gets placed at 
address 0, no bypass window. But, whoops, that iommu happened to *also* 
have the display controller hardwared into it. Now we have a big visual 
glitch and the display output has stopped. And maybe the kernel doesn't 
even have the vc4 display driver available to correct that later, 
because the expectation was just to use the simple fw-configured 
framebuffer.

This is also why I think the blocking domain implementation should be 
removed. It causes collateral damage to all the devices which might not 
have had any idea they were influenced by an iommu.

Thanks for your help!

Daniel


