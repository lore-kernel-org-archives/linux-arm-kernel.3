Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F47DCFD62A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydK3cku6YJBzPCXYSP8tBGgpT2pTMNSRwdLZP75kEoI=; b=illrfhEj/56I05UJFK6YnuGQUD
	nHqFAfn6ba+0U1rm8fO5/URstOogqRtU97n9i/vOXWO1VrP5xrLnkX1jzESimY3ltaEDzg0G3VCTc
	vVW4yVkMt9RNUK8P1+PnFvJPLmHXciU4Q6UT1gRO7wteNmlYW+H3TWA92Fa3Eu0Wov5wgeNAej4P0
	Re/7xuiuvsqvpNX95Vr6q7FYiidNwElQbN66hp5IlHm0UYLPCyCPXcD/youK4NWlW8xokCg9Sb8uf
	LYX1yBya0HYO8shRXkA0+xftrTP7t5eBsLFoX1zBHIcEaQ9M8z4Pf7/+3NrwKN7+bsBM56FcEY285
	l62g/vRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTaC-0000000F0UF-2RAf;
	Wed, 07 Jan 2026 13:28:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTaB-0000000F0Ty-1Eqi;
	Wed, 07 Jan 2026 13:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1ABDA60051;
	Wed,  7 Jan 2026 13:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46121C4CEF7;
	Wed,  7 Jan 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792493;
	bh=TKVtYnPnQD/KzKy0E9YEdozPRAwFIjfCUKP8liHDliM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=dhURNNCfaS8MP8amX9Dbh0GoVJJ5s9X+uzzLxLADMs6LaZXJiTcL/xyPZN49A8Be2
	 WxKj0pkQwgICzIQpt4DfyBEN2907ll1pvYmex5cuR0P9bZLAqKmT4ikgWIUay6gDQp
	 iK2noXliZ2Cvba7X5Bm6+aWxtno+eheiiIHGxn4v6viF5GHCywyQPjhg+gWoGI3A4V
	 ohCwZzVrIg1G7UeR2VFZ6SJ+kjVdq/ArVWd+HEJM547aoldxzjTCtrFdQh2P9cFDJm
	 K+qkRC813XqTDe/aXr0rlPj0Cp/EiEVp4/ggGMv+BPinUsefuE9dy+RAZoMraz/AWJ
	 jRztjiQRcftbg==
Message-ID: <b9d355a21bed01af4ec1e4f087670a38@kernel.org>
Date: Wed, 07 Jan 2026 13:28:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/10] drm/display: hdmi_state_helper: split
 InfoFrame functions per type
In-Reply-To: <20251224-limit-infoframes-2-v3-6-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-6-7fd3cacfefed@oss.qualcomm.com>
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

On Wed, 24 Dec 2025 03:02:55 +0200, Dmitry Baryshkov wrote:
> Havign a single set of InfoFrame callbacks doesn't provide enough
> information to the DRM framework about the InfoFrame types that are
> actually supported. Also it's not really future-proof: it provides a way
> to program only a single Vendor-Specific frame, however we might need to
> support multiple VSIs at the same time (e.g. HDMI vs HDMI Forum
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

