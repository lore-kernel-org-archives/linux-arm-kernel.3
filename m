Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565D3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiYDP/Yr6tDyICcpBbS+CcUbgi9+awvr2U2UZfqYxH4=; b=PMrsC3rRfWiZvmqfDbtPExPdW0
	wj6dYFq4cns9Q5gBfsRuEy9yptEkPwOaMxGZOU2XaagGGPJzVWWuiNwtsITuAtOfXqwt0XmhGCt3r
	ZpaBZHY0jsWANFSqTbTBRAO4I63krTITVYFXuGMUcc4gYU8hUOfbnX0OxI7qxvKcJnEhdJPAJf1iz
	/eqfc19rupvKgaPyWdH5wjCnboEjGFj137pQOHgpN1zc25Eu8dbsW8sARq67momuSl5YGcCQYIjPQ
	UKOm5wnmCjMERvalAUvJwP8OGXiyYjB+E+iZ0/WBgdIgsvESHWCcLNPujmgQZ6uWW6N2uXM+5MsZZ
	Sm8To4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsu2-00000003ABe-2HHQ;
	Thu, 09 Jul 2026 17:51:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsu1-00000003ABJ-14zE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:51:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6654E600C3;
	Thu,  9 Jul 2026 17:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282001F000E9;
	Thu,  9 Jul 2026 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619472;
	bh=IiYDP/Yr6tDyICcpBbS+CcUbgi9+awvr2U2UZfqYxH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DLB6FESSA1rkHpOnbGOx3alYN6+UGaNFml6aKIm+F78m85Jf1z3XznAERRuPTIpOS
	 KmWCHLG7TUV2WZjHJG8hguNn8th/vh9Ra96QCCqZi/glbKAS/L/7HFy8/Gq6bn2cQz
	 6Nz8X+eEtsL2vxwKP9CxG4nsWWVB2osJ5RScksZTCQJhNJGYcQCp8ije06hTffIBP4
	 7y1sE1bEaxCgEQ/Bp+FF9WEmG0KNz6tO3rJ/K7o0N6EQHjBIGcmk2rWmgMLBgHjyWO
	 0W30p+KuUKVSOh/vuOmLvOwmNAizSUVe8BdfH7pMSdpvQPSWOZq/PMXw28zDODtLFS
	 anhZf4OVb78MA==
Date: Thu, 9 Jul 2026 18:51:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 05/11] dt-bindings: power: apple,pmgr-pwrstate: Add t6030
 and t6031 compatibles
Message-ID: <20260709-uncross-frame-f4e1ee999cfd@spud>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-5-55b305833123@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rc4vPyNuP2jKmDXT"
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-5-55b305833123@jannau.net>
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

--rc4vPyNuP2jKmDXT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--rc4vPyNuP2jKmDXT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/figAKCRB4tDGHoIJi
0m3OAQDzIzOeSCHYVfxck/T7kMRYB4bIgW4uZxglmR4yesQBjgEAx1p4AOxloY8c
e7UgRCo5xhBddY6h7uja/dDb6wjmQAw=
=q2ig
-----END PGP SIGNATURE-----

--rc4vPyNuP2jKmDXT--

