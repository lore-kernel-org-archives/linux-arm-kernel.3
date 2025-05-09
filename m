Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C37C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA0yISDxPF9g5T2ZPfjTueF/jIC5Kq4+wTcKq9ODUXQ=; b=iphvhVpGDjr/nLpa2t91Mg+WGv
	pcx6Ckfw2S9464uqs4IIe1RB8AUduKF54cj4n0m3w9cO+C3KpNvIALSww7HW8Bh3dvJcGlsah6Mun
	mv0JgRIkc4GcJhyv3sWZHdBuvIMyxQKSRtCddS1FVHrTFQkUo3KHYdBMhxG+v771aNF2Q5Ks46pTH
	pEU0IhMWpDGFSjW9p7kg206RCOtGN2cuajcwHhtLvKTTPpoIjIRzUP3o0pETDqZoTb3BsDoCnK8+U
	d9/FREOj/t3a48pvfmIN/WzpzB+otR3PzVWGFV3c2HUFO26ZNd05eswbDLX9RZrvIOPkXWrp9/wo6
	ktlfW17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIzD-00000002ulx-42GZ;
	Fri, 09 May 2025 08:21:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDISd-00000002oAE-3AF8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 May 2025 07:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cA0yISDxPF9g5T2ZPfjTueF/jIC5Kq4+wTcKq9ODUXQ=; b=XQAxfVdlONCBmI51QCDh/+mnmV
	C6R29IwpGQRi7kZPJr0kAB/LXS3tP0CIucfQHzma6ymjN5REhREvXjbJsTLRjZS7vUN9JyGUvI5hj
	mOjcESTDaNfWLSkVT5YOUEg84rwErI+pkqAI4/aaQTfjqh7r0CcsQ4iZ5m8+nlUPup6KJcg1S1BDZ
	tOu+Fb+ELBnRSd73O1mV1of357vPnzfBVi1larKA6i24izUdbZgT4mANXpK+2YQDw3hZCmwKhI6tH
	Ehd/1rPQ83zA7FvyVXUUMHL7wmw1L9YMCksCEIb7WR++l45GF2nM1++stDbW6oo/ZoePctKk1SLLq
	1azH8Qtw==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDISK-0000000GEgl-0B8q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:47:58 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22e68e50f80so13657695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776847; x=1747381647; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cA0yISDxPF9g5T2ZPfjTueF/jIC5Kq4+wTcKq9ODUXQ=;
        b=y0+PGQGvvfFVOAqZClDfTaOdJ3hTmF2NpFyYx9i+jD+034II6Lk5pVYbKnY2A6ji06
         DvYfOb1BsW3yutcKqVodWm0V5EDOwsnLoYukJ1Zb/K/qBgB9tXblJWerIdH0qtU3p+WK
         NJFOvCz8YA8dGNRh8DlIvHQ1S6jFPZ0/Q2JRM54xZ3h3SOa1sGb6+uU9eBb9BxMW5BXB
         gI9h4fbKto6VtQVE1o8UVObJBLSGhVJZlR3SqdC54wUqqrFB/5pg1VXNYEGBv3wh73EV
         GjuJA+PaJuza9mIoSa4i3/MvGa/juQ3I8/GA+ZsWhKgKR9/q0n7zuYLSuaRJno1NG31v
         6ivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776847; x=1747381647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cA0yISDxPF9g5T2ZPfjTueF/jIC5Kq4+wTcKq9ODUXQ=;
        b=bA36HQ2vNP2vlEZiWymHjEvmhPeYx6hpcAai/xY3bgT1gbSpPk+PPLRMyzGqolXNSq
         jsIzE2L634qiSgWp3GD37uZhaKiAXkzHKI44gFAExSz93fHNoPV3g2oiX5EQEfvvIAtL
         maTjGm0xBI9Du6/xJQe8MhugNP736yJtQKBVAIPWyCpT+mN0tjhpOja5RD3j3nhcXTlw
         PVuvA2JWKCUIlpERJNo5nrQrHGEj0hU8sEtcNPRqxWjDGy1oX2u/kK6QCdyu6RscJ+Mr
         r93OnR8XVT3OqXu72f8wJPmsbfqaxAuDyt+3R02BrTlALtzVwisJLgwkXNqQXPSdltWK
         F6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTKpPQh1lJJuroHVL1YfDAr1q5JR2yEq0IuMKz3PHT+kpjlHOWKpCkGJFwTsRrHImCMiEgBeM92nZ9nm5DbVW9@lists.infradead.org
