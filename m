Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02730C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 03:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOjNpQnzjVItcjZQzSaRVqafGTbidnsz64LyMqqRnyg=; b=Oz7RE4/rjpo0PslXYpdbvv9GNG
	NuO99Bqxje7LVB6CwHEfrEerIxoMb+vAp3zjQASTKoQfqecjYWh5Go2/MSzb1CSpOyjL0hdaRywYF
	4nZuCet66SkdRbwy+MQ0nb3VFjFHbNkalfKaBMqrQBnd5gG9LY5furIeMX0H+m8axNy5w+3zJbGpA
	ntcWzjj2jIYUbOTjXouXbjJhN3OJqqRzKz83rHbdLvubuim6nVRoQz4+rArGdqA23xJhW49RvusDx
	xL/SFO92MJh/mcnEQUrZMhS0vy6GADpVwEwgXTvPsYK9ufwiua6xzxWFTuRFKObxAfHaRrMdZpkAn
	t77awezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti3p0-000000066l0-37Pc;
	Wed, 12 Feb 2025 03:53:58 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti3ms-000000066Qo-0KE6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 03:51:47 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d04932a36cso55511305ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 19:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739332305; x=1739937105; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOjNpQnzjVItcjZQzSaRVqafGTbidnsz64LyMqqRnyg=;
        b=L0NkRk0++rn5u8OAnCUmMge5WjAu1f2nsCIulBb9gY6dzPSd/C3L4LYwFJ5v2zXyYq
         lvNfOOUJ4+GcJiYbGov13ClQuPWsIrZQjyETNzu6b0/7/f71y0sqFlyuP2VnyOMsqHQi
         pRoJFBbwUN/i66HsRhPZs225EUpZANLsTxaqaLT7SGmImUG9RneP4zJr88HtYehpvfRX
         I6TGbzSxtgUNjEKgMq+pbMKqd2a5Ic9fY2Q7NYhhPrKsxssUAcMBUAkXK8IhtLbRW3Ou
         9YPTi5ZLAARrg6GhBQica5jqE5chDiEePAEeveGqa+F2pv2BPcWtw2BLt8fODjNZDSjt
         XUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739332305; x=1739937105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOjNpQnzjVItcjZQzSaRVqafGTbidnsz64LyMqqRnyg=;
        b=QeQG3fuZ2FKDpJSzh178cMNfk2kyJpbLtd8SGLR6cPpWlC+hBCsJ8Wuscz5ewGaQp/
         yDS+jaiVmqZbi1L+6b52DINSgHVP6A/4rFsuwbCEFkM1Q6JTEQSO0JVBl8F8TAqf3/FP
         0uMbN5ywEt9TfUukwfeYX+bDJugi8WU5pTPpLxOXNZW2qvMPDGtNUzfrdjJ39nmpyX/3
         +qq79pwvpOgflQ6POsKUmEbTVAe/gGKX0qBwcn48ksj034xN79Lpm39xSsYPtq5t5EZp
         UgJCK4w7Bo7qT4XdBh20c9X+xOT+2ut+UamS6R0QQbUuIi/EVKsVsW/iy4LuKd/uKlQW
         +s9w==
X-Forwarded-Encrypted: i=1; AJvYcCVgQGVNg6gVZwaHJH48EV6jANg3Hz7oqcn9HAJcijZXS6p3Yoo/L/5WAAflR+me7rmGtMR0y5ltx17e4xFFWIAU@lists.infradead.org
X-Gm-Message-State: AOJu0YyOGW/6fSxjRF/lYgh21Ka5q+T+4nuSjFIqDY9w4O1ScgNYmIU2
	wMBY+5fcrHJxrluS5J6O7fAvomlo5WNPITeCf/eGBizPbbPz3jNQI+NSrthD9a+maTvTahPo6/l
	YU4a06aiCcWADckSMNZutRTySMAk=
X-Gm-Gg: ASbGncsFaBIo4p+fYU9vHRRUe3sy2Ru06lxiOAX0ayDpbThWomc0K3Mw7xyqoP7iazg
	wvoa8C8zgL/J/aWrRsjlL+aKVhOL5DCKlioAttAtkDF5z/kukq1JUNbyNxGM6aQSMVi6+V7vd
X-Google-Smtp-Source: AGHT+IELmMC+rEqMtc5H2YZuEE1iKouS45lV6N0hJ5Or/LuqIGNtJHv3ZlrPMODm1vA23GJ/GTBsAYKKjidNOlR17CI=
X-Received: by 2002:a05:6e02:180b:b0:3cf:b365:dcf8 with SMTP id
 e9e14a558f8ab-3d17c21ba5emr21495995ab.21.1739332305183; Tue, 11 Feb 2025
 19:51:45 -0800 (PST)
MIME-Version: 1.0
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-2-shengjiu.wang@nxp.com> <Z6ttkyfUapRKGMsk@lizhi-Precision-Tower-5810>
In-Reply-To: <Z6ttkyfUapRKGMsk@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Feb 2025 11:51:32 +0800
X-Gm-Features: AWEUYZl3szAb6kdvVRYt667G1aLNreWAtpJFe-4jAXLL0jVOJ3awo1RObh0k1-U
Message-ID: <CAA+D8APFPKGGNHiiRYFgGVM-AL4LrE-q0zy9i0mErjeJU+KbuQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: imx-card: Add playback-only and
 capture-only property
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_195146_113434_8FE980E8 
X-CRM114-Status: GOOD (  17.18  )
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

On Tue, Feb 11, 2025 at 11:32=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 11, 2025 at 11:57:36AM +0800, Shengjiu Wang wrote:
> > Refer to audio graph card, add playback-only and capture-only property
> > for imx-audio-card.yaml for the case that only playback or capture
> > is supported.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yam=
l b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > index f7ad5ea2491e..86571fa930f6 100644
> > --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> > @@ -46,6 +46,14 @@ patternProperties:
> >          description: see tdm-slot.txt.
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >
> > +      playback-only:
> > +        description: link is used only for playback
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
> > +      capture-only:
> > +        description: link is used only for capture
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +
>
> why not ref to audio-graph-port.yaml?
>
audio-graph-port are based on 'port'. which is not used
in imx-card.  imx-card can't directly refer to audio-graph-port.yaml.

Best regards
Shengjiu Wang

> Frank
>
> >        cpu:
> >          description: Holds subnode which indicates cpu dai.
> >          type: object
> > --
> > 2.34.1
> >

