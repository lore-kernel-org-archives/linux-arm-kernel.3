Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CD1C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8QiiE5a7XbqIEk5WkGXD7LJd07NSVV9giChXlOvXHt4=; b=oFY6+stZvX0dIU24vfEI4xW3Iw
	U7EMMUW0emEQHZH+DklUIg6pjYpNSHRi8Zzl6dZ6yPHoBrvNFwD9VKl2Fu9lKmGCUzKz78cG6eLXK
	BL9tDOdbh0YsDoMjDgWAQAwsScLXALGHtGoECM6CJX91SCwTZFaTw15R/JBqCMr8zsmUu2hfPxVCi
	evkUIVViu9nBTTkugzLG6FR96DhMG6+k96D8Ck9O/130Sk1xYFGCFWDevggZM/z/wKgkp4biKBVEa
	/RmR2Vb+0ZfJJzYImpoUR9HmlMe5aN8sUsZXa2qSidhAghfPWGLxmrdJLQaDavbpcLK0u+8sFTXFG
	OFHJ0yCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxu6-0000000AxDI-4BFW;
	Wed, 15 Jan 2025 07:33:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxrf-0000000AwaF-0SmL;
	Wed, 15 Jan 2025 07:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=8QiiE5a7XbqIEk5WkGXD7LJd07NSVV9giChXlOvXHt4=; b=PTPSqzA81efaOP1s01k4/zTNOD
	vFaJ80TqqWG9MhxCbm7KxNB55HBDJ4ICrdPUsrxQ/LK4XIJ4XsSYSeDceLvNibiNO50NGczIR1CbR
	Jstuzb4z4NIadkXolswJCH0+xaOYNBwBUFmBxZjSTXK9+V/1iAx7lAR4RuqCjn5w30PkXAyuR2W4g
	rvCth1EZ4VGAZ2nyexMTnYgcSQvbl99ltDrmhuDm0842rtPklbrWF20FIjkYdMfk3BJR9zF14onC9
	UToNk1Ib4lXorupCyFKTswdCvZJch+K0KDWqaGPWroWZL5JrH2iPCjKnoKfaMpgzYIFs/KFKhwsUX
	vwOLi5gQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxrc-0000000Ao7i-0jXe;
	Wed, 15 Jan 2025 07:30:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so15635875e9.2;
        Tue, 14 Jan 2025 23:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736926253; x=1737531053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8QiiE5a7XbqIEk5WkGXD7LJd07NSVV9giChXlOvXHt4=;
        b=KGbjJk1/0Np8R9y6m1jiJYARfy1nJIhDcNUk37EhV6lrjL4e9QOdM8FSSP76DkpLK8
         vjqjGDOZAMgun5mMRIhzn82puCwHiyzNumLS8p7xpNckDQj4FZzzddV+mBxX49tetPVn
         y9BkZllrZN++WNeD9eJtUuIQtXYSwPICLtRausaMII0D3kdDQfpptisTnHjbNen/C6Co
         6UcW/SrKwrIzAIeg+ILHrHwd3g8PX56L9USrtIjdnvMOZhZvNK4MPoBDLAXT+W2LF03d
         GX52hRMCDXc0d61uR2DyjOdPKJJHM6KAcpVlM1ZQAPvrsqy0Cd2O7rbUD3iTuuyaPjkb
         NvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736926253; x=1737531053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QiiE5a7XbqIEk5WkGXD7LJd07NSVV9giChXlOvXHt4=;
        b=NRohQcCDzqLMuYs1EUw31u3w9X/JLnlcB7Da8SEBfmxZ2wlvq80BlFa245RxuekATm
         tMIFmkLISAlQFWI8dShm7fOmGdBRw7wegub7nF0ydK6Pr3v9mQHpw58X9i7hhMfsHDMk
         YvD+ao69kBkeBhsL2u1U4U+uBiCXnEsZKnr7fWd7El7XyLw3+EZ0nnHFX37bsOXnCChL
         OrWTRYUuwBTWhqqdlpH0nm9g+pjlz5yDYYgVxSraNBmLH8ioI1Qn8VqHjP8TjD76OtZM
         T8NFpLn/MEtRthBLcOEOIWsT8xdWPF9bFg2DMJf1WbiOw+2DtJgqx1Duaxnf+rFjAyrL
         QJvA==
