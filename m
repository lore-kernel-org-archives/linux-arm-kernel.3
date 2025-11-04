Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A38CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlAWkou6qZ3iOsHzXkX7xAGUG1QWZHnc2ewaAAkiHd4=; b=d779Gi/3FKEYqm/AePwtmNc2Er
	PHoSmFPx4QANigCUm+8EI/Ug6L5z/ICMtlbtImN57Xh5NZEcLk+0/xEEkjmHLIzQ+eJVnZZkUkuZc
	J7VpAI7m8OjaZkXM30LZHY1C0p0sZA3c4Uqibac2zO3gtinRBgg78GeNsJSWKOS3rWAGL4z2Iinda
	3b4lsb+/+cgtCKTFMfbwzpqgFExFyJBjf7K9D85LfuGCLa1MMKnudBMxdBLdVXphQrf4lwEUm/CsM
	e7mToFURs5ZMTGgpAIwXPjehqVOzkEC38yITsYYfZvUs/YkCQfP99yvC904aq1rShjLhyre9INQbt
	gryM4WNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCpP-0000000BTlR-3Kew;
	Tue, 04 Nov 2025 08:55:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCpM-0000000BTkY-1cOt;
	Tue, 04 Nov 2025 08:55:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F2BE14E414F0;
	Tue,  4 Nov 2025 08:55:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5D55606EF;
	Tue,  4 Nov 2025 08:55:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A65510B500FA;
	Tue,  4 Nov 2025 09:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762246541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mlAWkou6qZ3iOsHzXkX7xAGUG1QWZHnc2ewaAAkiHd4=;
	b=JqkqNBwRvXd/ssVGhp0S30K9fd4c6b+SIUnBcnbJ+229G0I00kLcS98UsyPT70CvczET+t
	fQ9I/rc8rCXAPvQ9A/6O82gimsSd4v0jJPO+UdBiYWQW16c/CWiwo8w9zSXZDdjenRRSaM
	yBHBmdcjVPHvWYEEicvsojfJeJo5z3q8czHQjJRV+kOjCNQmsqNLdftJ31Y+zDIM9F8Ae2
	Z1fhue6QSkHmpipjZC6gRNbm4zHC5kpSI74ZX2s5BDDGZLMMHGEcJ0z2gQTF809QdnmkPj
	7imYvsHSiu/thPGFQFS6fZX2dT4Ac5ewpOC5he4Ke1k4OLKy1l2z2sT768PFYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: richard@nod.at,  vigneshr@ti.com,  vz@mleia.com,
  piotr.wojtaszczyk@timesys.com,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak
In-Reply-To: <20251104014042.1389-1-vulab@iscas.ac.cn> (Haotian Zhang's
	message of "Tue, 4 Nov 2025 09:40:42 +0800")
References: <20251028094747.1089-1-vulab@iscas.ac.cn>
	<20251104014042.1389-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 04 Nov 2025 09:55:37 +0100
Message-ID: <87v7jq9nxy.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_005544_585212_8C3FCDF1 
X-CRM114-Status: UNSURE (   9.31  )
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

Hi,

> diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lp=
c32xx_slc.c
> index b54d76547ffb..3ca30e7dce33 100644
> --- a/drivers/mtd/nand/raw/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
> @@ -854,7 +854,7 @@ static int lpc32xx_nand_probe(struct platform_device =
*pdev)
>  	}
>=20=20
>  	/* Start with WP disabled, if available */
> -	host->wp_gpio =3D gpiod_get_optional(&pdev->dev, NULL, GPIOD_OUT_LOW);
> +	host->wp_gpio =3D devm_gpiod_get_optional(&pdev->dev, NULL,
>  	GPIOD_OUT_LOW);

Please send an update on top the previous patch which I already applied.

Thanks,
Miqu=C3=A8l

