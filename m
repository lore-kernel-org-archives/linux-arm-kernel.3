Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE3AD6CFAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHt+mmH4C5nxGUCfgNrBDFG/vUcO3dbURh+yi1mxNm8=; b=zlURvP49K9kctGfN45/DDctIT1
	Z35Xo5OSVgzONW1F9RvqU4U59d3E35XvL21iNxCihyfF8DnnqF1Cov47E5Q5Fz4DOzX20BafwxS1E
	kALkXGUqeHNrfZO/FopmTZuwvbkD312kI81kYH/k5/cUlr/x5isSOCJWjfvQ3PRA9MxAfI5UXFmJk
	kUD6oqhNh45kYQECEoXluYoYGF3tlCItC/1COQ3sra0F1nXCWIv7+EHn0BSvl7IzvvSmE+BZmJr7E
	ZIeCDP2yegkX9oRTWyH0FVFG8TNcdF13sTU3q3d4vqP2n+jp3BG3CP6f3A04THNQW1bc6cCaOuXqX
	qAx7vqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5ke-00000007x4X-0kOE;
	Fri, 23 Jan 2026 01:14:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj5kX-00000007x2a-2Mgn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 01:14:11 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso946747b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 17:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769130848; x=1769735648; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHt+mmH4C5nxGUCfgNrBDFG/vUcO3dbURh+yi1mxNm8=;
        b=cckp9s/pFxMt2OWWRZn45uJh2F3Km/O3uKqVDghTymrJ07VSc/RUelXowKBYrHDAPJ
         5GMrKtCYicIWeD5apgolopl/o0LBxCJ96nCe9XgzZBq82IXun77Kn+PDmi3UQERpyCNd
         gwOxZ7QbmOtVFh+jDdXobVOn4/5CGxibaGVYvr9noHtL0Wz02o5XVCvg43FOZGC8gIZK
         unQZPqNws0uA/bLMcNTFWT2yfb7tj/DFe74x8jFL9C3i2Hv/f5FcL37/k2cffCq44KAR
         HZuCdIWbsE42lUS+CkITIZ8SGwJx7tfHxK0C2NfnhE9rrgT9oUP1KGUTWBhu05BHQv2Y
         T6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769130848; x=1769735648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aHt+mmH4C5nxGUCfgNrBDFG/vUcO3dbURh+yi1mxNm8=;
        b=VT5BjwMEM/UTu3AH92n047XaHTvvCg4UeQIOQ7t7xGAQBWe25R26yToDUW8SXcLujZ
         +9tsCL6Me5CtWSxc8V7GIiWE9aT6nioZEPyY3bSyiMfY08PrJhCMUSeFsl1Kc0MuKgd5
         hqRVOGGKlTfKAm3WuZ2b32nnn2NTPPNHSfCj0rij6zjN9qXPXuKTmDCBGgRX/E8AqS21
         EVcy/F/u9bQtypdxOk75j/0B75Ft147DlnBiKszEXrwa+R8tMT0D8qARCMkYUghagROF
         v2rvt5QGji3Bul1qb/oe4XM4+IegB13KFEB1HjJZChLnD9PPOkkZnb9qOJVzjwC30kna
         rBVg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5PNKvmeAordpKMdYEaX/sngQmpPnGuRnv655cHqzl3nghwaDiY7gCeAyoSRK93V7zyEmVW+GXYnocjbj4vq0@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg2cesG6kHXPvbsuFk0qzdhCAEe+QZO8dfjASgTlkv5EbGkXBN
	0kvlkIxC8kN+Ao0c++0Z65RRIKJjSVXKjMXmMruPManM31bRyvUHiO3UQANtsEMypEQ+naONlNu
	HmR1exNg=
X-Gm-Gg: AZuq6aJlo9q4EZoUrBcdQz/fy5jqFyH+1eiOVarcgh1IndduaycvAAwn/0IldLJjYJc
	pWTLAoAmm3s1YUIva+OfC/oZb2Gs1E6t95ZLLa0Iwn8aNrBYP5pIGGPlfkvyn/f3wMlq/d5l4C9
	OZy/HasKpPEsDlIm+Z/BVlU3GAtzb3uOUKCbzz5a6X6fAK4coG99C3DJJgOuXX5nVlyu6IMLR00
	RjpqDwWgm3oIhox+ZMV2sJfrPPav1NFVFoNFLkZaWGFzpWiOggLE0oa0at1x24G22//aB4IRBqY
	tOipQ/+d0e+hlitmAT0fhZjScW+xOg/BVcu/36Hg1PH022G/TkEWwPsY81J3j9IGstjCNA4LQU6
	zkjvFXvseCteRRnWW2B6dpGeH9xqhEeurefB7602NL8g4MsBc6wEFB8GTm6wlGKh49tsS726wIY
	UBxtv0d3fh
X-Received: by 2002:a05:6a00:228a:b0:823:ad3:4ff4 with SMTP id d2e1a72fcca58-82317e1f2fbmr995725b3a.37.1769130848424;
        Thu, 22 Jan 2026 17:14:08 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231876e5d0sm495195b3a.61.2026.01.22.17.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 17:14:07 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Thu, 22 Jan 2026 17:14:00 -0800
