Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0B8E77361
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehfxbEVnQJDewCWJrGs2ak+KMNFyhQdtz7cgsTLXZDQ=; b=n0rOUbm3ltU1p73xSPNoBDIUTH
	CORUOT5hCvtMyb05kMVjfERpUhLAJqArBdtWiMfNRLF+vz8jQYRbPT6BA7bJvxsX/F/vPtrW8xRYY
	0DmZWcjvowzLMhLCUXJqUyVBSNM5rdsHjHpXfRenlki1/9p/czHyED3DAreQ0zxEJoiN1vAMt72vZ
	50s9xhEcmjBX8CjhIh1OeFvcIE6K8SZUk4Xm90VFDYZlhPFxsL7f3G7QcmX4Ux8pfyKgjmr+GG/0I
	neZirxobRp8eGXYuY5I8AWec31krWJC3TAtvMKY3tSh3wTGSgV5kOGtZBpfFY2MSLtF5NSlQBTpB4
	1mVhvwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR36-0000000H90Y-0BpE;
	Wed, 24 Dec 2025 15:45:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR2z-0000000H8xL-3YfP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:45:12 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-42fbc544b09so4596851f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766591108; x=1767195908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehfxbEVnQJDewCWJrGs2ak+KMNFyhQdtz7cgsTLXZDQ=;
        b=JR7U11ptwIz2LA6ze5wEyTf9FlJwd7eaETBjWIvoufXIkplKRPcZbAcofZnGFl8QH/
         Nd75BKTvomC13/C0fdvnjCC0Oj5aaNphlWkDXZ0mbjbzB9skTBbRuZ1HTkxU3e7diBOd
         aW3VxNMbDWwmt3GE6Bi5hEzm6tZXn0RdF07dxKC1dv6wrsZgF6IvBfulp2rv9HeX3sD7
         rbqABZhvqKuw9qmG+w7BLLBexGYSzjlUNNnG9imJoI4bAfUYO9mMvYgUW11YiTdrpgwg
         Ckt61Kbe2EOsMpvhKPsgCbsUaaExwJD8CGJGnPqN6itsruGHWebbumI1uvxRRpSdG1ga
         yDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591108; x=1767195908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehfxbEVnQJDewCWJrGs2ak+KMNFyhQdtz7cgsTLXZDQ=;
        b=Ki9uCirHMo8mCe7JMECBrPaLVFA00SM62snQR2Xa4OtL801o/+tdGvXWu0d9bjOhVH
         vMk6UeCZqmcuTP5xEpftFcI6v7zTQp+ho5eQkg8PG4gDoqRmaPb5Eh4srnviex3RSQJA
         EfEmoPTbFtti11dG3oqr1H5BpP1UXEeqINy04rZdPkYRlUeqZ2dsWhZvodvX2i3DncEX
         5zyRF5isBpOzMd8vkU792+KFPVwOj8B1+z8VBpKzm+e0Yv340eB4WG4Om6rVOxkWr5v4
         I+uWZ0WKBpKGP54vmWK51lzpK6t/QnLGrbEEiT5eXs2AF/Sk9KctNrsnIOmMk4f4eKxp
         /IDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVELe0s8Yw/heYWiURB4d3yk6NCbeeZ2b1rXPWch/wq49F6ugU2vbXqodADm3tVvN7AJHnme3twop58iVX6OiOx@lists.infradead.org
X-Gm-Message-State: AOJu0YynBko+KxKEkSmODly8Dxd/V5xLaMn7ueXteUoefnckT15r+xdM
	zl3/bkYkfqaYuXFl62Ynqwr6RU7IaB+14oDxpmS+bDXoisQmjMymsK38AeCsr6CUbZ+5
X-Gm-Gg: AY/fxX5JpjUAN9cjTnDof9XizYzJgO7uZWzW8gQjYPt14vP925jhv/ZiEZuaL+kk04C
	QDJyrrYeMoIIb9Exqaa7YMS/V2XPfRcZ00vknBEfO0cS3nLAq545X6qtVF7iZzHCeThUMt/OGDB
	qf+m2TA1Q0rC1eAcb7d9z28AYP3ZnikaWx14Q7GiW6WFiXTf98Fyso9PU6mlzQkhgrRuPolxkn8
	xVBNnMiNs3aI+l6DKCnevS4628b3wuC+W0CvIYLiUFJ7cG7EwznrZaT/LxP0ic3FLpMvvStc0oh
	XVpnAoPMUInw9BJEyBLrZfjzGKuCgo5Qx2K6iMzDvvwWNL1DwPSjRH/0lnIWofE9m4kpK81TbSJ
	pGX48PYv0IMJ8wSbhaO0Bn2ydDmjsHX64yzTcRvQIIX9ql8j2ha3O7bIrBwZQnFgYf0XF4emO5g
	GqILXyTrXx3c9Low7goA==
