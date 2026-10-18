Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA35CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MP0xzrtUAIGCiQ3Vv4x3ZMb9VIotKDQUpwOcYx4Lefw=; b=P5c6WmCK7/Mvit/LDplIAvYNKU
	0Awx7c3sJGtOZTNOJ/c1te5ngI8ytBdUVfHg5+fSM9STN8+6PxfnyYJJucY1JqRiPyBRh8uQ4jJjn
	PC050LTpbd3nwAGIp/LfzucxlOAjXeE6RVFJ0nO1IjFdZSTf7ZEUnc69Qoz0B0YyRwl6lnmkU2lWq
	jiDwQZPBD2uRuRLntrZU5JcprCGbnSzrEsAT0Ybx7tuYa47VQ+00uLXVdQzVU54+SKN6VTvWoHaiD
	hUpv/DQCIuVIT5rIzdyny0ecsaDMWL5UUTl24tnHbXbe7cidosSANxx9pKu0ncSCgkTpwgdot1Nq0
	F4Hi7wGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIJ3-00000005Vjf-0iIt;
	Sun, 18 Oct 2026 04:15:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIJ1-00000005VjT-43iO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:15:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B3CD94081D;
	Sun, 18 Oct 2026 04:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CB21F000C4;
	Sun, 18 Oct 2026 04:15:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] PCI: iproc: Use __free(device_node) in
 iproc_pcie_msi_enable()
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, 
 Fuad Tabba <tabba@google.com>
In-Reply-To: <179229671563.2114.2272123769233816365.b4-reply@b4>
References: <20260923180703.3901185-1-fuad.tabba@linux.dev>
 <179229671563.2114.2272123769233816365.b4-reply@b4>
Date: Sun, 18 Oct 2026 09:45:13 +0530
Message-Id: <179229691395.2114.1987475070162259066.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=T9fTdrsgg5r6oIEOtPR6BTlLWOX5OhYh+0fscoHJvIM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq1EfbhorHqyd2sezkZqeA0gqx5kyIB7uVxjHZm
 IRPBrkADC6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatRH2wAKCRBVnxHm/pHO
 9UKHB/9h+z2FrwH5xMEEYcUW+bPGdtfxl///RD9LpQR2hh3zxLsHRblNI3j1mbR2VoUKfUUJBS5
 PQxV3lb1W9cDQDYAO2EYg/mT0bb3Pw4ZWP+OLWXJq4tHQzNMzWrMypLYXdfcPhTuT9CXtSzGex7
 WTAfL93EF+mg9EStj9gLdqXjiQ9cXluJ1Oyw2kNSQf/XD93c6HeRhLrqIg0GnCOjVCuT7tdfeZL
 xmMwf03IRWXBn+TprsDhGevO0ZjgvaZ3PwIq2nlkHINgnByWXhOnOzg8dFCiIMI2ixzKqdkD6+c
 dHPV74SHjVnaSzVf+SwCjEFMrSJOaF/qEg9RJBJSvyo9F7MZ
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-10-18 09:41 +0530, Manivannan Sadhasivam wrote:
> On 2026-09-23 19:07 +0100, Fuad Tabba wrote:
> > Declare msi_node with __free(device_node) and drop the out_put_node
> > label and its goto: the scoped cleanup puts the MSI controller node on
> > every return, as the label did.
> > 
> > No functional change intended.
> > 
> > Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Link: https://lore.kernel.org/linux-pci/61488ddc-b346-4ba3-b32a-e972a3bd75a4@mailbox.org/
> > Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> > 
> > Notes:
> >     Changes since v1:
> >     - Declare msi_node immediately before of_msi_xlate() rather than at the
> >       top of the function (Jonathan).
> >     - Kept Marek's Reviewed-by, since the generated code is unchanged.
> > 
> >  drivers/pci/controller/pcie-iproc.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> > index afb3aa38ac6bb..bf455f2a9d9a9 100644
> > --- a/drivers/pci/controller/pcie-iproc.c
> > +++ b/drivers/pci/controller/pcie-iproc.c
> > @@ -1338,13 +1338,13 @@ static int iproc_pcie_msi_steer(struct iproc_pcie *pcie,
> >  
> >  static int iproc_pcie_msi_enable(struct iproc_pcie *pcie)
> >  {
> > -	struct device_node *msi_node = NULL;
> >  	int ret;
> >  
> >  	/*
> >  	 * Either the "msi-parent" or the "msi-map" phandle needs to exist
> >  	 * for us to obtain the MSI node.
> >  	 */
> > +	struct device_node *msi_node __free(device_node) = NULL;
> 
> As per cleanup.h:
> 
> "Given that the "__free(...) = NULL" pattern for variables defined at
> the top of the function poses this potential interdependency problem
> the recommendation is to always define and assign variables in one
> statement and not group variable definitions at the top of the
> function when __free() is used."
> 

Hmm. I replied too fast. I think in this case, it is OK since the variable is
passed as a reference in its first usage.

- Mani


