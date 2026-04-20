Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005D5F5A8D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 23:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMwNLBTWs20Z4a1mhT5Vdgx1QV1o4tHwHoJ1DhdYYC0=; b=E/K1tTLNkYzt8vGxkdqqAin9mQ
	722xevKNbPamCCAPlUi143qw+42dP0KYzZjKiFfmwsR1YE00yMNcKx9+lwWaMv9cZ/T6bPrDvxnuf
	OmtO0bioJoud+HNW65r5ws0+PtWQCop417h19KnbrQk0lMVtm3gVW4Rdlv/7b72c1c5+bwX2nCyp/
	IQd7LHCbxpAP1PAKkRTMK5++wHRrE/4aaH+WBKxMsY/hl95j81gsXQePwJSWEFuQ9jk8QB1IAHeBn
	fXe/V0C21erL/Vh7SIHUoO4dB82/e9P0ZK8W6f0X+BPd9LEpKPiTghVoPrhlDv/gmTG0bFGmckpQN
	MF+rdVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEyOq-00000007qMJ-2rcN;
	Mon, 20 Apr 2026 23:51:32 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEyOk-00000007qKP-1Kic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 23:51:27 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c76b9efc299so1383506a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 16:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776729085; x=1777333885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMwNLBTWs20Z4a1mhT5Vdgx1QV1o4tHwHoJ1DhdYYC0=;
        b=yC1ujRTbcidPCApwuHWMlGI1bruo+oZ8x1ErbS/I7WwQWPcJXXJY9SuLp8DLSFfzFm
         pKdXYQwfFmY9mzh9nLHeq+rqhfY0qYdKWuGCyEqavomI63x/sIN6jiVNEoIK0a3QK35W
         +OZ4NFH2GyDiXO+DCqUCY9/96PjMSNAmeZIbuXwo3lNm2M/rDzYi8oqblq4g0XwwDzBe
         7TV0fLSqLt9+jx2r9191PIVwmtyURPEH2nTjru8S5Bdp7+Ts3BTnrE+Dlvb1X8mStl62
         yrpxxf0X6PsoCVj2KccKHgVj/AbMUZqqj6OXXXAGHPC6l3IKSQdSq2tSeKMYGeVTB41C
         hFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776729085; x=1777333885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XMwNLBTWs20Z4a1mhT5Vdgx1QV1o4tHwHoJ1DhdYYC0=;
        b=PGuK6I2OZ0TqDSHuy7LtPlRg9dKA6CsWfUSihwFXIYxbOPWpCPlQ0uacBsZq6SsCdo
         6mbxjd3qHihli7EvaLvQYiDUHfA5ir3bFH96PPQITvulbpo3HykYzLZ/QnjyXNB8o58t
         8xYUFDmGHqbZdVX8q2IgdbjVSgcLQwFwUBvgBCPTrFcUkqZoywvnqQ7/gZaiz7EhVVQY
         TLbUPnKjyu5VjZ4U+306qq0NK6iRnYAU3KOh5UVSGYFwrqurHtNdiCxK9GolHL6b56bp
         /oeQmwW1ZbvlfNHZ5t6pJm6bR+fsOcxbUbbhyHs9Zd6H3GJKdgw5KTQCo/v3nX58NItH
         8mqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qEcqx6C/7hgrtIECniSbbOILPTTjaB511qG/5hYR9RMDWNO1LR/qhAjC+kRkLNcb+fA9c2QoWhp13/NKmj0WL@lists.infradead.org
X-Gm-Message-State: AOJu0YyWdriF8jA5NLzTEvjGFFfHfh7mlv0Fxi97pw9VhTrHWzMA++ik
	blONWMYcCofz5ENkXMJ4FJkvi7OmIon5XWI2G/kUmvLRnrQiNA4hC0Z4VhmQAv/rZkbYeF5ql6I
	WW11Yf0DAzA==
