Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEC3CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otXLfQ4Ld1gJ6Ja2C1Do6+eyluqz7SEV1+z0JoqPOKE=; b=xuFw/95PXj9y/MavXc0zHbfTH5
	UpDHJi3ExiLvOZ29EUzH67W3RmiyJ95iuK0GT2cePZ2MCd61VF/ILT3jL7t+hA/k+gejl5pet9IE4
	RLjWzaroDw6jZENnVYpREOEN2eXSdLdFWvAM4D0sJes5rk1zfWss4hFISF07KOEg2JbDS1g+ctXk6
	4NIKSl0+WIwmv6VlSTaW3kwJu3Gk3GTGuVoO0gIR8hBqMTyp6bbPBPRr7B7I+rDgpXIXbSkqfzif9
	GSPm8ZUPTYxyg2Xt5P+cBT51SzU9Sk1w+RXcIIP3ghqb1RnAgPGq/hWTN4jNdUiW3dQDKDzMhvM1f
	rtsBD0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDYb-00000006LJ6-06om;
	Sun, 24 Aug 2025 16:27:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDVy-00000006L6C-2L9r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 16:24:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 745DC1A0C63;
	Sun, 24 Aug 2025 16:24:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D297605F1;
	Sun, 24 Aug 2025 16:24:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D30CE1C22C3C6;
	Sun, 24 Aug 2025 18:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756052653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=otXLfQ4Ld1gJ6Ja2C1Do6+eyluqz7SEV1+z0JoqPOKE=;
	b=CBgYKyU5xO4Q7dyEnj4UeX+5RLiyVyeT1VBugpwBueExjDf+RLz2u6YJ9J+rMFkQfgfeYq
	/Dye1S9nPJUP6usEdV/ECJEm2mVH0MIlglCWLlphUpO3U1HCi53aBcQHfhff5gxh3br72X
	2zjhlU1zCh1FXvVXZ4ef4wr/sNasqmGDw3WCxIjJBKeq9Ak1FVLYLMPp0XM0KqXnOsqgZp
	I4Ft3aotmL3KDm3lHBA6Po9+6CzLeH9UeAgARo2cnsqVDD9gtloDAtEBQYWdiNTaUwoZGs
	DxoFDr+J33qZGojumRoDZzDU3ml3ceiwFHpc+sLRH+bigGg/ovvSCalZ6pkfyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu
 <ray.liu@airoha.com>,  Mark Brown <broonie@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH RESEND v2 3/4] mtd: spinand: repeat reading in regular
 mode if continuous reading fails
In-Reply-To: <20250814065423.3980305-4-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Thu, 14 Aug 2025 09:54:22 +0300")
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
	<20250814065423.3980305-4-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 18:24:00 +0200
Message-ID: <87plckit7j.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_092418_720481_05D52EDA 
X-CRM114-Status: UNSURE (   8.49  )
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

Hello,

> +		if (controller_is_buggy) {
> +			/*
> +			 * Some spi controllers may not support reading up to
> +			 * erase block size. They will read less data than
> +			 * expected. If this happen disable continuous mode
> +			 * and repeat reading in normal mode.
> +			 */
> +			spinand->cont_read_possible =3D false;

I am fine with the idea, but could we avoid this little dance and drop
the extra controller_is_buggy boolean, and just let
spinand_mtd_continuous_page_read() do the fixup and return -EAGAIN?

> +			ret =3D spinand_mtd_regular_page_read(mtd, from, ops,
> +							    &max_bitflips);
> +		}
> +	} else {
> +		ret =3D spinand_mtd_regular_page_read(mtd, from, ops,
> +						    &max_bitflips);
> +	}
>=20=20
>  	if (ops->stats) {
>  		ops->stats->uncorrectable_errors +=3D

Thanks,
Miqu=C3=A8l

