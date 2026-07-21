Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA378C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15QCCMJqDJvxC4OlYXPloXq3cJq1LSRVcuMMIDjVYjA=; b=NOTKCujTQj5U7Jy6mk3cdtH4I+
	V/iJb0eQrfqHFESD2wKLhOo1DJrBHssNfKgjGx349gpEMWlEE+x5V+DgU7wH+a+NLm3sB+WAraPpw
	3Eiumm+GGR/rVBmVB6VtIaLUfafU1Zj1fAVSjNlHShxAUZmGMhMoeeLveWZNGEHKO2nFNK04alcpi
	Uke+Uqt31zDQtrxZLCg8UYKJ1y+IMH9a5rKwQtUcyncx2cJAbdFQlHeOuqZfWB37foHLk6Am/Ypy7
	CkZqDdNlBZzKjqbSmqzBhTRRy4y6b2e6J3ahUkYVFFbPCyRGU7rSZ+1jA2Ft3CV7VXPsSraFgHAjt
	+iX/SA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NR-00000008a3W-28dD;
	Tue, 21 Jul 2026 06:54:53 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NL-00000008Zxf-0lLd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:54:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so70221905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616886; x=1785221686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15QCCMJqDJvxC4OlYXPloXq3cJq1LSRVcuMMIDjVYjA=;
        b=V3OHLBMIjDUW6V5utTl8+tpLQAo4yEPqDKuukdYG4VHTJLCmwcSLhKOyyPTHpgEph9
         +p9TASE9vex/m1CzMYwIqM3Byy9trxskUXxiWdFgAqYqoEdofq5QKAwVtgjv+2LNt40a
         TtWIFPpz517o+C55ZTHgc9wxT0HxCU54Tr5Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616886; x=1785221686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15QCCMJqDJvxC4OlYXPloXq3cJq1LSRVcuMMIDjVYjA=;
        b=e8k2Q+mHVF0O2YdCOzuHZqUsPMUUYKhEoFeuTpC8n6hAXUP49JdLdia+OONw5wBUGy
         9V0izToFhRZzCvkllTwLIJYi0CH6rgjsNZvkMt65/jbr9BdCCA8q+MOwTVnPlSdPnUlL
         p+w656zbFnqnr/zIV/7BUoANy9NlwMPTATYx9GxMuiWItCCN9Ca9vdzv8pHZgrzsWxRX
         4kAqZj+L3D89DVILblsFBHm7S9qqWZp6ma3JvKyTiKbIuAOsKz0FqnAbq/6gKnAxrS/d
         +DqKC0ZViYWFiAYQU1JHhqTvWwlcw5oqNy13KXXQQ54dZrRipzN2sEd3/UPyVz0cAk81
         TOug==
X-Forwarded-Encrypted: i=1; AHgh+RqOUBtcdc2VkFfw5TOAEAtBdmpBDgUqC1VhZPwO5JVgBuW3yrZmaVtNFXRpQMQ0bjX1bK2HhZW3S9Q9Kb24nOc6@lists.infradead.org
X-Gm-Message-State: AOJu0YwjF7LH1CnpSTOZirTKZDCTDzqLr4jKGGpK4UzMmCIASS0nWhf3
	eiNh5bjoaxRNl6pmy04BjRH/KQGmvsB/A8PczipWKqfQXLd3etHZBbcUYbhJJMFfxw==
X-Gm-Gg: AR+sD11OrB7jJOm9WoZci3G6m3Ki7KdHIbRLSo2omHMBFS8ruQEFUWfv2GxkeDnX6T2
	Aetn9bhV8vP11S6CgsdR11IBd69O++K0janPNw0orNDP5cYQFSAdiuV+fWiRRtPtm0yIWbmxXUP
	eKmTDu+sNUlklzGJR/7EOxbSm8iFG5Lo9BXtMQuo871FSp+4r9IQKMbUzE3f0hgLjkkksZ8W0CD
	jngV2CoFzu7hCZ5G558uBBBdcS5jXHDte7Ywe+A6qiKo+C3R0Nu/XN5IEuWyIwttCRnIloCnpVA
	PBoTWZ7lUaGAaDwE7jmrOC/PkQIboMFdkpDXJ/M5c+J5L2YlRzI23/NhrvwnzagKUjpqK3gDM27
	QvspgvgywE9yTgJAXzHSfwUj9mtRrv2A3wP+8pRCZDZNGHJnF2om+vYM0vMaO1wPXvYEcKw6OgP
	yScDTtJZbAxhbNso/FZIoXJx9lVgg90p+Vsh5AJ66ESlniMH1Rt1N0dAmrTpc=
X-Received: by 2002:a17:902:c412:b0:2cc:86a9:ebfb with SMTP id d9443c01a7336-2cf349b839amr193173875ad.33.1784616886249;
        Mon, 20 Jul 2026 23:54:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:45 -0700 (PDT)
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
Subject: [PATCH v6 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Tue, 21 Jul 2026 14:53:57 +0800
Message-ID: <20260721065413.2306137-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235447_284794_AB71F527 
X-CRM114-Status: GOOD (  19.72  )
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

Sashiko points out that the |prev| reference put is not done if |port|
is NULL. However it seems that the fwnode_*() and of_*() API design
implicitly makes the functions no-ops if the passed in node is NULL.
So this new addition follows the same pattern.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
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
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

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
index 01ea010cb2f9..9a784a856773 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,6 +507,8 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.229.g6434b31f56-goog


