Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA723E776C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPMvizX4aiSFiPWN4zq9M2mNvcGpcgi2Bqmh2GmQ0o0=; b=2ckjwSn9er5rV7lv3n0aViSsQa
	eba6AcbiQFVHi5vcBQwwwxQJJtEybAFIE217aDfb520UsifSb5+rcTseHXS0ub7XpsPgq78DXOAw2
	6Efg12kFONytbCQhxKgmEG56CsEOoFXFnQu8bjP2RJ6EtNprQQbmGo1D0rmojEgIVs6O/3ViyyXou
	UgZvFGLO/l2KBQaFDL8eP+5Csjb8L2TgfV6jJ71aAbPTHY8ZjR+gQcUDTH5Kb4pkzW02jIjL6EuNx
	TVYpO3qKWD55nigtHFpsdWdK4R7JSCsbMp/MgUTblCDZmUGgx8/DHkjUvHvE0G2xKBnXm+hrDFfJY
	G278Ay7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQpY-0000000H7AP-3FUv;
	Wed, 24 Dec 2025 15:31:16 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQpV-0000000H78o-1jME
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:31:15 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-b802d5e9f06so773816166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766590270; x=1767195070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPMvizX4aiSFiPWN4zq9M2mNvcGpcgi2Bqmh2GmQ0o0=;
        b=JCZavx7evbpbEkP+oZaGfWkRKwIueXCMcypfAEMChbht4tEC9jl5Xp2Q437Wp/YD6F
         VuqiXIbrBgRtSLO6+FesBKSHz8HkWhKXPH0Q3VZHJZQwCgc07ubWGqQc70Hp4u/Sl1Cb
         rQL4elkhI77qB5UjKJEBpfp3dZbOHG/fZVeI8OER9KkB9hlQDqyAK+IbGcY63XYeRSJg
         C8/VIrjyoKDiLR2rBLJBb+tTIxTjHMCP5ZvFJ1J5zEskgOc7dUFyC15yNnnTvnUL90Ty
         z/3W5HJM66lOpDBO1/lECUSD5vdLeDfcVKxI9T+GG+GpsjIgZlIWAV7wJDqHhgjuZhB5
         lwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590270; x=1767195070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IPMvizX4aiSFiPWN4zq9M2mNvcGpcgi2Bqmh2GmQ0o0=;
        b=eJ36E4WyIb7ar/ot9yuFmxXQ/DpoBT74dYfxE1ykNouvoc/q1zm19MJw5L82END7bE
         jciZZVZJjxHBSsGH5Q8+cgTBhWI35ti/JwlVwUE9C7WTVtSKr8RTKNrWpltyDmXwxCqP
         wIIV2CgtwlOM7SV0iw8OILGJP8H+FYZ2JT4HLfTWnNCX283ZFo4V2+rqKc1UXqlsBpv2
         UGSPwEonFcz4KuNG/VLXSsBDskJLA/RE33hECx7bRZBVQUwyeNdYQ8ePg5CFAujv5bB/
         h0cFZPiAYyihdt9MVD0tBDbQA95JP45HQHwGVW1C0uyWFmaN7+8NWtqW7IdnxTzW/dfM
         HTAg==
X-Forwarded-Encrypted: i=1; AJvYcCXw6DzqMbaQTk2WufTqNOW6+uwTAbuuuatiF+zinf6tkbQ4CnX7mvUWjHzlPDuGHip4ok3bjYhXeaxgIril8upi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwu98kky4c01bRbOzTp/UJNCuDy+F5hY4boJ6hmAdYI9ORgcdV
	2Sao80ukyd5dfF0avldpcE8c2xSesZGmnkT8z9OBgTpCwxhhxP7kVQ3+h2qJz62KfiClClwLekF
	h63Sh8Xtr
