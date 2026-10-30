Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E9606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TX+gnPOv;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAmDVWTQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3Kjh/71rS7bSt01dnSb2c1FgQ0Wq48Nu51Ez0vLlm7Y=; b=TX+gnPOvbKSgfNRpk5LGDEBo/8
	SHkc2u8/pu1D33EyzDN2q4DCmrwl6cM7cWtuwz4JtrXyVu6VbXhvTdbCaVvZ6eqU1Kv4rtFCbsRQ8
	egkS9sWyYeojg/+JYrDxqH/56j+jdnQEBt84QYDcZtQNRnHvC6flTMrS0CigI9wi64JU/XY9TFr1H
	Yc0GNfrp1qYN89+Ha4SFuZlSU3I8dZGn2KZhCPSwaS+jIGw+S73TiHLSlsfmAAjvwlT2d+nyLrqb4
	Ye7UEcjVr2aYzOSgu8Dv7P2MAyXJZCesmmt1Y/N+xPHdoEiS14/dOqkSwEnCLDmFCr093qj8K7NRm
	9tMZ8b7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjUV-0000000BLvW-2l8e;
	Fri, 30 Oct 2026 10:05:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjUU-0000000BLvG-2geZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:05:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B123401CA;
	Fri, 30 Oct 2026 10:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978481F0093A;
	Fri, 30 Oct 2026 10:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793354741;
	bh=3Kjh/71rS7bSt01dnSb2c1FgQ0Wq48Nu51Ez0vLlm7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DAmDVWTQQ0EnpUm2kHj1UN2K+Uy4bgN7pSQKx51eCz4tGisFRtV62HYWTMzAeaLsh
	 +pl6k22EQjDXPGtj57yqPUSoULTf2us6Flc+VEGG51vvDp7HPb4su18RJUmL5FEHtU
	 ODORdxFiuhHznWOBRhFtl/652L0Y4pexh0f2VqXjWxE6teGc9QR06UO7y/w0NRRFw4
	 fUs9qwZ5PJHMTJpoxf+Ez02B9VfFbWUMI2pDaYDqWzGhJKLITkvHAjJ0m/uuWqFzxJ
	 IgtXfHkeFX8eKHlS92lQ9bwh+XOG9yH7sQfTLA/VjFyJbxznQS/mmZKIAzvzeQGQVq
	 yMrOMxQFjobVA==
Date: Fri, 30 Oct 2026 15:35:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, 
	Mahesh Vaidya <mahesh.vaidya@altera.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczynski <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	subhransu.sekhar.prusty@altera.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>
Subject: Re: [PATCH] PCI: altera: Convert root port IRQ to a requested handler
Message-ID: <auRrmtLrRv3fOsXA@debian>
References: <20261014100723.1643089-1-mahesh.vaidya@altera.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014100723.1643089-1-mahesh.vaidya@altera.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 06:07:23PM +0800, Mahesh Vaidya wrote:
> altera_pcie_irq_teardown() removes the chained handler before removing
> the INTx domain. Removing the handler prevents new invocations, but does
> not wait for one already running on another CPU. Such a handler can
> therefore access pcie or pcie->irq_domain after they have been freed.
> 
> Chained handlers bypass handle_irq_event(), so synchronize_irq() cannot
> rely on IRQD_IRQ_INPROGRESS and may return without waiting if the parent
> irqchip does not report IRQCHIP_STATE_ACTIVE.
> 
> Convert the chained handler to a requested hard IRQ. Request it only
> after creating the INTx domain and call free_irq() before removing the
> domain. free_irq() then synchronizes against any in-flight handler.
> 
> Use IRQF_NO_THREAD because generic_handle_domain_irq() requires hardirq
> context. Use IRQF_NO_SUSPEND to preserve the suspend behavior of the
> previous chained cascade. Request and free the IRQ explicitly because
> automatic devres cleanup happens after remove() returns.
> 
> Fixes: ec15c4d0d5d2 ("PCI: altera: Allow building as module")
> Reported-by: Bjorn Helgaas <bhelgaas@google.com>
> Link: https://lore.kernel.org/linux-pci/20260430204330.3121003-3-mahesh.vaidya@altera.com/
> Suggested-by: Dinh Nguyen <dinguyen@kernel.org>
> Assisted-by: ChatGPT:GPT-5
> Signed-off-by: Mahesh Vaidya <mahesh.vaidya@altera.com>

Thomas, can you please share your review?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

