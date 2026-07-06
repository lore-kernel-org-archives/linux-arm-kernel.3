Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDD3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfFPiegXNTBdwL7ERGkc+qHbAJDd2t8DcXD4UdKo670=; b=1mXCWKy6zNUF5PdL/DRTeCOomc
	XrPndfPEKDB0rjTaysMtGCHj/WpqpdYW2mSzjc+Vwk7ZwG0OLD5rICN6ph4STnSS0MWXAzy3Nkbu7
	ZS9zAgASFxYLSLcu4NIa08PJ+Gp/+7uruw5464wTqgQA4L+h1F+aNt85CDlRG0aEQbZiVbdL0QqHO
	8mcUq7TfVzwvfB3EVJ3iUklirfe6mdycf3KKv4RnWR0xbMENL/JfpUGcTCGdknFBX/Q0YakrTKBt9
	bCXI4SHluhsgRDU+yPNaNcd7G3i8QyYeMOsVuuehKvB6Ozk7ScpZ/7iTc3rCdW4DnlJTanxPxC7eQ
	w1DjMgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf8W-0000000BwjX-29RS;
	Mon, 06 Jul 2026 08:57:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf8R-0000000Bwij-1I7E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:57:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F1644E40CA6;
	Mon,  6 Jul 2026 08:56:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C3F2601A2;
	Mon,  6 Jul 2026 08:56:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6433611BB9BF5;
	Mon,  6 Jul 2026 10:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783328218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kfFPiegXNTBdwL7ERGkc+qHbAJDd2t8DcXD4UdKo670=;
	b=226LxmgDjx9k9eSuB9lzIsww26Zz8Ic9NQLh0i4uMKUs5Gns2LhFiuf3n4DK4rypNVQe6A
	/TpEfY4XWaVCUItIlaFrreQ60DyDdR4yrIhQ7Ifkk9ediqJJ2qtvj5eNbgG2rYPxTMINl5
	QsFHXtk2CV2yU84tHFQIqppoEDMmr6XdW0fhgucdghDZOnx/TxPtMEEUhG8myLxd0CUBa4
	+nmESPjYRIUYipXI5FEiL+Dc7T2FY2aE/d1SC9wXNZJQ2ZpqDc3Rmj96g4Bxos7X2yrQfw
	MoilbPUhQ3q+DMaGgK9IdAQ/+MinohXiBRAcDgWPzwvaqv3OMIbAC9w90W8ARg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 10:56:54 +0200
Message-Id: <DJRD3C0919EP.CTZYPXDY93HI@bootlin.com>
Cc: <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 08/12] soc: fsl: qe: Convert to generic IRQ chip
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>, "Qiang Zhao" <qiang.zhao@nxp.com>, "Thomas
 Gleixner" <tglx@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-8-6c3e706e27dc@bootlin.com>
 <34946670-2a76-47fa-af82-3d70cdc9d8f0@kernel.org>
In-Reply-To: <34946670-2a76-47fa-af82-3d70cdc9d8f0@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_015705_910193_D7C437E6 
X-CRM114-Status: GOOD (  25.75  )
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

