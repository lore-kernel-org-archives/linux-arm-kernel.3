Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27D3CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7YFVkl+1ZY0Rlco79QQvPL2GmZjYoCSWldgOSgBE0g=; b=vo2VqcmGw6HUTO75BpXew9zd9t
	iZmIU24MYGK76ChNltECw+5xMXExAPBfPwInr9jMaNzF0L2BDw5AyqTGPu0sD82lu4kvVbs6RQaG8
	aIFElKw/r64OXzDSFQnPci6vh6hLJgiWLxGQCOxlPkV8OI8MnTqzjVcmpER6KWUSrKlaOpcy9G0Fk
	6YODyum28o113DnwIuY8JUVm4Z+zbTvPXLUIa5VX3zFR46W5zuohaDnzXo/Nm77cwyd/tq9wpeR4G
	TeqTKL4oGo6c+qnUBDKJRbkKTd0urGYBap12X6cMKkAAcmlPSciYw9hZ8mEwRxnwr8sHBpsoWdjmB
	5CQ9jQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyoF-0000000FYJR-2vGe;
	Wed, 14 Oct 2026 13:14:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyoF-0000000FYJL-0u9H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:14:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A60E060218;
	Wed, 14 Oct 2026 13:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5117F1F000FF;
	Wed, 14 Oct 2026 13:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983658;
	bh=I7YFVkl+1ZY0Rlco79QQvPL2GmZjYoCSWldgOSgBE0g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gowA1ETviZIbeOPX37NjJNoUbu6SKjzQEUpmGJRw//cMc6B6dUz/zMF7EWOxDxNvE
	 eCx2UVu0C5gJ/vMEGHjbCc6ruoLZW3YcbR4lXb1ox3BVAGaMe6a/ll9rhuuz4SqgJv
	 sHdsubFdzJjEBsLG/J3m2o4TAz588YPFSlBQkQLVteZF3W8jzGZbIw2mZQpaslSNUS
	 LP7gHotvN9PmUiWKPfEQK87R/H+KgGyzyqDALntgNb4uDapQvnlIhwMa2qwjLFQIYR
	 lUXh6ZckrQQNeLSWX8oUt79HGRQtYb8SyrM0n3TVzxbmD38PX3fe5/Y8yNu7nh5n0z
	 /voxp8/HWnF0g==
From: Manivannan Sadhasivam <mani@kernel.org>
To: bharat.kumar.gogada@amd.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: bhelgaas@google.com, kwilczynski@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, michal.simek@amd.com, 
 robh@kernel.org, thippeswamy.havalige@amd.com, stable@vger.kernel.org
In-Reply-To: <20260917132459.2153240-1-vulab@iscas.ac.cn>
References: <20260917132459.2153240-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] PCI: xilinx-xdma: Fix device node reference leak in
 xilinx_pl_dma_pcie_init_irq_domain()
Message-Id: <179198364237.63727.8742689610493287096.b4-ty@b4>
Date: Wed, 14 Oct 2026 18:44:02 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=399;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=i3FYOq1i3QlPXoQPHaC61bAAS20NIkq1j8Z6OirDM0k=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqz4Afqsb4QVGnp++mRm9p8UiFbL4MXqOSS+q06
 aq2bAoZrmuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas+AHwAKCRBVnxHm/pHO
 9SFQB/9xhEgM7VvjikxK9eNqB6b94b4qNPxE4sYUYay9NXIP/wPr/h1dJSjmIwiRTDEMg7nM/jI
 Jq3ylqhnL3W40Tx3C/WQ7x874Glp3YJvSrTRF1L7B9OQfbwp7Yb1MGqSEBQIN2T3nn+fkoJqDZK
 uCgc1NwPtkZt5mK+i08bw2j/bpign6TtlDfgpSrSysRB/+cPrQKyt2PXYtCil2j3QAHZyo6bDVe
 qTH7QNul7pqbxfdCkBj4TZN89VCMX19780GXoIQZurrA0k4msPD0heFZe74Rl8LwmX+NdcYXT9J
 Y4t6S8SB4ivukeK2B9bb0+MMF0h9yyoNqZY7wZfIKLhyxbyQ
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


On Thu, 17 Sep 2026 13:24:59 +0000, Wentao Liang wrote:
> PCI: xilinx-xdma: Fix device node reference leak in xilinx_pl_dma_pcie_init_irq_domain()

Applied, thanks!

[1/1] PCI: xilinx-xdma: Fix device node reference leak in xilinx_pl_dma_pcie_init_irq_domain()
      commit: 0346bd527dff238db0acfe8ca6c4dfc6c2ea1c52

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



