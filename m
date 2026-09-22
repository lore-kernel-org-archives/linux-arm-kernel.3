Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FAEC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3b6EWEhzvq/NJTt1sEIs90/NGjvMCZOKXCFRGdB+dE=; b=gc54Av1zBwzf89K+tn/RAojI/+
	cqu86XxGmKRkf2uuN8BwK3zMxOl3p6c3NJw8nWLH/Qk/SfMnnYEwD2u8CQM47zr2VMXtG81awUK2o
	Q2Rc9LINPuWBlspq97kZSBs92VK+JjgygGT3M+zsCwn8buwBD4rje3Jfpf0uKZFu/Mmc0OIRAZnXU
	Okc+FMziaFV1FbABkvTOVGKdtQ4+mqlh3PnJzrJdifgZ6hnkydt4m6sjk2V3ARu8/xU5x8AYQvFUA
	xbBmh30CQ4fLC3xv/p7Jk4pvxc7YzsDm36sOSowXyXdp4IdNY3XC3O4PHwrcGpEVHU1QUl+J+ZiwN
	LhLhhwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uRd-00000004PxQ-3KSr;
	Tue, 22 Sep 2026 06:57:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uRd-00000004Pwx-1XcJ;
	Tue, 22 Sep 2026 06:57:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1566741A08;
	Tue, 22 Sep 2026 06:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391A71F000FF;
	Tue, 22 Sep 2026 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060257;
	bh=N3b6EWEhzvq/NJTt1sEIs90/NGjvMCZOKXCFRGdB+dE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=YfBPXFG5JrJMz9tuRCmbAJ9OyNILSp6E1sv1UvRowuSFRcWHDtbSfeOkjJ5EM0POF
	 UuvbgJZirT9M8r60bMwAP1KAEbja4I0W+RZmGYkwrBIhMM2EGa6kK0WDN3ZzprpgUq
	 OEUmoqYl5Wvd2rBPUhCYMI3u7lwXjfNWzqx6QkSlbbW5Ck+l6zk2CBKgek6LZM1wMB
	 7Ou0hw6GZdRhsVPRrv7iMMXJG8zjN+xPuy3MrqKlEBpurCKky35Kk/RigxeHoBBpBz
	 n8FZ4a8yh35aj+P5pHEhEOaxgMUnpOkIWhsUNa3O8aJT2No7PoEyVWdzmelfns8K9q
	 ZIAD6tYeAuEfw==
Message-ID: <996d8812a53307ad7937f0c09c872cfb@kernel.org>
Date: Tue, 22 Sep 2026 06:57:33 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 06/19] drm/bridge: remove devm_drm_put_bridge()
In-Reply-To: <20260916-drm-bridge-every-panel-v3-6-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-6-83afb4f1a707@bootlin.com>
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

On Wed, 16 Sep 2026 15:45:30 +0200, Luca Ceresoli wrote:
> The deprecated devm_drm_put_bridge() function is not used anymore.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

