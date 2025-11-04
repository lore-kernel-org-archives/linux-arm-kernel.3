Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3A5CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azh9EIIHbuJCMsWSwizHtMXAOPOT7L1Kr+T6Whvcj18=; b=bhqP9Z2vecb5XrAWyQzzUIoitL
	VR4pHY/+HkudE0aMAcDdQHKdb9q77ErIG6k6dgPYvbbo5kzwfMrrqxdnAHWN19sGA4DBt16OBvmxj
	mAW86LWmANmj5KAqjFGUCWg2cLmO/JlBwSGR6RADQoRg9pyJaSAVjDB/xhbKuNfMyA5SiGL5cqgof
	nu6weEibFbd0ugWxqy5JH02Cx+Af8G/i/GkuNVz0QNT9FzxF7Ym1BV8YF0zjQRtABJpfvZ6ygpbsM
	tUCywOIUzSK7a5ymAUJGiLZPcXPlEF6JVlPlZEHY+/dAZse4hN+/x5P+gzB9AHk5/gCpcSP9ISPgS
	hc3iVTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHXa-0000000BvzV-1MiB;
	Tue, 04 Nov 2025 13:57:42 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHXY-0000000Bvyp-1NEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:57:41 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d194y1Q2Bz9tTx;
	Tue,  4 Nov 2025 14:57:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azh9EIIHbuJCMsWSwizHtMXAOPOT7L1Kr+T6Whvcj18=;
	b=LJLva/8vnakd1WVyMli1KIfy6g4G6adcT6CMx5KqMxcfiBSbNtyrjOVOf9JMjJAY9Mpj8G
	8fJfpPhe9RHggZAN81rWYsEryAqWAEym3JmRSzmDKRoabRLSnrJdGoZ3LnUrlTFq8sYYmS
	OMOmjjwUSFXz+wA0fLBzc6Sx4k0tld2DRyh7ThCcVnmi+PscZ+tfrVEzklaXUneB7Ap/bP
	zVDw5iBDedskChYAAHojjvIIAA/Y+6swICR+fSxdJvrHOccc0P0JdG1n7qciEqSPvkeVDY
	kHlLLy2iysTrTxm468iKKYqFYXSSOtRW/7uyWgkovFHs/UACHWzGW27lR+DMpQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azh9EIIHbuJCMsWSwizHtMXAOPOT7L1Kr+T6Whvcj18=;
	b=qh8UdAQ9f08fis57Dw3+uJ74MIBOCKZOWdeXUVQTCDlaLfwMhp508+v6EtjY8xpsT7YIQv
	dDQ1TcFWbpga5VC8I156BnBA0nBa2HzXvIERuXE5aUa26icepP5suoMIAWH1bOApXsO5DQ
	xMINS307T7v3KrArprDU2Mya6YZh3Ls31er+Qbs0cEwKiG+2sOnl2oy3KrrD0TGwPKUXjn
	CozBQKxGfHEw4ZipnHFa5NCZnb8pbpvE5zmL8h3wg31cP2PWBL1VnIpRpvZIG1W2InUjlR
	hkmMhhrBsSugRnyHxzr2H0411/yG431gG9VpMGv1w80yid4NDkCHfAomdCoqlg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N
Date: Tue,  4 Nov 2025 14:56:06 +0100
Message-ID: <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: z7yk8gie4p5rbzsz3efh6hjtcqg178ee
X-MBO-RS-ID: be7e89d5fb2248b9717
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_055740_539413_C6B16357 
X-CRM114-Status: UNSURE (   9.96  )
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

Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A77965 M3-N SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add RB from Geert and Krzysztof
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 550da008629c..225a6e1b7fcd 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -19,6 +19,10 @@ properties:
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
           - const: img,img-rogue
+      - items:
+          - const: renesas,r8a77965-gpu
+          - const: img,img-ge7800
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -105,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - img,img-ge7800
               - img,img-gx6250
               - thead,th1520-gpu
     then:
@@ -135,6 +140,7 @@ allOf:
           contains:
             enum:
               - img,img-bxs-4-64
+              - img,img-ge7800
               - img,img-gx6250
     then:
       properties:
-- 
2.51.0


