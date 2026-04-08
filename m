Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C792E1073CB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5yV3renFUCMzTGFq9ONgz22Ec7d4PCew4CFxTTtr88=; b=tEbCCh292BNrAxpWIhsMK6Ruqj
	TCTIoRyUhW7KLyTQwxislID/BQur6On41R0Xsp5ueUvIjtSTZaDTEe6LXdfbikrzK7uV6zkX4jU6Z
	AKG2eR5T2ypdiEZvF86TEEvmwjfknjehfqsQ7hz0V/xF+z4Z9RsGBbi5g1LY0R5QtHlZ7G46ztGOB
	rsjyrhPb9j3tR7cW1Vq2bp5ZSYxIxuoSldqqtxvGi7qocEsa+AcGM3aPGacYtifCWsn26m6aMCTqG
	zll9uyfTZcs227Mit/zlgxHlihiou+GZm/A8E/Vl2ERHNspasco9WP0zCKO8368NgB8Vp6my/QJLg
	uPQ8xoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASdb-00000008tPH-1G59;
	Wed, 08 Apr 2026 13:08:07 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASdY-00000008tOH-0f69
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 13:08:05 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b9c01854477so1039172666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775653682; x=1776258482; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5yV3renFUCMzTGFq9ONgz22Ec7d4PCew4CFxTTtr88=;
        b=xIRVngZMVnzvCd3nkwTUEaUnDsbPGIlfBrBiGb87h9SYknsvapPFgdfTpc1AHxk8Dl
         OK1KkoGHkm6NDvCo72JRL5K1Wv2wH/X63j0RiFfW/gBlWOoHkyJndNdU3Q0uoQl94teW
         xeBx6kcdou2SigEGw8AQC68FOO+L+IRtWvGu2W0IrbRrWdTDAwxlqXr0f2lYxguWrKl6
         +wVIIeBuY2ZtMFdu1bWnG/pXiTZjkW1bKxovm7oHlNizwI2IvyWCa8oUimka3YgjyuKY
         GKwgOrEckdWnnQTW+unlb1DAbPuwO9XvOrIkizaS90PQ4tGjYzut14DSxpGFYWKLuAPn
         kxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653682; x=1776258482;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5yV3renFUCMzTGFq9ONgz22Ec7d4PCew4CFxTTtr88=;
        b=a42hLFQYZA7HTIRv6Uy0bztotcBsqQqSIbLJzumV26hLsUtkXt5+powY6XNOeTui6t
         W6kieOvmE/Aha3/mbvZHtg+1ccKZV3QoP9CAtuPGt0Djkbb+df6yXb8PFknIpWO/S11V
         Z88g0RBhbqqt8uNgrSBR721c7Vkqhn3ZsuCRVhTL9rDtxTnH3Adl6dCGZhQCnS8s0UXo
         w+LvQhQboag3IRqqZardJu56KOGNv/zBaeJXm4BXvPYCKbvJkK43NXHMc13XNTU4uFm4
         qfLh7/3/69DAukLo+uhTjABhdEfTzuLi3AXkF4tRMYLPMLVfxnlBj4vjjoFR/0b1BTa8
         nnWg==
X-Forwarded-Encrypted: i=1; AJvYcCXJMbufeChXg6kXS+SlMIU1o5YQ5Q01/rnGRdakmwl25EBkZQdRmdz8u3A9rfc7RL+NEF/VzaiP0gj52thNCql0@lists.infradead.org
X-Gm-Message-State: AOJu0YzeV2n886opr2gFZdgMnS8XNmHUHJm02OfohxMbHsyudfPp49eb
	DiNfqCyqdqx44K51GYCQpJMTf6FuAHy5UeXHZ8HBX+erP8vdYv0iLknD3gAEBBz0Ua4=
