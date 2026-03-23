Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F20FF46111
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCVrVoKT9G2CjfYu/PBNCmXq2eaEsPu9cALs8eUDlig=; b=lllYSTXgHwcATilR7/0S2OLbGo
	5NxnkwAI890dk53Rixe0cyZplXpXMjo950HIqEkyW5ilSw8vW9oVcw5C3l2ytLnHFGcZvzwSo7Lpk
	bZFuYsBdaaBwiAAC90+vgW2jxaGtAI+EPuyNs28O31BFsrgaMM0xmDqDU2nDBSAF+sQNZ8PqrL7NQ
	inpGMyWHzToBONvEuLbpu3w5aLVfFbd8eqijZFVM9CtVTbwVn8BZMtndgR64VP2cZWNu9imOJ76wi
	68r9BG0vnugM4HjDSy2ytVSUUShYzuqk/C6bjEuujbsdu4pzfc32MRj9o12IZ+ycsiOW35XZ+Rlz7
	AKxoLxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fUU-0000000GqSf-2sbu;
	Mon, 23 Mar 2026 13:38:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fUS-0000000GqRm-3o2o
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 13:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GCVrVoKT9G2CjfYu/PBNCmXq2eaEsPu9cALs8eUDlig=; b=isFjb3qa0QUILNjDTxSsNEHeow
	B3CBf+qaqD3pHUy5eXTHXg6JJ3zZxmlUhToxOBC++7n54kXx9Umd4r1JERCmzgfYg921vygYYHTeg
	8829AEhe+N/3ansQ6t2RB8sTcwF7JH9ff6k3cxilRWcAKIdRWqT0AWG7Wb3ANGPnszkMj8ycE/5lC
	QdFw2Bt3rBdpO6EvcLX1MoCUDzrY+L3d/xNxFtHn1/Ahhv3OL28ZOMb4ftdTCd1XGeKPR5IZ86y7L
	hgBZ+oPxP8CCWpT8ESN43mjvTHMma2rk3ctrZKIHCPopr9FKHe9/0UMJ11VqSqdgduFZw8BXuPBz0
	f3OniINQ==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fUP-00000001csI-0tBS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:38:43 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82a646c96bdso3403476b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273119; x=1774877919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCVrVoKT9G2CjfYu/PBNCmXq2eaEsPu9cALs8eUDlig=;
        b=kb/Mg3Pr7UF60QtaKze31GXfyfZ1TpQqMP95ZE83LWGgmJCX4l7MlUI2qK2pO3QMfS
         SVzIM/V+L2DmsK1EOy7iKczLnaLUIIuM01FfGtVLeI4lzApY312Oq4SLMZgsodT+5/IB
         eHHP3N5nObVla+cOsOlfCc/BoaijImyqx21YzHJz8253vYezCQQFCwNMRQQZmbnso4W6
         tDcVOZ+VzKUNUm7mRuTU/oYXEGTfxnC2POMzUod6JWDFdrd/LnSeepBjJGNrEo1UEBot
         DKH1L37idgIJXBVjLDYqwXLQQWhNOhGHb3TVNZfw2UEjfKxnJ1Ab0wqgtTAPldnhv8iI
         MC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273119; x=1774877919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCVrVoKT9G2CjfYu/PBNCmXq2eaEsPu9cALs8eUDlig=;
        b=KfxozywKDCJSuWpmc0lAcmBpBtSqUHHvsGLdaY7iEDV1IEZJxKd394b2HruMzYW6jT
         9H+K5zTPdQiuyivuuvhj4KYRXSVRjSHzmjmg9zygtL+GnH+VHTI/7UnmKuaHKSM3/0nH
         n0ZHZE8l0/knNEDc6mPyAwtrZzpd9rE4VuW2TydZ1wmt0h8VN3vnRFDHeyox9+WHWf5D
         ttwmjjdwjBm84sSEhNOSjmMJWdSbe/VqgvxkVndtnsSaxb7pmJp+8rPsrMC7g2ancYwt
         7ulPYmveb6OHS7Rr8Qqy5M/7+DymVObBshZhfZ8Y+J4s+Rh8dskGg3XyVya0VkRCByjH
         ao3A==
