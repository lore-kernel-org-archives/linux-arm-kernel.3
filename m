Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57867D26D67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=w4pw3OHvKFAwk77qe25xfoYMzyeURy+ya3bh6kxYAMY=; b=OT4hp+qY2+k3ellEWb/SvAjHAb
	ORrB88HbcTCrGuatTqFGKc649e4kybiOmiMmzS+dF/8BgOVGAhiZY+CyU20OCu4Ezi+aSqETzbJd4
	0MEfDMve1Dg3lCvFxkrL3i3pGvD68g03lb/JFK+T1YEGnKjyV80aRk+wxvX7sLbBGi56CnpYOZPjQ
	BxEE/uW/DA57RdSSJ+EwOCS0hvTVQS7xxg5iKGn2SMvc785HG1TVUZC9NOmMUOj2JnQ92w/tTCzMO
	djSysXC1TgFZ7EiuNvTlZpjq7HIxccDKKHdIaceIay7R/5vULAU6bbX5z39rG+h+Yzvfly/Duwci3
	OIYDPD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEP4-00000002U02-38L1;
	Fri, 09 Jan 2026 15:27:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEP3-00000002Tzv-0aYO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:27:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B4EC60160;
	Fri,  9 Jan 2026 15:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FB2C4CEF1;
	Fri,  9 Jan 2026 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767972472;
	bh=3jT1bPp2jAjL1e9B+m/2zxJkpLEgA9Jqq3llmKYGRE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=A7q+/jLq9PLESbVwGX9xCVfHvYVeMw5bbr2mb8E0gN6K4yZENLpDPaGJoW41tEfX7
	 Nc0+n7oWvo3F0zui9FpB5XnLLG7SsqVFkU3xgcAwRtt8zblCstEnYQfV0108zJpLlS
	 LKKdEIoR6C/NdoLF74N+WFdJHKXwCvPP4cxjdPfGRqzUtd9mdM2Nu02u4E1w/+ynsS
	 uHEydFVQ0wEopcbkb4JtyZNAnlspdwRKpdWYwssTPg1OXdmjN1O/1FXENaJ1YRUMsj
	 wjufefM4MNQIpWBt4ZB2sbXIirmpCfBO5S4HKrweGLM3TBliBUysVTqTwcrrLM+/J6
	 6Bl7tdKkIG0Nw==
Date: Fri, 9 Jan 2026 09:27:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 08/11] PCI: dwc: Invoke post_init in
 dw_pcie_resume_noirq()
Message-ID: <20260109152750.GA544801@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB88334B71E559AC00907BDE028C82A@AS8PR04MB8833.eurprd04.prod.outlook.com>
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

On Fri, Jan 09, 2026 at 02:10:07AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 2026年1月9日 5:50
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
> > robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6 08/11] PCI: dwc: Invoke post_init in
> > dw_pcie_resume_noirq()
> > 
> > On Wed, Oct 15, 2025 at 11:04:25AM +0800, Richard Zhu wrote:
> > > If the ops has post_init callback, invoke it in dw_pcie_resume_noirq().
> > 
> > I'm trying to write the merge commit log for this branch, and I don't quite
> > understand this.
> > 
> > The effect is to apply the GEN3_ZRXDC_NONCOMPL workaround for the
> > ERR051586 erratum, and Mani added the hint that this enables REFCLK
> > during resume.  But it seems weird that we apply a REFCLK workaround
> > after the link is already up.
> > 
> > During probe, .post_init() is run after pci_host_probe(), so we apply the
> > workaround after enumerating all the devices, which means REFCLK must
> > already be valid and the link is already up.
> > 
> > Is "enabling REFCLK" actually what imx_pcie_host_post_init() does?
>
> The codes are used to clean up the CLKREQ# override active low
> configurations after link is up and the CLKREQ# is drove to low by
> remote endpoint device at this point(support-clkreq is TRUE).
>
> It paves the way to support the CLKREQ# toggling mandatory required
> by L1SS.
>
> > Could the workaround be done in imx_pcie_host_init() before the
> > link is brought up?  If it could, it looks like we wouldn't need
> > imx_pcie_host_post_init() at all.
>
> Two actions are done in imx_pcie_post_init().
>
> One is to apply the workaround of ERR051586 by commit 744a1c20ce93
> ("PCI: imx6: Add workaround for errata ERR051586"). It should be
> applied after link is up.
>
> The other one is to clean up the CLKREQ# override active low
> configurations previous set in imx_pcie_host_init().

Right.  I'm not asking about the CLKREQ# part.  I'm asking about the
IMX_PCIE_FLAG_8GT_ECN_ERR051586 part.

The current commit log for this patch is this:

  Some SoCs like i.MX95 require enabling REFCLK after resuming from suspend
  in their post_init callback. So invoke the callback at the end of
  dw_pcie_resume_noirq() if available.

When .post_init() is called, the link is already up and PCIe devices
have already been enumerated.  I think REFCLK is required for the link
to come up, so it doesn't sound right to me that .post_init() would be
*enabling* REFCLK.

> > For now, I put this in the merge commit log:
> > 
> >   - Apply i.MX95 ERR051586 erratum workaround for REFCLK issue during
> >     resume (Richard Zhu)

