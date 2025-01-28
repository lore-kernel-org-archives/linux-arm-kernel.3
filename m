Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19347C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnb56eRKF5hzNuJx5yXUNOAyLO46ZpeBFXZbwCQlNCg=; b=TXVcCUtgOht8NG+e91LfGRcFJf
	OWP2cz+8kaSE3ymOzoNcT0LA73j86e0C1RSDWfvu3gUZkAXbzJdtERfYsoyaAQuubaDiyTEyZtmGJ
	HVo8WK/1YgvbYekfN0FOE65NS/2TwApVlfBiuH5P3yin2xOov8HP4NAcT5+6/BHTAC0BJoUUhW3yx
	KDzenz5YhaqoHxp07Lu6cyrhAg1TMYr8Nf0Vnw91j81cfpXZM+z9/9YQS7DyQV/+1qdASiIZBkWCc
	eE53Gsed7Zg9rQTODPH3c3CXqQTdRatZOpMIAx5en7mQ2pCRhsTxG6LmPgNKcYqhTcjdDyJj4IxuP
	5CKFn0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjRl-00000004jNL-1188;
	Tue, 28 Jan 2025 11:07:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjQP-00000004jBE-2hpS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 11:06:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6BF5FA40C82;
	Tue, 28 Jan 2025 11:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE901C4CED3;
	Tue, 28 Jan 2025 11:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738062392;
	bh=gv76C6wO6xMSzCbvBBvWgdOv3lE3r87BRuayIE6KiXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcQcWjNV+M54DU8459RWEa5PzPrw7zxbkleDhYV9iQAmDaK4meu+eLCoc1DTqGguo
	 Wesux7TJh0K2V0U4vpXK5RXzqxCBEYdcevhSPJWDFSdcuE6VfmFtmXcRt8Je+u0egA
	 zaG6oHZg3RoLriyomnEd8AYlf+J8q4AcDPZ22vn+7qZOERK9HEKiFGqW2Wx/7ScGdf
	 nBbkFWLx21ose6DN6Dv7FXKbc6JjpkQb2Z5aawSjltVAjro66uaGQwk/ZolHLirx1l
	 4tVCThK1r8RMDP8ftEza3BWkcz8qGD/K/VoSbleSZ/Skq+sXFPOyGdn6sCMEfkBU6r
	 ePo501YS3WSxw==
Date: Tue, 28 Jan 2025 11:06:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>,
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Bo Liu <liubo03@inspur.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 0/9] Use correct LDO5 control registers for PCA9450
Message-ID: <bce1bafa-aa90-4a1c-a2d3-cabbeb69e3f0@sirena.org.uk>
References: <20241218152842.97483-1-frieder@fris.de>
 <15348147-8806-47b7-85c0-2850c7296ed0@kontron.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IvZLa3vdj9aLxx+U"
Content-Disposition: inline
In-Reply-To: <15348147-8806-47b7-85c0-2850c7296ed0@kontron.de>
X-Cookie: I never did it that way before.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_030633_750321_78B6BCA3 
X-CRM114-Status: GOOD (  15.65  )
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


--IvZLa3vdj9aLxx+U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 08:44:28AM +0100, Frieder Schrempf wrote:

> I just want to ask kindly if there is any feedback for the driver and
> devicetree changes in this set?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--IvZLa3vdj9aLxx+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeYujAACgkQJNaLcl1U
h9DpOggAhX9BLy687yuZnM+F3nUkkbj07gR84dcQcicE5ja/aM4ckgi/aDAgvHsC
34rd94+v7TO8cmQ/SPT4CBd9L4CEKv/JjAFKAKXXH1ya/Jc4SzMi5oFAhf8c/MMF
tC/b/6NyIOcVioXf15AuAoNQ4NFFTrumHaBiI1kau5bps8k1Gsg2y4Wv2+pXZDlm
3WMG+8B1eZJaMAwIa0P5XfzpPHEHya91HC/19XObNMzeJB2TMXBad1aflEZTimZY
lDDIfbIZhndkR5XbCf9V32CCPH8E9Sqs+tggHY+X4PDGTuahfa+U9JCRqvpPNYL4
40RSbzMWSYG148fvbylknQXQwAn5Tw==
=P70F
-----END PGP SIGNATURE-----

--IvZLa3vdj9aLxx+U--

