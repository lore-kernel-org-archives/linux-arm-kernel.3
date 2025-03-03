Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0413C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLBj6Nghf9FYnNuo11fi/+8qslgqcWFcnrXMBRPEmg8=; b=cEMTbRAxPcdiaZVGyMCaoe+ug6
	i7He4Xs1rgfBFl23Sj4CM0XAvVQBbWUdh1YGsv3qUSLbcpfR5DVWIZc/Hq48szAGdDMmy9zSl3h4p
	ZF1exXIaCUxGMLUB3Nc3yfIGzKQkJZrqceHn8U0LgADMlxJg4YVwZ3zBGwQr8K9vZ4tYHwGw8FpKN
	0DD+ryHNHwBpiCS9ht10jpfi/8sO883E0r06BMIvh33hf/wgADkMfr9ffj083/TmpUzWkrZtq0w0Y
	IQDZk3NafXYy5sdE6S8wc1tU0CKW4LqG0tN0TTvRULaofbZb1oUxiBUsUfElWLqJC7D0Ay4W7Fln6
	QWOWQLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp584-00000000mOT-410K;
	Mon, 03 Mar 2025 12:42:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4bQ-00000000gqt-2cVr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 12:08:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 018E0113E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Mar 2025 04:09:08 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A6E323F673
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Mar 2025 04:08:53 -0800 (PST)
Date: Mon, 3 Mar 2025 12:08:51 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
Message-ID: <Z8Wb05rmGW0ORnJB@e110455-lin.cambridge.arm.com>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-7-marex@denx.de>
 <Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
 <fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_040856_782663_2CC17776 
X-CRM114-Status: GOOD (  20.25  )
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

On Fri, Feb 28, 2025 at 06:05:36PM +0100, Marek Vasut wrote:
> On 2/28/25 12:06 PM, Liviu Dudau wrote:
> > Hi Marek,
> 
> Hi,
> 
> > On Thu, Feb 27, 2025 at 05:58:06PM +0100, Marek Vasut wrote:
> > > This seems necessary on Freescale i.MX95 Mali G310 to reliably resume
> > > from runtime PM suspend. Without this, if only the L2 is powered down
> > > on RPM entry, the GPU gets stuck and does not indicate the firmware is
> > > booted after RPM resume.
> > 
> > That doesn't sound right. Can you tell me what GPU firmware are you running
> > (we are now printing the git sha of the image at boot time).
> Please see below. It could be some sort of NXP firmware fork ?
> 
> It comes from the NXP firmware repo , mali-imx-r50.2-710cfb6 .
> 
> panthor 4d900000.gpu: [drm] clock rate = 1000000000
> panthor 4d900000.gpu: EM: created perf domain
> panthor 4d900000.gpu: [drm] mali-unknown id 0xac74 major 0x0 minor 0x0
> status 0x1
> panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1
> MMU:0x2830 AS:0xff
> panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1
> tiler_present=0x1
> panthor 4d900000.gpu: [drm] Firmware protected mode entry not be supported,
> ignoring
> panthor 4d900000.gpu: [drm] Firmware git sha:
> 8e5cfcfec20cc8aff8509d37e72babc935d34a3b

This looks like it has been part of a R50 release of the DDK, which is recent
enough to consider it up-to-date. The issues you're seeing with fast resume are
probably due to some integration issues or other quirks.

Boris has the most recent experience with playing with fast resume, maybe
he can share some tips on where to add messages in Panthor to try to debug
your problem.

Best regards,
Liviu

> panthor 4d900000.gpu: [drm] CSF FW using interface v1.1.0, Features 0x0
> Instrumentation features 0x71
> [drm] Initialized panthor 1.3.0 for 4d900000.gpu on minor 0
> 
> $ sha256sum mali_csffw.bin
> befd23b9279b26010ebf35c835cc3aa7d0f50758930c7306ff4f5abbe5218624
> mali_csffw.bin
> 
> [...]

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

