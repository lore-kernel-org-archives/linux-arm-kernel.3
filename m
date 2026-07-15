Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62FBC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZ7tYQ51+XcWWhdGhKfBc+Z+vMHf2l2pRpxpCrkBTOs=; b=YEDy4mmErJefln86lvA//ZNJnX
	r8FBiSB2IwPluQI4op+b5XqMqynD0L7UdUHrxediL5JSz1lVdhCmf5KWr7kXyF9CfyiuBzYtw9Iyy
	jaO8x51yZGp+vuAfPQZ1Y6/px3OSezrfJXucOX7Kazps16ENahsUJu1Euphr7TStArLREhBlbQdZP
	lemFWnVhiR5Ysy0pMeMcYfFdqNsRLFvY0nBSRyR4b566kGPmmZHiTnV51F97zRgel1LsJ9k9LL4Dp
	PE5cVCJjo9ZTrVq0pkekEqkb/66JjTNf6mdZdiDPv/0SuCoZaX4jJZnBN431dJS5Nu+6Nf++bK6ov
	AacoNRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNv-0000000EDQw-0eha;
	Wed, 15 Jul 2026 08:54:31 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvNr-0000000EDOk-1BZ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:28 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-848743155bcso787372b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105666; x=1784710466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ7tYQ51+XcWWhdGhKfBc+Z+vMHf2l2pRpxpCrkBTOs=;
        b=PN/UTKQNtvuZJqe09v29L2rTSkqFe2hTIz704q023URH0kGPHt30Myu4RXEa+FwK9p
         XOpasGMr4A/TIGv08QYu8wrZc2gkUGE3hecN0R3b0zSfwH29f2gwBZ//pKlk22r8j/q2
         NLknGXvPTKMS5ZxMbjneJPLZpkSiVpJSaFpI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105666; x=1784710466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZ7tYQ51+XcWWhdGhKfBc+Z+vMHf2l2pRpxpCrkBTOs=;
        b=JJOjFFvxbhzw+hMUNLKKM/oEsV6fZSla2BxD0toDMfba97eR69gdPRA9PvCqpYwKKj
         Urm8ENimliUAfd7yu806rhIjap0fsbItAN9/fLMqVB+a8EMjLMorRDpSJYIYc58vxH+w
         hi+yz+Q+M3oVDDWeKlKWrPngImUmxO1aUHevhSXoyV+PXE0d9hw+eT/8Zi2Y8AlRPLV0
         S8A8pcXzDQpF0zC6ocMHLBRuQ4Ff8CgjXNeD0DBh9cVcVZ6GGB1DmLi+umgwup+Ht885
         bKylsPWQgTfWWzbVM8d03yNrZmRIC63Dc7geZ4lFdjNdlyOVeQHifDF9w0AbFVTqm0e8
         YFCw==
X-Forwarded-Encrypted: i=1; AHgh+RqY+BqVhxghD9UPCFGg/jfbVn7Yi4vIsgJ53qOXhu7bEMw6iCGSH4Rkm1Z2Uu1kT2R7NCFQ2AcaaXTiOoyX3z88@lists.infradead.org
X-Gm-Message-State: AOJu0YwY64W+mTNILzJpvtPDKaqR6WAxajHDK/k8Om8lpK4H4TrnIDbN
	96RpIbLKMEpSXOYLYbzom4th6uOvDy4etJ/K2JZT3mn6PcNL+xBZVKskv1EDmE3Rfw==
X-Gm-Gg: AfdE7ckBX/9rDEKdJb7uFLoGC9MnM2Hl6BJ6jZgdTAwzluZsB53X3PgrNv/awXb7lZN
	4BHxCY2fgTPG2gFibNUMr7JSqF/sHWz4TT2L2H0diNr+w5uekFWAU4SIK5pZW0uZJpGqZBxQ+jP
	dDXJO4j/DEEAHsS0JvJ+2KIekpfOF2TgIYIPTIQePQDOm4nUfOp42aCzkwGZYtv5akIhXaV2Sz9
	TOtGKGmH9K+FBRfkXfuwRLd1YQqb7G0h9YdnIIv1F25vnTKVoCiiUADPGydLuviVJyxjQ92Ux2a
	I+rcAfnY4lalcTFG4QAEOMZG6hV6fy87lDZHJWsBbYate24tMAw9EIS3Qd6X1FuJDE89n7H+jE6
	Y3VF/y2VYayo59WZZNTUhnIFRl3oP6v2AxbsT8ey2/PgVSpzlqxMGajfHWvx6l7MqgIJLtG0I4L
	xELZMM5cckyhWlMhqMVI3sl+Mch7kQtFPHgqED6sHGFJOOIdYLRdizeJVZzuoEBe+O/dL8XQ==
X-Received: by 2002:a05:6a00:228f:b0:848:2f74:1d65 with SMTP id d2e1a72fcca58-84889744e25mr15178478b3a.75.1784105666556;
        Wed, 15 Jul 2026 01:54:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:26 -0700 (PDT)
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
Subject: [PATCH v5 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Wed, 15 Jul 2026 16:53:32 +0800
Message-ID: <20260715085348.3457359-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015427_335675_7E361E5D 
X-CRM114-Status: GOOD (  19.15  )
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
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 950defc0c55a..5d3993bd8fc4 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
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
index 480ba8646bcc..9a784a856773 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,9 +505,10 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
-struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.795.g602f6c329a-goog