Subject: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
In-Reply-To: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=8104; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=lzR3NEhB2g7iCRM+bJ588/XYQ1irfnPbijYHHqE2mb0=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpcstegivFzLujdyy/XYyCoOTFhTKHJRAJ8NSZt
 PKtjt8GNvKJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaXLLXgAKCRBZNxia0/vG
 ZYTyEACh3s27sFpbfZ/ydsd8FMkRCxosg8QXT/a2xgDoeAuFNT+1jyG2LMV6Cjudi5xBIfK5o5+
 K3rCkRFQItyaH0a2LcgHP1ysn+3J+w2O9jUPpq9M/bPVLnvG0wrPPggT5UyVG7/tuHVDuXbEUym
 E3YJRv9CholjJhRnXmP/Kr3ZBnbGrol0MS9vaP5sCLYbKRZR5dysNMLxbv4Tgq3N/AKfgBfw6b3
 Q74xOX/xuxPeFQD2H2MRdkrxmo9B62WkZkuMRYVMVERQxnn2oYBHTtl0X4e8IHnR1TtQBrhFAaa
 T6YDp5ROfuR0IFTYO1JkOYl2SkaCB5FvyM+nJx6GbuWKGzcUo/QsyzdiWSSiCfe6nGkwcuvnGa3
 2wje3dW4WqQfamM80nMSj1P6vznxc55kdLF/KxoRZRw/4pZwuoHt+Xuryy6vuV40VRntvMRE10D
 OxizOhFu6oqR26Yneomed1EZP0UaI66OIqdyQVj9Rqm8ZrTeVfJ35Y3hEjpHPr1HsRFZ/Ir4kCB
 LI59eoPpfLf+zMyBvm2ycc9gabfPz64DoKuvsnoGOgbxbSb0E8AIPP1XJ1mNJoelQmFGh8L1jhO
 /txN/VKIOHIm+hyiJleWlDYBJ2VOc8zeFSqePAamWNlzSi8bg91+VSFiBVONnrg409+suH1Gu2r
 kx4s+ReBZ01uOpg==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_171409_617028_C1378A0D 
X-CRM114-Status: GOOD (  19.72  )
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

Add of_genpd_[add|remove]_subdomain_map() helper functions to support
hierarchical PM domains defined by using power-domains-map
property (c.f. nexus node maps in DT spec, section 2.5.1).

This enables PM domain providers with #power-domain-cells > 0 to
establish subdomain relationships via the power-domain-map property,
which was not previously possible.

These new helper functions:
- uses an OF helper to iterate to over entries in power-domain-map
- For each mapped entry: extracts child specifier, resolves parent phandle,
  extracts parent specifier args, and establishes subdomain relationship
- Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection

Example from k3-am62l.dtsi:

  scmi_pds: protocol@11 {
      #power-domain-cells = <1>;
      power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
                         <19 &WKUP_PD>;  /* WKUP_TIMER0 */
  };

  MAIN_PD: power-controller-main {
      #power-domain-cells = <0>;
  };

  WKUP_PD: power-controller-main {
      #power-domain-cells = <0>;
  };

This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
domain 19 to become a subdomain of WKUP_PD.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/core.c   | 160 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  16 ++++++++++++++++
 2 files changed, 176 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index bf82775f6a67..cee7fbbda829 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3556,6 +3556,166 @@ static struct device_driver genpd_provider_drv = {
 	.suppress_bind_attrs = true,
 };
 
