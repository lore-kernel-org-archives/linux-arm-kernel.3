Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB09AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlB5MQOuYaWQrpOWhB9woaeEf6g8GikGRsA35Bq/gXM=; b=DoEgKYvyqcJ0kjCY7jroEtfP+O
	lBdnNWVfXL5GhnxKtIMAa4VLhMgYnMvi1xyL7cAqf2KQJ/j8b8dw3a5rOa5tSPO0H6n/QkC3BlETK
	om/9pgM+NCbGZBSEE1RnbX2U9UYq1uCClbBNTo+4fGkw3O+lCHI4gVKnS7oo4baG625dRs7Gq9xAm
	Mh43FzjQvd8owOQ2w/OYozB0lXVRoBrUMi5SatIwGJsfJ6urptQg3qkrSbwxIJYCDuUS2+7uTyom2
	QcsExmBrtFp9XnBC7XwPFNzyoEu3WXIzW7If15e/ZmwkjhG0HyXsww6+m0qic+ye7yRJalrLZEtFG
	uPiJM0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2UD-0000000Dsx2-0WqF;
	Fri, 14 Mar 2025 10:41:53 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2KS-0000000DqxF-1CaX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:31:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DA1244284;
	Fri, 14 Mar 2025 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741948306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LlB5MQOuYaWQrpOWhB9woaeEf6g8GikGRsA35Bq/gXM=;
	b=jnN5REUyT8QbnSBd1lYuqg7e/9eOngFqXhr8ESD7QRQvpCSeHJn/BzBaiX4OdhuLJmZ1PG
	ZAugrkJ7tR6HCzyfRempUlSl8KyIQPKPBqZZXydJoqb17taTGsg1u5pd8LnvmQz2dnWsRL
	sKSa1EzNWWYbli6wPq7bwhkSBdwdiqUdX0KuuOi4povOgf/37+VB/t443bpXM+uCp8VQEN
	GVSH91QtQXeEt1zRubonQS1Ovd9WQqY5brokaIBsbRnaedVsxGzTp8WBsHbY5YAt1y3yYG
	8S54lgUQ0UzUlzsf+kTn4wiYdxygSRMbII/ShWtYfCkccSQSmZcKIYWIhv2UIw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 14 Mar 2025 11:31:18 +0100
Subject: [PATCH v7 05/11] drm/bridge: add a cleanup action for scope-based
 drm_bridge_put() invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-drm-bridge-refcount-v7-5-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
In-Reply-To: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufedtiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopehjvghrn
 hgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhhksehshihsqdgsrghsvgdrihhopdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgv
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_033148_476176_88023485 
X-CRM114-Status: GOOD (  14.32  )
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

Many functions get a drm_bridge pointer, only use it in the function body
(or a smaller scope such as a loop body), and don't store it. In these
cases they always need to drm_bridge_put() it before returning (or exiting
the scope).

Some of those functions have complex code paths with multiple return points
or loop break/continue. This makes adding drm_bridge_put() in the right
places tricky, ugly and error prone in case of future code changes.

Others use the bridge pointer in the return statement and would need to
split the return line to fit the drm_bridge_put, which is a bit annoying:

  -return some_thing(bridge);
  +ret = some_thing(bridge);
  +drm_bridge_put(bridge);
  +return ret;

To make it easier for all of them to put the bridge reference correctly
without complicating code, define a scope-based cleanup action to be used
with __free().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v7.
---
 include/drm/drm_bridge.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 5c1e2b9cafb12eb429d1f5d3ef312e6cf9b54f47..a5accd64c364ebb57903ae1e7459034ad9ebf4f3 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -23,6 +23,7 @@
 #ifndef __DRM_BRIDGE_H__
 #define __DRM_BRIDGE_H__
 
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -995,6 +996,9 @@ static inline struct drm_bridge *drm_bridge_put(struct drm_bridge *bridge)
 	return bridge;
 }
 
+/* Cleanup action for use with __free() */
+DEFINE_FREE(drm_bridge_put, struct drm_bridge *, if (_T) drm_bridge_put(_T))
+
 void drm_bridge_put_void(void *data);
 
 /**

-- 
2.48.1


