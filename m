Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D69C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEwzz1S9x8v60I+u/kRQNjN9Y/D1aWypFVpNTX7khvg=; b=OZWDQrFeyXljsMT71dJLXpx736
	rN6PnRj7SJqxsr6qi4Z+7qWqpDYn32SxWxmu1U0r2rf+2WisVnEj9k9WlgAy0e2O8sCwypANbrNE1
	rPoyuX51ICXBayzergfwZgsa37rVV34xf+2S0UY+4+nxrpcA/b325GPOGh+q7TJqC07CkY6+Wm13h
	pf2yhtaDewqjDEv4QTilK6k0FbCkpFZ02MWt5RKLMO8/QbPFTjfurRvCIDrzajTY/Fz39lKCiQc8C
	gKDPO2kjeGxZ/0GQVySQ0T3l9CBvLAbq4a6sKf3yXIAvrE6pwL8tXaTNxjk0w8QP/dzAG9lkHA7Rs
	Ps2DAqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35K-00000004dFj-3GKE;
	Tue, 08 Jul 2025 07:49:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ330-00000004cvh-35Yw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 07:47:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2506561470;
	Tue,  8 Jul 2025 07:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CE8C4CEED;
	Tue,  8 Jul 2025 07:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751960845;
	bh=jVUpAdZABGByW3BC0gUxQ8Gy88WyihYZ+pUcIVfwLQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVkRS8VBYxowV5hhTK7yaNDVcqGnPinoVsHNURk3RmxUwNbHyp5BrW+BP9sYAuRfM
	 U87i2zE9OjaSrS6jIE0MwdRGAwx3cwEJsL4DPsbb9ktRm96Hliys51kEQO1ECd6CHk
	 mn9FMbDOM7XDGntSbRc89ePBIznvU8T8Aln7rehpe5HPbgqM+06k13Ex3T/a1CxNj5
	 wBPm5PnQNSA0CL0wtzF8uMW4xFwpLMCBlIfGhW5mF1h/oIWBBcj1ALT6H0Qz07JnLN
	 ikBoMMUfSyYXHSPM7gUXrqirNShQdBGp7a2vDwvdwd7WtV4bYGZqLRUpqw68Shj0qX
	 xHCfg52YvR/KQ==
Date: Tue, 8 Jul 2025 13:17:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "tharvey@gateworks.com" <tharvey@gateworks.com>, 
	Frank Li <frank.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in
 _core_reset functions
Message-ID: <lavz3wv5vysmb7gle5s57tc2tj4a6euh2e4fdwdrezvsejxiip@2fa4sblpau6a>
References: <20250616085742.2684742-1-hongxing.zhu@nxp.com>
 <20250616085742.2684742-2-hongxing.zhu@nxp.com>
 <kjsaipr2xq777dmiv2ac7qzrxw47nevc75j7ryma32vsnyr2le@mrwurn6rgnac>
 <CAJ+vNU3mKiEE86SYFS0aEabkqRKADFDJN0giX73E0cA=GOyhjA@mail.gmail.com>
 <AS8PR04MB867638BDCA5F47D478F597808C4EA@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB867638BDCA5F47D478F597808C4EA@AS8PR04MB8676.eurprd04.prod.outlook.com>
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

