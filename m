Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37740C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uwi6h+Mbh5NDOTTaf/ENNbg/mJRVU1FF7pfVOpprP2A=; b=gkMxBA3mXjCpbmv0F+3RXpbHc3
	yWwwV0bq5EZ7LwBPBomoJjzLmqUGnL6zvvt0tgyjEZkaYTrR2ZOlvONDapIpwEt7c7Rdr0HBdxCvM
	3t0EzxRp6qDQEz4rZsDOV92bM7GK6mqIYgNSCYZbngOY++FAic6QpdvocCLs5tuDsCdGsIWSvOyCd
	3QY2yh1cIuppE2faid1HBS1pigpQgvv7Ri+gydQJqzNuE1eKPycUnDWbYIEtuEbnvHBd1iNarhcYb
	VxTSDjASDrTo1RrSXTCctuCdp4Q9ootLqapzi/O+WvMO/CeyVef4ku2LtZ7xPgtWF7DtTmzQdUquB
	t87aYeKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aE5-0000000Dl2w-0M7x;
	Thu, 10 Sep 2026 08:33:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aE3-0000000Dl2b-2QaR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:33:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2082742A3F;
	Thu, 10 Sep 2026 08:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055781F000FF;
	Thu, 10 Sep 2026 08:33:39 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: toan@os.amperecomputing.com, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, 
 Yuho Choi <dbgh9129@gmail.com>
Cc: robh@kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260802221146.573233-1-dbgh9129@gmail.com>
References: <20260802221146.573233-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] PCI: xgene: Use managed clock for PCIe controller
Message-Id: <178902921961.4253.14812402144849584392.b4-ty@b4>
Date: Thu, 10 Sep 2026 10:33:39 +0200
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


On Sun, 02 Aug 2026 18:11:46 -0400, Yuho Choi wrote:
> xgene_pcie_init_port() obtains and enables the controller clock manually.
> When xgene_pcie_setup() or pci_host_probe() fails, probe returns without
> disabling, unpreparing, or releasing the clock. A failed enable also leaves
> the clk_get() reference unreleased.
> 
> Use devm_clk_get_enabled() so the clock is unwound automatically on probe
> failure and device removal.
> 
> [...]

Applied, thanks!

[1/1] PCI: xgene: Use managed clock for PCIe controller
      commit: b9022584ebbae81f7bbe4a61bd1df0d0a95e1a99

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



