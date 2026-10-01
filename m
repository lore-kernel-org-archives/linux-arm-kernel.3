Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C859DCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiIDTpci/0UJ3NCrt48cxrs7UcRvkm9TcGYKchYj198=; b=FZQ4/HOJN5NfWKF4GJE7sqUkIA
	lSiCZ+h/gAKrsEZbmI0ka1ZBOXxuXtTK6u6SpcEs6BJv12KUXoNAtqKQeoXPjuA23O/jt+6Jw2cyx
	KV8No6JdNxSLi+mgYYs750CfGlJh5GX4QagImT3FbhvnYNKooc/m2KtFQITG9Wh6RxYkIunTLX/NC
	A9xFldPu1VMvwpo03e+oTQdVJbAR587xhSNggoApi1BLUzWGrlSumkDf+eaCs3k1SJsQeicazQCvm
	QD4zBrry/xoljVkPqmzcbBpOx6nlC4SpMXYqDyGphabwqbN5EnYDYh3Wt6ZVFq9JnA3SlJU62IFbj
	MIMDEQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCD6-00000008B5C-2Hkc;
	Thu, 01 Oct 2026 08:32:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCD6-00000008B4y-0kiL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 08:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RiIDTpci/0UJ3NCrt48cxrs7UcRvkm9TcGYKchYj198=; b=Jb/WAXflUunMgjBmdgWcQe9rx6
	UJA/T8RcV1UamJAwgatcjK/GjHzTZkeSNbld0+axR/CmsjiAAXOQxVWyJrwK2YjAOk1YaxTF/JUDx
	wOlrPevXm++uQ82txFcesa9+dv8qPiETacDCKGjp4x13NS56UJrDQGXm/+eRra6EqBMazC9AJtUyT
	xufYBy+WeGP4jmKMiyJ2whDXIKwPbyfbwrALheOowiwe5cDAPNSzrgk4Y1LYS0cycT9xe7RKIR3oJ
	hsWsOFZ2Ir6ScBsa3B+jtGEmLPRBS+6MMCbON+02j1NhVuqRFGd92wF9SSvUugf09WM1IRTBOg7Gr
	JY/8Wjrw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCCCl-00000004jsG-18ev
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:32:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B50A01A109B;
	Thu,  1 Oct 2026 08:31:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81B8260341;
	Thu,  1 Oct 2026 08:31:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F0F4103290C1;
	Thu,  1 Oct 2026 10:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790843506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RiIDTpci/0UJ3NCrt48cxrs7UcRvkm9TcGYKchYj198=;
	b=sagW3Htt5YQwsJod0ppAZZLVo/HIbh2Wh1p3vMtfEqB4XzuMaoD5AyK9Xuqhjsglex+M6K
	d6GboCZyFgqJlMZx/6YAQ/YGbVbRnzF/QRgBYMIxDkxucLFdgQTFK7kiSTyH2OcmiZydOt
	cccMEa+DX6efu2rnGF1NSYK75PUxwZe91djO9sMyVvwWqi1k3ZSaKvhvSSfS4AyzCGrV8Z
	lzPuYHAJ/x6OL2dxv2lcoAoKWQvoySk7ekWG2AyInjDdfcaHesnl6/y18kaAcliFte1w5R
	U/SEZR0ZuELcN7FNSCQ3LXdMRk/6JwXjyWiJuEMWoEEcGGJtD4zg1voBIxS/MA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 10:31:37 +0200
Message-Id: <DLTD1D4TV8ZX.2PNM1B670T8UK@bootlin.com>
Subject: Re: [PATCH v2 5/7] drm/vc4: dpi: stop using deprecated
 drmm_of_get_bridge()
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Doug Anderson"
 <dianders@chromium.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com> <20260929-drm-fix-of_get_bridge-build-regression-v2-5-6da431d8f180@bootlin.com> <accaa9f4ad05ef73071e5cfb5368fcbdd394d3ab.camel@bootlin.com>
In-Reply-To: <accaa9f4ad05ef73071e5cfb5368fcbdd394d3ab.camel@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_093152_039609_84E5C8D9 
X-CRM114-Status: GOOD (  15.60  )
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

Hi Paul,

On Thu Oct 1, 2026 at 10:22 AM CEST, Paul Cercueil wrote:

>> -/* Sets up the next link in the display chain, whether it's a panel or
>> - * a bridge.
>> - */
>
> The first part of the comment is not wrong, I would keep "Sets up the nex=
t link
> in the display chain".

OK, I will do it in v3. This patch is not a fix, so not urgent.

>> =C2=A0static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
>> =C2=A0{
>> -	struct drm_device *drm =3D dpi->encoder.base.dev;
>> =C2=A0	struct device *dev =3D &dpi->pdev->dev;
>> -	struct drm_bridge *bridge;
>>
>> -	bridge =3D drmm_of_get_bridge(drm, dev->of_node, 0, 0);
>> +	struct drm_bridge *bridge __free(drm_bridge_put) =3D
>> +		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
>> =C2=A0	if (IS_ERR(bridge)) {
>> =C2=A0		/* If nothing was connected in the DT, that's not an
>> =C2=A0		 * error.
>
> It could make sense to go the extra mile and just move that code back int=
o the
> caller function, I don't see much benefit in having it in a static functi=
on
> here.

Why not. If no one objects I'll do it as an additional patch in v3.

Cheers,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