X-Gm-Message-State: AOJu0YxgHUur3vjTeOxfAxSbjUXLMQJ65zmKUEPccPfGweebCMJi8yKJ
	7nsuhoJKKiAMe94FGfURvuUrzL0owfrvS1o+Ul/GNnirdVVp6oeUJEsoIiMrXqsKv5XGn8Z9tow
	FLVuUUeLRs3TGIEpgYQ==
X-Google-Smtp-Source: AGHT+IFlDUYjFmNLjZAtgvspY6ix2dHys/RJQDHcQLdAfrz+DupB+ruuhonXRKp9ueOFjqDPInrpTwbWkYVKg2ph
X-Received: from plle3.prod.google.com ([2002:a17:903:1663:b0:223:3b74:1b21])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f68f:b0:223:66a1:4503 with SMTP id d9443c01a7336-22fc8b73d0emr28784975ad.30.1746776847032;
 Fri, 09 May 2025 00:47:27 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:35 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-18-changyuanl@google.com>
Subject: [PATCH v8 17/17] Documentation: KHO: Add memblock bindings
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_084747_177862_D35CDE44 
X-CRM114-Status: GOOD (  19.39  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

We introduced KHO into Linux: A framework that allows Linux to pass
metadata and memory across kexec from Linux to Linux. KHO reuses fdt
as file format and shares a lot of the same properties of firmware-to-
Linux boot formats: It needs a stable, documented ABI that allows for
forward and backward compatibility as well as versioning.

As first user of KHO, we introduced memblock which can now preserve
memory ranges reserved with reserve_mem command line options contents
across kexec, so you can use the post-kexec kernel to read traces from
the pre-kexec kernel.

This patch adds memblock schemas similar to "device" device tree ones to
a new kho bindings directory. This allows us to force contributors to
document the data that moves across KHO kexecs and catch breaking change
during review.

Co-developed-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 .../kho/bindings/memblock/memblock.yaml       | 39 ++++++++++++++++++
 .../kho/bindings/memblock/reserve-mem.yaml    | 40 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 80 insertions(+)
 create mode 100644 Documentation/core-api/kho/bindings/memblock/memblock.yaml
 create mode 100644 Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml

diff --git a/Documentation/core-api/kho/bindings/memblock/memblock.yaml b/Documentation/core-api/kho/bindings/memblock/memblock.yaml
new file mode 100644
index 0000000000000..d388c28eb91d1
--- /dev/null
+++ b/Documentation/core-api/kho/bindings/memblock/memblock.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+title: Memblock reserved memory
+
+maintainers:
+  - Mike Rapoport <rppt@kernel.org>
+
+description: |
+  Memblock can serialize its current memory reservations created with
+  reserve_mem command line option across kexec through KHO.
+  The post-KHO kernel can then consume these reservations and they are
+  guaranteed to have the same physical address.
+
+properties:
+  compatible:
+    enum:
+      - reserve-mem-v1
+
+patternProperties:
+  "$[0-9a-f_]+^":
+    $ref: reserve-mem.yaml#
+    description: reserved memory regions
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    memblock {
+      compatible = "memblock-v1";
+      n1 {
+        compatible = "reserve-mem-v1";
+        start = <0xc06b 0x4000000>;
+        size = <0x04 0x00>;
+      };
+    };
diff --git a/Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml b/Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml
new file mode 100644
index 0000000000000..10282d3d1bcdc
--- /dev/null
+++ b/Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+title: Memblock reserved memory regions
+
+maintainers:
+  - Mike Rapoport <rppt@kernel.org>
+
+description: |
+  Memblock can serialize its current memory reservations created with
+  reserve_mem command line option across kexec through KHO.
+  This object describes each such region.
+
+properties:
+  compatible:
+    enum:
+      - reserve-mem-v1
+
+  start:
+    description: |
+      physical address (u64) of the reserved memory region.
+
+  size:
+    description: |
+      size (u64) of the reserved memory region.
+
+required:
+  - compatible
+  - start
+  - size
+
+additionalProperties: false
+
+examples:
+  - |
+    n1 {
+      compatible = "reserve-mem-v1";
+      start = <0xc06b 0x4000000>;
+      size = <0x04 0x00>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 72345ca65edda..d7bd49dae2e0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15447,6 +15447,7 @@ M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/core-api/boot-time-mm.rst
+F:	Documentation/core-api/kho/bindings/memblock/*
 F:	include/linux/memblock.h
 F:	mm/memblock.c
 F:	mm/mm_init.c
-- 
2.49.0.1015.ga840276032-goog


