Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97947CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXHD4O73ULPGflpbqipgEMB2Cq5UPzPr6J5hSEaMOKU=; b=OeR63w9gRPLEYaFouKMGbPzz3m
	1TzqN08LOKX20xGACSIu0usS+Ky7FoM3DXq8kwX4hhW5EB7kvxDKhGhYvx9zOBdg666qQ6orf7hIQ
	YxOHgoKUvLELlHM+vun0OiJxYE0Zu/hELaPSi4eF/Bibgg98EsiWnMkh/wklM65uEKuPaUeUPCHyi
	dUuDCWBr1hlwCzTiPsb0UJKPhuWrh27d96Y8e6M+3o77srv52GXOPIWW9ZVvEaJwnD1CW6qHhe+r/
	hLxpcc8agA/YWQrr/nNc9NurYe4qw2EVt7pRttx3luGJKa8ObXUQmdHJlKhfcAwaBZVteHelYgCcP
	7utAR03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkIG-00000003LD8-0dws;
	Fri, 16 Oct 2026 15:56:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkIE-00000003LBb-03uk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:56:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7304E60232;
	Fri, 16 Oct 2026 15:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357A11F000C8;
	Fri, 16 Oct 2026 15:56:20 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 4/8] reset: Add reset_control_get_from_provider_exclusive()
Date: Fri, 16 Oct 2026 17:55:43 +0200
Message-ID: <b9e68c8df1e545191e0359dba23fe53de31a4ce5.1792163045.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792163045.git.geert+renesas@glider.be>
References: <cover.1792163045.git.geert+renesas@glider.be>
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

When stacking two reset controllers, the upper one should go through the
proper channels: request exclusive reset controls and use them via the
reset_control_*() APIs.  However, unlike the clock subsystem, which has
of_clk_get_from_provider(), the reset subsystem does not offer a way to
lookup and obtain a reset from a reset provider.

Hence add a public helper reset_control_get_from_provider_exclusive()
to lookup and obtain an exclusive reference to a reset controller, based
on the recently introduced __reset_control_get_from_provider() helper.
This will be used by the R-Car X5H Module Controller driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Check for overflow when converting (u64) fwnode args to (uint32_t)
    OF args,
  - Document that reset_control_get_from_provider_exclusive() must not
    be given a reference to a GPIO provider,
  - Let the dummy return ERR_PTR(-ENOTSUPP) instead of NULL,

v3:
  - Replace reset_controller_get_provider() by
    reset_control_get_from_provider_exclusive(),
  - Add kerneldoc,

v2:
  - No changes.
---
 drivers/reset/core.c  | 41 ++++++++++++++++++++++++++++++++++++-----
 include/linux/reset.h |  8 ++++++++
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 0e11f4c81c10d601..421bcc4c89cc21ac 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1141,6 +1141,7 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
 				  bool gpio_fallback,
 				  enum reset_control_flags flags)
 {
+	struct fwnode_handle *fwnode = consumer ?: args->fwnode;
 	struct reset_controller_dev *rcdev;
 	int rstc_id = -EINVAL;
 
@@ -1153,18 +1154,30 @@ __reset_control_get_from_provider(const struct fwnode_reference_args *args,
 	if (WARN_ON(args->nargs != rcdev->fwnode_reset_n_cells))
 		return ERR_PTR(-EINVAL);
 
-	if (rcdev->of_xlate && is_of_node(consumer)) {
-		struct device_node *np = to_of_node(consumer);
+	if (rcdev->of_xlate && is_of_node(fwnode)) {
+		struct device_node *np = to_of_node(fwnode);
 		struct of_phandle_args of_args;
 		int ret;
 
-		ret = of_parse_phandle_with_args(np,
+		if (consumer) {
+			ret = of_parse_phandle_with_args(np,
 					 gpio_fallback ? "reset-gpios" : "resets",
 					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
 					 gpio_fallback ? 0 : index,
 					 &of_args);
-		if (ret)
-			return ERR_PTR(ret);
+			if (ret)
+				return ERR_PTR(ret);
+		} else {
+			of_args.np = of_node_get(np);
+			of_args.args_count = args->nargs;
+
+			for (unsigned int i = 0; i < args->nargs; i++) {
+				if (args->args[i] > U32_MAX)
+					return ERR_PTR(-EINVAL);
+
+				of_args.args[i] = args->args[i];
+			}
+		}
 
 		rstc_id = rcdev->of_xlate(rcdev, &of_args);
 		of_node_put(of_args.np);
@@ -1254,6 +1267,24 @@ struct reset_control *__reset_control_get(struct device *dev, const char *id,
 }
 EXPORT_SYMBOL_GPL(__reset_control_get);
 
+/**
+ * reset_control_get_from_provider_exclusive - Lookup and obtain an exclusive
+ *					       reference to a reset controller.
+ * @args: Reference to the reset controller provider with all the args like
+ *	  reset number.  This must not be a reference to a GPIO provider.
+ *
+ * Returns a struct reset_control or IS_ERR() condition containing errno.
+ * If this function is called more than once for the same reset control it will
+ * return -EBUSY.
+ */
+struct reset_control *
+reset_control_get_from_provider_exclusive(const struct fwnode_reference_args *args)
+{
+	return __reset_control_get_from_provider(args, NULL, 0, false,
+						 RESET_CONTROL_EXCLUSIVE);
+}
+EXPORT_SYMBOL_GPL(reset_control_get_from_provider_exclusive);
+
 int __reset_control_bulk_get(struct device *dev, int num_rstcs,
 			     struct reset_control_bulk_data *rstcs,
 			     enum reset_control_flags flags)
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 9c391cf0c82298a0..384273ec0c7cbef7 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -90,6 +90,8 @@ struct reset_control *__fwnode_reset_control_get(struct fwnode_handle *fwnode,
 				     const char *id, int index, enum reset_control_flags flags);
 struct reset_control *__reset_control_get(struct device *dev, const char *id,
 					  int index, enum reset_control_flags flags);
+struct reset_control *reset_control_get_from_provider_exclusive(
+				const struct fwnode_reference_args *args);
 void reset_control_put(struct reset_control *rstc);
 int __reset_control_bulk_get(struct device *dev, int num_rstcs,
 			     struct reset_control_bulk_data *rstcs,
@@ -173,6 +175,12 @@ static inline struct reset_control *__reset_control_get(
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
 
+static inline struct reset_control *reset_control_get_from_provider_exclusive(
+				const struct fwnode_reference_args *args)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
 static inline int
 reset_control_bulk_reset(int num_rstcs, struct reset_control_bulk_data *rstcs)
 {
-- 
2.43.0


