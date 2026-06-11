Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44E4CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=483PdNicSigRzALmSgzGeTpWKhI3+Z71En6T7EqR2LI=; b=vEYEk0aJ6+l5zxYKA086xHCUNF
	758nm1DLch5MX4gARbjznbpnFjvEl1H4kU1zK3Xka+QOiOIdJj4gTPKR810bdNRYqjHLQD4OjtbXX
	z0hvj5qjfLdn1YUdfuNFlFU7cnmQw6O+8xKIWZ8HCQrOhX6MhfaiPU9O6yJ5nDtGOp8o48P08xoPT
	vWO9XNtG2mvCaBovAnJloUpj1XLxH06qpZwHWb25qk+OnzCLkAw3vu0yIL/bTzXt63VRUc7NFOyaI
	pkinJrQNTwMFiudN8Cgv0EK7hyS4Q5SaMLYtMDb6eGM6tbSuZ9/0XtjBOJAsO1adHXxyjnlDKu07j
	7si8Sb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3G-00000009Svz-0u4V;
	Thu, 11 Jun 2026 13:02:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3F-00000009Suf-2C8u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:02:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09BE74026D;
	Thu, 11 Jun 2026 13:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF1D1F00898;
	Thu, 11 Jun 2026 13:02:25 +0000 (UTC)
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
Subject: [PATCH/RFC 1/9] firmware: arm_scmi: Replace scmi_power_proto_ops.name_get() by .info_get()
Date: Thu, 11 Jun 2026 15:02:05 +0200
Message-ID: <4957c0d80d2d30ee21a0f6dd596015f57965340d.1781171705.git.geert+renesas@glider.be>
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

The SCMI power domain protocol operations structure does not provide a
.info_get() method, unlike most other protocols.  Instead, it provides
a .name_get() method.

Replace the .name_get() method by the .info_get() method, to increase
uniformity, and to prepare for returning more information.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/power.c     | 17 ++++++++---------
 drivers/pmdomain/arm/scmi_pm_domain.c |  9 ++++++++-
 include/linux/scmi_protocol.h         | 10 +++++++---
 3 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
index 28ef63a4ecc2e1df..a00f7c298efb74f9 100644
--- a/drivers/firmware/arm_scmi/power.c
+++ b/drivers/firmware/arm_scmi/power.c
@@ -63,7 +63,7 @@ struct power_dom_info {
 	bool state_set_sync;
 	bool state_set_async;
 	bool state_set_notify;
-	char name[SCMI_MAX_STR_SIZE];
+	struct scmi_power_domain_info info;
 };
 
 struct scmi_power_info {
@@ -132,7 +132,7 @@ scmi_power_domain_attributes_get(const struct scmi_protocol_handle *ph,
 				SUPPORTS_STATE_SET_NOTIFY(flags);
 		dom_info->state_set_async = SUPPORTS_STATE_SET_ASYNC(flags);
 		dom_info->state_set_sync = SUPPORTS_STATE_SET_SYNC(flags);
-		strscpy(dom_info->name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
+		strscpy(dom_info->info.name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
 	}
 	ph->xops->xfer_put(ph, t);
 
@@ -143,7 +143,7 @@ scmi_power_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	if (!ret && PROTOCOL_REV_MAJOR(ph->version) >= 0x3 &&
 	    SUPPORTS_EXTENDED_NAMES(flags)) {
 		ph->hops->extended_name_get(ph, POWER_DOMAIN_NAME_GET,
-					    domain, NULL, dom_info->name,
+					    domain, NULL, dom_info->info.name,
 					    SCMI_MAX_STR_SIZE);
 	}
 
@@ -199,23 +199,22 @@ static int scmi_power_num_domains_get(const struct scmi_protocol_handle *ph)
 	return pi->num_domains;
 }
 
-static const char *
-scmi_power_name_get(const struct scmi_protocol_handle *ph,
-		    u32 domain)
+static const struct scmi_power_domain_info *
+scmi_power_info_get(const struct scmi_protocol_handle *ph, u32 domain)
 {
 	struct scmi_power_info *pi = ph->get_priv(ph);
 	struct power_dom_info *dom;
 
 	if (domain >= pi->num_domains)
-		return "unknown";
+		return NULL;
 
 	dom = pi->dom_info + domain;
-	return dom->name;
+	return &dom->info;
 }
 
 static const struct scmi_power_proto_ops power_proto_ops = {
 	.num_domains_get = scmi_power_num_domains_get,
-	.name_get = scmi_power_name_get,
+	.info_get = scmi_power_info_get,
 	.state_set = scmi_power_state_set,
 	.state_get = scmi_power_state_get,
 };
diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 3d73aef21d2f9942..965592e828741b11 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -76,8 +76,15 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		return -ENOMEM;
 
 	for (i = 0; i < num_domains; i++, scmi_pd++) {
+		const struct scmi_power_domain_info *info;
 		u32 state;
 
+		info = power_ops->info_get(ph, i);
+		if (!info) {
+			dev_warn(dev, "failed to get info for domain %d\n", i);
+			continue;
+		}
+
 		if (power_ops->state_get(ph, i, &state)) {
 			dev_warn(dev, "failed to get state for domain %d\n", i);
 			continue;
@@ -93,7 +100,7 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 		scmi_pd->domain = i;
 		scmi_pd->ph = ph;
-		scmi_pd->name = power_ops->name_get(ph, i);
+		scmi_pd->name = info->name;
 		scmi_pd->genpd.name = scmi_pd->name;
 		scmi_pd->genpd.power_off = scmi_pd_power_off;
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa4fa8..1c17515ba45d1fd4 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -191,19 +191,23 @@ struct scmi_perf_proto_ops {
 	enum scmi_power_scale (*power_scale_get)(const struct scmi_protocol_handle *ph);
 };
 
+struct scmi_power_domain_info {
+	char name[SCMI_MAX_STR_SIZE];
+};
+
 /**
  * struct scmi_power_proto_ops - represents the various operations provided
  *	by SCMI Power Protocol
  *
  * @num_domains_get: get the count of power domains provided by SCMI
- * @name_get: gets the name of a power domain
+ * @info_get: gets the information of the specified power domain
  * @state_set: sets the power state of a power domain
  * @state_get: gets the power state of a power domain
  */
 struct scmi_power_proto_ops {
 	int (*num_domains_get)(const struct scmi_protocol_handle *ph);
-	const char *(*name_get)(const struct scmi_protocol_handle *ph,
-				u32 domain);
+	const struct scmi_power_domain_info __must_check *(*info_get)
+		(const struct scmi_protocol_handle *ph, u32 domain);
 #define SCMI_POWER_STATE_TYPE_SHIFT	30
 #define SCMI_POWER_STATE_ID_MASK	(BIT(28) - 1)
 #define SCMI_POWER_STATE_PARAM(type, id) \
-- 
2.43.0


