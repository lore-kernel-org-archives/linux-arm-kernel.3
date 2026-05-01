Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC836FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eEGH/Mz9b26kwzXLbg9yiEa8TTkjExptNbsoCdY3tLk=; b=vqsn2zzUZC3xlvmFUvgESZzNbi
	6iOg2W1t1DHKXDJh56lF8JLbDgebjaJSpzW5fuUI7awuy5FkJpeUIwudh3F1sBfHra/1s9prKQn6O
	YhOwdIvsXmXe/DJpXQxA3OHPwBUHrRPEyEto9RBum+/2++UkxW5JLRPLhAJz0beNbQ+U2X6bi0bvU
	TXIxlRFpqwdDxAbOysjJ/qjVvvtdl0I3m24CUW+iXKq74THg0hYIda2b+kX7Q46lvyIbSgvBh9Hlg
	eXAcq/k2ovbmrBcRqpMMXxxwmx6vdVO5JnHvlrHulM3JpZrSaiXw/L/0K8jMhtI7nWqEskosWuix8
	isKwhGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIiNG-00000006TVT-1FFB;
	Fri, 01 May 2026 07:33:22 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIiND-00000006TV8-1Fo4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 07:33:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-356337f058aso1086464a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 00:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777620798; x=1778225598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eEGH/Mz9b26kwzXLbg9yiEa8TTkjExptNbsoCdY3tLk=;
        b=CWAtfx4MwCLcETvIE01vUg+JuWz7HuF8njCUSsx1ITQd8v94WrMkwtdv28gmSyXCal
         0KzGG3uXQ8DXaD6XhbNd53yX4ixkiK08YjmJ8QU/PROZ0D5lDDueDwcrujD4OW/cI3RQ
         n2OGPcXwE1ul9XQnT9mr9D7JjaUub4E75pVJtd3BPOspaBU29KfDr4Bjy+o5Ef9djB5u
         4ZqGkdQp/WAoPoSmxYozcV36ogt+v6DPf5kEGX/vHoIULTYOU51klIlGdQ8VliPuR4Jh
         sxTRxAtsCfM4P76aE/4mYUt0xUlu89PAd/fb6XrPMwc+U2u2oUtTurGptWQMC/5+Z7j9
         RW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777620798; x=1778225598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEGH/Mz9b26kwzXLbg9yiEa8TTkjExptNbsoCdY3tLk=;
        b=Loart9kXFjzzfIygsiFFOg63X/F7+JVM0RWEJ0coMth+JrRt0TLguaxRtzOXwoxLHl
         N2iz27Dds2npyndYOyFDXST+ZHjtV2MRAMKp9Zs9GXJzhvjlzJnfIT7FY+4w8Oj+Vsu1
         5qrI0dA3DJwMX3LyWGTjuw9PkqRWM3xtj9vMYctA3b05xxG4VfTb/GM6gSNNI2eapm+P
         +gUqTUgVsSn/txm+PAn0jsMFOej5Di+vI+xVtINDpbWq2dXPcImcJfkfII3ZHuSJ0bO6
         gG5QaLVKnKF1ANn6IrW8yyTcZB2zWhzWM8z1Gfs3LWLcJHVUtRqV8vdzeRUPcQ86lmxc
         HSRA==
X-Forwarded-Encrypted: i=1; AFNElJ8TbrpEq+UDaMhK1scZTZtM78ONQajKtWzhH0ffpByXq6z1OCxR6Y107WeG4f72S4odH45WONoQKd/rdn2BhxM0@lists.infradead.org
X-Gm-Message-State: AOJu0YzFQHuxW2eLSLdTL2shaTtn/MSVp+YPrm5UzgHvY1rDK+nFxGz7
	pvf57pRbUkn/vwFQoKkk7oM6p9uTJwbdxPfBlAxhtZFEBc0zduBQtWip
X-Gm-Gg: AeBDietLMrMi5NqqOraOEjSupCi3HqIXZY2nc/9OlDylrakDmi9JRUYRoipZ7cbBk4A
	cGZgzcpDfj/MYn/a1wZ9DIjBGuDV1erQBlpcXdbhos5bWb/2/GpSAUInHeJpilZhR3KAtZqjvyg
	KjNVhiC0Cf15/OX7lXmVXUyWiJiu8l0/OZFmBGXqfw+dPV+sMaODDpeZoqW6rWhgd4BXuD3lzue
	P2pR5taERY2BO+eM4j7mbq5OmBPRu/LDNHzsQ3FV4Ju/RxHqM66MRe5LMqwenBLV1e7nkonQm5d
	1qAuZ7iU/iFtqgCHJ7NgUrYp6g8TNHI2kYDpbBF0Eko0lT6gkALgVZwVe8VMT/WaRP/TA+pbgZ0
	gtiPzyMAGY23s1Y+Lo7XZi1ZnnJp3UdmQLtbRaeaGb2oaWSpngndEb0CqKR/LHkOD1hfgC52m46
	ur9ZpstGkHt99I/PUTexCJ7WgV4gdntFoH/OmvW7M50UULSeU3jbzMeaXU/OZZer8mfmdcyQxrw
	GcOAg==
X-Received: by 2002:a17:90b:55cf:b0:35f:b940:4e81 with SMTP id 98e67ed59e1d1-364ef501f66mr2206239a91.16.1777620797619;
        Fri, 01 May 2026 00:33:17 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebf12bcesm1481466a91.7.2026.05.01.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:33:17 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: ukleinek@kernel.org,
	thierry.reding@gmail.com,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH] dt-bindings: pwm: stmpe: convert to DT schema
Date: Fri,  1 May 2026 07:33:05 +0000
Message-ID: <20260501073305.5866-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_003319_367379_153AA28F 
X-CRM114-Status: GOOD (  15.31  )
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

Convert the STMicroelectronics STMPE PWM controller bindings
from text format to YAML schema.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../devicetree/bindings/pwm/st,stmpe-pwm.txt  | 18 --------
 .../devicetree/bindings/pwm/st,stmpe-pwm.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
deleted file mode 100644
index f401316e0248..000000000000
--- a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-== ST STMPE PWM controller ==
-
-This is a PWM block embedded in the ST Microelectronics STMPE
-(ST Multi-Purpose Expander) chips. The PWM is registered as a
-subdevices of the STMPE MFD device.
-
-Required properties:
-- compatible: should be:
-  - "st,stmpe-pwm"
-- #pwm-cells: should be 2. See pwm.yaml in this directory for a description of
-  the cells format.
-
-Example:
-
-pwm0: pwm {
-	compatible = "st,stmpe-pwm";
-	#pwm-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml
new file mode 100644
index 000000000000..4d5b43c9e7fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/st,stmpe-pwm.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/st,stmpe-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STMPE PWM controller
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description:
+  This is a PWM block embedded in the STMicroelectronics STMPE
+  (ST Multi-Purpose Expander) chips. The PWM is registered as a
+  subdevice of the STMPE MFD device.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: st,stmpe-pwm
+
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    stmpe {
+        pwm {
+            compatible = "st,stmpe-pwm";
+            #pwm-cells = <2>;
+        };
+    };
-- 
2.43.0


