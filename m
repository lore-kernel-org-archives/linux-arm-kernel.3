Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F991C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JMEurOe9ZHBP9Lzs52oCdL3QD0lTBynnDeFDQ6wWGQc=; b=UBt1i9P4UIt68BqP/BVNoECRnu
	KJYVfAcuFQiUIolFcByCYZ+VZ8ePergOcWkOuyYLd954Q05I8xHDw7tVXu5qGacl5emYojDpNvw+Y
	HL45t5wExHTBtfgZVPbYJLnnqZvclCAFSZD4bDbtD1NQg5FEgod7jn5Gn+IUf/OjkmCKtpYmWGBnQ
	LtFCb/BkAir4yU2J1hYyq7iC8weMGFz3/n/7ntlI0R1GwUV7GI7T35Kw4IBiOS8wJUwoiO/KSUEZT
	tr6SXLqC4BNY0fS0uWLE38/ihiArr1X4yRPzwqEz99YbEvgSfzvdeu/WEXthymel2BNCn2rXG8qso
	5PJFryFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7xyM-0000000GW7B-2xKt;
	Sat, 19 Sep 2026 16:31:30 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7xyI-0000000GW5s-2x45;
	Sat, 19 Sep 2026 16:31:28 +0000
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e612fa0e;
	Sun, 20 Sep 2026 00:31:09 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] clk: rockchip: Unregister notifier on multi-PLL registration failure
Date: Sun, 20 Sep 2026 00:31:06 +0800
Message-Id: <20260919163106.1833104-1-lhfff@tju.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0ba81e1be03a1kunm005bdd813f1226
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHUJIVkwYSR5DSx4ZHkMeSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=H6nHROhRofFAqw6rSvIplm54SpLReIPjjZj3lPrj21YcJeIITjbW9yxWmgHWlFTnMvPaVnVM9228CCZp8gR5vRqSYIO0dCQty1I8FwdZcEj9TX8t9ZrH2g5iE1mW/mry9q9XXdMYVkON3lMgZrRx0U0MHiTVjO3zu5F7CrRNXAc=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=JMEurOe9ZHBP9Lzs52oCdL3QD0lTBynnDeFDQ6wWGQc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_093127_301180_9925B256 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

rockchip_clk_register_cpuclk_multi_pll() registers an embedded notifier
block before duplicating the rate table. If that allocation fails, the
error path frees the notifier owner and unregisters the watched composite
clock without removing the notifier.

The common clock framework retains both pointers in its global notifier
state. A later rate change walks that state in __clk_notify() and reads the
freed watched struct clk before it can compare the clock core. The notifier
chain also retains the notifier block embedded in the freed cpuclk.

Unregister the notifier before freeing either object. This mirrors the
rollback already used by the adjacent rockchip_clk_register_cpuclk()
helper for its equivalent post-registration rate-table allocation failure.

With controlled allocation failure injection, a later rate change produced
two KASAN use-after-free reports in __clk_notify() in each of three runs.
The same three runs completed without a kernel diagnostic with this change.

Fixes: 826eaa8f5bac ("clk: rockchip: Implement rockchip_clk_register_armclk_multi_pll()")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 drivers/clk/rockchip/clk-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index eb6b8b878..2de7f2b4f 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -544,6 +544,7 @@ struct clk *rockchip_clk_register_cpuclk_multi_pll(const char *name,
 					     GFP_KERNEL);
 		if (!cpuclk->rate_table) {
 			ret = -ENOMEM;
+			clk_notifier_unregister(hw->clk, &cpuclk->clk_nb);
 			goto free_cpuclk;
 		}
 	}

base-commit: 04721208427536c0f70db0efc5362c7f5a4997c9
-- 
2.39.5