X-Gm-Gg: AeBDieslkzZ2TgfOlAt56yHoCmzt50idhT3AjG0OQNe7byhQiLTOHuzBQsqXVvm6Sin
	2+xsBqzrGvjAuIOjqvMBM9UtVkryPhybqtI/3Db8trxeLwpQgceECN17pzquya+Sbf3nbkMiPyK
	5+2ip+qS/cyQhv9hxVV87Hez4PZiIcCD7rx5/Hl8eWLn+jBcjSRRry2D0jBrzQUV41WVVmjfO8F
	VLiE8Thit8Q+Jne59ubPqXDsq3iq/Lys7KKQouGtkPxI6Soo5QLmQndLhRBX2/rIKvuy/H1+rqB
	uRAN2u7nWwpsUVwfDzKIwzBSYOSa9+YvHk6bxFrW8QMQdtGhhh7R7xutkJqSFv9O0w1BjNAxOJM
	slaYq75BmzhUnYz08buzKM4Ep+hm/rXBrPHHYkTp/fuPDmLu8xVqg/Hp1qvey9zUdVmlK+SnXOs
	9PAhosF/KZVGfh3+cX1YB3rCY7q9alPw==
X-Received: by 2002:a05:6a20:4324:b0:398:c351:aa0e with SMTP id adf61e73a8af0-3a08d7aaef5mr16353897637.25.1776729085329;
        Mon, 20 Apr 2026 16:51:25 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8fcbdsm8701643a12.6.2026.04.20.16.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:51:24 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Mon, 20 Apr 2026 16:51:18 -0700
Subject: [PATCH v3 2/3] pmdomain: core: add support for
 power-domains-child-ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-topic-lpm-pmdomain-child-ids-v3-2-c2c40bef238c@baylibre.com>
References: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
In-Reply-To: <20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8659; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=AJAxCQJaWoA/4dBEUCt/1XgQiiTMcAO9mItznU/aNFk=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp5rv6vpqm0H64AdXGyGr6LuEuvzEUtEWUspmmt
 x7x7wBcYdyJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCaea7+gAKCRBZNxia0/vG
 ZaxVD/0bUSM94rccXv8PpC+2wx3taiizU8xLxUqSv0zq+L5JxFKRxGolyFoYnm6mH88UVGkJVAC
 fthcHrH3KOuNSjjzaIAjVsHMLrSWP5oxdmDw88EejlrkqcgIu1QG5eXHN5OzH71m79XT3Gmfa9E
 QwsMsty5CXxzFUo7VqnHTpMWdbhxapy4dOdM0uCFp9a6/q74lMMcH2v5YSeqGWpYgRTyTTlDIzR
 DYTfXnszo4pQPa1Z72QHLAsj+/gClNfCqsEjvNhv7A2SxboLVl5U89baEk7NuAnQ9IeHjeKnBJq
 s5HQ2Dgc1uK/pKAsOya9DShUfxTxsJwbO1VGF4rFmJegsoM8TbFMAYw6rZL6+O7MVRM3JPxEKwE
 wU70Lp52lb7CdDzrHb6Z2xMI01lLJXJKtdn9pDpxG/R4ks8OkkUu5UBaFRWKP0wdEdK83hRRu77
 dVxy1T5XwcHEV0bV/nW9l2V+97LdrTf87n193jrkKDr9vT4MhEwbbJKjqK5LPyos5FsI4ch3Dmr
 fF3VUVHc+cYzpjHLrnw0DjanUGPMwlMS7NvsoYcq6O/+6eX61rsIuB6mRHt0vKIdBvNpLGDy3eY
 4AL3Fe9ysLBRpPjahNqEgLM445u0SLBWOZQRJWMUZKHI5eOAtrnGH4hmNRBusS5AXDx0wUPbl8D
 6/1Ve4kEobjKy+A==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_165126_369005_FAD8A9CB 
X-CRM114-Status: GOOD (  24.18  )
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

