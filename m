Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1448DC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=; b=AmALO0a6dWkFTd2G811KvQd03J
	wJjdLNqLGfF/THwCV0Ozwza0UKAO6IqRi3+fieEucK8fNzcWF2BEpDp9UW713nZe0EMU2Gkx+MpVT
	YJMazJCnZz4SWbOPZDxfWc19QXSkdCnYwXP1MYdCXTnKOzJzx3pZYTHOmYJganRARKF0rVV1e/LTO
	Ly76CCQwPbZrRvirg1lzW2ZsJme+MNc1VxTlrKB6Cgr7xVC1KRRXOcORB7qNUxnEz0FgUdZHFyRX4
	sVvrk4Uf3NWm1mc9HlG0lgofm9XO9BaNUgyFJH/0Cv0Ki+ZQj20ipaquICe2GRbG1waKekvn2Msg1
	ME6ER+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXp-00000008e19-25zK;
	Wed, 16 Sep 2026 07:59:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXO-00000008drC-107k
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=; b=d/Ti+Vet57rVQaJeU4rD9bk+XW
	yE0CImAGEy/NmaBBzfxb7JMwR+KmTHTNHst0Zd1Tgjp8ASOCJwMkgYj+L5nRMLsA/DLcL4RzTwZC/
	Dc89FDVAeHT4LHKgQE7vJM0Pw376B9YAyjvCADXjve75/E8OA2aBZwi43qHiXD6Fy6OaXnYB1OJZ0
	XS5YVOlPy2DRWGWfxgHcnajgqAYzjaR0LzzVy5kDUFxdPwHhK1jL1LkFJdKlUFUSD6NccK9D2WY+F
	cpNvytW3uiAG54qJBlQkch2ZQk2+s8yidVxxpm5cJr1Tbji/8xEOlOfnCNMQfLqQYfciesX8Vbqr2
	DfMrt2Hg==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXK-00000007bVP-44y6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:58:37 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso494660a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545512; x=1790150312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=;
        b=Lz5tkaSNA4J5xI946QbUOZog8ObiV2qrQjD1XgX73sA3MOg+YaWoSUnQw1hq2h9pmO
         A7gE+Sgb1zdaVhMmwX2GY0aUewJL/NA1kF0jXy1N9DBhq/P9i0wqtbCV3xq6FAsW0Idk
         lInXB3Azk55qTc7B4JWpkX0dyuQQPD833DZm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545512; x=1790150312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=;
        b=gClWWrXUcfVMXgZR1ghQzGlU/piyfPxhEmEXv0hdYYR5Yg1+LgpIoW5cNO8zXK9Es+
         yOPfxtGpxYfwa4FSK23ad7GZXQupvoXm4xJTtI6y5LOnJ2Tn/XscMFDlTkEf/Q3L6AkO
         hB26hu+5DkczVmWiN+ovcSD3gy2/zKjBvPUA6z/ocyHnBrMfPRyrSU5kSs6WRxV1/e7p
         Wz29HDzKN1N4mt1yC5Y2E67/+5jSZ53y+2+TtDuDny6fXH0Wigs1a6efN561A0lVGMNn
         IqHZ9rMNTRsAXD47y7w18kRZli4oPPWI3dnFZeayAjt+wPbK3AJCyA1FTPrqU7CRaZ/b
         7Juw==
X-Forwarded-Encrypted: i=1; AKwUvBwV+xTCy2qhS1/jkjaAGXrGtL05M0TrYPEfUcCQ128bO8DfpMhMhoKmvE4Ud9ZvkGbpacdvqvJemBsQccj/NFsU@lists.infradead.org
X-Gm-Message-State: AFuF++mc/cu2+WIa5kZe2/pqBGK/z+HvdWB/li+VwHKiLpg96zN6A/a1
	PEV+s28IBHnzW07Q22+9/BT9QZS/NZMnHyKnWhUv80SSo6vvSWqsuQeCsVjX0tShDsrZM6H1ob0
	NHtI=
X-Gm-Gg: AYBFou3XykmFvnrWZ6yYWlNHkghaYRYBOSXQwHOI9CFqjLOhX79sNoPS04/n8gwZ6P0
	NGGS9B/WoRUtS1ZC4WDkXCvtwtOzh1XGzqxSAali4Ep5VhR9DBnzBmOVxBHgCq2AixDJnSbK6kR
	+ew59KYvWxDnq6ASM1X4Q426SWl0dKj+7/QR314Wyccx9Qoan+qHYgn5sW9rJaqErDVKtbXTknG
	snnBLjiohl46WWzQaQ/qs3ACwAgumZNZu0EZ52v85aMCFy5vVOy2qeUpp9dPRUyNqE+jx2krFKT
	qCOkpSbbFIDOZzeO4FLdtjEpu1py7AO33T9oWKeihA/HMc1U/T1+crsK3s1Y0CYu7b1Yv+sAVk6
	jtGH12gNOnv3Oras3y00LlaJh/ysNVmVQZGwsBxTGoo7tvZcCndWpmlezVm1IM5U29cdhQMAetK
	CQRJbLOiYlmAOhxE6QjltEMR9qsESPHKJZsCgVz/UUjYKWcaCaOasqaP26Nb7Hkl3od8zaR0BNS
	XHEr1AzBrvVTpiDJz/2KFFELcq+9PljmNOnFJ+YOa8FwhGEvob0tT47UA==
X-Received: by 2002:a17:90b:4b83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39e1e4c4687mr4082007a91.18.1789545512315;
        Wed, 16 Sep 2026 00:58:32 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:31 -0700 (PDT)
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
Subject: [PATCH v9 02/15] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Wed, 16 Sep 2026 15:57:28 +0800
Message-ID: <20260916075745.3549953-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085835_648407_A65338E4 
X-CRM114-Status: GOOD (  19.39  )
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

Due to design constraints of the power sequencing API, the consumer
must first be sure that the other side is actually a provider, or it
will continually get -EPROBE_DEFER when requesting the power
sequencing descriptor.

In the upcoming USB power sequencing integration, the USB hub driver
first needs to check whether a graph connection exists, and whether
the other side of the connection is a supported connector type. The
USB port is tied to a "port" firmware node, and this new helper will
be used to get the endpoint under the known "port" firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Sashiko points out that the |prev| reference put is not done if |port|
is NULL. However it seems that the fwnode_*() and of_*() API design
implicitly makes the functions no-ops if the passed in node is NULL.
So this new addition follows the same pattern.

Changes since v8:
- Moved Sashiko related comment to footnote (Sakari)
- Collected Reviewed-by from Sakari

Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index c2b7a571fe03..924d03df4995 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1109,6 +1109,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
 }
 EXPORT_SYMBOL(fwnode_irq_get_byname);
 
+/**
+ * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
+ * @port: Pointer to the target port firmware node
+ * @prev: Previous endpoint node or %NULL to get the first
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer. Note that this function also puts a reference to @prev
+ * unconditionally.
+ *
+ * Return: an endpoint firmware node pointer or %NULL if no more endpoints
+ * are available.
+ */
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
+							  struct fwnode_handle *prev)
+{
+	do {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (fwnode_name_eq(prev, "endpoint"))
+			break;
+	} while (prev);
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index 3dbbd01a52d0..691e792775d5 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -509,6 +509,8 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.1032.g73a4cd73de-goog


