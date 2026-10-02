Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB87CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyfq5Z39i3Aa9ox1entG/vitb9px1bSDrzF3bMpTbqM=; b=ogxxoXQHKqt536iX1fLuHgkwXH
	ByeNpi3OEY9FZVmzuTX0NDc9C0H3pZmPHFr+BLI6w3QO+MG0zCRCiz/g/nMiaeqqmEJUMxegp/psS
	QOsOjiIMUQbXLcNpVw4+Qo5239B6MACPejrKDWyna8sAtaUeocHOCjBTP7AuXmzsV4u7j6WtjN6O9
	rz/RtFjav8gBqfxDulZHVLqZ61oQDyPfU1zaCAFCRUT88lXorbPffCbeMnPYozTCQXaM0W3XxdK0s
	zD8hul/sNNby5UpGd7vxaEShcscSIFlr+L++bMwJILpPbdalz0nXNR7axWVKMDM+yLxMCT0gBJ5DZ
	JlH/2qQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYL2-0000000AwYv-1ara;
	Fri, 02 Oct 2026 08:09:52 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYKy-0000000AwYW-0qqT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:09:51 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ce364488dso13127445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790928586; x=1791533386; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyfq5Z39i3Aa9ox1entG/vitb9px1bSDrzF3bMpTbqM=;
        b=MunIn17ZpjgdazIOny+TDwn7Yosp7OBx6tYWajTxrzjLnAR5H9THIqiid6LAUX/F7C
         3gVGBHND3THk0LqosxeDTAuVudLBi1hQoaw0FxqzuBQkPJWtkmv/WkHJlnOX4Iycs1qI
         wZxob0igutwH1D1tbUY/zAxpSsbN5co7Niiq04GW2SYeBDZKdy6+bMFIibD0VSOgxdPb
         BGB5JUhIrKVKz2ITjngvm7PCI2VMRdNY/SSryXhAlvFLERTW1ItVzvYzJ2PVYBfi8ILZ
         PTT+2AfUN/03SlwRQ6nE8RKSsmb8E9CG40uycxKAQHCRnZvYQP9zd/JsK+SA0anF/fMK
         /Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928586; x=1791533386;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyfq5Z39i3Aa9ox1entG/vitb9px1bSDrzF3bMpTbqM=;
        b=IAtiSiCOS+p5w/wKBxMoR3I0E6L1xwxChoY3T6ScbYTt6pbuRYOcvBipSxYJSZP3zY
         ScT836hAa8R6rNZUD/sQgHx7L3Zfc8xvc6eT+RTtO9uCy1x3fya9DEcPcOCIH6UKTb2W
         019p0b9ZqzEeuneUS56YcYm0ZVDIW1gRnTCBPvMcVBu6w/d5TnNkv82Zy1qsCIO2sQh7
         /1rCL1eZUVctS4Y6chYi9ON5B5SJSSD4EiKiEbZ9RB4AqViJhalzgwa1QeBrIPwiB4Hz
         Ik51NfeeAWx6Vea17/VuvBtjts86jAzvphQxGdAJkNWpswEqfQkT/fdcwFYwMjE0Flye
         S6Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwM1kXQFIvlIxGBnB6TR9QNW9lt5kdOc0cKIFQ8ZDLg5MqLycQ7pTPqZ+NG0cV2A19yqFhdHHCFUFcKduZTy6ka@lists.infradead.org
X-Gm-Message-State: AFuF++ny0iHYgabqvapso/SRhhpsMxPQW2l1brd0vX1Ua1mlQrioKvd3
	qMasc+er+kD0dr4U7B3r3Gr+SWGbvpr3az4WNLGYO1pIqMJr5WHXrqmcsLcWgxKOdoQ=
X-Gm-Gg: AYBFou3ufX672UoRCyfR840b2uTvDWSglBA91gBrhv19CdyYTPl16QVO3s9B0gUx/7W
	gOiVU+ith6RG+gJA9hD/Mlj7T/XYndrTtCU2v/Rwfw/h/JXKtyeEd6QyjbokCQCzK7jLLMJEARg
	CO3L4WQFn1qLD9qXNgMmDYEUv+c9m0vjO0XuDXA1QxDMZygr/RQI7Bv8MWZNZnQPnlJ95mDKNNF
	mN/pUD3GQInDcjbXacaL2IGNNIdTiadEH6Qg6NNkmQQb9qkt/+umD3VxjTJ8jYHqG9cIiMSRd9D
	TVf6pl7RkTm1Y8ZILNHKAKglQNHFBxqbgsRE70xEudAArg9rVCyAF4MNEG8t62nTbMm/gysNj5M
	A5yIlgUL6T0MOZwa25d3QcR+I63Rm6L6Gv+V0N/xRqdjo4g+TUFDTRVWg3I2IV7UqlRliEbAW3P
	G1wvBrXw2OLMoyu3TjVb/oRWtcBgQ4Q8/FQ7fYBUyOFQU1IOZkLHRoT0gxnx5z1EJcc0hQtMd4h
	yV9iXv8RoszZoTPB5M=
