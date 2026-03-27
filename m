Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BDA10ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W64wTQhEhajKqbF5c5z2t7cvKztIxSj6q5snf6GmhIQ=; b=EFSFTPZfLwdHo1f2kInNomfy8M
	SaTTcSqzebQ4w3pAw7QpWhiTNBpyNGtBJK3mFt8PqAiCcJEGbeV0R5I88pgwJT/v49GAJcoLaoovZ
	UCKK7TvOCZOIvQ35o10zlqa7NzUj7UDHaV3+aNFTquVsudsoxh7s9vK1RDBujKj11G0LSxK6G6azF
	u6tULYiVznoC/xgA+IPBhunf2llDKR5GhogO9GXTDq403i26Tis05RDsOeW+as77lCTQ4magb4dFu
	OGmt7ddavo6uhDq6QpRawLnHtLUWyBfkqDSI0wQqGrKvJEZl5JyIftF8hJ+10/hQLWCGhyRdSvcfs
	8/NzyvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65ef-00000007Ik2-1Q2P;
	Fri, 27 Mar 2026 11:47:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65ec-00000007Ijc-44s9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:47:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82ae378fff8so1367918b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612026; x=1775216826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W64wTQhEhajKqbF5c5z2t7cvKztIxSj6q5snf6GmhIQ=;
        b=SHzyCv0fwAiKEX8IQzI4SlQhKXhQkGrosNVesXDM/RPvVFI1jlGof8sZPHtCT1uUwn
         F/caD1QWUd/+YCKxgSJNcjVDEQg5HdGmaASdhaye0dEN3ISD0zP1smoNUL9F3CIHUuQB
         1kI2rv5P4mL8r4WoBdjct7Wa0ZLJgU3hzcAMXX0PleoSxzX5RR3Co859lJKvfuOjy/sy
         Yy31xmlLMqmwyqAuxOXU//z20oMj9EHwcDfqKJAvUOMclG4du2YJ2wefNvKuskYEOce5
         bfolj1fvTW7a50jAZ8bk0rB8ai8mVlSxK1Fe7qL3gz0flSqbzoXNFSklUkxcmGfTiizD
         v/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612026; x=1775216826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W64wTQhEhajKqbF5c5z2t7cvKztIxSj6q5snf6GmhIQ=;
        b=ANOCHiw/y5Uu1PnxSdJK1QXPM+gVweNuf4bqA6nsUa9Nn0+3+Yb9SeW56l39gDnXQj
         7NGlFtDvlsqDpX8KK0F1/nGjTqyCT1KEPqz3ft/ynONFABgve8MBFi3IJVkyzi9o24u0
         oZ8FnfMShir8siKlIT3Gf+XFZDro7cY2aKrCSN1mwwkEoF2O81ax1NDKOZTa4MZFQKEi
         t2spYG7DhiV0FNNOWqt9zpYkzUMlDjN8ANQTWmHqM/bdRaDMXcqtNiATt8IXGuNIVZi8
         3SB6vX1SxuCBjfnUeDW74y6Ab5Y8eJ/TsSQUA/LOW0eEVvjDsTdu31PhnhMsT4SMhJ1F
         P1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5CKAmzNNAt0bUx5dVdxm9+UpIXXAR5FGrSNN2PQkVnwSCezDJc1C0fRhMKXapHmhtArZtjVEZUVWsYReQrSc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2BRDMX5D/VpgDNZ+TR8G+Af8OC5juala7mSfRYvBj4dxJEkz+
	9D11jyIQi/B750AORtPCiGSsF1Uz6CJT7m3CR2retI1B/Lg/Zs1StDGg
X-Gm-Gg: ATEYQzxxR9iQ7gPN0x6rAq+F55uYVtSGKHI3vj5DmPAqWZMDFoULHTBvBkghwzeO0LI
	pMEeEQ+mwGCpdHTIyrT1bvIY71whXh44O6A51MMi/msOCnaCL+4PMXzoIn7q8WljGcpKx5i75un
	XEW3V6T0skXPkXsvGDG+6G4vHkpP8c3Xd0XT5fyBhqo4y3GuO4W49msJRh7WS7KNRZJy0C5Y5kf
	Ie9a6ZxjX1M8XTm5EVDdIGVcZyv5gSAb6Q0PqcKIyygJejh47NZxMSo+7l2tk7Vseww6sMf4Qno
	xq6BCPGTCLx9S7MPwOv/QdRJGDvHNI6D1215AZLu5v2UOIVLur+bi6a2whA8RDSyz044lBcJ5c9
	XISWvlcbDd+D+SuRTK4GCoalRX3ZqzNdjMV06kWkYe6ERwev2rNHTRaveqyHRBsQ2J0lXTt9q6u
	4R6w/emMBAJQdpY4w9Fb5nvEHKTej5iuMj/uKO
X-Received: by 2002:aa7:80ca:0:b0:82c:9f73:a2f with SMTP id d2e1a72fcca58-82c9f731b44mr395714b3a.40.1774612025791;
        Fri, 27 Mar 2026 04:47:05 -0700 (PDT)
Received: from padmashree.. ([2401:4900:62fa:f2a3:309a:44f:430e:edf0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d23841fsm6492169b3a.26.2026.03.27.04.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:47:05 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: arm: marvell: Convert armada-380-mpcore-soc-ctrl to DT Schema
Date: Fri, 27 Mar 2026 17:16:53 +0530
Message-ID: <20260327114653.593582-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_044707_008891_99F3A703 
X-CRM114-Status: GOOD (  13.06  )
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

Convert armada-380-mpcore-soc-ctrl to DT schema

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


