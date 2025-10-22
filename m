Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FC9CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 03:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=39rT+XhokNO2NN3dlFbS1lzXeQziRCXFI7W5KY5YjA4=; b=zs6NWPbPs/9EqVhSM+7ijzR9aG
	9AEFW/S4sZPsq/QKe83olOSfWjkTGsMs6R3Htw4oJIfzHiZ3chEGoJAbrpWl8BZhMQNp6q7i0S1gx
	3IaXe94dWz+fbR6Ljhn3zR1wGE9oQj1bH6SyPJKPaort08du8yqw8VVKmHQG0eswMV6CCpOKr8E4r
	8yPYnd1V1/4nUhQgHIUdsUSX3ZIsjfBwMuwWZJjnYbZcjPP/JR2dQdR5PZCINraC9iaF5KSo291xj
	vYSh1vN5CfKobcaohwFATTPMA+Kf507Hb2Pm8q7AiSmtVvhK9JU74J9OiFoT97ot8HfKrZBh7HicA
	tKVTVcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPh4-00000001Lrq-1jaY;
	Wed, 22 Oct 2025 03:39:22 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBPh1-00000001LqN-2K0N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 03:39:20 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4crvzP59zGz9tZ9;
	Wed, 22 Oct 2025 05:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761104353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=39rT+XhokNO2NN3dlFbS1lzXeQziRCXFI7W5KY5YjA4=;
	b=HVjSZzdB4B/SuznWkpy4c9URFolCuiRo9GuA21uuifCQa5qLv2sJ77UAnPnSyhIDoktJ7/
	N/Kt4DGWQLtZNHIc6RntfKGaAWl7JQ2Ltf6ur3pDI7oBhe54ldbd7h6qPEVeAYchmUEwe5
	tXIg4uxM9eXOglpE6F+UCHAwpi+ziyS9n5yCrRTSL0ULlNYhhd44EiG6ZTzWaJr3Gg94F5
	xre/In049qqh1/yxSWuxtICMOv8ZCEStKJr3tiZr1zYxELrLbSLkbyDifskcXu+HKH1uQG
	MOgO0K9ux5uWpMytYI891YbZ3UkKy+qSzKfvoijOzoTGzuVTvu5+al6yBwvc8w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761104351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=39rT+XhokNO2NN3dlFbS1lzXeQziRCXFI7W5KY5YjA4=;
	b=pZTg+7RC7tElUd5AKiWxIPGEIMio4ZSjWoDzC6Eudxr3yBEsnNRw2a4BWQv/ww3IsjSrHY
	aOMXiFAjvFdi9ZMCYbRpN2YOgaewe4N2Z+HD3ZMbhTTarWx2u8fZJ3g+Xa/eVwP6HjNNPH
	r+l6WeiycNM3h7xqf4m+BAoZ+7cq4pEFZ6YpAvln118JKqOzzpQLpNkKzYgDRaZq3SN0Ex
	pj8oVoCtyULWxg8TtcomVMhTmYBhVlIIL/R77ExY7LKSobB9l+U2HYRlXfvEKV9NLW1Tej
	OIdkSCfsqM3CGyTwHlGaqnKTdrzkrSLTJoM1tgmKCbwJ3oamSwvKLsoF005Lww==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+
Date: Wed, 22 Oct 2025 05:37:55 +0200
Message-ID: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 276ab661eaf958c0013
X-MBO-RS-META: 36ubt5r5k9o8qy3jpzdijb8ruxmt9tyy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_203919_751363_9979947E 
X-CRM114-Status: UNSURE (   8.79  )
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

Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13
for related userspace bits.
---
V2: - Add RB from Conor
    - Fill in allOf section for Renesas GPU, set fixed clock/clock-names
      maxItems count to 3 and power-domains/power-domain-names count to 2.
    - Use renesas,r8a7796-gpu for R8A77960 compatible string
V3: Split up the allOf section addition
---
 .../bindings/gpu/img,powervr-rogue.yaml           | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 829febd8e0f40..aa8b2069cc24b 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -13,6 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - renesas,r8a7796-gpu
+              - renesas,r8a77961-gpu
+          - const: img,img-gx6250
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -94,11 +100,14 @@ allOf:
         clocks:
           maxItems: 1
 
+
   - if:
       properties:
         compatible:
           contains:
-            const: thead,th1520-gpu
+            enum:
+              - img,img-gx6250
+              - thead,th1520-gpu
     then:
       properties:
         clocks:
@@ -125,7 +134,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-bxs-4-64
+            enum:
+              - img,img-gx6250
+              - img,img-bxs-4-64
     then:
       properties:
         power-domains:
-- 
2.51.0


