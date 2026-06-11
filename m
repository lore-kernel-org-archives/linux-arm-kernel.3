Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A73ECD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/76CmUDQEitIdUNCPI3yjc7DENCkNGcDP+dkrSJRHhA=; b=gJa0qbDNbM1QFGgWKj5DACAQ6Q
	0dSilKawL7ZtfKYankhVexPhhDoSuO+lqvGPFriwp6qQ4PlSgkERMxZ9KyvclwDMmTdj1eXGBzQ0q
	6GS3qhi6l8H5jzDsx8V15c0l33EsWCyM10Ybu920bn8khBkozfVV71ixTaxBH3Daq+jyNqWizxVpw
	i2hXiGn9Os//FE3ngDkkCjWfC9tHbg82zd/iB3kJnWHPXqHueplNn0w7P7Su2FbNuS8flUDta5hKz
	pYCgMUbhAaUNg2o+f1Z87Jx3x41krhXoVYTU6F+CQ6OzLUNoLTh4K52Hco6wvDkcYoeqVh5hbja/x
	hf8Fx4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3W-00000009TFw-3Y6A;
	Thu, 11 Jun 2026 13:02:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3V-00000009TER-2edk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:02:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CBB4600AF;
	Thu, 11 Jun 2026 13:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40ADF1F00898;
	Thu, 11 Jun 2026 13:02:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 5/9] clk: scmi: Add scmi_clk_is_pm_clk()
Date: Thu, 11 Jun 2026 15:02:09 +0200
Message-ID: <af9666e8fb841606b42d865d42adcaf472099ce1.1781171705.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781171705.git.geert+renesas@glider.be>
References: <cover.1781171705.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a helper for querying if an SCMI clock can be used for
power-management.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk-scmi.c   |  9 +++++++++
 include/linux/clk/scmi.h | 17 +++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 include/linux/clk/scmi.h

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 7c562559ad8bb47f..20e6da1859290b75 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/scmi.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/of.h>
@@ -364,6 +365,14 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	return ops;
 }
 
+bool scmi_clk_is_pm_clk(struct clk *clk)
+{
+	struct clk_hw *hw = __clk_get_hw(clk);
+
+	return hw && to_scmi_clk(hw)->info->pm_clk;
+}
+EXPORT_SYMBOL_GPL(scmi_clk_is_pm_clk);
+
 static int scmi_clocks_probe(struct scmi_device *sdev)
 {
 	int idx, count, err;
diff --git a/include/linux/clk/scmi.h b/include/linux/clk/scmi.h
new file mode 100644
index 0000000000000000..12c338598d09296f
--- /dev/null
+++ b/include/linux/clk/scmi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+
+ */
+
+#ifndef __LINUX_CLK_SCMI_H_
+#define __LINUX_CLK_SCMI_H_
+
+#include <linux/types.h>
+
+struct clk;
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_SCMI)
+bool scmi_clk_is_pm_clk(struct clk *clk);
+#else
+static inline bool scmi_clk_is_pm_clk(struct clk *clk) { return false; }
+#endif
+
+#endif /* __LINUX_CLK_SCMI_H_ */
-- 
2.43.0


