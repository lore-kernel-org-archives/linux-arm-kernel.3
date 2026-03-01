Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4FAFD0060
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGSG2neXfNHMXPWE++9TANS2sRDxWZHYot0lv8IAp+U=; b=kNtkyKwMTzvL7Xrw/1CcOrxLz6
	LnADy9noHQpMfgnhxzWa0w9mpHe3LRNCZFuKPCfVQe882kDQuS7zV3GZqwqdHkbcTWkRbsZUtrGlS
	VEPxKRqmKU8yAvddWH8Jo+6Xt1e6oC1zFoXb20GKWtqg2B5SZoS4qH98FPas7egWAqjJcIojkxVDD
	MUkno/K0a3hEs0U+LO3WMOtNp61q4cY1ehfVE9I+QX8dgTy6FrWruBaLpa7UlELyFFjlEeQlD39m8
	dY0cZCezsnpILgklfelYShCGa1gXTxtMoRRQH0q1lTFfhRszxTxHeXGkZphNb77hsyznfPUcTWeAP
	zXEGAvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwfEc-0000000B4g6-1mY4;
	Sun, 01 Mar 2026 11:45:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwfEZ-0000000B4fk-3NbW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 11:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5687343D62;
	Sun,  1 Mar 2026 11:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B912C2BCB2;
	Sun,  1 Mar 2026 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772365515;
	bh=HO8YivHWw2NmKZjyR/AaPuMHAlumMfbukAjMxjZL6Ow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pyVYHmTD0THNl+QW/OMlfXylHjgGxR6zOTKcWckHv/fbwcSv/a4MGsrLSPLyTt/9c
	 m1omC4beoBiybHQqt2Onfs+8XhXwJAipyW8ze6mQXR8U8BreiItSVgmAr6NLj/ekkH
	 6fPIA4qi2F20OWSxjPIKmEBjsD8FUWhITpueJbN4ShldBizLAMPh9d4HopLuCX/Yef
	 N5YF+fLvKzeP3QZQyUcqz/8XWY/svr2zap2p4hEns8t0BcDxROrFhSdvL/pcZ6bAYB
	 oMjheTQk2V+OPqyY2/h9Po+cVyjg74hJYXwEfnN2A11MOkZAlxtC/n+7KwEhDK8gt8
	 KVA0jtHMBACAQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vwfEW-0000000Evlq-39lc;
	Sun, 01 Mar 2026 11:45:12 +0000
Date: Sun, 01 Mar 2026 11:45:12 +0000
Message-ID: <86y0kb93jr.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,	Nipun Gupta
 <nipun.gupta@amd.com>,	Nikhil Agarwal <nikhil.agarwal@amd.com>,	Joerg
 Roedel <joro@8bytes.org>,	Will Deacon <will@kernel.org>,	Robin Murphy
 <robin.murphy@arm.com>,	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Thomas
 Gleixner <tglx@kernel.org>,	Rob Herring <robh@kernel.org>,	Saravana Kannan
 <saravanak@kernel.org>,	Richard Zhu <hongxing.zhu@nxp.com>,	Lucas Stach
 <l.stach@pengutronix.de>,	Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>,	Manivannan Sadhasivam <mani@kernel.org>,	Bjorn
 Helgaas <bhelgaas@google.com>,	Frank Li <Frank.Li@nxp.com>,	Sascha Hauer
 <s.hauer@pengutronix.de>,	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,	Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,	Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,	Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>,	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Prakash Gupta
 <prakash.gupta@oss.qualcomm.com>,	Vikash Garodia
 <vikash.garodia@oss.qualcomm.com>,	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,	linux-pci@vger.kernel.org,	imx@lists.linux.dev,
	xen-devel@lists.xenproject.org,	linux-arm-msm@vger.kernel.org,	Charan Teja
 Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a struct
In-Reply-To: <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
	<20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
	<bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: dmitry.baryshkov@oss.qualcomm.com, vijayanand.jitta@oss.qualcomm.com, nipun.gupta@amd.com, nikhil.agarwal@amd.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, lpieralisi@kernel.org, tglx@kernel.org, robh@kernel.org, saravanak@kernel.org, hongxing.zhu@nxp.com, l.stach@pengutronix.de, kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, konrad.dybcio@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org, krzk+dt@kernel.org, prakash.gupta@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org, charan.kalla@oss.qualcomm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_034515_907071_531315A2 
X-CRM114-Status: GOOD (  24.02  )
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

On Sun, 01 Mar 2026 10:59:23 +0000,
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
> > From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > 
> > Change of_map_id() to take a pointer to struct of_phandle_args
> > instead of passing target device node and translated IDs separately.
> > Update all callers accordingly.
> > 
> > Subsequent patch will make use of the args_count field in
> > struct of_phandle_args.
> > 
> > Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > ---
> >  drivers/iommu/of_iommu.c              |  2 +-
> >  drivers/of/base.c                     | 37 +++++++++++++++++------------------
> >  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
> >  drivers/pci/controller/pcie-apple.c   |  4 +++-
> >  drivers/xen/grant-dma-ops.c           |  2 +-
> >  include/linux/of.h                    | 21 +++++++++++++-------
> >  6 files changed, 44 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> > index a0937b7b3c4d..e1d4b37d200d 100644
> > --- a/drivers/pci/controller/pcie-apple.c
> > +++ b/drivers/pci/controller/pcie-apple.c
> > @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >  {
> >  	u32 sid, rid = pci_dev_id(pdev);
> >  	struct apple_pcie_port *port;
> > +	struct of_phandle_args iommu_spec = { .args_count = 1 };
> 
> Hmm, I didn't notice this. Parsing functions are expected to ignore
> of_phandle_args before the parsing. So passing .args_count = 1 is
> strange.

It isn't strange. It is a semantic requirement. It explicitly
indicates the boundary of what the driver is prepared to receive, just
like passing a single u32 * is perfectly clear.

Frankly, this patch makes an absolute mess of the current API.

	M.

-- 
Without deviation from the norm, progress is not possible.

