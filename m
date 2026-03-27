Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD2210ED659
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 10:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T//emRgjlf+DHICLtYqhu9ByJoYsw0eSIEd3mLPHOo0=; b=YlaIjoxLPNIT1JyldXDBsSq27T
	KkgUcK/9ZXl0deusKUvs+wTw53FGPRV2KQ+3PmGPIbwtozThQjzWuZJJ5I7j1RGrcCuib29Oub+Yk
	tgKDDNRAwHp0ngdGB3AsRO4IzzGRpOD5UTAfXzaharDGpRUmkkq7IRux1mOb+rcBsdi4EHFiWA+Fw
	N9KWOaL84G719z7+KsbIkskMvTW7QrKbyjtF+N+zBnNBiXAPL/+gZ/Jb1B3Exs/+g0pbCEM71gQRY
	tmDoWv/cPa56NGpDisf+rQHoBj4/1Ep2dMI+WJpdO8dvyNk00yNG/HNSwN2GUxK8LRrQBOZqK0XyW
	rvtOh5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64fb-00000007AqY-1zcL;
	Fri, 27 Mar 2026 10:44:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64fY-00000007Apn-1IBF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 10:44:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a9296b3926so12777245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774608239; x=1775213039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T//emRgjlf+DHICLtYqhu9ByJoYsw0eSIEd3mLPHOo0=;
        b=MDp3U3GcD9z5RMhMegeWZ+TY9BicBiedMXULRXMowo1p711Y+YmjwHI80WQcIYZpPy
         5L1RcmV3gkDYNpcygRCWnat+PP3jTuAIx6Iu7RzMBqPbt3K4HLFYckcpudrsPS6l/ZWx
         zVZJcsi4BzbbVACBonOrCAl87dt+NoD3zWeO0a1CWeaQCVWS6ccm1M7iyD45mf6dvb11
         xzQ5lpX7XXerIYXuKccsJgccEVYC7+SfBkyO3qaV5Ap91qodUDX6frkG7xM0C8Qs12sH
         qdg3XYycHXA/mTkDRx3JfBAnI9yzeZej5dNoqhjrpd6POsAGhxbXvqamBQPksK2VR7uN
         HDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774608239; x=1775213039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T//emRgjlf+DHICLtYqhu9ByJoYsw0eSIEd3mLPHOo0=;
        b=PNV2LC9q6Vhji9mwBCMu/BF2ViM4c9qBp3gLWYABbAeH6CdYQ48Jo1rp28jao02VvZ
         Utifk7xzVKsRTyss4YePMY/Q79gGVHFnT6UkX+8VR8wjcoyXcO8Qu1XGGIBKFTF/zYnY
         RLJiivgiUZTg6/VQUy7MEETzsy9kcK3nSU83ICgnwTxSIx5pibqfF3uRCgNwwqOXZZML
         pfuXBe4UxwIUifvqUuq5u05TC03etzv13KwpVPx5Rx6t/cGGRqGCeMMmpbIiBHbbAXFt
         fNrQGyHlet15vhvMPJ8oWz+Dp6WnWv0tux3AVRI4dhrz4X6FNxfs5xJ0v4VTKlb5wfbz
         osag==
X-Forwarded-Encrypted: i=1; AJvYcCXhdYNEgvRosy7aipf07PIvgO9GzAKyk362heNdasSZfNHVzSWbyUXpiufpzaB7JdcCob3onDhcv9oYHDln7ase@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdgdvq4WRh3rFvf57PCZgoVPLm9yoyZ5+xCtfNR6eivlEddur/
	sMIwiKCn8bD0FJIqNygMMT+lUiR1wIdqQsnegy8xyrdBQLJlr/ZaDPAi
X-Gm-Gg: ATEYQzxA+0X96gamzpZnA+N2ZfeDDaQALBdM0bOChoMcJkmk3t1PvZcuplVjME7JY6R
	BiUp7Bv2wlzxmvpNBc2LItCnl4fXlg7nzmFq/CQR+ARw+JDe6Ayf8i5P/45rFFTW+uslmdQfbtA
	aLgQPZB3vnhwJJP13YAqRFMAz6udSb1xSB5OhHWp0JevXzn+xaybvJfiHcIVGJoeN0CwrEILStE
	2lJUpG747h2Xdz8+jan33zzfTYbirQMiDH4fbnd074I6rUffklbJaPGZ4sbCcelVpVmYOOKTCCS
	cJvFeTkeKq+GPKDCp9T878ks8cKvzU+EubSP6Vrj93n8bDSlE7N8nfMecXyudbYEkWXA8Cm0G1Q
	M5XO+3/Zc/blse8ero+FNbCpeVkA51aGJwvGIyZ+FsKznpXlOfRjRib66hmPK8kmZHr8/sppUGH
	H5TN60TW66fvVosXO02hw/rSZE6Da1wv11HtyL
X-Received: by 2002:a17:902:ef4c:b0:2b0:6b98:59ec with SMTP id d9443c01a7336-2b0cdd3ed8emr23434745ad.34.1774608238550;
        Fri, 27 Mar 2026 03:43:58 -0700 (PDT)
Received: from padmashree.. ([2401:4900:62f2:6b89:b220:bfce:656:5671])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a17c5sm69459255ad.26.2026.03.27.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:43:58 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Padmashree S S <padmashreess2006@gmail.com>
Subject: [PATCH] dt-bindings: arm: marvell: Convert armada-380-mpcore-soc-ctrl to DT Schema
Date: Fri, 27 Mar 2026 16:13:44 +0530
Message-ID: <20260327104344.578113-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_034400_372542_E223AFBF 
X-CRM114-Status: GOOD (  12.71  )
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

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 .../marvell/armada-380-mpcore-soc-ctrl.txt    | 14 --------
 .../marvell/armada-380-mpcore-soc-ctrl.yaml   | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt b/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
deleted file mode 100644
index 8781073029e9..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Marvell Armada 38x CA9 MPcore SoC Controller
-============================================
-
-Required properties:
-
-- compatible: Should be "marvell,armada-380-mpcore-soc-ctrl".
-
-- reg: should be the register base and length as documented in the
-  datasheet for the CA9 MPcore SoC Control registers
-
-mpcore-soc-ctrl@20d20 {
-	compatible = "marvell,armada-380-mpcore-soc-ctrl";
-	reg = <0x20d20 0x6c>;
-};
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml
new file mode 100644
index 000000000000..a897d4ba4e32
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/marvell/armada-380-mpcore-soc-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 38x CA9 MPcore SoC Controller
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
+
+properties:
+  compatible:
+    const: marvell,armada-380-mpcore-soc-ctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    mpcore-soc-ctrl@20d20 {
+        compatible = "marvell,armada-380-mpcore-soc-ctrl";
+        reg = <0x20d20 0x6c>;
+    };
-- 
2.43.0


