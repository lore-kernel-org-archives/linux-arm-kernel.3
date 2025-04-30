Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CE2C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bptR6X2FP6mphoSdJsDeJ0Nvu/lMa4Cwig/lOeyZQNU=; b=r0RHo91XvnmpH0nXzn6K6n7IO5
	ZRE5VM2EwwgC8xEc/Kfe/aYOwJAZ+A+GcT//F0dfi9HCOuMqqqNn4ANGfkjRB0F00I7Zw18N/rEaN
	BT5zsJK4Zhime6h+7TaulsVULyQ3AeiF1i4YTt84BpT8g37wWvrrZEwF48hu0c2qz7jEahBrWLGeU
	GEKCrfDzPRqja0/eSL5jPuFia4+bqernaK9ij0kE+41I54iPOvBdDCU+Q1jfOEZDTJZvtxzBGYoMk
	kFKXx7FywaEO1HUNS1em4t2dSvyyYLT8XTmwxmtUpEFy2X9ZIokFN02tcO7zF5CyA6h37N3BcWXFd
	g9yHsFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7yd-0000000D3y0-0OHM;
	Wed, 30 Apr 2025 13:59:55 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7rO-0000000D3CM-2uuM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:52:28 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5499614d3d2so7875672e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 06:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746021144; x=1746625944; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bptR6X2FP6mphoSdJsDeJ0Nvu/lMa4Cwig/lOeyZQNU=;
        b=CXf7iYMT69GPFCJTCpxxv1Krmp3P/j7LaZ5SH4Y+8fdeBP1fM2TWlqYam16kkFzA/P
         NC1ZhHD+IB1dxAJ65sgynfg8DXXGubjpoqZDJTrBJdoxxQolqkCdk1F/m+WcXCgXl081
         LT+xQPdD0PshY0H3MpZMTdCHzBAV5MPgXCPTmdxOFgdVDW/FVegQCKb0abbvLe6fKcJ2
         2IQWJV/Yjq1la7b0+Wrcx7rwPHM7bLqlW9UUCAtrDSsjCzbeYpAn3acpoJvBtdAo8CNg
         FhFwCew7eV7xZ87fouQQiefYUwCefTQCh9CzXKUoH7DCdpLvh+NjmhmRcRtCyhQlAVLO
         gSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746021144; x=1746625944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bptR6X2FP6mphoSdJsDeJ0Nvu/lMa4Cwig/lOeyZQNU=;
        b=YVk8R92E0XlB3GIa0jOGwUCy0vDIKdKpMhY8a+9jlZPQg0DEoANY+Xi3XTelHHcouC
         SWzPdQjD0ZHHufbQF3YhLDEWqkuknmBWDDzeY07Ggzn2CsAB3aKwuEmajsWEeSWgJDM3
         ZPtB8OJVDACotHEB02aMIqpRFU7cWd0fBSxfxsxoHLLoKrWzxrtNNKGd2dOL+M/MHzW4
         k80eMnNQoCgJopuDEiSO0AqQUMSyV8OtI4dsYLhpZ2yPzNbrEgwyIZ25zqInBwJ6A0M7
         P4wTE67kuD6lWVqQ59XMesHriA5YLuzdVuRTw7c7ixuqqG0NE1TPCL5Rt/QX3vjfs3Zw
         dzmw==
X-Forwarded-Encrypted: i=1; AJvYcCXYm8HI9MHyZJt62RaDNPLpoBFU0y1bAF8kXA4MwAzQw9te3bf0iswXtcgyZommWR+XHGozwto0rZV22qfMhPeK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt91olBSpYFfdVIvZUdFOg8oIJsDmRMB+drtVS2ZXqZ37IkCrT
	q8EU4yDfZ2tbw8g38V++/pA3tp4IIOE62amw/SsZZeE/Y4qy9WZEOKtkkhabV1oFp0vUA0Dzhgf
	/CAjQFAdBv7Gw9vAB3WreXkk4OErDxtyy8TB5ow==
X-Gm-Gg: ASbGncuK7MxuadevWy3Otok/wJrRZDUhs/EatF/gfofS4D7Vimai+z/3x70+kDDj2AS
	ue7V7XZu4WLklw3yfKkJkkJoVbNCMGou7XxavzYhpMEBbKrwJm7ZqgW9lC2CpFNm61jQ4JWYwct
	eOx40dSZMxWiFW4mXhrGMzFJM1piQ2+bizUFhvSJYmHYgaiAr0oUeGwWjzg6380+RR
X-Google-Smtp-Source: AGHT+IGyQiHIWhF80eEOC+6pgdTTn9cHOWztzyXKd7Hn1hMJ1sGS1ScFK8hKa7Xzn645fZbc6UnZ2HhOztB0rWXCHbU=
X-Received: by 2002:a05:6512:681:b0:54a:c4af:29 with SMTP id
 2adb3069b0e04-54ea33bc380mr1250594e87.52.1746021144067; Wed, 30 Apr 2025
 06:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com> <20250430131856.GB25516@pendragon.ideasonboard.com>
In-Reply-To: <20250430131856.GB25516@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 30 Apr 2025 14:52:01 +0100
X-Gm-Features: ATxdqUEUJPqT02hhE_crNuAPw-JTMhsKXzp2oVf3n9xmpn33eFhhZ5g7KLGMb_A
Message-ID: <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_065226_901056_583B30AE 
X-CRM114-Status: GOOD (  28.04  )
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

Hi Laurent & Niklas

On Wed, 30 Apr 2025 at 14:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund wrote:
> > > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> > > frequency and pixel rate") the driver expects two specific
> > > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > > (222750000, 148500000) operation. The driver fails to probe without
> > > these exact settings.
> > >
> > > Update the example in the bindings to match this to make it easier fo=
r
> > > users to incorporate this sensor in their device tree descriptions
> > > without having to read the driver sources when the driver fails to
> > > probe.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > @@ -136,7 +136,7 @@ examples:
> > >              port {
> > >                  imx290_ep: endpoint {
> > >                      data-lanes =3D <1 2 3 4>;
> > > -                    link-frequencies =3D /bits/ 64 <445500000>;
> > > +                    link-frequencies =3D /bits/ 64 <222750000 148500=
000>;
> > >                      remote-endpoint =3D <&csiphy0_ep>;
> > >                  };
> > >              };
> >
> > I guess the link-frequencies property should gain a rule that it
> > needs two values, too?
>
> The driver doesn't require two frequencies (unless I'm mistaken), it
> could operate with a single one (albeit not in all resolutions), so I
> don't think we should require two frequencies in the bindings.

The driver does require both due to 98e0500eadb7 ("media: i2c: imx290:
Add configurable link frequency and pixel rate") and
imx290_check_link_freqs()

However I'd agree that it'd be better to make the driver accept just
the one and make any compensations, rather than amend the binding. I'm
happy to try and find a few minutes to make a patch for that.

My experience of this family of sensors says that we should be able to
run any resolution at any link frequency, but it needs changes to
HBLANK to ensure there is sufficient time per line.
Dropping to the lower link freq for the 720p mode is only because that
is what the datasheet describes for the precanned HD720p. The window
cropping mode lists no such requirement, and yet could produce exactly
that same 720p output.

  Dave

> --
> Regards,
>
> Laurent Pinchart

