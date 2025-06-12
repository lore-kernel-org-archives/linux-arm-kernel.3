Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AC6C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8e9esVoe2c1asLojkhwYh+MoQPaPYmSvfLLOY1O43Qk=; b=uTkL7+lHwqCf5Sy72x/G6iweYM
	1aOQTWgyxuIH/IAjDBHi0lrP+LzJwsEGxGSh6HFVB7K7S6x3Zvpn12YiewlZK+3Pd5BqKblSOunns
	BDn1XivfN9QowrzZ3l5jrKvaFrGgz2EJFFaY5puEyBcTyJezIfbC/83h2SFqfRuqeXa+KwRWDxRuK
	w4mb7mjKZrmrOc34L6Z65lpO6qxZsIN4G1Rg5o3n09UwR1QeV8LCGoSh5Vtvf8BCl5QPigYDd1t+8
	1w3ZAI4CTdL3NHZhAvqZd48thrsyNx36EqwDj1WBojWdfZ8C3y8aNh9DtOxti7NBlLEGT9xrA3eie
	3NpJ/+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPo9C-0000000ERL5-2O43;
	Thu, 12 Jun 2025 20:03:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnuJ-0000000EOnm-0TKq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 19:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8e9esVoe2c1asLojkhwYh+MoQPaPYmSvfLLOY1O43Qk=; b=iv4tYy7jBRxAjhLXsJhdI9wzJS
	68RVryyQRgRpzIZvwEIH5SQQi6JI2k/u2moTrZtvFTTQRVKlqEiKLQUtz2J7yKzib5fKv1DLdFb5L
	g7axGweSfdZTvstrkJmyBxSSt0NtRPeuH8g4evPU+4ztZ0949lGzX632/3ZN9OPwjOC74iFZrOPij
	UAdat/tLZUU0dl8dhBZV9V1mWIx2x4Saa9rxZ9qKYrOSS+e9BngTH6pPhyarDSzQiWG3Uqpo726Z4
	jQNBlgHR0e0kPUPsJveV9o+gJ1WEmfG4Rdirc/T83WPBhTj9BJYMtPG1R2xRzddRRhgCAgf0V4CPy
	AEA9s9mg==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnuD-00000002eOF-27xB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 19:48:14 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4067b7d7e52so362472b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 12:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1749757683; x=1750362483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e9esVoe2c1asLojkhwYh+MoQPaPYmSvfLLOY1O43Qk=;
        b=knFOwKYGLPp+pipUTpD2b7JTbDIVhFf/Zx8BemXkRVkkB87dIdKOAiGFtfe4Np5wp6
         3QX+V4bvcWCLSQqp6HDwnidk0Z2wLUTYkACAwxYJf92uTfyWN6IiColRNFkQPy0zSP+L
         j0Q20+Cxhu5NEbQBPPAr9FfgCNg2CKl0Lhcdsxrk/GajfLMKcf5Tjk1ZSO+bEtnBaLvx
         rqWzh9oijJ46FDeYkbr2aeozbjRfWc5XNRUQdC4X+mhWrkjyOqMY1kE9kvDLg0EkLibV
         FJa1Djekx1vWp0wpQWDhs3Ge+O/L4PsERSTQ7T6qya1ig8IoQOUDhk+K4l2FRcuHKYRI
         Dytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749757683; x=1750362483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8e9esVoe2c1asLojkhwYh+MoQPaPYmSvfLLOY1O43Qk=;
        b=hg1gKHd2eMbOZJAoTUug6ldPjN5C4M+ILElqNFI+ZKQfxX1KXsotydyQZXw37C+2NA
         Duhjs4OtpxfAQBSR0XmVK1hiwiISgjgmf5+5DjL+DFsCnRHUbVxf1qhK7UkCHz2cvH+Q
         ZrESh9R29GXUQxk/ViI9gQbG2C0GMvSs2boLR1NzhnrA5qmeslxklvzDvuDgA0jDFZ00
         LRs0s0rkpvAqTSSUmd5gaL/roE5MUOZvBm//tdkZv+YzAk2nAlANWqoXeaTDXs8718ur
         kE8/J5FAlNecLQjgssesKlUMpThTV6CQmEbe9laxLzosvR6snePmOK6GrCTYcgppa8Fm
         gfNA==
X-Forwarded-Encrypted: i=1; AJvYcCVxOAnaQH6v9IKLrlWMBdnEF4TPoFOn9Z+7WnoGIqeiSpGRCzhzoddokZ9GnZIvFaAMb0XhQnX4vi4eDeij4uP1@lists.infradead.org
X-Gm-Message-State: AOJu0YzylolA4sQsnOu8VcbjefrVYXxM9y/zzhCPm9DqMOM41uEh85/q
	x0125/b5Mu+iinsZHN6+iwHYfz3Tm20b8eHoGCW2fQSH3f4RyQY9Rbe1Hl2Zn+LFVTzwwpEu4tp
	aG7SCzwVu5AyFhdsG6tupR5raK50KlnCybFTKb2OdTg==
