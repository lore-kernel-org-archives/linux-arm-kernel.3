Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BE7C3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvnOz+LDXuGPXr4IO7GKWTgF7rp1dpQJhP0ZkETFaq0=; b=Ul6GkxqLm2h74ntqxXjp+7M2r9
	nKXs6eZ7z98x88miFhqAQX/+gdx4i1n38LHt24xgiKjoQdtC4J4hy57fWBN/8iqMLTYia90nwkOs+
	llsRxe8iNZqmQG7WX59svhxV8AptYf3ITjTBrtb3cWH8r7v1N8AMXPROKo2XslQyJl+VLNjXiWgZz
	8k2ndyp/bQwtLvQ/KW5AsGSjVBJzW2nMph3MZQaOEblvX8jwMLWSMPPHeS36p6tZxg0UekKLow7Fp
	VQSRoU7kD86544TMPnl9NEz47lsJPoVjuLtSZU2p0C3yiGKeIWQHWT+MM4FLvJyOJYuQHyMi/S7fk
	9zi7YB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4HK-00000008lIX-0ULX;
	Mon, 05 May 2025 22:27:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC46W-00000008huh-2i1V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24BACA4CC4F;
	Mon,  5 May 2025 22:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12795C4CEF1;
	Mon,  5 May 2025 22:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483363;
	bh=aJBhqLkBwb4yvuEypiYyoVhdKgEw4V7w2elPmnAG+JA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GoN9btCqDM1rIjhagwaQT27aILpZlXEHM4/qJ7eMkV8JDlJiSpiV0iQv5yziIFs3+
	 3RYl2dpuzm6ggpvITv4H7ow148MIvl/uqAs3yBoGmjRRpCYbQsy/lqWsxVkp8ae9dx
	 +5Uk4vYKiB8cH7hU1Rd3VJ+6x79cEGb6qIlvEqVuocsdtEsRU4ID0HpX06Vu4V8uPd
	 y8k+bzrezx7BISfF7JbznHe0pdoTWodySaGcZmOvhMCWjyniLH4uZQlYyRysPXS9HA
	 6D+GoAi7u1XrKm6FV3YJsSu6tBqkk6lCRxgfAYh/Z0KkY7MZq+tCGGUIScy8gxTzcm
	 x4ftSh++CsTCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	bharat.kumar.gogada@amd.com,
	michal.simek@amd.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 055/642] PCI: xilinx-cpm: Add cpm_csr register mapping for CPM5_HOST1 variant
Date: Mon,  5 May 2025 18:04:31 -0400
Message-Id: <20250505221419.2672473-55-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_151604_756842_BA98CBA9 
X-CRM114-Status: GOOD (  10.41  )
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

From: Thippeswamy Havalige <thippeswamy.havalige@amd.com>

[ Upstream commit 9e141923cf86b2e1c83d21b87fb4de3d14a20c99 ]

Update the CPM5 check to include CPM5_HOST1 variant. Previously, only
CPM5 was considered when mapping the "cpm_csr" register.

With this change, CPM5_HOST1 is also supported, ensuring proper
resource mapping for this variant.

Signed-off-by: Thippeswamy Havalige <thippeswamy.havalige@amd.com>
[kwilczynski: commit log]
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Link: https://lore.kernel.org/r/20250317124136.1317723-1-thippeswamy.havalige@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/controller/pcie-xilinx-cpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-xilinx-cpm.c b/drivers/pci/controller/pcie-xilinx-cpm.c
index dc8ecdbee56c8..163d805673d6d 100644
--- a/drivers/pci/controller/pcie-xilinx-cpm.c
+++ b/drivers/pci/controller/pcie-xilinx-cpm.c
@@ -538,7 +538,8 @@ static int xilinx_cpm_pcie_parse_dt(struct xilinx_cpm_pcie *port,
 	if (IS_ERR(port->cfg))
 		return PTR_ERR(port->cfg);
 
-	if (port->variant->version == CPM5) {
+	if (port->variant->version == CPM5 ||
+	    port->variant->version == CPM5_HOST1) {
 		port->reg_base = devm_platform_ioremap_resource_byname(pdev,
 								    "cpm_csr");
 		if (IS_ERR(port->reg_base))
-- 
2.39.5


