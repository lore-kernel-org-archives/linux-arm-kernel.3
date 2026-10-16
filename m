Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143A2CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wi/gi4pFCsN4gsfeRMZzo4S7LYQi9KItq6OrK3DEYx0=; b=poGh86ceaOLwClEyFeb7p6ES8M
	fk3Hyfoc/zgJ5gQqdJ7xr1IViEXICjql4EJwMStrME0g+/M8+GOpR54PxeKF/wl20qdtetOxNnYMD
	S0bpE1Qz2GTxnIvPkEwc3xasudJS4ShNYKqcI8BJarBoy9yOJBEvxT65szqJ03ZZUYeWMJtQcvPco
	9KsQTRbHsqK/ZBlMwFCXAWZ82fKBy4m0k/EFd7sPLYngzw5APh/gYhWhNe1gPMqVk7+aa41a1r7Zm
	t0hFJeTOriCTAF5wFCTXnXCMWobkflg7SoVTKONH2wLQJVjJ+7eYLnX6M4STQyc51C8GRUigsmGgr
	MztVEkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkIC-00000003LAl-48Vk;
	Fri, 16 Oct 2026 15:56:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkI8-00000003L7v-2ZA5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:56:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 113F26020F;
	Fri, 16 Oct 2026 15:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA47D1F000C5;
	Fri, 16 Oct 2026 15:56:14 +0000 (UTC)
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
Subject: [PATCH v4 3/8] reset: Extract __reset_control_get_from_provider()
Date: Fri, 16 Oct 2026 17:55:42 +0200
Message-ID: <7df36f036d72403260a51491cd6c3d387f0dfed7.1792163045.git.geert+renesas@glider.be>
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

Extract the code to create a reset_control structure from a given
provider into its own function, so it can be reused later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v4:
  - Keep RESET_CONTROL_FLAGS_BIT_OPTIONAL clearing in
    __fwnode_reset_control_get(),
  - Return directly instead of assigning to a local variable, letting us
    drop the latter and simplify scoped_guard() to plain guard(),
  - Add Reviewed-by,

v3:
  - New.
---
 drivers/reset/core.c | 85 +++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09b270..0e11f4c81c10d601 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1135,6 +1135,49 @@ __reset_find_rcdev(const struct fwnode_reference_args *args, bool gpio_fallback)
 	return NULL;
 }
 
+static struct reset_control *
+__reset_control_get_from_provider(const struct fwnode_reference_args *args,
+				  struct fwnode_handle *consumer, int index,
+				  bool gpio_fallback,
+				  enum reset_control_flags flags)
+{
+	struct reset_controller_dev *rcdev;
+	int rstc_id = -EINVAL;
+
+	guard(mutex)(&reset_list_mutex);
+
+	rcdev = __reset_find_rcdev(args, gpio_fallback);
+	if (!rcdev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (WARN_ON(args->nargs != rcdev->fwnode_reset_n_cells))
+		return ERR_PTR(-EINVAL);
+
+	if (rcdev->of_xlate && is_of_node(consumer)) {
+		struct device_node *np = to_of_node(consumer);
+		struct of_phandle_args of_args;
+		int ret;
+
+		ret = of_parse_phandle_with_args(np,
+					 gpio_fallback ? "reset-gpios" : "resets",
+					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
+					 gpio_fallback ? 0 : index,
+					 &of_args);
+		if (ret)
+			return ERR_PTR(ret);
+
+		rstc_id = rcdev->of_xlate(rcdev, &of_args);
+		of_node_put(of_args.np);
+	} else if (rcdev->fwnode_xlate) {
+		rstc_id = rcdev->fwnode_xlate(rcdev, args);
+	}
+	if (rstc_id < 0)
+		return ERR_PTR(rstc_id);
+
+	guard(mutex)(&rcdev->lock);
+	return __reset_control_get_internal(rcdev, rstc_id, flags);
+}
+
 struct reset_control *
 __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int index,
 			   enum reset_control_flags flags)
@@ -1142,10 +1185,7 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 	bool gpio_fallback = false;
 	struct reset_control *rstc = ERR_PTR(-EINVAL);
-	struct reset_controller_dev *rcdev;
 	struct fwnode_reference_args args;
-	struct of_phandle_args of_args;
-	int rstc_id = -EINVAL;
 	int ret;
 
 	if (!fwnode)
@@ -1185,46 +1225,11 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 		}
 	}
 
-	guard(mutex)(&reset_list_mutex);
-
-	rcdev = __reset_find_rcdev(&args, gpio_fallback);
-	if (!rcdev) {
-		rstc = ERR_PTR(-EPROBE_DEFER);
-		goto out_put;
-	}
-
-	if (WARN_ON(args.nargs != rcdev->fwnode_reset_n_cells)) {
-		rstc = ERR_PTR(-EINVAL);
-		goto out_put;
-	}
-
-	if (rcdev->of_xlate && is_of_node(fwnode)) {
-		ret = of_parse_phandle_with_args(to_of_node(fwnode),
-					 gpio_fallback ? "reset-gpios" : "resets",
-					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
-					 gpio_fallback ? 0 : index,
-					 &of_args);
-		if (ret) {
-			rstc = ERR_PTR(ret);
-			goto out_put;
-		}
-
-		rstc_id = rcdev->of_xlate(rcdev, &of_args);
-		of_node_put(of_args.np);
-	} else if (rcdev->fwnode_xlate) {
-		rstc_id = rcdev->fwnode_xlate(rcdev, &args);
-	}
-	if (rstc_id < 0) {
-		rstc = ERR_PTR(rstc_id);
-		goto out_put;
-	}
-
 	flags &= ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 
-	scoped_guard(mutex, &rcdev->lock)
-		rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
+	rstc = __reset_control_get_from_provider(&args, fwnode, index,
+						 gpio_fallback, flags);
 
-out_put:
 	fwnode_handle_put(args.fwnode);
 
 	return rstc;
-- 
2.43.0


