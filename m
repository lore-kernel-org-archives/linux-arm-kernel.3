Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99ACC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZplDPDarrgfYfltWJB0WdogIU9Jf5wB1DpwTrdaw1c=; b=i88eJ2MJq9i/vwJFvz8l8WLWdi
	ts3yeKSPxD9ErpuYGTl+qYA5XlKool2KkNkmCdoVW1wFyImYwwk0vgP9jaNC3tXzZuLhnvsOQjXRP
	MvdrX6UkUD7X9nLB3UlX1GK+4pLEp/3G6M9bwVWjysun2Tw1IxeJxCP8kBxhB0//FWx5tJk4aDD/5
	Snu4K2EIfgcxevESXB7aufZjmXc51IhLg9gjrs/UEo/L0HWuQ9CDVsijGPf8gA4u6F6aer78ha2Zp
	8xLYr7WZITu3WU3ZxBxWbhU6BkKakBDQhMmgqCrERlBIZ8zD+kVF2QysKD341pA3jw3UJV9xVbSeJ
	wGK7XYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JKw-0000000CXBq-0B00;
	Thu, 17 Sep 2026 21:08:06 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JKt-0000000CXAz-18kT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:08:04 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6a5f2b256aeso41373a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 14:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789679280; x=1790284080; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZplDPDarrgfYfltWJB0WdogIU9Jf5wB1DpwTrdaw1c=;
        b=Z0ff16AQIPP49ZSYdepEJ0xybiwpITfjZe/qvYFfdimiX7+zqS2KfiKMyKyOr+d3Ou
         LXGI7nKXVwNaeoZWNYLR+JiBtzYSqkE2jcmPzH7OXZ1hMhTAStP1U5RQrGnQ7EvFKhkt
         v/iM/tTLdSqqNBwSxCYCuxVhWpzQfnqbSkaPvNGbV66xd+I/CAzmh8pqGRioHDZz+hkK
         LCxzAjkS+xh91lLiKiACsb3AXHOzseZ/zEsuX/gpj9lXNmsCqHISeQl695OnM/tRlYWE
         KTMAnG1E3QyiApqrUeujqsvydrPeztfeEaawUVf+wQ7p75MtLQFvOXKTzqVwG85uwe2x
         F3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679280; x=1790284080;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZplDPDarrgfYfltWJB0WdogIU9Jf5wB1DpwTrdaw1c=;
        b=2DPudKmGdgJIbNP9TmdU4AyjzJviKx9VvnVagT8ZnC2kMQJABXVAlSZ4HXy5FRSTlM
         IMt4+JPI5/cE4KysniJvhZwphl9Vriq7LLkZOQ95vsyZ3j9UVU1YG+xFZRb103IQbmob
         fLeKS1IJADBRDhKzt7k6Obw+2go+m7iJmPkOGMs/r5UvSRTgf8K3QdM7mk0ykgDMbOEF
         ZIyk6vv3X6CntgkpCTxjFSvoB+bLKX37Dt8RJeH0hjuWG/Q4wzR8R7+DrzsPpKZjD3ff
         zn+azu4BOAubT71E88GGXAhuWv3s3TdcbsccRSRRKFcxS9VU9Ljq96byV4XqC+mrof/S
         LD3w==
X-Forwarded-Encrypted: i=1; AKwUvBxyQxluGzgPaWDjAbKBBwdTtsOoyW8Bwz7lPU3L2b1OTOiobTSytQJ4PMFjGq5vlPDc2KDq8dxPsUsCTdFXmcHW@lists.infradead.org
X-Gm-Message-State: AFuF++lLM/7CXx2KIiRq293dnfFXnkFpgQpZOQBLUJ6c1GBSxJtE6ePc
	NpI4QyEfrHNJQS4fQyiRDmhFmZe/oc5jC4J3NVpYYj2l/2eSaalUZtNWyhQC1zH08IcIZckCPja
	AAp3EzYYOiA/+fbXhKA==
X-Received: from edbdc23.prod.google.com ([2002:a05:6402:3117:b0:6a3:65f2:cb6])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c111:b0:c26:1691:b368 with SMTP id a640c23a62f3a-c2a157fab8amr38402066b.33.1789679280144;
 Thu, 17 Sep 2026 14:08:00 -0700 (PDT)
Date: Thu, 17 Sep 2026 21:07:59 +0000
In-Reply-To: <20260904171610.3342398-1-tarunsahu@google.com>
Mime-Version: 1.0
References: <20260904171610.3342398-1-tarunsahu@google.com>
Message-ID: <9huzse37io28.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 0/3] Convert manual kfree(dev) to put_device()
From: tarunsahu@google.com
To: Russell King <linux@armlinux.org.uk>, Geoff Levand <geoff@infradead.org>, 
	Masakazu Mokuno <mokuno@sm.sony.co.jp>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Paul Mackerras <paulus@ozlabs.org>, helgaas@kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	sourabhjain@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_140803_314832_ED343BF2 
X-CRM114-Status: GOOD (  14.79  )
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


Hello, This is the gentle remind for picking up this series.

Please, let me know if it needs any improvements.

~Tarun

Tarun Sahu <tarunsahu@google.com> writes:

> Hello,
>
> As per the kernel-doc guidelines, Devices that are tried to register
> with device_register or to add using device_add, must use put_device
> on their failure path (not kfree). This series contains 3 patches
> for updating such instances. Same for kobject_init_and_add or
> kobject_add, call kobject_put instead of kfree in case of error.
>
> V4 <- V3
> 1. Added Fixes tags
> 2. update commit msg as per the suggestion on v3
>
> V3 <- V2
> 1. Updated the commit msg of each patch to mention about the kernel-doc
>    guidelines.
>
> V2 <- V1
> 1. Removed patch [1] as it is part of another series [2] already.
>
> [1]: https://lore.kernel.org/all/20260810162814.1398016-4-tarunsahu@google.com/
> [2]: https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd.com/
>
> Tarun Sahu (3):
>   ARM: locomo: Fix device reference leak on registration failure
>   firmware: edd: Fix kobject reference leak on registration failure
>   powerpc/ps3: use put_device() on device_register() failure in
>     ps3_system_bus_device_register
>
>  arch/arm/common/locomo.c                 | 13 ++--
>  arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
>  arch/powerpc/platforms/ps3/system-bus.c  |  2 +
>  drivers/firmware/edd.c                   |  2 +-
>  4 files changed, 59 insertions(+), 41 deletions(-)
>
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> -- 
> 2.55.0.979.g7e5102b832-goog

