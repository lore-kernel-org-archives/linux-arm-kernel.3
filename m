Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC52C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ53TpctVBGf+9janmV3YEfLWaus5++lNyVuWbfltaU=; b=svXZO+iuVjjtNNBSQihMjCX5Fd
	rFh8dgtK8jscIklnTKj908Lo+EZkAqfwpDeTNj6RJqt3F5iUEsG2irMBfzRsHjT37bo9bN/NYZL9i
	B8lfaxqB+TvbAaeuvquGwrij8WURw2kp3xI8MCyrBFm+Fev3rWGS+RGjrMbMDspUV0XLgu/CYLh9Q
	BtZQga4oe5uoN+QrOZiZayIjJEppJnLGZ84DEuhJgLsCy04TrhIXWQPHOoRse5R0TRZSpSjKl+S+w
	HHExhv14PAVoRcTOkpAix84qb2e1Nez77gDllKv+0GKlYFNli8j2pyZZiIZj3uHJ1o6fZXVWEh2Gh
	HA/kiUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVu-00000001opX-13UP;
	Thu, 09 Jul 2026 09:57:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVo-00000001ojx-1PkH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso10055855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591063; x=1784195863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ53TpctVBGf+9janmV3YEfLWaus5++lNyVuWbfltaU=;
        b=gpJW4fJ/7NSsWOJcP1b0yBOeIiF3TFT50fsHALTXn10WKNPRkgG5u2vdANBnDAo4nt
         F+9LwhGGRoMQcV5FqDdf+SFJpmwvfozBtkRrdSIuLQKRmfxDwh5G013s2SYlubiRYmIw
         BbQ8MVYRWEcbTbgVrIZl0iOquTnQe9Rtzx/KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591063; x=1784195863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ53TpctVBGf+9janmV3YEfLWaus5++lNyVuWbfltaU=;
        b=ZSffCvCyx8pbr7zFt5/Jf4PRk2iSdQM0yrevAHhwCeu3M6n8B6C/0EqunHo0AavJOZ
         O0lSLYNZthtd0raV/ckMBr+ZO0MkuAm2uVA3i4P0kCFaHHDgPuj45hLgWVghyWjmJNtn
         WSvd30BZCsGz8wQ8Y6nSCUBgNc6RJllzpZ+AH1771/C0EDTjkoEElMvg+Q7oXehHhsqx
         NiDqEWRfs/4HErk0YaVwceiGrg5Lbv8yu+quMYKOWphio7xLxEMcsZMU25WZMUTl7bUB
         yIk7cYec3lX1x9lLKJ93hHTr+TIi0h2dvdRBy5tpNQ7ECe8edhL285C1ikF36cvJ3xKF
         Rz6w==
X-Forwarded-Encrypted: i=1; AHgh+RptE3sC+xyAJJnIdKkwPx7X78r6sYzrJ4BI3qyzS2OoqcNUFb2KvVslQV8CoURqIRbhjrNVhLdgIlt32rCow750@lists.infradead.org
X-Gm-Message-State: AOJu0YzyfGY6R7fi8xQmXQW94dvUu1qytduP7LE4e0kooWQz55cnDb6I
	4aKmMVZWL2QEHYrcorOzeQypPzOLgNF00OV19cUyHw9j5JSaKCzBOuU8Jqq1bJ5UDQ==
X-Gm-Gg: AfdE7ckU0nQlXa4VVUZkvNipI1i/S5Sdi2rpPcoRNigvLc4mQC+wlopnkXBHChqke7w
	0+qfq/EHfhPzyGvXLYp2gDBodQadx1wsFiO8E/u3b8p9nDB/IuT6zJA6Xvy/C4CR/PHMxnxYPtr
	6+RVAdpUK/sMLrxw05J+i6rEkTjCVNDDGWxVCyKFWt90fpqWlPcYWsDbUCBXo8IVs0hwxQYOtQd
	3bm8nLBRBpIbzrov6r1gm1f9hbZZ7uiCg0UQmY0ERajwB3djVezRveXp33R/C0M+03Dxg3mu6kc
	4RcVPqKCc1zVV3Cps3nD7+00cKCSvgDPLGt2W6d8+ra02ChED6/dH8d2dbTA9X3cWf5fW5om7MJ
	xgy42POMSzktIu3YA+gzCfcdsCTiwyh9UvEJ9cwEPVn18FkImyKfjY1GxGT47/875s3d9GwHhbt
	xrtamJBT80EjBTrFzh9MiWuz81zOlpC9dZ6VbU7Q+a3gqI/BGh/FVLogUaSj/oy4mo3/KajA==
X-Received: by 2002:a17:902:f68f:b0:2ca:c411:78a with SMTP id d9443c01a7336-2ccea371ddamr71754425ad.3.1783591063427;
        Thu, 09 Jul 2026 02:57:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:42 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v4 01/14] device property: Add fwnode_graph_get_port_by_id()
Date: Thu,  9 Jul 2026 17:57:06 +0800
Message-ID: <20260709095726.704448-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025744_390792_1C70A4E9 
X-CRM114-Status: GOOD (  15.31  )
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
Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 22 ++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..3e3e19ef66a9 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,28 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0, FWNODE_GRAPH_ENDPOINT_NEXT);
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
index 14c304db4664..e04901c0bd8f 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,7 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.795.g602f6c329a-goog


