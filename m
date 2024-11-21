Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A074FD6ED0E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oKpoaoKlTteKRfatjC6kRGeLlyxZzmGL1dkD3YQ10E=; b=EjU93llJJaC4zxiItqeHp3wyQX
	RehkkHvKOi9fAy7E6+lSv2+vCNJjfnp9jriWmFeWYBfA/VnRldNz77lu1cMajBsWpaDZlinMykGlx
	2zRzVu60/pskpdc+0ndZsZmnByhBKJ3TP4CNsLq14sS7+Xr/68WLC1UT5Pli0RnU6FIqU/z24d2w7
	4goZQ8SlhwV4/JtLfa0WLZ+E3RX8X43jBVaGK7UrzsEkaAaKoY+aBodiBNif3A2vcMPod3lSi25mN
	V83Dyr3P+BN1ulTNWKzthOkZ96bJl7h2aU9P/HHUoPR5itPKlapX15zX15z0ANVgjSNQVnjtfa/OF
	fJ6+uWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5fL-0000000HW6H-1LEb;
	Thu, 21 Nov 2024 11:48:07 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5eP-0000000HVzA-1D6k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 11:47:10 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-72410cc7be9so768141b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 03:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732189628; x=1732794428; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oKpoaoKlTteKRfatjC6kRGeLlyxZzmGL1dkD3YQ10E=;
        b=D0rjI6RMgaNOlTwSCmVCPiYi1zEGh0jsvhgoTuLzeJ29J/4Y5fMSC6PeSLcXwxA7T9
         oL+ruCqYhvHlC6h/hRROn0C2oRzeZ9l1cObnJLcEladGl9GgcDj34ZeKdISWSQWBcrmz
         cyVgvplyGtQTBsHOdH/dIFhsFgvRasVLwmWb9BbOq6OH0TQIKNUsqLGbcsn/pQkhpzqi
         rIdgVzgGis6ucpiGqDHd8zQz2B1cM9FJZSReJcvAKpcthdy6zyBitK9FJ2P2KUj7hBGW
         yyzUx8KNnmcR5eXbMNgatW9Tt6ZDttcA+ItBH9RmKj4iVuW5/mUbl9yr3JkUEKc3NY2X
         c7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732189628; x=1732794428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oKpoaoKlTteKRfatjC6kRGeLlyxZzmGL1dkD3YQ10E=;
        b=rhoVpYwbCCC9wARp7JkSXMm/NcxSvkgLFhsg27/ik9E/bDQMb9WJKVyjvbD7QAIOoS
         j43japOeBzBkRmL1dvu+02veCNT+LfhxawqBpVJ4Qfvf+7tL5Cy/bkdtFyVhAG1RGtq0
         qbz5zqkF+4DJsAaW7KQ2CyT4lz3vz/7NvZEUUURLYCrejzrCyaJa6ZvTEkfNMWuOawjS
         NHhAttvmEdbzPWT7Xd5LIlDeNZ88KjYL3eYX5rQs2J+99Hnvww6tz6dATGayumJRKaur
         lU/oVsMVlWHdSGIfRlYnLYy2HP2vXgGJSngMmdIVT5UtQ0zl8CFYuPkEE1P+niuzq11A
         120w==
X-Forwarded-Encrypted: i=1; AJvYcCXaEAGkBB+7phRZOEUpNQZnnELff4Sr4q35Y2StoJLDsALL8uPc9mTdPP4PUaJH0cG7O+RW4bGW/RMDrll9+JMN@lists.infradead.org
X-Gm-Message-State: AOJu0YxngEPa7m/KXSplBlJHV7nF+vIkeZD+3NVs6PJHqlStg/Diu7s9
	jNBXbrzpuiPwtLgt+Tw/yxIDgOeThRBX0abiqAmI2QtR5jtMcjkmcKVpO3rIgAi6jk+B1tEqi9N
	Pqv/q9XbDD9tuRjxnAYNvbk5ZSf4=
X-Gm-Gg: ASbGncvXcpEYKwcZevBhJFbl/ZvPWK5Uen0Hu4cY5o+EbWYmQJHP4W3Kiyj7ZNSmHoL
	Nn52/glDP6QA5jsowZr/VGtSPLvLw
X-Google-Smtp-Source: AGHT+IE2h2M+qxLCspBarhNsj5yqwS/EMhkBWxXjcDD9u0KTCey5QLScBBICtmjBrds0ZAtA4MlEHX5fwedUO4F3uCA=
X-Received: by 2002:a05:6a00:2284:b0:724:5d26:d904 with SMTP id
 d2e1a72fcca58-724bed2f146mr8063161b3a.18.1732189627973; Thu, 21 Nov 2024
 03:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20241120135859.3133984-1-daniel.baluta@nxp.com>
 <20241120135859.3133984-5-daniel.baluta@nxp.com> <DB9PR04MB84616B3F5A76AA1C588DC0ED88222@DB9PR04MB8461.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB84616B3F5A76AA1C588DC0ED88222@DB9PR04MB8461.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 21 Nov 2024 13:48:11 +0200
Message-ID: <CAEnQRZCSvOE5jQtSoL0xGJNpx_94V29TbidR8iSDC5jOwy6xQw@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Li <frank.li@nxp.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_034709_343741_98F3691B 
X-CRM114-Status: GOOD (  16.18  )
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

On Thu, Nov 21, 2024 at 1:33=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH 4/5] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for
> > dsp
> >
> > Audio block control contains a set of registers some of them used for
> > DSP configuration.
> >
> > Drivers (rproc, SOF) are using fsl,dsp-ctrl property to access those
> > registers in order to control the operations of the DSP (e.g for start,
> > reset, etc).
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index 41ff40ab5da2..fa4ff75af12d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1616,7 +1616,7 @@ sdma2: dma-controller@30e10000 {
> >                       };
> >
> >                       audio_blk_ctrl: clock-controller@30e20000 {
> > -                             compatible =3D "fsl,imx8mp-audio-blk-
> > ctrl";
> > +                             compatible =3D "fsl,imx8mp-audio-blk-
> > ctrl", "syscon";
>
> This requires binding update as I recall.

Yes, indeed. Will update in v2.

