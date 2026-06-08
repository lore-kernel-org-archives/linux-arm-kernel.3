Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB73CCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrVSE6aneU5Bzz2XD7Cd2Q0n7A9MLLyGaboZM28LhJA=; b=4LQ7MFl7tJWhWduBaXa/VQZ5N8
	OTtfUdPXDHS9WTZJiMeDxyn0dQbb9DsUIqgZruzj/+m5hhk+SNH+vrzpPzpxR6GHK/Ez2EtNn8CgL
	oMvMWBc7uq6vBpA3WF3550vkVElMm4BL89lrCZiXufIQRyd1Fpgue9iYqrFlmd0or338RGg4ZMQyO
	ZirwaDnsNZTOYEE1okKrH7mCuiPlKZo8YE30ECVtvQlsXrht4rmf0kL+3nNUU3jHoAB21MbhQrvpS
	dtC3YuSihuLYq3YzA+FMl5tgb0VaOUpsqMYAaX95k3GyB50aulc71c0u68vdU4CYX1NJhRrAqvEmP
	6PJUgUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWagb-00000003hnu-18v2;
	Mon, 08 Jun 2026 14:10:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWagZ-00000003hna-3zZ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:10:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D897860208
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1F81F008A0
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927837;
	bh=PrVSE6aneU5Bzz2XD7Cd2Q0n7A9MLLyGaboZM28LhJA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=W+E5T850k/pcWFfsOhMMTnmpzYRqG4IXAuOT03FOFnDhJGvB5QsEHc1/u4fsmCvr/
	 anPg5+E4AzcGYoc2V89dPnE869DvhegibObs8JyULT4LuNRgJvtU/fmwaQ26osiDVq
	 0IthpFW1K7aObdKLFRwesKUBilKUmGtKK76i+92zKJoyJ+DpKS/8HvakLasfmay1Da
	 4HYlSSfD4rFadGXQCs4XBuObPSOcW6xNDovSiAmTtD9iqD91yLi05nYDQOfCM/KLO5
	 RVC2845d2ytItmG5XxdLDnR6/AT/xXl5BfXH2Sp93x3Msqijtml7oKDMM0J2v0lBHa
	 UsfgTyY7x8ABg==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-138129a622dso362153c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:10:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/58G0T7FzO6Wzy+lBNBvoUQd7gObRoSYkElvF/CgbUgYSKVGCkPKKk8UXHFZeHZf7OgWJ1rTC6IJ3UqRwsTQH4@lists.infradead.org
X-Gm-Message-State: AOJu0YyEV/Eaglw/1krAUipoQn22lrnUBEhGUTu7KxcUOojrXCIH2wM0
	BK31il5opbsbNri/PEX8+dvZ+N4nCPQLrcN06KVggVywxdfsX7ExD/qf7rLJHOczLe10GCB/vRt
	JWp3oa8o7nzt7+6FZgVBgwHgqyDRC73juw4UvF56B4A==
