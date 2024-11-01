Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994A5E6F084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 19:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xhsok5lUSaLeX0jB80qqmTm3/8Vx9ryb4EE5XRrW0T8=; b=XuHmunfyg7WzZoTBkYw3/0QUOb
	P088GUvE9p57xHI50RMj50xSr3FtsYNJazJijv8aAcvjGHrPVFyq1Jc20tIFkEcueUEeDt/K4eISp
	vBUqnuy49x5y3d8D52rfZhtSNRwXXBwdUt6oNy738b3CR0P3jlX0d83MDz5TOozPBR/jqN8XCBkcb
	dRkIVsB/4Z+Sd420C4IjjsjqoDQ1dxGeURJfylBSWgsVqWfThCAx6QpY5ubm9EVtNBcW7V7hReML9
	RXxpAnNsjcjFaqikoSvOqCTuhRw15xowU6e47AaMuD+QS8Vl5WNelaRxi/m7vFBOrq6KQN5PFuMBn
	RUYajGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xjB-00000008C1T-0W1Y;
	Fri, 01 Nov 2024 19:54:37 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xhU-00000008Bog-1XsY;
	Fri, 01 Nov 2024 19:52:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ee6edc47abso187059a12.3;
        Fri, 01 Nov 2024 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730490771; x=1731095571; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xhsok5lUSaLeX0jB80qqmTm3/8Vx9ryb4EE5XRrW0T8=;
        b=ZUnu8+mRg5+JZafsm9Ig91oYrBC625nxVD9XpWw4tZolmvyAn8D5vJvNGHr7UwpY+K
         AJIreIIqPHdfDYQOxVfEFtjIt8+VJJLWvezi6gZDqipoSQe6JTaIUSrqagSFYhvVCjVR
         Zw4/IjhHZTnu5DSbRONXaT2CJmrxU6/LeWZkLBN9T0rXTGb8tM7OG1oybeJ38osk8hu4
         25F0cZ4fNNAkXiWPExegtNhVstrc/znYHTqnqXxj8Rj82uJYABOPp06YmHsyBCAyz85+
         qBkgt15i+n+rcxTVLtgo4Wz0DnbPqJZqNRWRs3Z0wJc9E45svP4LitvW/px85kUdaYap
         Lc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490771; x=1731095571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xhsok5lUSaLeX0jB80qqmTm3/8Vx9ryb4EE5XRrW0T8=;
        b=vLrbaNjIdAAoy+0LEmupgHy3uw2MyZzbBfG42r/i+YYXaduHMBNhk4a3eOekoLynvA
         bp2L0MFJs0zSdV3lFYtQGssrASRj5SND4p+k7V1VYtyPVea3zDbG9vFBBHki3D72cRJC
         AXCMyJZpfH14Zx3ltIylapG1+bQ5Px5TIyabQyIFv3y6oIG3suuWhGWcVyVlWpKiKxp8
         XAa8me8Oa4S7U9Ji6ATQU41/9Czn24C8lSbChk/aK/PwekHcmWn9B3H8mSlCn1id/xVm
         5C6JKQxGVfKTLuptyihBU73oPkIYkFWE3c4mezI77EVS2ZGmU3IUzXEAVLWLWCNjO4xx
         DPGA==
X-Forwarded-Encrypted: i=1; AJvYcCUm5Cr7nQb6oNaRid80kFnW2wYiUshsuVSuUxivGRYQa2rmcps7oC3xUtAQupaSkNnlVVeAvivysYCzacQDrnmm@lists.infradead.org, AJvYcCXT1jP/T9F4BxXDa8Fdr7Ecx+WaydQDlCQCdtKxDz2S4mHwuYRj7qrn8kwop8BbRZbQeumhbug9jAN/@lists.infradead.org
X-Gm-Message-State: AOJu0YzfACQOqj0gn+v6VnUfA2SnQyH+9DCH7WXp0glylR4Wu99RXDW9
	x3JtfGmZWOI76x40ZKWZhyfR2EhRwj0GFJNJMCKLshlU4dCjh7Y+miVyZxGgyayxUe3T0H1S3pT
	sYctYam0NXqTN5SL3yz5g1RxloIc=
X-Google-Smtp-Source: AGHT+IHZKMW6nZzgZWjfjRWzIvWK1iTYBaT4YLGi4D6U/W2A5SxqJ4IVJebquI4t7FLTpZHyma5G5RNi+tkyXX6nGq4=
X-Received: by 2002:a17:90b:1c85:b0:2e2:e597:6cd3 with SMTP id
 98e67ed59e1d1-2e94c2d6a20mr6009738a91.17.1730490770981; Fri, 01 Nov 2024
 12:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241021155241.943665-1-Frank.Li@nxp.com> <DU2PR04MB86770FFB0CAEEBE95B91F5FC8C4C2@DU2PR04MB8677.eurprd04.prod.outlook.com>
In-Reply-To: <DU2PR04MB86770FFB0CAEEBE95B91F5FC8C4C2@DU2PR04MB8677.eurprd04.prod.outlook.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 1 Nov 2024 14:52:39 -0500
Message-ID: <CAHCN7xJya+XjAP+kn5MePdrqNxaLnkYag23UaNatoh09ize+AA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] phy: freescale: imx8m-pcie: Do CMN_RST just before
 PHY PLL lock check
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "kishon@kernel.org" <kishon@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_125252_439094_2B17F408 
X-CRM114-Status: GOOD (  32.55  )
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

