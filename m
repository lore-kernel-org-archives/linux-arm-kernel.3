Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A31C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 06:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muWc6YiNsdF4ep6300eTVDZM5wKjxIUffmssTrDfe8A=; b=QUSw3la/pm/uMV/+dK/t3FGiby
	psS0IaXSEa4tiYmF6eJS+qUbcwVmxidtnfx3Lu3TjSMHtWFE84NU6ChaJWrf7VO6+2ICgemcQaQYF
	3qsQUZRYN62UhkglEmaKswFhhs1xsISfPyXgSW2DVJTc7ejOUBz9g/r6E6zTvGJAWxBLfuPpBnJIL
	D5eRRg2LKasgrDkakEo4BQdU8gH0N9/ZnAQTpsgLqZA8R2objthtpcI/dBu55WYcQ0RcAubIFsIHA
	nZ38Ax6FJjYcqGtwB+bF2zyw5LXVNiyjq53WqF2kENTZPgf7BAlYWxxpyCrA/5tobY9cV/FW7jtK3
	4Fk9m+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hb2-00000000bXN-2xQ3;
	Sat, 12 Sep 2026 06:52:20 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hay-00000000bUR-3Cu4;
	Sat, 12 Sep 2026 06:52:19 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 562A17A00B3;
	Sat, 12 Sep 2026 02:52:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 12 Sep 2026 02:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789195935; x=
	1789282335; bh=muWc6YiNsdF4ep6300eTVDZM5wKjxIUffmssTrDfe8A=; b=M
	lDUgksSQfhwS1SeQvwtids85hOo30/RVE2g38RcQk1smF6hDGLDbCsc1f71Tvcpz
	wxiYCzBpUmTBqlwOYF8NJCwVtFGasMU3276L6UeGp6PM9bxBLXHW0WZs3PHdYWsV
	dK2fnVw1tpwZv7VlzL7EhtnR7HufLxSo+d/nHAbUIjC/7Opnl+NWxCCNI6iKoKTM
	PTRS0jRSuQESZMgAv7e+ocWhFCpxReDXBsL2PgV9M6Jo/2MFsZGwnACUwNKCXTCT
	V9jRjhZIgjmr43Frgc3GlHiKnGpEAaUsODwxoC/sSRH1djtJeJLJctp8T0AEjJcy
	jBnwcVerbTcZCIEkCZBpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789195935; x=1789282335; bh=m
	uWc6YiNsdF4ep6300eTVDZM5wKjxIUffmssTrDfe8A=; b=jV2N3I12yNcTXbgLR
	KLb5PuuO9oIe9dHPRiT/GK5E9ItAIlJ762VBy6ssV29pbhlIlXRgBP8jnYMQC/+H
	MuVulvspRb+ebqrvdyMwdhCinT3aB9Nxnulq3/crKwm4DmY46FphUSJ1q9XYDmdZ
	4DsPR6zg/eX7td63tJbmYspU7J0L9k4MpwVYEo16S3y0M2iVztmrBj0onLXf+dxV
	qBxpqYAeiyh9NEO7Vo7r5Q1F+ZjaI7BbN7+XZoupqTDYOaIhrYe75tNHdHDrjz5w
	NHk2527EJ1tIILLyJv+n5tlm3pGJ8d/wSvQwzwymdAU0RJ/PzRBx4J9QLv1PWuOP
	qNjkQ==
X-ME-Sender: <xms:nvakapmI0ybuN0gYIWxLtCSI3oK9l4kclKtlsHun440R2ioXesoDzw>
    <xme:nvakalmoSXEcj2g0ZxBbcoyOpvp0NTyUms8boHnhicUl0oTyfYOIdciMaAoI-5pks
    _1aOPMj4L9B3NGC6M5QoliE5uN-Bs5bI4miI13ORXkwxqCRKeVRWoH6>