X-Gm-Gg: AY/fxX7axTbUXl3eLM8+ubmZclT8rgg+q9hsfB1LEwzKu3/kfw9smR6349ciOFSThZx
	hhUBeMj7GS+ZaE+lBbrp3OyyKH5tf29kqsGB8FfgWrgMtSHjfe2fVoygrQB4/qyZGAQJIEEar7f
	Hy4KVR5G9BqqzaVfR6ncim8ZkziEVkIaeRl7WcTa6He1pJTZK/3D1PCB1SvpJMPgAxsuktLMyQy
	wHKD2IrqM2XQchbCKSwtE9brtsSjyE7MnS7CQzxRyxaPEfv+Ai18WFOYSvB7zXhuyVW/RV3iCD5
	Ch0Dt1O0QDQwT6rtvok9QzyUkgSFvBbtMvUBjqpcOP4BaYX0Eb4uYGRu1ToWVSzsL6u3x2KQ0YI
	6uLZtxr+6OyfUN9NlG2/8uQm6hfZ7W4XspnNVeyt70zZ/QTpo7eEogxXscPoZIEbQOD/7SVA6X2
	gKnenGj7d2AD8yXauIZ+HQowhCAdZT
X-Google-Smtp-Source: AGHT+IHwTgoJWLEso+A946j2blMKEWqz6uE5I08Gnk6feDE3r7jM3E2NW/e7qsJaXZv87W/jfEeMvg==
X-Received: by 2002:a5d:4e46:0:b0:430:fe22:5f1c with SMTP id ffacd0b85a97d-4324e703af5mr14626447f8f.59.1766584386173;
        Wed, 24 Dec 2025 05:53:06 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:53:05 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 3/5] dt-bindings: Add Bao I/O dispatcher driver binding
Date: Wed, 24 Dec 2025 13:52:15 +0000
Message-ID: <20251224135217.25350-4-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_073113_472736_9FE16499 
X-CRM114-Status: GOOD (  14.44  )
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

From: João Peixoto <joaopeixoto@osyx.tech>

This patch adds a Device Tree binding for the Bao I/O Dispatcher kernel
module, which can be loaded into backend VMs. The I/O Dispatcher
provides the bridge between the Bao hypervisor Remote I/O system and the
frontend device model in userspace, offering a unified API to support
various VirtIO backends.

The dispatcher handles hypercalls to the Bao hypervisor, IRQ/eventfd
forwarding, and provides a character device interface for frontend
devices, enabling efficient communication between the hypervisor and
userspace device models.

The binding documents the following properties:
  - compatible: "bao,io-dispatcher"
  - reg: Memory regions for the dispatcher (multiple VirtIO devices)
  - interrupts: Interrupts used by the devices
  - interrupt-parent: Parent interrupt controller

This enables kernel drivers to correctly instantiate and configure Bao
I/O Dispatcher modules based on the DT description.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 .../bindings/bao/io-dispatcher.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/io-dispatcher.yaml

diff --git a/Documentation/devicetree/bindings/bao/io-dispatcher.yaml b/Documentation/devicetree/bindings/bao/io-dispatcher.yaml
new file mode 100644
index 000000000000..7795f55d3ff9
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/io-dispatcher.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/bao/io-dispatcher.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Bao I/O Dispatcher Device
+
+maintainers:
+  - João Peixoto <joaopeixoto@osyx.tech>
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+
+description: |
+  I/O Dispatcher device for Bao hypervisor guests. Handles multiple VirtIO
+  backend devices and their interrupts.
+
+properties:
+  compatible:
+    const: "bao,io-dispatcher"
+    description: Device compatible string.
+
+  reg:
+    description: |
+      Memory regions for each VirtIO backend device.
+    maxItems: 20
+    type: array
+    items:
+      type: integer
+
+  interrupts:
+    description: |
+      Interrupt numbers for each VirtIO backend device.
+    type: array
+    items:
+      type: integer
+    minItems: 3
+    maxItems: 3
+
+  interrupt-parent:
+    description: Parent interrupt controller node
+    type: string
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    bao_io_dispatcher: bao-io-dispatcher {
+        compatible = "bao,io-dispatcher";
+        reg = <0x0 0x50000000 0x0 0x01000000
+               0x0 0x51000000 0x0 0x01000000
+               0x0 0x52000000 0x0 0x01000000
+               0x0 0x53000000 0x0 0x01000000
+               0x0 0x54000000 0x0 0x01000000>;
+        interrupts = <0x0 0x08 0x1
+                      0x0 0x09 0x1
+                      0x0 0x0a 0x1
+                      0x0 0x0b 0x1
+                      0x0 0x0c 0x1>;
+        interrupt-parent = <&gic>;
+    };
-- 
2.43.0


