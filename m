Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512DFCE8D79
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 18:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4V47ZtrjnJ13/ySZl5tZTSnvZ5MxTg7oI8bVpBaXD3A=; b=3u3gxz8mJyWmIk5pq8M+qOMSGY
	t4nKQiZvg1FYpnC5WGSmRvER7PilzuvvH0/c1q9RHdOyqA/rgyHc08hCus/k129lGTTMvydLQR2Wx
	kRIf595V1Ht+XyOEMcLyYOnGhg0Axuvw2jHnGZAoeKUv7aeG43VMDsQCYnHk9eTl0rpMRECZpif9M
	Jk5FA+tpmb3v9BEMnHORL6T5NFtD7uBLWTNZLp+bQKLssn3F6iR+LzQep3usSCzG3q7tIAVIDafGE
	byE7P2I29h7j6zVGVgvob4UEhJCK4DpRFTbBt7pnAmx9XOPYEUVxPJx9IKEQLd+rUyDN+kaBEz2kh
	dX5dV6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyjV-0000000Cxr3-2mfn;
	Fri, 14 Nov 2025 18:41:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyjT-0000000CxqT-1NT4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 18:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA44644522
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 18:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864C0C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763145674;
	bh=uU3rKZArNQJfMmH8g2F3c3EvB0q/FTV9vy0xjSTNwGc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cbRWCcY5USjcdSj47Pp23LIyarPtOwBgsWiU3/NMFMa5MBMglHjEJpgJ2c9OTHlmH
	 EmFMXKsdis97g6GYha81Fw0F/ajSvIdu/MJzNliyT2zGXy8qsMqC/SmrRqWWsWeONq
	 91uh8TeuxQr9ZwGVBmFhNFPrrO94oSD5s/3f8moD3X2Y/txM5b5k6gEky8B0OTfPI0
	 qfHxCEYcTEJVA9FXbFKNTn7Aqa56O1U9CbAMKJOK/rhJwCW5xUq8pSWWXPqPwg+KhM
	 2W0gLUCqwZdj62zIAvObyCRTJpgmSDc+YlPlWcW/aV7yOlbUYOGSa5fbGkbutmoeC3
	 n+oK5t3baj9iQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so357785866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 10:41:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeCc6OTIq1Tq9g6XNblbgtzSpnzw5hiE6H/DWDmVHai8j1RrkJ8rlDSZIRPFgFbtJeZaWJnkY9pxEqtJ+lKCMK@lists.infradead.org
X-Gm-Message-State: AOJu0YyKFVA0SQRlHt3bpQkZZQ0Z8GWRS6jmSjmwr2q9khzvvJFef45c
	scBU964AzAZb98wjfjQWwZHD72meH3eKOpulTG2JLf0WeVgQOp1mEiSPwozvMtp0blerFLEUfMj
	lyMLxmflZ04/WcthG7LJ3TD0uZ+cHzw==
X-Google-Smtp-Source: AGHT+IHc2ZYhQaMLw8/0t5ii4Uq5xmDZtv8iTCdZaeuEuCGVJg4CCn4SxcbUH4Ipk3/KHt6cJaWR4f0E1HmJBCwT+PA=
X-Received: by 2002:a17:907:97c3:b0:b6d:5c4e:b09f with SMTP id
 a640c23a62f3a-b736789d444mr371783266b.5.1763145672998; Fri, 14 Nov 2025
 10:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
 <20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com>
 <176313578804.3261993.9727195642647352249.robh@kernel.org> <87qzu0bnmi.ffs@tglx>
In-Reply-To: <87qzu0bnmi.ffs@tglx>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Nov 2025 12:41:01 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+tqGrSmFiEdyrgnsJ6eQ-gt2K9GVfb2nag_fLUWFcLpw@mail.gmail.com>
X-Gm-Features: AWmQ_bky6sQizUe8-QnLDwwW0UvWW-OY8BvouApVtd_66_FtgFJPhLRoI4LbsZg
Message-ID: <CAL_Jsq+tqGrSmFiEdyrgnsJ6eQ-gt2K9GVfb2nag_fLUWFcLpw@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: Add gpio_intc node for Amlogic S7D SoCs
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-kernel@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_104115_409527_8BD7D5B6 
X-CRM114-Status: GOOD (  16.22  )
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