X-ME-Received: <xmr:nvakaojTbffwo7U-pK4IlAnI7ZJZclhFfCIUqPP7t68HevQe5dE-k8hsCn0VSmNq1p0MrK6slQ>
X-ME-Proxy-Cause: dmFkZTGcFzQLfCTns7TE5rL/P1eVKE8QA21beBwBFkyY9YTeXq4RsTqFTQqy8xwPCXflst
    Bzb2WN8+Z9wMsDPevozKXmCdfbpB7u35gxPBdZcE1OggzV+SpuJLXHq2biTYWRbmSZxKVK
    SGSCjqFmU7DVBX5xWAgirxAFKhQFJBsPmOT+6pwgRseCRI2yQSz8RIt35R9bMFoCkvmZR+
    9iAYcTwRUMbNeagNJ0dRavH1kOhxbKzZutjdkaXg936crjsT5yruCxuJ1iD3z1iXsOeTBA
    gQ1aPtegLyhOeojTrex/RjcmOrlktpryCA6Bl5bNjcl7LPMImDh/uFZbWCql0nAGPJnZbK
    oQHC/jR9dUxKwsQi6AKcF70kVGGtKznY5nSXpDvT9POZfour6tAk2kgygeQlwKj0O/CqPr
    78GTdtZo1hF36ItD+CVCz+LxtCwM0UU4yeoiYyR8u+xBJgEWPOunUU0fLzkMj7QRZnjWB9
    q7A2FHda5iMpedjOO3DEaqKAg6As6j65P6ku7eH/tjgBn7XBis06vWyeawovxQ72GnmEzh
    A15fgczvJqy+8A1g6mkvdSWaK0hVxjzJCwDRXmNZHwHV+K6hRRHE+KcGftyqNqaJZLwZ9y
    b89p/PEushz/MD0vT6rEKyLHiE3yA+z+XNUGQTpBOLCxJ5F2OvCItxOPz1bQ
X-ME-Proxy: <xmx:nvakahfXzTyPcAoC5s-q7JkTQRh5O9xvyEVKjZUrVNYA0GiTt1w_ag>
    <xmx:nvakam-B6eh-hu31yuM2fjtrvIroKDrlcA2wgBkW3NRnMbX6QKqjYg>
    <xmx:nvakavhFHeGDmbFW0mwjdIWGBEPT1Bkj1MB4GHT-nCXpNYmBlXayig>
    <xmx:nvakai9VyLicL9nRm6aIbX66QuebNdoOKPPqV86sRyJ8U6mUKfkIIw>
    <xmx:n_akah2Je6uT0PcziD6xntYNTXEhza25VIfalXqVhHak7GKRbs0v8mYn>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 12 Sep 2026 02:52:06 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v12 06/14] dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
Date: Sat, 12 Sep 2026 18:50:45 +1200
Message-ID: <20260912065053.1519165-7-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912065053.1519165-1-gahing@gahingwoo.com>
References: <20260912065053.1519165-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_235218_059948_6AC9B398 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

The RK3576 NPU has two cores of the same RKNN block the RK3588 binding
already describes, but it wires them up differently: two extra CBUF clocks,
two power domains per core, and a single reset instead of two. It also has
no NPU SRAM supply.

Widen the property ranges to cover both, then pin each SoC back to its own
shape in allOf so nothing loosens for RK3588, and keep sram-supply required
for rockchip,rk3588-rknn-core only.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../npu/rockchip,rk3588-rknn-core.yaml        | 47 +++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a490..3b611b64c 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - rockchip,rk3576-rknn-core
       - rockchip,rk3588-rknn-core
 
   reg:
@@ -33,14 +34,18 @@ properties:
       - const: core # Main NPU core processing unit registers
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: aclk
       - const: hclk
       - const: npu
       - const: pclk
+      - const: aclk_cbuf
+      - const: hclk_cbuf
 
   interrupts:
     maxItems: 1
@@ -51,12 +56,15 @@ properties:
   npu-supply: true
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   resets:
+    minItems: 1
     maxItems: 2
 
   reset-names:
+    minItems: 1
     items:
       - const: srst_a
       - const: srst_h
@@ -75,7 +83,40 @@ required:
   - resets
   - reset-names
   - npu-supply
-  - sram-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-rknn-core
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+        power-domains:
+          maxItems: 1
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+      required:
+        - sram-supply
+    else:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          minItems: 6
+        power-domains:
+          minItems: 2
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+        sram-supply: false
 
 additionalProperties: false
 
-- 
2.43.0


