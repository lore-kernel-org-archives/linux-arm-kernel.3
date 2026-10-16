Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C885ACCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xN+XSWK87KFtkICI8Wsa8m1EHIp6ZjYiuAwo6u+zjis=; b=SFiNdKrif/X9Wg9QOeJFi1+d8H
	EaEfV7T8VM98PtS2SQTL/dKdCLM+oh4/F4odzjf3mJMhcNdHsRNs5fJkMai/Qm0PZMWliLuD5Zf2D
	sReLmFSqJVWdVD1NCzsPTgCKjuU8enTbqXgHs6Xf3KhqOETcMP+noi2AFwjZrfX1P7zBxFTzdN1Pl
	bOs4R9O+XQUajenskWP9nioJjSb6eUTUK+owKqdz30tH8IXTWE69/jjrujp4yEoSSkp4WjJaVthHb
	0xDB3T20rC0tYZeM0VV2RJUpo1ANrQtZsOmyyxKqjDsJAtQEJrJUnsUmoOLN916O2xbMJwXhZ8KT7
	B9+cWs/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkIQ-00000003LLC-1bWS;
	Fri, 16 Oct 2026 15:56:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkIO-00000003LJf-19M6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:56:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B81042E61;
	Fri, 16 Oct 2026 15:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005711F000C5;
	Fri, 16 Oct 2026 15:56:30 +0000 (UTC)
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
Subject: [PATCH v4 6/8] pmdomain: Make genpd_get_from_provider() public
Date: Fri, 16 Oct 2026 17:55:45 +0200
Message-ID: <e3b9d76d5b4a254d561b6e734423063e94225a28.1792163045.git.geert+renesas@glider.be>
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

Unlike the corresponding function in the clock subsystem[1],
genpd_get_from_provider() is private, and thus cannot be used by PM
Domain drivers.

Make it public, so the R-Car X5H Module Controller driver can call it.
Add an "of_"-prefix for consistency with public genpd function naming.

[1] of_clk_get_from_provider().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Improve patch description,

v3:
  - Add "of_" prefix,

v2:
  - No changes.
---
 drivers/pmdomain/core.c   | 22 +++++++++++-----------
 include/linux/pm_domain.h |  7 +++++++
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 88c886814a5b9da3..4136368456d994f7 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3008,7 +3008,7 @@ void of_genpd_del_provider(struct device_node *np)
 EXPORT_SYMBOL_GPL(of_genpd_del_provider);
 
 /**
- * genpd_get_from_provider() - Look-up PM domain
+ * of_genpd_get_from_provider() - Look-up PM domain
  * @genpdspec: OF phandle args to use for look-up
  *
  * Looks for a PM domain provider under the node specified by @genpdspec and if
@@ -3018,8 +3018,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
  * Returns a valid pointer to struct generic_pm_domain on success or ERR_PTR()
  * on failure.
  */
-static struct generic_pm_domain *genpd_get_from_provider(
-					const struct of_phandle_args *genpdspec)
+struct generic_pm_domain *of_genpd_get_from_provider(const struct of_phandle_args *genpdspec)
 {
 	struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
 	struct of_genpd_provider *provider;
@@ -3041,6 +3040,7 @@ static struct generic_pm_domain *genpd_get_from_provider(
 
 	return genpd;
 }
+EXPORT_SYMBOL_GPL(of_genpd_get_from_provider);
 
 /**
  * of_genpd_add_child_ids() - Parse power-domains-child-ids property
@@ -3113,7 +3113,7 @@ int of_genpd_add_child_ids(struct device_node *np,
 			goto err_unwind;
 
 		/* Get the parent domain */
-		parent_genpd = genpd_get_from_provider(&parent_args);
+		parent_genpd = of_genpd_get_from_provider(&parent_args);
 		of_node_put(parent_args.np);
 		if (IS_ERR(parent_genpd)) {
 			pr_err("Failed to get parent domain for %pOF: %ld\n",
@@ -3196,7 +3196,7 @@ int of_genpd_remove_child_ids(struct device_node *np,
 		if (ret)
 			continue;
 
-		parent_genpd = genpd_get_from_provider(&parent_args);
+		parent_genpd = of_genpd_get_from_provider(&parent_args);
 		of_node_put(parent_args.np);
 		if (IS_ERR(parent_genpd))
 			continue;
@@ -3227,7 +3227,7 @@ int of_genpd_add_device(const struct of_phandle_args *genpdspec, struct device *
 
 	mutex_lock(&gpd_list_lock);
 
-	genpd = genpd_get_from_provider(genpdspec);
+	genpd = of_genpd_get_from_provider(genpdspec);
 	if (IS_ERR(genpd)) {
 		ret = PTR_ERR(genpd);
 		goto out;
@@ -3259,13 +3259,13 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
 
 	mutex_lock(&gpd_list_lock);
 
-	parent = genpd_get_from_provider(parent_spec);
+	parent = of_genpd_get_from_provider(parent_spec);
 	if (IS_ERR(parent)) {
 		ret = PTR_ERR(parent);
 		goto out;
 	}
 
-	subdomain = genpd_get_from_provider(subdomain_spec);
+	subdomain = of_genpd_get_from_provider(subdomain_spec);
 	if (IS_ERR(subdomain)) {
 		ret = PTR_ERR(subdomain);
 		goto out;
@@ -3297,13 +3297,13 @@ int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
 
 	mutex_lock(&gpd_list_lock);
 
-	parent = genpd_get_from_provider(parent_spec);
+	parent = of_genpd_get_from_provider(parent_spec);
 	if (IS_ERR(parent)) {
 		ret = PTR_ERR(parent);
 		goto out;
 	}
 
-	subdomain = genpd_get_from_provider(subdomain_spec);
+	subdomain = of_genpd_get_from_provider(subdomain_spec);
 	if (IS_ERR(subdomain)) {
 		ret = PTR_ERR(subdomain);
 		goto out;
@@ -3491,7 +3491,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 		return ret;
 
 	mutex_lock(&gpd_list_lock);
-	pd = genpd_get_from_provider(&pd_args);
+	pd = of_genpd_get_from_provider(&pd_args);
 	of_node_put(pd_args.np);
 	if (IS_ERR(pd)) {
 		mutex_unlock(&gpd_list_lock);
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 14e0e346c610a9a6..d65ee8b3725c1bcb 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -467,6 +467,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 int of_genpd_add_provider_onecell(struct device_node *np,
 				  struct genpd_onecell_data *data);
 void of_genpd_del_provider(struct device_node *np);
+struct generic_pm_domain *of_genpd_get_from_provider(const struct of_phandle_args *genpdspec);
 int of_genpd_add_device(const struct of_phandle_args *args, struct device *dev);
 int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
 			   const struct of_phandle_args *subdomain_spec);
@@ -501,6 +502,12 @@ static inline int of_genpd_add_provider_onecell(struct device_node *np,
 
 static inline void of_genpd_del_provider(struct device_node *np) {}
 
+static inline struct generic_pm_domain *of_genpd_get_from_provider(
+				const struct of_phandle_args *genpdspec)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline int of_genpd_add_device(const struct of_phandle_args *args,
 				      struct device *dev)
 {
-- 
2.43.0


