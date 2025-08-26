Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21F5CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOUXkb1uF8zQdB/sKiLIuRwWdep4Dp9YFQhPpYg7e7o=; b=A1eWEXIeIaz5fwlRsQkWk3xBhh
	gL1xCUMV+m8y6WSg+ywHaG+Eos1sykr4KAfdrhFVkoTIE7CRVu3XAyG/WZkU5CcsrK2MqoqThrE4B
	Z5oZ3FAKtPJNmlZjgtuuutnywvN94CoJ+Z8ayYhjFufz1lsapXQOC7gJoSU/DzE1f2cw55h1Ay77M
	CSRgVFZYltLSYgjbDdNs2+dREGGcBeB6RUISXk5zcN7+66FgVg0CvJrr7hEM4hzFB3vcwHJwwsosI
	Xszqw1aNfXm8AkMqSXrZf+iebkHvVM5ZJatwr854lWJ6BygQQlC5cxli0pvi3CAFMyNwuCUjKYcgV
	oC0xX8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrXC-0000000Bj2V-00sB;
	Tue, 26 Aug 2025 11:08:14 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqRF-0000000BWVX-0zSe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:58:02 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55f49f96f42so1629306e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202279; x=1756807079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOUXkb1uF8zQdB/sKiLIuRwWdep4Dp9YFQhPpYg7e7o=;
        b=IgQ5mZ3I3m/C6o/Qc5gnG66UW6sbVl4iPClu0MkkKNXkc0xDi3G8kvb7ll+Uj5gxA+
         PVHbq/ZFfkxW7fQifJwVjZXGdNvieiMWef3v/oLZmaNZ8gY6O38X1TpSVnBxlKc1DIeN
         voSUOHIKUQ3QkpACVF7xs8YkfFFS2HKnl9jR0M6oJG0PyCWPIp37ZPCDJJsvrhKHvDZ8
         AM7tK6fr/WikcJWpNNfVcXoFZ0+ciT2FkXRTNbk+dxKnD8nQ60QvWj7Dnq7ROC1wmE3J
         Kz50G1t4pmQZtSDwZ22FUwsk5IZiibyo/QEl51ZEQ5okhE3EeXTrKQbpyJf8UQGStOIJ
         nlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202279; x=1756807079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOUXkb1uF8zQdB/sKiLIuRwWdep4Dp9YFQhPpYg7e7o=;
        b=X+8gO+VGVEeSquQKv4cOs9QaWGKvjdx1grfqn8bqszgbR9x+EzzQSxhVCJQiZY4ftx
         wB6sJQKXkDX20ciHABUleRGAUdOKopui8sZigAEP2N6fN4JCP8ONUGkAliEegJhuELcN
         za24/maQ1ePJib1TLU1SXoMHdM5PEaOytNrZYg7xBD83LbC7rq/6wMpALwKHKtg7exoa
         /Xb5pBZ/DwE4zGeNThaUu34qOdHYMjvM5OhnkmBtYP6s/mcgQtLBMuCKHM6y49MedgVJ
         OYdhTsTROMVX1JABfeqcEZde1OpWWojbnKolnvVp/i37kU+BVt7Lq2cIBCPyzUTL8+F6
         sl1g==
X-Forwarded-Encrypted: i=1; AJvYcCUzwAu73HVpBAA106gxcAvSuwkoM+uI7boeNhQSz+qUx7GAA5kUAUWXic0UNfD3cchXTV6grIPG6fdcvqScNnjn@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrv83gdsHuP9UNQICjQ4fVKdOb2GyJb5aLXlqKzhmlWG1AeBD3
	PhwFMo55WaPOOD4J0g6v+ONc1wY/I+nfL4GviBYdtYlIVIDHTZKNWYzz8jRkAco8fT3UgMppm1V
	gir7vPX0JW5yINldMg6YvSq2n4vLZvtyWLfJQSppuDg==
X-Gm-Gg: ASbGncusTqj3P0nZDwQxGMXwHVDTeCA5M5Cddh3If2QpGSVzVlzFs1Nq0QS0I9KvfFh
	3XeY+QUAW+08X44rnVy6eYewVk8Tq2XXlYC4Ouwh6Qh73QTVNE5ZzfU1LhI6lDQThLohEgkeXAe
	M1ceCIgjiLJMA8LzzhVjd43S7W6m3RDeTWu+Mymn6YZk4W2xVZyCTuyTIF5pO5sSXP9JgPfiVLb
	UI/hyFW7awlqIaEFfDBckx1XPM0lqvfOzI62NpciWJgiCDb6Q==
X-Google-Smtp-Source: AGHT+IHZlig7uTIvb1Hm0+VQCqd18Uy1yI/ilX78XfwZSj12J+ieVVBnbFx5cn43CrziQFS1Bp5XyB1Kt9NlfkCCxzM=
X-Received: by 2002:a05:6512:440e:b0:55f:42ca:cc03 with SMTP id
 2adb3069b0e04-55f42cacd56mr3019395e87.56.1756202279297; Tue, 26 Aug 2025
 02:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
 <ac7c79b3491cb48ef7c193420b9a9e4614b88436.1756197502.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ac7c79b3491cb48ef7c193420b9a9e4614b88436.1756197502.git.christophe.leroy@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:57:47 +0200
X-Gm-Features: Ac12FXy4Ibm7fbO9KiNfYE73-dyWntHoWbLgchN6hbkj2Va2bGEIGeT9v8x9Fxc
Message-ID: <CAMRc=MchS5d3RHjtpc-fAVzKyhMchdUhvZCgTNsJ94u5Cc5FWw@mail.gmail.com>
Subject: Re: [PATCH v4] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025801_287274_F32D234D 
X-CRM114-Status: GOOD (  11.85  )
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

On Tue, Aug 26, 2025 at 10:41=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>
>         qe_pio_b: gpio-controller@1418 {
>                 compatible =3D "fsl,mpc8323-qe-pario-bank";
>                 reg =3D <0x1418 0x18>;
>                 interrupts =3D <4 5 6 7>;
>                 interrupt-parent =3D <&qepic>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 fsl,qe-gpio-irq-mask =3D <0x01400050>;
>         };
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

