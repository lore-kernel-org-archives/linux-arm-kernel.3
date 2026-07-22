Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827D0C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 03:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=; b=nJwX+xw0454dGsovrhOmzxYTsR
	7+4u8d9CUrDc5weXlF5iLlhjgFWYbvI79yucE9w2qmHCipejiqEb4OYTvY1wP5k7eg/CQdcvh84Hf
	fwUqRB69LDpyhTLRjrnZ2VMRkL+pYIb3+AXdrZ5geioXOKEw7EAk8HgQPe3guqZ5f40+KBMpSX4uk
	B6ekQZiawNQYDuFSfH9qNKgUSVAX5C7xkBORTgXmZ63Y0whh14HyhjH+tk2aDORKd44AKAxE+W0u7
	TOh+Rl6wzQXyin3Y8LE9950DEEX1XN5K/CVo3U/1RAVC9k4v1HLXrCeMGvkOiG9ZwbLGKu+CQWrfZ
	qjLrJPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNiY-0000000AorK-2QPi;
	Wed, 22 Jul 2026 03:33:58 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNiV-0000000AoqO-0ON7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 03:33:56 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-668296d0ff3so6553860d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 20:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784691233; cv=none;
        d=google.com; s=arc-20260327;
        b=iA8kEDawunnbRbNCuiQfah/k3FskclXTZGVC5qOFok/UpDXJZjLUH2uD/2zZVWBgfe
         kb282bq1z6+sbE7tD2UVATb5Sm8TTnKbt+hZciq85ZlQznfeaU+DFO2B6J336pzQ9XIA
         vrboZNAmX/WzBV0YgLJHv1ZsORhcR9kerk5Ns69GqtbpSmM7O3NwGU+kQNysMH910MSy
         kS+AWvDfNI32vS0Trs98zGxwuFZfASTGrfECtfqbV7RLA0Gfc54Tfftm9jZQ9tAJQT/s
         mS90KUrS5wpuNvUr4or1AGtUbh1YuixYf1KAmzTvtnof9yUwO/g+VKCV0lHODqWkM0bV
         o4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=;
        fh=uW4mZO7xCGMI+mYv/UU4veOZ6x69+ljLyyem5jkumI8=;
        b=rxVSAmKnh813aaSh8b+Y1Z8RmTZNb5frTrGaVY4YWnhS4gtQWjh4FQZGG2bBg0Tu+b
         xRmuRTrD6GNDNUvrkVWz/M8yl9v2T0JG6lrMQGbAWdgRczllY8pejqcRviJhirkrSaBp
         Gc3HMvoH1ffRK3cHIyhe2PZW2hZpP08z/Ftr2B77u87LXLs3+aOwJqEXPhRq2Cxl9c/f
         ODMt87p1k8V5RPipkKj8aWPGHHQFHU/tiEEvQ7L8X+qxeYUCMKCvpXY7ZpXmr1ZjN5+N
         tYZd0GHWAc5Kgkbc339Sz2naUHMAKRXn7y2UlOKeJilRZXMyMIIH7+jQwKWMWydOpFGg
         Fa5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784691233; x=1785296033; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=;
        b=ImXcz4INsqG2ZCPMtbtmsQzgP/iY/pgrhTJJYGPdOyppK+6yptGIXmofbM485haHcX
         A+X9PInyyjPcWKBecRzzrg14cFdyuE5SP1eXvTluygQQrjKI+OjThXmmccMq+xWjcT7V
         GjyDSbZpBU+K9pNuadj6LI5yzFKYp8qX8WPtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691233; x=1785296033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=;
        b=RnUgecO3GxPn7LmVhOzeKdoJHQ6hhmr3P5nR2d+MXOkkD/RgmF9++w7E3XMhIokmwL
         vP8J75XYqkOf6iPgQUYs2rZF1ib4UFk/k4Jl1A8jBlYqaw3By6emgeJssIa5yDtHTxTr
         rORk1Q8Dgb/OLCJ+hzvfthTeFUnyN/OUcsH0v4ceGI4YWlGKiw7m1ChaK9VkYHmfUIQD
         7nYvhdOjjl3dsQ1ke7aB4gFKszLIrb/SyiyzTPuLUIpCz48mf8iJwVDWcolla22r/om4
         /2FtD4HyFd/4OrssCKiauonKNMpbCBOwEsxaYErIrgdgBQuAbFt3X/0hY7vTZqOuU6ps
         ijZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRN5w1r8YgU1cLklmY07Zaeb5pqStemwdlL10kR0Oo4WBBO25m7FSjjguNL6Xc8o4LV7JXRta31P8itVKJoBlY@lists.infradead.org
