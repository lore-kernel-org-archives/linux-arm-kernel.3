Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083E3C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2iRU5EWF25kDF/HWroa45GQAjAonv6s5ow4zWIf4eE=; b=PqhB1hIiJ9i+SfGO7q/1bUoYd7
	0t2S73tOVz64cLL6Xbi4DYSApIMIyo+aT3HavzZWiIc4gIxKKrhSotu8uR/T0ldoFrDOWUUrh1yLP
	9RBDTFpBxaNVX3R1iyvNZLXutDipQLSsL5FzX4Y7cev+8olaSKT0HdDlPI6fZ8wJL0f0SJwfv9qKq
	hNIERXxdqTKstU64NMz5LuPeewHC13y7ijnnKL2ZZDm2UVC/Zzj56TuXI0t+uWIMh3dvJhSzWx/Hh
	3aDjDSIvuhmHgQq5G36Y59UNDOO6Vtgch6kiY6xvTEk96iBzNwXobq1siH0ZVBZ5mYA+Ay5SpCypS
	pK5BUFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aBA-0000000DkQJ-1NHt;
	Thu, 10 Sep 2026 08:30:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aB8-0000000DkQD-3pT2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:30:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A78A600D4;
	Thu, 10 Sep 2026 08:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4901F000FF;
	Thu, 10 Sep 2026 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029041;
	bh=V2iRU5EWF25kDF/HWroa45GQAjAonv6s5ow4zWIf4eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AcDib7oF8ceHqvllUmoOGFBn4mpCBkDk+bGd16Kql/S4kSqvU85H8H2jkBe6cZhSP
	 iXIRH/PZPod1rOxOW0d91t3rpHv0eyecLrVzEir0zfnRwGR5M93h8Y1oKE5QN2wTvv
	 orQdOk7yO9z8bDwYjE0q2mb7EmsJoiHFULYvLszNlARKBxgIsK2J35fuFY93F5YEU2
	 qeitxPBraOfXSj3MlsAXVD3oMwn4iwKkE5Tn5SmoEMxPw1h3ax62dwGWDg2nA64td8
	 wo1KlftDtngDRgOm6akJqOr7ODw7L6W+lZmxx3hUXjiHP1juWtyU7lxJCZ12B+eLzT
	 f3dMbFUzTdJeQ==
Date: Thu, 10 Sep 2026 10:30:32 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Rudi Heitbaum <rudi@heitbaum.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] PCI: imx6: Use the external clock as REF_CLK when
 needed for i.MX8MQ
Message-ID: <gbvllf63gssdreregtdotpw7ihz2ea4g2uq52xlfuu2rqfwq6t@yyyta35h34ul>
References: <cover.1785669457.git.rudi@heitbaum.com>
 <563f057f26b1147a79392509b35dcb7f18113ba9.1785669457.git.rudi@heitbaum.com>
 <GV2PR04MB12019D0F84B4357DF2403B2C68CDC2@GV2PR04MB12019.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR04MB12019D0F84B4357DF2403B2C68CDC2@GV2PR04MB12019.eurprd04.prod.outlook.com>
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

On Wed, Aug 12, 2026 at 02:49:08AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Rudi Heitbaum <rudi@heitbaum.com>
> > Sent: Sunday, August 2, 2026 7:32 PM
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>; Lucas Stach
> > <l.stach@pengutronix.de>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>; Krzysztof Wilczyński
> > <kwilczynski@kernel.org>; Manivannan Sadhasivam <mani@kernel.org>; Rob
> > Herring <robh@kernel.org>; Bjorn Helgaas <bhelgaas@google.com>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Fabio Estevam <festevam@gmail.com>; linux-
> > pci@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.dev; linux-
> > arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > rudi@heitbaum.com
> > Subject: [PATCH 2/3] PCI: imx6: Use the external clock as REF_CLK when
> > needed for i.MX8MQ
> > 
> > i.MX8MQ has two PCIe REF_CLK sources: an off-chip oscillator and the
> > internal PLL. The driver unconditionally selected the oscillator, which is what
> > the
> > 
> > 	/* TODO: This code assumes external oscillator is being used */
> > 
> > comment refers to. Boards wiring an oscillator to the pad describe it as the
> > "pcie_bus" clock, but nothing in the driver looks that clock up by name, so it
> > does not select anything.
> > 
> > Reuse the generic enable_ext_refclk flag, set when an "extref" clock is
> > supplied, to select between the two, as is already done for i.MX95 in commit
> > d8574ce57d76 ("PCI: imx6: Add external reference clock input mode
> > support").
> > 
> > Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> Sorry for the late reply.
> 
> The code changes look good to me.
> 
> However, I'm concerned about backward compatibility. This patch changes the
> default REF_CLK source from external oscillator to internal PLL when no
> "extref" clock is specified, which could break existing i.MX8MQ boards.
> 

This clocks is marked as 'optional' in the binding. So the driver should
continue to work with older DTs that don't specify this clock.

If this clock is truly required, then it should not be defined as optional in
the binding and the ABI break should be justified in both binding and driver
commit messages.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

