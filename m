Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C7AE85379
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQ9hpxsi1XARJGTTZk8OmBx/poj3MOP32Ag0T8hmLps=; b=wNwAWJElLA+C8A2W/WLDk/l35H
	FVO3dMcKX24fVFK09SmYSm8sUSRV6p0tTTF4z3cgmjw+em/HhqL/uZzQsMPIRDDGcYH0pKclSQ3cD
	PQ2TCcxQtUxyzEmzdCfSKk4dMj5ZZRtNrpow689M3ethma4usfLSU5+q0kKotiNQnj9msuWXyV9Zz
	9p60GbQtESvpSds0S25o66F12aL+08LKZr+c186Uw7uV6UYsBJRj06qUqG11jIAIYrj5AjniZpnSy
	oJhMBZ/otuKVLSsiI4yb8AUS9Re/5Jl7HN447SKLwZ0asX1CBMYzDbzbl2eXeiwBNE5eMfOHN9t0r
	EVuhtZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hvV-00000002MWh-3Z3U;
	Fri, 03 Apr 2026 17:03:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hvT-00000002MWM-2FFT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 104E3408CE;
	Fri,  3 Apr 2026 17:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AB5C4CEF7;
	Fri,  3 Apr 2026 17:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235797;
	bh=AOS61gbnHSp9w8+XowYHPIQQIZMANYd5/P0NBGDXrIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcppZFR2728XjAy91UjuJreyiJLkT1JSxrFm7WUeqgzLH+t/zs9O2CadQ1LuQPkCE
	 1yPDzkplh6xvOy1RnplfX8yvT0MT5n3r5y6uAL9W9T8JxkF0/wTH2ELd580zM0CwZ/
	 SXEntQ4XlfCN9EnwqzCO/FEEM7soxB/8YwacJBRvo5rTgrLJkLLlRgInit/UnNyDxy
	 ApHFhNzgr+NnbNMhMBmK8PhFKfJoOB3ePgrrI7wRvps3m8xudbtzTA3Mwi6OSoEL9W
	 fksYtPkY5QapWcxwaceESrOlfI1TdrP+mbiWez7tsavsiX5N8XehlDq+r+8Q8rBD6p
	 50VpNVzisZwew==
Date: Fri, 3 Apr 2026 22:33:04 +0530
From: "mani@kernel.org" <mani@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v1] PCI: imx6: Add force_suspend flag to override L1SS
 suspend skip
Message-ID: <y76fzvju42srykr3khio2bx5lmzusy6iasodvs45imis7fw3b5@wjv3gsocj534>
References: <AS8PR04MB8833061F34B9BEFC9D19764A8C4EA@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <20260323220858.GA1084506@bhelgaas>
 <AS8PR04MB8833137860C682F9E1E743E08C48A@AS8PR04MB8833.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8833137860C682F9E1E743E08C48A@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100319_657940_6C872EA9 
X-CRM114-Status: GOOD (  31.41  )
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

On Tue, Mar 24, 2026 at 02:01:58AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 2026年3月24日 6:09
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; jingoohan1@gmail.com;
> > l.stach@pengutronix.de; lpieralisi@kernel.org; kwilczynski@kernel.org;
> > mani@kernel.org; robh@kernel.org; bhelgaas@google.com;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> > Subject: Re: [PATCH v1] PCI: imx6: Add force_suspend flag to override L1SS
> > suspend skip
> > 
> > On Wed, Mar 18, 2026 at 02:55:45AM +0000, Hongxing Zhu wrote:
> > > > -----Original Message-----
> > > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > ... [messed up quoting]
> > 
> > > > On Tue, Mar 17, 2026 at 02:12:56PM +0800, Richard Zhu wrote:
> > > > > Add a force_suspend flag to allow platform drivers to force the
> > > > > PCIe link into L2 state during suspend, even when L1SS (ASPM L1
> > > > > Sub-States) is enabled.
> > > > >
> > > > > By default, the DesignWare PCIe host controller skips L2 suspend
> > > > > when L1SS is supported to meet low resume latency requirements for
> > > > > devices like NVMe. However, some platforms like i.MX PCIe need to
> > > > > enter L2 state for proper power management regardless of L1SS
> > support.
> > > > >
> > > > > Enable force_suspend for i.MX PCIe to ensure the link enters L2
> > > > > during system suspend.
> > > >
> > > > I'm a little bit skeptical about this.
> > > >
> > > > What exactly does a "low resume latency requirement" mean?  Is this
> > > > an actual functional requirement that's special to NVMe, or is it
> > > > just the desire for low resume latency that everybody has for all
> > > > devices?
> > >
> > > From my understanding, L1SS mode is characterized by lower latency
> > > when compared to L2 or L3 modes.
> > >
> > > It can be used on all devices, avoiding frequent power on/off cycles.
> > > NVMe can also extend the service life of the equipment.
> > 
> > All the above applies to all platforms, so it's not an argument for
> > i.MX-specific code here.
> >
> Hi Bjorn:
> Thanks for your kindly review. 
> Yes, it is.
> > > > Is there something special about i.MX here?  Why do we want i.MX to
> > > > be different from other host controllers?
> > >
> > > i.MX PCIe loses power supply during Deep Sleep Mode (DSM), requiring
> > > full reinitialization after system wake-up.
> > 
> > I don't know what DSM means in PCIe or how it would help justify this
> > change.
> > 
> i.MX PCIe power is gated off during suspend, requiring full reinitialization
> on resume
> 

Is this an unconditional behavior? What if the PCIe device is configured as a
wakeup source like WOL, WOW? And if you connect NVMe, this behavior will result
in resume failure as NVMe driver expects the power to be retained if ASPM is
supported.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