X-Received: by 2002:a05:600c:1e24:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a0275507d7mr31998105e9.11.1790928586168;
        Fri, 02 Oct 2026 01:09:46 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm38823805e9.4.2026.10.02.01.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:09:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: zl020895 <zl020895@163.com>, Linus Walleij <linusw@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, longzhao@ambarella.com,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvi?=
 =?utf-8?Q?nen?=
 <ilpo.jarvinen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Lee Jones
 <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v9 13/15] serial: 8250_dw: add Ambarella CV75 quirks
In-Reply-To: <4405a61f.505.1a0fa675e43.Coremail.zl020895@163.com>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-13-486cc289a4b8@ambarella.com>
 <2026100140-overbite-mundane-fc79@gregkh>
 <CAD++jLnv1Q7ChHuLo=ad9edqhZL8MNaMab8huMAepK_LwqVzGQ@mail.gmail.com>
 <4405a61f.505.1a0fa675e43.Coremail.zl020895@163.com>
Date: Fri, 02 Oct 2026 10:09:44 +0200
Message-ID: <1j1pa834mv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_010948_293867_675C29BC 
X-CRM114-Status: GOOD (  28.72  )
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

On ven. 02 oct. 2026 at 10:17, zl020895  <zl020895@163.com> wrote:

> Hi Greg, Linus,
>
> Thanks.
>
> This series follows the new-vendor, new-SoC process and is sent
> as one set, so the new Kconfig symbol and the drivers that use it
> land together.

What Greg and Linus say here is basically what I already suggested on
v6 [1]

Giving the whole context of a bring ups, mixing many trees, might be
nice at the RFC stage but then it makes a lot more difficult.

[1]: https://lore.kernel.org/all/1jld986j7m.fsf@starbuckisacylon.baylibre.c=
om/

>
> If it has to be split, the GPIO patches and the UART patches can
> go out as their own series. The SoC patches and the CV75 clock
> driver should stay in one series: the clock Kconfig depends on
> ARCH_AMBARELLA, which is added by the arm64 patch.
>
> Would that split be acceptable for you?
>

I don't get why clock is any different here. Just state your
dependencies in the cover letter. `b4` can help you there as well.

> Best regards,
> Long Zhao
>
> At 2026-10-02 03:20:51, "Linus Walleij" <linusw@kernel.org> wrote:
>>On Thu, Oct 1, 2026 at 2:52=E2=80=AFPM Greg Kroah-Hartman
>><gregkh@linuxfoundation.org> wrote:
>>> On Thu, Oct 01, 2026 at 08:41:02PM +0800, Long Zhao via B4 Relay wrote:
>>
>>> > From: Long Zhao <longzhao@ambarella.com>
>>> >
>>> > The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
>>> > licensed block. At the register level it is close enough to DW APB UA=
RT
>>> > that a full custom UART driver is unnecessary: reuse 8250_dw with a
>>> > small platform quirk.
>>> >
>>> > Quirks:
>>> > - keep IER ETOI (bit 5) set for RX timeout behaviour
>>> > - skip set_rate; baud clock is managed outside the UART block
>>> >
>>> > Reviewed-by: Linus Walleij <linusw@kernel.org>
>>> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>>> > Signed-off-by: Long Zhao <longzhao@ambarella.com>
>>> > ---
>>> >  drivers/tty/serial/8250/8250_dw.c | 32 +++++++++++++++++++++++++++++=
+++
>>> >  1 file changed, 32 insertions(+)
>>>
>>> When you submit lots of different subsystem patches all in one series,
>>> it's hard, if not impossible, for subsystem maintainers to take them :(
>>
>>In my experience people do this in cases like this it is because they
>>essentially dump out their "bring-up" tree, the thing they have
>>booting on the hardware so they know the pieces work together.
>>
>>Long: can you split it up in topic branches and work on e.g. the
>>serial driver on a separate branch?
>>
>>A better way to test the whole set of patces is to just create a
>>mixdown branch where you merge all the topic branched into
>>one "test" branch, then you boot and test this before sending
>>out each branch separately.
>>
>>Each topic branch can be versioned separately with b4.
>>
>>Yours,
>>Linus Walleij

--=20
Jerome

