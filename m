Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEF3FD88D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 00:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5wwOswllCgTCDAs+LOmWhWVxDwPfzx7ibhefMJUOMU=; b=mlmqPouHTrlsoNaINESqr8mcO0
	mkdbP2PNDzHAcERyAQjAKsEXKtt0Zotdtdeai4aICQ6EImPLvavbCELB7HMpjAJ7zC34BbZx9jIPO
	KVjqC9bqAsvgoa5XSyRDtIi3NSMZxJUdxjdtE1BQmHUUODBK0A/TuQ3/VGDcwJvjxARuYgujnrMTH
	MdSSxmM4IUOv+dLC8/8ZiSyf+DK6WjmeIkA36FsDCASOVx0AWZdYUT4MEuReQxnwdaKaiDaF2tICL
	w31b5m3ZJGhIUBZZGct6PDVSCHwbksaUnZeGcq43B0DG+GMminGvWJ7Yt3oll/usg8yOnL0XsOfry
	1u/OqCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07Iq-0000000AQLB-4AFy;
	Wed, 11 Mar 2026 00:19:56 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07Ik-0000000AQJ1-3yjG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 00:19:52 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82987437624so233846b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773188390; x=1773793190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5wwOswllCgTCDAs+LOmWhWVxDwPfzx7ibhefMJUOMU=;
        b=n5niGjUab32BHipOvgpfy+uyg/k7PxdDWlz4Y2Ncqvod11pwW3xfviOVdZ8H+oPEO/
         uf2rCYoEEMwT5a913VoIneZyUHLx9SGdLXaZW5rIeTFKsEmxnPpl8M8/ZW2rnYS/JD8u
         pCOSugl+CB/2v5ZIshxkg3fClWSCSivU/I9OlAf1tjzEl+J00U05xEAQGO5Wfj9lccb1
         zX6Q+4hVb19+DfTSn3OMVtTFMTxGdhtSJtJsw3fnjseplS6GYQmOaHNCyugBzU0qLtL0
         EBWstdUM1TDZFImYqk+bDf0cJ/++oxGBUVaYw2q8O5f5swiyxvfK336x6EoL+/6C+jVi
         Vzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188390; x=1773793190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h5wwOswllCgTCDAs+LOmWhWVxDwPfzx7ibhefMJUOMU=;
        b=mxgVIkgOdZtJH6tzk2LeX2NgPPifc25EUnc8CS0FIFnxgbgOyt0MDT1oz6wxA4w1JJ
         mI6W8UB0hzlcT/eTN2A5cY96tj1Uf41uZRmiKtj3loTEkV8rY9NTMBKKdCHw1nvWowzT
         3wez0M01QRJjH8yRoERB+Z3DK3u4N8huYhXARu+Nd+6hEBoMHjy0gixosJQq/wtrCEyc
         +E0pcGuJRCYUyXA8X4jQPynk/83b+REqwVCQklN+3SZMz8PhdM2ybiMlGW1RKfoUkIe3
         oPutJKkjxB51LTvuQ8yXyEJHFocqW0WqhD6adGk9ARokmUsaK6BItEpVesGcsR5RKEHf
         Yp+w==
X-Forwarded-Encrypted: i=1; AJvYcCWSgdJW5fJj04yhZAXeBvGRlgV6v3S00qg5mpJrcl3MSCXBDwSTayB1TfZR86/ZlUvyahKHe6uoutgZoHfY1i5D@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8AIQcghlm7HoHRHlYrcSHFu3F3DINGtTpgU+wJ+zvl5qTQ71+
	y6F8hWLO7P/yqcDoTh0yFT8fWBGDrz0TXYXNxGFpQ+AwTsVkCG7BfvfEL25KAKwWN7Ryd8eFMkK
	K1zWeBsw=