+/**
+ * of_genpd_remove_subdomain_map - Remove subdomain relationships from map
+ *
+ * @np: pointer to parent node containing map property
+ * @data: pointer to PM domain onecell data
+ *
+ * Iterate over entries in a power-domain-map, and remove the subdomain
+ * relationships that were previously established by of_genpd_add_subdomain_map().
+ * This allows cleanup during driver removal or error handling.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int of_genpd_remove_subdomain_map(struct device_node *np,
+				  struct genpd_onecell_data *data)
+{
+	struct generic_pm_domain *genpd, *parent_genpd;
+	struct of_phandle_args child_args, parent_args;
+	int index = 0;
+	int ret = 0;
+	u32 child_index;
+
+	if (!np || !data)
+		return -EINVAL;
+
+	/* Iterate through power-domain-map entries using the OF helper */
+	while (!of_parse_map_iter(np, "power-domain", &index,
+				   &child_args, &parent_args)) {
+		/* Extract the child domain index from the child specifier */
+		if (child_args.args_count < 1) {
+			of_node_put(parent_args.np);
+			continue;
+		}
+		child_index = child_args.args[0];
+
+		/* Validate child domain index */
+		if (child_index >= data->num_domains) {
+			of_node_put(parent_args.np);
+			continue;
+		}
+
+		genpd = data->domains[child_index];
+		if (!genpd) {
+			of_node_put(parent_args.np);
+			continue;
+		}
+
+		/* Get parent power domain from provider */
+		mutex_lock(&gpd_list_lock);
+
+		parent_genpd = genpd_get_from_provider(&parent_args);
+		if (IS_ERR(parent_genpd)) {
+			mutex_unlock(&gpd_list_lock);
+			of_node_put(parent_args.np);
+			dev_warn(&genpd->dev, "failed to get parent domain for removal\n");
+			continue;
+		}
+
+		/* Remove subdomain relationship */
+		ret = pm_genpd_remove_subdomain(parent_genpd, genpd);
+		mutex_unlock(&gpd_list_lock);
+		of_node_put(parent_args.np);
+
+		if (ret)
+			dev_warn(&genpd->dev, "failed to remove as subdomain of %s: %d\n",
+				 parent_genpd->name, ret);
+		else
+			dev_dbg(&genpd->dev, "removed as subdomain of %s\n",
+				parent_genpd->name);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_genpd_remove_subdomain_map);
+
+/**
+ * of_genpd_add_subdomain_map - Parse and map child PM domains
+ *
+ * @np: pointer to parent node containing map property
+ * @data: pointer to PM domain onecell data
+ *
+ * Iterate over entries in a power-domain-map, and add them as
+ * children of the parent domain. If any child fails to be added,
+ * all previously added children are removed to maintain atomicity.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int of_genpd_add_subdomain_map(struct device_node *np,
+			       struct genpd_onecell_data *data)
+{
+	struct generic_pm_domain *genpd, *parent_genpd;
+	struct of_phandle_args child_args, parent_args;
+	int index = 0;
+	int ret = 0;
+	u32 child_index;
+
+	if (!np || !data)
+		return -EINVAL;
+
+	/* Iterate through power-domain-map entries using the OF helper */
+	while (!of_parse_map_iter(np, "power-domain", &index,
+				   &child_args, &parent_args)) {
+		/* Extract the child domain index from the child specifier */
+		if (child_args.args_count < 1) {
+			of_node_put(parent_args.np);
+			ret = -EINVAL;
+			goto cleanup;
+		}
+		child_index = child_args.args[0];
+
+		/* Validate child domain index */
+		if (child_index >= data->num_domains) {
+			of_node_put(parent_args.np);
+			pr_debug("map's child index (%u) > number of domains (%u).  Skipping.\n",
+				 child_index, data->num_domains);
+			ret = -EINVAL;
+			goto cleanup;
+		}
+
+		genpd = data->domains[child_index];
+		if (!genpd) {
+			of_node_put(parent_args.np);
+			continue;
+		}
+
+		/* Get parent power domain from provider and establish subdomain relationship */
+		mutex_lock(&gpd_list_lock);
+
+		parent_genpd = genpd_get_from_provider(&parent_args);
+		if (IS_ERR(parent_genpd)) {
+			mutex_unlock(&gpd_list_lock);
+			of_node_put(parent_args.np);
+			ret = PTR_ERR(parent_genpd);
+			dev_err(&genpd->dev, "failed to get parent domain: %d\n", ret);
+			goto cleanup;
+		}
+
+		ret = genpd_add_subdomain(parent_genpd, genpd);
+		mutex_unlock(&gpd_list_lock);
+		of_node_put(parent_args.np);
+
+		if (ret) {
+			dev_err(&genpd->dev, "failed to add as subdomain of %s: %d\n",
+				parent_genpd->name, ret);
+			goto cleanup;
+		}
+
+		dev_dbg(&genpd->dev, "added as subdomain of %s\n",
+			parent_genpd->name);
+	}
+
+	return 0;
+
+cleanup:
+	/* Remove all successfully added subdomains using the removal function */
+	pr_err("rolling back child map additions due to error: %d\n", ret);
+	of_genpd_remove_subdomain_map(np, data);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_genpd_add_subdomain_map);
+
 static int __init genpd_bus_init(void)
 {
 	int ret;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 93ba0143ca47..3baf224e4f24 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -463,6 +463,10 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
 int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
 			      const struct of_phandle_args *subdomain_spec);
 struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
+int of_genpd_add_subdomain_map(struct device_node *np,
+			       struct genpd_onecell_data *data);
+int of_genpd_remove_subdomain_map(struct device_node *np,
+				  struct genpd_onecell_data *data);
 int of_genpd_parse_idle_states(struct device_node *dn,
 			       struct genpd_power_state **states, int *n);
 void of_genpd_sync_state(struct device_node *np);
@@ -505,6 +509,18 @@ static inline int of_genpd_remove_subdomain(const struct of_phandle_args *parent
 	return -ENODEV;
 }
 
+static inline int of_genpd_add_subdomain_map(struct device_node *np,
+					     struct genpd_onecell_data *data)
+{
+	return -ENODEV;
+}
+
+static inline int of_genpd_remove_subdomain_map(struct device_node *np,
+						struct genpd_onecell_data *data)
+{
+	return -ENODEV;
+}
+
 static inline int of_genpd_parse_idle_states(struct device_node *dn,
 			struct genpd_power_state **states, int *n)
 {

-- 
2.51.0


