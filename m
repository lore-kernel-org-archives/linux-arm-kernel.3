Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891CDC982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+WE/ni2n64GzSwGl4/8BrY2QKJyiDAfM8u2nswU6w9M=; b=cic4UARyX3iWQ3
	GDSQY73X0J2bmnvEA2ie3+pEn+jcpKD/YzCHwfz6EecFt9h1+CHqh0Ik0xy+YrkumP/wt74tkUncQ
	wmCZ2diez3QXmcOG2J9jdg1UaXOZ8P7aBU3HF275sVEuLszPCBIOO+9XezZH64cuJyrKUHDdcjQoW
	DXmAp7nfsUhG28Upm1gMy/JtSlhYKMxCpjKnGKNoAwawmdlzzpRZ7CnzkQ4zLS33dL/X6Al/7fgWt
	MT5F2BhJ+84RVCXVS/F0VjqK/R9vWQsJfD8yP/fixaqEILaLSRRzZZVGxOCdJV684XCBIW9Gl5x/Z
	7OXrck5IwfwzpQvrjKnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6reQ-00000009bTD-3xvL;
	Wed, 16 Sep 2026 15:34:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6reP-00000009bSz-0qvk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:34:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 531AE6020C;
	Wed, 16 Sep 2026 15:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0D81F000FF;
	Wed, 16 Sep 2026 15:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572860;
	bh=+WE/ni2n64GzSwGl4/8BrY2QKJyiDAfM8u2nswU6w9M=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=D80nzYBCwy1SsvxrDUO3O9v+afefJli1iZG+x6jQqs+eLXCQkiuB/+uBqKRHRWzuk
	 h98XMoxoMkbKBoy/63JRqznhsKDrtCamFieVqeh23RAah9X81hxDIX0/E++9aUn5cM
	 kxzv4MhQl3DFu/Ej1+jD9eEEYHfHb+OzWx9QVmRYfgD7RbrbbwrbeGWNkGwLisLE2C
	 iKMn/wN+mA5LtqL7C6Kd4GDK7VAVdni+ON5eXMB9LdfAlXzcBM3nLEn618rh2boT/a
	 UZzebmF7w6m/Ucow9rXvdw7aF8jMVdfHgeE3yy/+RqhzTiUl0auF+cgAL/m0iXeHl2
	 992jExJAZozog==
Date: Wed, 16 Sep 2026 10:34:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>,
	Frank Li <frank.li@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] PCI: dwc: Add suspend_poweroff flag for platforms
 with RC power loss
Message-ID: <20260916153418.GA925718@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR04MB120193844E13EAAF122C426448CB92@GV2PR04MB12019.eurprd04.prod.outlook.com>
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

On Wed, Sep 16, 2026 at 04:00:24AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: Thursday, July 30, 2026 6:30 AM
> > To: Hongxing Zhu (OSS) <hongxing.zhu@oss.nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
> > robh@kernel.org; bhelgaas@google.com; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev; linux-
> > kernel@vger.kernel.org; Hongxing Zhu <hongxing.zhu@nxp.com>
> > Subject: Re: [PATCH v2] PCI: dwc: Add suspend_poweroff flag for platforms
> > with RC power loss
> > 
> > On Fri, Jul 17, 2026 at 03:41:21PM +0800, hongxing.zhu@oss.nxp.com wrote:
> > > From: Richard Zhu <hongxing.zhu@nxp.com>
> > >
> > > Some platforms like i.MX power off their PCIe RC controllers
> > > during system suspend, requiring full re-initialization on
> > > resume. These platforms need to enter L2 state to properly
> > > notify endpoints before power loss.
> > >
> > > According to PCIe base spec r7.0, sec 5.2, the system software
> > > should transition the device into D3Hot before broadcasting the
> > > PME_Turn_Off message to initiate L2 entry. However, some
> > > endpoint devices fail the D3cold capability check in
> > > pci_host_common_d3cold_possible(), which would normally prevent
> > > L2 entry.
> > 
> > Wakeup devices that don't support PME from D3cold will fail the
> > D3cold capability check, but I don't think those are the problem
> > you're solving.
> > 
> > This appears to handle devices that are not in D3hot, and that's
> > not a property of the endpoint; it's a property of its driver.  Is
> > the problem here that some driver didn't put its device in D3hot?
> > 
> > > For platforms where the RC loses power during suspend, L2 entry
> > > is essential regardless of D3cold support, as the link will be
> > > lost anyway.  Add a suspend_poweroff flag to force L2 entry in
> > > such cases, and enable it for i.MX PCIe controllers.
> > >
> > > Note: This violates the spec requirement that devices be in
> > > D3Hot before PME_Turn_Off, but is necessary for proper operation
> > > on platforms with RC power loss during suspend.
> > 
> > If the device isn't in D3hot, it may still be active, and I think
> > the PME_Turn_Off will abort any DMAs in progress, which doesn't
> > sound like proper operation of the endpoint.
> 
> I apologize for not addressing your concerns promptly. Let me
> clarify the issue after reviewing this more carefully.
> 
> The problem I'm addressing:
> 
> L2 entry is being blocked for wakeup-capable devices that fail the
> D3cold capability check in `pci_host_common_d3cold_possible()`, even
> when the device is already in D3hot state.
> 
> Specifically:
> - The endpoint device is in D3hot (the driver has done its job correctly)
> - However, because it's a wakeup device that doesn't support PME from D3cold,
>   it fails the D3cold capability check
> - This failure currently prevents L2 entry, even though the device is already
>   in the required D3hot state as per the spec
> - For platforms like i.MX that power off the RC during suspend, we need L2
>   entry to properly notify the endpoint before power loss and complete
>   reinitialization successfully on resume.
> 
> So, the issue isn't about forcing devices into D3hot or handling
> devices that aren't in D3hot - it's about allowing L2 entry for
> devices that are already in D3hot but happen to fail the D3cold
> capability check due to wakeup requirements.
> 
> Regarding your concern about the commit message:
> 
> > "If the device isn't in D3hot, it may still be active, and I think
> > the PME_Turn_Off will abort any DMAs in progress, which doesn't
> > sound like proper operation of the endpoint."
> 
> You're right. The commit message note about "violating the spec
> requirement" is misleading and incorrect. The endpoint device is in
> D3hot (the driver has done its job correctly), so it's compliant
> with the spec requirement. I should remove or reword that note in
> the next version.
> 
> Would you mind if I resubmitted the patch and used clearer
> submission information to accurately describe this situation?

Of course not, please do!

Bjorn