On Fri, Nov 14, 2025 at 10:11=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> On Fri, Nov 14 2025 at 09:58, Rob Herring wrote:
> > On Wed, 05 Nov 2025 17:45:36 +0800, Xianwei Zhao wrote:
>
> > New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/amlog=
ic/' for 20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com:
> >
> > arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: interrupt-co=
ntroller@4080 (amlogic,s7d-gpio-intc): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
> >       ['amlogic,s7d-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
> >       'amlogic,meson-gpio-intc' was expected
> >       'amlogic,s7d-gpio-intc' is not one of ['amlogic,meson8-gpio-intc'=
, 'amlogic,meson8b-gpio-intc', 'amlogic,meson-gxbb-gpio-intc', 'amlogic,mes=
on-gxl-gpio-intc', 'amlogic,meson-axg-gpio-intc', 'amlogic,meson-g12a-gpio-=
intc', 'amlogic,meson-sm1-gpio-intc', 'amlogic,meson-a1-gpio-intc', 'amlogi=
c,meson-s4-gpio-intc', 'amlogic,a4-gpio-intc', 'amlogic,a4-gpio-ao-intc', '=
amlogic,a5-gpio-intc', 'amlogic,c3-gpio-intc', 'amlogic,t7-gpio-intc']
> >       from schema $id: http://devicetree.org/schemas/interrupt-controll=
er/amlogic,meson-gpio-intc.yaml
> > arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: /soc/bus@fe0=
00000/interrupt-controller@4080: failed to match any schema with compatible=
: ['amlogic,s7d-gpio-intc', 'amlogic,meson-gpio-intc']
>
> The first patch in this series clearly adds the "missing"
> bindings.
>
> Confused....

You and b4. It looks normal reading the thread, but shazam is
thoroughly confused. I think that's because this series is missing a
'v2' tag.

$ b4 shazam -H 20251105-irqchip-gpio-s6-s7-s7d-v1-3-b4d1fe4781c1@amlogic.co=
m
Grabbing thread from
lore.kernel.org/all/20251105-irqchip-gpio-s6-s7-s7d-v1-3-b4d1fe4781c1@amlog=
ic.com/t.mbox.gz
Breaking thread to remove parents of
20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 18 messages in the thread
WARNING: duplicate messages found at index 1
   Subject 1: dt-bindings: interrupt-controller: Add support for
Amlogic S6 S7 and S7D SoCs
   Subject 2: dt-bindings: interrupt-controller: Add support for
Amlogic S6 S7 and S7D SoCs
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: irqchip/meson-gpio: Add support for Amlogic S6 S7 and S7D SoC=
s
   Subject 2: dt-bindings: interrupt-controller: Add support for
Amlogic S6 S7 and S7D SoCs
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: arm64: dts: amlogic: Add gpio_intc node for Amlogic S6
SoCs
   Subject 2: irqchip/meson-gpio: Add support for Amlogic S6 S7 and S7D SoC=
s
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: arm64: dts: amlogic: Add gpio_intc node for Amlogic S7 SoCs
   Subject 2: arm64: dts: amlogic: Add gpio_intc node for Amlogic S6 SoCs
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: arm64: dts: amlogic: Add gpio_intc node for Amlogic S7D SoCs
   Subject 2: arm64: dts: amlogic: Add gpio_intc node for Amlogic S7 SoCs
  2 is not a reply... assume additional patch
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH] arm64: dts: amlogic: Add gpio_intc node for Amlogic S7D=
 SoCs
    =E2=9C=93 Signed: DKIM/linutronix.de
  =E2=9C=93 [PATCH] arm64: dts: amlogic: Add gpio_intc node for Amlogic S7 =
SoCs
    =E2=9C=93 Signed: DKIM/linutronix.de
  [PATCH 3/5] arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
    =E2=9C=97 No key: ed25519/xianwei.zhao@amlogic.com
    + Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> (=E2=9C=97
DKIM/linaro.org)
  [PATCH 4/5] arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
    =E2=9C=97 No key: ed25519/xianwei.zhao@amlogic.com
    + Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> (=E2=9C=97
DKIM/linaro.org)
  [PATCH 5/5] arm64: dts: Add gpio_intc node for Amlogic S7D SoCs
    =E2=9C=97 No key: ed25519/xianwei.zhao@amlogic.com
    + Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> (=E2=9C=97
DKIM/linaro.org)
  ERROR: missing [6/5]!
  ERROR: missing [7/5]!
  ERROR: missing [8/5]!
  ERROR: missing [9/5]!
  ERROR: missing [10/5]!
---
Total patches: 5
---
WARNING: Thread incomplete!

