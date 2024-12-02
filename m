Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547D6D78337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oap0oF4sIkKizsm9t9eIwyMY648c0ihv0oz5piM+FQ=; b=aqwVPGo/QY/skdNwqbkhHKsVIO
	5fTujQtnON7rysFgerRMiZEJl8vPkxLYIViUvmbnc3fEK3GooITMvOomNXTI0H5UhXRsG/Qu4NkIq
	mosFMtb7NXaR/hAYfPTAcuo/LgeF+sTFrHXiSia+eXVl7RR7/HwM6vZncp9gQCCyOvVH7PWLUWVMV
	aNCB3BgCtnOR2i2VTl29lsNLZ6yIASNXLd3ce3T0kqJg0v+rfr8y++b7n08gWjMyc+fCaqk1YphMQ
	hkvXXnMFSlCmBtORew55WR2Be5+nKgzN0+FASVvbORGVo9QpzkW/MGhzvADQ8EZ+lF3qBHsZosfC0
	BQmQziFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9zH-00000006yqN-2Xdm;
	Mon, 02 Dec 2024 17:13:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9yJ-00000006yjC-1XNB;
	Mon, 02 Dec 2024 17:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9oap0oF4sIkKizsm9t9eIwyMY648c0ihv0oz5piM+FQ=; b=eoo2cY/kGIOkkUWWoRXNZsOE6W
	R8jWv9eaFAWJspoi71d7bPjXvAlmY7K6oSG5jy/oHirOda9H3DCu9Datwin74IrlLi3/FwAUGDUFo
	tHK0HzKbd1ohIEhQJ2z2L02y9H7DC1Mv4mH3KkITctt168zuVtLfq3dteaLM4wrYvAx4MfKdfx3ux
	aa3/2O6p1nnQYlP7gLWomAbOn2wpHHnJtRFRgy2xsgXNEPKKAw1i5Op0CxE91BSH15VS+t4zWXfkF
	IdW3ZD7WzfKLhz5twjREdMwTWfDiuRMLU9b/wF1E54euNNRExGpAsGIVbxEQzLmu6mgdSSs6JFZGz
	JpgJr0Kg==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9yG-00000002ChP-1QHI;
	Mon, 02 Dec 2024 17:12:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6B351BF207;
	Mon,  2 Dec 2024 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733159543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oap0oF4sIkKizsm9t9eIwyMY648c0ihv0oz5piM+FQ=;
	b=dOd2Y00O4a8ZrBgx36PTQYGqD1UEHeBkeBVYd3Psk2MsbekT3buZO3UBMYzEAeXX1ZLsa1
	siCsfpjtO+2s2ZfAXLETNwPH3tJnBM0VWaG4d3m9YhTqvaStaHe4bo/6h/UsSMp0eR/Wvt
	Tfk/ryzMZx9lHWhvUprBWj7QkKtWOTZOlpK0CX9ispLk6kdUNPwdOftAZit/4LtyjF2TUn
	j/MzkhngnZu2AhW5mWTdvYcvXvUImcCWIGnh8ej3bBNB0lFPQ/kq7+WrBN8sj0IvkDA9iM
	5OEgKpyqU9FKUTLPD2RL0cvafjwUZ70qwP9yzyaDeOYiOUn2sRcKAToYRcTLeQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  nikita.shubin@maquefel.me,  arnd@arndb.de,
  vkoul@kernel.org,  esben@geanix.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
In-Reply-To: <20241125052524.135362-3-hpchen0nvt@gmail.com> (Hui-Ping Chen's
	message of "Mon, 25 Nov 2024 05:25:24 +0000")
References: <20241125052524.135362-1-hpchen0nvt@gmail.com>
	<20241125052524.135362-3-hpchen0nvt@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 18:12:22 +0100
Message-ID: <875xo257rd.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_171228_485552_A7802705 
X-CRM114-Status: UNSURE (   8.35  )
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

> +static int ma35_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct ma35_nand_info *nand =3D nand_get_controller_data(chip);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct device *dev =3D mtd->dev.parent;
> +	u32 reg;
> +
> +	if (chip->options & NAND_BUSWIDTH_16) {
> +		dev_err(dev, "16 bits bus width not supported");
> +		return -EINVAL;
> +	}
> +
> +	reg =3D readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~PSIZE_MASK);
> +	if (mtd->writesize =3D=3D 2048)
> +		writel(reg | PSIZE_2K, nand->regs + MA35_NFI_REG_NANDCTL);
> +	else if (mtd->writesize =3D=3D 4096)
> +		writel(reg | PSIZE_4K, nand->regs + MA35_NFI_REG_NANDCTL);
> +	else if (mtd->writesize =3D=3D 8192)
> +		writel(reg | PSIZE_8K, nand->regs + MA35_NFI_REG_NANDCTL);

You should error out if the writesize is not supported.

Thanks,
Miqu=C3=A8l

