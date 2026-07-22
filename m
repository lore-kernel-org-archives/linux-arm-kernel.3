Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF91C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2nl4VWueEk9cKUhbw+kqvh7s/L/Uh+km+tAT2bP7fg=; b=YcDWOihTAjf8OeoslU8l3t9hBs
	NMExb2yDx5s7zqeC9C0GhDCx6+L+bcwSN9lPUuBjVyb9MDzMxVEpNkQxx00zT9RBha/glMoiiD1Uj
	TONWhh6OsH5Mqow8RZ+0h5Bs8UHI7lvGTdcm8yu+90CAGRwANB1iuxUDVEE6dJp7vJEdawUw6zjd6
	vD7a5joHVRlR9kgOHUkE8iEJzUy0iPmtPWZqucODqXvO3sUpBrp384VLv7rzlM/MI56hDAe1dCTuD
	UgZAEBDtcOb1FJAJdZQsyl6aNO36uQdXgTJFBDUZK+VI4FSzM5wtF5sH/TQ9sbuRYC1QFLaedwrto
	AlWg837g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTnL-0000000BUV7-22Su;
	Wed, 22 Jul 2026 10:03:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTnH-0000000BUTD-2fIF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:03:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AFB9860A78
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D6E1F01559
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 10:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784714594;
	bh=v2nl4VWueEk9cKUhbw+kqvh7s/L/Uh+km+tAT2bP7fg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aGMuUyLHguxVRr1lFjeEqsXxI5a3BDv/DaaV4zoODVdfUElN6OPq6bkx5ATub1s7X
	 NqCOBztx6noD+QfHAvSgTWe7vgJnIbtFqRfBncNwEd8MZhJAPkwQ6o1PmCErDh2eSF
	 54ujH4MI/X8WrSdzSMvJdDCh0pZpi+hUqSU2T1bUPAGLbQO4yixldnti713LXPNkci
	 YythZGNmbpNbSYX0SZ1YxdtUM26wau81e41aUGstklcHdYCONGNwfqBX6p8ICowp/6
	 g9HicL6hWe6OdIC4YCD4+8eDDyuWsnOkh3GMzOh/RFUuABV1W9tcDEy8Izwff+b8ok
	 dcHRMOjcvphAQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2aab18795so599960e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 03:03:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpQetCLo2YDGcyhByNoXPK2Qg/rCNMtg+e5K/5LrjzmWvJ7h9Fs8vy1sXrQ6vmWf2xUNBaOu/6F5ey/NyxRLTDW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+bGJM1HlBwiilOF4D/4i++JsxwPiTulGWIexl4ra9L0zoYVS0
	fEsFE4GjMF7jCmFZUVsJlgD0uXyeytvpgxpXSFa1IBIOZ3PX8eYlixh9+1i/5y7v3xdC5KcOIcS
	BeH6iuo7PzrgUkOTh/9+ysbPz3gQRwT3SmXcNsVeVOQ==
X-Received: by 2002:a05:6512:3185:b0:5ae:b2e3:fc24 with SMTP id
 2adb3069b0e04-5b28fabb0afmr5670333e87.60.1784714593132; Wed, 22 Jul 2026
 03:03:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:03:08 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:03:08 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5H_V+J0cvrYjMFdKAQVrPKxPdtimXMc+hwHenwxhb9mDQ@mail.gmail.com>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-4-wenst@chromium.org>
 <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com> <CAGXv+5H_V+J0cvrYjMFdKAQVrPKxPdtimXMc+hwHenwxhb9mDQ@mail.gmail.com>
Date: Wed, 22 Jul 2026 03:03:08 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfZ1Yk6OJaCGphTYToMVfe_UU4dhOGmGVCbwqBV9S-a2g@mail.gmail.com>
X-Gm-Features: AUfX_mz93U1zn17dWP9tyqRdXvFYbDQgxlYVyw0vjRryfcxfP9O2fsTk4G3zrhY
Message-ID: <CAMRc=MfZ1Yk6OJaCGphTYToMVfe_UU4dhOGmGVCbwqBV9S-a2g@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
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

On Wed, 22 Jul 2026 11:01:20 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Tue, Jul 21, 2026 at 5:08=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> >
>> > +/**
>> > + * pwrseq_power_is_on() - Queries the last requested state of the pow=
er sequencer.
>> > + * @desc: Descriptor referencing the power sequencer.
>> > + *
>> > + * This returns the last requested state of the power sequencer.
>> > + *
>> > + * Returns:
>> > + * On success, 1 for on and 0 for off; negative error number on failu=
re.
>> > + */
>> > +int pwrseq_power_is_on(struct pwrseq_desc *desc)
>> > +{
>> > +     if (!desc)
>> > +             return -EINVAL;
>> > +
>> > +     return desc->powered_on;
>> > +}
>> > +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
>> > +
>>
>> Didn't we agree on introducing an enum to make it future-proof for when =
we
>> also pull in pwrseq_is_controllable() from Loic?
>
> My bad. I misunderstood and thought it wasn't needed yet.

It's not technically needed *yet* but since we know where we're going, it
makes sense to be proactive.

>
>> I think this should work like so:
>>
>> enum {
>>         PWRSEQ_STATE_UNKNOWN,
>>         PWRSEQ_STATE_ON,
>>         PWRSEQ_STATE_OFF,
>> };
>>
>> int pwrseq_get_state(struct pwrseq_desc *desc)
>> {
>
> I think you still want this here?
>
>           if (!desc)
>                     return -EINVAL;
>
>

Yes.

Bart

