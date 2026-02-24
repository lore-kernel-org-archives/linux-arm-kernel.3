Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BE3F4BB95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=; b=MbV6jTemh9tgw9a7VhMU/Ucaam
	+E3tgF+S8ezpu4nbHVp0h6w/Ewcrqw1mgCzVBn+6998MoTqnKkRTblbiWYCXXXvbyPrs5bMDcEL67
	IUeb4qh0TaDDKb0om1PXaEFXwyD6Uxsm2zqaclQNpn2ydLymPXHO6pJHNxYRnz2dQIp/9ItKj2KHp
	yy1MZgOENvG1C5+L8pYiDi1o+jAyMf1CemYpeZSYlA2wXyomHAGeNb36xJ4cXbXurcu4FCfBd0rhR
	/MYoYpB4WM/tVKYPjF+rC15LSaw2e3XhZQaqry8Ex7gNocOXMhFx45BJvrBYzv8kVey+DQHKE4Ut8
	NBkBIbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1BW-00000002tMr-2xEX;
	Tue, 24 Feb 2026 22:47:18 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1BT-00000002tMJ-40rF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:47:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-65a3527c5easo10591260a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 14:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771973234; cv=none;
        d=google.com; s=arc-20240605;
        b=MjgT6EBdxe+s3sL20Gq18mI+yeQDYMl8aPUiRAAVcqLuHp3a6pZq7vMlOXerd6vNsh
         CvkTnQ6OJXu0awz313NNbbPdVD3lYCvbp4X4Bsbdspfv96G08nb0bWIU31IoFnH1FEnq
         3WFOrqxcEnmLJBHKrn5GA0KUGFju1Gy+OwhQTpugAy9O9HfrM0k0dbGXi4UIsECEtDuO
         CSSA/S0JIZuDobMEJ3ilsHmp2DzpZaN50fzRRUtor3WxchbJJ8cXBWu4nYnF35eIM/Qi
         MXvT4G0aDkrJOAxFA7e/aGdaptoIPtBBjLWf2eT1nWgAONYgUcuM4lvUKUnJGqCsbv3m
         H1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        fh=HSPw16STHqzqpWkI6hf4G/n7y0RlQvbAU0qEJUl0eF4=;
        b=h/An0YFyY2RInJOdvouF3LAGwQMTi6mrMIpN8eron5Pr4fsgGl6KB+j4sGYVOSIuHl
         afL2MbX1OTBcsgKxBPqjD05mAUT5rTiD1xR24ulQGr5k2RMcuR26uHBM0PGghDwVxUM1
         /tXDDCxY14oMJUxx73AvmZ8ADu579FrSw1i8yEYr3N4RvPFh0MBXgs0hOEQI7KMCXNe2
         hqHkXx9bmENtqPyTIfJR7bz1Oaz/kPmv3tbAABwA8MNFZkT3PQMAKyd5RqTta9eAF8yy
         y/go99WDvl5RdQeMtYAV49C2HibSKNeON/7IUt2vfH9uURu87mImATXcXXF7cjhwhFlH
         gYew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771973234; x=1772578034; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        b=NHJT6g12uV4mPWL1e5824S8UIlnOcfW15yBjG9Mi9Nj7UP9uxtHVsKd4MIMiYwIg9r
         3jOirXGImSnWuDxh0R0Z+xl/zHzUlr0KJcDBz7eNtMxKuPaGAkNZeHTKRDwNTndeNNXd
         5v+A2S63Uf98f0yl8AgV7mtnEvvSVS0+380hWSS0XovF1B6MYZoKDOdmPKm2WLqx9b4o
         UWQ7qsrU5qRptFPaivOKMhR7tRTH9iaQtcLNhVBY/fFk3vKUFKjSZJTaRC5DA+j5X0+/
         yToGa5zKesui5j2aJJK8ezqKpf1flz2M+xjbGgeXDjgc60KN0V6NbUn52Phv4w+Hhwyz
         BF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771973234; x=1772578034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBtpA9uIN0gITjPuBpG1lTav8ApyzBRQxBUsMgkMm8c=;
        b=A8RWewV5RsOy/zjHqBvxzpeTMPUWmTQktKDW9gytobps9Jm6NdtiSjLYYwegatXPDk
         8tt/UKzq7eTeMwdsxtb4Fo2vnMDDaVIztlkFQ9DnvH4xSY/LmQ/tJRjE9hMtscNvzZOn
         iLrjJVc1MSdTBicz3vKVbj51jhrqhe0IDDIuaZh4BAVHrbZM20DEcv+tZ61IwpW77v5Y
         hecXQa66sU1zj7HPVW1gXzm3+NcKnbUngxCFUZ3it7fAZlpN4KNpGHhHP1ryVu8f3Hcv
         THRXuQ6ZgVmqrbPshPWAixaVohAbIQOFGHmoonK0MSdGX28MwvMAgI975yeZvd3I8iFU
         rn/g==
