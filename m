Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C77FD7497D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02I89/A9qYtjldvjbyC2sOJfVnDSFABqZCnk6WuuKr0=; b=e6NvmLBpyLQoANxP0ujbPotImT
	Jjs2cnOkgCxY/PaFogw5BqzvouDW20fl2YH7wLeHGxDZ+qVQlz3lGDFxYhSolXfoR1qgK3h7jXLB9
	byHptBhQOFnoBnOUc+wTIyd4GLTTzoEO9SjV0nZW7H5YZhHzvSEP11cfmbu60Bp4P1YTu4XWP4+Uz
	tcGJ4JJcR47Y0FmrcExRElt4s7/gnJoA9PBeF2Y5UqNdp2BSqTLCn7g/JTGRs0NQbiUdpkCUhmf0A
	sPnYgpi4ciloE7wsfjCNzPUoyt7ZEVkJU0gU6WSFXduGkbzI9gPGuin+hcG5xoyYpN33dqf0rwy0v
	/EfgI3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t637H-0000000H8mw-0HVO;
	Wed, 30 Oct 2024 07:27:43 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t632R-0000000H7ku-3GVT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:22:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20c77459558so53652735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 00:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730272963; x=1730877763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02I89/A9qYtjldvjbyC2sOJfVnDSFABqZCnk6WuuKr0=;
        b=ZW98pLYDYAXf6rKDPbZyenTWD0PnCQaHN8x20XNq3nuEkHsWKGPrNvZ/XicSqb6cg8
         RS/bklBugfqgFWqVgTG6CCLym2opOVlvCEV0Zh38OTqU4jGEVW77/k/ZWzc+o4rjPqnA
         eVaAA9GDiDDVNUx0fxbZQcY5jhHUya7n+nSs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730272963; x=1730877763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02I89/A9qYtjldvjbyC2sOJfVnDSFABqZCnk6WuuKr0=;
        b=HdFAArX1rJjlk4zKqgHKfrxyO0Tq949U7rMtvlN3bFWNr5InXEgk+nOw9ofLOR71DT
         T/tpqquCYicHvGkfGpHC2uSeh8ankiHTrEYZARrRLfYbtAK+fEujyhY0eTBHFn3XnFQj
         cBQxYz3mi3nzz4miEMcdtP4ENDOgH+TFL9IkScEbmWj6y4jlIGtuQlb/nCEAYgnkLQU0
         hP1Cqgo3eKnomWeeuG6KMKQKOPhwtS4yi1SUmiiLJ6zrurVDiw+tgYNx2+rq44n/Tf3R
         2ywm4eub59m9/H98ZWw2qL2mphi3g27bWyhY6PV1FXoDHOwRZa1HqaQTep5vwE5Usm0v
         F7gw==
X-Forwarded-Encrypted: i=1; AJvYcCVaBprRBxLBLSyEs+P0DJ+PZkwR1Yp02Sc0C8MmzTsZr2F3H+1RjWbG1SZK1mEWTdyMcgPkoPbGw2JHDmcDHNaP@lists.infradead.org
X-Gm-Message-State: AOJu0YwaXE0/BITMyyCefY1nxoeQ3P9Knq97U8DdPI9qQnOb6QluFqj6
	i2pr06DM5Dnot4UOmCDru2v28o81eO0fdanTYjGEVO63ShJRvP04t+07XpdFCA==
X-Google-Smtp-Source: AGHT+IGRv+883MbPDyi2+STjJPcbXoBWTOIxB4iDvZKH1B5wRpkiQ+ZAYsXKMtOIPXpNfDDwdLlFAg==
X-Received: by 2002:a17:903:41c4:b0:20f:ab2e:14f9 with SMTP id d9443c01a7336-210f76ff17amr26213175ad.55.1730272962610;
        Wed, 30 Oct 2024 00:22:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e67esm76641445ad.186.2024.10.30.00.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:22:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
	linux-i2c@vger.kernel.org
Subject: [PATCH v10 2/7] of: base: Add for_each_child_of_node_with_prefix()
Date: Wed, 30 Oct 2024 15:22:23 +0800
Message-ID: <20241030072229.1013235-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030072229.1013235-1-wenst@chromium.org>
References: <20241030072229.1013235-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_002243_838963_FBF4CAD5 
X-CRM114-Status: GOOD (  16.25  )
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
2.47.0.163.g1226f6d8fa-goog


