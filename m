Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A9AC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTt5QbyADMJ+0WvsKLYId9FZQBGxvlR5X8sImHZOIM4=; b=NwhQqA5E3iPjiY
	SrgHCPcBItRDDl9RP5sfVx0bqxSj/S0xowPb+IDHqXcFtZ7WIUib1zey0JBCzkI1t9YR/pD2WnMJ1
	mELx4pRaGxZXma6PctGsiXXoALX2gODrXLLdAOZzUmkn/gWFpuf116irB9h/F82DyKDFcc1l4WzPN
	CCZc9NngJVJlepfklI7bzj5bo8addE/BAp63NChuhhkz+QzlLl9GnfsG9rge85IBjLEmNrrAnHEv5
	YdQmHwy2IKMjMEe3d9C4TM9so8WWSrYnzZX16QjIrX4BawuZ44WFLGaZZJZHbDKU72EcIpzupuuYp
	nGDsTAI5qMsV2OkhMiDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndqD-00000007W2l-1uhL;
	Thu, 27 Feb 2025 13:22:17 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndHy-00000007Q6J-1wgL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:46:56 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5461cb12e39so826373e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 04:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740660411; x=1741265211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTt5QbyADMJ+0WvsKLYId9FZQBGxvlR5X8sImHZOIM4=;
        b=U5+hk+PfUJP4elzZXY/ytvF51iyJlDRBxQtcjRsrUBUYfOl2BQVaxkmmm82lMVMwx8
         KYjcfjpZaAatSHWBHuy8pIq9rTXC8D12V4vzXDE+LdF8rnfTe9MpgoQQPzu7bzmIdRtE
         9FSncKJ1qiqMSo3TB7Jb/IRlr+Guv0YiA/LVPmbKy8gUhofzSXD2Y+n9mQ6FKcjJPUps
         bf/h8fBopG7ZyyX87zDd/o+dBpWiOM4rMoC4TsJpGiHM46e1pCTgBefFhWEBThbQlw1L
         uVgvxGeimZxm6Qyh58q5rfHLxaOGuptEMf92Wsld2kg08Ke6ARYSBhZWeQDc2je13L5k
         QihA==
X-Forwarded-Encrypted: i=1; AJvYcCWVidr7YxwwLy478PMLPygZgIz64pe/LEkMaalYhbR0OR1Bp8aRM4LlH2k8wLJJE8nZxXqFWH6qpVQIdfm4CT5A@lists.infradead.org
X-Gm-Message-State: AOJu0Yycm/mb4LlUgWVg85lKZi9Cr2ArRCg/d6XvmNosMGlrvbd1GRaS
	D7sRFsjO+kwZnvWOIuqYu3aJZzQEfqW2tAdefGmsuC4dIc8LxCOTehKBYcRd
X-Gm-Gg: ASbGnctwgxA3hDyDNUlNrcF02zzSkH5tByDZe6jiavQwTgeyoD4Z2enmVJ22WBXi5/Z
	tLg/9gYTGdLn/0hRNHk3MeKphK3Lu33mNQ1fJbuc613ZowzJr93G2ox9GZ3YOSTHukhlG1Zs53+
	LE0le8dOg4u6TyQbPaKOo/+JnAc1Hg/dSxPq6UpjUYa12eHk/3nVu7KCAgKh6EK5zyYWeFVLuaU
	gLwCe9HKDyM02XQCwTbaInBQ5ovg6/2uDjHoN0/PYdjRvUa7VRTa45qrOJ3k5xORVTjmF04i5kq
	Mr/AgNBlXXK7GHhNRXx0PkmM6lzIGWZZSjhcyvcSph94k2N+N3Wsu6oycls=
X-Google-Smtp-Source: AGHT+IGIb8PmFSvQYs/mdcDxlOnTk938DDmgzr2NWLkqysxkeYPp+n5tf6RgajMa5CuT1cAHIsLarg==
X-Received: by 2002:a05:6512:2242:b0:544:c36:3333 with SMTP id 2adb3069b0e04-54838ef5b9cmr12831204e87.30.1740660410777;
        Thu, 27 Feb 2025 04:46:50 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443b1357sm153919e87.110.2025.02.27.04.46.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 04:46:50 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30a36eecb9dso10860401fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 04:46:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVg2dmdMr8ww10Ru+x6ezk/DZplGI72D4OeAepLsxyFILiifbAQR8N5pM48tEhyR3jAiN2V3PI90vvymhERMUtT@lists.infradead.org
X-Received: by 2002:a2e:8743:0:b0:308:eb34:1037 with SMTP id
 38308e7fff4ca-30a599702f2mr99762991fa.23.1740660409212; Thu, 27 Feb 2025
 04:46:49 -0800 (PST)
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com>
 <20250214003734.14944-7-andre.przywara@arm.com> <173949598874.895319.6861900349653451498.robh@kernel.org>
 <20250227114611.67a1ba00@donnerap.manchester.arm.com>
In-Reply-To: <20250227114611.67a1ba00@donnerap.manchester.arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 27 Feb 2025 20:46:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v66eOuT+0n71OEPUky_rLd37_msT4b1+QC+8Nyhwtqarng@mail.gmail.com>
X-Gm-Features: AQ5f1Jrl692zM4GeD3auZTYmCOG5P6JcCZDXCDM_tdSURnSO6l5VyT64A9SuHe4
Message-ID: <CAGb2v66eOuT+0n71OEPUky_rLd37_msT4b1+QC+8Nyhwtqarng@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
To: Andre Przywara <andre.przywara@arm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_044654_500740_C32A8D71 
X-CRM114-Status: GOOD (  30.22  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 27, 2025 at 7:46=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Thu, 13 Feb 2025 19:19:48 -0600
> "Rob Herring (Arm)" <robh@kernel.org> wrote:
>
> Hi Rob,
>
> > On Fri, 14 Feb 2025 00:37:32 +0000, Andre Przywara wrote:
> > > The A523 contains a pin controller similar to previous SoCs, although
> > > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > > With this SoC we introduce a new style of binding, where the pinmux v=
alues
> > > for each pin group are stored in the new "allwinner,pinmux" property =
in
> > > the DT node, instead of requiring every driver to store a mapping bet=
ween
> > > the function names and the required pinmux.
> > >
> > > Add a new binding file, since all the different variants of the old
> > > binding are making the file a bit unwieldy to handle already, and the=
 new
> > > property would make the situation worse.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  .../allwinner,sun55i-a523-pinctrl.yaml        | 177 ++++++++++++++++=
++
> > >  1 file changed, 177 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinn=
er,sun55i-a523-pinctrl.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl=
.example.dts:24:18: fatal error: dt-bindings/clock/sun55i-a523-r-ccu.h: No =
such file or directory
> >    24 |         #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Ah yeah, of course, that's in another series. What's the best approach
> here? I could cheekily import an existing header file, the symbol names i=
n
> there are often the same (ccu-sun20i-d1-r.h defines the same symbol, even
> with the same number).
> Or I just replace it below with the number "1"?

This, or just drop in a random number.

ChenYu

> Or let git format-patch append the patch-id of the clock binding header
> patch?
>
> Cheers,
> Andre
>
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindi=
ngs/pinctrl/allwinner,sun55i-a523-pinctrl.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_b=
inding_check] Error 2
> > make: *** [Makefile:251: __sub-make] Error 2
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2025=
0214003734.14944-7-andre.przywara@arm.com
> >
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit after running the above command yourself. No=
te
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checkin=
g
> > your schema. However, it must be unset to test all examples with your s=
chema.
> >
>
>

