Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AF1C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=; b=lgDrdpfP+BWecX8GN8h55EJhMu
	qn3U2rWurXdY5rncBHeOknDCnsTMKajXVb2rtonICpFWL/O0es7knc74PY05SCamPsEkdZ7lTloJq
	o8gEpkIObQwJHJsFi1HRK5jrJjnTC30J47nRtPxnuOaxz1TfC438RLeNnTGEOArFhRUG9S3Vmmsb+
	nF3eytsm3ANP3Tyj5PZR8PlRXsIqCspCAzioY9XT8PxO5JxWJE/oymD6c4mtMHaC7Pxp2XleFHq0M
	6s21/Dibu5Y32nPPVMi0phyoEQpPQDWs8i27jE6Zm5JBxfoMPFgzWjyNkanVK2G3C6+Q9IXQqI96l
	w0wBsjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBVu-0000000FqT4-00MN;
	Fri, 24 Jul 2026 08:44:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBVp-0000000FqPZ-0Qis
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:10 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso132684a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882648; x=1785487448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=MKjdsEFTdnGzEzMRa7yLqPIDel5BOLCmsg6ok6VLN3GClvBVa774HCK2W4U3rVQbSx
         KR39/jwIQZkUMLiofZKjWzC2ERyZP7/D9xTsC3PndQl0N5vD37U8vE/5xNwC39PupIrn
         rI7ZQUP/G9pvWi927yEM3fNzjMS6sJlJEbNfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882648; x=1785487448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=pUdLjeyfPBp+ijzWXy8nt34s5iZvaYyhkekzRizPz6Kt4TAb+wG9NRJVPvEbj462Fn
         uKuiG2wu96B/nApTR2uKx+SP5aus5yh2O8bamMWsG3+MyRXX8ggHQ9pLWTWusz6G9o5C
         82jBJWH0dUMaexyxaqczt2XbJ02/o72d/QHzWaubcKYJ631f5OU6v3X3EIXZlQ3HKuA9
         8sUGadmx8comNEIBJvGnwiqDNWYqmHREhyH51kEPin+MqihZYJNrfvgcNRu2EV8avQ3Z
         kIxSDU8eblJ8QNn7PGKgNXeiZszbG/R7mVm67S/705vzd4Y7llge/zeq/0qxFPoWTsgt
         ovzw==
X-Forwarded-Encrypted: i=1; AHgh+RqyoPng4w/jQL0+vB6/4X7M4MUCVWCYWrF9RQTSaZyMsVUmqIqoDG53OG9wNZ/tAzpScq+g3LOichoR4yQtLXUS@lists.infradead.org
X-Gm-Message-State: AOJu0YzAYRsnNQ9tEa7ybv9RU6WoRNjVzTxFmS3UsGYPcA6gU6Vp66bY
	KNXMrZNzOqAL7YQyLAuDLvZ9IImp2FJ+4CyYN5fh29t+Vsdx0BvFWdEs8b+T/wUkjQ==
X-Gm-Gg: AR+sD125SNldzosP3Wa1tYoypnXRc8hnl4sW7waly+rc0/q3j1m32HIQjfo6chB83wu
	mBlNgL8/NU9Sx10RGIl8AmzqGRkShCNS9oRalH7pPPBZOGxEU9b1kddy8ouSz+BPc2ekgrUpkAo
	EGXrtWvBM5klKGGIsesLNX6tSzs5TLXoTtUJSCWc7C/BIMSAaTs8+4Iwnc7u8ZAfkxh/3jioQoQ
	EMNqNZqGNM6+9BfMKdKHEFKKW2Nyg+aaD8mkbQ4ckzJzkv9ntH6cWBN1EKF6tJcg750Lxb8BrJ9
	/0y7sGkRRv7IIZtwu77LqO/9OEZT9GwH3ajnkW8GTAmxqU67oJL6o5oB053rQHHkCLJNJG7XVrz
	MKKDW0S7YPXNgSzEwHp/OFPPIVaS6tsk18066eZ9MPqUH2Rr7rEguaLjfn2PMekv0LIMZnAoknA
	oCs6lX9xLIyD5YUoR9y+uYtNPhHqhYACdSGpKW3s4BhM7IPZK5dJi51Wbi05o=
X-Received: by 2002:a17:90b:2750:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38ec6637d1amr6238598a91.31.1784882648264;
        Fri, 24 Jul 2026 01:44:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Fri, 24 Jul 2026 16:43:10 +0800
Message-ID: <20260724084328.3943997-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014409_167139_58F33A1D 
X-CRM114-Status: GOOD (  15.42  )
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

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Dropped left-over declaration in header (Sashiko)

Changes since v4:
- Added flags parameter so users can specify whether incomplete ports
  are returned or not (Sashiko)

Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..950defc0c55a 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,35 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ * @flags: fwnode lookup flags
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Does not return ports that belong to disabled devices or endpoints that
+ * are unconnected, unless FWNODE_GRAPH_DEVICE_DISABLED is passed in @flags.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode,
+						  u32 id,
+						  unsigned long flags)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0,
+					     flags | FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return NULL;
+
+	return fwnode_get_next_parent(ep);
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);
+
 const void *device_get_match_data(const struct device *dev)
 {
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db4664..01ea010cb2f9 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.229.g6434b31f56-goog


