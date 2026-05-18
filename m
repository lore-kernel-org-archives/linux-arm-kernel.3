Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC60CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6XeGKNj12ctbAKTuuVJw+MBHLoP2SCgG7eKfZnzwJI=; b=3KyCwLiQrtLec5hv59svq4vwl1
	fOisNCE7dqZ0k4PbCoTc9bZnOn926Zby/eMKRofscLkJzLGoTkcKLBx0gIMOOKLaibCsSX1WQmvtz
	wR0k9gzxO7ctnUIf6ttqDYm1DR/bupdZ2mE0jknc1nBNtiZ/O6YxU2tcYNsSBqoXcfVkwtyMJ60Xf
	lxbRaR0Z/tUbsUWCR51KvnYsTRiU2x32MTAe84qg3StmjHBGw1FMDETz6o//sicESPkfKZ954/2qb
	Ht7S+BM50QNp5fDRov8TnCvY8g8Hi/KF41NAoY+7IdFCLdreTGlWbswSJUC3WcvgRxhsHgatuvEAf
	lxl7ujyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0Hy-0000000GEF6-3uUG;
	Mon, 18 May 2026 15:53:54 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0Hw-0000000GEDX-3GLr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:53:54 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-bd8faef2e18so25005766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779119631; x=1779724431; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6XeGKNj12ctbAKTuuVJw+MBHLoP2SCgG7eKfZnzwJI=;
        b=qfqUnpO8Mi7uBAoh5CH1aYTF8ALI7dfu/6ej1fQHeh8WI1lIEp9jXgDXLjAA53KneI
         lBriD/SMvoidSc+aDK6uYNB+tLQWw9HJEyz7RaGPlCmkT+eKpwV8oVA3OPmjIg/ST4VZ
         YXJFbx4/C/mWokHS2S4WvMhAu5a1lwIscEeuRoZ/M2u1zu18Zh+VNEre0I6npkZp+SPH
         kWgx0JAMd5QjLVywG7u7NV38/M71egESv2qjp6ycQYGyqERYdqyFJyAQbxhCLBnZOL6i
         BPGr11msio0iJp9h12ko66Dj/qVeWyqQYt53azjDC+VERjmop4YAt66zxXcD+Mh/gMEi
         7ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119631; x=1779724431;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6XeGKNj12ctbAKTuuVJw+MBHLoP2SCgG7eKfZnzwJI=;
        b=Pp6owJdcRV8z08N8HFBRQKG9DE4hFy2pEGEtGlrA7idM0tHwEQ5WBZmgdE2N27atgM
         Ep90lk7/tdKyrL6YoWafwkC0+4P1HX+GOLgCr6HbSEsr4ibVg0rcXAOscaFDrr7v0WVj
         Frd8l1CZyCURYYCvQYvZGtgJgRApbKgb4jSpHwj5LIx6VRvfPjx4M8PiXw/AH5zmROLm
         KvdWrUEWeuaz8H8q8/qsh80vV4fXZpZut6Ps1mKfwwbdUUdEqhC8RS+EaOpOL+cbQVva
         HGB5x1pc3Ip32h2Ejwlrj0eYd/pKXgDH/j0bWsPV2bbtibr2ABOwrtCpN578IxXCALOj
         Xatg==
X-Forwarded-Encrypted: i=1; AFNElJ9ejCEMspFhI8ud3Co3ljOfUa6jvXj9dy57FVLAI7Ts+8POhY6j+QcYyTNh6Sgg1Rdg6VHHIKXpMchfbLgZYz4Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwBfYmkvkc+5I4aT2ZLvrbG4JOUVCwVKd/jIfsbuUSlGrBrBx0G
	TbqoV/w9lhRtQind/VQBuBpbffrqTDECemtmspMk+JFhqHvv4B9KQWMQeYg+A8f+rbU=
X-Gm-Gg: Acq92OGJqPdUh9Jtwvud0mn2vpdAO9DXXULkheqECRDtPJrjpOw+L8YjmH9D8oeYUUJ
	8UOViwiZrOREn9ZjtZbYp4m7hi2ktBDCKo3P4Yd1+1T5TxTZ9RUBNyGvvFAFv5jrQEMZ1oofen8
	xVDPfj4JH+SV6WBCnM15QJsX9vauYTYLX/7BUHMuiVhjG4JqlRkW/hbKTGk1GiPvfWXFNnoqKy9
	aZL6JQe7keDTzstFjy6VtH3fiN+tCBbJa5ygtva6WtFbrP9wvom0Uiw9SGnP5mPMj7DXAuOMB9H
	c4eXWs0RhMRvbRT1gBbwgFCr/WKAvV+Blm+SZTf8TsPyPJd5JUlNSTITFXEZlYE0rek3nNhLYZK
	DoVYItIybwB7RRNYRPK+VnrQ35UlV02QA2KrSHWTfRYNbMSBTFFjEuvdmaqqn6sZWtefuisiG9Z
	GpfiRUtdUCbG6YA711c8PdfOthUbBZvP6y1IEnTVdRVUG3R8dmcAHcdm58/U9YQrUL+OzXL+7UW
	eOIMj+SM9303s8J/A==