X-Gm-Gg: ASbGncsYBmh8hgnrWRCNYlHJktsSisTkF3mAUY27QkKx3DDPVcEQ7lmhbM29Ea7Glo7
	5CoViV+vr4w+8O8amqbno4VbLxcREgqXcWuEhlUOWYnHoO7suoa6MjRiV5yERq4Fd0uNDtE6/UH
	YUQ60uYKGW1RxSh75mrULQc0LK5CZxE4IEFgfCRzYsykE=
X-Google-Smtp-Source: AGHT+IFcwAXQ3PbWAljxpAOaH7id08n7aXe7ujr3lhVGcrvJaHIYrxkMSHXAY37YjImxRVd5r3NbxP9AAw1idnxghok=
X-Received: by 2002:a05:6808:3c43:b0:401:16e:918e with SMTP id
 5614622812f47-40a71d7641fmr583982b6e.8.1749757683321; Thu, 12 Jun 2025
 12:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250612022747.1206053-1-hongxing.zhu@nxp.com>
 <20250612022747.1206053-2-hongxing.zhu@nxp.com> <aEr8PxcHp55Bo5Os@lizhi-Precision-Tower-5810>
In-Reply-To: <aEr8PxcHp55Bo5Os@lizhi-Precision-Tower-5810>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 12 Jun 2025 12:47:52 -0700
X-Gm-Features: AX0GCFtVrSEePbUg8i-7Hr0xxmYOgLkuZdutnpQomlDJR8IFZN655IzCDiGytFM
Message-ID: <CAJ+vNU3vyznybZ_QZBrB+nc1=2+BcC8csOtR5=6-gmgn6sb5tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_204811_167866_226FCB92 
X-CRM114-Status: GOOD (  23.17  )
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

On Thu, Jun 12, 2025 at 9:11=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Jun 12, 2025 at 10:27:46AM +0800, Richard Zhu wrote:
> > apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms=
.
> > Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> > wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
> >
> > Remove apps_reset toggle in imx_pcie_assert_core_reset() and
> > imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
> > and imx_pcie_ltssm_disable() to configure apps_reset directly.
> >
> > Fix fail to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM, whic=
h
> > reported By Tim.
> >
>
> You may rename apps_reset to ltssm_reset to avoid confuse for legancy
> platform later.

Hi Frank and Richard,

I was thinking of making the same suggestion however the apps reset is
in several places:
- imx8m*.dtsi pci node as 'reset-names' and reset index number #define
- imx8m*-reset.h bindings as reset index number/define
- pci-imx.c driver

Granted it is used by imx7d.dtsi, fsl,imx8mq-pcie, fsl,imx8mm-pcie,
fsl,imx8mp-pcie and in every one of those reference manuals it's bit6
of SRC_PCIEPH_RCR named PCIE_CTRL_APPS_EN but described as
'Pcie_ctrl_app_ltssm_enable'. Can you ask your references to get more
definition for this bit? I'm still unclear why 'de-asserting' it twice
was an issue.

Regardless, any cleanup changing the name can be a seperate patch in my opi=
nion.

Best Regards,

Tim


>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> > Reported-by: Tim Harvey <tharvey@gateworks.com>
> > Closes: https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZ=
cMHDy+poj9=3DjSy+w@mail.gmail.com/
> > Fixes: ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in imx_pcie_deasse=
rt_core_reset()")
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/contro=
ller/dwc/pci-imx6.c
> > index 5f267dd261b5..f4e0342f4d56 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -776,7 +776,6 @@ static int imx7d_pcie_core_reset(struct imx_pcie *i=
mx_pcie, bool assert)
> >  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
> >  {
> >       reset_control_assert(imx_pcie->pciephy_reset);
> > -     reset_control_assert(imx_pcie->apps_reset);
> >
> >       if (imx_pcie->drvdata->core_reset)
> >               imx_pcie->drvdata->core_reset(imx_pcie, true);
> > @@ -788,7 +787,6 @@ static void imx_pcie_assert_core_reset(struct imx_p=
cie *imx_pcie)
> >  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
> >  {
> >       reset_control_deassert(imx_pcie->pciephy_reset);
> > -     reset_control_deassert(imx_pcie->apps_reset);
> >
> >       if (imx_pcie->drvdata->core_reset)
> >               imx_pcie->drvdata->core_reset(imx_pcie, false);
> > @@ -1176,6 +1174,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *=
pp)
> >               }
> >       }
> >
> > +     /* Make sure that PCIe LTSSM is cleared */
> > +     imx_pcie_ltssm_disable(dev);
> > +
> >       ret =3D imx_pcie_deassert_core_reset(imx_pcie);
> >       if (ret < 0) {
> >               dev_err(dev, "pcie deassert core reset failed: %d\n", ret=
);
> > --
> > 2.37.1
> >

