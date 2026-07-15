Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A1DC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ic1l0R9XSXSPcjzSVKaMqFjWTIIjJ0qptOiF1TPCK8=; b=X3x/7oEShrkeOXiCewcN5MBzo4
	vrj4LzzkFAzEB5L1JYpfqHNZdSvTs7l5yPa85d44/MiaX6P6Cc+ikQw8UNDZ1DWXU1tO7wJWH+FBQ
	qaOwV+Q5L8dXvj9a6dMZk8uO+tIBGar57aTt4a9EIwGT/4JRbqvSeAnNXfExGJP53rujzmCZQVc0W
	5Y0XnNfdw//1oC1vkJkD8u9UdNZzuM5hJDYZ9+6UJKxGIILMHzaKcMj+IKan0UGtnIH6wZaGIubCd
	GOkd4UQogsKQandFrudDFwhNASNT+pFcGH5aB0FWFZBmL0NC1DjD226Jlga5dj3sRkcLuxGQg0PzI
	sfEiuNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsre-0000000DrPv-3wt6;
	Wed, 15 Jul 2026 06:13:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsre-0000000DrPW-07dU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:13:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DE2741A24;
	Wed, 15 Jul 2026 06:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEF81F000E9;
	Wed, 15 Jul 2026 06:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095981;
	bh=+ic1l0R9XSXSPcjzSVKaMqFjWTIIjJ0qptOiF1TPCK8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YTAHcm9Q6a79g6Z7OzFD3Z4uCRdbN7tIdQrEm6i9SUojjSbMjInW/l1XzyByeCPkK
	 zZ2dRhOTk7b304zdhMImq8gK8qIVlFxGg/RbH8JR7At6KHuiPU9SjtV89mBxduazRv
	 zz4OYLl8Vy+Ca4p6SxItP8E4xmQ/IUCCR+mEJRyVqRmtA/X1U/xj6ylmf+zfqCK8iv
	 xcSlQan1adk9w7tkcaukji6T4/1Lla1KdK/K1Rwvt+cjA8FqRmcp1qJ6aYm3IO9akN
	 0DIsLC6HuearzPPQEZlhaYIx8B5TdEOEqs+TByK1srhlGpZIYcv+GITh0emKzDXlSP
	 9e8UORr3Ld2gw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Toan Le <toan@os.amperecomputing.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Yuho Choi <dbgh9129@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260630195234.1871951-1-dbgh9129@gmail.com>
References: <20260630195234.1871951-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] PCI: xgene: Drop unnecessary OF node reference
Message-Id: <178409597817.39543.12230799053712711896.b4-ty@b4>
Date: Wed, 15 Jul 2026 08:12:58 +0200
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


On Tue, 30 Jun 2026 15:52:34 -0400, Yuho Choi wrote:
> xgene_pcie_probe() stores dev->of_node in port->node with
> of_node_get(), but the cached node is only used during probe by
> xgene_pcie_parse_map_dma_ranges(). The driver never releases the extra
> reference, so the node reference is leaked.
> 
> There is no need for private OF node ownership here. Use the device's
> existing of_node directly in xgene_pcie_parse_map_dma_ranges() and remove
> the cached port->node pointer.
> 
> [...]

Applied, thanks!

[1/1] PCI: xgene: Drop unnecessary OF node reference
      commit: 4869db344e76c9adfb1d9654df442db5371fac71

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



