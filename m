Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50452C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFro0CShRsSHLGgbO4zij6styDLmEifSQxQUeqQE0X0=; b=bH8BLK1rQ4P0grFRzWaHziHSAR
	HMInvVhsSuOSwc1sdK7FoXSP/M5gX5iIp6D7A/EYGrPJqTUqZdeLabPXaMPLigJRmZm62+KESg3Iw
	44n8aU7jq4Av2qJtDgVGVbnlZ2q4bmWMARxz8X+ZqH8MQzImiWptU5tAxYG9p0O/V0PGw3b95TbFE
	0vYwfBiaF88FzqG4Lp0cAkiMJl30Vc+kjFVI9xCnqVldtVzEQFFkoj08mfRKNpY7i7YioPSA2o4AU
	hO+7tfaMtgGpgAkTWFQh7S2qrjNzPHvNFY6w5EMdCXu0vQ02PTzm5rCPZ8EY+wytJbiRkMHM/5Rrn
	rL/b/EWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb1A-00000009ERf-12mU;
	Wed, 19 Aug 2026 07:47:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb18-00000009ERT-2Bhc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:47:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB026439F5
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 07:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3531F0155D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 07:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787125641;
	bh=FFro0CShRsSHLGgbO4zij6styDLmEifSQxQUeqQE0X0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H4xJGj9/2X+lT/uWhbxXcdPQuM7Bg0MQpuq1YyZ+1rRUji8sJaogN48P6A9i+WlXF
	 CmbN9ufpRZKvfQ6RHrNVHDKf0ZUKH6lMmKJw7oDStcMGXAGn0aBMXq+s1NsNvDrWZ9
	 Oljf1DDTrJg9pk8S9WLkII1kgG/vYLtKZ48tKvOA/csRJYfBhVTo3A/9r/PbZzmg2Y
	 efCuanDt6OZrg0W5f9MhLFvQOGXAzTCWx6lZGlWvr/aX4xkhoq2VnwxEh4XhAolNfu
	 FDozd1jLinL5SbFvKPd574wZbePTihcoFq2hrYBE+GJwIDlRCEPwDIKZy8j3XzgW1Z
	 XePiEDb7g8E4Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2a3166398so846675e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 00:47:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3cpE/7UEKB05apJAIZyqWIoXYXHHMLFxo+jFdjA3kzuXXP2iAKQbD+oWVRtDDuIcJAY+h32M7Bsjnps7lOowX@lists.infradead.org
X-Gm-Message-State: AOJu0Yycp7zpenSn9PcBm6pgf6jnZhYlqiC6R6QCHmbIHDeVPHb8zR13
	lfAvLfRnObXYoEu+vPXH16lCvXCznsVIzvoBpbbEOvy2+FM0OjPXiQsW5vZlKAHvxljI6/WkSj6
	+LEuhgLT77MX8+oiOCUmbea4H55LTwZA=
X-Received: by 2002:a05:6512:3b9c:b0:5b4:5c5f:2aed with SMTP id
 2adb3069b0e04-5b478bafeedmr801963e87.9.1787125640383; Wed, 19 Aug 2026
 00:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com> <20260818-cv75-v5-v5-5-7bbb12f0360f@ambarella.com>
In-Reply-To: <20260818-cv75-v5-v5-5-7bbb12f0360f@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 19 Aug 2026 09:47:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLngqGzethEG5Hx+oAPzZoV6rvWNGXYaycFFkDz_dXFz=g@mail.gmail.com>
X-Gm-Features: AcwNN1Xd6vVOI9stCj2gRpLkQqCARgCDR2Ns_rmI0pVH0qFiDI8kQzTDIQYC_Ck
Message-ID: <CAD++jLngqGzethEG5Hx+oAPzZoV6rvWNGXYaycFFkDz_dXFz=g@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] dt-bindings: gpio: pl061: add Ambarella CV75 variant
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	Long Zhao <zl020895@163.com>
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

On Tue, Aug 18, 2026 at 12:32=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> +      properties:
> +        arm,primecell-periphid:
> +          const: 0x00000061

The 0x41 in ARMs PeriphID is actually the JEDEC JEP106
implementer ID (8 bits).

So you should ideally set this to whatever the hardware engineers
should have used, had they paid attention to detail.
If your company has a contact point at JEDEC they should
know which implementer ID to use for Ambarella designs.

Since Ambarella is evidently a member of JEDEC your
representative should be able to simply request a JEP106
implementer ID and give it to you if there is not one assigned
already, but I know it can be hard
sometimes to find the right person inside the company
but I think it'd be worth going the extra mile here, say that
this guy from the kernel community persists.

Yours,
Linus Walleij

