Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9D8F483DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vg+jkqcoVNFNI7ndmig89tjt/SoHh62XMKbUf5COJgE=; b=zb87bIL7UP5OObwz5mjRVCdiz7
	7QfpjHJWhnngGLhOx5Iii6qNU6sjFNWcR1hk2w8+FJUyInVpRXgcptyt69RcHo364wGSWb79tgk4e
	6+RqZ1sje3YemBXtbVBIZb7YB5eHol/GSEr8LqL8q1ZVsOeoeZSHdX571a4hKq5heS8YZIaLzIFkh
	sDnJj93mvmh6lPM4bx/p5OIhTgv0K/t1x38q9Moi1C/uK10Gqjo/QRIAmCcaGG+iaKP0fBm/u71ec
	12ttwC0R/OYbpXyz4mY/AF68i0dv9Yhau6fH9ZVyOdnBHLkCUHV8z+aHw5h7HYp0Z2h3vZIwZhQzB
	e7PwcmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jZy-0000000HI9P-11Dj;
	Mon, 23 Mar 2026 18:00:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jZr-0000000HI6u-1fbv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 18:00:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-482f454be5bso51063075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 11:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774288833; x=1774893633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vg+jkqcoVNFNI7ndmig89tjt/SoHh62XMKbUf5COJgE=;
        b=Q/BWHdH3x9+dD114xHDOc2uHoWCrxxMeFapSTFx6BJOL5VeQa0UhccGMFDNHN8lI5O
         wKb8CKDXR8+NSLcykoSR1fl7RDFzYmIg0XD+JWY6SHBrXnooPB/M2MuQVS6LbyaJmT3S
         lWfQmfyvwOM3du+BTGhlS567jqN9XioZOguD9/co/86xyONKgKWF+w6wOjbDWSU0zUA5
         4fMxEnZ2ArCjECb2LfFk1KBGK9wrXyaVXD2eSNcpQndifJjMkueXlOg+pEFVfbgYYgrL
         /VRDYdwCRguik17NIeUei1tigbiSUu9YmZatou5rowXKAM+IM2N2L6k+4nEg/9k/dXfP
         IntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288833; x=1774893633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vg+jkqcoVNFNI7ndmig89tjt/SoHh62XMKbUf5COJgE=;
        b=aN7rTFzOKse1neD/5V/fusLiTBXT49wyoItZrH3fBztoAA9T9W0aPyGduAVpk7vpS/
         GXYe/+CYVbYf0vNQi07upDFXHwrRroQET4yHIPR1U+Sw4dRLr6sfWOTW9SQyfJAxOkth
         pnvA9eRsoz4HFxgBgjnxGjU1nUSnwjs3p2BdCaVjsyOB2iUs6hCfTi7eSiTnVhRdnC/R
         lpOT5BS0v4yUWXD9PS7mdSzQ+ui2f8ocQIYnhgnpbAuALho2W7XBSWeLoU19j5TKMDLb
         QsGemHMUBUtBMP+qpGLbVfiSUQF+Qu6kT4vu4zKFnINlfDE2DnjQaJalGQQTOg9mXdbq
         Eepw==
X-Forwarded-Encrypted: i=1; AJvYcCX05cEA8EpWpM6t/2p7cBu7AGcCMdX/sV1MkWvltS44QSJf/Js07WTH44mYvmxl+6+luH44/aZj1bvzwT2Ey7J1@lists.infradead.org
X-Gm-Message-State: AOJu0YyJy+Z+GGJX4/nEXA73KrwJfyUrmzgcKcdTmKc4tvSw/vDOocMy
	Ke4RBtkGAzh0EntBmzCDh71+9hnq1Qs4eCNW4T3b5apWm0p+8AQhxq1p
X-Gm-Gg: ATEYQzyRQBjn6JyuIVuD2Bx4zjykZfnvxojpp+bDdV5p3y8mzOha2IEFoxBHfKlt7p2
	DEWoFGHOVUHfbl+VhRsytwbEdTIJgWOPdgu370BXY5Kg7+YeCt/zqSFXa9Wqmuy7pSN+Derhs/k
	xZdmP8Ve8Kkrgy3gFuRjPnE33yxU0tXkfrDj9kYpseWfxLzD+vScKtyAlOnRaz0y3x/u7ku784h
	SSzu8jfpwSl6rxMEQ8sVn0d4GyI3qW3DuvC4Y+5SIP1ceXZfuwnk3/flrf6BcGQVnXZZfPFgIar
	ha69++8BecA+gcUmf7Fi1md7yb/bcOoVxt+9nf1SBx6/Wo0E8mbDrpFzYXaDwKgpO7GzCI54o/p
	xhkSxOPkefmiCsHQzPYydk+Epgc9EP9DLaHn2NMBI5N/TxDokgihkal2pppmZOZUMCnBt2Le0Kk
	Lr6YQe6ee2IKTr
X-Received: by 2002:a05:600c:1d02:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-4870f1f40f8mr7506315e9.5.1774288833279;
        Mon, 23 Mar 2026 11:00:33 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486ff1d3befsm84419925e9.32.2026.03.23.11.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:00:32 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 19:59:44 +0200
Message-ID: <20260323175948.302441-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323175948.302441-1-egbostina@gmail.com>
References: <20260323175948.302441-1-egbostina@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_110035_478693_CC54A5A1 
X-CRM114-Status: GOOD (  16.55  )
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

Convert the Technologic Systems TS-4800 watchdog timer bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../watchdog/technologic,ts4800-wdt.yaml      | 40 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ------------
 2 files changed, 40 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
new file mode 100644
index 000000000..5c2541ac6
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/technologic,ts4800-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems TS-4800 Watchdog
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: technologic,ts4800-wdt
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to the FPGA's syscon
+          - description: Offset to the watchdog register
+    description: Phandle / integers array that points to the syscon node which
+      describes the FPGA's syscon registers.
+
+required:
+  - compatible
+  - syscon
+
+allOf:
+  - $ref: watchdog.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      watchdog {
+        compatible = "technologic,ts4800-wdt";
+        syscon = <&syscon 0xe>;
+        timeout-sec = <10>;
+      };
diff --git a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt b/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
deleted file mode 100644
index 8f6caad42..000000000
--- a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Technologic Systems Watchdog
-
-Required properties:
-- compatible: must be "technologic,ts4800-wdt"
-- syscon: phandle / integer array that points to the syscon node which
-          describes the FPGA's syscon registers.
-          - phandle to FPGA's syscon
-          - offset to the watchdog register
-
-Optional property:
-- timeout-sec: contains the watchdog timeout in seconds.
-
-Example:
-
-syscon: syscon@b0010000 {
-	compatible = "syscon", "simple-mfd";
-	reg = <0xb0010000 0x3d>;
-	reg-io-width = <2>;
-
-	wdt@e {
-		compatible = "technologic,ts4800-wdt";
-		syscon = <&syscon 0xe>;
-		timeout-sec = <10>;
-	};
-}
-- 
2.53.0


