Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C3BCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cfOekzhoclFCm+LWn+5CpA0OPOwnIdUmFfLhBpoTmE=; b=J9WYlgyCze4oOGj+QU9oUHlids
	Z/Y5hogHzmpwxK0OSp9ynkOkFbVAwPHtswLZbpScVQq0eMPg0+gl3goFEa2PhrgghoHUOfTzKBDip
	bq2QqAhA2Okht6dqVblPx6QBVa7gwzaPmKSgGjVfJ3n9Nzn/7Pi9rmcL5heJCWMOs45/1/wrhoblk
	f7B4/InHPBMHw3ZQSB4fMYqqL93vYr3z0OW4OEshVDUJXsN+wKlIQpAl/HL/FEgTaChvR6Ki8qRvr
	hJoSiXq0p6UZUyq8w2JIazrYarVxLren3yYIw+3J+ENRPgBY41c5kAvPWVgTqvVR9A7eBVmrTlJba
	MYJV6QWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu74b-0000000AqXP-0l8f;
	Thu, 04 Sep 2025 10:20:09 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu61f-0000000ATym-0L5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 09:13:04 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5849Cl9c3476356;
	Thu, 4 Sep 2025 04:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756977167;
	bh=6cfOekzhoclFCm+LWn+5CpA0OPOwnIdUmFfLhBpoTmE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=D9rxwAfYltIFcAjtwe3bCFvCgZ08dx1fMKFRi0gaqhHkw3fM8rXENUuxsFRPU72SZ
	 dNOUlIPIwIuvWOUuJfaGzNYv2H/9hKPHLxjJM86KROHOAanxXkFPqzIU648hxMkpa9
	 9pXujYPsqyB+tebuOepQbiHsPKgrQZb2owLu4u1g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5849ClU93707400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 04:12:47 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 04:12:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 04:12:47 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5849CjkL3027798;
	Thu, 4 Sep 2025 04:12:46 -0500
Date: Thu, 4 Sep 2025 14:42:45 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jiri Slaby <jirislaby@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <jingoohan1@gmail.com>, <fan.ni@samsung.com>,
        <quic_wenbyao@quicinc.com>, <namcao@linutronix.de>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <quic_schintav@quicinc.com>, <shradha.t@samsung.com>,
        <inochiama@gmail.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <18255117159@163.com>, <rongqianfeng@vivo.com>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH 09/11] PCI: keystone: Switch to devm_request_irq() for
 "ks-pcie-error-irq" IRQ
Message-ID: <249d79be-deed-4277-96c3-845bafcec37a@ti.com>
References: <20250903124505.365913-1-s-vadapalli@ti.com>
 <20250903124505.365913-10-s-vadapalli@ti.com>
 <3d3a4b52-e343-42f3-9d69-94c259812143@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3d3a4b52-e343-42f3-9d69-94c259812143@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_021303_221356_EEAD3A20 
X-CRM114-Status: GOOD (  29.32  )
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

On Thu, Sep 04, 2025 at 09:24:01AM +0200, Jiri Slaby wrote:
> On 03. 09. 25, 14:44, Siddharth Vadapalli wrote:
> > In preparation for enabling loadable module support for the driver,
> > there is motivation to switch to devm_request_irq() to simplify the
> > cleanup on driver removal. Additionally, since the interrupt handler
> > associated with the "ks-pcie-error-irq" namely "ks_pcie_handle_error_irq()
> > is only printing the error and is clearing the interrupt, there is no
> > necessity to prefer devm_request_threaded_irq() over devm_request_irq().
> > Hence, switch from request_irq() to devm_request_irq().
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> >   drivers/pci/controller/dwc/pci-keystone.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > index bb93559f6468..02f9a6d0e4a8 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -1277,8 +1277,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
> >   	if (irq < 0)
> >   		return irq;
> > -	ret = request_irq(irq, ks_pcie_err_irq_handler, IRQF_SHARED,
> > -			  "ks-pcie-error-irq", ks_pcie);
> > +	ret = devm_request_irq(dev, irq, ks_pcie_err_irq_handler, IRQF_SHARED,
> > +			       "ks-pcie-error-irq", ks_pcie);
> >   	if (ret < 0) {
> >   		dev_err(dev, "failed to request error IRQ %d\n",
> >   			irq);
> 
> Ugh, so you are not removing any free_irq() from anywhere?
> 
> <me checking>
> 
> Because there is none...
> 
> So you are actually fixing an IRQ leak in case something later fails -- I
> guess this needs Fixes and Cc stable tags, right?

Yes! While working on this series and unloading the module, I had seen
the issue and narrowed it down to the absence of a free_irq() in the
driver's .remove callback. Since the driver cannot be unloaded prior to
this series (driver can only be built-in), I had felt that a separate
fix may not be required for adding the missing free_irq() in the .remove
callback. However, after you pointed it out now, I realize that there
are other places during the driver's probe where we may exit in the
event of an error, without freeing the interrupt. Thank you for noticing
this. The commit to be fixed is:
0790eb175ee0 PCI: keystone: Cleanup error_irq configuration
Link to the commit is:
https://github.com/torvalds/linux/commit/0790eb175ee0
I will include the Fixes tag for the above commit and also Cc stable when
I post the v2 series. I will wait for feedback on the remaining patches
in the series before posting the v2 series.

Regards,
Siddharth.

