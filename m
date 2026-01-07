Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B608CFD632
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pn+kqCPWueZrmt5TpLjDJUYpXBBfe00TA3BTkYqMUmM=; b=Cf+wZ/RAA0n+dXsbuF2IpAR8Zt
	Z0btV0Zi7o9i/cjjl6Hy4sOvQu2eVQra6CMVIkcU0WSpk1P/zyZhcpZIjWrQYktG3lhihaQKq/hkC
	lt6mHdHUdqOFMpQn8USV6nqJV/xeVpqbJ1QeAMQyNGW5lmnhfflJyPumWerIcnqFUcQi2uDxCkUYG
	bw/OoqBMYG9iGOTaUCprxSEd5k6ItQNreDzDg6vcn9yqZrhBf1ywbzE27GYqV4scBkO4fliwobAe5
	JX6bgYOwhVc2+1ooSgWmWq3fIePjOnRCjbHmBuwTqLX1lUaLju51VoBgk4c6pvmaNZgwKQ6pgHaph
	6hut7acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTaw-0000000F0bk-1vak;
	Wed, 07 Jan 2026 13:29:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTav-0000000F0am-0BYA;
	Wed, 07 Jan 2026 13:29:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5998841AC6;
	Wed,  7 Jan 2026 13:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7015C4CEF7;
	Wed,  7 Jan 2026 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792540;
	bh=PK1j6ce4GGTcpSge6J8AMXbZ8tvdblBxTwzpEYOUGQg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=TwpQDEJFw9eder+ACSMDQ+hh2IXQJhWM0qJedRQIGlwhlYpFPOIDu3w6JzkhZmfY5
	 v7cTyCpq5tlIbdCoMzYuktDk9LGEXCaxX9PvaXYDi4AcoHI5jSuVxSAO1q6Aehh2rL
	 J0fb80OArKVpkly5vd3OjFrcmDkHa0OZlI5XLW4L6Cjutsqn3t2x5K80tG4JzT3TWD
	 l7lIzuapfxCX7EwlxlEkujyT3ZJhmNgvCOVh0c2BeIKs1+AEVAKzR0nuF/6G+Jf3Jt
	 ukrAVsD7OELbx2WZjiav5Qp8x4PeztEzKyp0g/WkepHIoYQuMxPA5/AJVMZvzEl/36
	 V53gwahHgJWZA==
Message-ID: <5418c64c7c32a5bd651b097a47d28e00@kernel.org>
Date: Wed, 07 Jan 2026 13:28:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/10] drm/display: bridge_connector: dynamically
 generate HDMI callbacks
In-Reply-To: <20251224-limit-infoframes-2-v3-9-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-9-7fd3cacfefed@oss.qualcomm.com>
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
X-CRM114-CacheID: sfid-20260107_052901_108237_713A9B21 
X-CRM114-Status: UNSURE (   6.15  )
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

On Wed, 24 Dec 2025 03:02:58 +0200, Dmitry Baryshkov wrote:
> The rest of the DRM framework uses presence of the callbacks to check if
> the particular infoframe is supported. Register HDMI callbacks
> dynamically, basing on the corresponding drm_bridge ops.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