On Tue, Jul 08, 2025 at 02:37:00AM GMT, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Tim Harvey <tharvey@gateworks.com>
> > Sent: 2025年6月24日 1:33
> > To: Manivannan Sadhasivam <mani@kernel.org>
> > Cc: Hongxing Zhu <hongxing.zhu@nxp.com>; Frank Li <frank.li@nxp.com>;
> > l.stach@pengutronix.de; lpieralisi@kernel.org; kwilczynski@kernel.org;
> > robh@kernel.org; bhelgaas@google.com; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 1/2] PCI: imx6: Remove apps_reset toggle in
> > _core_reset functions
> > 
> > On Mon, Jun 23, 2025 at 4:42 AM Manivannan Sadhasivam <mani@kernel.org>
> > wrote:
> > >
> > > On Mon, Jun 16, 2025 at 04:57:41PM +0800, Richard Zhu wrote:
> > > > apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP
> > platforms.
> > > > Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had
> > > > been wrappered in imx_pcie_ltssm_enable() and
> > > > imx_pcie_ltssm_disable();
> > > >
> > >
> > > What about other i.MX chipsets like 6Q and its cousins? Wouldn't this
> > > change affect them since they treat 'apps_reset' differently?
> > >
> > > - Mani
> 
> Hi Mani:
> Sorry to reply late.
> Only i.MX7D, i.MX8MQ, i.MX8MM, and i.MX8MP have the apps_reset. No problems
> are found with this change in my local tests on these four platforms.
> With this change, the assertion/deassertion of ltssm_en bit are unified into
>  imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable() functions, aligned with
> other i.MX platforms.
> 

Okay, thanks for clarifying. Please include this information in the commit
message as well and also CC stable list for backporting since it fixes a bug.

- Mani

> Best Regards
> Richard Zhu
> > 
> > Hi Main,
> > 
> > This patch effectively brings back the behavior prior to commit
> > ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in
> > imx_pcie_deassert_core_reset()") which caused the original regressions.
> > 
> > To ease your concerns I've tested this patch on top of v6.16-rc3 with the
> > following IMX6 boards I have here with and without a PCI device
> > attached:
> > imx6q-gw51xx - no switch
> > imx6q-gw54xx - switch
> > 
> > I only have imx6qdl/imx8mm/imx8mp boards to test with.
> > 
> > From what I can tell it doesn't look like the original patch that added the
> > 'symmetric' apps_reset de-assert was necessarily well tested. It started out
> > being added because as far as I can tell it 'looked' like the right thing to do [1].
> > You requested changes to the commit log for wording [2],[3] but I'm unclear
> > that anyone tested this.
> >
> Hi Tim: 
> Thanks for your explains and tests.
> 
> Best Regards
> Richard Zhu
> 
> > Best Regards,
> > 
> > Tim
> > [1]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatch
> > work.kernel.org%2Fproject%2Flinux-pci%2Fpatch%2F1727148464-14341-6-gi
> > t-send-email-hongxing.zhu%40nxp.com%2F&data=05%7C02%7Chongxing.zhu
> > %40nxp.com%7Cdac60212c1c94cb24d7508ddb27c0f92%7C686ea1d3bc2b4c
> > 6fa92cd99c5c301635%7C0%7C0%7C638862968081967795%7CUnknown%7
> > CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> > XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=8I
> > 7qGI92BfsbAERknsVjZO6cI527Enxgiiw%2FVatI7h4%3D&reserved=0
> > [2]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatch
> > work.kernel.org%2Fproject%2Flinux-pci%2Fpatch%2F1728981213-8771-6-git
> > -send-email-hongxing.zhu%40nxp.com%2F&data=05%7C02%7Chongxing.zhu
> > %40nxp.com%7Cdac60212c1c94cb24d7508ddb27c0f92%7C686ea1d3bc2b4c
> > 6fa92cd99c5c301635%7C0%7C0%7C638862968081993466%7CUnknown%7
> > CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> > XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=lh
> > ER8F9ApfpgQcVCyMOBYho%2BXvlp79re4jX5C5gj1XY%3D&reserved=0
> > [3]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatch
> > work.kernel.org%2Fproject%2Flinux-pci%2Fpatch%2F20241101070610.1267
> > 391-6-hongxing.zhu%40nxp.com%2F&data=05%7C02%7Chongxing.zhu%40nx
> > p.com%7Cdac60212c1c94cb24d7508ddb27c0f92%7C686ea1d3bc2b4c6fa92c
> > d99c5c301635%7C0%7C0%7C638862968082007982%7CUnknown%7CTWFp
> > bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> > MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=kp4EqnV
> > lfUsVq4k9UV33LSpiwn%2F2OJlPzu2PApAttNs%3D&reserved=0

-- 
மணிவண்ணன் சதாசிவம்

