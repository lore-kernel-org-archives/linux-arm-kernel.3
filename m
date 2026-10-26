Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F72606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=So2Qiy4d;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=QWZhw8w4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UmXjLJOP0mzdBm7GFoPR8yYMqhsvVQOQgwUqLKU0OJM=; b=So2Qiy4dnyn4a/
	bOIyl/rc+snKyi8yv6acp+FXysD6JZFW4iT3Jelnol05EIiv1dXL/EHAilQ6gtmgyL4xzpCjhYNPB
	RF1tbOc+gg4Gxk9TmofHq96slP6/Z9kS2lwylulzAX8kJ+eI/3BoF2na+HZmTFByGe4ldHP0Uiscu
	NRnr1SdDnNDqf6AvYeSC0K0Qlom6b2vx3llVmF4YdtR3a4+e4PxVjc4eqGtpJA8iXOiYXrwk//Pfw
	skxMjQYeT00BhT6d0pWPGs24uFjsMXct2ybxUSkiMv4/5b7NVzdQZJmnGavdpP+POZyhMK6zhw+ai
	fVIkZjQJd9/FtymJ/Z0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH9L-000000025mM-1e16;
	Mon, 26 Oct 2026 09:37:51 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH9J-000000025lV-1haw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=UmXjLJOP0mzdBm7GFoPR8yYMqhsvVQOQgwUqLKU0OJM=; t=1793007469; x=1794217069; 
	b=QWZhw8w41+a4kOuxG1p3BX45Tc3xsasC2I8+s8kM/cDcjTDueHdyrzPj4PPaxI/8dwuIHAnFKoO
	eyP+D9gFE2OqrVkI3F1Sr9vSUrbNiCRJguXow0pmNnUMgnDrOKwEIJr0Ch+H+NW2K55Q3aVje2pZa
	sWW8ieoK9+W+pVbVS4ZKe4kwUUStNPwtNVHETgQGvwxnuVJcAn0K2FSPuX619IWaK5sZnf82n3dIr
	UO/eCR1mQIN3fCQ2c74Qwr1iiqIpAljSVYv3UiPRiHuUr6JEKNnTDCBnKajFxI1IVGO9L7iJm1fTf
	NRd5w5SkW/8p858TaqV6K7ocsFTxeoxtSzcQ==;
Date: Mon, 26 Oct 2026 10:37:30 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Alistair Francis
 <alistair@alistair23.me>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] sy7636a: power the panel only during updates
Message-ID: <20261026103730.3a79c2e6@kemnade.info>
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_023749_448301_1AC14D8B 
X-CRM114-Status: GOOD (  11.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 00:39:11 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> can not power the panel only during updates.
> 
Yes, that is the common use case, power things on, tune update process
to the temperature, update, power off. So it makes completely sense.

> Read the temperature in the regulator driver instead, as the TPS65185
> and FP9931 drivers do, and remove the hwmon driver. Boards that relied
> on VCOM staying on mark it always-on. The regulator also switches VCOM
> with VCOM_EN, gains VCOM voltage control and binds to the I2C device
> directly.
> 
> Tested on a PocketBook Verse (B288).
> 
Which kernel do you use? Just curious, maybe some further upstreaming
actions might be coordinated or cross-reviewed.
There was discussion about in-kernel hwmon readout interface like it
exists for iio.

Regards,
Andreas

