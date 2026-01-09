Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3730FD26D6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fx82zODdeO3gKL6t5I1oslvvMFpKWHTuu8kh4m+oyjU=; b=f+BfkpjLYL01Ecmiiz/+0esWfv
	jrnt1nnor+hfLfIkJhlsu0SHTRU+5xNfeKEwy5qLqFhz9SsakYIjtaKCbJdMRn/GOvRgVA8OOonNk
	3dgYOWVFii1KX5y2QhUrTl2aFHVEnlVo4meAyq7zZw3FWota4Jg5qXB6k2OR9a0+qJggrk1oTmUB0
	0UpJDLLOhnWMLsShG2Y7QlD9Xr9WSSXLShkOI5Sy20VS1bTJZy7mpSK96FD+rNOt5XaK8zM7EMOHX
	tVUrCggqPCjFCBTpguXfhvXEKjntYG+XUbV9cUjRM6libf/wVSHtXX7q0eHt+5wX+aJQj6nRdzdJR
	xnkmKBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFAF-00000002aEk-0wd2;
	Fri, 09 Jan 2026 16:16:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFA0-00000002ZtI-2JBl;
	Fri, 09 Jan 2026 16:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767975382;
	bh=2cfBe2HMjZ1TVCyq7yRqYr5Xf8tgJn9wnLlQqFOVpSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUzfcDnG7flTDX5MHJ0SaSz0mj816vvHeKbsvK40vO39QvDjXQBeG0Guk6fY5K5Yu
	 06G1t1Mgx8jV+68vYajhe3DNwhcWVoZIbCLMkJerPfyQ0D5okczqZINBWLi/zvxb9V
	 vH0jS7hAaphyOMk2pnkU6X1mF0LLPpK45r5XCttRHswIYJWdkdqQiVVsu5n8/n7IEt
	 5K+JeE+MVe2iStyAzvbTTUoXYQXn9tfhfM/wX53jiXz0w7UbrpH21XHofpkog1ivqD
	 ukhAqvB3OP/08/Bxw3ZFvXaj9y9UtkSqzLAb4zJezijZQqk1cXTiWV7QmjKRD7uNLD
	 24jyoB9y5C5Gg==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F245617E385E;
	Fri,  9 Jan 2026 17:16:19 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v8 13/17] media: rkvdec: Disable multicore support
Date: Fri,  9 Jan 2026 11:15:29 -0500
Message-ID: <20260109161538.1294449-14-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109161538.1294449-1-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_081624_817339_DCD9F3AF 
X-CRM114-Status: GOOD (  18.09  )
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

Similarly to what is done in Hantro, avoid exposing equal video codecs to
userspace. Equal video codecs allow scheduling work between the cores.
For that kernel support is required, which does not yet exist.
Until that is implemented, avoid exposing each core separately to
userspace so that multicore can be added in the future without breaking
userspace ABI.

This currently applies only to RK3588 which has 2 equal VDPU381 decoders,
but will be applied for all SoC supported by rkvdec that has multiple DTS
nodes with the same compatible.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index ce96a0470d4d..af2eced90026 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1269,6 +1269,49 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+/*
+ * Some SoCs, like RK3588 have multiple identical VDPU cores, but the
+ * kernel is currently missing support for multi-core handling. Exposing
+ * separate devices for each core to userspace is bad, since that does
+ * not allow scheduling tasks properly (and creates ABI). With this workaround
+ * the driver will only probe for the first core and early exit for the other
+ * cores. Once the driver gains multi-core support, the same technique
+ * for detecting the first core can be used to cluster all cores together.
+ */
+static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
+{
+	struct device_node *node = NULL;
+	const char *compatible;
+	bool is_first_core;
+	int ret;
+
+	/* Intentionally ignores the fallback strings */
+	ret = of_property_read_string(rkvdec->dev->of_node, "compatible", &compatible);
+	if (ret)
+		return ret;
+
+	/* The first compatible and available node found is considered the main core */
+	do {
+		node = of_find_compatible_node(node, NULL, compatible);
+		if (of_device_is_available(node))
+			break;
+	} while (node);
+
+	if (!node)
+		return -EINVAL;
+
+	is_first_core = (rkvdec->dev->of_node == node);
+
+	of_node_put(node);
+
+	if (!is_first_core) {
+		dev_info(rkvdec->dev, "missing multi-core support, ignoring this instance\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static const struct rkvdec_variant_ops rk3399_variant_ops = {
 	.irq_handler = rk3399_irq_handler,
 };
@@ -1332,6 +1375,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
+	ret = rkvdec_disable_multicore(rkvdec);
+	if (ret)
+		return ret;
+
 	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
 	if (ret < 0)
 		return ret;
-- 
2.52.0


