Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63B8D262A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 22:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fam2jl/GH6YsOlWHEU4YoA75VfPcBwa6Yfe6H/U+4wI=; b=keqBwh54nx+rbi
	KBwhMEroOHl1Ym4bUxaY23LGkmkABmlAsAfUZihMMIl4v1BJh1NwruQK4izVO7uMb1UKAxALkziSm
	u32n7opqBEURSdRZF1YvY5mL/X9mv8aHVwjST5ps/EW4VJgtuawsz44TDMKLKjuz9rxj5rnnfpf8G
	zV5FsFz+zsAJns6nxFGHO4lHWMf0MWr+Es8L4qOTcLrCqEoEFHZvWkI/k5hw1PtKnt0Gn2bK3CIAa
	jLzVgyNaf1TfDdef5a8RZzqEYVyeS5JEOuzTIG03rqp70cKBoNHthIH5U4m4vdIcR7330Bnq1tW7n
	rews82r81CN8zI6zz2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJqA-00000004W7W-0lfJ;
	Tue, 20 Jan 2026 22:04:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viJq8-00000004W6y-0IH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 22:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0C1F43922;
	Tue, 20 Jan 2026 22:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF7FC16AAE;
	Tue, 20 Jan 2026 22:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768946682;
	bh=Ksd7axcgTS0Lavz7Iw2jFrS2gsUr2aSKtbp2LAryPmk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=laUvCro2hjtkpMTyGGJ9dHJXz8JR1c4XofHhT5wJf+CPN8Qo9/ULqHboEeChcQIrc
	 ZdxPuldd8oR/hlIMOVXWM0l15XGGzhvBYSlZ0tz4POx2KCuVpjZcTFXbsBvVqhWbUY
	 9SCowjOihAhnpzvVcDLNwDr5cOaisQeeQdOP0t5cOgWWwPHKo2IpM5FA9nBcf9JG4W
	 nN4u5A8aYkx5OleM2+2Rhcpt0mxqd2hfCW2dDzY3375uO5Gzf/7RjxcxvpZiiCxvYZ
	 hre4i0DyrOzTLJ8XFevDbrz7Ge0RLz5K9N8fXYTXbPShr0CFHVReq4My4QB8bpi7X2
	 ESpPrzrZXBhKA==
Date: Tue, 20 Jan 2026 16:04:41 -0600
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
Message-ID: <20260120220441.GA1170239@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109152750.GA544801@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_140444_125134_38479315 
X-CRM114-Status: GOOD (  13.74  )
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

On Fri, Jan 09, 2026 at 09:27:50AM -0600, Bjorn Helgaas wrote:
> ...

> The current commit log for this patch is this:
> 
>   Some SoCs like i.MX95 require enabling REFCLK after resuming from suspend
>   in their post_init callback. So invoke the callback at the end of
>   dw_pcie_resume_noirq() if available.
> 
> When .post_init() is called, the link is already up and PCIe devices
> have already been enumerated.  I think REFCLK is required for the link
> to come up, so it doesn't sound right to me that .post_init() would be
> *enabling* REFCLK.

This never got resolved.

https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc-imx6&id=199c18221622
says imx_pcie_host_post_init() enables REFCLK by applying the
IMX_PCIE_FLAG_8GT_ECN_ERR051586 workaround.

I don't think that commit log is correct.  Can you please supply some
correct text for that commit?

Bjorn