X-Gm-Message-State: AOJu0YxlM4mjr3ECnsmuV7sWGUsEg/VkOx+cGczLptra1hWtkEZ25Mfl
	20OBJQd5mliuB4Ugpu7UieHi9bOqGbjROIY3OXIyHtGTW/Zzl06y606ykDpMmHCYjeWhR/IYtwM
	Fep7OtSuhIk5t1ZQMB0Rw46QNd2s9P7rbxj3p2Hy2AZUt8fYcsgjw6g==
X-Gm-Gg: AR+sD10tE7FlG1MO1wSbVzDixmWTvUNuFkmOKeZEyZAXhFngNwK2neWupwDEmk0f+1v
	myyMQjlU74GLEdoXGbnhj+Qz8SuMq2ncn3Qo3clvyiFyXS+aATJtbgTTlzjnK85VspGZr8bf9Hv
	eysRLboRbdSCEovrLVXO4Pd8JcnD5W+FJuaxoBTuwUayqz7kN/1piIP7bLyOlzO3CUdyg+Rfv72
	0CtYnaOyoVgjSt3E/gkNk9PkbPmgXvKqq7K7E9QrO3uBTQjseHBfoIOuM4Hb+QLs5WRj7qqMXiE
	TZjfgmNsvAXpQU8=
X-Received: by 2002:a05:690c:6e82:b0:80d:f376:5ba9 with SMTP id
 00721157ae682-81ef252e359mr66727137b3.24.1784691233300; Tue, 21 Jul 2026
 20:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-8-wenst@chromium.org>
 <al9JivV0SZCiOgK8@ashevche-desk.local>
In-Reply-To: <al9JivV0SZCiOgK8@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 11:33:41 +0800
X-Gm-Features: AUfX_mxYNc8IPOzIIfv3TBCyd0Fs8lnIBTuyeRs9t7NJj3-mYtf52pIbJvj-z9A
Message-ID: <CAGXv+5Es0RZiAdUj-Y3FEFHU4Km6XBOL-Gk2DbTLrF-OcD54cw@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203355_235153_1E985D63 
X-CRM114-Status: GOOD (  27.32  )
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

On Tue, Jul 21, 2026 at 6:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:21PM +0800, Chen-Yu Tsai wrote:
> > Up until now, the MT8173 elm/hana device tree has set the dedicated
> > regulator supplying the trackpad as always-on, simply because the Elan
> > driver was missing proper delays. As a result the delay for the
> > Synaptics trackpad was also omitted, as it was not strictly required
> > under such a model and delayed the availability of the trackpad to the
> > user.
> >
> > The Elan driver recently gained proper delays after power-up, with
> > adaptive skipping of the delay if the regulator was originally
> > on. The I2C HID driver and I2C OF component prober library gained
> > similar adaptive delay skipping. The device tree will be fixed to have
> > the regulator not be always on, and proper post-power-on delay time
> > added to the I2C HID device.
> >
> > Also add the post-power-on delay to the ChromeOS OF component prober,
> > so that if the regulator is off at the time of probing, the prober know=
s
> > to wait for the hardware to initialize.
>
> ...
>
> > +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
>
> >               /*
> >                * ELAN trackpad needs 2 ms for H/W init and 100 ms for F=
/W init.
> >                * Synaptics trackpad needs 100 ms.
> > -              * However, the regulator is set to "always-on", presumab=
ly to
> > -              * avoid this delay. The ELAN driver is also missing dela=
ys.
> >                */
> > -             .post_power_on_delay_ms =3D 0,
> > +             .post_power_on_delay_ms =3D 110,
>
> This and the other delay in the previous patches are all HW-related. What=
 if
> another touchpad gets connected? I mean that the delays for the certain H=
W
> should not affect other possible devices connected to the platform.

This is a complete laptop, not a development board. You can't just randomly
swap out the trackpad. The model AFAIK is no longer in production, and we
have already added all possible configurations to the device tree. And
there's no extra connector or pin header to attach additional peripherals.
If someone hacks their own device to swap out a trackpad, then handling
the additional bring-up should fall on them.

If you are referring to the delay for the other trackpad option, that is
100 ms, and is described in the device tree. See patch 8 of this series.

Any other device with different delay requirements should have its own
entry, not reuse this one. The information in the entry is tightly
coupled to the device tree anyway. I already corrected the other device
that incorrectly reused this entry [1]. We have some additional offenders
downstream, but nothing that can't be corrected in the same manner.


ChenYu

[1] https://lore.kernel.org/all/20260625060859.1020483-1-wenst@chromium.org=
/