X-Gm-Gg: AeBDievC2L24RQqNiaFP0rm+JYIezRxUaKA5tZ/wm92JmtAXYPgDHIADAr+qhs4gvHQ
	0KXuJoApa+1p+bsCnnozpKNBrgXGIwKA60CeR+//Dq6OL6jLQEr+Kqf8URI6G0+eyRWbyp+RiyD
	1xzhoQckrn7SaTCzu4zVCSD7QVTQOymXTkOZGJDThZZQ/HXPLdF2Mm7JY+EuRrdYkjxojNLVev+
	DLCi4lIxzwWSUPTVNpnGG03MA5ub9Comvgk5LFMLeAseCrMPWr1RqD2VyuqjGS/Bgvlw/5bx+kb
	lz85oY+SLITuRcB+FP7I8bSSAXdvGWgRvYeaVJjxVRIrC14ozG4bx0o8aSJJ6JytYXH2cIkBEgk
	rT5rByrqlXteKJZYOOW09rWUJeATdoc9uxAFslTJDHtd/E4mS+sGE2sl9NGn4V8O/HBem3N99HF
	iCx6LvamKGQQAvYFH6gSy/eW7uI4bCtwW14F6GYk9ENIMwPVeWXGGdCZbGz8FZN8mSZc/8QTE7f
	19B4Qo8VN32PsPqFA==
X-Received: by 2002:a17:906:478e:b0:b98:1129:51 with SMTP id a640c23a62f3a-b9c675492c5mr1034699866b.17.1775653681583;
        Wed, 08 Apr 2026 06:08:01 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3a6a48f3sm24687366b.58.2026.04.08.06.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:08:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 14:08:00 +0100
Message-Id: <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850
 mailbox
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
In-Reply-To: <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_060804_252543_6170F875 
X-CRM114-Status: GOOD (  30.82  )
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

Hi Tudor,

On Thu Apr 2, 2026 at 9:42 AM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> On 4/2/26 5:20 AM, Alexey Klimov wrote:
>> Exynos850-based platforms support ACPM and has similar workflow
>> of communicating with ACPM via mailbox, however mailbox controller
>> registers are located at different offsets and writes/reads could be
>> different. To distinguish between such different behaviours,
>> the registers offsets for Exynos850 and the platform-specific data
>> structs are introduced and configuration is described in such structs
>> for gs101 and exynos850 based SoCs. Probe routine now selects the
>> corresponding platform-specific data via device_get_match_data().
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/mailbox/exynos-mailbox.c | 67 +++++++++++++++++++++++++++++++++=
+++++--
>>  1 file changed, 64 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-m=
ailbox.c
>> index d2355b128ba4..f9c59c07558a 100644
>> --- a/drivers/mailbox/exynos-mailbox.c
>> +++ b/drivers/mailbox/exynos-mailbox.c
>> @@ -31,14 +31,61 @@
>> =20
>>  #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>> =20
>> +#define EXYNOS850_MBOX_MCUCTRL		0x0	/* Mailbox Control Register		*/
>> +#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*=
/
>> +#define EXYNOS850_MBOX_INTCR0		0x0C	/* Interrupt Clear Register 0		*/
>> +#define EXYNOS850_MBOX_INTMR0		0x10	/* Interrupt Mask Register 0		*/
>> +#define EXYNOS850_MBOX_INTSR0		0x14	/* Interrupt Status Register 0		*/
>> +#define EXYNOS850_MBOX_INTMSR0		0x18	/* Interrupt Mask Status Register =
0	*/
>> +#define EXYNOS850_MBOX_INTGR1		0x1C	/* Interrupt Generation Register 1	=
*/
>> +#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
>> +#define EXYNOS850_MBOX_INTSR1		0x28	/* Interrupt Status Register 1		*/
>> +#define EXYNOS850_MBOX_INTMSR1		0x2C	/* Interrupt Mask Status Register =
1	*/
>> +#define EXYNOS850_MBOX_VERSION		0x70
>
> Please consider defining just the registers that are used, to not
> pollute the driver. You may drop the unused gs101 definitions too.=20

Sure. Thanks. I was surprised how many unused defines were introduced
by gs101 SoC in the first place all over.

