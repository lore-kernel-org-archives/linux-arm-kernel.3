Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB76EEDA697
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVuuY6DnVa8OtSw8gBK5GiAjKWnbSPkmZBsHmc0mIoM=; b=4ApAMx2rEGBxDll/0GlvDEmq0u
	Pye4B9WPTGNJHBrc81DbmehI+YiI3JNP4eX3Bos/9gDKfa2UbtZkYM6dpzwcocQwMiT4t9oxB8mjX
	zHuVJQ2RgiEJsd6FT0wu5PNc5xswcXlz45unpaWQMXxfw0J30EP3irCi81H0nFUikPyR141mF5spD
	SjesNCBZuI7ZBc08xS7sY7Jsrp4sBkk3xSTYg3BG25Clqe2j8tQO6cBGyXfueJ+7Gl9eb/7VNKnhk
	kN+trMpHCxMZbY9DjVQ9YHd7iXDoaCKUnSqCvAOYrgtF1qTVHJQgWoOQ9Aw3skgzr//9RyeW84bLi
	+VDYW4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4rN-00000001LyE-0Ops;
	Thu, 05 Mar 2026 09:19:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4rL-00000001Lxs-11SM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ED2740262;
	Thu,  5 Mar 2026 09:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C25FC116C6;
	Thu,  5 Mar 2026 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772702346;
	bh=yFqoDY8r1mMFw5CegzFxkYWhTSU9YZHU7zw6uf1pu2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzVSDyz2eEfb1mMd/F58+/CcYUrpocNp97bNRIu6cjAbgp3+LWho6IdLNsmaEahF0
	 Gq+6q99ALhV0dAAKXIGTkGNLA1pd7drOXmGo8JwYE2MPn1AQhWvPvMaoFetyXhozyN
	 2z6ETneo6qAsPMbYwDWNcyu661n5E1jNV928LbG9/IH4Pa1Y07COPbXiZbzpcW9Rti
	 wCSGFSeg+98vGJ/ry43M920aCeezEGjlUPLUh7ZcIrF7wnyEkMlit1xgZyVqvIUIgX
	 Use99e7fxa4NSuNfX0KYOLPyM3PmYEB/i6fqMf4Zue+q/iB8aPsVA7hZNfeu0reVix
	 lZSMEqN1xoerg==
Date: Thu, 5 Mar 2026 14:48:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 4/5] PCI: qcom: Power down PHY via PARF_PHY_CTRL
 before disabling rails/clocks
Message-ID: <ksd4ogzz2o5uuwnkvq6yzcwm3zsxiaeuotdj6aiqrew7jqrwl4@g3wcnqhviqwq>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-4-89b322864043@oss.qualcomm.com>
 <to6p7yf2oo5qh37hsye4zpputrc7p4bwgqvjc2plieuyapjdhp@7xshxghi4tzd>
 <313d2262-56e4-49b0-8455-2b46d0966976@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <313d2262-56e4-49b0-8455-2b46d0966976@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_011907_348848_6A719C00 
X-CRM114-Status: GOOD (  24.44  )
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

On Thu, Mar 05, 2026 at 02:26:22PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/5/2026 1:19 PM, Manivannan Sadhasivam wrote:
> > On Tue, Feb 17, 2026 at 04:49:09PM +0530, Krishna Chaitanya Chundru wrote:
> > > Some Qcom PCIe controller variants bring the PHY out of test power-down
> > > (PHY_TEST_PWR_DOWN) during init. When the link is later transitioned
> > > towards D3cold and the driver disables PCIe clocks and/or regulators
> > > without explicitly re-asserting PHY_TEST_PWR_DOWN, the PHY can remain
> > > partially powered, leading to avoidable power leakage.
> > > 
> > > Update the init-path comments to reflect that PARF_PHY_CTRL is used to
> > > power the PHY on. Also, for controller revisions that enable PHY power
> > > in init (2.3.2, 2.3.3, 2.7.0 and 2.9.0), explicitly power the PHY down
> > > via PARF_PHY_CTRL in the deinit path before disabling clocks/regulators.
> > > 
> > > This ensures the PHY is put into a defined low-power state prior to
> > > removing its supplies, preventing leakage when entering D3cold.
> > > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-qcom.c | 30 +++++++++++++++++++++++++++---
> > >   1 file changed, 27 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index 2c4dc7134e006d3530a809f1bcc1a6488d4632ad..b02c19bbdf2ea5db252c2a0281a569bb3a0cc497 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -513,7 +513,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
> > >   	u32 val;
> > >   	int ret;
> > > -	/* enable PCIe clocks and resets */
> > > +	/* PHY power ON */
> > This comment is confusing since we already have phy_power_on() API. What does
> > really happen in the 'test power down' case?
> QCOM PCIe controller wrapper has way to force the entire PHY into lowest
> power
> state by turning everything off, without this bit being cleared the phy will
> not be
> powered on even after phy_power_on(), we can think this as a kind of switch
> from the controller side to power on phy.
> 

We never cared to set/clear this bit so far. So I'm assuming that if we simply
set it during init, it will not do any harm and allow the PHY to fully power
down itself when phy_power_off() is called?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

