Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53C6C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=; b=vNLakkkIPjoXkhUKq1VwUGStfZ
	tS2c7b3YTZUK4qUyXiw1wdDaccAXcbf42shdX1eiU6mc+3UytL7/WP8iq0UbU9o8gOmZBesHwaRHa
	hxgMLjyXUzaJLUorEOjL8/UsqBRlcbnEuzTt+abwhE923ZekZcPqw5IrmIaBpRxa0UEpo8xDun75Q
	jEXeOO4GZWQYwzXLp417nEskH38TjOUVEqkPXdrjpQINQ9BFaqhyPtlDQ+0a5cj2tSvQC6mbPK8Dl
	XmRPe4gAiV7mCBphhKIcYaQQLPOq8c1ANNibIUa6TvW6DqnJyBgyyFfk+HFxmiaSyiJcCoBkfc5p+
	/cJxfctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PV6-00000001PSU-1hl2;
	Fri, 04 Sep 2026 08:42:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PV4-00000001PQl-0jAz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:42:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d91ded8174so6493655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511337; x=1789116137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=;
        b=MGLKkfqRpNMmqWhEcLcqL2DrrjQCU0mYjpgozUCOiLAV/eoPS18hevzJq0/xU9nZpS
         L9DZgIbqklJ7CUsYGB/taO/vTMchma1qFMOWX6Y5WYnS7FDCcsfwpRj6GRL8eVVPZaz7
         nq2CbUxHXSjJvLJROrScuKAigZBOkfPPr16c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511337; x=1789116137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=;
        b=FrJ5s3HEYQd9wtlKbDpaFqiAGqLwvV8kfYwpWszq3wiOmLuLNZhVsn9qeXTHkxfHA8
         w3/M2LfaYNyhMyt4Sh0yzqXnYm9FJ/9IeGFWmt27Wd6po0CiXyvB+aGnJX/oC0EdvL+h
         eoyDGr4a8L6ofN3kyy2rZfcKymkvv7k80kC76ELNEeGD3EJWvLgZScLIn/6j6mDaRiua
         177a9lwqM1JC1uSOfGEHFhdXbsCi8zimVBxqhqblacYV5KcxliyIIgIbc34oOW2+8GwX
         vmtpuQw9RnUFaMscX6tNDPt2HjTo6qYJ+FF68E3ihHnQvq2oemrcMSY81R+JlnKQiiql
         kW2A==
X-Forwarded-Encrypted: i=1; AKwUvBwORX44/M17JT9emta+5ATJlPmCn8wDHtngbcr77GGF62GOYPGsQW5n3JWOEe8m3Du2j5okQR+LA5nEBvkRsrET@lists.infradead.org
X-Gm-Message-State: AFuF++npZx6DzvcbbxDQC/wXpfldNR4bmM5nQ/MywYlKm/EUwEgISzxR
	5jtEqTxwar3DneLCcUadcVQgzF9TUbzW5tCLFGzOWqKGHsfOt4yj+ZPHlbRx+eYMxw==
X-Gm-Gg: AYBFou11BXBc1TWYNM9UiR4gv50uC6O7K1mhza42bEJwSamXOKk2FTNsVfd8Nm1+yZr
	4av+2fXyFdYFsPD4r2usW3rwv5m40jQE7wznhWJm5mpya0IaFdQ+1Sof6TxCHs9ZKqhkXwIg9/6
	whpLz+aQLV8xhqBJRHXn02bx34Rgo5+yMjcVJ8iJS7O3o6WQu+nBmdQuIqLadVgfct3pk3ynYEN
	EheZXVrx9qgbMyzGdidqJs96obXZDEekKh4jg7BcfZzCg63AQK3Q/RgzUz+oGLXNZS3GsmritSM
	8oSfCsl9ZIoBHFF21F8hQC5VGELErpNF2GGRDsBl91/ML/aKcZKAIAeApt4C6LTr0jE8ZOG1rxs
	cWF5yKfioAy9gfBSb3XUuaHVCAmvOaOVtNuCgdBFnaIFGxnL2JbGAbwAnTmWoX4vlv7lq5jXpde
	qAW4xVdq+j2AssF7F611ok4NN0YAlcB9NfsUy1f1q6rSGOTyXgWK3cnk9QEB1MC4LU1GRpEleje
	MiKoxOkVF8yGalFIHDauwCDsCDe2wC6Y3jG8e3HVNKo
X-Received: by 2002:a17:90b:314e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39b261500fdmr6024537a91.4.1788511335746;
        Fri, 04 Sep 2026 01:42:15 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:15 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Fri,  4 Sep 2026 16:41:40 +0800
Message-ID: <20260904084158.1341550-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014218_220142_D5D72EB2 
X-CRM114-Status: GOOD (  16.32  )
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
Changes since v7:
- Mention in kernel-doc that the function does not return ports that
  have no endpoints (Sakari)

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
 drivers/base/property.c  | 31 +++++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index b136c339ddae..68108805482d 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1353,6 +1353,37 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
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
+ * Does not return ports that have no endpoints.
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
index 907c790a3f01..3dbbd01a52d0 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,6 +507,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.979.g7e5102b832-goog


