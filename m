Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4314C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqqQfmGbY4Cj4cCuxB/rRRIjWVsYvDtJYHIxf77UTI8=; b=C/iy6RH2/Yj6DjZowc1gPVpSW1
	sEe+y5DVEieWGbTJYrpFE1QAuMTvTp71/2GbTzcfSmVKh0AJm9LmxUeG23vApBz5CEkuUJKGlsNzj
	TOZUNpuRlHmxa4qpOthgOQNAQirzUP3Cg7ueLeY5VXkKRjrTccG4CB9JxGG6pAfLtcfsQCkAfz43E
	duh/50UjOXKp+Qe+nsE8MiOTR2B8QKARCyYjjdgcWFlpV9a5LpOHkwLTP8cFrOne5f/1+KlH2X0xd
	V74U0cWygd7xJDaxGxHAuojo1Ln4GNgjWwMA8qdZ0Rx7eNId7pMPvWzY5f4Y9C/bQmPQUbaEWS9dP
	VM1kKMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jAY-0000000EV86-3rBL;
	Wed, 02 Sep 2026 11:30:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jAX-0000000EV6c-0kzg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:30:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EACF940595;
	Wed,  2 Sep 2026 11:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625DA1F000E9;
	Wed,  2 Sep 2026 11:30:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
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
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clegoffic@baylibre.com>
Cc: devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 06/12] reset: Extract __reset_control_get_from_provider()
Date: Wed,  2 Sep 2026 13:29:22 +0200
Message-ID: <2824c50f77aa287a3555533e4b9760109aae1741.1788338320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
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
---
v3:
  - New.
---
 drivers/reset/core.c | 92 ++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 42 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09b270..8af7cd2e8a5029df 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1135,6 +1135,54 @@ __reset_find_rcdev(const struct fwnode_reference_args *args, bool gpio_fallback)
 	return NULL;
 }
 
+static struct reset_control *
+__reset_control_get_from_provider(const struct fwnode_reference_args *args,
+				  struct fwnode_handle *consumer, int index,
+				  bool gpio_fallback,
+				  enum reset_control_flags flags)
+{
+	struct reset_control *rstc = ERR_PTR(-EINVAL);
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
+	flags &= ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
+
+	scoped_guard(mutex, &rcdev->lock)
+		rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
+
+	return rstc;
+}
+
 struct reset_control *
 __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int index,
 			   enum reset_control_flags flags)
@@ -1142,10 +1190,7 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 	bool optional = flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 	bool gpio_fallback = false;
 	struct reset_control *rstc = ERR_PTR(-EINVAL);
-	struct reset_controller_dev *rcdev;
 	struct fwnode_reference_args args;
-	struct of_phandle_args of_args;
-	int rstc_id = -EINVAL;
 	int ret;
 
 	if (!fwnode)
@@ -1185,46 +1230,9 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
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
-	flags &= ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
-
-	scoped_guard(mutex, &rcdev->lock)
-		rstc = __reset_control_get_internal(rcdev, rstc_id, flags);
+	rstc = __reset_control_get_from_provider(&args, fwnode, index,
+						 gpio_fallback, flags);
 
-out_put:
 	fwnode_handle_put(args.fwnode);
 
 	return rstc;
-- 
2.43.0


