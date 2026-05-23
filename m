Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE9DCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oj9WONT2LmJnuM+KabzKdwYNSGGC4sxCi7v5wRCbaKs=; b=b++PBNY0pe1D0uDs9vMl0iMLGo
	4eyw3VeqWZS4RwaYYs5PcY714nppZp/ziMmI+eUmBS/S0gMqEKZiH6VjGyz2M8PrOvLoi86CfCJGE
	Da91PwO0KWAdYvEgdtsU4AvTAzAKowzNnFqtS2RPVrY02Q4uqBzWQBy6++7Yujp5fuVAveazalPcb
	ts6CGjwIQBQu7d/eGLzB2bP3FrFFpg25NCjqG2HU9e/KP7l/X3HZYzou77sCmvRpfdeouB8uAQPmI
	4lQRbh7lmmmIGg/tAVEhgEPxWnpEgo2hDMVhiBV9Njatw5jS5dip0jZXk6WWpK/h90LQr+v74+BfA
	sU+DaP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiQj-0000000CzqQ-2h2R;
	Sat, 23 May 2026 09:14:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiQi-0000000CzqH-0yG3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 09:14:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41CD160210
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 09:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42A71F0155D
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 09:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779527638;
	bh=Oj9WONT2LmJnuM+KabzKdwYNSGGC4sxCi7v5wRCbaKs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H2+BKGp56W+IThiQWqZOx5odAcV1/nQu6v2pjNnwPVgID3MBs7aKNZ7toGsu7hLNy
	 oIiv5XV8d2Z5t2v5l3yf2pLdhjJxxsahsxwCDus6jbKbQrcqqfQ4/si0jKNcj4GQRg
	 PdNpNOiSdfSwBCcOWA5UDsrZKOu9Oabw4PBQKpmKLk58U7/voKt5jcdN1YopnWe/4Z
	 X5M14WuXuSQvspAVooJcGbmjYQffcpTus1r9IbR3pePGQJgpxGeQyLiq61cbqM5gz/
	 KeGSzHRLopOlcHxsPGEC8C/EsLIRlVc/HsLaThoeKqY26UGz68xMKZ9iJ2N/VcnASR
	 kqWKAtKTLa1qg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a887ebb416so9789166e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 02:13:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+gH1Oxj5HoLzZ9y65ffk/BhOLcyKPFsvvMTcWLn5nE7ykWfoAl05LYINt+TchNRbioT+SQ/LzF1kYkvx0DyLyp@lists.infradead.org
X-Gm-Message-State: AOJu0YxUYVLGDG5ch+uEMQ0UjAVNX/+dzs8VAxUJU/5nenCUQ4aGb83b
	IJ1fPiVCiqRfukZMe2C5hRG9Mthhtu38UGTYd2nY8iNKhlD5ll+Xue60NV/xorHLu8dOynDUoBE
	Dlp2u3/JLqtpObkVDIeH7JYOHuJMc0ek=
X-Received: by 2002:a05:6512:1094:b0:5a8:8222:7fc9 with SMTP id
 2adb3069b0e04-5aa323ab2e4mr2502434e87.13.1779527637399; Sat, 23 May 2026
 02:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
 <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
 <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com> <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
 <fd2ee102-db52-4a37-b96e-c16211e3d8e3@axiado.com> <CAD++jL=51iWK2SyxoWOTxSQHAq-Frd0mm6cPxqYu81qifFfHGg@mail.gmail.com>
 <c20dc0cb-252b-4637-bb22-6078be62b21d@axiado.com>
In-Reply-To: <c20dc0cb-252b-4637-bb22-6078be62b21d@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:13:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLkos3kC_ALAaoevaF29_Jf_WY5Z_2mZ1_Ldi+hCDbzt9w@mail.gmail.com>
X-Gm-Features: AVHnY4JJRfkcZxFTflgIKJvV2OpxrOyssZ0mBCArzoYH6Vt9eiME0imygNfv-1c
Message-ID: <CAD++jLkos3kC_ALAaoevaF29_Jf_WY5Z_2mZ1_Ldi+hCDbzt9w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Wed, May 13, 2026 at 10:59=E2=80=AFAM Petar Stepanovic
<pstepanovic@axiado.com> wrote:

> Some SGPIO outputs may control host-critical signals. For example, if the
> BMC reboots while the host/server remains powered on, changing SGPIO outp=
ut
> values during driver initialization could potentially reset or shut down =
the
> running host.
>
> The purpose of `dout-init` is to provide a deterministic safe output stat=
e
> during SGPIO initialization, before any GPIO consumer has requested the l=
ine.
>
> That said, if the preferred approach is to preserve the existing hardware
> DOUT state during probe and only change the value when a GPIO consumer
> requests the line, I can rework the driver in that direction.

That is usually the best. The gpio framework scans the direction
of each line at probe(). While it does not know about the initial *value*
of each line, consumers can take this into account
when requesting a GPIO line like this:

gpio_vbus =3D devm_gpiod_get(dev, "vbus", GPIOD_ASIS);

This means the kernel does not put any initial value on the line.

Yours,
Linus Walleij

