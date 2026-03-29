Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F5AF3D5ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyUhv8dZe5OountEy6t4pKCcPVDlgAwS0iiOUhBetOM=; b=LaTJUZ56f/MrwdgY6fKr4DvQZS
	DlV/m/EzT0L7VxhnEfLBvYdqPOy1NTxyq7yupjzeeXnxLUCgJCtRkrQzSb7S/usWf1CCf2Nfb4Lq8
	vvNHCF1iqY/bToUM4zvRF4ACQ8c27FoRCP46W6Y3T0Ib1Sbg110xEIWf1GWGd1x6Ixrsps8817eIJ
	jG8CQJHdB06oEoLLunzcezXWHqrmk7Cn7GeTYdiczdL+FsUo1kSQSYwQi/TaSXkuCmbwbxlXCRHQF
	Z7bYQ8sUMKHau9Zl85/uGKdma94QQJcfIDDUkRQllOEr8hbGHLV6bxjvOqxwAIK+tLe/Qge1yNe3P
	fx7UCUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jR8-00000009cPS-12aZ;
	Sun, 29 Mar 2026 06:15:50 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jR5-00000009cP4-42cV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:15:49 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82c4b5dfe6cso1610473b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774764947; x=1775369747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyUhv8dZe5OountEy6t4pKCcPVDlgAwS0iiOUhBetOM=;
        b=Lv4eDyWqgoeHwd3sbNa+FDGwDTRcWES1LzsXeMQciFI0VXuY89qMXiLpSyiMMbWYNP
         bYPGYcfS8gaSUxCSHU3FpmQkYiV9S2ju0td/4i70+x/fYTtEE3Jy67ow4CiCoB2KaqlV
         cOZkrb9PXoTXvEcm6vsIu+3LWFILFTcS52TzUt/53hnFCZr/qXKhcfd3BKVxdKPqan8e
         2TtfbaZaycVaJjKnvksWKblcsLw96D6Q/GzgiHLTBFIgQxaTmTlRvFFyphtRO5wOzoh5
         p32MR1e8N639kQypZnPVnUXA8LlYdAUWG9tjLoMOKLpMTSdp69uQdsHmP7qSm5F0Meea
         1xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774764947; x=1775369747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PyUhv8dZe5OountEy6t4pKCcPVDlgAwS0iiOUhBetOM=;
        b=Uj1An4InOHeRETow8tPMQrv130/sxVo/yTNMoMzIb2C1AA1P7E1lTDNa+VMlWVDpFn
         ugWDdzwi6ZGtzD6sZFipwUA2EpwvQigHxED/r/keJ1PVSa19QaJ7blsTFxO6BLDAn9RV
         nZs+YEdj/zn39Q6lx9jUrmoW7wh7lsV6j316vQEO6e/jYAOpsdtKNyJ5isjLn6jjuUz8
         nFCRLgn3inyPSNA78pAwwKmi2aID0h/QY6b3x4M5/LfQAbDbJNhrhdr8IZaE9ld64xfD
         sIwqraiGt99e6DjZ/RRrMQ+VOD7R/6Y3o5zjh8KzCYSVJHraHh961azq/IO0jcoy/DWk
         elXA==
X-Forwarded-Encrypted: i=1; AJvYcCX7xJO4CuNTA5zTZMYhTOv+ZT5HlpOpTwRqxqC5BsZz4dXdvMw60fNpZKtUP9pNPSGJhb6Gu+usoav4MWgj4EVf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4EK9Whl9jkT/Ze3fQssjF7bQz8knrsD5T0V0LBL+00aT37XOR
	TI68uQ/H99BNmmoanrt+zyIkxFKX4+N1YGY5DmzVnZziTZHYQPqjIjFZ
X-Gm-Gg: ATEYQzwUXZtcW9OJmNBaFW86YKh0CxqQ0ansQ7R1DBSYthOZ0AOwAz6Cy9/yv32lTos
	Tn3FWd/ClFDVWKoe1vGuItevNv+YxN45ZI05DruS7r8NMYQtxYVANEd9nrKBpISdA1oh4cmLt6t
	2WesjferL7PYyKJibuIWhtOxLOYtTH/NLOYhsghnUz/A6NaCeMVlhYJ/IFDCFaIMKmPjilItehm
	rPVaq9ps2nk10agjpyRoxU5ugOEnshtIjjx8HTPRYazMGKzo0i1uAkvjMOfxCY/YQHbnzxlDeAV
	D1/9Rl2QTBaogK2MQKc2aLYvEmPwyeU6RPgxhVDmcmKSN3rzSZ7oZKZ4w6msTnHtd2QxX0TwCAR
	WqBmcGCc0z2uYF7tRqUJYEekUsqR4C+DsyHFjvxWcS+tj9e3STajp4svsUb4eHOX256SEB70ivw
	65Cku9u3Qx+zqVKJ1zN9PBNmqW4a4DthFL4apSlyAY2BXORsa7kGYl3QZwCvhqBu0v4CYTy1U4L
	Og=
X-Received: by 2002:a05:6a00:2d27:b0:82a:1337:493c with SMTP id d2e1a72fcca58-82c95e9559amr7945631b3a.14.1774764946822;
        Sat, 28 Mar 2026 23:15:46 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm3709731b3a.9.2026.03.28.23.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:15:46 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 11:45:19 +0530
Message-ID: <20260329061523.98346-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329061523.98346-1-krishnagopi487@gmail.com>
References: <20260329061523.98346-1-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_231548_005152_BCF1D7E2 
X-CRM114-Status: GOOD (  15.18  )
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
Changes since v1:
- Changed unevaluatedProperties to additionalProperties

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
index 000000000000..e3462a974691
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
+additionalProperties: false
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


