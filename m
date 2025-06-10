Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA9BC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 00:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4p6WWlOvtLKrokUmhKFbxMIWiiDCNI86TAtn3rEDUQM=; b=SKVbGs3qh15Kbhsy69rTJALzBh
	YD2BbCLmCNU4gDBbV3HAsVJZjj4CW8cAZxBxjbd6jbI3l0eBw2c3Jxe0RLrHdQk+Ns7aPIGrbrNdU
	UzaqNJXmFgNfBY6B7YcazeRWg+vBjnxDb77EuD7WDeCN9yrZXKjoEH1tgh85WvS0tn6QNP3wMN6yK
	CBbxcF6KRcplUwvcB2H40ajyfbgP1n10TzdDU0ix0NR4848oqpv/G6Bu/FVQDOaRCLNbZsHokEAkg
	dv64MG8qP4kJrzweAOZLjh6KFhUQlaM8wDpOCK/TR0W5bubRbf9/3lI8hABIq5z6/hcnF/f2YtrXn
	JdDJ9vBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOmox-00000005V4C-1jgv;
	Tue, 10 Jun 2025 00:26:31 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOmmn-00000005UtJ-0JWb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 00:24:18 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-70f94fe1e40so59376807b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 17:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1749515055; x=1750119855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4p6WWlOvtLKrokUmhKFbxMIWiiDCNI86TAtn3rEDUQM=;
        b=BYg77Srubj+9pOesXKOaSE0yVmz/ZCQg+x3QfmY28RACP4AAstRKkk5ZAp8LVgx9H3
         i42J7xjYz5Zk2ocoOkVWKQCx4jzj7fLGz5bx+0T6egT99pUetirBCINrKxFJKNIItZka
         CeOe7gIYHfPnNNVOQzYI9iauw0mQcPX6QPTA9IldrH0YoribAll7sHMFea8ziZ8ETa6H
         33SCQHDOLEBytloXtVKza5iRX57vmD8KDxwlZub+UUcad1gkLtFt+jK/TJplV8A2SYJ5
         PwUrMYcaMrEeArdVoSeeF+Zr4eKmpd3dW38NtvWxfbaqEcQS2I84y7HxyrMULj4mrpup
         tXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749515055; x=1750119855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p6WWlOvtLKrokUmhKFbxMIWiiDCNI86TAtn3rEDUQM=;
        b=EvWvn3UBWfe7XqBAxmoQGAekA7TPfco4xmtSqtKxWrskQ7/8OKodwl8NlbB/Uduyv+
         BAbzFgXrXi3+F4NtdcGp8IaMPqR17XFqaWlb+KxH2yIAQlxCzg0C2cACy4feW0yhc8ez
         f8/Q+viGHalo3bGAbtr95qb1zimFptBjqkGoK19x3fqCtUiJdFuflE7JqLVZZt+t0zgg
         1WPHP1GU1VBdAEKcHBP8YAXc9vZGCnu6tUNiaRBiYI55Q2Xu1ofFLf97w994tbDZn92s
         z/uaqGFhLqI172IpzWRXn6KGzu1zumQL47BGLQ9SlM9MKELCbdNugLBpov58bLA1OuDg
         EB1w==
X-Forwarded-Encrypted: i=1; AJvYcCUr3pUa76/W3dsPdcxKZHBs3mIa9xCEq4saV4BVLTFrrUaWYbjvbaBy6AreaZSBsf9mavoQe72y8JfIdJJ/PY7k@lists.infradead.org
X-Gm-Message-State: AOJu0YzGs+hNMF7S5OsOt4cXWaRXn55hpFOdQ5jnMMLRndxpNsChoI5g
	m5mh+Q/v47gNnT+TTSALgAoUGRYKgmWVJw8ePrQIV5JsplKf0EmJoIYrjiSTUfogWMkMP3shnpm
	IKgfELyLAM5z7lDspUdQVJAzqzWL2dW6asoYIp/g4Ag==
