Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB4ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=p1FNznxTesKRXivpmZi7jlqvFlP63jiXS1cd/tsKw7k=; b=od76l90/Mi3G+DUA8pVqYfN685
	NqoX4pzGPk6hoFvoOByZ7bn5XLExmabD4mN6sMHMmdzqjGkSXR9PSfN52YwTcOMo5sm4USz1DkYK0
	A3bZXJS2uyeGig+czXh/2+eqo/lyRaPV+SIfIBAwPGqgMJzMfPJr7sCySQApcznuRNuiiXdWFGD7O
	KqnRTSGUpjb5Wc35urPHVlxoEY4JY4dKsnhOohzx90VCImeHhZg2UBtwoKjVOTEnJNxWorpRPS//n
	0VFIzCnaJ/NRMIOlvYh3679iFxu9rTDyNzapsCHgb6Ey3LNOOWjd3/cUMUR3BImroDAzfvcSuEbR1
	woTLIOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAjE-00000000GUJ-24f9;
	Thu, 21 Aug 2025 19:13:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6PD-0000000HFOA-3upw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 14:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB4185C5AED;
	Thu, 21 Aug 2025 14:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555F0C4CEF4;
	Thu, 21 Aug 2025 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755787002;
	bh=mslOxpgPXJUH1lPNo77g9hu/LctQ1v616V6U+vFUEuw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=A6iu2OSGmM5F1jb5AqsqgYWlPZCfFqiYce5lrehvWxbBEyzLtTugwCQ4UGIpAtGeH
	 mtXyP9+eEm+EFKT4gEUFyaIoCIDv5XNhwDCOa3jvLtDuDZYg33VdJX7b7Yl8kmLZ9u
	 iLbs+755oUD1UrtOUrRlDUwrVxTj8IkR69l7289qRT5MJA0eBuREIH/L6CVrmsdp0T
	 mLLjoVacNl46v5K1/5ChCpVyJucsu7GcEhhimHvKynGX/OCfZQkyq28l5Du8EYubRz
	 p4BICIvF1YIdMPBefiXzoc/4IDuhp9H9xTmQUHegAg23odDaBn5/W1j5TSv2jquBSt
	 et6DDYaC4EjkA==
Date: Thu, 21 Aug 2025 09:36:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND v3 4/5] PCI: dwc: Skip PME_Turn_Off message if there is
 no endpoint connected
Message-ID: <20250821143641.GA672933@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB88334A22726CF287D41775DC8C32A@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_073644_047170_53B3FB1E 
X-CRM114-Status: GOOD (  24.28  )
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

On Thu, Aug 21, 2025 at 05:44:00AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 2025年8月20日 3:07
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; jingoohan1@gmail.com;
> > l.stach@pengutronix.de; lpieralisi@kernel.org; kwilczynski@kernel.org;
> > mani@kernel.org; robh@kernel.org; bhelgaas@google.com;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [RESEND v3 4/5] PCI: dwc: Skip PME_Turn_Off message if there is
> > no endpoint connected
> >
> > On Mon, Aug 18, 2025 at 03:32:04PM +0800, Richard Zhu wrote:
> > > Skip PME_Turn_Off message if there is no endpoint connected.
> >
> > What's the value of doing this?  Is this to make something faster?  If so,
> > what and by how much?
> >
> > Or does it fix something that's currently broken?
> >
> > Seems like the discussion at
> > https://lore.kern/
> > el.org%2Flinux-pci%2F20241107084455.3623576-1-hongxing.zhu%40nxp.com%
> > 2Ft%2F%23u&data=05%7C02%7Chongxing.zhu%40nxp.com%7Ced46fe10aeb74
> > 21c88a508dddf53a24f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> > C638912272493755203%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOn
> > RydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%
> > 3D%3D%7C0%7C%7C%7C&sdata=lIE7%2FlS5jiGxGPGVm5Hr5efpMbT19CLqrwu
> > YNvAEdLY%3D&reserved=0
> > might be relevant.
> >
> > This commit log only restates what the code does.  In my opinion we need
> > actual justification for making this change.
> Hi Bjorn:
> Thanks for your comments.
> This commit is mainly used to fix suspend/resume broken on i.MX7D PCIe.
> A chip freeze is observed on i.MX7D when PCIe RC kicks off the PM_PME message
> and no any devices are connected on the port.
> 
> Because i.MX7D is a very old design, and out of IP design technical support.
>  I don't know what's going on inside the PCIe IP design when kick off the
>  PM_PME message.
> 
> From SW perspective view, what I can do is to find out a quirk method to
>  workaround this broken. Hope this can clear up your confusions.

OK, will look for some of this background in the commit log of the
next version.

