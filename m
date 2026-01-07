Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7F4CFD635
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GDfbovA4B4gaevFaZr+4laNXhzTV2qaZDY6m6bQBFU=; b=cCrd725W7pB85muqCqD2P2Xdi8
	CA32wLW4v1/6KqvDo3m7Yn71FlW7JOGidy4vJmVoSwE6yvgPiytR5WjUR0gADENAOrsIeQRwnbfV/
	k2xKBa8pHUsj5hIm5f5BoIF9yXZbGp8rC6+HIiNpxyX3xIX0U8glHuwVaP9bWm54Z7CjjILbMCjsO
	Lu2Nh+F+8PMSuZlil7psUT8s7Gsmo+iK8OHG9aQahZYaESPxkXc0s040mf65auEi7PqHmd1xLDwn5
	DnyxwQRL7H1tI9PSpwclysTJqkKJVUHzY+ALuV3EZKQRj4fcsY/jDHCSzPT4liS1+cnY62gJ8mq4k
	VfZkqQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTZI-0000000F0Me-2aVv;
	Wed, 07 Jan 2026 13:27:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTZG-0000000F0MS-46A3;
	Wed, 07 Jan 2026 13:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18FA860147;
	Wed,  7 Jan 2026 13:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F18C19424;
	Wed,  7 Jan 2026 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792437;
	bh=hfyekdsHmWdQS0kJEhufEEa1Z3aDl+tOujQ3/cqxLFE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VybgdxEp6pxfAJ0W6fs9mZgmkhrybuLHyBke+InCoOSN7vrIISSGq1MeQuv6tlEys
	 ueW2YQw7cQC0mPhgGpEsHxRs2+k1PmFzlds33LY0KCNQhqYNRYWPQ0opfWWHyqXIRy
	 DvKm7SmTQduTdjZ0Xa+MA2YH1gv9/hfTLVFzNfCMIEzd9SO9AzbmRpm9gTlTm53N6a
	 KxofVLD2YhlF1rCAxYkJKg7t9pL+U7klKPHlikk0Z+zFTvMurqoY1+C138Ypmq7GNR
	 ZwIe+L/907iDy51Mhnuz3DOm0tYNTPtGSMisht6BChhJbuEKYDYkWjfeC2z8KRFoRJ
	 AbkyMwpzUC2Aw==
Message-ID: <a06a7221e2a0afc92b74c54962ea0924@kernel.org>
Date: Wed, 07 Jan 2026 13:27:15 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/10] drm/bridge: refactor HDMI InfoFrame callbacks
In-Reply-To: <20251224-limit-infoframes-2-v3-5-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-5-7fd3cacfefed@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Chen-Yu
 Tsai" <wens@kernel.org>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sean Paul" <sean@poorly.run>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Wed, 24 Dec 2025 03:02:54 +0200, Dmitry Baryshkov wrote:
> Having only a single set of callbacks, hdmi_clear_infoframe and
> hdmi_write_infoframe, bridge drivers don't have an easy way to signal to
> the DRM framework, which InfoFrames are actually supported by the
> hardware and by the driver and which are not. Also, it makes it
> extremely easy for HDMI bridge drivers to skip implementing the
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

