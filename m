Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE53CA101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sqEiKEPfpjIjaLh3x1IaYvvWhZgSYs4b16QXZYZKsE=; b=STrHXo4FIQDL1Ra+552ilwsvAC
	n9KT2JVFmAuECfE2sJGdEtjmaJN4OeYTVU0IuJbTxEjZVyoHoPNjH8YTWWYsLp0iYEMCWFjUnayBW
	wI2LDWRVf0NimV7SVTuDV5EHlujGykdPFuJDtvQ+sqKRN3GUOahox/eq7SIyu1GrUFASlBFMvTXJa
	/Q6Ioj9Px2U+xv8A5Uc//emw+PFym9Md1FAuHHQixySYH8Kue30Li6DG03LejE+Ql0If0xJv/25zU
	mHE9nCejQ2dVY8cnb/f5viKT8WpciUeMC4NVKK4fZ+oVKQINkeQumbVGGqf0Z/IDzzM2owRvm7SuB
	E2G174Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEke-0000000DawB-2cRP;
	Thu, 04 Sep 2025 18:32:04 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAOP-0000000C0xp-1Shy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:52:50 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHgsS0KXcz9tRM;
	Thu,  4 Sep 2025 15:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756993964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sqEiKEPfpjIjaLh3x1IaYvvWhZgSYs4b16QXZYZKsE=;
	b=BjckCSaVvLxdM6JfXq8jeTi7phlIQw71ena4GzJUXYlc8a6jDL7TVdZOWQ2pvKGQuPCIhp
	ikxEigM6lZAzeHO7x6qu54yCbFuZJXvgV+YQnV/I6W69vKHS3S04W5gzmsBdXIcjuoytSo
	RhjHJAYGnEOvusE5YLXBKOQBDE9tLHC6qRsE0mbh6bHdC+eEaGdG+ayt56MtaD+f0YEgep
	+T8gL+IUsy85FIhuOkAvxIb1x4WdxuiFgtJZnDIPiNLSw2ylUJZ5jcu0gzrVUGNN6/zK1c
	Z+c7qQe7pqavwLrr8pBV6Ogwo6lY4UOkGZzAq4gniN4NfY5ezAz7qXH4dd0beQ==
Message-ID: <52e3c5dd-6952-43b5-94f9-43f30734680e@mailbox.org>
Date: Thu, 4 Sep 2025 15:52:38 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20250321200625.132494-1-marex@denx.de>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora> <3372501.aeNJFYEL58@steina-w>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <3372501.aeNJFYEL58@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 963jdt3ncpa8jjh39d33r7supr6zwjrz
X-MBO-RS-ID: 7589421d111ea690b65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_065249_533075_D8F32E5C 
X-CRM114-Status: GOOD (  13.74  )
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

On 9/4/25 8:36 AM, Alexander Stein wrote:

Hello Alexander,

>>> Maybe the GPU remains halted because
>>> setting the GLB_HALT stops command stream processing, and the GPU never
>>> samples the clearing of GLB_HALT and therefore remains halted forever ?
>>
>> Exactly that, and that's expected.
> 
> FYI: in a new release of system manager software (starting from lf-6.12.3-1.0.0),
> the GPU reset is reasserted in SM software already [1] and access to GPU
> block control has been removed from Cortex-A [2]. Starting from B0 step this
> version is required AFAIK.

I don't think the SM is involved in this, because if I do the following 
test, the MCU also fails to boot unless I do a reset:

"
diff --git a/drivers/gpu/drm/panthor/panthor_device.c 
b/drivers/gpu/drm/panthor/panthor_device.c
index d4d73eebca49d..fd81cd2654111 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -642,6 +642,18 @@ int panthor_device_suspend(struct device *dev)
  		panthor_fw_suspend(ptdev);
  		panthor_mmu_suspend(ptdev);
  		panthor_gpu_suspend(ptdev);
+
+
+panthor_gpu_soft_reset(ptdev); // needed, else panthor_fw_resume() 
below fails
+
+		panthor_gpu_resume(ptdev);
+		panthor_mmu_resume(ptdev);
+
+		ret = panthor_fw_resume(ptdev);
+		if (!ret)
+			return 0;
+
+
  		drm_dev_exit(cookie);
  	}

"

