Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A203DC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBTI6/Bcswhpw8thl+NLYiq9PLKUDYQ9vhvmnSdscmM=; b=enHq/HX1EzQDSNJ3goa1+j9nXJ
	jrf+rkMyYGbBqF4IDw7WFdTKALmUxmq5nxsjN9wdxgghjtn4z9muiAfv5b4nRL3k9qzx9tBCpeV2T
	Zppg+1CSy3Z3TqQ8Q1/euBOGezmf6F70/2ckIAiUIqJEZqZBNGyAhjOSvzRsXYZn3jp0n3z20N8YZ
	qKiSmA6lC27bi2gNYzK17lDERq5w7yF9oQ1uyAas8KvpHAfDGBWo9iIDn++J7cU2hLOSlY8EBZW+x
	su4iryOevT1ZTj5ewLCbpXuHaUFdEDpFkg0MKendaDkIXDLj/1E6vi/P6a8TDCG8LUh2NT0u4+q9V
	2AXOlrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg77l-00000007HyZ-3xZM;
	Thu, 06 Feb 2025 19:01:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6PS-000000078AU-0zoG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:15:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4304344264;
	Thu,  6 Feb 2025 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738865728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBTI6/Bcswhpw8thl+NLYiq9PLKUDYQ9vhvmnSdscmM=;
	b=IBixXvFRbyY/P5+MTKGjMacyLR8bGcsqgmm3KY22v1Cdo5rb6K7WZ5F8RqhTqswlBLkos/
	zhyJFtk3xhdqU3oinvUwC1iBIIGjcv9cDVU0YfxcmNXBNNVMDGlCu5TzgeHCR3/Gc/8mpy
	yn17NVwxcEf09RzdlxcM7xZ/9LnoHtKoSw+GhgENWZhNG6E7dATtzsEAmNqt5N4ZZNYVe2
	o9lPiF/vWt1BkXJTDrWU/5veT4QYSoeVE4rxlek/bUdmFYppcYqtOI6Ym4KfICaRafaRW3
	f3/d2BABH6ZjtJoNFriDF2Ttdg8h89KgN+9/OpTEBuEdqf46Ts474RUtfPOHVg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 06 Feb 2025 19:14:34 +0100
Subject: [PATCH v6 19/26] drm/tests: bridge: add KUnit tests for DRM
 bridges (init and destroy)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-hotplug-drm-bridge-v6-19-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
In-Reply-To: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpeduheenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumeehrgegtdemvdgufheimegrudelvgemudgtjeegpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefkedprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101530_417149_87DE1A69 
X-CRM114-Status: GOOD (  18.31  )
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

Add a basic KUnit test for the newly introduced drm_bridge_alloc().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v6:
 - update to new drm_bridge_alloc() API
 - remove drm_test_drm_bridge_put test, not straightforward to write with
   the new API and the current notification mechanism
 - do not allocate a drm_device: a bridge is allocated without one
 - rename some identifiers for easier code reading

This patch was added in v5.
---
 drivers/gpu/drm/tests/Makefile          |  1 +
 drivers/gpu/drm/tests/drm_bridge_test.c | 72 +++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 56dab563abd7a7ee7c147bd6b4927e2436b82e1d..909f98a132bb1d057b2666e8b891683ffb11cca4 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
 	drm_kunit_helpers.o
 
 obj-$(CONFIG_DRM_KUNIT_TEST) += \
+	drm_bridge_test.o \
 	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
 	drm_connector_test.o \
diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..dc5e9260cedaa29126fd6af25a6ba2f6eee05a87
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit test for DRM bridges
+ */
+
+#include <drm/drm_bridge.h>
+
+#include <kunit/device.h>
+#include <kunit/test.h>
+
+struct drm_bridge_test_ctx {
+	struct device *dev;
+};
+
+/*
+ * Mimick the typical struct defined by a bridge driver, which embeds a
+ * bridge plus other fields.
+ */
+struct dummy_drm_bridge {
+	int dummy; // ensure we test non-zero @bridge offset
+	struct drm_bridge bridge;
+};
+
+static const struct drm_bridge_funcs drm_bridge_dummy_funcs = {
+};
+
+static int drm_test_bridge_init(struct kunit *test)
+{
+	struct drm_bridge_test_ctx *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ctx->dev = kunit_device_register(test, "drm-bridge-dev");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
+
+	test->priv = ctx;
+	return 0;
+}
+
+/*
+ * Test that the allocation and initialization of a bridge works as
+ * expected and doesn't report any error.
+ */
+static void drm_test_drm_bridge_alloc(struct kunit *test)
+{
+	struct drm_bridge_test_ctx *ctx = test->priv;
+	struct dummy_drm_bridge *dummy;
+
+	dummy = devm_drm_bridge_alloc(ctx->dev, struct dummy_drm_bridge, bridge,
+				      &drm_bridge_dummy_funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy);
+}
+
+static struct kunit_case drm_bridge_alloc_tests[] = {
+	KUNIT_CASE(drm_test_drm_bridge_alloc),
+	{ }
+};
+
+static struct kunit_suite drm_bridge_alloc_test_suite = {
+	.name = "drm_bridge_alloc",
+	.init = drm_test_bridge_init,
+	.test_cases = drm_bridge_alloc_tests,
+};
+
+kunit_test_suites(
+	&drm_bridge_alloc_test_suite,
+);
+
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_DESCRIPTION("Kunit test for drm_bridge functions");
+MODULE_LICENSE("GPL");

-- 
2.34.1