X-Gm-Gg: ATEYQzwd6cOinih/I2u6rBZb1YU9avliXJmnGb0WBuVqGffWDitu9dMPYggVnj2IOm/
	+stMGscieQU8XTzUwpV3zLjEQg3Hj7zavOuu14VryunEYkRrP+MdFNGJsmHe14jPHMVdIPaBxut
	rGl+19E+Tg4hn3xl0zEIeHiDIGUFKdE3rmFHDzpOHEm55Fbt82j4R1uNzrBBBoW4OKh9V/Ssu2i
	CSqFVLwbw07Gg+qQcGk/a1ccVR/Ouln2MmRKlT3sGTbgV+n/9cJRNV+2FE8d6RJQtEfetNHlr4b
	XGlCRmTbul5cq7uFvuxBT6ZOkvVGJ1MEL5eX5mVLfOmM2ucl538aEQxLwdZOoSxz5lJC17yqB0X
	WQtdDodrPJ13nSwjRFZ9aKtX/5Xahwm/27qMDbC0/4QgU69ihtusMsfVImau9iBXxe/FQ1ScDHk
	gk2NyqJxLuzVLOZlIxDxxm
X-Received: by 2002:a05:6a00:178e:b0:827:2d7b:5038 with SMTP id d2e1a72fcca58-829e3ef8fafmr4682544b3a.5.1773188389865;
        Tue, 10 Mar 2026 17:19:49 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2b34sm453256b3a.3.2026.03.10.17.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:19:49 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Tue, 10 Mar 2026 17:19:24 -0700
Subject: [PATCH 2/3] pmdomain: core: add support for
 power-domains-child-ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-topic-lpm-pmdomain-child-ids-v1-2-5361687a18ff@baylibre.com>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
In-Reply-To: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev-53144
X-Developer-Signature: v=1; a=openpgp-sha256; l=8594; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=4oxBL1nK08FLRbDWU9wkPzZS7L2lwxUdKpRD7zqmMz8=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBpsLUikF1gdU810zlXWY9fnICiVhRRew4IHekny
 2mQCGxcelOJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCabC1IgAKCRBZNxia0/vG
 ZZsGD/98WdtRS+muBkrIKU7WHUSnXWWHnZeDc3sa3d/QxmaOm/ov9aV2HTC1k/92hxjDTzBIu9O
 PYNpPjFQqxreSDudc/LBVRq7AwGDtwSWvAzY2xujxXwm+KZOCcanpZL5JAIbVE0HFQmDVjKh4xC
 1WXSneL6l1z+nvlJqu20HjRRMgp6TOrYH5cZkPujJnJ/EIXqqt6OIGeZrgZvFCoiVoYTVksv5Gy
 qfNURfnvExrScPbg9NnFYPW37IDCcs/Kwy/k/9vaUkRZKMk9wZSR02mI5DXEX4V+nxQ9S4Id5sm
 XICVhlHhzwvyJ3zUqHtfqsPOTewIoMH6EGgTK97SVVu4AL3wEolO25He1ZlIv4tkiJpB84nfFmf
 rA7gJUXddX4APrOzZcUk9o7zFjk3URR7nvnu0l/MgcqhGkdKjGitG5/6hvSZ/2OvDoZjuSZts48
 06FyydDM5bSyuFEFhob+tC6toxLJVccN27xtwb+JwcIXXJkk1H7+cewpMomtztWjwGfimaEnLp0
 1Ay3HYpla6FTUctSTMmnKsVc6D4vBkPpI3JklZKTWu4RdHKAUoo+QMCe7eGUqEpkQRSzXTnW/0H
 DxP6Uk2bYi8fk0rmRVIFQudPXMbDq32zYA5liIglgZ6TDJ87QZqB92C2pDeSiyqg6bG4voLTu6M
 U5oe+I0yp4rrJbA==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_171951_001319_D3C72398 
X-CRM114-Status: GOOD (  21.59  )
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

