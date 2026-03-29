Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A04FC97EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 20:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4Cow+KHFKRG5kiCnQkhdbidV9anmjbpMjKgFHIwing=; b=W/Qwaw09SLjjzA/9XBIy1BJRdI
	85R20UC7znTxqVjjQ6RGpEnfdjXK8EiMU0gFWONN9m54ouT8YDoReEDLqKm5ucwK3whyQsqzS8Uth
	VV7GwDr082artbvCohzVR1Ed+xqLccgkpS+/gvRb/Gzl3JVCgMVmE5L2q2t2xOTrHgF9QrHTcy1dU
	ZyIxThzl5N1Xbi4GW9J6LymcrMlMs8uDUM2yr8UZsgvenTlvt6JJE+XZ3EXrsqa/o6h+EbjDuSGMu
	xJls44eOSzAljmD9QSk12ehqM1ALjgdEiLxBe/quFiQpXbvF4/dvcxAyAw7Gs7EIjoXH2jp6Ysn7Y
	l14L0t/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6x7Q-0000000AK5c-0CkZ;
	Sun, 29 Mar 2026 20:52:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6x7N-0000000AK58-1cpG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 20:52:22 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-35d9923eec5so629226a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 13:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774817540; x=1775422340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4Cow+KHFKRG5kiCnQkhdbidV9anmjbpMjKgFHIwing=;
        b=gg+cfHe+VRGO4nI08oHEqr+V2/i4tcFKHDKp8sJtl46a2mY9fuqkZEPeEZkN1sTL03
         vEccDJ98JRC2SY8klBPUGNiAk8NCCfHVmnK/8YoUAqaJmHiUEhrwrHoT9rsB8a6jeQ16
         HVVgQYocaU77CfDEkfLJuwiaNX/2Gl2D+LEbPaMAob97LNFVJa1R0lbTNFhv48yfHv8d
         HS8jIFhs+5DE/pRuSt8m1m7RiSWSTDxGbyu2MhynRxEv4IfFd3W5w7c1sp5sM9hjbLrA
         3dfDGWD5iIqWKRGgrB5moYrnNUHlKq/g1675tFUujCkYE23onN3kKvzfx99vizafVEcg
         xOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774817540; x=1775422340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M4Cow+KHFKRG5kiCnQkhdbidV9anmjbpMjKgFHIwing=;
        b=GhR0+u7oKSl0HuY2d4hK0jd4sG+9hEzwrNIDEV90oOOqVtFik5JDppyNzKZA0FrSD4
         3/XwQ+l/fQByidCp6foaUc42PYTf9/282eJTw1tjMlBvZal9bugGTvCMG1e1eRRZ8df4
         B9IIbntdVK1ywUkMgBUnx4sLe3bFiCuBhLh6M887Wlb8FItooDv23TMxSDsQ2kn/ahTs
         +VlbF5ViLEBHsKv7LCJvS5ntMTQiAdgsWIHNFUM/ZjEUctG4tXuWOwsItD9FqawsCZRJ
         59WfrFzVfaAtw7kc0YxHu4tiA0EV/i/zIlNEBpofRYNqUs4pQrEL+qyN0eVHvHSG544m
         +A1w==
X-Forwarded-Encrypted: i=1; AJvYcCWBxjr4NIN3ioOdnsInwIuMVN31QlTluE6diDYT0kVKg7mMlZpIpxjXifcm0brwGWpVIIazyDKyGIw8XdoQ3lkh@lists.infradead.org
X-Gm-Message-State: AOJu0YzB40JIC0B8KGnnwrVOI5VZwJ57dVAPvj1Rhf52qICXujMfpM6b
	D9SAEJnePlA+xpWnBcOI9LM3OjODdy9hSgvYjFumx62fP0te8DyLtSIO
X-Gm-Gg: ATEYQzwRWMs7IGZaKJEi44PSgvH7F0ADMH5/qQS4bPwr7UQxGVDSSJoaqBw2Z6BEae/
	ZpFWrxjceYHoCtEoFOwXBLwpjCbusvEZlqxdLtK+cE0R8xxIMVbNmwkw9LQluAELnQCtF2ZDTSs
	sDzcw5YHTknEfkgne1DaDZ7ys65VmLS8Odig00wTa2dJLDxUawtyNZCfMnjpoOB2043lufufG4v
	iTBKNV4lYaGwAzheCvFJKNbmV1ejtC9Ju81Ur/4gQneGP1exWP4KeJ9BBJ0Al2BLzWz6MYdyXOg
	tevaOGgbqhcNbzHWTx8UBbdJlllw/wPJJreHo9qgS4tY+xmv4PGgBwoOM328LOWqeOf08kOLGfj
	ZVYn8Lz/w7ABEaQcOX4+lFc+ZsmzR4qrnyWFBf860HLcr7N+69fTLgU3x0m/Ek+85X2mM7LSHlF
	1Z3C68JRJrf23aPJWRqVg81mh7ooHI
X-Received: by 2002:a17:90a:e7c1:b0:35d:a276:a87d with SMTP id 98e67ed59e1d1-35da276afa0mr2577266a91.27.1774817540473;
        Sun, 29 Mar 2026 13:52:20 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9af6:7748:701:6c70:4173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c500sm10423412a91.10.2026.03.29.13.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 13:52:19 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: power: reset: cortina,gemini-power-controller: convert to DT schema
Date: Mon, 30 Mar 2026 02:21:50 +0530
Message-ID: <20260329205151.15161-2-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329205151.15161-1-khushalchitturi@gmail.com>
References: <20260329205151.15161-1-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_135221_439395_B7C758A9 
X-CRM114-Status: GOOD (  15.65  )
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

Convert the Cortina Systems Gemini Poweroff Controller bindings to
DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v1 -> v2:
- Renamed the node from power-controller to gemini-poweroff to resolve dtschema warnings.

Note:
* This patch series is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../cortina,gemini-power-controller.yaml      | 42 +++++++++++++++++++
 .../bindings/power/reset/gemini-poweroff.txt  | 17 --------
 2 files changed, 42 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt

diff --git a/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml b/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
new file mode 100644
index 000000000000..8fbe7e952b25
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/cortina,gemini-power-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems Gemini Poweroff Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The Gemini power controller is a dedicated IP block in the Cortina Gemini SoC that
+  controls system power-down operations.
+
+properties:
+  compatible:
+    const: cortina,gemini-power-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gemini-poweroff@4b000000 {
+      compatible = "cortina,gemini-power-controller";
+      reg = <0x4b000000 0x100>;
+      interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt b/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt
deleted file mode 100644
index 7fec3e100214..000000000000
--- a/Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Device-Tree bindings for Cortina Systems Gemini Poweroff
-
-This is a special IP block in the Cortina Gemini SoC that only
-deals with different ways to power the system down.
-
-Required properties:
-- compatible: should be "cortina,gemini-power-controller"
-- reg: should contain the physical memory base and size
-- interrupts: should contain the power management interrupt
-
-Example:
-
-power-controller@4b000000 {
-	compatible = "cortina,gemini-power-controller";
-	reg = <0x4b000000 0x100>;
-	interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
-};
-- 
2.53.0


