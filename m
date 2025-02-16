Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4347C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cv3R3GZ5j7ybxKWdldciH+Bemda5Bt/xlY41lt6XoL4=; b=J/j8ecmsqt6FW1t309VWG/jFOP
	t8JV/+V0IZ5O3k9pHhrkpWksX0tjTICvarzCINq5Ivsg8+Utxlp+nziQS5SnVNaZyszNES7MN4huD
	WjtLyIjbfYo6wNbnQnGnFYJ4Gvmx4/mS162kVoqZZtRXakQ7us3qmxIPt5ZoHyJZmIO3gT3ywRDiP
	GLWSioJYOt55D3NEWRbAjaFp/i+MXw+I3BpY1k/l2HKwmZUyO7RwergCKo0MTacs8j251simvYHqX
	WXPz1cfPzsdalp7U+NGgJ5Gt+CzoTZpPgHrJMQsO0emaysb6OAXeWX7jNaAjir47DfWsXG63Jrqyk
	4Bkarqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjab9-00000001Uth-07Be;
	Sun, 16 Feb 2025 09:05:59 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaRt-00000001Tdi-3iAf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 08:56:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7AE6625400DB;
	Sun, 16 Feb 2025 03:56:24 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 03:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696184; x=
	1739782584; bh=cv3R3GZ5j7ybxKWdldciH+Bemda5Bt/xlY41lt6XoL4=; b=J
	FL7pzN4ArWXjFDBEVwJC2My+CkZP5MqSlTrvFN1gBfqoA1UG3AVwChZSu/dYXuZa
	iOVFJ7odV+Vv+Is43LLSNRp14GLmzLS4KgrEhkgppL0JMFKmg68GAhwxML671dYd
	pu5Pn4mrBxglXwvtLZv7j80lgYmfkgbGlEgktKX3pOC4XdSNedhCmUNmtp+SUFoc
	X2yk8SycYqZPu0WE0nflXnvXtVPkLS2rE6umExuCgdhV3mSQGg2+cr5qwYC6Jq7W
	ME4hvhL25zgGxHQfQFiTpsjmH8cT/g7cJBIPXzq71wNPRTFsM3zHF3+AiEsX1pzg
	17zp9bM5GawU/ERUEC1ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696184; x=1739782584; bh=c
	v3R3GZ5j7ybxKWdldciH+Bemda5Bt/xlY41lt6XoL4=; b=w1NjdJBNTC8y5hKBm
	dIfMXDGanRuAKSg1ogSWN3flEOW7+OP9i9jisrc8Y2WV1O79qIUvX4yy4ft4bB8g
	JDPhcF7AMzAJ466ygo8bHZaqlPTVKr2bMawLpAciN4+YauX0ccV+62CxxlqYaijt
	HmxPRjr5pEbhHHqO61j7tC3zFYd2GOh0z5dtYmjsECqVn28Aeh+kolO8y0ypHNeV
	zjq2N4w9qdzeufpjnPAEQ6YTYoMfYrZFaFzd2vOvqllxVEx+C4qqgMtjfdSy3Zk3
	KxmWE1aQDT90AoX50enh3Eiscy7iy0z5K0oYykzC0FhhIiCyyNhuZHB2ZpEOuHGb
	BQaqw==
X-ME-Sender: <xms:OKixZ0KRmGx9U4slJka_7NkY3ed-mqDRd3mdVlbDTMuQFLrlsAvXLg>
    <xme:OKixZ0JBRbyz6ky_2u8RvvkSdWLR0M4TDcGGxE3qzABS87mdICEdsdBwGU4yZC8O3
    _Lt9qpkP--gRgUq6w>
X-ME-Received: <xmr:OKixZ0ttVr45a1-tXcdzIDtfpg2LRS8Ysd_4pUd9RgZOFt7QWdd9Pt-nbGQHoGZqZcG9RJtfkEO-gSB_Cz6Kg00oWqGRb4JX_wI1quiup3Hh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:OKixZxZXBcEviSkLrNqLtLBmbp51u6ED0grXvR9wjXYr7H-pBL8Jgg>
    <xmx:OKixZ7acD5Rc3tAnGXWUEfcO_doESv70k8VVwguMvIrvpsaT0E_XAg>
    <xmx:OKixZ9DZH96MxkaKwV_ABsAfTA9krVLYs9v8cZ4_VvrApt_qT_GAmQ>
    <xmx:OKixZxYvns8AGqzGoOCXCtcSJZm3K573qvY70yvbn6gtaVmcU37gSA>
    <xmx:OKixZ_LQbE7vEnOPQrOXd9YiMOMBSaLBmpk7axmcdBLf8HUOETPJ43Hi>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:56:17 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v6 06/27] drm: sun4i: de3: add format enumeration function to engine
Date: Sun, 16 Feb 2025 21:50:37 +1300
Message-ID: <20250216085432.6373-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_005626_024096_99F88524 
X-CRM114-Status: GOOD (  12.41  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The DE3 display engine supports YUV formats in addition to RGB.

Add an optional format enumeration function to the engine.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sunxi_engine.h | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
index ec0c4932f15cf..c48cbc1aceb80 100644
--- a/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -123,6 +123,17 @@ struct sunxi_engine_ops {
 	 */
 	void (*mode_set)(struct sunxi_engine *engine,
 			 const struct drm_display_mode *mode);
+
+	/**
+	 * @get_supported_fmts
+	 *
+	 * This callback is used to enumerate all supported output
+	 * formats by the engine. They are used for bridge format
+	 * negotiation.
+	 *
+	 * This function is optional.
+	 */
+	u32 *(*get_supported_fmts)(struct sunxi_engine *engine, u32 *num);
 };
 
 /**
@@ -215,4 +226,22 @@ sunxi_engine_mode_set(struct sunxi_engine *engine,
 	if (engine->ops && engine->ops->mode_set)
 		engine->ops->mode_set(engine, mode);
 }
+
+/**
+ * sunxi_engine_get_supported_formats - Provide array of supported formats
+ * @engine:	pointer to the engine
+ * @num:	pointer to variable, which will hold number of formats
+ *
+ * This list can be used for format negotiation by bridge.
+ */
+static inline u32 *
+sunxi_engine_get_supported_formats(struct sunxi_engine *engine, u32 *num)
+{
+	if (engine->ops && engine->ops->get_supported_fmts)
+		return engine->ops->get_supported_fmts(engine, num);
+
+	*num = 0;
+
+	return NULL;
+}
 #endif /* _SUNXI_ENGINE_H_ */
-- 
2.48.1


