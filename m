Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE62CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sl+9JdP70DKwIHRwzY2NfCCtRDFRLejg8Xik/I1hJM=; b=wiwamqsBln9tVNH/NXb5Iwmpxg
	InXCfV/vgVJicjaa41eOXSErU1O6vkaJV+qIs+O/kLVBZhwl9gOMkzSsgVIa8eWasZBYG6UWmGoas
	FhyQiEUCYCuBOpKQkweTreN0I+Cmt+X+gTvpI6pLxg2EzEiyq/DBf+JjTlUTPO9lf8lQKI7SllzF7
	dRmEuec3LV+a39IG9djV8nnA235zLHrRlnu6pZqBNQuYdRpEDdjvNlRcyfCH7OXb+dNSEXtqignTk
	NvLMGNPxuhZL2QBMwQfdyW9TGzK2ghvHEXCywfL0FceJBF94tWjc/sGwPX2wsUxys/mgO5jJGPl0A
	VtysPdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsjZ-000000051sx-1QrA;
	Sat, 20 Sep 2025 08:14:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsjW-000000051sC-47ZV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 08:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C55B445FF;
	Sat, 20 Sep 2025 08:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919AFC4CEEB;
	Sat, 20 Sep 2025 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758356054;
	bh=H9jVzceHhz7BCuWrEcBBzKxp5SLS2ZXomJMfy40j+D0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fz2O/AsZ6wRO0snZvJPxpyl7bfliCTrVg+OSrWu+uBqQiLuFyLiaz6+DVE0UGnXSa
	 BbXA5jDLYtLPPrDIC2XYv5fuNmtGIhp3aaUMFfVUtsIYlPkb2YbfOZYf+8RwgU0xBn
	 YLl0XbUeu7LrsxiXN7u6WSb91IRLsJlXIE35t5RJCZVYdoIfBLyBBFj3r5nse6wN44
	 qtvupiZLaTIGx7DZsdOdovNSrq0QNMI9yU8cpnqDPECwlYk3r2zotVBMoe24gM/w/M
	 DO8Iqyke3vY/ajeEbkO7pUS+adOagfbLQwf/mWkQR1PSqF1ja3GVylGopCGmUJFEvN
	 WJuatdlh9pRFQ==
Date: Sat, 20 Sep 2025 13:44:02 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	qiang.yu@oss.qualcomm.com, mayank.rana@oss.qualcomm.com, thippeswamy.havalige@amd.com, 
	shradha.t@samsung.com, quic_schintav@quicinc.com, inochiama@gmail.com, 
	cassel@kernel.org, kishon@kernel.org, sergio.paracuellos@gmail.com, 
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 05/10] PCI: keystone: Add ks_pcie_free_msi_irq()
 helper for cleanup
Message-ID: <ouj2ksyccliaolyq7icceltcmnvadvtckonrck3bawrufuhct6@bda2xxpp66dg>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-6-s-vadapalli@ti.com>
 <rbyukvvhzoch4p54usbrjpjlhd6qknhp2er6gfxhcj5lxpgrqh@5wnwiijn2g5f>
 <cbcb0183-1fbd-4815-948b-3c380491c8db@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbcb0183-1fbd-4815-948b-3c380491c8db@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_011415_063344_4AE93662 
X-CRM114-Status: GOOD (  24.85  )
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

On Sat, Sep 20, 2025 at 01:34:15PM +0530, Siddharth Vadapalli wrote:
> On Sat, Sep 20, 2025 at 12:02:34AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Sep 12, 2025 at 05:46:16PM +0530, Siddharth Vadapalli wrote:
> > > Introduce the helper function ks_pcie_free_msi_irq() which will undo the
> > > configuration performed by the ks_pcie_config_msi_irq() function. This will
> > > be required for implementing a future helper function to undo the
> > > configuration performed by the ks_pcie_host_init() function.
> > > 
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > ---
> > > 
> > > v1: https://lore.kernel.org/r/20250903124505.365913-6-s-vadapalli@ti.com/
> > > No changes since v1.
> > > 
> > >  drivers/pci/controller/dwc/pci-keystone.c | 25 +++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > > index d03e95bf7d54..81c3686688c0 100644
> > > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > > @@ -666,6 +666,31 @@ static void ks_pcie_intx_irq_handler(struct irq_desc *desc)
> > >  	chained_irq_exit(chip, desc);
> > >  }
> > >  
> > > +static void ks_pcie_free_msi_irq(struct keystone_pcie *ks_pcie)
> > > +{
> > > +	struct device_node *np = ks_pcie->np;
> > > +	struct device_node *intc_np;
> > > +	int irq_count, irq, i;
> > > +
> > > +	if (!IS_ENABLED(CONFIG_PCI_MSI))
> > 
> > Isn't the CONFIG_PCI_KEYSTONE_HOST always depend on PCI_MSI?
> 
> The reason I added the check is that it exists in 'ks_pcie_config_msi_irq()'.
> But I realize now that it should be removed from
> 'ks_pcie_config_msi_irq()' as well. Since I had written the above
> function with the objective of undoing the changes done by
> 'ks_pcie_config_msi_irq()', the 'config check' was retained since the
> changes should be undone only if they were executed by
> 'ks_pcie_config_msi_irq()'. I will drop the check in the v3 series and
> will also post a separate patch to drop if from 'ks_pcie_config_msi_irq()'
> if that is acceptable. Please let me know.
> 

Sounds good to me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

