Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B170FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IxUbYz05EixkTPFqKStUgtk6UPZfDa5JQwQa/HwWCZ0=; b=iLasXbDghf8huz1s3vYeaowDTz
	pIyYBcM30sbGpbCzSNvCOFDOGOK5novoX/VWmqRqknOZh3ucsA/H5OWNFSAEYm6XekPPVvZa3oUk8
	fIhSiFydjfTLa8LK49UYuw9KUuBByOe/9MsgbffGSvIS8t0vHPdhLQfmuSGNKODt52MuX+2G26heT
	HDF26IW6fyMOaCvjYrxFS9UlkUjHpY0+WE8p7XjWhKZppa+yjBcvCcRR35CuFCMLZzkiR9zS1Fr3N
	UP2AVxM8iKRk87+d6UR6wXkyYRJrwUJQcaKDjLciSf4+jMsO0BfzUp/Q14zU3i+4cqQdz+LGU9amY
	XcrJ5i+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsM2b-00000008YWv-2w9F;
	Wed, 12 Mar 2025 13:22:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLBu-00000008Ow3-3uLD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 12:28:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2235189adaeso16030325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741782486; x=1742387286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxUbYz05EixkTPFqKStUgtk6UPZfDa5JQwQa/HwWCZ0=;
        b=avWc+fS+0WSdJwnqlNI+OWYKjMC1te0L2UwsqSj7xmTZjHYNFGdNDixcaT7G8Aaeol
         HJRBL/UyzlpoTrfjOkz0qMVaAv4q4wR3iMH3qQ1Feo4PrwJrv8hYoX4icfqS/JJDA9Jj
         +KaKemHKGracd+LoVOGy2U3KxqMzoKk9RuxtyyRUmtf2X+eh/SQxRQcTy2wORoCqYkZO
         uDQqMO2rwr8vKU58b5VlX6cg01pTj+I8s4LA4H9OqWd+osc0yry9dc4FzURLlAPv/WXU
         Zl5dBKzP6v3x0vzpmanzimvH4MzWkFXpTPkTfEGro+sLYJmyK+g9cKoaMYEOHy1labWt
         5t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741782486; x=1742387286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxUbYz05EixkTPFqKStUgtk6UPZfDa5JQwQa/HwWCZ0=;
        b=kzud7XVEPjfcPKr7Hyp1oz9GmUiWpW05WKEPwyDmAvtMYfFtootQF8+DV4i/F+v9Nf
         7Y4loBDOA57hKSOPLD7v1I6L4xnnXGjNQWmmVQu51DHkcZrqsusolgU/+CHQQsOOf0eI
         qNfL/c76m5bsCaBwE2LnXh7BExUD/4w02p9g3+cEHCMEz7uQh4ZQdQbKcntQML6d95jy
         uxchHn3VyVith1XMKndWhLryiFWr4YPgRIrxTB3GRaVIbIVY4DIDgvb79/aBIwf4PuWe
         uxX5+/rlY4+ONoTyMIQ8EzSvTEOf0SCEx40NtMqA6YTnw+FLMrvfLp1b8RMGfWc2I92w
         iPaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4qZb0PcGvNaDmtMdvG/xzvlNi6NYn2rZxh/Z+z0yv0C62Kpd/VjINcYo3WIdouMfW+rAbG2DYGqWEVcpEEHFR@lists.infradead.org
X-Gm-Message-State: AOJu0YyECi5Aqo+CcPoOU6vsaPnT4EEOI5CEemsLX0xrOM1aGpI6q8Tj
	to8Eu5s2VtzUCzW5zCNYED8VNym1BHGbO8JPxPhGHYbbVvWtsyBG
X-Gm-Gg: ASbGncvMmGLLobhhprwEIqSEpWRuhl17KzBnaTejMaumf/1yM4ML4BccJbOdteJORx1
	icwpHp5LX8FlgerOmf5C3UlfU2U/3HzgLmD7o+1OY5r8C0godiwBK7JVoFn+qz5/1wyVmhUemJb
	nONLnSs+Cl5jI3ghTwmOWFGMkFB0vNZ492XulZ6ELyqCQYECWhwjiwDjSR/p0HQ7UXtJAsS1134
	t8tzNlOZEhPb+LXxq5hwIE5rwsfv5sy5qoFjhhewBeeujMJ8061u1KehyUYzlWrkTJsVm/1RnLO
	2ymOuVcJrPGOESFQzj8eYf6rOemZXRPoPoJPLyWpPE5EILtLMbQH/jc5ULDxE5AArgMVzLxYj1U
	=
X-Google-Smtp-Source: AGHT+IGMRstxw7VlBWo5AclJnc80nudS0j2DV/XKis75x33MKdrmONuUAwxabjmT8wMAvLHS9LgnmA==
X-Received: by 2002:a17:902:cf0d:b0:215:6c5f:d142 with SMTP id d9443c01a7336-22593d9e8dcmr90162505ad.20.1741782485826;
        Wed, 12 Mar 2025 05:28:05 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e8532sm114691035ad.56.2025.03.12.05.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:28:05 -0700 (PDT)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
Date: Wed, 12 Mar 2025 17:57:50 +0530
Message-Id: <20250312122750.6391-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_052806_973488_0768C3A0 
X-CRM114-Status: GOOD (  14.42  )
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

Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
YAML schema (`nxp,lpc3220-pwm.yaml`).

Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
V1 - https://lore.kernel.org/all/20250311125756.24064-1-purvayeshi550@gmail.com/
V2 - Correct filename to match the compatible string, remove unnecessary
quotes in maintainers, and refine commit message.

 .../devicetree/bindings/pwm/lpc32xx-pwm.txt   | 17 ---------
 .../bindings/pwm/nxp,lpc3220-pwm.yaml         | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt b/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
deleted file mode 100644
index 74b5bc5dd..000000000
--- a/Documentation/devicetree/bindings/pwm/lpc32xx-pwm.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-LPC32XX PWM controller
-
-Required properties:
-- compatible: should be "nxp,lpc3220-pwm"
-- reg: physical base address and length of the controller's registers
-
-Examples:
-
-pwm@4005c000 {
-	compatible = "nxp,lpc3220-pwm";
-	reg = <0x4005c000 0x4>;
-};
-
-pwm@4005c004 {
-	compatible = "nxp,lpc3220-pwm";
-	reg = <0x4005c004 0x4>;
-};
diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
new file mode 100644
index 000000000..432a5e9d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nxp,lpc3220-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPC32XX PWM controller
+
+maintainers:
+  - Vladimir Zapolskiy <vz@mleia.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: nxp,lpc3220-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@4005c000 {
+        compatible = "nxp,lpc3220-pwm";
+        reg = <0x4005c000 0x4>;
+        #pwm-cells = <3>;
+    };
-- 
2.34.1