>> +#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
>> +
>> +/**
>> + * struct exynos_mbox_driver_data - platform-specific mailbox configura=
tion.
>> + * @irq_doorbell_offset:	offset to the IRQ generation register, doorbel=
l
>> + *				to APM co-processor.
>> + * @irq_doorbell_shift:		shift to apply to the value written to IRQ
>> + *				generation register.
>> + * @irq_mask_offset:		offset to the IRQ mask register.
>> + * @irq_mask_value:		value to right to the mask register to mask out
>> + *				all interrupts.
>> + */
>> +struct exynos_mbox_driver_data {
>> +	u16 irq_doorbell_offset;
>> +	u16 irq_doorbell_shift;
>> +	u16 irq_mask_offset;
>> +	u16 irq_mask_value;
>> +};
>> +
>>  /**
>>   * struct exynos_mbox - driver's private data.
>>   * @regs:	mailbox registers base address.
>>   * @mbox:	pointer to the mailbox controller.
>> + * @data:	pointer to driver platform-specific data.
>>   */
>>  struct exynos_mbox {
>>  	void __iomem *regs;
>>  	struct mbox_controller *mbox;
>> +	const struct exynos_mbox_driver_data *data;
>> +};
>> +
>> +static const struct exynos_mbox_driver_data exynos850_mbox_data =3D {
>> +	.irq_doorbell_offset =3D EXYNOS850_MBOX_INTGR0,
>> +	.irq_doorbell_shift =3D 16,
>> +	.irq_mask_offset =3D EXYNOS850_MBOX_INTMR1,
>> +	.irq_mask_value =3D EXYNOS850_MBOX_INTMR1_MASK,
>> +};
>> +
>> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data =3D =
{
>> +	.irq_doorbell_offset =3D EXYNOS_MBOX_INTGR1,
>> +	.irq_doorbell_shift =3D 0,
>> +	.irq_mask_offset =3D EXYNOS_MBOX_INTMR0,
>> +	.irq_mask_value =3D EXYNOS_MBOX_INTMR0_MASK,
>>  };
>
> I find it strange that the SoCs use different registers. Are you sure you=
're
> using the right direction? i.e. ring the doorbell to APM and not to AP?

Well, I am not sure I correctly understood the questions and comment. So,
this all was tested with ACPM TMU code with 3 temp sensors and it seems
to work and sensors react in the right way.

Downstream clearly does the following (see also [1],[2]) when sending
ACPM msg:

static void apm_interrupt_gen(unsigned int id)
{
	/* APM NVIC INTERRUPT GENERATE */
	writel((1 << id) << 16, acpm_ipc->intr + INTGR0);
}

I am aware that gs101 downstream uses INTGR1 in apm_interrupt_gen().

When I use INTGR1 for e850 then I observe acpm timeouts. Hence, out of
curiosity, what's the expected behaviour when/if I ring the doorbell to
AP (to itself as far as I understand)? My understanding that it won't
work at all in such case unless APM firmware does some very fast
polling.


[1]: https://gitlab.com/Linaro/96boards/e850-96/kernel/-/blob/android-exyno=
s-4.14-linaro/drivers/soc/samsung/acpm/acpm_ipc.c?ref_type=3Dheads#L423
[2]: https://github.com/samsungexynos850/android_kernel_samsung_exynos850/b=
lob/0af517be2336bf8e09c59d576c4c314446713101/drivers/soc/samsung/acpm/acpm_=
ipc.c#L426

>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *ch=
an, void *data)
>>  		return -EINVAL;
>>  	}
>> =20
>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>
> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask instea=
d of
> a shift.
>
> I would rename irq_doorbell_offset to intgr. It aligns with the register =
name
> from the datasheet. You won't need to prepend _offset to the name, we alr=
eady
> see it's an offset when doing the writel().

Sure. Thanks. Let's use FIELD_PREP.

"doorbell" naming was chosen for readability and maintainability reasons.
It seems to be more generic enough name that better reflects the workflow
of what's going on in ACPM+mailbox machinery. We can rename it to just
"doorbell" for instance.

From platform data it will be clear to which register it is set, INTGR0
or INTGR1, to align it with datasheet (which is closed anyway).

Regarding intgr vs doorbell name, the intgr is a bit unclear for a
reader if it means interrupt generation register or something else.
But if you prefer, I can go with "intgr".

One more option is add a comment, smth like /* Ring the doorbell */
before that writel().

[..]

>> @@ -133,7 +194,7 @@ static int exynos_mbox_probe(struct platform_device =
*pdev)
>>  	platform_set_drvdata(pdev, exynos_mbox);
>> =20
>>  	/* Mask out all interrupts. We support just polling channels for now. =
*/
>> -	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0=
);
>> +	writel(data->irq_mask_value, exynos_mbox->regs + data->irq_mask_offset=
);
>> =20
>
> and here I would s/irq_mask_value/intmr_mask and irq_mask_offset/intmr.

Ack. Thanks.

Best regards,
Alexey

