Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3200CFD623
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1v+fLths6nWCcuuuZ6bvIxBDUt5HyaBgIUGRnX+8uE=; b=sGw1OL/viG+fcBV1CDj+cqMInM
	fZDxR6ZekBDhyYCFQ4TnNNwG65usLQnVN5I0wVx6tMWlAEz3+kE4qvlEoWVQHm1IJVV8YJAUA1XEY
	w5XN1Dx1PVfqVnBgo0/cBXOThnlh/NzSvZ8PUCCknZcNbHCffHXBtU94P87DU+gSc7cA8OOQyEov1
	9vqxKb/8NYndNihZ+dPhZ+EYKr2gDOILN6mi+8rNVp4Zs0UNTfIgBT8Tu0PRtH++XeasFmqgzl73S
	qQ1NpvK+mzRJFvri/N7D0BMqEzJoLn9i/dxxJqBB4CmIPAMrpom7aWImrNg9611KNzb7Is2/59XW6
	qSAo4Mzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSiA-0000000EuV9-21vn;
	Wed, 07 Jan 2026 12:32:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSi7-0000000EuUt-3Z4w;
	Wed, 07 Jan 2026 12:32:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E94936000A;
	Wed,  7 Jan 2026 12:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E98FC4CEF7;
	Wed,  7 Jan 2026 12:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767789142;
	bh=2Nqjd5umGqQTshG/6KasLg0SyW2HMZV1B1Lxjp2ecFg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ivCOlkKs/3FPom4CAQW/8n5+RtJ+Ktgpa46WuEDsbvA9PTBeWuC7vV4+xBeDgQh6I
	 F+ikAwBIMxkTYm3UK5stlQN0iulvCSSl6E2JV1u4QXCSkGcTAkSB2mkHdzw/EdIDvc
	 FUSAzwPfQKz6h4ZHo8/hDOFRATtO4FNaGq9u8a+Hb0DB/mfzr37+BspAyH9jtluOP9
	 BThkvDxk9LJUGONm+dsYPaEtV1NScUVsoM3A4nX+KbKavoAkonyRlYC4BOBp/n+kNt
	 uNOpMaeFLn9fsFJzYYAUv+hgwkrlZmLWtZDdw79Ff4blsc6mcmnifNIw3KUSZqGA+X
	 RP1wITi7KGfyw==
Message-ID: <57ad1884d9080ebc37abf8b96ab71abf@kernel.org>
Date: Wed, 07 Jan 2026 12:32:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
In-Reply-To: <20251224-limit-infoframes-2-v3-4-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-4-7fd3cacfefed@oss.qualcomm.com>
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

On Wed, 24 Dec 2025 03:02:53 +0200, Dmitry Baryshkov wrote:
> We already require both hdmi_write_infoframe and hdmi_clear_infoframe
> for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
> the clear_infoframes callback for HDMI connectors utilizing
> drmm_connector_hdmi_init().
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

