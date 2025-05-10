Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7D2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 09:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0WvBWcRaJqlD2szj6a2rYDUoL1UN49lZxJeaXuaiUU=; b=ElT8709bFlyDIOiftUgNVdcFh6
	BTz7dnjb4KT466F5eTyuAjpsbj8LV32s7YXi1Shi7+P2SDV8uXuobzlYzouVxYDBg1hMLh8M0NtxR
	ofAIlrsN2V7k0xXyaOayxOnPIlN8RMC2UVFAQBw7HdNLybytPxtqK8YiRZYVlnAXGpcHd9YWUJAzY
	7BDv3ri4GsxRJpsSniL6jfY/C+AOvzFZKgnL3GTHKVjwJPp1HvDHHrzCKDfwcK9q8y4KinzHJ2jbf
	EGXzBBMdY8bCCPyC8JR4OhTiQZlahanZP14MC0KEYNjiGqO4Kcm3h81wBky+aWFXMPcmxOWiZE3cr
	JZsqkJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgPx-00000005jqa-2UfE;
	Sat, 10 May 2025 09:22:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDgJQ-00000005j5R-3hY8;
	Sat, 10 May 2025 09:16:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3337614BA;
	Sat, 10 May 2025 09:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD385C4CEE2;
	Sat, 10 May 2025 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746868563;
	bh=N0WvBWcRaJqlD2szj6a2rYDUoL1UN49lZxJeaXuaiUU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=VvYmN0+u/+1ASx2sAgrFMXwxnbL4R8LTOb4fp5TRJiniNv7KQl4+Ko4mrQqrrmSiv
	 aIJZpmqGS6WATO9zy7I4vWEcUrjRedeUn22W/+Z64/vXNQB0K6K2DOfyap4M+hIkQM
	 bVSL32xrhuFlldAJlKiev8inl8mb6ymCVkXdehHO+DbHWmmFEctDdkzPJjjSiND8eV
	 c7SzIiOVfp/y0EZ2iv6Jk1GPLKIC3eudGEY+06DAuceIuoFBMJPPdMJrkf1SSOP2QY
	 uEdNQ1ZHxAeU13oIdbeG0Zqd93huOcbCF3gB2LNDuRmTaziGz5ij6FyhXHkj9w9DZ+
	 6XSyjUEIUexLQ==
Message-ID: <13d5e1fbe12e289da1d1e5184eb5277c@kernel.org>
Date: Sat, 10 May 2025 09:15:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 20/22] drm/bridge: add devm_drm_put_bridge()
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-20-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-20-b8bc1f16d7aa@bootlin.com>
Cc: asahi@lists.linux.dev, chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Douglas Anderson" <dianders@chromium.org>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Kocialkowski" <paulk@sys-base.io>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Fri, 9 May 2025 15:53:46 +0200, Luca Ceresoli wrote:
> Bridges obtained via devm_drm_bridge_alloc(dev, ...) will be put when the
> requesting device (@dev) is removed.
>=20
> However drivers which obtained them may need to put the obtained reference
> explicitly. One such case is if they bind the devm removal action to a
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