On Mon, Oct 21, 2024 at 11:06=E2=80=AFPM Hongxing Zhu <hongxing.zhu@nxp.com=
> wrote:
>
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: 2024=E5=B9=B410=E6=9C=8821=E6=97=A5 23:53
> > To: vkoul@kernel.org
> > Cc: Frank Li <frank.li@nxp.com>; festevam@gmail.com; Hongxing Zhu
> > <hongxing.zhu@nxp.com>; imx@lists.linux.dev; kernel@pengutronix.de;
> > kishon@kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org; Marcel Zis=
wiler
> > <marcel.ziswiler@toradex.com>; s.hauer@pengutronix.de;
> > shawnguo@kernel.org; stable@vger.kernel.org
> > Subject: [PATCH v2 1/1] phy: freescale: imx8m-pcie: Do CMN_RST just bef=
ore
> > PHY PLL lock check
> >
> > From: Richard Zhu <hongxing.zhu@nxp.com>
> >
> > When enable initcall_debug together with higher debug level below.
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D9
> > CONFIG_CONSOLE_LOGLEVEL_QUIET=3D9
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D7
> >
> > The initialization of i.MX8MP PCIe PHY might be timeout failed randomly=
.
> > To fix this issue, adjust the sequence of the resets refer to the power=
 up
> > sequence listed below.
> >
> > i.MX8MP PCIe PHY power up sequence:
> >                           /--------------------------------------------=
-
> > 1.8v supply     ---------/
> >                     /--------------------------------------------------=
-
> > 0.8v supply     ---/
> >
> >                 ---\ /-------------------------------------------------=
-
> >                     X        REFCLK Valid
> > Reference Clock ---/ \-------------------------------------------------=
-
> >                              ------------------------------------------=
-
> >                              |
> > i_init_restn    --------------
> >                                     -----------------------------------=
-
> >                                     |
> > i_cmn_rstn      ---------------------
> >                                          ------------------------------=
-
> >                                          | o_pll_lock_done
> > --------------------------
> >
> > Logs:
> > imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:
> > imx6q-pcie 33800000.pcie:       IO 0x001ff80000..0x001ff8ffff ->
> > 0x0000000000
> > imx6q-pcie 33800000.pcie:      MEM 0x0018000000..0x001fefffff ->
> > 0x0018000000
> > probe of clk_imx8mp_audiomix.reset.0 returned 0 after 1052 usecs probe =
of
> > 30e20000.clock-controller returned 0 after 32971 usecs phy
> > phy-32f00000.pcie-phy.4: phy poweron failed --> -110 probe of
> > 30e10000.dma-controller returned 0 after 10235 usecs imx6q-pcie
> > 33800000.pcie: waiting for PHY ready timeout!
> > dwhdmi-imx 32fd8000.hdmi: Detected HDMI TX controller v2.13a with HDCP
> > (samsung_dw_hdmi_phy2) imx6q-pcie 33800000.pcie: probe with driver
> > imx6q-pcie failed with error -110
> >
> > Fixes: dce9edff16ee ("phy: freescale: imx8m-pcie: Add i.MX8MP PCIe PHY
> > support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > v2 changes:
> > - Rebase to latest fixes branch of linux-phy git repo.
> > - Richard's environment have problem and can't sent out patch. So I hel=
p post
> > this fix patch.

Even with this patch, I am still seeing an occasional timeout on 8MP.
I looked at some logs on a similarly functioning 8MM and I can't get
this error to appear on Mini that I see on Plus.

The TRM doesn't document the timing of the startup sequence, like this
e-mail patch did nor does it state how long a reasonable timeout
should take. So, I started looking through the code and I noticed that
the Mini asserts the reset at the beginning, then makes all the
changes, and de-asserts the resets toward the end.  Is there any
reason we should not assert one or both of the resets on 8MP before
setting up the reset of the registers like the way Mini does it?

adam

> > ---
> Hi Frank:
> Thanks a lot for your kindly help.
> Since my server is down, I can't send out this v2 in the past days.
>
> Hi Vinod:
> Sorry for the late reply, and bring you inconvenience.
>
> Best Regards
> Richard Zhu
>
> >  drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > index 11fcb1867118c..e98361dcdeadf 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> > @@ -141,11 +141,6 @@ static int imx8_pcie_phy_power_on(struct phy
> > *phy)
> >                          IMX8MM_GPR_PCIE_REF_CLK_PLL);
> >       usleep_range(100, 200);
> >
> > -     /* Do the PHY common block reset */
> > -     regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
> > -                        IMX8MM_GPR_PCIE_CMN_RST,
> > -                        IMX8MM_GPR_PCIE_CMN_RST);
> > -
> >       switch (imx8_phy->drvdata->variant) {
> >       case IMX8MP:
> >               reset_control_deassert(imx8_phy->perst);
> > @@ -156,6 +151,11 @@ static int imx8_pcie_phy_power_on(struct phy
> > *phy)
> >               break;
> >       }
> >
> > +     /* Do the PHY common block reset */
> > +     regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
> > +                        IMX8MM_GPR_PCIE_CMN_RST,
> > +                        IMX8MM_GPR_PCIE_CMN_RST);
> > +
> >       /* Polling to check the phy is ready or not. */
> >       ret =3D readl_poll_timeout(imx8_phy->base +
> > IMX8MM_PCIE_PHY_CMN_REG075,
> >                                val, val =3D=3D ANA_PLL_DONE, 10, 20000)=
;
> > --
> > 2.34.1
>
> --
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

