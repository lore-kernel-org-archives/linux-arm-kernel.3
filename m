Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6B6D44D40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbfB757zoogv3EY5nGOvTyWU1LRL3RJGksVkmiyRShA=; b=apG6THMWXRrXg46WZz1E5f+QGn
	ziFgVRAIQ4VtSKnhjr6W8RmwmYkcAlMqgKI9ZVv4n4jsEZyEI1dkDhv2CcGdKkihcgW+0rJivX2un
	XAyooFro/0/GBp1jb63g7aZZgPasGH/hipqcWO6pCCJWd469Z5i5bfgSgVJrQPGT6h6J9lP0NNGYx
	6aop90K1AZedBxwX28VcOylYzJx8qhci7R5ZMI6mpDMhLOInq//s6KwB9E35voZTS5kyTs+AmrIZX
	LHAKXCcfarNR1alu73fNvz9zTAX9Qjnba5iaqsT9caq+fmKd1tNGJBCMet8HLpnBM/djQBaIdEZ+x
	dy+0C7AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cwz-00000002gat-05Qo;
	Wed, 06 Nov 2024 10:07:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cQX-00000002YUf-0JaK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:34:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2110a622d76so49452805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 01:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885652; x=1731490452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbfB757zoogv3EY5nGOvTyWU1LRL3RJGksVkmiyRShA=;
        b=EdKqlkKxKrt3N1ZruSgjJwjxrIB7oKpWkb3J2pxuvSjlwma1hXugfZSB+LtPntYgf+
         U+2xiyqDLbR2QpI+cd5RkjOsRJEx/4Eo6U82YrsdE02xgyEYeTgvKUFt1HkLV8dS8nHw
         KHOey1X4J3vKdKbwhqTvSu/aOOi03KYpsLI1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885652; x=1731490452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbfB757zoogv3EY5nGOvTyWU1LRL3RJGksVkmiyRShA=;
        b=YAEuXA9UuqB/2STBvNtuVlDmWQMrW6v6Z80FdVN8W5NM+eYds1oZGqCwCOb+vxgvbk
         POZzLU0RckZYMu/leCJLdxrwSSRpb+OBwIaFVt1NxsWwZF3iarM8DryLSTyUQ+8Ekice
         iK9o1tm1gkR2U9hYW8LP3D1tTN2mRUoJ8DFgt2D+aefyJd04ldzmsPlPNOaP7Mn2k7wU
         QDecgxC0L1uKQNz7seQd7f1hEBRpwMSVuoiNnRULwSRYCA1tTCXgmejkCDGuLxvvEOt9
         17qcGC0G8+w9enQYKLAcQARFg6A973LoEhGByVlqJtd93MuGG+Q0dTeNLuDZijXfAsp/
         22kg==
X-Forwarded-Encrypted: i=1; AJvYcCXO5ZHPAwaBdApw7lQzBmt4Kzv/TCY9t8FLpDH03lfU66Q6ETqXqHowc7BxPtBAg2Z2qwJ3tuED2Re15nGA1PD2@lists.infradead.org
X-Gm-Message-State: AOJu0Yy93kUAwAufLO5rhhGfKakjHfdmJwYDwlh/+BshYu//z8+SbZqV
	BiiuYKT68FCbMxkfbNk8XPANgHUBPNpvLDVpDrzr2IyFIqySmVdeQkbJF8Jjbw==
X-Google-Smtp-Source: AGHT+IGsqJnP2c29fT7ec18QitUEURWR4HKremiykkNa1vQPN87ztDDGEmp/BT6g/9KjaXSGkYd/CA==
X-Received: by 2002:a17:903:234c:b0:20c:5b80:930f with SMTP id d9443c01a7336-210c68a9c02mr560445915ad.12.1730885652382;
        Wed, 06 Nov 2024 01:34:12 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:12 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v11 2/7] of: base: Add for_each_child_of_node_with_prefix()
Date: Wed,  6 Nov 2024 17:33:29 +0800
Message-ID: <20241106093335.1582205-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241106093335.1582205-1-wenst@chromium.org>
References: <20241106093335.1582205-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_013413_135935_45BE8C81 
X-CRM114-Status: GOOD (  16.37  )
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

There are cases where drivers would go through child device nodes and
operate on only the ones whose node name starts with a given prefix.

Provide a helper for these users. This will mainly be used in a
subsequent patch that implements a hardware component prober for I2C
busses.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v7:
- Collected Rob's Reviewed-by
Changes since v6:
- Changed helper name to "for_each_child_of_node_with_prefix()"
Changes since v5:
- New patch
---
 drivers/of/base.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d94efee4a7fc..a01e5534c2fd 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -628,6 +628,41 @@ struct device_node *of_get_next_child(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_next_child);
 
+/**
+ * of_get_next_child_with_prefix - Find the next child node with prefix
+ * @node:	parent node
+ * @prev:	previous child of the parent node, or NULL to get first
+ *
+ * This function is like of_get_next_child(), except that it automatically
+ * skips any nodes whose name doesn't have the given prefix.
+ *
+ * Return: A node pointer with refcount incremented, use
+ * of_node_put() on it when done.
+ */
+struct device_node *of_get_next_child_with_prefix(const struct device_node *node,
+						  struct device_node *prev,
+						  const char *prefix)
+{
+	struct device_node *next;
+	unsigned long flags;
+
+	if (!node)
+		return NULL;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	next = prev ? prev->sibling : node->child;
+	for (; next; next = next->sibling) {
+		if (!of_node_name_prefix(next, prefix))
+			continue;
+		if (of_node_get(next))
+			break;
+	}
+	of_node_put(prev);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return next;
+}
+EXPORT_SYMBOL(of_get_next_child_with_prefix);
+
 static struct device_node *of_get_next_status_child(const struct device_node *node,
 						    struct device_node *prev,
 						    bool (*checker)(const struct device_node *))
diff --git a/include/linux/of.h b/include/linux/of.h
index d0307e3b093d..f921786cb8ac 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -289,6 +289,9 @@ extern struct device_node *of_get_parent(const struct device_node *node);
 extern struct device_node *of_get_next_parent(struct device_node *node);
 extern struct device_node *of_get_next_child(const struct device_node *node,
 					     struct device_node *prev);
+extern struct device_node *of_get_next_child_with_prefix(const struct device_node *node,
+							 struct device_node *prev,
+							 const char *prefix);
 extern struct device_node *of_get_next_available_child(
 	const struct device_node *node, struct device_node *prev);
 extern struct device_node *of_get_next_reserved_child(
@@ -1468,6 +1471,12 @@ static inline int of_property_read_s32(const struct device_node *np,
 	     child != NULL;						\
 	     child = of_get_next_child(parent, child))
 
+#define for_each_child_of_node_with_prefix(parent, child, prefix)	\
+	for (struct device_node *child __free(device_node) =		\
+	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
+	     child != NULL;						\
+	     child = of_get_next_child_with_prefix(parent, child, prefix))
+
 #define for_each_available_child_of_node(parent, child) \
 	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
 	     child = of_get_next_available_child(parent, child))
-- 
2.47.0.199.ga7371fff76-goog


