Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AF2CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuQFrVM35wc/XdWiWZfeFiOqf6xuZFSJEgb1hfqaX5M=; b=Ee7Gs6yP+b0bvq
	u7p6kfiAgVoH6sgJ28vBX+C7uFBtsA6lFEkcE6xY+RneKM7ERSoohkPmWtmVuoT9YIwmuGIXVlzEi
	M4W+z1cukiOWZY/3rR6AEeNrGSkrHwz1mtlh+713j/r527IrmZJl92IxOafrumpTZWmbJcsxUNX/4
	b2I7hkPUSSte6GvN50dYYBg1vniGexznIFaVd+SeY/pAaUD7C/DrQKTQ5hEbbEvrV3srqiu/kJX+V
	muT9gC88OtRYg5yvHATlpNZWYxgfe7DrqBYkWkJfkyBO0PLI7pQzMZ7/k4+xMnOYrXhbtbkTZOQ8t
	lkI+lUDasGWGbISnvNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQqK-00000005UDT-1kPl;
	Thu, 30 Apr 2026 12:50:12 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQqI-00000005UD0-0HcX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:50:11 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e12c67a6fso9370921fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553403; x=1778158203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuQFrVM35wc/XdWiWZfeFiOqf6xuZFSJEgb1hfqaX5M=;
        b=dsZeVUvZuWoGWzGt31o05dqNVwV53FPHART/6iu/l67WH3kAGRSoMEa1KPjKHuMyqR
         KXJ78TSx8qn1uzG6ffHwtpkW6hR1j4iHyPRkidrLyZx2OKqk0yd9tj0f8X5RZuxgvHMT
         CKoMlYj34kQ7bL7saz3gnNP5z7WfqWjMRNr/8qeTic83YGno+czmfWUfZktC2Yh5BI0t
         IwzQhm3SP2zr1v934CGKZyxhe/w+C1oLXVgv3HThIWxvHMRvM2zjgDzf92XVZdfFdNYZ
         D9GbRgL1CY7fbiz9MX/lisYc24daHjEn7sSx4SNvmOjvr996iKeI3FV4/9szdi7Vnral
         hUNg==
X-Forwarded-Encrypted: i=1; AFNElJ/U/e9UrnwDBvIuhC0eQpSv/VP3ioTNYb5E37enojGr5v7tljai9jp+KJu6HeFQ6AUkH7n9aUmUhz9Q+DuL7UAt@lists.infradead.org
X-Gm-Message-State: AOJu0YzemGRZeQgTmqbDav2FnYWd/SZaywjsKAhbojwkLo90+ebOZ4Dc
	eWInepaJ20655IPMJE1OYrLJjgsppbs5lryPcfxunisoiFv/fBYB9jvkTocKe5NuTXg=
X-Gm-Gg: AeBDies+QZ/3J0ucg709ALUaS2OhCu4Uc4z8FBNCktDgp7KQJgmu143Fz0nCxC4fOHn
	8l7OS7t62AduhYz8NbsSvQ8bkExxZEhoZaORwS14GR/JaX2wJAZzlc2nez6d0ei/i1TLgqtxTDK
	PgUJYNIFtRv0JaVEBPV0iDLJvjsRAv1TA1X2gH4cnSsqqlkZjHLzZ2OTnOkVBiTPneBHATnLd0Y
	QDCutmxpS8OrFvmPN8QtpyzJw3GE7dtG7s9jcnnLbEU3bk75zZSAUG3qzUWXK6m4hcktRPlW9TE
	2VZDtyB23z4+GBvoja+Dfi4YV7ugycer04oCFl+VLiXw398qJ5IEr+wrxB5FwnecsnO6nPWCwJq
	g8+G5vwrO0uU7g3OVcTngm5taz9aI6zZdaK/7d7MYbmjQyzEicw61ioc9plWX0EesVjLCLr3RYp
	UO3pwx4h0r/CvnQuvJcGOt2J56HqnceBoPTrveCRIeGhrrqNIa0SUFvWTMqEJmsg==
