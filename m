Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26359CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 13:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3qGVfK2SD/LkkPK6FoWnj+YJVjMv068rDYD19OUT+E=; b=zqmmkS7kzfOq+M3KCWDnpymjFf
	qEJ6i4I6c3C4PZ13Y23Wp/XOpdrc0YvC8tSztNMIca3hbUbKBjNmGeVAwa7vgsLuXwNKsGnn0aa3J
	nYsmcX82jIhPJd51bAzI5KsR865E/tylAqlx/ZwyolsfvbIv53jWH3Itnv8B6tLySBamG4nIPYvN7
	V8nWFG8Bhn8EFy1VN/Sv+VbmILKd/k/1q5LsBo12ruCFG7m3sZDhbEkqZqtNXbp4p07vSSFU6LITY
	FRcUbZwg2dPS8BvGhD4RrB9+L5ydLQvthlKPwmMBo7USodRDT1pEb0NpiTORO8JqgMZA0qr/fybcX
	K9M/YpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA6Zi-00000009wFE-26XW;
	Sat, 18 Oct 2025 13:02:22 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA6Zf-00000009wDL-3YK7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 13:02:21 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cphft12WMz9sd7;
	Sat, 18 Oct 2025 15:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760792534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3qGVfK2SD/LkkPK6FoWnj+YJVjMv068rDYD19OUT+E=;
	b=azNoBMwzDYu7YN3k2fzHDQECdIcyHRn1mcQ1dycC/bGPFw5P05ux39ntTX5TQHMikSkFah
	/vJKgnkiGYB7JNODQvYInPlSZYSLt87QOUYxCsStZDyyBc864rS/ZIBvoOh5jlqUn8s2ir
	XSn2VLSq8aighuR84NTb+5eLSNDoYMSC98CW/LcXT1rbqaozXij6jTpS/4ozMFfpwO2jAo
	3gIM3+cnsyAMfYxdN9Ddz1iQcaB83twqcBu8ggTxT4ijdQ4hpUJF8XSk0ICTTJZWKX78Ut
	f1iQrI0xEuQQXDaxCF8NZ0yI/bjfqAvDSnqj8wT8qFm5n8AvFHxQcNcwCEQ/Ig==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YuwkxWBi;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760792532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3qGVfK2SD/LkkPK6FoWnj+YJVjMv068rDYD19OUT+E=;
	b=YuwkxWBiRhkh8yRcvWWEHupD2fZ2TeXeldsxk9WeMX+VcsQhw2EVjvMsZEUyPlnVTRFCsn
	yiYDbEJUaPIHNboCJSiGEzZ2UHbQVFNh3psjYCsROa26oPCdnCneeEDtyXykU9EjxL65BE
	2mIrCojKIJcSzIP2VJwihxJBV3tRNakRZPrf8Okgyx4r5zUWw8KFB+Fj/XtPoZqHEn1HAI
	f1kgooxj1LESFXoOmbjpUbBU0jFEaaLW4XYuECDa1KLhcxusxZpe5g180I1Bg+UwHFwkRn
	hM+zbCd7GxmSxKJNQYjj47jefN1JGhTdUSxlX7fZBW34FXNWmjlO4fVBwTRuXw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
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
Subject: [PATCH 2/2] dt-bindings: gpu: img,powervr-rogue: Rework the allOf section
Date: Sat, 18 Oct 2025 15:00:59 +0200
Message-ID: <20251018130147.12831-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8auxodwaynckaux3p717ss91np4c8kp5
X-MBO-RS-ID: 6f19813b49d4405774b
X-Rspamd-Queue-Id: 4cphft12WMz9sd7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_060220_027886_6F266BF3 
X-CRM114-Status: UNSURE (   9.60  )
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

Rework the current allOf: section such that all handling of
clocks/clock-names properties happens first, and all handling
of power-domains/power-domain-names happens second.

This allows the allOf section to limit various GPU models to
matching clocks count in the first half, and apply the same
for power-domains count in the second half, without conflating
the two limits together.

This makes addition of GPU models with different clocks and
power-domains count easier. No functional change intended.

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
 .../bindings/gpu/img,powervr-rogue.yaml       | 40 +++++++++++--------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index bee4ab1a1f805..829febd8e0f40 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -86,16 +86,13 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-axe-1-16m
+            enum:
+              - ti,am62-gpu
+              - ti,j721s2-gpu
     then:
       properties:
-        power-domains:
-          maxItems: 1
-        power-domain-names:
+        clocks:
           maxItems: 1
-      required:
-        - power-domains
-        - power-domain-names
 
   - if:
       properties:
@@ -108,13 +105,21 @@ allOf:
           minItems: 3
         clock-names:
           minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: img,img-axe-1-16m
+    then:
+      properties:
         power-domains:
-          items:
-            - description: The single, unified power domain for the GPU on the
-                TH1520 SoC, integrating all internal IP power domains.
-        power-domain-names: false
+          maxItems: 1
+        power-domain-names:
+          maxItems: 1
       required:
         - power-domains
+        - power-domain-names
 
   - if:
       properties:
@@ -135,13 +140,16 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - ti,am62-gpu
-              - ti,j721s2-gpu
+            const: thead,th1520-gpu
     then:
       properties:
-        clocks:
-          maxItems: 1
+        power-domains:
+          items:
+            - description: The single, unified power domain for the GPU on the
+                TH1520 SoC, integrating all internal IP power domains.
+        power-domain-names: false
+      required:
+        - power-domains
 
 examples:
   - |
-- 
2.51.0