X-Gm-Gg: ASbGncsrrdpG+R9fW+ZqEiFGSbJ5XbFdK3BBxaPlxfcopCQ03/V/bCh9II76JmaJPOF
	le2RPr+SuZIdJYItJTAw/TuJAd7/GayxFA1ESq0ZlmVzeDOFhoJy3u9fqiytDJPUQOxGYoI79Bp
	RkkqO8vMAGKgFPKX+/Pft24RLiwQ158dbK51HrcBjeQNaHpNOmQBkvVQ==
X-Google-Smtp-Source: AGHT+IEIwckNC6Mk3FUMcw8lzb7oJYprV7CNZkimjX4sCr2WuaRjl9EYST/x4A5RYQYDa8DuCIr4jskjKGm1oKna1b0=
X-Received: by 2002:a05:690c:7204:b0:70e:76eb:8fb0 with SMTP id
 00721157ae682-71133929d3dmr23571387b3.13.1749515055615; Mon, 09 Jun 2025
 17:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20241126075702.4099164-6-hongxing.zhu@nxp.com> <CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com>
 <AS8PR04MB8676C1206066A3215DB5F3B78C6BA@AS8PR04MB8676.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB8676C1206066A3215DB5F3B78C6BA@AS8PR04MB8676.eurprd04.prod.outlook.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 9 Jun 2025 17:24:04 -0700
X-Gm-Features: AX0GCFvJVHqxJw3QT2Hj1OmwNvuRPr_efH3vouQUS0tjvRGC0_axQFmE3cNvLZA
Message-ID: <CAJ+vNU0rO0tJyon6HGYTZHu5oii5vH-dPpnSH7RQj43+nE1KDQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] PCI: imx6: Deassert apps_reset in imx_pcie_deassert_core_reset()
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com" <kw@linux.com>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_172417_163997_514B3F35 
X-CRM114-Status: GOOD (  46.42  )
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