X-Forwarded-Encrypted: i=1; AJvYcCXd6RsuT5WBsgjrWicLZnssGLNfHCBp6mLSkUODG6xkhYOyz7Q03EAnp+Mxd404Bm07FiR/zVTeefE027xOleZ3@lists.infradead.org
X-Gm-Message-State: AOJu0YxUGcVj4YjDVRHaVmRxVn66Qw00D0gm4TABY66pFqa08MPZQd1j
	GVO0uaGKzyZTUsUqU/yXgZw5YLyrcgFwaht45B8rRCWhIM/RmrvRucujf4fBqsAPhrwqM5cbQUJ
	S2lcAagE9m35nlqO24R+RCpc7d137ZxHkJcySL9/PIA==
X-Gm-Gg: ATEYQzwKJOuTxrUD0vWVbGSu4e54RCHn+sEVlwbbbVt3ymHOiCmRvuHHOiI5EZUcf+B
	A5HTG/qfdktfIiMTLzc+vxdK0ho4OfPIu89biazsqbSSdRmduEagd4Wp9mNg43NFQTAs2AnhbFN
	iJ3Xr2oedf2t/0RCYKuOt75EC7sGgKqZre//aTz8/uByukeTT2lP+5/N5TSM733sg59a/u1JEMz
	rQgP8gVGITpBh1x96mIlYdTA9/Dt175R/N4wB/j0mwg34mZufVTqPHkD4pxn3BhjWqRfKy2bTfI
	OQM6py379iV72pW9HDZetLGMzZev67sQVAspxA8PFA==
X-Received: by 2002:a05:6402:430c:b0:64b:3225:b771 with SMTP id
 4fb4d7f45d1cf-65ea4ec02efmr8235378a12.6.1771973233960; Tue, 24 Feb 2026
 14:47:13 -0800 (PST)
MIME-Version: 1.0
References: <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com> <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch> <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch> <PAXPR04MB9185FD3EEC313CC2408E157F8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0b42e303-a2ed-4983-bee5-a4eafd6c7f36@lunn.ch> <PAXPR04MB918509F265757E6028B45DDC8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <8fbb4ded-8914-4e11-aad6-038c78f2d31d@lunn.ch> <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185C388591EC3C9053C262D8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Feb 2026 15:47:02 -0700
X-Gm-Features: AaiRm53YSUao7_rhr1i52add55pdbzLxtSc_huet_gFbRkQV2slyqwkA4zQhORI
Message-ID: <CANLsYkzzkvSHVWt_DOw8q7DvD3mic12zcNR1wuxrG-_vG+H+JQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_144716_039361_8C5A661D 
X-CRM114-Status: GOOD (  19.70  )
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

On Tue, 24 Feb 2026 at 15:32, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Tuesday, February 24, 2026 4:23 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: Re: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> >
> > Caution: This is an external email. Please take care when clicking links or opening
> > attachments. When in doubt, report the message using the 'Report this email'
> > button
> >
> >
> > > > > + remote_cm33{
> > > > > +     rpmsg {
> > > > > +        rpmsg-io-channel {
> > > > > +          #address-cells = <1>;
> > > > > +          #size-cells = <0>;
> > > > > +
> > > > > +          gpio@0 {
> > > > > +            compatible = "rpmsg-gpio";
> > > > > +            reg = <0>;
> > > > > +            gpio-controller;
> > > > > +            #gpio-cells = <2>;
> > > > > +            #interrupt-cells = <2>;
> > > > > +            interrupt-controller;
> > > > > +          };
> > > > > +          gpio@1 {
> > > > > +            compatible = "rpmsg-gpio";
> > > > > +            reg = <1>;
> > > > > +            gpio-controller;
> > > > > +            #gpio-cells = <2>;
> > > > > +            #interrupt-cells = <2>;
> > > > > +            interrupt-controller;
> > > > > +          };
> >
> > > Then how would you distinguish gpio@0 from gpio@1 on the CM33 RPMSG bus
> > in the example above?
> > > They are running on the same transport.
> >
> > Doesn't reg indicate the channel number? gpio@0 is on rpmsg channel 0. gpio@1
> > is on channel 1? The reg value gets filled into struct rpmsg_channel_info when
> > the endpoints are created?
>
> There is only a single RPMSG channel for the CM33 remoteproc in this example-its name
> is "rpmsg-io-channel". As I mentioned above, both gpio@0 and gpio@1 run over this same transport.
> The transport here is the RPMSG channel, so multiple GPIO controllers share that channel.
>

That is one of my main problem with this proposal - multiplexing
several GPIO controllers over the same RPMSG channel adds complexity.
RPMSG can already handle multiplexing via channels, use one RPMSG
channel per GPIO controller.

> Thanks,
> Shenwei
>
> >
> >    Andrew
>