X-Received: by 2002:a05:6512:3f25:b0:5a4:2f9:e91 with SMTP id 2adb3069b0e04-5a8522d48c2mr1294637e87.24.1777553402325;
        Thu, 30 Apr 2026 05:50:02 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a773ff0sm1409621e87.83.2026.04.30.05.49.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:50:01 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so1190973e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:49:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/PfyTMiShfWV/X+uwe/xQAqBsIMv2QOSHT1TKVOEOlagmasTH+MC3dSGlNRBt8YouP4stoQg5UceAUMBzRRShN@lists.infradead.org
X-Received: by 2002:a05:6512:10c8:b0:5a4:175a:ce72 with SMTP id
 2adb3069b0e04-5a8522dd822mr1025501e87.39.1777553399625; Thu, 30 Apr 2026
 05:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251025043129.160454-1-iuncuim@gmail.com> <20251025043129.160454-2-iuncuim@gmail.com>
 <20251026210905.GA2941518-robh@kernel.org> <1935223.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <1935223.tdWV9SEqCh@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 30 Apr 2026 21:49:47 +0900
X-Gmail-Original-Message-ID: <CAGb2v64z9RMsGiy0skudn4cgo=RajxCho-vaXr5rUo5HPpqjPQ@mail.gmail.com>
X-Gm-Features: AVHnY4IT6nLdgfoMRlxWNV7nGADa-98ikdi3BEcPI2XpUYcTyVZLvYz4C1kzI-g
Message-ID: <CAGb2v64z9RMsGiy0skudn4cgo=RajxCho-vaXr5rUo5HPpqjPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_055010_150849_5BD30BE6 
X-CRM114-Status: GOOD (  22.75  )
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

On Tue, Oct 28, 2025 at 3:01=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Hi,
>
> Dne nedelja, 26. oktober 2025 ob 22:09:05 Srednjeevropski standardni =C4=
=8Das je Rob Herring napisal(a):
> > On Sat, Oct 25, 2025 at 12:31:24PM +0800, iuncuim wrote:
> > > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> > >
> > > Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
> > > description of the thermal sensors in the A523 processor.
> > > The controllers require activation of the additional frequency of the
> > > associated gpadc controller, so a new clock property has been added.
> > >
> > > The calibration data is split into two cells that are in different ar=
eas
> > > of nvmem. Both controllers require access to both memory cell, so a n=
ew
> > > property nvmem-cells has been added. To maintain backward compatibili=
ty,
> > > the name of the old cell remains the same and the new nvmem-cell-name=
s is
> > > called calibration-second-part
> > >
> > > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > > ---
> > >  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 56 +++++++++++++++++=
+-
> > >  1 file changed, 53 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8=
i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i=
-a83t-ths.yaml
> > > index 3e61689f6..b2f750ef2 100644
> > > --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-=
ths.yaml
> > > +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-=
ths.yaml
> > > @@ -24,18 +24,23 @@ properties:
> > >        - allwinner,sun50i-h5-ths
> > >        - allwinner,sun50i-h6-ths
> > >        - allwinner,sun50i-h616-ths
> > > +      - allwinner,sun55i-a523-ths0
> > > +      - allwinner,sun55i-a523-ths1
> > >
> > >    clocks:
> > >      minItems: 1
> > >      items:
> > >        - description: Bus Clock
> > >        - description: Module Clock
> > > +      - description: GPADC Clock
> > >
> > >    clock-names:
> > >      minItems: 1
> > > +    maxItems: 2
> >
> > How can the max be both 2 and...
> >
> > >      items:
> > >        - const: bus
> > >        - const: mod
> > > +      - const: gpadc
> >
> > ...3 entries?
> >
>
> Because old variant uses "bus" and "mod" and new variant uses "bus" and
> "gpadc" and none of them uses all 3 entries.
>
> Although, I guess we can simplify and just use "mod" in both cases.

Yes. Please just keep using "mod".


ChenYu

