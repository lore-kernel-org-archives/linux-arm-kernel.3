Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4B7F45A0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 23:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fL3GNwfZ1nsisPUDCuJfqwmmtNAVNx2CIYyMLfPb2w=; b=hERZ7bQc6cUv2rKLS6Ph3v1AbM
	C3I4xiPGurgth1QJu8WExhw3L78p6UidC2y8GvHH9O5U/MyYreEtYwIkKHGX7rVNRdObQJO8jDGkw
	/0KarojMhuVyY5Q+68m7eXrGA1iVwdyJCc2e9x+4VVJOdARA3xv4YwXEPcs6DvS9IqBG+u+7lcSBB
	NYqp2qt6PaNThyvWa+hRIsNRrMvpLEEwDNa3tOKhVMzKsa+KlzaDjRYcykt8xxPuVE52vZJgKkXua
	EQxcF3m/pu/vS+i4SzI+SI5ireKlsQQnLJIZEqzE4HuMO1LOZp1Kh+EUrZ9C2hIq4Stb1mVh3hb/9
	1NzenKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLX1-0000000CwCc-33xU;
	Fri, 10 Apr 2026 23:44:59 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLWx-0000000CwAn-10CE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 23:44:56 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35c206f0481so2626602a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 16:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775864694; x=1776469494; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fL3GNwfZ1nsisPUDCuJfqwmmtNAVNx2CIYyMLfPb2w=;
        b=s5aY5R9mvrBzm69WeWIn4WpAG/rVPuzUs4SJqcxxI4lv5Hu4Wd73tMJIUyZL3iRgAW
         D1NB2EM8wOcyCoYbu3+/6zLzPbXyrO/Ym9R6c2yEYvU2BANtEmWfCqwQXvZD6MENiCVx
         ocbeQkFl0ifQLq+wGeoYZ6KLKkMzlW3LexMajK4F6bF3tGHpE4Saa3hDqEsU4UB4qxBs
         DleBPi0JNzKhfA+bMiU92fyyF6sDISLsQF4Ulz2ZGIq3PF9kQpY6VWBRzjchjpDznIYO
         YfVm/9OgelihAfqgdk5b7rVjySqIm9CJHOOpofjhfMJkmtK8K+QbqXYMZO2eM+nhL4hE
         tTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775864694; x=1776469494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/fL3GNwfZ1nsisPUDCuJfqwmmtNAVNx2CIYyMLfPb2w=;
        b=NReK7SlSnsXG41hYXcleRZ2ZCyK7Z6OPhEQmtUlWRxRyq3PVSdbXaYcDRjY+JGQnTn
         6mgUEiOCKosazpq+VXcTYScfern/0RYttjhWLva3BW1zx6ZpP2qaJgFDYWdVbE/n5hUW
         L2G9dOUioDmDD89KeuFbHfA/bSm+mxOAnS+zO5kn5JWUD9uQrUJqfbvD3ZaJN5GGTvNw
         t8FHJKLCL/3YNwwUmRYEoNuA9xrL8n3Lp0kMoOLtSJrZiUwEiydq+P/N5ViSFcjnIPgd
         SiloutRtRUa7Yh10VuCwfVy9LZMOx2wsUmIAwMbpWXpVTVygsI4tgktzgdze/USBBLQG
         3Y6g==
X-Forwarded-Encrypted: i=1; AJvYcCWdlaPdNQntEgXSWtd2lN4Y5CJySTG5eWCb7lLhRg6MeLTtaSo/h0Nw8qj3FvIR7xrfH1A96gCl/Svosdly9ryz@lists.infradead.org
X-Gm-Message-State: AOJu0YwIf932uLlTW4mNS/f3Jwj7xNbOf6hXVcA6vK7f80iQN4oMrzPs
	FO5qkqXNKembzYc2uADMaJWoUSZys8swiwtN2ddez3h97opITDBauaHvXXXwiGDgpXpBMPLRuFI
	ycu06L8A=
