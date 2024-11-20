Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD20D711B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 15:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GT0pzREV3J2zvk7nPHKF5lsRBHdeeSGwYUopMf2XrA=; b=M5MVd/uqMsba+NLJISNjA2qA1g
	meX33wgiYtxR59CudWpPZpmqQzL4YKQRm1P8kkTE/OCk5U9MxGEd8BzVoZ4VCOYCsHrEsjvr0VYBW
	+OtzKOG74EisthrFLaKlVzZ1Ydz6CtlsETDdEFuHLxL9BgiaXMVLlSkdYGvyShUTIU6ifihx7yz67
	thxgbNZx3DbnilEA7Fg82+ZFFJEUF1Sii2rtdzQ9EsVpiggkAxCmJdcq2vuNYIt7xvxsPjwWY5tdN
	+7+vdam6i2DEzl8j5s3e0q9Y/QENkboV7zfdKuxfd7lpjE3oULgLQzzku++7lRmpdDUVjKHyL8KUA
	rwSOr8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmot-0000000Fi58-13AW;
	Wed, 20 Nov 2024 15:40:43 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmnw-0000000FhwL-1hBx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 15:39:45 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7eda47b7343so1714157a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732117183; x=1732721983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GT0pzREV3J2zvk7nPHKF5lsRBHdeeSGwYUopMf2XrA=;
        b=C6PQ5U7LnBJnUOFThS26YJ29TQoWNsxLLoKRwhow1sYjXC9EAJh+lPoczFeS1TRORK
         /XmvgVb2a15TJSLGwCh7KhqxHofeW84MVaPwZC+i/TF8q6Qhoxj+CYQ0HD7ir3+pbjWK
         C2LVbilwqL93JFpUFV2OaPieUQTCDjAr75TfQrzNGtqQIgebATjvrDD8a4EyBhjHJqz3
         YCAs3/rUV5qb2Nq+IV/3Uuc+LFF8/k3cf6yRVbNdFr2BhoC8LymZAvVIUy0ApG6WF8sC
         Ix8B67r2UftrVwpDBR0vYC1UfRLPG6HFf7eZ688eM8R3TmbOdhG3VssA54SVfqA+0k5m
         xbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732117183; x=1732721983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GT0pzREV3J2zvk7nPHKF5lsRBHdeeSGwYUopMf2XrA=;
        b=rYzNulB5v4bJT/lxLzqA87C+JMtom1gf70xjunKr9LVuRCve/VnpRbcOfpL4uz1251
         AaE8FardRJcUZiHOytEEbFihPPslvm/qRiEBX2l0LB+XQ7/GMFKAyVw54Bbjc3Qf0TYR
         L4h7Gs22WQJaER37X5AbjPj1tneJppBvNNJIc/OxxFVcD4md8ufLODbde9BQ1AEUf+gm
         XnmBDHe9gwSc4nqGnJbyORgLYQ27cDeuQWvewFiWK32rg0I7c4GhROkEjNNWTuGgK8tU
         NhMvoTmm86PpLS4WCLQLoblwOfZeVPax9vkT6yEzCwePjZ+uoQ1DsRF8+8mm3zApI20E
         juaw==
X-Forwarded-Encrypted: i=1; AJvYcCXWkH5TkITvYLvdIW3FMmV0aWljgdI11CfQroeUL1F0gAbrS5Kd+pqEAN1NuGnVnIZPYWfZnqkjMitNO7s2psq3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2iHxB+qwaMGmjWXpjAMMyv8ILgogKWdggc23Bjfl8PXiRNXyg
	IG1GIGAgpL7Bil/L96TVBGV9nSnj+vjkJEWlxQV4jcs9pO6Q+prdOGAVBfSjcnVKZA+JriIdk7Q
	oO4qDXuHRDIXnwahx4NYiEySLMo8=
X-Google-Smtp-Source: AGHT+IHtExCHm+hnVUXyYz7nTokaTlgnHFY6hCDnZrAs3FKOIXQBuExWWJ5/go5fXw69nnGBgXV/+vib6N/Ya2OTMnU=
X-Received: by 2002:a05:6a20:2587:b0:1dc:7d9f:948c with SMTP id
 adf61e73a8af0-1ddb09139c5mr5284381637.46.1732117183019; Wed, 20 Nov 2024
 07:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20241120135859.3133984-1-daniel.baluta@nxp.com>
 <20241120135859.3133984-6-daniel.baluta@nxp.com> <11dd729c-df29-4d10-bf47-73e1fa01322f@pengutronix.de>
In-Reply-To: <11dd729c-df29-4d10-bf47-73e1fa01322f@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 20 Nov 2024 17:40:47 +0200
Message-ID: <CAEnQRZBh7=niaH_yoHD0uQQs=4GEB89mf_7nqVjfAWums=tTpg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: Add dsp rproc related mem regions
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, aisheng.dong@nxp.com, imx@lists.linux.dev, 
	conor+dt@kernel.org, robh@kernel.org, iuliana.prodan@nxp.com, 
	shengjiu.wang@nxp.com, frank.li@nxp.com, linux-kernel@vger.kernel.org, 
	laurentiu.mihalcea@nxp.com, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_073944_440528_9EDCD6F5 
X-CRM114-Status: GOOD (  14.41  )
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

On Wed, Nov 20, 2024 at 5:36=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:
>
> Hello Daniel,
>
> On 20.11.24 14:58, Daniel Baluta wrote:
> > With imx8mp-evk board we are now configuring 'dsp' node for rproc usage=
,
> > so add rproc specific memory regions.
> >
> > Also, enable dsp node because it is ready to be used.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> >  &eqos {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&pinctrl_eqos>;
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index fa4ff75af12d..e6f3ac02689c 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -282,7 +282,6 @@ reserved-memory {
> >               dsp_reserved: dsp@92400000 {
> >                       reg =3D <0 0x92400000 0 0x1000000>;
> >                       no-map;
> > -                     status =3D "disabled";
>
> This reverts commit 010dc015b811 ("arm64: dts: imx8mp: Disable dsp
> reserved memory by default").
>
> Please enable the reserved memory node in your board DTS instead.

Thanks Ahmad that's a good catch. Will fix this in v2.

Will wait for few days to get more comments on this patchseries and
then send v2.

Thanks,
Daniel.

