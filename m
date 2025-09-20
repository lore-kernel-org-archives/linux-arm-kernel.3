Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0533CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 08:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HCwpoWVlDBUpbcyeUPKyKagw48982pK9Xvfw3N836A=; b=odcwjtvccaPjiYIaRH/YRmzIOM
	/DWOSOov6KHpnF3/PWQVtLhYZKITO2NMcoLIdIl7rQ8/4grQhYeUaX4ZH1iTFpbH+qaS5Z3DNvdZO
	wtEppoICbGjSItAZm9AUYMF5FTT08mgB5qLjhm7CWZI/BaL7Kp+J/pWplwxR06FGeIYYU/1Y3eNja
	A08YuQUsqdkcxWWw+5IXv6fDT7hQaKWzRqH3JZGXxCeeS6U0n3uwJPwLcF7srhw7FYt5BMYf+uaSO
	31yuJaoPGWzLE6iaWZFQV2qpnb42GgOCF3x3Al85iKcuHuP3wMRdAuBx7Q1WKUAoKAsnOQXy5PgvH
	+I9Rpg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsaB-000000050tZ-3xC1;
	Sat, 20 Sep 2025 08:04:35 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsa9-000000050tA-1hDa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 08:04:34 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58K84HLV399022;
	Sat, 20 Sep 2025 03:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758355457;
	bh=6HCwpoWVlDBUpbcyeUPKyKagw48982pK9Xvfw3N836A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PreD4aobcPkYcr4h6kGWTasi26Pr4MzLj6u88xUjfUtf5PsGVC1fuhp0ltfL8+a0c
	 zvHbe4dlSEwKckQlcFIgNsRhJBTCvat1ljcieAjA2HVO1pgP/YpXgp/IBWBO2ENS1l
	 ub+Jy9LJaOnCsRjTUx+PWFMopI8dD2cuuCELqlDg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58K84HF6368740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 20 Sep 2025 03:04:17 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 20
 Sep 2025 03:04:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 20 Sep 2025 03:04:16 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58K84FwH3564171;
	Sat, 20 Sep 2025 03:04:16 -0500
Date: Sat, 20 Sep 2025 13:34:15 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
        <jingoohan1@gmail.com>, <christian.bruel@foss.st.com>,
        <qiang.yu@oss.qualcomm.com>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <shradha.t@samsung.com>,
        <quic_schintav@quicinc.com>, <inochiama@gmail.com>,
        <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v2 05/10] PCI: keystone: Add ks_pcie_free_msi_irq()
 helper for cleanup
Message-ID: <cbcb0183-1fbd-4815-948b-3c380491c8db@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-6-s-vadapalli@ti.com>
 <rbyukvvhzoch4p54usbrjpjlhd6qknhp2er6gfxhcj5lxpgrqh@5wnwiijn2g5f>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rbyukvvhzoch4p54usbrjpjlhd6qknhp2er6gfxhcj5lxpgrqh@5wnwiijn2g5f>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_010433_529295_761015DA 
X-CRM114-Status: GOOD (  23.75  )
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

On Sat, Sep 20, 2025 at 12:02:34AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Sep 12, 2025 at 05:46:16PM +0530, Siddharth Vadapalli wrote:
> > Introduce the helper function ks_pcie_free_msi_irq() which will undo the
> > configuration performed by the ks_pcie_config_msi_irq() function. This will
> > be required for implementing a future helper function to undo the
> > configuration performed by the ks_pcie_host_init() function.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> > 
> > v1: https://lore.kernel.org/r/20250903124505.365913-6-s-vadapalli@ti.com/
> > No changes since v1.
> > 
> >  drivers/pci/controller/dwc/pci-keystone.c | 25 +++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > index d03e95bf7d54..81c3686688c0 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -666,6 +666,31 @@ static void ks_pcie_intx_irq_handler(struct irq_desc *desc)
> >  	chained_irq_exit(chip, desc);
> >  }
> >  
> > +static void ks_pcie_free_msi_irq(struct keystone_pcie *ks_pcie)
> > +{
> > +	struct device_node *np = ks_pcie->np;
> > +	struct device_node *intc_np;
> > +	int irq_count, irq, i;
> > +
> > +	if (!IS_ENABLED(CONFIG_PCI_MSI))
> 
> Isn't the CONFIG_PCI_KEYSTONE_HOST always depend on PCI_MSI?

The reason I added the check is that it exists in 'ks_pcie_config_msi_irq()'.
But I realize now that it should be removed from
'ks_pcie_config_msi_irq()' as well. Since I had written the above
function with the objective of undoing the changes done by
'ks_pcie_config_msi_irq()', the 'config check' was retained since the
changes should be undone only if they were executed by
'ks_pcie_config_msi_irq()'. I will drop the check in the v3 series and
will also post a separate patch to drop if from 'ks_pcie_config_msi_irq()'
if that is acceptable. Please let me know.

Regards,
Siddharth.

