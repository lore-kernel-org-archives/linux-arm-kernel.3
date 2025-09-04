Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09457CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Wl+hI7LKm1WzouZGi2FUnVOee5FU/DJYF/1DrUr4+8=; b=ovxTFDTw1ODRwJ5+2ihW0bSxX7
	68xS0sVZPp7RVYr7TD47VUCryg9hl4+NJAPayudq2CbC7roHM/DFq2T7bN+xPQ5kjc/b+a2osdgFu
	IlwPsQIbCVFhoYYFQjBVwaoVH2MWQUB2eipnDWCr1ww2Sio9Q8/fNpM/QD447UsLPUuBXv4bP2MAY
	JT+iZBumhTdI6KGap1zEbVcRZlCllESPYnekrxqYpG7Dg/Xm5d/BsRtojgUn+wyPVHvVOOaNRthU3
	vS9jmWaWDNdC8QmK71RUqEmYlgsjvyqbCTJtXST0l5fzMWwAGKIJI547oSZQwWs5RYPENpId3KPDs
	DJosb+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2g-0000000G14q-0t2X;
	Fri, 05 Sep 2025 02:19:10 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGCT-0000000E8sF-3GXd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:04:55 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHr6r0m2Pz9t0n;
	Thu,  4 Sep 2025 22:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6Wl+hI7LKm1WzouZGi2FUnVOee5FU/DJYF/1DrUr4+8=;
	b=NYgHj6g/Vg1/O3aM0zaNiKsM9/5AWE0M+MT1BsSdoYKVCVsAhglc/3e+rl6eiLOs5CLZEU
	p8tQe70AEDdSmmb/5ApmsiBZI1LDZKjJH0xmKszK1RAXwOOaqqeLu47tW20Su6UpM106Ba
	pxOP8Tmfadsf3hrTu3r4CutoxJegb9mXNXYQVQnb1EDwna1YdaXzvF9xP4e+eLF1IPkX7S
	07r4ex0MXPDMcTKZE3kQ3y5yldcjwX5aw8NG6CqFwZF0VTPR6gM7xoe8feXtNAnx44jfsc
	3d9KtuYwZiJjE6p8ZdMcHPkE8vJ9lLfYsm2AtXxXpPoi+V9wnxjKZHcz5pulig==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="fiyV9Qb/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6Wl+hI7LKm1WzouZGi2FUnVOee5FU/DJYF/1DrUr4+8=;
	b=fiyV9Qb/X6XHDMvj9SqyrwGMjyVaHeGWNnV06LxH5h+7AXdmE6MwD+7qLWSuTTMt+if43j
	GuM8rxwIoYAHt3VOHeLmfbIsPW2qZTGeWvT5Nr81eQmsIE8o5B1TRkYM9e8x4o1q4xhn1a
	c4XBrwzl+8S3vmdMMFmOwqd85SYa1aZids9atdUvWBV7O3zh9S2oLejHhjCAC1pGuUKdn0
	V8EcWY/bbdtMIKx5oP8+yF988vDE+BYnk+IU/c6RbNw5EHFFnLN0eZIObarIYlSwW5Dqob
	AEGsJtS51b9wyrnzdIhZFLD1F0eEmaEhdPLxIy5qAJPQn8Xp6cXvGoDIwIXb4w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: renesas: r8a779a0: Rename dsi-encoder@ to dsi@
Date: Thu,  4 Sep 2025 22:03:05 +0200
Message-ID: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 39f0f10070675c996cd
X-MBO-RS-META: ouccmeteysisoe6uftnetf7iouy8sp36
X-Rspamd-Queue-Id: 4cHr6r0m2Pz9t0n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_130453_955524_337F9C22 
X-CRM114-Status: UNSURE (   9.78  )
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

Rename dsi-encoder@ node to dsi@ node to follow node name pattern
in Documentation/devicetree/bindings/display/dsi-controller.yaml .
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 95ff693399919..2c3fb34abb28e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2949,7 +2949,7 @@ isp3vin31: endpoint {
 			};
 		};
 
-		dsi0: dsi-encoder@fed80000 {
+		dsi0: dsi@fed80000 {
 			compatible = "renesas,r8a779a0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -2977,7 +2977,7 @@ port@1 {
 			};
 		};
 
-		dsi1: dsi-encoder@fed90000 {
+		dsi1: dsi@fed90000 {
 			compatible = "renesas,r8a779a0-dsi-csi2-tx";
 			reg = <0 0xfed90000 0 0x10000>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-- 
2.50.1