X-Forwarded-Encrypted: i=1; AJvYcCU37a36HRLZDK1+8+O3W69i46cAtZPnBXv9pxdF+NIh+BZXDkuC48v0Hk6UUcJgx5TK6dxjs28W687wuSjWTpFv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Wf227jXSWpViX1Q3T3gCsQsF10fugPjm4MsuVnNnlnVsbBCi
	g5MET8p1KdCVMBQjq2RZ7n2u5ee0iatfaYsFVPfF2M5nqRf+H5J4uu4v
X-Gm-Gg: ATEYQzwWkXYiKypLJZe+mYpFspx59ktD5IlR5BShx84KiP9UNTZnFxEKo0q1HHpws5z
	IyoiPzmUWdpKTxVQXSNhYBbgqqFELMhHF7mf7IKkYTumUOCqrVufXAoauLaJN8lOARvRwJ+kx0j
	vY6eUc8Cv9maKeqTT6sp+0UUzFiOC3qm2VHe5UazECzg5dBpeaoMSJsKFIUrcmcFndngBGAvOuJ
	M94F13DZuCiFRL4xn+aoAddNInMHJbLr/bDINKRTAYTy+L+4mDd01lVizE+Xjz4f8Onqp2HGbeb
	FefuuacTydSLJkdj62ONJnQ9yj9Ic0uo6So2XC6rCp+bJOIhKfkfMlop3BpsOm/5i3I9dwd+pvO
	TezXAqARIpohuCXwaFg4FVr8wQ12NFw/kln2dKj0AJ7Fmvz27JGMl008x6xIDcA0JtHYFLNkU2X
	kv5cpPBirguX7YK2B3vVaNABSJOvibsocAYDFEvl7j4QRV/KYaq5QEBYnZ/IQr38MnmkhfTK4PF
	Fo=
X-Received: by 2002:a05:6a00:13a6:b0:827:3b1b:43e8 with SMTP id d2e1a72fcca58-82a8c22d99bmr11433015b3a.15.1774273118883;
        Mon, 23 Mar 2026 06:38:38 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm12069224b3a.57.2026.03.23.06.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:38:38 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH 1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Mon, 23 Mar 2026 19:08:08 +0530
Message-ID: <20260323133814.14152-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323133814.14152-1-krishnagopi487@gmail.com>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_133841_331482_AD14ACD5 
X-CRM114-Status: GOOD (  15.12  )
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

Convert the SPEAr Thermal Sensor bindings to DT schema.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

diff --git a/Documentation/devicetree/bindings/thermal/spear-thermal.txt b/Documentation/devicetree/bindings/thermal/spear-thermal.txt
deleted file mode 100644
index 93e3b67c102d..000000000000
--- a/Documentation/devicetree/bindings/thermal/spear-thermal.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* SPEAr Thermal
-
-Required properties:
-- compatible : "st,thermal-spear1340"
-- reg : Address range of the thermal registers
-- st,thermal-flags: flags used to enable thermal sensor
-
-Example:
-
-	thermal@fc000000 {
-		compatible = "st,thermal-spear1340";
-		reg = <0xfc000000 0x1000>;
-		st,thermal-flags = <0x7000>;
-	};
diff --git a/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
new file mode 100644
index 000000000000..125632163911
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPEAr Thermal Sensor
+
+maintainers:
+  - Viresh Kumar <vireshk@kernel.org>
+
+properties:
+  compatible:
+    const: st,thermal-spear1340
+
+  reg:
+    maxItems: 1
+
+  st,thermal-flags:
+    description: flags used to enable thermal sensor
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - st,thermal-flags
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    thermal@fc000000 {
+      compatible = "st,thermal-spear1340";
+      reg = <0xfc000000 0x1000>;
+      st,thermal-flags = <0x7000>;
+    };
-- 
2.52.0


