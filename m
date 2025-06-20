Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EDDC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk1h/OSRQW76dr7YBIYqdBe7lZw8tZ9KpxMBcLXXza8=; b=XWiieQQEZa4OPre7vUEFlevjYO
	a3HNQrsbQ+hcT43+Fwb2I/UtF/yOx3EoADpItWBg71xEqVndft+GyI3KB86r7XaX9/ereG2Qy1X+m
	YYrEshSMEiDuL64gw+pu85eef3EdH+PQjifHwXdU5VFtUIM8VfwmNH6Vy9O/JedD4sBS1uiCwLixs
	ZaxpPhryJF3xV/snGiNdlqS3gN6hCgO0Im/tpL9QQVi52nY8Ju/lyWW7n9xQbo+TKhCPF/I23fJkA
	9LXauQKGSej+RLnI9jxmO8+vsXGggIQd8lfSp1Y7dPpdNsMpb+fZ3jMt405kCj0SNL54hpRw1mN1L
	kmTLgswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSf2H-0000000GBQF-19MS;
	Fri, 20 Jun 2025 16:56:17 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeMB-0000000G6Xq-1lmz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 16:12:48 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-60b8a9be972so506192eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1750435966; x=1751040766; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk1h/OSRQW76dr7YBIYqdBe7lZw8tZ9KpxMBcLXXza8=;
        b=ZtNf9n4yN+EgDPp7uw7pgc81c6PkROSkmzC6sZR9aefdHq06KVL7Ey24jQy8anVGER
         J9Hrmy1eVlXmsjSn5DYdA+mt3hKv29/R7fDV3A2Fy7UoCyv28fpnnzOxsR0hgutCzI9+
         oNOi8g4b9UH/GXcvrQQjkgpoEC12BBOwu+cQPhxCwERn8VZ8CzkCZ3FQeYPwS/JN0Hk7
         UUb3Kn8VNb1aHEcD5Y/RrS+Q2DZesQ4XzPbmmokd7+qIbj+R4ew75HZtR58kdwZPOtw8
         Cd19JJ1IY02dU/dq576SVL/NGPJL5ATCLOtIJ+s4kvZ/Q8sCPP60mbulmjXNytQdbRce
         op1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435966; x=1751040766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uk1h/OSRQW76dr7YBIYqdBe7lZw8tZ9KpxMBcLXXza8=;
        b=KgaoStLM7zxfwi4TTPJJumvH+EztbdMN89sopK0mvHhhHQsNijoNweNhyiuRTe5Iw6
         RsN2nbEnKJ/X0v60N0I1w7NFQ+uvx0z/aAN+ExPCG/4uLCHWERcSbORDpDOC7joBZEt0
         m5oR/k0y+YUQX1W+OSKCTzRbpaJA0fPckaFHOvAfhV9oZ+fT/Lq+hr+9ZeZKWEJ+yknK
         0lrn7b0AKZUlEuEeOA7BzVUixym56HNxwOWAPR9AtR7fooZNbd/xAhk5XtNqVACMBu/E
         HP175JmSjR8062KiBl6pXpNVcf98cOJbwmE/+rFDrpskcvAuMIMLXfM4EBfH+nA/rqDZ
         0OKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxDwD3ieCQsd4zlPkDbyIPkITKKSDhJsrASAF5bZ7Ib3EWj1821pAS1IIpGW2+QvqCBzGALG/6GIn5swVoxR0L@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ4J1wPmn9nEUbdusVcZlFHnDA5XEsmPVUBUsosNXtbLUrjT4K
	X+3ydi/X9IUbve/wo7xYUybm4/J2WOmmM9paoC02IDlXwz4RZr4EuPSBJLNkoBePnGaTz8Xhbvb
	Aef73iWFff+1pkpKDUiH/Nt/krjUWiFPUePKXV+ShPQ==
X-Gm-Gg: ASbGncuzrs8nWktTGGkKmpoNNKWWQdKoLTvtK4pyQRdFlRamIHCth7r9utCja3Bmu5D
	ZjL8c8zfqKd1Xqt3t9mgMrgZMi9Zgxbc9q7vGlSQWFp6lSUK4z9tUsuSzaPMx/atDBEq4UryzQp
	bOcG7n4MWLf7nCG44T0BS4PaUR6aoyESYzuFj+4qVrCLo=
X-Google-Smtp-Source: AGHT+IEWHRk01AMNXUO3Iti/LVUHyPY06MPi2HY582F4LaypQ5ZkZqqgLLKeo/FHsS0LAg4XUMcQcmQIpTlGgPfCCxs=
X-Received: by 2002:a05:6820:1e87:b0:610:fc12:cbb4 with SMTP id
 006d021491bc7-6115b8a077cmr2461053eaf.1.1750435966109; Fri, 20 Jun 2025
 09:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250616085742.2684742-1-hongxing.zhu@nxp.com> <20250616085742.2684742-2-hongxing.zhu@nxp.com>
In-Reply-To: <20250616085742.2684742-2-hongxing.zhu@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 20 Jun 2025 09:12:35 -0700
X-Gm-Features: AX0GCFupqyePYKY1h7Imt92So6Th1StimJuRSWH0VvVxy1uS8kPjLbLXM76L3Es
Message-ID: <CAJ+vNU15XpyLuxO4EowyqO9P+ZUqNApoH2Wu261iu-5b2GrkGw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_091247_546628_DFA6D8E9 
X-CRM114-Status: GOOD (  17.90  )
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

On Mon, Jun 16, 2025 at 1:59=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com> =
wrote:
>
> apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
> Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
>
> Remove apps_reset toggle in imx_pcie_assert_core_reset() and
> imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
> and imx_pcie_ltssm_disable() to configure apps_reset directly.
>
> Fix fail to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM, which
> reported By Tim.
>
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Closes: https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcM=
HDy+poj9=3DjSy+w@mail.gmail.com/
> Fixes: ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in imx_pcie_deassert=
_core_reset()")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index 9754cc6e09b9..f5f2ac638f4b 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -860,7 +860,6 @@ static int imx95_pcie_core_reset(struct imx_pcie *imx=
_pcie, bool assert)
>  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_assert(imx_pcie->pciephy_reset);
> -       reset_control_assert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, true);
> @@ -872,7 +871,6 @@ static void imx_pcie_assert_core_reset(struct imx_pci=
e *imx_pcie)
>  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
>  {
>         reset_control_deassert(imx_pcie->pciephy_reset);
> -       reset_control_deassert(imx_pcie->apps_reset);
>
>         if (imx_pcie->drvdata->core_reset)
>                 imx_pcie->drvdata->core_reset(imx_pcie, false);
> @@ -1247,6 +1245,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp=
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
> --
> 2.37.1
>

Tested-by: Tim Harvey <tharvey@gateworks.com> # imx8mp-venice-gw74xx
(i.MX8MP + hotplug capable switch)

Best Regards,

Tim

