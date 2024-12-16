Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0CCE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNU+E/bNUeoRD0tPsyKikGu5k6XwnbaOdrZkNOIjIhs=; b=YPOmQx984rG2EJJkNe/rBld6qW
	CAUMcZ/rkYvr4ngRTIl7H/IbSCKwTcO+UVsihLS0vPL2kfqBrkGyYsUl2Nzm+cAqs43YHOPDORy8K
	aXCIo8jykeVKX/GKNnoUqhqQ5H6lbbLZNmR4W1iV4AtQN2vdLMvJUgZeWZkG1PPyJxYEtd5nmMn5S
	1ryQWZZiXVyKNkrPxvfJZp7Pi6nkRr4F5Parg6a3eEv49Y/Ie+N2oXMjChvZZUoKBpyG/p0qBjySJ
	jFtEtzmoOBinTEnjTKhd+1/jjYvHKlamMsy+73KuL/d7z3eFsTOoN7b+rvlMpOD0SykKO8T2QCFaX
	psvD5+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFm0-0000000AxYP-2mVg;
	Mon, 16 Dec 2024 18:24:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEgs-0000000Ajq2-3Gym;
	Mon, 16 Dec 2024 17:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1263FA4127F;
	Mon, 16 Dec 2024 17:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C27C4CED0;
	Mon, 16 Dec 2024 17:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734369329;
	bh=BYWVPSTco7NxgCFt7PuAti5s7WPTbsps5ogniby27jM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=nd1NNY4qp5FoANXFQI8jCl/U7QtYaUohcli8BfdPGQhJzh01UHC+HcmogZYSsT7QU
	 69UXwbb6NkJd1NWQtrLCrkFZtUbg6KMHus5WC2vPghoUvpDKvhxFQcKMAIXVXtqBcJ
	 Urpm771eXTc0JS24NfDfDeNj3MWe90SEwqu9O+UnJbkbisJ88uWI7r7NYpIQHidcsS
	 iyv9asoeEcQ1G09ZVL9ay2P6aLFDDMdml9MVivVG608IoNQ7ugTD7Rrrhom82fog+m
	 uh1/lMkXyD4yD8Vvn8i3oalWIAS4ne4pmLKmdcxMTavYzcn3KZDXYXhrOMhrS6Gdhh
	 ZvBbn8M1/VcHg==
Message-ID: <05419690edbfe859f02d8675c57d3f8f@kernel.org>
Date: Mon, 16 Dec 2024 17:15:26 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 05/10] drm/bridge: lt9611: switch to using the DRM
 HDMI codec framework
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-5-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-5-50dc145a9c06@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Inki Dae" <inki.dae@samsung.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jaroslav Kysela" <perex@perex.cz>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Mark Brown" <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Russell King" <linux@armlinux.org.uk>, "Sandy
 Huang" <hjc@rock-chips.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Takashi Iwai" <tiwai@suse.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_091530_885562_0672DCD4 
X-CRM114-Status: UNSURE (   6.00  )
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

On Fri, 6 Dec 2024 12:15:59 +0200, Dmitry Baryshkov wrote:
> Make the Lontium LT9611 DSI-to-HDMI bridge driver use the DRM HDMI Codec
> framework. This enables programming of Audio InfoFrames using the HDMI
> Connector interface and also enables support for the missing features,
> including the ELD retrieval and better hotplug support.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