X-Gm-Gg: AeBDies7/e9QApRWPBB/ePG1Hxxv/LoFk8WCndVdlhl5NqsPe2AMgiwvvuIhJKyz/uq
	FzAXcDUqVzOl45Jc8HGCiH5qckncyz17KANnyMqvF/3PXwXxdwxy0XkDXytB7ueTv/tRWtdkx6V
	jpHX74y1EpuanGiKnOCbJPO7ggYgWZgjlqDFkFBHuZNngkZWFepIRw4HtSQ2OXslFfpJ4LoQzPf
	M+KRArDd/CzqqZl639lG/+krwjMmoV6BQ6TgMVtrxmbxjJ6W7YKM+QfWm7wpu2gN45GW39egg6q
	BC9w6ERbwl6xhqcWa+m0iLGz9fio0N+FXwuuzEGCAbz/aU6DTAyMvIxSWm9DeDP58ppFCs/cIW3
	u1fcRvftHFZZX3yN6EKIzXkHGaxb2H13ia5uxAXxKbcCp9fI4q2BxipEPwIW5I0uDiEVfzSwAzM
	q/lDF/jEM7++pt3rHsYFMSQ02i/dIvqg==
X-Received: by 2002:a17:90b:3ccd:b0:35b:9ab6:1d4b with SMTP id 98e67ed59e1d1-35e42846246mr5553462a91.20.1775864694213;
        Fri, 10 Apr 2026 16:44:54 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e42db1b51sm1766213a91.3.2026.04.10.16.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 16:44:53 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Fri, 10 Apr 2026 16:44:37 -0700
Subject: [PATCH v2 2/3] pmdomain: core: add support for
 power-domains-child-ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-topic-lpm-pmdomain-child-ids-v2-2-83396e4b5f8b@baylibre.com>
References: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
In-Reply-To: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8599; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=mBjWuQi/HGwha5ym3E4fgVBst1esK2Mr/oGnli4oYYk=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp2YtyQkv9A8zRsOwGZF+JZjPXQaBYJzu6eUYGq
 rH+XEE2lX2JAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCadmLcgAKCRBZNxia0/vG
 ZbZ9D/9QG6dV9icaKXFsVCK8sPfQLATnm6mg1puEFW+8wV9eXzTFJ3TFjHdCvkC+ZCLVI51S6qo
 pQnENkg/SxGUVGrFXWUtAreTjBzUgpIKmHEgTsjRw/15fNtz3rW5qRDAM+qvG33QCxBTxDLWp7a
 FLDfj2NFDoqNyXSjUA0op74x9XDuAkKq0HllBxwWxWFzosNooe+0728Uezd0KQmd97sYFKhS7we
 XsIiV6mop+XMczwGXw+IzmY6pTVXx9GJoGj8S8Br88PDZ2JFNhqMoxuqBXZVs70cOGMD1cTV5dT
 80GIUo1BQZSSjPFBz0OCjpyEq8zjhfjZl5jFLBDaY5b5G8YeAFBl82XeDWzx424vZqZIw+Sr9un
 zwN14y4Hfd+3v6YOLRjkwtfzyeJT7vcS3cFIWGCML13YKNxaG5oZLH8SgWyjSwD8412mm+eiJUV
 pVGa4yTJOI+R2noGqdyn+KZfTzR3Cxrj1/MQ8TI2Xl3dCu9RooHmpwygpy/Ufsg776l4+7eSoY2
 mXVRYE+GJk0308bxjUhjEUbXLOijCYzH6OMvQYQp/8bmJ93tET6Gn4C2hmGGXcPfzi2VVMQGjFI
 pB/i7USbCoxR34jnJEMnmU51yAA+NoXUeM8wuPOZM6SZeX0AtLPS5OZgcxDl0gdj7IYmCnspBqo
 eiOAP6LhVm+7f2g==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_164455_292577_A24C9041 
X-CRM114-Status: GOOD (  23.59  )
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
 drivers/pmdomain/core.c   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h |  16 ++++++++++++++++
 2 files changed, 182 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 61c2277c9ce3..f978477dd546 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2909,6 +2909,172 @@ static struct generic_pm_domain *genpd_get_from_provider(
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
+ * Returns 0 on success, -ENOENT if properties don't exist, or negative error code.
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
+		return -ENOENT;
+
+	child_count = of_property_count_u32_elems(np, "power-domains-child-ids");
+	if (child_count < 0)
+		return -ENOENT;
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
+	return 0;
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


