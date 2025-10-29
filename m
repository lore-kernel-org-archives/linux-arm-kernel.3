Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF5DCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5QxpBOteuJW9MIrekz+DfVEWkmSKN9zJbjytZZCL2ws=; b=GGlbculzFPGxgw
	/sJfBds7isFrEBQy/Iry40JELlUL28rBRSJHu6YF5SzwmaZhhZdoY5y1NMO+7RkiHCVRJ/lbW0xtr
	4SI6u0xru3wda1tWseJpoJvxl7rO6bacDP7riRv5IEWfDv1dV1Gufx/7LHOIwa2VTlgBRwf66cBqJ
	qhCYOpYrxxMbhRNiqbLFUX7aFkZjMEnRiDueDiqVEYHQ9cj+auvdJlEtpJknogLBBEugwfRFVjrjO
	fEac0S72UPYvtHcSrxaXuSC6WBLBEVq+qDyz8EX/Hz2iDUtcKnjYNeEJd7gV51xcwfGNIOIVdto/i
	oNWljNgarOUdrVbLi7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAGB-00000002GFb-0wA5;
	Wed, 29 Oct 2025 17:46:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAG9-00000002GF4-2YTr;
	Wed, 29 Oct 2025 17:46:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3D9E605A2;
	Wed, 29 Oct 2025 17:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202B1C4CEF7;
	Wed, 29 Oct 2025 17:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761760016;
	bh=KsXdySkGiHmSzsuy7Pi+sVL7aoIePP+MEpnzF2GEcmA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=K22XA1Hjw8uOX95mhKKhhconnRdms2qQD/Nbq0dqkODo/qoasd98i4iGIns2To5K7
	 9LCQCwxZ++SdZB2vSAuCJYW4paAjVRKTA4iWkPcqn9ss6ygExiQXqHziIwzmyr+rkW
	 +lIxJgcLxAivPEpWGXWHSqI8/7xdlQzr7QsViTjJuJzP8+wsaPDKG5m+0ZtIalIr/k
	 OungqAalRYCEVyKSHVo57GafE546/x+UVS5pGNUIRUiKo7vIQBPHzK6tyDCTfyy+Hp
	 yAXyomKjaPtaqAImWTBqtWHwQxnW7/jlC878FpiIrVJhNq87HlEksKBMqgKgcyoNJG
	 qk2DTbEtU/sOQ==
Date: Wed, 29 Oct 2025 12:46:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
Message-ID: <20251029174654.GA1571737@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029163336.2785270-3-thierry.reding@gmail.com>
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

On Wed, Oct 29, 2025 at 05:33:31PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Pass the driver-specific data via the syscore struct and use it in the
> syscore ops.

Would be nice to include the "instead of global variable" part here so
the commit log includes the benefit and can stand alone even without
the subject.

Awesome to get rid of another global variable!  More comments below.

> +++ b/arch/mips/pci/pci-alchemy.c
> @@ -33,6 +33,7 @@
>  
>  struct alchemy_pci_context {
>  	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
> +	struct syscore syscore;
>  	void __iomem *regs;			/* ctrl base */
>  	/* tools for wired entry for config space access */
>  	unsigned long last_elo0;
> @@ -46,12 +47,6 @@ struct alchemy_pci_context {
>  	int (*board_pci_idsel)(unsigned int devsel, int assert);
>  };
>  
> -/* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
> - * should suffice for now.
> - */
> -static struct alchemy_pci_context *__alchemy_pci_ctx;
> -
> -
>  /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
>   * in arch/mips/alchemy/common/setup.c
>   */
> @@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
>  /* save PCI controller register contents. */
>  static int alchemy_pci_suspend(void *data)
>  {
> -	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
> -	if (!ctx)
> -		return 0;
> +	struct alchemy_pci_context *ctx = data;
>  
>  	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
>  	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
> @@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
>  
>  static void alchemy_pci_resume(void *data)
>  {
> -	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
> -	if (!ctx)
> -		return;
> +	struct alchemy_pci_context *ctx = data;
>  
>  	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
>  	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
> @@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscore_ops = {
>  	.resume = alchemy_pci_resume,
>  };
>  
> -static struct syscore alchemy_pci_syscore = {
> -	.ops = &alchemy_pci_syscore_ops,
> -};
> -
>  static int alchemy_pci_probe(struct platform_device *pdev)
>  {
>  	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
> @@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_device *pdev)
>  	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
>  	wmb();
>  
> -	__alchemy_pci_ctx = ctx;
>  	platform_set_drvdata(pdev, ctx);
> -	register_syscore(&alchemy_pci_syscore);
> +	ctx->syscore.ops = &alchemy_pci_syscore_ops;
> +	ctx->syscore.data = ctx;
> +	register_syscore(&ctx->syscore);

As far as I can tell, the only use of syscore in this driver is for
suspend/resume.

This is a regular platform_device driver, so instead of syscore, I
think it should use generic power management like other PCI host
controller drivers do, something like this:

  static int alchemy_pci_suspend_noirq(struct device *dev)
  ...

  static int alchemy_pci_resume_noirq(struct device *dev)
  ...

  static DEFINE_NOIRQ_DEV_PM_OPS(alchemy_pci_pm_ops,
                                 alchemy_pci_suspend_noirq,
                                 alchemy_pci_resume_noirq);

  static struct platform_driver alchemy_pcictl_driver = {
          .probe          = alchemy_pci_probe,
          .driver = {
                  .name   = "alchemy-pci",
                  .pm     = pm_sleep_ptr(&alchemy_pci_pm_ops),
          },
  };

Here's a sample in another driver:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/cadence/pci-j721e.c?id=v6.17#n663

>  	register_pci_controller(&ctx->alchemy_pci_ctrl);
>  
>  	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
> -- 
> 2.51.0
> 

