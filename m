Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285C7F3D5FF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tLsn8hpa4BdCwst8VwbSLWHz/M72CzfhEMC9Z3GeEs=; b=qQgawEU5iYa8+aqBLXCkwfMJ+w
	0eXhIlNDXOOnXqa+SlL2QiXsstrHb3DiwmjL2bUi4wh2E0P1KzIPG/1nZoOkJVRDUgcqWBrSE7QYv
	Pf8qy6N6ChRCRzZY/ejOO5RaC34jogFbbCjX0/cBQLFFQ5GRo/Tm0oxOSPkEJSCfeg0cUfssCOYfg
	2w5QRBaDOE6f/8orAp6rXPWL46SQ4Qsf5fKxX/xuaMhiCVrM0g7i//OfIhdGiee2Tg4JkRFGYPC2g
	meL3dEl8jR2VFfgMwsSIvRGZyPmPobRw+ifMT1+nY6jgtk+Is3ebJDfBfJG7QYlUC8LxhA2dTfOb3
	RN72eA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pMJ-00000009uyr-0bpd;
	Sun, 29 Mar 2026 12:35:15 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pMG-00000009uyP-2b9O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 12:35:13 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1463057a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 05:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787711; x=1775392511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tLsn8hpa4BdCwst8VwbSLWHz/M72CzfhEMC9Z3GeEs=;
        b=RH2K+ppwgh4ag/fN26/wMeueb0D2uDOlL5QYXewTSYBK59TesUFLdr12GPb2ekaGwx
         r8cROyl59c5qhYtSUaLNu0ORfi0XXFu0VbT2VXIhjLAeszUcecJgeYHbiI4kfQ8r7E0x
         5wUotoIqi3QI/gTu5nRbXtdHEsNiCrR5tnMS12goaN3uLl32rs2kaUXXkw1ABLmCYz6a
         5jCt9RSPrK/aHdnHxV9ZCmvDPdtfXlnPc9Sbe4MBAJJSXrJtepEZ2E3LGe8NCawb8QiQ
         7FeAJQoG1bRPRvyK9amgMwtvuUkl+XiB4iHE3xqlIFSLH0TOqFAiHbxNrjugAuZjIvsx
         ++LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787711; x=1775392511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tLsn8hpa4BdCwst8VwbSLWHz/M72CzfhEMC9Z3GeEs=;
        b=j2HdgOQkENupkTh+3nyqBZlMcZd60HRj4+ugP4u5JE846Q9nLSdfyZ23GLRbrVohS0
         fz8uxmvKpXl2YFTYxKWRMYx+VrJTjU5A3Qrt49ybzD7pszluryrc1q0SxJfvUhAvKujj
         pKiFMcXmsEn0em55rYprraKtu8q3WDC+DV4G7RfNp/KFl2eOYsDqOQueAA30BsO1agtk
         ZcbtmqrNHiVJU/ZnbFAWKT29HGGQVjQx/6tVz1fNtKuh2Xlq9VzmUFFyH+XvMznZ5L6G
         Z1JnMMH6IydgZUcJ6mt0l+RdWvv3qSWKIQA2EQtUTKs9zirsy/mzKUfbMwlF6X8jU5Ld
         8CvA==
X-Forwarded-Encrypted: i=1; AJvYcCUZDU7ImVTk+SjJaIBL/OC1xDF3vbB55nOd5SSa2/tLf9i8v3jCNxR1EplOUTUoL7+U63cvT4ApGjuGVMnkmGMs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ETUH/xEVFWh38wejbAUq1VQo7WipKnooOOLGWH/v6auRG5JT
	ToQOiTjqPlVyUjazWxlFJiWnmzXY0DxwQdiDsWX1JkIsAvhSY5lZg96z
X-Gm-Gg: ATEYQzx4uRHtRWHm1kZct6jleUNTibEaIOzpky/VVAfX/maU3ppafz+PnFEgBz/kQcs
	k+KaiLAXXvE/ltUKd2A9+Q6Ydjcb4pHoG4s0dp3N3nP2cqxwPA4a4BdaUmK/MNtTvDsqec5Dq3Z
	mloqO2Tcp0P2BXQ3yBoMOsBmlUUslTGBNSA4i3ib/FGHRBX49b9SzcOjflYgMay0gUf+H929xxv
	qPCU/Wj1AlHGf7mmuGyt1Jpxt+G+eXYKQUD6nfZu2mJOIpIgD89+mrDaKN/Zc4wvROvFGotNxU3
	JnBGlkpIflPwtvQ9p+wbPoRW/oxav9ibtOLf7iVaU5YCviNYf9p/CCpzmcN/m9peb5sT7Oo5hWm
	Ov+Zn7FagGqNxR06XACHFfQRsSuc2g1iWNB6d6fJsBOBvIWvCHyBc6dn2M5Jpg7ijgc38cGAkkQ
	aFcDC1JAH3wlL1dQSsWpZhYNzCR1E8f57GHEf4IVoCbsoIokhPd9XnXcc44Kdf0Ha1BcScSSrhX
	54=
X-Received: by 2002:a17:902:d588:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b0cdc48fbfmr101671395ad.18.1774787711463;
        Sun, 29 Mar 2026 05:35:11 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm58709665ad.72.2026.03.29.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:35:10 -0700 (PDT)
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
	m-chawdhry@ti.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 18:04:43 +0530
Message-ID: <20260329123449.309814-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329123449.309814-1-krishnagopi487@gmail.com>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_053512_663312_D5706024 
X-CRM114-Status: GOOD (  16.31  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v2:
- No changes
Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

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


