Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F92CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OOaYEK0aDqTPEHL4pg9nl6lumOlvK4fhFHxH/uBU2I=; b=Byy1Vx3s0cZYNmi0BMu+YRN8mR
	QZcKZTc3l2R1tPKDYfvTO+gc+3sIiNEgVhcPjZGxt7NvB92MhhmQvnvqbB9kXve1ydBkZ/dxUhIsM
	LXLUO/jGjbT2JTCirrSATWz+EdILWfG2iFakDR/4+xQ5hcNy2M+2pNreoz2D6gdY0qTY+3XZ/pNCO
	lt8+7OqHEyxYHPsgTSP0EtivjjAIIvLzIDmbjGh55jbEyJyab0rlyJ3sXJMhxV4EwAkWY3mdSZt3V
	o/LZeXMcr1y5Om94sRU/qef69GyFtv+OtGyaZwGnjvM7mg4xM/frG6hk5X2y0c3gsF5veNF+OmC0r
	hlhtRWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmGp-00000001jLT-0ThL;
	Mon, 19 Jan 2026 10:14:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmGm-00000001jJs-1KOX;
	Mon, 19 Jan 2026 10:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34B6143D9B;
	Mon, 19 Jan 2026 10:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D94C16AAE;
	Mon, 19 Jan 2026 10:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768817639;
	bh=NYdJQrmH02NA6Tbg7YbuRjFQaGimaDqIcuD9t2JJMBQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=AeDvMHo3DwRyyOwsOt3Jiff3SJaHaI2TfoOMnycd8ue94ufW3X2ZpsF5JcszxdXUc
	 99hNu2JtkOZ5cz0f9co2ywnQRG4iUmRAcalXQa3PXdAGi9q7O0igqVcMNLB24CJ/7N
	 U8w+R/ohSCTb/vVN1uKOeBRoEwuttAp7PCPpo/Z+z+AT0rExbUyP6gEo8P6xV9Dq96
	 qxaw406z3/DWloyzjHoWvgxE7taQOk8S58Btjo1yeiT8pzUrDxq0UPsbZSXHi/ppnN
	 Q1nJ0ThhOIm2KrJ7Hgqhe9cG6X2Yq6c+T8vVGpA78L/RCzsCY/wHLLT2Xh1G7ITpYm
	 UTSrxZGZkorMw==
Message-ID: <12c1669e5947ce144bd295e5a26a93da@kernel.org>
Date: Mon, 19 Jan 2026 10:13:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/10] drm/display: hdmi_state_helper: reject Audio
 IF updates if it's not supported
In-Reply-To: <20260107-limit-infoframes-2-v4-7-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-7-213d0d3bd490@oss.qualcomm.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_021400_402836_967E8450 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

On Wed, 7 Jan 2026 20:15:04 +0200, Dmitry Baryshkov wrote:
> Updating the InfoFrame if it can not be sent over the wire makes no
> sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> an error if Audio InfoFrame callbacks are not implemented.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

