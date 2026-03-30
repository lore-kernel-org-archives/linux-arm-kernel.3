Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56164FB3CF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLiOWnYaPYbiC5qhToElubMd1pxnYhRSz+sJXtjkf9k=; b=bZ/74BSh8tR5IgJnr1EizW7kU/
	JMgAqDv4wtadaMK4qAzwImiAkwUYBgj9YbpbnAU9A+SsH3TglSP5DqpppQi1oPZVBURsKzdpRnaA/
	DL0oWq3ZbQ7qWjOaN0MCYG9UQEcAXYpVm5JBNsiSKOIPGSrLLGZKz1y/8JEplSKk60Z4lL0xWBqey
	PUPP8uJgoWP60B97aNbq1f8yV+4uTwIU/bPJt+G2tZh4uwcbob91lKfp82KTQazx47rMUf/XCPZ16
	E08kbWaXHs3wvMQvEi0rJe000Mi+Vtn+PPpngt5KK0PJISp684/fp0c++fDaXoj9x2D4EXYcDH0W6
	UmqEckNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79i2-0000000B2nx-2VO7;
	Mon, 30 Mar 2026 10:19:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79i1-0000000B2np-1j7j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 10:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 622B560054;
	Mon, 30 Mar 2026 10:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7C5C4CEF7;
	Mon, 30 Mar 2026 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774865940;
	bh=zkPIFYlcvlNBwRpjkVxQHKinU444u5TIQ3o5lO3cjw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUFoVZC8BT1abPQSVnwCo6KS/5EN1PEfjba+c1Plp7X8QHOibbkg4xN9DTDdknSPj
	 TPpYZ+91NJut/Gv5uOiDwUSvKqC27NJdvQhVewydS3Y2FM9s8xlLFVd5UFAjJZdL+6
	 BYgrQpculCEb85wKPXecIjQvOieHuFBruJz8jyRbW+sUrlbMqwhAwXqKvn3RlXT62S
	 5l78j+fxjTqNRDLlFsa5GzNaCobxmacRLJ8HuScxl1OsVBE2G0cw7wYt3hBr8CMoA6
	 TYqUq8KJagKnoL/Q5W05nSgNtBj7ogoC1TJ6AdVvJ/HYdaUsLHUcYg+8jrNpsthpEz
	 /Gm+wjW1iKHCw==
Date: Mon, 30 Mar 2026 15:48:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH v2] PCI: imx6: Don't remove MSI capability For
 i.MX7D/i.MX8M
Message-ID: <5nom7wnhrr57jvb6komumg3fjkbavsq5ecz2pd43rc5tsmnqev@ag6ld453s2lu>
References: <20260319091823.446030-1-hongxing.zhu@nxp.com>
 <kqv3x4qocp7rkas5oedlpzd43h3ez7dg26hqnfgubbjdhhxlwe@rfnsicbv7qba>
 <AS8PR04MB8833AE3B8D106CE446EF89E58C52A@AS8PR04MB8833.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8833AE3B8D106CE446EF89E58C52A@AS8PR04MB8833.eurprd04.prod.outlook.com>
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

On Mon, Mar 30, 2026 at 09:02:57AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > Sent: 2026年3月30日 15:23
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > kwilczynski@kernel.org; robh@kernel.org; bhelgaas@google.com;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org; stable@vger.kernel.org;
> > Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Subject: Re: [PATCH v2] PCI: imx6: Don't remove MSI capability For
> > i.MX7D/i.MX8M
> > 
> > + Qiang
> > 
> > On Thu, Mar 19, 2026 at 05:18:23PM +0800, Richard Zhu wrote:
> > > The MSI trigger mechanism for endpoint devices connected to i.MX7D,
> > > i.MX8MM, and i.MX8MQ PCIe root complex ports depends on the MSI
> > > capability register settings in the root complex. Removing the MSI
> > > capability breaks MSI functionality for these endpoints.
> > >
> > 
> > What is the relation between Root Port MSI and endpoint MSI? Endpoint MSIs
> > should be routed to the platform MSI controller (DWC i.MSI-RX or External like
> > GIC-ITS) independent of the Root Port MSI state.
> Hi Mani:
> Thank for your kindly concern.
> The MSI controller (DWC i.MSI-RX) on i.MX7D, i.MX8MM, and i.MX8MQ platforms
> requires the RC's MSI capability to remain enabled. Removing it breaks MSI
> routing from endpoints to the platform MSI controller.
> 

I understand that MSI is broken on your hardware, but I was trying to understand
'why' specifically. Because, Root Port MSI capability doesn't have anything to
do with the endpoint MSIs. And since you mentioned that this issue happens only
on one platform, could be that the hardware designers have mistakenly wired the
Root Port's 'MSI Enable' to iMSI-RX's enable signal or something similar?

If so, we can introduce a flag 'dw_pcie_rp::keep_rp_msi_en' or something
similar, set it for affected SoCs and skip the capability removal in
pcie-designware-host.c

- Mani

-- 
மணிவண்ணன் சதாசிவம்

