Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B80C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M301KG+Yn2DPBFpyXd5yWuZOKhpIbr1GRV9O2ajFsG8=; b=QgjjuzzTudiDeyA3tvnW8ruPWl
	BFv93WO+bWbmQLgvu3k8oQhXmarGrm3naQtA41Y8sWLvAGledDE6rRPuNH2s9TfdqEmYHui3PmicE
	e7ZQQcc3t/NCJLdbW0eEJxDNcZBwo7d3DCJenQ+xkfQY1X4GGdOAJejSbcanMu4uxjPREH2fdZ5/H
	bdTFXOPbdmWro3tlfhPNLZLksLOWE0/AXui1PabkJ5Z7SWF4OCj5u3PyR2ely/kdFTxthUWtj67HQ
	jLsUx0t1ZidXUfMW+acvQPQbYhEEYmg3RE9aYJWzI1WI5oVGz+W1Hf8yMqtlvatazbb2uArFg1DFC
	iB6zLDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uTn-00000004QsW-2Q3Q;
	Tue, 22 Sep 2026 06:59:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uTU-00000004QkX-2ljW;
	Tue, 22 Sep 2026 06:59:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AEDE42A89;
	Tue, 22 Sep 2026 06:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C8A1F000FF;
	Tue, 22 Sep 2026 06:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060372;
	bh=M301KG+Yn2DPBFpyXd5yWuZOKhpIbr1GRV9O2ajFsG8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=aiZ+PbTPgJGbXcZlADTpqJYNp41C5ZZ7GqNlt2I/HhsbhwezCOltkNIJvgNuDpQCO
	 ZOTB4sa7VawsPaFWE8d5ZSgZY8OdVSWa/R3obpbi2Ca/bwN4v1pCGyaQVVTUtt74FG
	 Wu+hbvpEfaE4hWmoMBPLSK+ezCu/Lawb/VA1JQeVVQyV76IOxH62JmQ3jfCRslUCCx
	 OaF2VVxkgtLPCwVwNybSaPXGE1C9OMKiPckyx6T1mciPmivusb+SsxrwMCU/Yg7f4J
	 7teSXT4/m1DgSRROwZQvysEOiKuL+wrUn508OvPqeIJvJcZ3+951GuuFdAWKEpe7sY
	 euwT19TIVVt3g==
Message-ID: <e90f4eb03768e503215c0607774b15cf@kernel.org>
Date: Tue, 22 Sep 2026 06:59:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 10/19] drm/bridge: waveshare-dsi: don't create a
 panel_bridge
In-Reply-To: <20260916-drm-bridge-every-panel-v3-10-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-10-83afb4f1a707@bootlin.com>
Cc: asahi@lists.linux.dev, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Albert
 Esteve" <aesteve@redhat.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha
 Srivatsa" <asrivats@redhat.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Linus
 Walleij" <linusw@kernel.org>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Randy Dunlap" <rdunlap@infradead.org>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shuah Khan" <skhan@linuxfoundation.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
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

On Wed, 16 Sep 2026 15:45:34 +0200, Luca Ceresoli wrote:
> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
> 
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_get_bridge_by_endpoint().
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

