Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4465CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRsKkRuXXrcRjbvRngvMO9bdz13WA7D5wKB/6fXyEG0=; b=44xQuNRKaNesWp+K6SYv5n2p8H
	gmzh9JPiq0zB2wVAC4U36vN1lLEfayBJGZOlZfid1teeXZ4DlNFZvpGKMF4Jw0eOmGIJ5AZdvo0fV
	QlofrIw6SXV4182liRW+UOG2nC5vQxNO0GPzmCynuI0DCSQq/eFMqjOzmfWoa6yz3RxzlGN4ZPWAf
	fD770WBUXSAsBuzr1C56m5yqLZQtXtcL//DG0Di5RQ0OGVZRo3n2zagZo6Ygxeo2Dc7PDujhda895
	FcT0Dhh89oWeTAyxJphVRafuAdCpYLW1cCY4H0cbXqE9bD/oMGr+6emP5ghhBgSD+QwFgEuHkHr18
	06W/XNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEV4-000000075Pv-069Z;
	Wed, 10 Jun 2026 08:41:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEV2-000000075OL-0mw8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf2247e38eso67366385ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080883; x=1781685683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRsKkRuXXrcRjbvRngvMO9bdz13WA7D5wKB/6fXyEG0=;
        b=KYkI7wddP4W7WZJtOWxZhqIWll6+QeZvz4CagO3rZ3bEka8h7VTEfkCo+Br50h0zMl
         NsLe6ZJkn7BRsdab9LqC0STaybu06ckREytldqbk7kl1Kls66oJv1ytXeXSgfsRoAAyP
         ehtKTKpu4aZrTNu23tHkBvDmbPMdS0ThZOZG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080883; x=1781685683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FRsKkRuXXrcRjbvRngvMO9bdz13WA7D5wKB/6fXyEG0=;
        b=mOqd9E450AWdKyDQTJegpnkgFnYTl1miDpBvfZAtmyR2GQaXaJfJyR67uatH+BoaKN
         al6+6Tyj99p1RBDjdIru+de9AhBWRkCCapu2Prhtba2JNwq2f3eESdXmpD+b57s92BCh
         96lq1TiaM884wX9UUQx8bJy+/g3THi5lmc3moo4nz2wJuDtxPY2Au0ipURzCCgfYS56X
         YGsJmS/FGlp8dQruxaeT+sd8rBXmzg7KtFQ2qvr5dnYZnk5ncUzbGTLhQiOLnng55PuB
         q+JzAkeF6+Mogovi6NXO9HEb6Ud1UE42Bx6ysuxjeriUXYdjshowvPwZ3Ku8GbNYe6nN
         XFaw==
X-Forwarded-Encrypted: i=1; AFNElJ8mpNZg2mqHoAriOtISc734G2NXQp0+HQHoOdGwWGTP6KulKQL6/gXsIi4+Zp9sMBbepCUKT7S0Gb82LbzuSdKv@lists.infradead.org
X-Gm-Message-State: AOJu0YxDbxMmmleGjnkWeVDRPUYdbltiy7AAN2EZCL5EtZPdLIQw4Jsf
	YNcFLyT4LL+hNszjzcePyzF81tkzIpquWuyemteeVF5VqEAJRbZB0obdxlTE29EMBA==
X-Gm-Gg: Acq92OFAO9Lw4KUk7kKLwoHaAWIz5YxWAOXPbm0xWuEc5Qm3E/aSAxYx6SDojEqt8DE
	SaU350FjJ5WkuvAoSA4paWFn9m9gkpFD4iyzveRlm6rW5LfN5itSXA92iYPWHBASiSY9PXylOnz
	reSFRFK3ErgXF1cTPzBqQfMiFWrfiqWRLsfZG/v0OTBm2CAzJzI8N5m7dz7BULtUbktSji4v2+i
	u2wQg3q3JRh1pIlxZR4wK/P0ud1A4povu3HPX0LEDzidIyRt4LNk9c+0EVr2sAlJY7v/JgQB7+H
	N3ruYEEmYHvX0f2OqwW6ZsOgx/x1YUxgfIP2TF7F+9w7WavNrqhTOMbNtbq5VEfol2wuxSQcpZp
	7FejOeN6Ds+QbTqQ2TcCHUdS0sJBJJI20YPt9M/0CrLhSH0kmm0rSoBEL2DcW0XV0h5crCRiO9t
	OHBz42l6oho1y1YLvKRNadrxi0xtF/yOizRzSrX9xg3aD+46Q6f4qoybJ/e367+zfJtK8kMC8yK
	CgfevNwQnV1bnX8XQ==
X-Received: by 2002:a17:903:3b8b:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c1e85ca6b6mr285765545ad.34.1781080883374;
        Wed, 10 Jun 2026 01:41:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:23 -0700 (PDT)
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
Subject: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Wed, 10 Jun 2026 16:40:35 +0800
Message-ID: <20260610084053.2059858-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014124_234106_AD77FA8D 
X-CRM114-Status: GOOD (  15.24  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/base/property.c  | 22 ++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..a2afd854a604 100644
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
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
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
index e30ef23a9af3..11f3b54c7de0 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -499,6 +499,7 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.54.0.1099.g489fc7bff1-goog


