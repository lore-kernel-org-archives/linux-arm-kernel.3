Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1547C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6Zm/H/Lmzh0U1M//5cp7HJj5u5E9gqYg7yfdLufV4U=; b=0/IBid2kjBoGNyn/uaF+oUb1Hc
	MEepU1wOcJSUbWoXEvPmMIIVTzxVfpLiSHhC1bedQqInbeMtpIrHiZ6cAKxaIFg9kmZ4Z506EQkM0
	pNIXjEAO7N9aken3m0nu+xFy8FshGJc6mdYPS70aqDs3ZBsYGw8w5P/4eACvkm1zrflhr5kVMVB7A
	FytTF97dEf/BVrdJxACLH+RmHNHmeJMMqREyYk3rW1BSjXVB1cH/m5eDbJDcQONNlvdPSWT55M4Kl
	Kn8XIg2YtDjuL4dLVgcqQB1yBUF3rxSaEL0UM1G2LlnxwlrmexfyuSN+oZUSCg8sb784n7WsoOcb8
	H82NEMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zro-0000000DhLT-01t5;
	Thu, 10 Sep 2026 08:10:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zrm-0000000DhK5-1kXY;
	Thu, 10 Sep 2026 08:10:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6F2A60200;
	Thu, 10 Sep 2026 08:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3701F000FF;
	Thu, 10 Sep 2026 08:10:37 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: ryder.lee@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
 mani@kernel.org, bhelgaas@google.com, 
 Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: robh@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260728122810.3475-1-sreekuttan2156239@gmail.com>
References: <20260728122810.3475-1-sreekuttan2156239@gmail.com>
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Fix 64-bit type truncation in
 mtk_pcie_set_trans_table()
Message-Id: <178902783731.2684.801323745956768589.b4-ty@b4>
Date: Thu, 10 Sep 2026 10:10:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Tue, 28 Jul 2026 12:28:10 +0000, Sreeraj S Kurup wrote:
> The variables cpu_addr, pci_addr, and remaining in
> mtk_pcie_set_trans_table() are of type resource_size_t, which is 64-bit
> on 64-bit architectures.
> 
> Using 32-bit helpers fls(), ffs(), and BIT() causes 64-bit integer
> truncation when computing window sizes and address alignments above 4GB.
> 
> [...]

Applied, thanks!

[1/1] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
      commit: 13335fca4c23b1a6736ec9c7efc3750154a2ca24

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



