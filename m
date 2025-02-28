Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7A0C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzwK/2ndWQXM//wMkO3/Qdh0k5btOjmnwFacXzTF3kk=; b=RsR2d8hYkkrfBrW0e8RxEc5Or9
	FwzU890GUT7popDMXpii2TwvCdGz4Ay+3IXvIcgTCsKCluJFEXJLO3M9jdgDYqVDiHCODmIn3pFbz
	JuVi5tLtX9a4MkYiSrqXaXlra9eeqRu9pfZRZz5wwqreDkGcyCyh4iLnBqqMqnicxtWskfgwRqBoq
	LpUg6PiwI31IGp4plyn7s9yZw1xjVvBRh+2VjMy7GlkfpI8VgzhH25687b7zAZHXbbK9Ff7hQabxO
	kK7g9ko2oGOrUDkqHrJfWTZSo97xwzBME98VW/Y9qE8cpg92P3SUmHpODA4cJRAUYD3tHWHT/YkHl
	Z2O5yoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Gq-0000000CBo9-3HBO;
	Fri, 28 Feb 2025 18:39:36 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to54r-0000000C8Gn-2ewq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:27:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5774102901CF;
	Fri, 28 Feb 2025 19:27:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzwK/2ndWQXM//wMkO3/Qdh0k5btOjmnwFacXzTF3kk=;
	b=UqAzTE1pv0PeVxUpgwyNifM7y00xjUNJN4kveqUsZWhjsvv9BBZ/tGHxzkOoxlIagi7zng
	Sx4XYnp+RdTovBJqeY9uBOfrB6cvIojqmjjf/En0Mb4VGAbwK3WsQTzGtuB5z/Hsrk1H9s
	W+CK1HF9pIltglnooTASo/kHxjrTcNLW9ohEW4eWvXiwKcm95QcGUm6sXD9p2vzyv2w/Rh
	fYEWNEKW4MSKNGiqwkH6T8W6P8p+JNgNmn3mGaW/sPLGGioHH3EASHuLB/2Lqhed/mGqE0
	XzIVf6/L1g6loiGJaZ0HRNe+GEwu/XGwqEfHlhEUkAoGpxM/uQGx0QJ1ZeB3WQ==
Message-ID: <fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
Date: Fri, 28 Feb 2025 18:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-7-marex@denx.de>
 <Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_102713_816695_A97441B8 
X-CRM114-Status: GOOD (  11.33  )
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

On 2/28/25 12:06 PM, Liviu Dudau wrote:
> Hi Marek,

Hi,

> On Thu, Feb 27, 2025 at 05:58:06PM +0100, Marek Vasut wrote:
>> This seems necessary on Freescale i.MX95 Mali G310 to reliably resume
>> from runtime PM suspend. Without this, if only the L2 is powered down
>> on RPM entry, the GPU gets stuck and does not indicate the firmware is
>> booted after RPM resume.
> 
> That doesn't sound right. Can you tell me what GPU firmware are you running
> (we are now printing the git sha of the image at boot time).
Please see below. It could be some sort of NXP firmware fork ?

It comes from the NXP firmware repo , mali-imx-r50.2-710cfb6 .

panthor 4d900000.gpu: [drm] clock rate = 1000000000
panthor 4d900000.gpu: EM: created perf domain
panthor 4d900000.gpu: [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 
status 0x1
panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1 
MMU:0x2830 AS:0xff
panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1 
tiler_present=0x1
panthor 4d900000.gpu: [drm] Firmware protected mode entry not be 
supported, ignoring
panthor 4d900000.gpu: [drm] Firmware git sha: 
8e5cfcfec20cc8aff8509d37e72babc935d34a3b
panthor 4d900000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0 
Instrumentation features 0x71
[drm] Initialized panthor 1.3.0 for 4d900000.gpu on minor 0

$ sha256sum mali_csffw.bin
befd23b9279b26010ebf35c835cc3aa7d0f50758930c7306ff4f5abbe5218624 
mali_csffw.bin

[...]

