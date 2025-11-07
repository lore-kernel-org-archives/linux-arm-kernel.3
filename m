Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C006CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg+/cSmWZ3S0pISvENcp84Pxt0oIzICkqotwu2cofT4=; b=O4wFgC3KAMTWC+nPVPTcSPCvm1
	kjUOc79fmkuRlFuD7EWX9mfAd1OyEVhLG2zJPbFqHxZ67Xgb3XN5Yoa4oU5AsNaDHLQk7mx918jqQ
	jAn6ClAEcoboZeQDVU8k/ycm2VIWvAVtR8k+ZroNh2Vv4E8IxJY4kGp69XD/sSVzwfWAckJKykkTT
	eEy2OTKC+m47ygpFTkcTIQgfvh2S5MkOxSnOQDG2CS8Rqt2k8HX8UWkipHpdhOwWmZZZ/j8KaTVV+
	zTYgahhWPCUVE3Dkz3g6mtoDInZIS1VNbSPkOXk5EPoN0Rcs6lQTe2hOWrO+Beh3xHMGrRThbWH0A
	uViYWmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQYU-00000000Kkx-2J2v;
	Fri, 07 Nov 2025 17:47:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQYT-00000000Kkd-1M9d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 17:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B321961913;
	Fri,  7 Nov 2025 17:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B71C4CEF7;
	Fri,  7 Nov 2025 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762537640;
	bh=Jg+/cSmWZ3S0pISvENcp84Pxt0oIzICkqotwu2cofT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgrlbcpeNMyuSBzVJ/24KfJakT1KJ5Rk75Ti6+p+3gxKmupwC9NqmAszXV3M+OlLk
	 K0gOAHVOF9/FRq/f+M33yLVDGpP+SXUcC48KqI5OPCAFY5ygZahRT28Sn6r5kG/tI4
	 51JhTBK50mO01g/+AgXzqfbeiJGrUyQ+KTBoWIy6W1TPXZ7O/CDYCfGlGeJUPEL+6F
	 1S5dlvzkmxaLLaTE0ARraLJO0D3xo77z5OxRRViI3yz3z8xzc1ZFcqtUj4lH7fqB+B
	 A50s21Br7ar3hlAIEN3xMo//nOVBKvIo7L77VzHtjm1hzf9SrJr2753heWG3R5Z6zU
	 H03pYVM5nd92w==
Date: Fri, 7 Nov 2025 17:47:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/11] dt-bindings: panel: lvds: add Winstar
 WF70A8SYJHLNGA
Message-ID: <20251107-cubbyhole-certified-2de627004084@spud>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-3-d8233ded999e@solid-run.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9f64Ubgv4dqrvjxG"
Content-Disposition: inline
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-3-d8233ded999e@solid-run.com>
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


--9f64Ubgv4dqrvjxG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9f64Ubgv4dqrvjxG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4woQAKCRB4tDGHoIJi
0lYNAP982+xPMTBA8hmMHUV0GMWimASaZ/P0l9HC8fXdcwGPNAD7BF9R7aUisARG
9v0SFmVQrHfXao9nLlNa46MCEI3asgU=
=tZOE
-----END PGP SIGNATURE-----

--9f64Ubgv4dqrvjxG--