X-Google-Smtp-Source: AGHT+IFqP19dt2VG1hPpM2WYJhNqheRS/5whksM3UdvdL2gWh2MKdA11saX7GOb3KMgk63dxD3aa3A==
X-Received: by 2002:a05:6000:2909:b0:42b:2dfd:5350 with SMTP id ffacd0b85a97d-4324e7077c8mr21170738f8f.56.1766584379482;
        Wed, 24 Dec 2025 05:52:59 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:52:59 -0800 (PST)
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
Subject: [PATCH 1/5] dt-bindings: Add Bao IPC shared memory driver binding
Date: Wed, 24 Dec 2025 13:52:13 +0000
Message-ID: <20251224135217.25350-2-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_074510_000578_35A4B152 
X-CRM114-Status: GOOD (  20.47  )
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

This patch adds a Device Tree binding for the Bao IPC shared memory
device, which provides a standardized description of the hardware
interface used for inter-VM communication in Bao-based systems.

The binding documents the following properties:

  - compatible: "bao,ipcshmem"
  - reg: Memory region for the shared memory device
  - id: Unique device identifier
  - read-channel: [offset, size] for reading from the shared memory
  - write-channel: [offset, size] for writing to the shared memory
  - interrupts: Interrupts used by the device

This enables kernel drivers and userspace tools to correctly
instantiate and configure Bao IPC shared memory devices based
on the DT description, facilitating efficient communication
between VMs.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 .../devicetree/bindings/bao/ipcshmem.yaml     | 99 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/ipcshmem.yaml

diff --git a/Documentation/devicetree/bindings/bao/ipcshmem.yaml b/Documentation/devicetree/bindings/bao/ipcshmem.yaml
new file mode 100644
index 000000000000..398ac610c29f
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/ipcshmem.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/bao/ipcshmem.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Bao IPC Shared Memory Device
+
+maintainers:
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+  - João Peixoto <joaopeixoto@osyx.tech>
+
+description: |
+  Shared memory based communication device for Bao hypervisor guests.
+  It allows the kernel to interface with guests running under
+	the Bao hypervisor, providing a character device interface
+	for exchanging data through dedicated shared-memory regions.
+
+properties:
+  compatible:
+    const: "bao,ipcshmem"
+
+  reg:
+    description: |
+      Memory resource for the shared memory device.
+    maxItems: 4
+    type: array
+    items:
+      type: integer
+
+  id:
+    description: Driver instance ID
+    type: integer
+    minimum: 0
+
+  read-channel:
+    description: |
+      Defines the shared-memory region used by the guest → host data path.
+
+      The value is a 2-cell array describing a sub-region inside the main
+      `reg` area:
+        - The first cell is the byte offset from the beginning of the
+          shared-memory region specified in `reg`.
+        - The second cell is the size of the readable region in bytes.
+
+      The driver will only read data from this sub-region.
+    type: array
+    items:
+      type: integer
+    minItems: 2
+    maxItems: 2
+
+  write-channel:
+    description: |
+      Defines the shared-memory region used by the host → guest data path.
+
+      The value is a 2-cell array describing a sub-region inside the main
+      `reg` area:
+        - The first cell is the byte offset from the beginning of the
+          shared-memory region specified in `reg`.
+        - The second cell is the size of the writable region in bytes.
+
+      The driver will only write data into this sub-region.
+    type: array
+    items:
+      type: integer
+    minItems: 2
+    maxItems: 2
+
+  interrupts:
+    description: |
+      Interrupt specification for the device.
+    type: array
+    items:
+      type: integer
+    minItems: 3
+    maxItems: 3
+
+required:
+  - compatible
+  - reg
+  - id
+  - read-channel
+  - write-channel
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    bao-ipc@f0000000 {
+        compatible = "bao,ipcshmem";
+        reg = <0x0 0xf0000000 0x0 0x00010000>;
+        read-channel = <0x0 0x2000>;
+        write-channel = <0x2000 0x2000>;
+        interrupts = <0 52 1>;
+        id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..c047fbd6b91a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -223,6 +223,8 @@ patternProperties:
     description: Shenzhen AZW Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
+  "^bao,.*":
+    description: Bao Hypervisor
   "^bananapi,.*":
     description: BIPAI KEJI LIMITED
   "^beacon,.*":
-- 
2.43.0


