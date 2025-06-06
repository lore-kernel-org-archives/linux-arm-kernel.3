Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CBFC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 21:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5BUjHtvSQa2fwgei7fhihebHAmQMvtk7aJVJVyEqtY=; b=kcTKp+5rbVNnuN3A/zlhimm0PC
	SAFxKtxlyY4nNh4WdKLh5ebgAeloQxF62us+WsjY5fIK+Ck/zDybHRMQt3jqIGjyiOLD/1m9uU3ya
	88K+L3RgNqB3q8HNDJ5pf+3qs1bjEYwAwWDHJobt0Gg/41bKfX1e5kRXvGPNSAvOH9uuAn4/uG4zd
	1e7bhQn/dwQTkIydbHgg5XtjVHTxeE004i+XuQxTY2V98oqdrgeOfO+aC3NGpAteoMm+qRTju385u
	+gPPWIsuj8CdTiB80o7GaO7/rn/BjtxVIIvm7gen5dHKeu0kSueXIrld4R+Evlj4XdmQ3H5HBFbjK
	Yn7WtqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNeGc-00000000zhR-0LPQ;
	Fri, 06 Jun 2025 21:06:22 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNeEU-00000000zSE-2apb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 21:04:11 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e81877c1ed6so2437403276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 14:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1749243849; x=1749848649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5BUjHtvSQa2fwgei7fhihebHAmQMvtk7aJVJVyEqtY=;
        b=dL0B7ajM89RwDKKDHHIrskM9a1eyaRGS/JDeFHVHW+2XfSoo4Gz7zx5bT+Fa5g5zo5
         bVOs7D+7D+kmIMnFdsFPp1WcAU2CPiwk5au+ydOLUS2sZtkKMHcCUNegLj3zKxQM53Jz
         EOv7TkGTgJs3UEyShsN2M75kswopfD0feadHGk690elXUOtcdA87kc/vpFomfyJYJAUY
         49P3QShvSLUC6wnJBmVRs9z2LyMGlYmJFrwZqoanYyU5YFI5jatXV4MXBEDiDUmzQhSz
         kPcrjmjSZI9ldUi2HW+c1/juUNq5bhRTVxDyc398KT9eQE/ujdsomTKyHvdfg1qx0jGt
         5igQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749243849; x=1749848649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5BUjHtvSQa2fwgei7fhihebHAmQMvtk7aJVJVyEqtY=;
        b=TTnL0LTZD4yMTpIEa+OlujV7/vnA9XBwMUecFJRI3MXkVeNK7yxtiFEjWpiaeZeYnF
         hkP2kdgxIQx1daYSnMGusrbNudtwdKQUwWblrsU9HfdqQO3d4ptyY8Jec0KkVlE2tdwL
         R+AP/S9U6hrrU4KzkCONp9X+TaBO4BGEcQv2FwO+0CdUa9o5KyDTZHzI9kRJkimqPpin
         2CjAYtZDdYGj/zY/GU2vtphCQD2/sVHyWRSRQ1PgkRDK+fLjgAQxpw1uYNuBOjcdgn3d
         EOdRk/A0h1IGenQZmBLwdvmEUz2UFpbkzUgClS2JeaBvabeJ/FqfW/af6zU89qxUaPR+
         Y4RA==
X-Forwarded-Encrypted: i=1; AJvYcCXUKj5sP24mcCtQos5ntvrlkcbVe4Zp6TFNMrK3H5qugPFIh04/JrB+4K/E1Kt0lH9dDE0SWgvLSA4OkADYjLB3@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ+vXo9LsrcmkZWQNlavGkcz+w5kj5+5ynCMGT9ow48/kipyLH
	AONSLRUmIpZGZqdPSbnqeXhIrH5Pic2ektsXtuxNUAoTzVoNYJA8tryg2KDUFClV1MKIsNcryhA
	4kKzZSX9JZqnoJHRx7PkpHe79onNkjlDEiTPXcd0B+A==
X-Gm-Gg: ASbGncuZbPzLbzLlJPnlH4D4/ywUaVA6hpZ0YVeGVwuoL/wcOH8JzhWi5owc2g+moqW
	mTky9JA/vJYCEVF0Q5gTTsuVhyuF422TZMfsdfOCZaDIimXSZOVsHt/EjqdBCIBlNj2Y1tY1F4V
	ot9+B6FfoS7boKpqLkS5ng62C9SMT87EBn
X-Google-Smtp-Source: AGHT+IHz5Vh1WV9nsY/ZJiTiB1W8ok9w5HzbkMh2HaPQU1ew8kA+sOX9MHLa7aQ/uKATj0C5Wdv6l/pIEuTUkbDn4co=
X-Received: by 2002:a05:6902:138e:b0:e81:566c:3085 with SMTP id
 3f1490d57ef6-e81c0fc6b57mr402062276.1.1749243849237; Fri, 06 Jun 2025
 14:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com> <20241126075702.4099164-6-hongxing.zhu@nxp.com>
In-Reply-To: <20241126075702.4099164-6-hongxing.zhu@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 6 Jun 2025 14:03:57 -0700
X-Gm-Features: AX0GCFsPTDn7iA-rHigWV1JSUeeni9XBl8RHjYyReEuG_dN3ujPTRzbBW4231V8
Message-ID: <CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] PCI: imx6: Deassert apps_reset in imx_pcie_deassert_core_reset()
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org, 
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_140410_658429_94B89FB1 
X-CRM114-Status: GOOD (  19.90  )
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

On Tue, Nov 26, 2024 at 12:03=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com>=
 wrote:
>
> Since the apps_reset is asserted in imx_pcie_assert_core_reset(), it shou=
ld
> be deasserted in imx_pcie_deassert_core_reset().
>
> Fixes: 9b3fe6796d7c ("PCI: imx6: Add code to support i.MX7D")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index 3538440601a7..413db182ce9f 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -776,6 +776,7 @@ static void imx_pcie_assert_core_reset(struct imx_pci=
e *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_deassert(imx_pcie->pciephy_reset);
> +       reset_control_deassert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> --
> 2.37.1
>
>

Hi Richard,

I've found that this patch causes a regression on i.MX8MM and i.MX8MP
boards with hotplug capable bridges:
i.MX8MM+PI7C9X2G404EV (this switch does not support hotplug) - no issues
i.MX8MM+PI7C9X2G608GP (hotplug) - fails to reliably enumerate
downstream devices about 80% of the time
^^^ when this occurs PCI_PRIMARY_BUS (0x18) for the root complex
0000:00:00.0 reads 0x00000000 instead of 0x00ff0100 (PCI_SECONDARY_BUS
is 0 instead of 1 and PCI_SUBBORDINATE_BUS is 0 instead of 0xff)
i.MX8MP+PI7C9X2G608GP (hotplug) - hangs at imx_pcie_ltssm_enable
deassert apps_reset

In both cases here reverting ef61c7d8d032 ("PCI: imx6: Deassert
apps_reset in imx_pcie_deassert_core_reset()") resolves this.

I notice the sequence of events here is:
imx_pcie_assert_core_reset asserts apps_reset (disables LTSSM)
imx_pcie_deassert_core_reset deasserts apps_reset (enables LTSSM)
imx_pcie_ltssm_enable deasserts apps_reset (enables LTSSM; this is
where it hangs on imx8mp)

Is there perhaps some issue with de-asserting this (enabling LTSSM)
when it's already in this state?

In the case where downstream devices do not enumerate some
investigation points to them not being happy that the link drops so
perhaps deasserting apps_reset when its already asserted drops the
link and restarts it?

Best Regards,

Tim