The add function is "all or nothing".  If it cannot add all of the
child domains in the list, it will unwind any additions already made
and report a failure.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/core.c   | 167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  16 ++++++++++++++++
 2 files changed, 183 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 61c2277c9ce3..97498a37336d 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2909,6 +2909,173 @@ static struct generic_pm_domain *genpd_get_from_provider(
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
+ * Uses "all or nothing" semantics: either all relationships are established
+ * successfully, or none are (any partially-added relationships are unwound
+ * on error).
+ *
+ * Returns the number of parent-child relationships established on success,
+ * 0 if the properties don't exist, or a negative error code on failure.
+ */
+int of_genpd_add_child_ids(struct device_node *np,
+			   struct genpd_onecell_data *data)
+{
+	struct of_phandle_args parent_args;
+	struct generic_pm_domain *parent_genpd, *child_genpd;
+	struct generic_pm_domain **pairs; /* pairs[2*i]=parent, pairs[2*i+1]=child */
+	u32 child_id;
+	int i, ret, count, child_count, added = 0;
+
+	/* Check if both properties exist */
+	count = of_count_phandle_with_args(np, "power-domains", "#power-domain-cells");
+	if (count <= 0)
+		return 0;
+
+	child_count = of_property_count_u32_elems(np, "power-domains-child-ids");
+	if (child_count < 0)
+		return 0;
+	if (child_count != count)
+		return -EINVAL;
+
+	/* Allocate tracking array for error unwind (parent/child pairs) */
+	pairs = kmalloc_array(count * 2, sizeof(*pairs), GFP_KERNEL);
+	if (!pairs)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		ret = of_property_read_u32_index(np, "power-domains-child-ids",
+						 i, &child_id);
+		if (ret)
+			goto err_unwind;
+
+		/* Validate child ID is within bounds */
+		if (child_id >= data->num_domains) {
+			pr_err("Child ID %u out of bounds (max %u) for %pOF\n",
+			       child_id, data->num_domains - 1, np);
+			ret = -EINVAL;
+			goto err_unwind;
+		}
+
+		/* Get the child domain */
+		child_genpd = data->domains[child_id];
+		if (!child_genpd) {
+			pr_err("Child domain %u is NULL for %pOF\n", child_id, np);
+			ret = -EINVAL;
+			goto err_unwind;
+		}
+
+		ret = of_parse_phandle_with_args(np, "power-domains",
+						 "#power-domain-cells", i,
+						 &parent_args);
+		if (ret)
+			goto err_unwind;
+
+		/* Get the parent domain */
+		parent_genpd = genpd_get_from_provider(&parent_args);
+		of_node_put(parent_args.np);
+		if (IS_ERR(parent_genpd)) {
+			pr_err("Failed to get parent domain for %pOF: %ld\n",
+			       np, PTR_ERR(parent_genpd));
+			ret = PTR_ERR(parent_genpd);
+			goto err_unwind;
+		}
+
+		/* Establish parent-child relationship */
+		ret = pm_genpd_add_subdomain(parent_genpd, child_genpd);
+		if (ret) {
+			pr_err("Failed to add child domain %u to parent in %pOF: %d\n",
+			       child_id, np, ret);
+			goto err_unwind;
+		}
+
+		/* Track for potential unwind */
+		pairs[2 * added] = parent_genpd;
+		pairs[2 * added + 1] = child_genpd;
+		added++;
+
+		pr_debug("Added child domain %u (%s) to parent %s for %pOF\n",
+			 child_id, child_genpd->name, parent_genpd->name, np);
+	}
+
+	kfree(pairs);
+	return count;
+
+err_unwind:
+	/* Reverse all previously established relationships */
+	while (added-- > 0)
+		pm_genpd_remove_subdomain(pairs[2 * added], pairs[2 * added + 1]);
+	kfree(pairs);
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
+	u32 child_id;
+	int i, ret, count, child_count;
+
+	/* Check if both properties exist */
+	count = of_count_phandle_with_args(np, "power-domains", "#power-domain-cells");
+	if (count <= 0)
+		return -ENOENT;
+
+	child_count = of_property_count_u32_elems(np, "power-domains-child-ids");
+	if (child_count < 0)
+		return -ENOENT;
+	if (child_count != count)
+		return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		if (of_property_read_u32_index(np, "power-domains-child-ids",
+					       i, &child_id))
+			continue;
+
+		if (child_id >= data->num_domains || !data->domains[child_id])
+			continue;
+
+		ret = of_parse_phandle_with_args(np, "power-domains",
+						 "#power-domain-cells", i,
+						 &parent_args);
+		if (ret)
+			continue;
+
+		parent_genpd = genpd_get_from_provider(&parent_args);
+		of_node_put(parent_args.np);
+		if (IS_ERR(parent_genpd))
+			continue;
+
+		child_genpd = data->domains[child_id];
+		pm_genpd_remove_subdomain(parent_genpd, child_genpd);
+	}
+
+	return 0;
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


