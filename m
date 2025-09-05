Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73A9CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e737NFCnB1pAiZwFeuIFUAdoH1qix+jNDtR6tlkeuzc=; b=Wnb2gVKq1UUSvju8AlC8LgnjO8
	UXn92BdwjpN0itck/jifsVHCczTGTndDhlFz2HQLw/4ngszrKoVHIxAieXzhd2eog+RgtWyE7QXpM
	xvg9Oxp8JqHQScJ2d8frrMXuSLwrBJKvkJwTQx094THDCx7W2KZB6bAfXF1FPpfi69N87u4ADPBnw
	2DRglnI6z+rwjHnvm3mfABTgYG1zfvlj2+Zcv/wCkVVlc6RBE1v6DfSYq3XYz+FqDUvtbHjoCy9H3
	E1uiHXHBEZgjebqU7CRtspwCJ8hoXC1Wu56mdrYGwcvZxzx6Ze4OIXlJd+FBegBvHtVKiVzlXxbtG
	lmm9+i+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXZr-00000002QGO-0zFj;
	Fri, 05 Sep 2025 14:38:11 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUh1-00000001P8V-0MAe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 11:33:24 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-336bbcebca9so15591871fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757072001; x=1757676801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e737NFCnB1pAiZwFeuIFUAdoH1qix+jNDtR6tlkeuzc=;
        b=ILRPNlysYqxgksJHZDqE8gHGFw8xdbNE0ZMJQvthL/BD/4r3+XghQJhVL9gpSUUdIv
         0/QeekA4+r4PSK39fxcCXj5PY17M0QRuO8cGIZemzQRiLpoInBYbWddMNJuwyyvxPnxc
         k4i1Tgglu+Y0WBlxwWMv8QYArtpkvsqI3P/CBqQLtzrLY/AcZ2nzM+b+ULFXU6Q8uvT1
         tNq7Sjq4kQnQ3FlpB0s2P7pCp8gMS23n58SqBOdFbDIuSKlqY17XdAHddOkZIUY3QDQB
         /kuZtCtQuqZpn7FaxYNL2dkU7rQdXlY/IjUAdE4DYdyZ8XlNPF+/O4IwfojAjprh8NYS
         OpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757072001; x=1757676801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e737NFCnB1pAiZwFeuIFUAdoH1qix+jNDtR6tlkeuzc=;
        b=TKCDiKvY0/5TNTVRU0yG78tTH1ORUDDETwwi3mY8xNHk+BTq7PNDi+lFaIVO79w86b
         XT4ysCNF0Yc9fF5668lukOcHA23vO+7fPujTeJilHZqJeYm2Wu4CgB7DWyLkaOuD6Dwu
         wwKdjInjTdfxsl721RH/riaQOnA+atQ/a5EnKACqOxonyzD8i3OnUD/r2ZYBF2CZFHFz
         pp6Rss5nueNGZrrMy1AZepFzSyXSiC1MMsutHKAsw5P/fTT84Y97cumqjE8L6fY3dDCw
         HmO97eiJkpUtDFyQXxLbzNe8lG1L8Ndq71UsxTx3QJJDtPdWpjoOXJN7XbuXsESVX59h
         8sBA==
X-Forwarded-Encrypted: i=1; AJvYcCWnl0q74iTwfdb60mTUPePAYnDHM6ABTEk9kvu1OZVeQb9Hop2DHmSEuWaskFVwrGRbymUu/fu7Snm8tI/7RR8G@lists.infradead.org
X-Gm-Message-State: AOJu0YxNrCvqDokI0IETm/a0/FQlIFaUyDuT1/YQcIZSYL9HUq5RyqcJ
	578BYtmmmPzukZ4J1/5zxnU3Nvz9qvsgbimtB4X9i/B2wMeWDSQPI5BmKLqgmeY0K38S/1ivWpD
	ugYKLR2tF3x2di4da02R43AE5smJEUPF55yeoi/i9gg==
X-Gm-Gg: ASbGncsBuWu8p5XojEFwYO3UmDAsWxyCnDOgAJ9KGc3GhyXZsynHPSegboSi9OjCQ26
	9ZuvYqtfDOGU8GVRjk4N9+m4spAvbyz1EbR3vwnPz1OeZocTUnM08c32IW59d97rd7JN//2w4z/
	sKadXy2MjkDM2QVhG9dvncWcKci7PmDa/gcR6wE8QwoSEtDZWg1x9da9evZZxNFHglSgGMDPG5D
	IXeQyeh7/ZTGyBSMQ==
X-Google-Smtp-Source: AGHT+IGSWO4nCHB8o/6t/y6RH8BOysPzoQ6jiv8gZqcTwwokf+Kq7hYmaaHYY9kCJZ1mu3fJ8bEoY6l6Nt8aDc5ponQ=
X-Received: by 2002:a2e:a482:0:b0:336:7c7c:5ba5 with SMTP id
 38308e7fff4ca-336cad21f17mr50388961fa.23.1757072001159; Fri, 05 Sep 2025
 04:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com> <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
In-Reply-To: <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 13:33:09 +0200
X-Gm-Features: Ac12FXx6o0aglHH6TQGfVH200HSX_9WYooYS5LFefZX_Ln3xQz4XYXPyVN0c3dY
Message-ID: <CACRpkdZRHQ6vuchN8x8d0uPCVMPPHOdBVWiUhzFJNs2paHGbYw@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>, airlied@gmail.com, 
	amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com, 
	angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, 
	davem@davemloft.net, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, 
	kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_043323_145369_26B97667 
X-CRM114-Status: GOOD (  18.98  )
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

On Fri, Sep 5, 2025 at 12:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, Aug 21, 2025 at 01:56:24PM +0200, Linus Walleij wrote:
> > Hi Ariel,
> >
> > thanks for your patch!
> >
> > On Wed, Aug 20, 2025 at 7:17=E2=80=AFPM Ariel D'Alessandro
> > <ariel.dalessandro@collabora.com> wrote:
> >
> > > +  ce-gpios:
> > > +    description: GPIO connected to the CE (chip enable) pin of the c=
hip
> > > +    maxItems: 1
> >
> > Mention that this should always have the flag GPIO_ACTIVE_HIGH
> > as this is required by the hardware.
> >
> > Unfortunately we have no YAML syntax for enforcing flags :/
>
> Theoretically there can be an inverter on the line, so from the AP point
> of view the line is active low while from the peripheral POV the pin is
> active high...

Yes, I think someone even proposed adding inverters to the
device tree and was nixed.

It's a matter of phrasing I would say:

"Mention that this should nominally have the flag GPIO_ACTIVE_HIGH
as this is required by the hardware."

s/always/nominally/g

Yours,
Linus Walleij

