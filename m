Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1EEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WsKt5owuBinbsPCptNpyMgMvfYh26FsI8OPPdtiDjI=; b=r4rKJzmpk7nXLvH+ViLficlbLN
	B/ZiKtntV6VuEXRKUAQqcmWdKpsVcE1gQpG5C+AQ01HKHafO2vxWlwxgmv+AuyLty4rVncGIS8BrB
	mnfeRVoO9Xy5GVrisFrJTAjiGRNcAuAvb1YtXLE9F7WUpoySpfs3st0h8kBwqnBDRHYcHlO+Qq6ZJ
	aWBPSZln/55pkqM2216wORcPQdkmCdomq3ljT8yulVsLSA9HF5HcuMqDZ4VTj8IFsN6PCwPT3/UgR
	IbLITG4kBVEv/HDz9FvrXbMzZosk3FDChkqVqW34IUcNlFMaCq8242EohlN01l62T8V0QIa/WjgL7
	jt1DpN7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlZc-00000000r8T-3W7F;
	Thu, 12 Dec 2024 15:57:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlOi-00000000oAE-29xl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:46:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so8375635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018398; x=1734623198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WsKt5owuBinbsPCptNpyMgMvfYh26FsI8OPPdtiDjI=;
        b=hkLnReZVkeJkIf643BH97aMGMcaP5W1CUbFn0m3mpPJGXDyLDtPH2ZZF0z+tdV4PVL
         ncILnGaYmPvki+2on9705sZbWPqPNTLPkPGP3YF5v1f5itn/K0t399NpN4/Zfy0xv1zj
         FZJPlWD/CP7i4nfX5SMgEfxUa0JB7bSapwNhMPZNMgNTWQHLUnKvKbWU+cA7Sn8ryw7X
         W06NMbRyiHpPgejWWcSEfkh0zOuxPTp7SclUzA1/62cbEJ75oPrs2s/KD+Rfni/A4Jbk
         r01eunf4/Hf1jW4LGJq7BYmeLOEtNz886eKkir46W4UnHVrlWRs/LD9yP8QijnR3f4/j
         TtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018398; x=1734623198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WsKt5owuBinbsPCptNpyMgMvfYh26FsI8OPPdtiDjI=;
        b=XQJUevx1xKPwVF28n6k58C6fIhjwC3O9uOtGEcsbqOPNqxQTvEmU5MioIQnKLzdtLo
         q4+T/wGUzuGzXXPS/jZF4phS/utbCPWWp9VsLoJcG53vx+U6LSq28vebZMMfBIEHhg/b
         nN4DxEUvy5iYdOtLDdE/cZ5PG+XVTxMoHDDvMTFTisrXOGraCMOx87irMUqAfG1QdmXg
         fdLXZmPXLjNaqOvXt/DyEZRSY3TRc2pfGLUKFeJdQHE2JjZz4npKjbDqHDoDz8RDNZaL
         NVAtnGzwt2INXhYzt0rsg43ZZmJh4OGV4ZMlqPEM0nJ7xgx+KwG3Hpg6zzLlwr4BrRod
         5ORg==
X-Forwarded-Encrypted: i=1; AJvYcCWFuxos8cyLI/DsapIuDMVj9Osy061WnuJ+Xe1WzdC7dYWUhkybz2LaJWxAV/jQo5SP3SAAl65Mw1aPZiEAHTbP@lists.infradead.org
X-Gm-Message-State: AOJu0YwbdmWQ7Lt2BtsKb1IZUL2eakx09BQcqE6IrpCkJfi+uaAAtJ7A
	Ft0btXggMPC6TKZP5ggVUyuPH6ZD5+SvFecdJZuL02mwSmsIHllE4uMW52Gfjt0=
X-Gm-Gg: ASbGncvpy/I/gtY4hQQ4JeRAhCZ1BaRz6F+EJJwyuVfDorglUdBeL4pLHk4vqqZncJ8
	45VE4zcVTRI6r8NzfFa9kMDsbMHP4+DzG+Xju5FSF5ybH1qPXcfjNjjbjq4b9i7b4I1XgIwICFS
	Gprl6MMsGoUj4ckj+60UoTqfXU0uZtKXurq8fj8223JdvZmmtcFrIWNyd9wscXJDTftONn7PB/x
	lsvS9mQix0tGajFK0NJ3AqOEM2Zq1Z1F7zLYyNPKWI+aE3cle+G4sayi7QI3/zu/R4m2mJI/gGD
	yjzYRdDirEJCAHBHaM5AMYV9I01ZpPdsTQ==
X-Google-Smtp-Source: AGHT+IF+tOoHGDUkaMxeL60yLvDUBO3/VwAE5mhjxt8LHc7fox7yQSRqiqimmqwzGsm44iXWePis/w==
X-Received: by 2002:a05:600c:3b13:b0:434:f335:849 with SMTP id 5b1f17b1804b1-4362288371emr32131815e9.29.1734018398498;
        Thu, 12 Dec 2024 07:46:38 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550518sm20273075e9.5.2024.12.12.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:46:37 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 15:46:22 +0000
Subject: [PATCH v4 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-firmware-v4-1-3f18ca64f1b9@linaro.org>
References: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
In-Reply-To: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018396; l=2060;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=cEhVpbbgbLN/il4wFzhz4s4fTLiguDqzZ1YIvysOh58=;
 b=f3YksKtopgrGy7H1vyqUY3Bvrfn8RopvwpVOYs7QLQL2eDN0NV5jbThSpAYnDZ2tlFX/T6GHl
 MoFgi5ZKF9tBAEBt4ttVy/MtpHnDX/2vBgwMrpoi6YEl6TWcwjUxwOL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074640_559506_35C1E561 
X-CRM114-Status: GOOD (  13.61  )
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

Add bindings for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
new file mode 100644
index 000000000000..8821325abcef
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/google,gs101-acpm-ipc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos ACPM mailbox protocol
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  ACPM (Alive Clock and Power Manager) is a firmware that operates on the
+  APM (Active Power Management) module that handles overall power management
+  activities. ACPM and masters regard each other as independent hardware
+  component and communicate with each other using mailbox messages and
+  shared memory.
+
+  This binding is intended to define the interface the firmware implementing
+  ACPM provides for OSPM in the device tree.
+
+properties:
+  compatible:
+    const: google,gs101-acpm-ipc
+
+  mboxes:
+    maxItems: 1
+
+  shmem:
+    description:
+      List of phandle pointing to the shared memory (SHM) area. The memory
+      contains channels configuration data and the TX/RX ring buffers that
+      are used for passing messages to/from the ACPM firmware.
+    maxItems: 1
+
+
+required:
+  - compatible
+  - mboxes
+  - shmem
+
+additionalProperties: false
+
+examples:
+  - |
+    power-management {
+        compatible = "google,gs101-acpm-ipc";
+        mboxes = <&ap2apm_mailbox 0>;
+        shmem = <&apm_sram>;
+    };

-- 
2.47.0.338.g60cca15819-goog


