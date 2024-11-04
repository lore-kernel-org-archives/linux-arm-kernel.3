Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE9D1BDC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NvqcwznYJEbOfJTrxk1An08MpWkBKh12Fm23xyda6E=; b=uaQIwAcgwx4YGKj/pep5HmnMFC
	5iYB4HnCwykP1GV1z9ofDvRfbSK+GIcCCbQZTUw6+aODMZLiHSMA8rDCqZ4QQfcHiaG0JYROzKpl1
	PSOtJSOncqzdWmYCFn8AvUTt70SVCAzN3i2ngDtgfO4hzqWfiuPyoFl88CDZ9L1fpAFuN9Ol7Mkw+
	VyKHD8VNhGZU1NVkCmQcE3Tsf52r5WC6Pdihrb9QdTCmJ3mN9/47uRIOZqG85nvMt3mtS1tC8HDlP
	DrEm20E0aIoSyiWUI+ANk+xfbLrr4vXhJsivEgsE32/a8I77d60gQIISCfjAhvGM8i678ufU9aGVy
	LhahtzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t801f-0000000EOO8-3z44;
	Mon, 04 Nov 2024 16:34:00 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zzy-0000000EOFt-3Eh3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 16:32:16 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so3439318276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 08:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730737934; x=1731342734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NvqcwznYJEbOfJTrxk1An08MpWkBKh12Fm23xyda6E=;
        b=QnlF4XLyK3Bu93Y6ghoR+kFwdKmyPxRsIuE2qLaRiKBz/2B1jX+bWFe4Dpey5rjRcg
         ZWuZ0oTcQ9od4A4Arm7po0uWsZY/5tA1NruhiZ8wywfA0pvzXOHGWZIIsVHVpuI4Gd8h
         PRvjvR2rc2qko7cPZaasIUu2obd26YjLpXdhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730737934; x=1731342734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NvqcwznYJEbOfJTrxk1An08MpWkBKh12Fm23xyda6E=;
        b=cm8nZ+5WTkQMNDi6nAsZIPEY99wHySseHj/xik1gCw8Zy/yVc1dSaWChSnMCJ1dS5I
         bTRDixdq1xY8npLg1NxINUDECd9YME+mertk8L61GUdJf+gU89oBZuEAsQTrqkVf2+oH
         eEHs/leQfV1uKRRmAM++QqVF67XyBEg8PQDag1nVFPeZaWF3rE/KSjsVfCl0MVZpffVI
         K4WApXPu9KkiHAxYbxxL1ag/ZyjUEMiflzFogC7Kbgnn7PwP2VNL6W9VrYLP011AFcSn
         HSOg2bjJG56YSN4jzvoswRazm7ojzG93kk+9dN93Gu7GcBUp0OJTLd4ykbFgPiOKba5e
         IOWA==
X-Forwarded-Encrypted: i=1; AJvYcCX+XinMPVExpu1XoVtDxvAHO72naQnIHuOM3SKFNe6j1Q8HOSDIGTh1gskhEp7fO7Ix6FuLJFJM/XoMtU43HiRZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0TUOpHsqEtXth9WktMt4qPwRQYyORQ7r+fZVYj7HoU7FesnO5
	o/jtpyuvRXIJe6GXC50xkNEwuK5Rn3Z4N0k2oEKaz4UUVmuCVlKq5frX8+7HoTRXNUo0RWUHCf+
	tANGFXsIyIoKQ958iVZyLMSlU512rbyHMxl+nGA==
X-Google-Smtp-Source: AGHT+IELYvUmczkoinr/h7h4D5wovUbn46OmYDOIs9EuWMuur0hSgIUPkzT189bHxP5gqhspJGZhWZ+bvDCtj3+rRX0=
X-Received: by 2002:a05:6902:10c3:b0:e2b:d610:9d67 with SMTP id
 3f1490d57ef6-e330254f5ebmr11392789276.9.1730737933890; Mon, 04 Nov 2024
 08:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
 <20241028102559.1451383-2-dario.binacchi@amarulasolutions.com> <20241101173914.GA3786619-robh@kernel.org>
In-Reply-To: <20241101173914.GA3786619-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 4 Nov 2024 17:32:03 +0100
Message-ID: <CABGWkvrC6N4ujWfJSVyktyyAODUM5TTucFneqsX1H4PQK+nbvg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] dt-bindings: soc: imx-blk-ctrl: add
 'fsl,power-domains-boot-on' property
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_083214_835531_8FC6D6F2 
X-CRM114-Status: GOOD (  24.38  )
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

Hello Rob,

On Fri, Nov 1, 2024 at 6:39=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 28, 2024 at 11:25:24AM +0100, Dario Binacchi wrote:
> > This property lists the state of the power domains, indicating whether
> > they have been left on or off by the bootloader/firmware.
> > This information becomes relevant, for example, in the case of supporti=
ng
> > the simple framebuffer.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml       | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-=
blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-b=
lk-ctrl.yaml
> > index eeec9965b091..00aa0b8d8ea9 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctr=
l.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctr=
l.yaml
> > @@ -56,6 +56,15 @@ properties:
> >        - const: csi-aclk
> >        - const: csi-pclk
> >
> > +  fsl,power-domains-boot-on:
> > +    description: |
> > +      Provide the on/off (1/0) status of the power domains. It allows
> > +      specifying whether one or more power domains have already been
> > +      initialized and left powered on by the bootloader.
>
> Sounds like a common problem *if* we wanted to fix it in DT.
>
> Why can't you just read the h/w registers to see which domains are
> powered on? Perhaps because some are on, but you want to turn them off.

I checked, but there is no register on this platform that indicates
the on/off status
of the power domain. So, I cannot readout the power domain state.

>
> Also, for simple-framebuffer, I think you can list the power-domains to
> keep on.

I did it; I added the power domains in the simple-framebuffer node, but thi=
s
doesn=E2=80=99t prevent the genpd.power_on() callback from being called. An=
d when
this callback is called, the power domain is re-initialized, which does not
maintain the persistence of the image on the display. Adding this DTS prope=
rty
prevents re-initialization that has already been performed by the bootloade=
r.

Thanks and regards,
Dario

>
> Rob
>
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

