Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A641DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yBK2SMmnmmXQKpsxKBIpL+ahW59pXRtwFSrSF15klk=; b=nsycNfeBPcR3EusRpICt4X10O2
	ez5ghTACQ5UK3YsEueNpE+FUNnyG+51fXCsK4gwpS0SCMkpBVQp48RSf7cdWCCzmkxijFQgFztwQA
	QAtzMCuMFDZQDYBbXreVljSsjkT+XSI1YFCOvuguXDqRQDuhUvOcGhr1Xosu3kDHdkpFh7ojxv3YR
	1aAETlGo/1hGl/vWgwIQF7B+6Mk6fzCvPY4O+nLQE0OUVwEup4X/VE6LiIbbljPG/1RJbB6jFBJRL
	0XjlIo3RMMUqgYFSTkjLtObEJZDR2zOvNlQkyihZ28kYmYvIGph7KNYYNfyOs6TVn24gF9DnQ/PI9
	Pfz4NPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC65n-00000009Gb7-358C;
	Tue, 06 May 2025 00:23:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4M5-00000008mv4-31B7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 057D35C551E;
	Mon,  5 May 2025 22:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8971DC4CEEE;
	Mon,  5 May 2025 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484328;
	bh=mma8tzwZ/NqwWnsXqPq43wQ4tvCGsiw9PyvHomQ17l4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JYG4CV8yg2byv9RZHH6b9s4ar4Ogju745AHK4JvJHnvNFOwOCSJxmagvkPL0BeKJd
	 IphkUa/J1A+Jjrj6blAZCghi8d1BPhHBLdXh7jU5j5PbPn0PsSjmbMjPdF9BtU1bi7
	 89pSU+V3JSszCQwQOSGFGo3pBJjKpvX4kpaYIC+UX6UXbdOlvEvMYK/hinNcXKztrI
	 V/NhgexE7xL4sYGGNzp2ap/Uo2xF2Wt6lFaDPJHVt10GwqL43lbAxCsuzq56nfG+tq
	 h/XZH9FA7PrVGNcK+R7fMCcep+w07PA5+RqpsbsOnFFGCmVxyjyDDzq1NEZIjgKbdE
	 F4lv0J+Fn0olA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Chong Qiao <qiaochong@loongson.cn>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	chenhuacai@kernel.org,
	chenfeiyang@loongson.cn,
	fancer.lancer@gmail.com,
	phasta@kernel.org,
	zhaoqunqin@loongson.cn,
	rmk+kernel@armlinux.org.uk,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 456/642] net: stmmac: dwmac-loongson: Set correct {tx,rx}_fifo_size
Date: Mon,  5 May 2025 18:11:12 -0400
Message-Id: <20250505221419.2672473-456-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153209_849965_40315EFB 
X-CRM114-Status: GOOD (  11.97  )
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

From: Huacai Chen <chenhuacai@loongson.cn>

[ Upstream commit 8dbf0c7556454b52af91bae305ca71500c31495c ]

Now for dwmac-loongson {tx,rx}_fifo_size are uninitialised, which means
zero. This means dwmac-loongson doesn't support changing MTU because in
stmmac_change_mtu() it requires the fifo size be no less than MTU. Thus,
set the correct tx_fifo_size and rx_fifo_size for it (16KB multiplied by
queue counts).

Here {tx,rx}_fifo_size is initialised with the initial value (also the
maximum value) of {tx,rx}_queues_to_use. So it will keep as 16KB if we
don't change the queue count, and will be larger than 16KB if we change
(decrease) the queue count. However stmmac_change_mtu() still work well
with current logic (MTU cannot be larger than 16KB for stmmac).

Note: the Fixes tag picked here is the oldest commit and key commit of
the dwmac-loongson series "stmmac: Add Loongson platform support".

Acked-by: Yanteng Si <si.yanteng@linux.dev>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Link: https://patch.msgid.link/20250210134328.2755328-1-chenhuacai@loongson.cn
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ab7c2750c1042..702ea5a00b56d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -590,6 +590,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	if (ret)
 		goto err_disable_device;
 
+	plat->tx_fifo_size = SZ_16K * plat->tx_queues_to_use;
+	plat->rx_fifo_size = SZ_16K * plat->rx_queues_to_use;
+
 	if (dev_of_node(&pdev->dev))
 		ret = loongson_dwmac_dt_config(pdev, plat, &res);
 	else
-- 
2.39.5


