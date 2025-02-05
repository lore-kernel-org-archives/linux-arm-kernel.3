Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE92C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oZeW2TzGduBdntmqzLgzniOSZrvrZynfD5tPbUne3o=; b=uFRLA5dbEo+3qjrOY9BXYnyhrM
	wkPMnKqkHD50RnK/B6Y+7vb2mj5WIxc01SF48IHOLklbLNe40o46urXNQVjUM+P9iexN9eIJMiSmf
	RVZwKJ+ihdJKBbdqtmVyJ2ER3H9bs2UTZGyUTf4vubz3nBG83+xedAPYrxihoDXe9Nxd9CUHc6UJw
	9mpHZC+3p4z+YKAXMnla/JHLyZU9tUeANHXBA3HrBiTME2/YBNEjxLWt2wURJZHYjkiJRNoBnZOB0
	kr9LuFBMSlhEmZLNzLPzDc9XRHBUQK5pJ8ZV3Oo+23W5OX4drNA1ZE+FI4rLlR4yBZeDb7/+dDqT2
	UxKtPDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfelR-00000003G2u-0NzU;
	Wed, 05 Feb 2025 12:44:21 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfek2-00000003Fdm-1QLb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:42:55 +0000
X-CSE-ConnectionGUID: qJDgGzujQ7SrbqbP/MsImQ==
X-CSE-MsgGUID: Pn+2gzssSaqklt7ImdEg4g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 21:42:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.225])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9599F41F86AF;
	Wed,  5 Feb 2025 21:42:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v2 1/7] of: base: Add of_get_available_child_by_name()
Date: Wed,  5 Feb 2025 12:42:21 +0000
Message-ID: <20250205124235.53285-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_044254_547430_8A99E8F0 
X-CRM114-Status: GOOD (  11.22  )
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

There are lot of drivers using of_get_child_by_name() followed by
of_device_is_available() to find the available child node by name for a
given parent. Provide a helper for these users to simplify the code.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
previous v2->v2
 * Added Rb tag from Rob.
v1->previous v2:
 * Updated commit description.
 * Updated kerneldoc comment block
 * Avoided code duplication by using of_get_child_by_name().
---
 drivers/of/base.c  | 27 +++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index af6c68bbb427..e37b088f1fad 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -824,6 +824,33 @@ struct device_node *of_get_child_by_name(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_child_by_name);
 
+/**
+ * of_get_available_child_by_name - Find the available child node by name for a given parent
+ * @node:	parent node
+ * @name:	child name to look for.
+ *
+ * This function looks for child node for given matching name and checks the
+ * device's availability for use.
+ *
+ * Return: A node pointer if found, with refcount incremented, use
+ * of_node_put() on it when done.
+ * Returns NULL if node is not found.
+ */
+struct device_node *of_get_available_child_by_name(const struct device_node *node,
+						   const char *name)
+{
+	struct device_node *child;
+
+	child = of_get_child_by_name(node, name);
+	if (child && !of_device_is_available(child)) {
+		of_node_put(child);
+		return NULL;
+	}
+
+	return child;
+}
+EXPORT_SYMBOL(of_get_available_child_by_name);
+
 struct device_node *__of_find_node_by_path(const struct device_node *parent,
 						const char *path)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index eaf0e2a2b75c..9d6b8a61607f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -301,6 +301,8 @@ extern struct device_node *of_get_compatible_child(const struct device_node *par
 					const char *compatible);
 extern struct device_node *of_get_child_by_name(const struct device_node *node,
 					const char *name);
+extern struct device_node *of_get_available_child_by_name(const struct device_node *node,
+							  const char *name);
 
 /* cache lookup */
 extern struct device_node *of_find_next_cache_node(const struct device_node *);
@@ -578,6 +580,13 @@ static inline struct device_node *of_get_child_by_name(
 	return NULL;
 }
 
+static inline struct device_node *of_get_available_child_by_name(
+					const struct device_node *node,
+					const char *name)
+{
+	return NULL;
+}
+
 static inline int of_device_is_compatible(const struct device_node *device,
 					  const char *name)
 {
-- 
2.43.0


