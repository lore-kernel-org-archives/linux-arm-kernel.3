Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3743E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxLA9rUR/gJT7KoDTQj0+vBZS7GvUNOK0hNifMZCuqw=; b=PibpE7QyMITn0GpefUUto2LZfj
	DuOAG3gpWuI53bD19sI4ESQTen7Tiq6+szEtFkEy7QtLFABmrxnIyJeNz0Mx2UkV8N3sxXU7im0wp
	Z/xfIFdYfCYH65+u6vdhAD3D5hClDJUvmIirHj6hVmN46Q7yLM/ntJKqJseJ+Iw5dH9iayfOzkQcN
	xAd6wIRBEOoNYOsdEj9uHBuw+7iAAYouFl5Dt29HneoPGpYYidAltYh7i72Kd28GcJJtoLcvfTzB6
	AmN5SoGAqbizRfA9ptocpsltgQxoY+kQnW7rd5K2sJY3gcEZt1hSwUNp4/mz+zrvF3GYTUnmvKOtY
	thdrDunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5X5-000000042SH-2jsC;
	Tue, 07 Jan 2025 09:05:51 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5Tl-000000041PC-3bVz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:02:32 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-540254357c8so1204624e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736240543; x=1736845343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxLA9rUR/gJT7KoDTQj0+vBZS7GvUNOK0hNifMZCuqw=;
        b=lysfhPoQhIkq6oHM6IFSPIJNPLsJxV6IbB1GcrRDJddVLuCi0jtyU1i02I3dBRtFZU
         zonAAazbKEL3QIlnYtXdlYK+C3FIK+bhZ79Bdip3vac+YHFnhHoDUNoIMvZXg4A5Hfet
         XWezPU2kdVeFGguTnCpNN/4LN4kCzBwazJ3K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240543; x=1736845343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxLA9rUR/gJT7KoDTQj0+vBZS7GvUNOK0hNifMZCuqw=;
        b=B5taZne+FkjB1gUMX8xsaw3g0fKgWazd1reH4PLuYV7v9K9rhp8Z6joq0mH13vOx0+
         hwHm/uQg3CXtzuUj3L+ROBbboYUx9VN947nUugNOm4LsZRXzK9r9xCkfRA1EKCkJBb+O
         xggVxnYoobFp84Aj8/uF/HyUduPmhnTAk2UlE/5mv23pu7XMQ+BgPq9+B0hbaei3K5xN
         U0lRfBFiwWCyAKiDgrltY9BcKONSR6O0Gu5wkphasu4VxtM/FYzBbhDnCrrUvq1THF4V
         GRP/1ezq+w6cjFEpL7bUPZOPySEsp7t2BzaI7E2OxkYhTODJ68t/+MFOck4rx0+FsmvJ
         X8zw==
X-Forwarded-Encrypted: i=1; AJvYcCWO2QqbzGQSTHWTIUqkKUmjZPEQQHwSQ7nbobuIoGPp2kMmA5uftPLteZpVbriBXcEIVLofOnHLeOPke2iAwzFT@lists.infradead.org
X-Gm-Message-State: AOJu0YxlWVLRtyihkTrenVqfGftWpkeHjQQtmKxeP+G4/eiBT7gXFTyS
	HRt+cHEihfHl2DiAkdOmqgZsqAeJKu2K0FQHCyueGgY69s4SEYz64YhLeVQKuxtKgpb6oUzo8ho
	UkT9t+COiLBLFV9+GwEeqQJexlFgfO4NPk7vH
X-Gm-Gg: ASbGnctQWy3Bk227nBu6qpvYoZtFTkpicDztRD9fPzYcTvemCw392CNpzkuVF0T/gdz
	eiv30FbM0FLlg8QGZ+ZVXEqueeWe+C6KrOUWOyeCxf8CzdOcc2PbJTUMaHz+iBMpe