X-Received: by 2002:a05:7022:38e:b0:138:5ae:3eaa with SMTP id
 a92af1059eb24-1380666889cmr8618060c88.9.1780927836722; Mon, 08 Jun 2026
 07:10:36 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:10:32 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:10:32 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ah92oEavMu4QRn8y@ashevche-desk.local>
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com> <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com> <ah92oEavMu4QRn8y@ashevche-desk.local>
Date: Mon, 8 Jun 2026 09:10:32 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
X-Gm-Features: AVVi8CcAz4YtcQCT50U6nbCProIEsU4DtxX8RzXUqk3r8sd3Dvk2sHxbtefZrDw
Message-ID: <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip() accessor
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: "linusw@kernel.org" <linusw@kernel.org>, "mwalle@kernel.org" <mwalle@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>, 
	"wbg@kernel.org" <wbg@kernel.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>, 
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>, 
	"dlechner@baylibre.com" <dlechner@baylibre.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	"brgl@kernel.org" <brgl@kernel.org>, =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 3 Jun 2026 02:34:40 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Mon, May 25, 2026 at 12:04:09PM +0000, Yu-Chun Lin [=E6=9E=97=E7=A5=90=
=E5=90=9B] wrote:
>> > On Tue, May 12, 2026 at 11:33:12AM +0800, Yu-Chun Lin wrote:
>> > > Expose an accessor function to retrieve the gpio_chip pointer from a
>> > > gpio_regmap instance.
>> > >
>> > > This is needed by drivers that use gpio_regmap but also manage their
>> > > own irq_chip, where gpiochip_enable_irq()/gpiochip_disable_irq() mus=
t
>> > > be called with the gpio_chip pointer.
>> > >
>> > > Add gpio_regmap_get_gpiochip() to allow drivers with complex custom
>> > > IRQ implementations.
>> >
>> > Hmm... Can't we rather add
>> > gpio_regmap_enable_irq()/gpio_regmap_disable_irq()
>> > that take regmap or GPIO regmap (whatever suits better for the purpose=
) and
>> > do the magic inside GPIO regmap library code?
>
>> Thanks for the review! I apologize for the misleading commit message.
>> The real reason I need the struct gpio_chip pointer is to properly set u=
p a custom
>> IRQ domain. Our SoC GPIO controller is quite complex. It routes differen=
t trigger
>> types to multiple parent IRQs, which doesn't fit the generic regmap_irq =
framework.
>> Therefore, we have to create our own irq_domain and pass it to
>> gpio_regmap_config.irq_domain.
>>
>> The core problem occurs inside our custom irq_domain_ops.map() callback:
>>
>> static int rtd1625_gpio_irq_map(struct irq_domain *domain, unsigned int =
irq,
>>                                 irq_hw_number_t hwirq)
>> {
>> 	struct rtd1625_gpio *data =3D domain->host_data;
>> 	struct gpio_chip *gc =3D data->gpio_chip;
>>
>> 	/*
>> 	 * The second argument MUST be struct gpio_chip *.
>> 	 * If we pass our custom data structure here, the kernel will panic lat=
er
>> 	 * in gpiochip_irq_reqres() when it calls irq_data_get_irq_chip_data()
>> 	 * and strictly expects it to be a gpio_chip.
>> 	 */
>> 	irq_set_chip_data(irq, gc);
>>
>> 	irq_set_lockdep_class(irq, &rtd1625_gpio_irq_lock_class,
>> 				&rtd1625_gpio_irq_request_class);
>>
>> 	irq_set_chip_and_handler(irq, &rtd1625_iso_gpio_irq_chip, handle_bad_ir=
q);
>> 	irq_set_noprobe(irq);
>>
>> 	return 0;
>> }
>>
>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retrieve =
the
>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requirement=
s in our
>> map() function.
>
> This is all good and needs to be depicted in the cover-letter and/or comm=
it message.
>
>> Before I send a v4, I see 3 possible paths:
>>
>> Option 1: Keep the accessor (Current v3 approach)
>> We keep gpio_regmap_get_gpiochip() but I will completely rewrite the com=
mit message
>> to explain the custom irq_domain_ops.map and lockdep requirements.
>>
>> Option 2: Let gpiolib create the irq_domain via gpio_regmap_config
>> Instead of creating the irq_domain in our driver, we add all necessary I=
RQ fields
>> (irq_chip, irq_handler, irq_parents, etc.) into struct gpio_regmap_confi=
g. Then
>> gpio-regmap.c populates the gpio_irq_chip structure before calling
>> gpiochip_add_data(). This prevents an early return and allows the core g=
piolib
>> (gpiochip_add_irqchip()) to automatically create the irq_domain for us.
>> Drawback: This adds a lot of fields to gpio_regmap_config and might viol=
ate the
>> original design philosophy of gpio-regmap.c (commit ebe363197e52), which=
 explicitly
>> states that it does not implement its own IRQ chip and delegates it to t=
he parent
>> driver.
>>
>> Option 3: Drop gpio-regmap entirely (Revert to v2 approach)
>> Currently, all drivers using gpio-regmap (mostly simple CPLDs and extern=
al I/O cards)
>> use regmap-irq to get their domain. Since our SoC has a complex IRQ rout=
ing scheme
>> with multiple parents, maybe gpio-regmap is simply not the right tool fo=
r this
>> hardware, and we should just implement a standard GPIO driver directly u=
sing gpiolib.
>>
>> Which approach would you prefer upstream?
>
> This question to Bart, Linus, and poissibly gpio-regmap stakeholders. I'm=
 not sure
> that my personal opinion will be the best fit here.
>

My preference would be for #2 but I understand that this could risk getting
stuck in endless bikeshedding so I'm fine with going #3 with potential for
future refactoring if we have more similar users.

Bart