Currently, PM domains can only support hierarchy for simple
providers (e.g. ones with #power-domain-cells = 0).

Add support for oncell providers as well by adding a new property
`power-domains-child-ids` to describe the parent/child relationship.

For example, an SCMI PM domain provider has multiple domains, each of
which might be a child of diffeent parent domains. In this example,
the parent domains are MAIN_PD and WKUP_PD:

    scmi_pds: protocol@11 {
        reg = <0x11>;
        #power-domain-cells = <1>;
        power-domains = <&MAIN_PD>, <&WKUP_PD>;
        power-domains-child-ids = <15>, <19>;
    };

With this example using the new property, SCMI PM domain 15 becomes a
child domain of MAIN_PD, and SCMI domain 19 becomes a child domain of
WKUP_PD.

To support this feature, add two new core functions

- of_genpd_add_child_ids()
- of_genpd_remove_child_ids()

which can be called by pmdomain providers to add/remove child domains
if they support the new property power-domains-child-ids.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/core.c   | 169 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  16 ++++++++++++++++
 2 files changed, 185 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 61c2277c9ce3..acb45dd540b7 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2909,6 +2909,175 @@ static struct generic_pm_domain *genpd_get_from_provider(
 	return genpd;
 }
 
+/**
+ * of_genpd_add_child_ids() - Parse power-domains-child-ids property
+ * @np: Device node pointer associated with the PM domain provider.
+ * @data: Pointer to the onecell data associated with the PM domain provider.
+ *
+ * Parse the power-domains and power-domains-child-ids properties to establish
+ * parent-child relationships for PM domains. The power-domains property lists
+ * parent domains, and power-domains-child-ids lists which child domain IDs
+ * should be associated with each parent.
+ *
+ * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
+ */
+int of_genpd_add_child_ids(struct device_node *np,
+			   struct genpd_onecell_data *data)
+{
+	struct of_phandle_args parent_args;
+	struct generic_pm_domain *parent_genpd, *child_genpd;
+	struct of_phandle_iterator it;
+	const struct property *prop;
+	const __be32 *item;
+	u32 child_id;
+	int ret;
+
+	/* Check if both properties exist */
+	if (of_count_phandle_with_args(np, "power-domains", "#power-domain-cells") <= 0)
+		return -ENOENT;
+
+	prop = of_find_property(np, "power-domains-child-ids", NULL);
+	if (!prop)
+		return -ENOENT;
+
+	item = of_prop_next_u32(prop, NULL, &child_id);
+
+	/* Iterate over power-domains phandles and power-domains-child-ids in lockstep */
+	of_for_each_phandle(&it, ret, np, "power-domains", "#power-domain-cells", 0) {
+		if (!item) {
+			pr_err("power-domains-child-ids shorter than power-domains for %pOF\n", np);
+			ret = -EINVAL;
+			goto err_put_node;
+		}
+
+		/*
+		 * Fill parent_args from the iterator. it.node is released by
+		 * the next of_phandle_iterator_next() call at the top of the
+		 * loop, or by the of_node_put() on the error path below.
+		 */
+		parent_args.np = it.node;
+		parent_args.args_count = of_phandle_iterator_args(&it, parent_args.args,
+								  MAX_PHANDLE_ARGS);
+
+		/* Get the parent domain */
+		parent_genpd = genpd_get_from_provider(&parent_args);
+		if (IS_ERR(parent_genpd)) {
+			pr_err("Failed to get parent domain for %pOF: %ld\n",
+			       np, PTR_ERR(parent_genpd));
+			ret = PTR_ERR(parent_genpd);
+			goto err_put_node;
+		}
+
+		/* Validate child ID is within bounds */
+		if (child_id >= data->num_domains) {
+			pr_err("Child ID %u out of bounds (max %u) for %pOF\n",
+			       child_id, data->num_domains - 1, np);
+			ret = -EINVAL;
+			goto err_put_node;
+		}
+
+		/* Get the child domain */
+		child_genpd = data->domains[child_id];
+		if (!child_genpd) {
+			pr_err("Child domain %u is NULL for %pOF\n", child_id, np);
+			ret = -EINVAL;
+			goto err_put_node;
+		}
+
+		/* Establish parent-child relationship */
+		ret = genpd_add_subdomain(parent_genpd, child_genpd);
+		if (ret) {
+			pr_err("Failed to add child domain %u to parent in %pOF: %d\n",
+			       child_id, np, ret);
+			goto err_put_node;
+		}
+
+		pr_debug("Added child domain %u (%s) to parent %s for %pOF\n",
+			 child_id, child_genpd->name, parent_genpd->name, np);
+
+		item = of_prop_next_u32(prop, item, &child_id);
+	}
+
+	/* of_for_each_phandle returns -ENOENT at natural end-of-list */
+	if (ret && ret != -ENOENT)
+		return ret;
+
+	/* All power-domains phandles were consumed; check for trailing child IDs */
+	if (item) {
+		pr_err("power-domains-child-ids longer than power-domains for %pOF\n", np);
+		return -EINVAL;
+	}
+
+	return 0;
+
+err_put_node:
+	of_node_put(it.node);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_genpd_add_child_ids);
+
+/**
+ * of_genpd_remove_child_ids() - Remove parent-child PM domain relationships
+ * @np: Device node pointer associated with the PM domain provider.
+ * @data: Pointer to the onecell data associated with the PM domain provider.
+ *
+ * Reverses the effect of of_genpd_add_child_ids() by parsing the same
+ * power-domains and power-domains-child-ids properties and calling
+ * pm_genpd_remove_subdomain() for each established relationship.
+ *
+ * Returns 0 on success, -ENOENT if properties don't exist, or negative error
+ * code on failure.
+ */
+int of_genpd_remove_child_ids(struct device_node *np,
+			   struct genpd_onecell_data *data)
+{
+	struct of_phandle_args parent_args;
+	struct generic_pm_domain *parent_genpd, *child_genpd;
+	struct of_phandle_iterator it;
+	const struct property *prop;
+	const __be32 *item;
+	u32 child_id;
+	int ret;
+
+	/* Check if both properties exist */
+	if (of_count_phandle_with_args(np, "power-domains", "#power-domain-cells") <= 0)
+		return -ENOENT;
+
+	prop = of_find_property(np, "power-domains-child-ids", NULL);
+	if (!prop)
+		return -ENOENT;
+
+	item = of_prop_next_u32(prop, NULL, &child_id);
+
+	of_for_each_phandle(&it, ret, np, "power-domains", "#power-domain-cells", 0) {
+		if (!item)
+			break;
+
+		parent_args.np = it.node;
+		parent_args.args_count = of_phandle_iterator_args(&it, parent_args.args,
+								  MAX_PHANDLE_ARGS);
+
+		if (child_id >= data->num_domains || !data->domains[child_id]) {
+			item = of_prop_next_u32(prop, item, &child_id);
+			continue;
+		}
+
+		parent_genpd = genpd_get_from_provider(&parent_args);
+		if (IS_ERR(parent_genpd)) {
+			item = of_prop_next_u32(prop, item, &child_id);
+			continue;
+		}
+
+		child_genpd = data->domains[child_id];
+		pm_genpd_remove_subdomain(parent_genpd, child_genpd);
+
+		item = of_prop_next_u32(prop, item, &child_id);
+	}
+
+	return (ret == -ENOENT) ? 0 : ret;
+}
+EXPORT_SYMBOL_GPL(of_genpd_remove_child_ids);
+
 /**
  * of_genpd_add_device() - Add a device to an I/O PM domain
  * @genpdspec: OF phandle args to use for look-up PM domain
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index f67a2cb7d781..b44615d79af6 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -465,6 +465,10 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
 int of_genpd_parse_idle_states(struct device_node *dn,
 			       struct genpd_power_state **states, int *n);
 void of_genpd_sync_state(struct device_node *np);
+int of_genpd_add_child_ids(struct device_node *np,
+			   struct genpd_onecell_data *data);
+int of_genpd_remove_child_ids(struct device_node *np,
+			      struct genpd_onecell_data *data);
 
 int genpd_dev_pm_attach(struct device *dev);
 struct device *genpd_dev_pm_attach_by_id(struct device *dev,
@@ -534,6 +538,18 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
+
+static inline int of_genpd_add_child_ids(struct device_node *np,
+					 struct genpd_onecell_data *data)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int of_genpd_remove_child_ids(struct device_node *np,
+					    struct genpd_onecell_data *data)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_PM_GENERIC_DOMAINS_OF */
 
 #ifdef CONFIG_PM

-- 
2.51.0