X-Google-Smtp-Source: AGHT+IHelcMparcoLg17vF4WDr4gu9Gh7r2hpYwzZdtimgS/flztrhU/dbW77dw1U2dj/dcAHZrsaayy4PGBYwNtXOU=
X-Received: by 2002:a05:6512:10cc:b0:53d:ed69:a593 with SMTP id
 2adb3069b0e04-5422953ff0amr20882626e87.22.1736240543524; Tue, 07 Jan 2025
 01:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-2-jianjun.wang@mediatek.com> <ndj6j2mmylipr7mxg42f3lcwgx55cvcjnuuofmlk6n6t5uz5pr@bxugolyfublc>
 <04ae2a07e2c2d3c03e82596034b1b7711450a0ae.camel@mediatek.com>
 <eb2088d3-81f6-4cb8-a4d7-6ef985aedbda@kernel.org> <9b0a463312702fb78e4ca2ba79c9ec6b62e33c58.camel@mediatek.com>
In-Reply-To: <9b0a463312702fb78e4ca2ba79c9ec6b62e33c58.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jan 2025 17:02:12 +0800
X-Gm-Features: AbW1kvZTmXzwbrGBqElpSqfN778xG89x2dquf_HbLF0Z9gqveP2lcGYTvPUsDT4
Message-ID: <CAGXv+5H5ymEem=JWF1J6dHr4B7o5cdOgvCSg0Q_5GVkx487Ksw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
To: =?UTF-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>
Cc: "krzk@kernel.org" <krzk@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Ryder Lee <Ryder.Lee@mediatek.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	=?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010225_892632_5C5F7D43 
X-CRM114-Status: GOOD (  28.66  )
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

On Tue, Jan 7, 2025 at 4:45=E2=80=AFPM Jianjun Wang (=E7=8E=8B=E5=BB=BA=E5=
=86=9B)
<Jianjun.Wang@mediatek.com> wrote:
>
> On Mon, 2025-01-06 at 13:27 +0100, Krzysztof Kozlowski wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On 06/01/2025 10:26, Jianjun Wang (=E7=8E=8B=E5=BB=BA=E5=86=9B) wrote:
> > > On Fri, 2025-01-03 at 10:10 +0100, Krzysztof Kozlowski wrote:
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > >
> > > >
> > > > On Fri, Jan 03, 2025 at 02:00:11PM +0800, Jianjun Wang wrote:
> > > > > +        clock-names:
> > > > > +          items:
> > > > > +            - const: pl_250m
> > > > > +            - const: tl_26m
> > > > > +            - const: peri_26m
> > > > > +            - const: peri_mem
> > > > > +            - const: ahb_apb
> > > > > +            - const: low_power
> > > > > +
> > > > > +        resets:
> > > > > +          minItems: 1
> > > > > +          maxItems: 2
> > > > > +
> > > > > +        reset-names:
> > > > > +          minItems: 1
> > > > > +          maxItems: 2
> > > >
> > > > Why resets are flexible?
> > >
> > > There are two resets, one for MAC and another for PHY, some
> > > platforms
> > > may only use one of them.
> >
> > Even more questions. What does it mean use? Is it there or is it not?
>
> It will be used by calling the reset controller's APIs in the PCIe
> controller driver. Ideally, it should be de-asserted before PCIe
> initialization and should be asserted if PCIe powers down or the driver
> is removed.
>
> > Platform like SoC? But this is one specific SoC, it cannot be used on
> > different SoC.
>
> Yes, it should be SoC, each SoC have its own resets, and the number of
> resets for each SoC is defined by the hardware design, most SoCs should
> have one reset for MAC and one reset for PHY.
>
> >
> > >
> > > Would you prefer to set the number of resets to a fixed value for
> > > specific platforms?
> >
> > Everything should be constrained to match hardware.
>
> For MT8196, there are 2 resets. Should I use a fixed item in this case?

Yes. As you said, MT8196 has two resets, therefore the binding should
say it requires two resets.

So in the second part where it matches against mt8196, you should
have minItems =3D maxItems =3D 2.


ChenYu

> Thanks.
>
> >
> >
> > Best regards,
> > Krzysztof
> >