X-Received: by 2002:a17:907:d06:b0:bd3:331f:3ae7 with SMTP id a640c23a62f3a-bd51792a1c3mr904523566b.27.1779119630526;
        Mon, 18 May 2026 08:53:50 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec855sm586166166b.37.2026.05.18.08.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 08:53:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 16:53:49 +0100
Message-Id: <DILX9UGAMXLN.2WVL25FJ87HDK@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "Juan Yescas" <jyescas@google.com>
Subject: Re: [PATCH v3 2/2] mailbox: exynos: Add support for Exynos850
 mailbox
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, "Alim Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
 <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
 <9b6fce56-6a94-44fe-ab55-5394ec6065e4@linaro.org>
In-Reply-To: <9b6fce56-6a94-44fe-ab55-5394ec6065e4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_085352_870125_75631895 
X-CRM114-Status: GOOD (  30.13  )
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

On Thu Apr 30, 2026 at 12:01 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,

Hi Tudor,

> The abstraction is clean. Few comments below.
>
> On 4/29/26 10:00 PM, Alexey Klimov wrote:
>> Exynos850-based platforms support ACPM and has similar workflow
>> of communicating with ACPM via mailbox, however mailbox controller
>> registers are located at different offsets and writes/reads could be
>> different. To distinguish between such different behaviours,
>> the registers offsets for Exynos850 and the platform-specific data
>> structs are introduced and configuration is described in such structs
>> for gs101 and exynos850 based SoCs. Probe routine now selects the
>> corresponding platform-specific data via device_get_match_data().
>>=20
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/mailbox/exynos-mailbox.c | 59 +++++++++++++++++++++++++++++++++=
+++++--
>>  1 file changed, 56 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-m=
ailbox.c
>> index d2355b128ba4..11657dd475c0 100644
>> --- a/drivers/mailbox/exynos-mailbox.c
>> +++ b/drivers/mailbox/exynos-mailbox.c
>> @@ -31,14 +31,52 @@
>> =20
>>  #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>> =20
>> +#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*=
/
>> +#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
>> +
>> +#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
>> +
>> +/**
>> + * struct exynos_mbox_driver_data - platform-specific mailbox configura=
tion.
>> + * @intgr:		offset to the IRQ generation register, doorbell
>> + *			to APM co-processor.
>> + * @intgr_shift:	shift to apply to the value written to IRQ generation
>> + *			register.
>> + * @intmr:		offset to the IRQ mask register.
>> + * @intmr_mask:		value to write to the mask register to mask out all
>> + *			interrupts.
>> + */
>> +struct exynos_mbox_driver_data {
>> +	u16 intgr;
>> +	u16 intgr_shift;
>> +	u16 intmr;
>> +	u16 intmr_mask;
>> +};
>
> using u16 for intmr_mask is slightly problematic. Down in the probe
> function, you pass it to writel():
> 	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
>
> writel() explicitly expects a 32-bit (u32) value. While the compiler will
> implicitly promote the u16 to a 32-bit integer, memory-mapped I/O masks
> should generally match the width of the register being written to. If a
> future SoC requires a 32-bit mask (e.g., GENMASK(31, 0)), the u16 will
> silently truncate it.
>
> u32 for all fields is generally preferred in kernel platform data structs
> for padding/alignment reasons.