On Mon Jul 6, 2026 at 9:29 AM CEST, Christophe Leroy (CS GROUP) wrote:
> Hi Paul,
>
> Le 03/07/2026 =C3=A0 15:30, Paul Louvel a =C3=A9crit=C2=A0:
>> The generic IRQ chip framework is available to handle IRQ chips. Using
>> this framework for the QE interrupt controller allows to simplify the
>> driver. Indeed, the framework internally handles operations coded
>> directly in the driver.
>>=20
>> Add a select dependency to GENERIC_IRQ_CHIP in the PPC platform Kconfig.
>>=20
>> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
>> ---
>>   arch/powerpc/platforms/Kconfig   |   1 +
>>   drivers/soc/fsl/qe/qe_ports_ic.c | 103 ++++++++++++++++++++++++++-----=
--------
>>   2 files changed, 70 insertions(+), 34 deletions(-)
>>=20
>> diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kco=
nfig
>> index c4e61843d9d9..b0b3a80f8cde 100644
>> --- a/arch/powerpc/platforms/Kconfig
>> +++ b/arch/powerpc/platforms/Kconfig
>> @@ -232,6 +232,7 @@ config QE_GPIO
>>   	bool "QE GPIO support"
>>   	depends on QUICC_ENGINE
>>   	select GPIOLIB
>> +	select GENERIC_IRQ_CHIP
>>   	help
>>   	  Say Y here if you're going to use hardware that connects to the
>>   	  QE GPIOs.
>> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_po=
rts_ic.c
>> index c8b73b0aa233..d022aa224f6d 100644
>> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
>> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
>> @@ -20,63 +20,65 @@ struct qepic_data {
>>   	void __iomem *reg;
>>   	struct irq_domain *host;
>>   	int irq;
>> +	struct irq_chip_generic *gc;
>>   };
>>  =20
>>   static void qepic_mask(struct irq_data *d)
>>   {
>> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
>>  =20
>> -	clrbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
>> +	clrbits32(gc->reg_base + ct->regs.mask, d->mask);
>
> Is there a real added value with this change ?
>
> Previously we had:
>
> 00000000 <qepic_mask>:
>     0:	81 03 00 18 	lwz     r8,24(r3)
>     4:	81 28 00 00 	lwz     r9,0(r8)
>     8:	7c 00 04 ac 	hwsync
>     c:	81 29 00 10 	lwz     r9,16(r9)
>    10:	0c 09 00 00 	twi     0,r9,0
>    14:	4c 00 01 2c 	isync
>    18:	80 e3 00 08 	lwz     r7,8(r3)
>    1c:	3d 40 80 00 	lis     r10,-32768
>    20:	81 08 00 00 	lwz     r8,0(r8)
>    24:	7d 4a 3c 30 	srw     r10,r10,r7
>    28:	7d 29 50 78 	andc    r9,r9,r10
>    2c:	7c 00 04 ac 	hwsync
>    30:	91 28 00 10 	stw     r9,16(r8)
>    34:	4e 80 00 20 	blr
>
> Now we have:
>
> 00000000 <qepic_mask>:
>     0:	80 e3 00 18 	lwz     r7,24(r3)
>     4:	81 03 00 10 	lwz     r8,16(r3)
>     8:	81 27 00 00 	lwz     r9,0(r7)
>     c:	81 48 00 94 	lwz     r10,148(r8)
>    10:	7d 29 52 14 	add     r9,r9,r10
>    14:	7c 00 04 ac 	hwsync
>    18:	81 49 00 00 	lwz     r10,0(r9)
>    1c:	0c 0a 00 00 	twi     0,r10,0
>    20:	4c 00 01 2c 	isync
>    24:	80 c3 00 00 	lwz     r6,0(r3)
>    28:	81 27 00 00 	lwz     r9,0(r7)
>    2c:	81 08 00 94 	lwz     r8,148(r8)
>    30:	7d 4a 30 78 	andc    r10,r10,r6
>    34:	7d 29 42 14 	add     r9,r9,r8
>    38:	7c 00 04 ac 	hwsync
>    3c:	91 49 00 00 	stw     r10,0(r9)
>    40:	4e 80 00 20 	blr
>
> We now have three more indirect loads (8x lwz instead of 5x), for=20
> loading some value which is already known at compile time.
>
>
>>   }
>>  =20
>>   static void qepic_unmask(struct irq_data *d)
>>   {
>> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
>>  =20
>> -	setbits32(data->reg + CEPIMR, 1 << (31 - irqd_to_hwirq(d)));
>> +	setbits32(gc->reg_base + ct->regs.mask, d->mask);
>>   }
>>  =20
>>   static void qepic_end(struct irq_data *d)
>>   {
>> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
>>  =20
>> -	out_be32(data->reg + CEPIER, 1 << (31 - irqd_to_hwirq(d)));
>> +	out_be32(gc->reg_base + ct->regs.eoi, d->mask);
>> +}
>> +
>> +static void qepic_calc_mask(struct irq_data *d)
>> +{
>> +	d->mask =3D 1 << (31 - irqd_to_hwirq(d));
>>   }
>>  =20
>>   static int qepic_set_type(struct irq_data *d, unsigned int flow_type)
>>   {
>> -	struct qepic_data *data =3D irq_data_get_irq_chip_data(d);
>> -	unsigned int vec =3D (unsigned int)irqd_to_hwirq(d);
>> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> +	struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
>>  =20
>>   	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
>>   	case IRQ_TYPE_EDGE_FALLING:
>> -		setbits32(data->reg + CEPICR, 1 << (31 - vec));
>> +		setbits32(gc->reg_base + ct->regs.type, d->mask);
>>   		return 0;
>>   	case IRQ_TYPE_EDGE_BOTH:
>>   	case IRQ_TYPE_NONE:
>> -		clrbits32(data->reg + CEPICR, 1 << (31 - vec));
>> +		clrbits32(gc->reg_base + ct->regs.type, d->mask);
>>   		return 0;
>>   	}
>>   	return -EINVAL;
>>   }
>>  =20
>> -static struct irq_chip qepic =3D {
>> -	.name =3D "QEPIC",
>> -	.irq_mask =3D qepic_mask,
>> -	.irq_unmask =3D qepic_unmask,
>> -	.irq_eoi =3D qepic_end,
>> -	.irq_set_type =3D qepic_set_type,
>> -};
>> -
>>   static void qepic_cascade(struct irq_desc *desc)
>>   {
>>   	struct qepic_data *data =3D irq_desc_get_handler_data(desc);
>> +	struct irq_chip_type *ct =3D data->gc->chip_types;
>>   	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>>   	unsigned long event, bit;
>>  =20
>>   	chained_irq_enter(chip, desc);
>>  =20
>> -	event =3D in_be32(data->reg + CEPIER);
>> +	event =3D in_be32(data->gc->reg_base + ct->regs.eoi);
>>   	if (!event) {
>>   		handle_bad_irq(desc);
>>   		goto out;
>> @@ -89,33 +91,64 @@ static void qepic_cascade(struct irq_desc *desc)
>>   	chained_irq_exit(chip, desc);
>>   }
>>  =20
>> -static int qepic_host_map(struct irq_domain *h, unsigned int virq, irq_=
hw_number_t hw)
>> +static int qepic_chip_init(struct irq_chip_generic *gc)
>>   {
>> -	irq_set_chip_data(virq, h->host_data);
>> -	irq_set_chip_and_handler(virq, &qepic, handle_fasteoi_irq);
>> +	struct irq_chip_type *ct =3D gc->chip_types;
>> +
>> +	ct->regs.mask =3D CEPIMR;
>> +	ct->chip.irq_mask =3D qepic_mask;
>> +	ct->chip.irq_unmask =3D qepic_unmask;
>> +	ct->regs.eoi =3D CEPIER;
>> +	ct->chip.irq_eoi =3D qepic_end;
>> +	ct->regs.type =3D CEPICR;
>> +	ct->chip.irq_set_type =3D qepic_set_type;
>> +	ct->chip.irq_calc_mask =3D qepic_calc_mask;
>
> Are ct->regs.mask, ct->regs.eoi and ct->regs.type used anywhere else=20
> than locally in qepic_{mask/unmask/end/set_type} ?

No they are not.
The main purpose of these registers is that they are used in the generic ir=
q
chip framework functions like irq_gc_mask_set_bit(), which we dropped earli=
er in
favor of using our own hooks.
At this stage, if you consider that the instructions overhead of the functi=
ons
above is already too much, it is better to get rid of the framework complet=
ly
then.

>
> Christophe
>
>> +
>>   	return 0;
>>   }
>>  =20
>> -static const struct irq_domain_ops qepic_host_ops =3D {
>> -	.map =3D qepic_host_map,
>> -};
>> +static int qepic_domain_init(struct irq_domain *d)
>> +{
>> +	struct qepic_data *data =3D d->host_data;
>>  =20
>> -static void qepic_remove(void *res)
>> +	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qepic_domain_exit(struct irq_domain *d)
>>   {
>> -	struct qepic_data *data =3D res;
>> +	struct qepic_data *data =3D d->host_data;
>>  =20
>>   	irq_set_chained_handler_and_data(data->irq, NULL, NULL);
>> -	irq_domain_remove(data->host);
>>   }
>>  =20
>>   static int qepic_probe(struct platform_device *pdev)
>>   {
>> +	struct irq_domain_chip_generic_info dgc_info =3D {
>> +		.name		=3D "QEPIC",
>> +		.handler	=3D handle_fasteoi_irq,
>> +		.irqs_per_chip	=3D 32,
>> +		.num_ct		=3D 1,
>> +		.init		=3D qepic_chip_init,
>> +	};
>> +	struct irq_domain_info d_info =3D {
>> +		.fwnode		=3D of_fwnode_handle(pdev->dev.of_node),
>> +		.domain_flags	=3D IRQ_DOMAIN_FLAG_DESTROY_GC,
>> +		.size		=3D 32,
>> +		.hwirq_max	=3D 32,
>> +		.ops		=3D &irq_generic_chip_ops,
>> +		.dgc_info	=3D &dgc_info,
>> +		.init		=3D qepic_domain_init,
>> +		.exit		=3D qepic_domain_exit,
>> +	};
>>   	struct device *dev =3D &pdev->dev;
>>   	struct qepic_data *data;
>>  =20
>>   	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>   	if (!data)
>>   		return -ENOMEM;
>> +	d_info.host_data =3D data;
>>  =20
>>   	data->reg =3D devm_platform_ioremap_resource(pdev, 0);
>>   	if (IS_ERR(data->reg))
>> @@ -125,14 +158,16 @@ static int qepic_probe(struct platform_device *pde=
v)
>>   	if (data->irq < 0)
>>   		return data->irq;
>>  =20
>> -	data->host =3D irq_domain_create_linear(dev_fwnode(dev), 32, &qepic_ho=
st_ops, data);
>> -	if (!data->host)
>> -		return -ENODEV;
>> +	data->host =3D devm_irq_domain_instantiate(dev, &d_info);
>> +	if (IS_ERR(data->host))
>> +		return PTR_ERR(data->host);
>>  =20
>> -	irq_set_chained_handler_and_data(data->irq, qepic_cascade, data);
>> -
>> -	return devm_add_action_or_reset(dev, qepic_remove, data);
>> +	data->gc =3D irq_get_domain_generic_chip(data->host, 0);
>> +	if (!data->gc)
>> +		return -ENODEV;
>> +	data->gc->reg_base =3D data->reg;
>>  =20
>> +	return 0;
>>   }
>>  =20
>>   static const struct of_device_id qepic_match[] =3D {
>>=20

Thanks,
Paul.



--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