On Mon, Jun 9, 2025 at 1:03=E2=80=AFAM Hongxing Zhu <hongxing.zhu@nxp.com> =
wrote:
>
> > -----Original Message-----
> > From: Tim Harvey <tharvey@gateworks.com>
> > Sent: 2025=E5=B9=B46=E6=9C=887=E6=97=A5 5:04
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; manivannan.sadhasivam@linaro.org; robh@kernel.org;
> > krzk+dt@kernel.org; conor+dt@kernel.org; shawnguo@kernel.org; Frank Li
> > <frank.li@nxp.com>; s.hauer@pengutronix.de; festevam@gmail.com;
> > imx@lists.linux.dev; kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v7 05/10] PCI: imx6: Deassert apps_reset in
> > imx_pcie_deassert_core_reset()
> >
> > On Tue, Nov 26, 2024 at 12:03=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.=
com>
> > wrote:
> > >
> > > Since the apps_reset is asserted in imx_pcie_assert_core_reset(), it
> > > should be deasserted in imx_pcie_deassert_core_reset().
> > >
> > > Fixes: 9b3fe6796d7c ("PCI: imx6: Add code to support i.MX7D")
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 3538440601a7..413db182ce9f 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -776,6 +776,7 @@ static void imx_pcie_assert_core_reset(struct
> > > imx_pcie *imx_pcie)  static int imx_pcie_deassert_core_reset(struct
> > > imx_pcie *imx_pcie)  {
> > >         reset_control_deassert(imx_pcie->pciephy_reset);
> > > +       reset_control_deassert(imx_pcie->apps_reset);
> > >
> > >         if (imx_pcie->drvdata->core_reset)
> > >                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> > > --
> > > 2.37.1
> > >
> > >
> >
> > Hi Richard,
> >
> > I've found that this patch causes a regression on i.MX8MM and i.MX8MP
> > boards with hotplug capable bridges:
> > i.MX8MM+PI7C9X2G404EV (this switch does not support hotplug) - no issue=
s
> > i.MX8MM+PI7C9X2G608GP (hotplug) - fails to reliably enumerate
> > downstream devices about 80% of the time ^^^ when this occurs
> > PCI_PRIMARY_BUS (0x18) for the root complex
> > 0000:00:00.0 reads 0x00000000 instead of 0x00ff0100
> > (PCI_SECONDARY_BUS is 0 instead of 1 and PCI_SUBBORDINATE_BUS is 0
> > instead of 0xff) i.MX8MP+PI7C9X2G608GP (hotplug) - hangs at
> > imx_pcie_ltssm_enable deassert apps_reset
> >
> > In both cases here reverting ef61c7d8d032 ("PCI: imx6: Deassert apps_re=
set
> > in imx_pcie_deassert_core_reset()") resolves this.
> >
> [Richard Zhu] I'm afraid that the ltssm_en bit assert to 1b'1 in
>  imx_pcie_deassert_core_reset() is not correct in your use case.
>

Hi Richard,

Thanks for your quick response. Do you mean not correct for newer IP
core in i.MX8MM/i.MX8MP or in the case of a bridge?

> Actually, the apps_reset isn't a real reset. It's the ltssm_en bit.
> From this perspective view, It's inappropriate to toggle the ltssm_en bit=
 in
>  imx_pcie_assert/deassert_core_reset() functions.
> I consider to move the apps_reset out of _reset_ functions.
> Can you help to test the following changes in you use-case?
>
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -776,7 +776,6 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx=
_pcie, bool assert)
>  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_assert(imx_pcie->pciephy_reset);
> -       reset_control_assert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, true);
> @@ -788,7 +787,6 @@ static void imx_pcie_assert_core_reset(struct imx_pci=
e *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_deassert(imx_pcie->pciephy_reset);
> -       reset_control_deassert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> @@ -1176,6 +1174,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp=
)
>                 }
>         }
>
> +       /* Make sure that PCIe LTSSM is cleared */
> +       imx_pcie_ltssm_disable(dev);
> +
>         ret =3D imx_pcie_deassert_core_reset(imx_pcie);
>         if (ret < 0) {
>                 dev_err(dev, "pcie deassert core reset failed: %d\n", ret=
);
>

Yes this resolves the regression of failing to reliably enumerate
downstream devices. I think that should be submitted with a fixes tag.

The i.MX8MP+PI7C9X2G608GP switch hanging issue was hardware related...
i was sadly testing on an old board with a defect. I did previously
have a hang issue there discussed previously here [1] but it was
resolved with commit 9c03e30e3ade ("PCI: imx6: Skip link up workaround
for newer platforms").

How much testing is done with i.MX8M{M,P} board with a switch? I feel
like I'm the only one with these SoC's and a switch and I need to get
better at monitoring patches to the IMX6 PCI controller driver and
testing these scenarios.

Best Regards,

Tim
[1] https://www.spinics.net/lists/linux-pci/msg142764.html




> > I notice the sequence of events here is:
> > imx_pcie_assert_core_reset asserts apps_reset (disables LTSSM)
> > imx_pcie_deassert_core_reset deasserts apps_reset (enables LTSSM)
> > imx_pcie_ltssm_enable deasserts apps_reset (enables LTSSM; this is wher=
e it
> > hangs on imx8mp)
> >
> > Is there perhaps some issue with de-asserting this (enabling LTSSM) whe=
n it's
> > already in this state?
> [Richard Zhu]The apps_reset is updated by src driver by regmap_update_bit=
s().
> I can't find the exceptions to update one bit, already has the according =
value.
>
> Best Regards
> Richard Zhu
> >
> > In the case where downstream devices do not enumerate some investigatio=
n
> > points to them not being happy that the link drops so perhaps deasserti=
ng
> > apps_reset when its already asserted drops the link and restarts it?
> >
> > Best Regards,
> >
> > Tim

