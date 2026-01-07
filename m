Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9352CFD65E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUMimnmdXF+2lmQCSaKYy80Xx8SLq3LRSYV8Quqc2EA=; b=Kiy65iTiBun8okgnRj1Xn5JhVV
	zSj16mUULItUiag2m/PwDzULoDNOXflBI8YeCK+rWpDnd+72eLudnXJ1znM+36iqRneThaA1sC9j7
	Va8nOu+/lMwRhMzYR6Uqje3ZPk8Rp+uYNaCtPpMTcqTS6k6baSZLjukeOcqpeHPCFduQqgJsU8ojT
	e3AzTvXAWIIUvSGczcSGC0W2q52HfxIrMtPkOv+yp0qKHhRFXodGpxwEPoAt3RAILb8yb6QMg8O2s
	sCYWJKTyVIrO4r6OjQDutxClG3MJ78cZKfjCV/7YhUaeVEANfWqMl9fJYJ4+uzBKvPHZSvR84caM9
	yyeJnlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPm-0000000FHs5-3ouB;
	Wed, 07 Jan 2026 16:29:42 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPi-0000000FHoQ-1Sxt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:40 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-432755545fcso1314542f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 08:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803377; x=1768408177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUMimnmdXF+2lmQCSaKYy80Xx8SLq3LRSYV8Quqc2EA=;
        b=nKts4xyrAqjCvWGVBS+egymxoDmKq+tgRzbDZc4fLYuXv25XruUhPaN2PHuRAN+Feq
         zRw/M9gQnYTe2b8ChmRu1gmruZmSRpwnwBNzzBQF0MxKSNXFuvu046y+LIHZvHue4L8F
         TSY1b25mjf0nNRZWGJxvB9GeNEBIiXOr8y2x+lQq3ZDQI/Y9dCM2Um3b4amTlWwBlBvO
         csww/hZowc+xlfGpGDbvayIhBDjei+zVCd84zfq/7Pwx3Co5epx/mArLPOCNPnXFkEgC
         aFoEdNTEHXKUY7ggM2smw2ecpmFJspH9mVzYgcpPIn3yEUofbiPz+Z4ERoRTl7hyMyQJ
         ruUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803377; x=1768408177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NUMimnmdXF+2lmQCSaKYy80Xx8SLq3LRSYV8Quqc2EA=;
        b=NxrsykSO6/exFqkEZLT0QOQNsmpN7y1VS1ZcpT8MSkLM7Sah7EZ+g0DE5Z1CWrrAqW
         B0NFiZ5pkAfx93vgmHGczyzdACTccVEE68gXxn3IlIvQRhVzdhWxqpFJ5YD9lmKUr9Qp
         L/rG4/UdxQ/CMcxvxcVCKD8NP53LrX+hw+BEZtYQHHx6uduiXicazmixb6FlgpsMLwtY
         dc3vmiUSdzpkjGwbh+HTIrt+PMcF5Kldojhu3t8ZEc9VSpagLopgkfEHNCXDk9bnAdXK
         xTsWn2cmnrr9JQUqmIWtUY1bHyftYIrTgB7xnxcKD2Rd64zoekjUdu5ZZINsiuu7V0FX
         uPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWynpmgh/b8KabJDzqFnqHcecsw/DUrcBrJ4OV7pEbg6IFIxsFXvOJR7S0FvzpznsmIoGxUWPEY2eQTqFuyj6ye@lists.infradead.org
X-Gm-Message-State: AOJu0YxegDWzA4Ofboime2EftlKOrk+gm1b1G9z3DMBlJVnT7oai1W3R
	bAf71amDYzjUHmfajROjO4HqvlZjVazS9RHw350HtiDVrD3vGHBJgN8eCod2J7RV6pdq
X-Gm-Gg: AY/fxX59Y0RZPWaIE/yid8Ub4X4iTkti7nQ7fQ6Y9SAb+3bbgLU/d7t+8ji4DQ3TLxe
	aEhI4aL3MqywoRkhOqHhnTeVW2p5PnaJNSCb6Ojc7fbAi9yVIjfn5skZu+U0BYeWD3S4QV1exjU
	8ssKJWmjxEfEMqeo61zafssr6NVdyfpJqWs9urwLlj40K7aNL7OupIKt5DQYb7JXSDhvaUgp6Tl
	ZM6QqhqFD3x+SAv4XSa/DHDtr3xZBySG0mp0eI/Qri0JYN3+GUE09aveSjzr774oAgcDNuQGATS
	fTJxGhM2DS5GFuSQ1zDgkZBnY8co6pGMZCBq3AQ+/D30QcRukCzrJfxMyMSdBfcoQoILWiiyaKF
	CivedaaJCXgxPi1Z0Z1NlG2gps/BjvlZmJevQwDsQdKqT50O3wAhEjxXfZvET1nC5RCQC0+JbOG
	DSwEXRCUZ3WTDDpE4sfg==
X-Google-Smtp-Source: AGHT+IHbte2Z9gfsJb68imADTi55zsYUmZZE1DMqWC4ozVwMek+FiE+B/1QJjWhTUxGd71ZKE6jVRA==
X-Received: by 2002:a05:6000:310b:b0:432:5bac:3914 with SMTP id ffacd0b85a97d-432c374f46cmr3857592f8f.40.1767803376686;
        Wed, 07 Jan 2026 08:29:36 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:36 -0800 (PST)
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
Subject: [PATCH 3/6] dt-bindings: Add Bao I/O dispatcher driver binding
Date: Wed,  7 Jan 2026 16:28:26 +0000
Message-ID: <20260107162829.416885-4-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082938_444205_95088363 
X-CRM114-Status: GOOD (  16.48  )
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

This patch introduces a device tree binding for the Bao I/O Dispatcher,
a device used in backend VMs running virtualized devices (e.g., VirtIO).

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 .../bindings/bao/bao,io-dispatcher.yaml       | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml

diff --git a/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
new file mode 100644
index 000000000000..8ca450e4b9d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bao/bao,io-dispatcher.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bao I/O Dispatcher Device
+
+maintainers:
+  - João Peixoto <joaopeixoto@osyx.tech>
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+
+description: |
+  I/O Dispatcher device for Bao hypervisor guests that run virtualized
+  devices (e.g., VirtIO).
+
+  This device is only required in backend VMs, which are responsible for
+  performing the actual I/O operations on physical hardware. Frontend
+  VMs, which only consume I/O services, do not require this device.
+
+  The I/O Dispatcher provides access to one or more backend devices.
+  Each backend device is associated with a contiguous shared-memory
+  region used to exchange I/O buffers with the respective frontend
+  driver, and an interrupt used by the Bao hypervisor to notify the
+  backend VM of pending I/O requests.
+
+properties:
+  compatible:
+    const: bao,io-dispatcher
+
+  reg:
+    description: |
+      Contiguous memory-mapped regions for each VirtIO backend device
+      managed by the I/O Dispatcher.
+
+      Each region is used to exchange I/O buffers between the backend
+      and frontend devices. A single region corresponds to one
+      backend device.
+    minItems: 1
+    maxItems: 64
+
+  interrupts:
+    description: |
+      Interrupts associated with the VirtIO backend devices.
+
+      Each interrupt corresponds to a backend device and is used
+      by the Bao hypervisor to notify the backend VM of pending
+      I/O requests from the associated frontend driver.
+    minItems: 1
+    maxItems: 64
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    bao-io-dispatcher@50000000 {
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


