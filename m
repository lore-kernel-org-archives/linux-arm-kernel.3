Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D949CFD620
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKnix1J6rDpZMfV4pAl9g55evDLMb0SWr/a5c7qFs2k=; b=frl9lFbPxgSgkK1gYZCB8qPh9/
	IkBKkSy4aHcJn3wPVSwOeAD91BZh4uLIQshA/T9C8T6+Y4uHjsbCeSxrGj1V8nmKOaD+9g3Tf9iZS
	/wGaE6M6z56hJbFhQQknKieJAxQTBwel8dDTXsquupgVZZ6kOSf0RzhW/6iw25czricO+QQtZYkid
	RkCT0DdnxQQoQcj+syptLrHZnpFcNpwVycS910WoRmp6g9AZgVbbSFEByOJweKqbNoeW/QzsaTdMC
	AbeYSrE/kx6go8oAnAXADxLSA6fvPDMad3AeISxE6ITz0gfSmr/+J5N/ciJM9TFzPtrRdd13TwT8/
	9G7wmrRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSx5-0000000EvMS-3FtN;
	Wed, 07 Jan 2026 12:47:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSx1-0000000EvM0-2X0q;
	Wed, 07 Jan 2026 12:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F74744180;
	Wed,  7 Jan 2026 12:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D26C4CEF7;
	Wed,  7 Jan 2026 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767790067;
	bh=187QeaYOCJ9bxj/owdya1F/qotNUlNFLu04+ah4+UhQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=OOWbVaP4Grpkvk8qeJu/gFqhaeXjRRFxPHKu84aFwOgDLJW/sm33qZ4VvDqenf5dr
	 WpKlTlqmt3ddOxc91KUW9clzq/di0sQuAnKbESTGAJRGMGm2acjxzynTEekuxDmE4I
	 71QvDceGfrwauXBlfv/AAx+dxKRshIyq3o8iqcboVDrcWSIClEHZqxH/+x2QRUirpV
	 FeyQkUIi95ml+FwsDw4X0/4gDPTNvdEAdodTmsgEVv066v3rJKDB+DdVqLjhRj0Dx9
	 2F3PMmS07tCcm9KWspeKNPibyk0Hy50fVF8uBeudxl3cl9DyINHHracdJJ17q3zyG4
	 FFLJ/1tRZ89gw==
Message-ID: <6ae21650d05e50b1d13d72617d6897c4@kernel.org>
Date: Wed, 07 Jan 2026 12:47:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] drm/debug: don't register files for
 unsupported HDMI InfoFrames
In-Reply-To: <20251224-limit-infoframes-2-v3-10-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-10-7fd3cacfefed@oss.qualcomm.com>
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
X-CRM114-CacheID: sfid-20260107_044747_685388_C4F41755 
X-CRM114-Status: UNSURE (   6.58  )
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

On Wed, 24 Dec 2025 03:02:59 +0200, Dmitry Baryshkov wrote:
> Having debugfs files for the InfoFrames that are not supported by the
> driver is confusing, stop registering those in the debugfs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

