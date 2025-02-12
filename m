Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776A2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88AwpE99PaoAeek/DCfv+c+a/zWXUaUFSdw15oFH2AA=; b=L7vO+6wZs3k8LRhX7iHbDrCV6V
	lXGsdVWFasyAmcQcJB0Nqgsr70ACsPBRxhcN9JN22QeRzcCsNuVQjZFqDMZkC8wG5FWAG7vLGCRTK
	4NBiu2OWh+HrYM4g0LJwG85jqHD0Hnvq/jxOTR5HAe+hj3ETqiIOOMVG56TSS5byVbHqtUiSxnrcS
	wf0mBd8pkzjeUrehlB3rwpmkjIS0egC7cdvzYIkZbEOlAsnnCfTzKtfyqBjbeBvgnVJv7ooCm5M9d
	FRI1Tt4W/GXUkZU55eqq4MtTBiN2cKGD/8JYMHac+kGCl4Bykm5i69X6U6dQL2s4d+XNfxqjnsoco
	8X0GoYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiA2i-00000006zfw-45bn;
	Wed, 12 Feb 2025 10:32:32 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9hA-00000006w8P-0RoC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:10:17 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so5047002a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 02:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739355015; x=1739959815; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88AwpE99PaoAeek/DCfv+c+a/zWXUaUFSdw15oFH2AA=;
        b=F5N1X6emdwpPAJZQSiBWUfj3L1rvJoIAdCzYandzfyq/35FmQYbauHrXfCLvb26JXt
         QoST22PPAObzLxY+qtHF0b912Tqjkm+/B7ngxcdNXcqyI4Lyux5ksYGIyLAfg1Z0Zep5
         y7iJFMczbt8Qef87g5b/YFXUIWavAOwKMsOT/6AXMEi6wLsN7ThmEDpsrQWWOwID/Bef
         V/mYOdLBSLLvXFIkijjQJ7gVEzO930PPvQwsxNA0wNL2nTrCC9hEuL0mZU6QbLwqS6Cm
         QlA3X/Ibqm95l6j7lYjfvqWQKJyB8Qqpix1V0iyTui+XppXnvt31346sVsTtt30CHliw
         xEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739355015; x=1739959815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88AwpE99PaoAeek/DCfv+c+a/zWXUaUFSdw15oFH2AA=;
        b=WS0O/3AZ4U9cEOimbNzCt7FLIzy5noGahmWhxdfIFJ5HcCiXnmqMI6dAH+YA/V+Qt7
         znmEX4yRq8Q9gASmiwuTYK+cqhT28dcDF6knxegCGU8m9CT5gyS9ir0X2sKZd3nOwfkw
         ONlP2NAgq6g7QLtr7zKtZBSszMl+2zjzVHoWJyRzsSE4PTokUE3+s+cCiVzrEMrlBBNU
         ALGnCRXb4+N7MQ77un/bsHVOA0KhxzS+b4/Q7ffZgFbxU1Lm6IHzWcafzyurOQxpVvHZ
         raUO3oYpx3QgfPKeJR8j1ZWMatzE/bXPj+y9cyduFBbhdOe00+4eiOFRC6eNSxYRNMD4
         0d3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWftpouUwhbTpn/Zx3QTzlrP0Ix6MbEK9yxCFBKNr8vjzI8SEtZvwyZEcRMwDveEdzakmkmV5sRj9YWi0yb35iT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9NeVsHVBiKzOOZKNJVIRQBgLSLHD+VdNAo/5ng7E/AUvvVecg
	2Fc1ys7WvF7NPp+vt41gjXuAIV0gaUiwreP/kOz++rkPoXv7DNJxP+wYKvGBnq3nvjUpf1byPIj
	EhMvu3+J/20oxSlC+U8FEXVdxPw0=
X-Gm-Gg: ASbGncupYJnj71N2fzmMaAu8j3Ahlmo7d6TRMdXqUEG1vwlspsCw3cuLd6lGK1Ng7mY
	uPE5U78ossqFUF9ZmJSoEkTLQ/WlZBXG5KOKksy7I6nOIAv+lHts282ijSufYjuoqFQDRHQ==
X-Google-Smtp-Source: AGHT+IGmuZRdGl3j3qwqlGA+I6iMmpaYMwad+794x21O14HpgAdBUJZvPf+MREMoJEJJ7oo0IQ1nHPq82m46EvhwjX0=
X-Received: by 2002:a17:90b:50c4:b0:2ee:ab29:1482 with SMTP id
 98e67ed59e1d1-2fbf5c0f645mr4582577a91.16.1739355015327; Wed, 12 Feb 2025
 02:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-2-laurentiumihalcea111@gmail.com> <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
In-Reply-To: <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Feb 2025 12:11:49 +0200
X-Gm-Features: AWEUYZmaBc7oKF6zAnQ7CZxr3zaURFYGkUGsn3Z_TJnj1f8vLuCQ0QWTQQTBMT4
Message-ID: <CAEnQRZBeQdnC+K92+Udb5awTmom10YHHNt7Ld-pYK4A1i8sr3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_021016_146781_E24505F1 
X-CRM114-Status: GOOD (  18.85  )
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

On Wed, Feb 12, 2025 at 11:38=E2=80=AFAM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
>
> On 25-02-11, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Add binding for imx95's CM7 core, used for audio processing.
> > Additionally, introduce a common binding for NXP audio processors with
> > Sound Open Firmware (SOF) support.
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 +++++++++++++++++++
> >  .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++++
> >  2 files changed, 91 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-c=
m7-sof.yaml
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.=
yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
> > new file mode 100644
> > index 000000000000..f00ae3219e15
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP imx95 CM7 core
> > +
> > +maintainers:
> > +  - Daniel Baluta <daniel.baluta@nxp.com>
> > +
> > +description: NXP imx95 CM7 core used for audio processing
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx95-cm7-sof
>
> Albeit Krzysztof already add his Reviewed-by, can I ask why we need to
> add the -sof suffix instead of -audio or so? SOF is a software project
> but you can clearly run different software on the audio-copro as well.

Sure you can run a different software project on the audio DSP but
you will need a way to distinguish between the different projects.

There might be different mailbox, memory configurations. So you will  need
to invent another suffix specific to the new project.

We can make  const: fsl,imx95-cm7-audio as the one used with SOF
and think about a different name later for when another project will
want to use the DSP.

