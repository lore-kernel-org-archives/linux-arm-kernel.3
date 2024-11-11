Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CF7D3ABEA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5qBMJyupmVmP3WenwgqG6fxdPxLJkkXl5JQ5DHXwD0=; b=OQ7yd4n8P1BLDtXfTAszJtrOWW
	quxBgZWmQIAoxrJ/5S6dLMx28Lj6cqCN6qmXtvi/mHiV+K00bcBpcaODv39aHn6fKABlmIv2QOy5W
	oq8X1ofCX1o/LHCwM3N9fyQSgnG3gugHq15cvw0lBxyhBvcgnuGRHv2HmlkVN4hi/ZxaZWGPgDPSh
	57F3HzYsYAo2Mjeo8ksUo2iagxMxIf0AJRWZBCisQskXUKUtngK6RKCR7j+AV2aG9lrRahiDc4CFE
	esrvHXQ8FubV6Y8IDQZKMAScRfEY13imYkHio7UXI+43ypN8+lGPvBOpxfQQJFJQzo1NaZWqN0dos
	+uXFp9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZ8k-00000000uUY-2gdU;
	Mon, 11 Nov 2024 18:27:54 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZ3B-00000000tX4-0MGd;
	Mon, 11 Nov 2024 18:22:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49EFE1C0005;
	Mon, 11 Nov 2024 18:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731349324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m5qBMJyupmVmP3WenwgqG6fxdPxLJkkXl5JQ5DHXwD0=;
	b=P+dWOpS4lvwV7ml2Qfzzvid2JahTF5umrRz6pPlZxfoDSVN7P7RBPC5/L1AoCYDmEGs0z6
	GdDwxm/e9vaPg8V5YM6NfeSx4yMOUgh42kO+kgWriWfrwiFd8aP0fwgcKoIOcEyJxICjcT
	cZdji2E5SwsT6f8SzmW7zJzfOPv0P2496z5WA7e+5h4ZOpCkf1LCJdaCVT24l8Wngjqc2Y
	mYK/iiOEOP4qlB4TdWuml/EGZm+obhm5ZNr5y9qhERlkvscEShimeq1nJc5xtuWmMyZEUI
	BoLHmgJDkaqq/JTSpjMR3HbpocvPW8UvZmSp4xJEkexDK7lIJ+dgKPl/tg/hnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  nikita.shubin@maquefel.me,  arnd@arndb.de,
  vkoul@kernel.org,  esben@geanix.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
In-Reply-To: <20241023092617.108021-3-hpchen0nvt@gmail.com> (Hui-Ping Chen's
	message of "Wed, 23 Oct 2024 09:26:17 +0000")
References: <20241023092617.108021-1-hpchen0nvt@gmail.com>
	<20241023092617.108021-3-hpchen0nvt@gmail.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 19:22:02 +0100
Message-ID: <87y11p1vhx.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_102209_474850_01FF2AEF 
X-CRM114-Status: GOOD (  15.67  )
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
> +	struct ma35_nand_chip *nvtnand =3D to_ma35_nand(chip);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct device *dev =3D mtd->dev.parent;
> +	u32 reg;
> +
> +	if (chip->options & NAND_BUSWIDTH_16) {
> +		dev_err(dev, "16 bits bus width not supported");
> +		return -EINVAL;
> +	}
> +
> +	nvtnand->nchunks =3D mtd->writesize / chip->ecc.steps;
> +	nvtnand->nchunks =3D (nvtnand->nchunks < 4) ? 1 : nvtnand->nchunks / 4;

This second division looks broken. Also, you probably don't want to do
that outside of the ON_HOST situation. Finally, you should probably
update chip->ecc.steps and chip->ecc.size to your final choice.

> +
> +	reg =3D readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~PSIZE_MASK);
> +	if (mtd->writesize =3D=3D 2048)
> +		writel(reg | PSIZE_2K, nand->regs + MA35_NFI_REG_NANDCTL);
> +	else if (mtd->writesize =3D=3D 4096)
> +		writel(reg | PSIZE_4K, nand->regs + MA35_NFI_REG_NANDCTL);
> +	else if (mtd->writesize =3D=3D 8192)
> +		writel(reg | PSIZE_8K, nand->regs + MA35_NFI_REG_NANDCTL);
> +
> +	switch (chip->ecc.engine_type) {
> +	case NAND_ECC_ENGINE_TYPE_ON_HOST:
> +		chip->options |=3D NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA;

What is the reason for refusing subpage writes? This is not something
you can do later, so unless there is a good reason, please do not set
this flag.

> +		chip->ecc.write_page =3D ma35_nand_write_page_hwecc;
> +		chip->ecc.read_page  =3D ma35_nand_read_page_hwecc;
> +		chip->ecc.read_oob   =3D ma35_nand_read_oob_hwecc;
> +		return ma35_nand_hwecc_init(chip, nand);
> +	case NAND_ECC_ENGINE_TYPE_NONE:
> +	case NAND_ECC_ENGINE_TYPE_SOFT:
> +	case NAND_ECC_ENGINE_TYPE_ON_DIE:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +

...

> +static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info=
 *nand,
> +				 struct device_node *np)
> +{
> +	struct ma35_nand_chip *nvtnand;
> +	struct nand_chip *chip;
> +	struct mtd_info *mtd;
> +	int nsels;
> +	u32 tmp;
> +	int ret;
> +	int i;
> +
> +	if (!of_get_property(np, "reg", &nsels))

Please convert to device_property_ helpers. And remove the of include
once you no longer need it.

> +		return -ENODEV;
> +
> +	nsels /=3D sizeof(u32);
> +	if (!nsels || nsels > MA35_MAX_NSELS) {
> +		dev_err(dev, "invalid reg property size %d\n", nsels);
> +		return -EINVAL;
> +	}
> +
> +	nvtnand =3D devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
> +			      GFP_KERNEL);
> +	if (!nvtnand)
> +		return -ENOMEM;
> +
> +	nvtnand->nsels =3D nsels;
> +	for (i =3D 0; i < nsels; i++) {
> +		ret =3D of_property_read_u32_index(np, "reg", i, &tmp);
> +		if (ret) {
> +			dev_err(dev, "reg property failure : %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (tmp >=3D MA35_MAX_NSELS) {
> +			dev_err(dev, "invalid CS: %u\n", tmp);
> +			return -EINVAL;
> +		}
> +
> +		if (test_and_set_bit(tmp, &nand->assigned_cs)) {
> +			dev_err(dev, "CS %u already assigned\n", tmp);
> +			return -EINVAL;
> +		}
> +
> +		nvtnand->sels[i] =3D tmp;
> +	}
> +

...

> +
> +	ret =3D mtd_device_register(mtd, NULL, 0);
> +	if (ret) {
> +		dev_err(dev, "MTD parse partition error\n");

probably useless error message?

> +		nand_cleanup(chip);
> +		return ret;
> +	}
> +
> +	list_add_tail(&nvtnand->node, &nand->chips);
> +
> +	return 0;
> +}

I believe next iteration should be the one, I'm rather happy with the
overall look.

Thanks,
Miqu=C3=A8l

