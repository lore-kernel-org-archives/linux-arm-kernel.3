Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B12CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6pTgkTdjphaP4G6StNKBNkGmsxmuRCJqaledSqIiFY=; b=pQCRbnxI6e8e6neEQXl/kXLHXG
	GXIN9yjTixp5zWXOc9S6sG2/WBujZEdoBJVhMjggG4kOVnOOEecHhcTuy0H3rjbIRsnJ7wTLtDloR
	i8HGrjMddTAyRK8+A9hoIdelZ/UTPDX2GydLNuGt8EtakShyrZJECFxvUi9g41qoWbJK7Nqt/sSSD
	a4HzoNCip9VCBkBADiSusNN6xVE5tbunoWVFYMae27AoBgOtD35wKGRtGfv4ty1mr7uljduu2RQpw
	MO+9NRbmMhzpBhNrH+f7qnC0VzkyHsZ79nLdd74rn4UPUUFakFPWLkYaKAvPXJlk16GYr3XGTMUJZ
	eRVneydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEV9-000000075TU-1qNH;
	Wed, 10 Jun 2026 08:41:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEV6-000000075RK-3Ekv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf114b0cf9so59287025ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080888; x=1781685688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6pTgkTdjphaP4G6StNKBNkGmsxmuRCJqaledSqIiFY=;
        b=Fs9YuUFqx+8zDXpJ0wC6awhnXyd17s7SHxadDTKBeIGxdssglR0TAvmOIejSYaje3F
         TO7h28yrIRtQfPYIehqUAo/x6KV3hHVi85LA5Xc15u0KBndX8/rUzEPAgHd4V7xQSd08
         ea/mhjQF89tYK/A9UTZEpWTLGbmJX1ozrNgwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080888; x=1781685688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6pTgkTdjphaP4G6StNKBNkGmsxmuRCJqaledSqIiFY=;
        b=LLLgHviSFJqjzrL0PcUO3mmHfu9vTEPnXStjTH9AhxK8tESyq6ktllbc0XQM4F0Jpe
         g/clpov8CQJRkWmMFhjM2oiFZriETCkKr5imuULmioiF4PWhGE2dpsaSJP0o0ajdj9en
         r5FT0n85tz6rfupPNQxe3i/WbbcC5IJqFklOhqXjTpsNjh/m0VSZzNE72d3lGbD8aztR
         L+mk5JGvWowZ+s7MQmm3o5SEV7oD8+MfHB4G+SlxwEPFV+yfAd7RtcDlwfaZehEzZIEL
         5NFpl1+fbv2iaFp3qW74jiuXFrEet25ySsyKWtHVu8YedgJw4y5Ok1MNqMxuFY2gXbLD
         Hr6A==
X-Forwarded-Encrypted: i=1; AFNElJ+wZUDz/VW65uAsURFvs42TwrAJu7DlaalWO9xYXR57/l6pl9kP2JNuWfAsGLFlfpM8BnsrERpADzNAJmcX5B9f@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+u5BCtNeo5nD4IzU/d1oHEi3ENLV0UvyVlceFvYYAxqgwE1bj
	NQYCKsCM5F7kz6rrgEp+9fbCOyoV9uiWeVesthSpfpxgLzMusFCfyXt18v4bk2PPeA==
X-Gm-Gg: Acq92OGVymCrxtn612GrHVOPgJfyGaQEvLJx5ngeP526yxjumvmExxDlv2I1VceLg07
	tMFd1Z3vugWLJSGfzkhEzRpNL398ew1dGpxH2Nzur9S3q1aRMEnOjVtEFARsvskEXNQtrL0iHE3
	lfDglW8bH0UBsCFhGaqnn3Pk5qd4mT1cECMkDFfVWQiTnxwHmxT0UNf37iODgDRFI3J6CgM22US
	QeFcidMyZkxV14ReMsZvvCw3T20OEdbBj7tkgCryLKrKbujLVJcb7Yz4gBIhn84mDe+4qmOcwkt
	8VcbUhI4eYlnZULFRMEL7B6My9x/2KnBGqqt6BE3rgFjfxsJ4z8VX91PmhUoSunmqLwgfSszo/2
	+paE0vyJeK8x4bUSdQhDo1aXEvC39iXKVQDVNApKuOqLFQ8VWhVHSOYA6vT8CLQEEbo9FlkOZzg
	bNBik6Ihb9yBOq1lDW5g/qI6ToKs2Abwzaf03IjZYRPhav07r38Nms68SS+aWB+H2mujn1ezxX+
	CKcGdbBIzM91qTsZg==
X-Received: by 2002:a17:902:ce8f:b0:2c0:cb0e:ac42 with SMTP id d9443c01a7336-2c1e80f9d2bmr271193835ad.3.1781080887890;
        Wed, 10 Jun 2026 01:41:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:27 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Wed, 10 Jun 2026 16:40:36 +0800
Message-ID: <20260610084053.2059858-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014128_812951_160261B1 
X-CRM114-Status: GOOD (  18.53  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/base/property.c  | 33 +++++++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index a2afd854a604..cf14f9b0a3e0 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1099,6 +1099,39 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
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
+	struct fwnode_handle *ep;
+
+	while (1) {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (!prev)
+			break;
+
+		if (WARN(!fwnode_name_eq(prev, "endpoint"),
+			 "non endpoint node is used (%pfw)", prev))
+			continue;
+
+		break;
+	}
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index 11f3b54c7de0..2e744c6f251d 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -500,6 +500,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.54.0.1099.g489fc7bff1-goog