Sure. Thanks. I can switch it to u32.

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
>> +	.intgr =3D EXYNOS850_MBOX_INTGR0,
>> +	.intgr_shift =3D 16,
>> +	.intmr =3D EXYNOS850_MBOX_INTMR1,
>> +	.intmr_mask =3D EXYNOS850_MBOX_INTMR1_MASK,
>> +};
>> +
>> +static const struct exynos_mbox_driver_data exynos_gs101_mbox_data =3D =
{
>> +	.intgr =3D EXYNOS_MBOX_INTGR1,
>> +	.intgr_shift =3D 0,
>> +	.intmr =3D EXYNOS_MBOX_INTMR0,
>> +	.intmr_mask =3D EXYNOS_MBOX_INTMR0_MASK,
>>  };
>> =20
>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>> @@ -57,7 +95,9 @@ static int exynos_mbox_send_data(struct mbox_chan *cha=
n, void *data)
>>  		return -EINVAL;
>>  	}
>> =20
>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>> +	/* Ring the doorbell */
>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
>> +	       exynos_mbox->regs + exynos_mbox->data->intgr);
>> =20
>>  	return 0;
>>  }
>> @@ -87,13 +127,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struc=
t mbox_controller *mbox,
>>  }
>> =20
>>  static const struct of_device_id exynos_mbox_match[] =3D {
>> -	{ .compatible =3D "google,gs101-mbox" },
>> +	{
>> +		.compatible =3D "google,gs101-mbox",
>> +		.data =3D &exynos_gs101_mbox_data
>> +	},
>> +	{
>> +		.compatible =3D "samsung,exynos850-mbox",
>> +		.data =3D &exynos850_mbox_data
>> +	},
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(of, exynos_mbox_match);
>> =20
>>  static int exynos_mbox_probe(struct platform_device *pdev)
>>  {
>> +	const struct exynos_mbox_driver_data *data;
>>  	struct device *dev =3D &pdev->dev;
>>  	struct exynos_mbox *exynos_mbox;
>>  	struct mbox_controller *mbox;
>> @@ -122,6 +170,11 @@ static int exynos_mbox_probe(struct platform_device=
 *pdev)
>>  		return dev_err_probe(dev, PTR_ERR(pclk),
>>  				     "Failed to enable clock.\n");
>> =20
>> +	data =3D device_get_match_data(&pdev->dev);
>> +	if (!data)
>> +		return -ENODEV;
>
> you shall move this first thing in probe() to avoid doing allocations
> gratuitously on null match data.

Ack.

>> +
>> +	exynos_mbox->data =3D data;
>>  	mbox->num_chans =3D EXYNOS_MBOX_CHAN_COUNT;
>
> EXYNOS_MBOX_CHAN_COUNT is globally defined as:
> #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>
> Does the Exynos850 have the exact same number of channels as the GS101?
>
> You may move num_chans into struct exynos_mbox_driver_data alongside the
> register offsets so each SoC explicitly declares its channel capacity.

Here:

=3D> md 2040000 <--- sram_base + initdata_base
02040000: 000063bc 00000007 0000650c 00000013  .c.......e......
02040010: 00000000 00000007 0000000b 0000000e  ................
				^^^^
02040020: 00000000 00000000 00000013 00000009  ................
02040030: 00008000 00008008 0000800c 00008010  ................
02040040: 00000010 0000017f 00007800 00000080  .........x......
02040050: 0001f800 00004000 00000300 00000010  .....@..........
02040060: 66633931 20613261 65766164 00383130  19cfa2a dave018.
02040070: 00000000 00000000 3a393000 353a3133  .........09:31:5
02040080: 65462034 31312062 32303220 00000030  4 Feb 11 2020...
02040090: 00000000 0000001b 00000002 00ff00df  ................

So it looks like the ipc_ap_max field is equal to 0xb.

[   12.972113] exynos-acpm-protocol firmware:power-management: calling acpm=
_channels_init
[   12.972216] acpm_channels_init: acpm->num_chans=3Db.
[   12.975541] exynos-acpm-protocol firmware:power-management: ID =3D 0 pol=
l =3D 1, mlen =3D 16, qlen =3D 15
[   12.976522] exynos-acpm-protocol firmware:power-management: calling acpm=
_channels_init
[   12.979336] acpm_channels_init: acpm->num_chans=3Db.
[   12.984133] exynos-acpm-protocol firmware:power-management: ID =3D 0 pol=
l =3D 1, mlen =3D 16, qlen =3D 15
[   12.993849] exynos-acpm-protocol firmware:power-management: ID =3D 1 pol=
l =3D 1, mlen =3D 16, qlen =3D 3
[   13.001756] exynos-acpm-protocol firmware:power-management: ID =3D 2 pol=
l =3D 1, mlen =3D 16, qlen =3D 5
[   13.010519] exynos-acpm-protocol firmware:power-management: ID =3D 3 pol=
l =3D 0, mlen =3D 16, qlen =3D 1
[   13.019317] exynos-acpm-protocol firmware:power-management: ID =3D 4 pol=
l =3D 1, mlen =3D 16, qlen =3D 3
[   13.028073] exynos-acpm-protocol firmware:power-management: ID =3D 5 pol=
l =3D 0, mlen =3D 16, qlen =3D 1
[   13.036805] exynos-acpm-protocol firmware:power-management: ID =3D 6 pol=
l =3D 0, mlen =3D 16, qlen =3D 1
[   13.050945] exynos-acpm-protocol firmware:power-management: ID =3D 7 pol=
l =3D 1, mlen =3D 2, qlen =3D 1
[   13.065791] exynos-acpm-protocol firmware:power-management: ID =3D 8 pol=
l =3D 1, mlen =3D 2, qlen =3D 1
[   13.079592] exynos-acpm-protocol firmware:power-management: ID =3D 9 pol=
l =3D 1, mlen =3D 16, qlen =3D 7
[   13.088398] exynos-acpm-protocol firmware:power-management: ID =3D 10 po=
ll =3D 1, mlen =3D 8, qlen =3D 1

That's what sram + initdata provides but I guess these are implemented
number of channels of ACPM firmware (when APM communicates with AP CPU).
The mailbox hardware register though can process or consume 16 bits or
in other words HWEIGHT32(GENMASK(15, 0)). I guess this field should
indicate hardware capability of mbox hardware like max number of
possible channels? I'll change the code to use HWEIGHT32(mask) of
corresponding register then.

Or should there be a call to acpm firmware driver to query the number
of channels? Or should we get it from device tree?

Does gs101 have less than 16 number of ACPM ap channels?

Best regards,
Alexey