X-Forwarded-Encrypted: i=1; AJvYcCVC9KQYyWvcEgcH70Nw+GtcW1CEoTLW+Rtq0tmHJlN3qV/n0ZOKsK5TpULRnfWErzIA4MxCejKOgLmuCo5E92w=@lists.infradead.org, AJvYcCWy/ZabGumT1iT8KIaLZgEg31L18n3Rj2da9aXFsdf34tg3i9gnZ/qoct/mx5qj7d62nSC2O92bWEItT3VdGwZE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy52IAY9XTvfbJ6T97CJ0KtdM2Et9D495Ym6TKaHIsTEEzSfamB
	WN314it4/HhFw1ViDSm8+cQd+JFvLzOZcoKeTI7c4Pj6VLqIF8ck
X-Gm-Gg: ASbGncud+f1bHrzQRc/u0RInqDbYGTdm25EAqaObT7smekR9D7slLoMwVyw1N+8pxtu
	hqsxfIYcwld5APNyBmvmU6TgkSU0w/7qsm4MhleNMRtDaHs8H1ci0qllU83i+u5/2bASUTkoSIA
	noED/4cCqNfjeXbPJhOVNC0EHe3iLpLFJT6nZBKFSjwjoQ7iERwu3EeTuM3MIKGOdsow8ddQadP
	OXuMnPswOpYcIxIRZyWGRN1w/l/iB4zcBnFZ2ehtEDrMKiINrZeoq1/+uwW/V09GBnu3KmpYoXB
	qP8ANP6PtLBNHJDKz99724bzZA==
X-Google-Smtp-Source: AGHT+IHVUwzQK1q+khSi8wZdNztGEsXhavyh8wvmq9P54ulqNuTuBzPt7kEEZDwFltEEBqAclFXm0g==
X-Received: by 2002:a05:600c:a0a:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-436e255ded6mr270508535e9.0.1736926253029;
        Tue, 14 Jan 2025 23:30:53 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7499932sm13313065e9.7.2025.01.14.23.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:30:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Add eMMC for AN7581
Date: Wed, 15 Jan 2025 08:29:50 +0100
Message-ID: <20250115073026.31552-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_073056_341477_3DFD1064 
X-CRM114-Status: GOOD (  12.90  )
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

Document eMMC compatible for AN7581. This eMMC controller doesn't have
regulator exposed to the system and have a single clock only for source
clock and only default pintctrl.

Rework the schema to permit these new requirements and make supply
optional only for airoha,an7581-mmc compatible.

Also provide an example for airoha,an7581-mmc.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
This depends on patch merged in clk-next 
bfe257f9780d8f77045a7da6ec959ee0659d2f98

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 64 +++++++++++++++++--
 1 file changed, 58 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index f86ebd81f5a5..6dad5455b369 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8183-mmc
           - mediatek,mt8196-mmc
           - mediatek,mt8516-mmc
+          - airoha,an7581-mmc
       - items:
           - const: mediatek,mt7623-mmc
           - const: mediatek,mt2701-mmc
@@ -48,11 +49,11 @@ properties:
   clocks:
     description:
       Should contain phandle for the clock feeding the MMC controller.
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   interrupts:
@@ -72,7 +73,7 @@ properties:
       Should at least contain default and state_uhs. To support SDIO in-band wakeup, dat1 pin
       will be switched between GPIO mode and SDIO DAT1 mode, state_eint is mandatory in this
       scenario.
-    minItems: 2
+    minItems: 1
     items:
       - const: default
       - const: state_uhs
@@ -170,9 +171,6 @@ required:
   - clock-names
   - pinctrl-names
   - pinctrl-0
-  - pinctrl-1
-  - vmmc-supply
-  - vqmmc-supply
 
 allOf:
   - $ref: mmc-controller.yaml#
@@ -335,6 +333,40 @@ allOf:
             - const: axi_cg
             - const: ahb_cg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: airoha,an7581-mmc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: source clock
+
+        clock-names:
+          items:
+            - const: source
+
+        pinctrl-names:
+          items:
+            - const: default
+    else:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+        pinctrl-names:
+          minItems: 2
+
+      required:
+        - pinctrl-1
+        - vmmc-supply
+        - vqmmc-supply
+
 unevaluatedProperties: false
 
 examples:
@@ -389,5 +421,25 @@ examples:
         vqmmc-supply = <&mt6397_vgp3_reg>;
         mmc-pwrseq = <&wifi_pwrseq>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/en7523-clk.h>
+    mmc@1fa0e000 {
+        compatible = "airoha,an7581-mmc";
+        reg = <0x1fa0e000 0x1000>,
+              <0x1fa0c000 0x60>;
+        clocks = <&scuclk EN7581_CLK_EMMC>;
+        clock-names = "source";
+        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&mmc_pins>;
+        bus-width = <4>;
+        max-frequency = <52000000>;
+        disable-wp;
+        cap-mmc-highspeed;
+        non-removable;
+
+    };
 
 ...
-- 
2.45.2


