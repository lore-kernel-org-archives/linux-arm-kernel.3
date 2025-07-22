Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B265EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67QEz9S+95ZQDu3rHCjWe+DFBCPwq22amqFwl+XgLLI=; b=2+fvwSoHkgwEsUDlo/M8RbJ+k7
	wAtedqrhDOFk9jltai7kJkvlepcRrab2bcAe3e34VzbRfiU5/U9GqAQ4jeJ+3nCy8P/5bObsyyYc3
	pQsFC/p14ngzw8lFH4I9pU5r5RyhtOV+LnQGuitMGUQl52KyWWN65BVZk8uAbLDiEoGQeyanDcaV+
	bhyCeLwawcO2W1p5kU04DxWAWYqm8hgJgfMh0ak4WkvSGM7i3aFqRW6Aq5vZ6GTK6Z/4v5dUCNr1u
	w21XHMiVnrNZLorqLt/NMAeAQjlTkDJFoGDB0/DdeVEyYW3sHoSNUYCQri8IsL5oE05i7ahywmU1p
	TAcXVp1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKrZ-00000003XfI-1tmX;
	Tue, 22 Jul 2025 21:49:29 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKXt-00000003Vql-1JUw;
	Tue, 22 Jul 2025 21:29:10 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b1fd59851baso4144500a12.0;
        Tue, 22 Jul 2025 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753219748; x=1753824548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67QEz9S+95ZQDu3rHCjWe+DFBCPwq22amqFwl+XgLLI=;
        b=JKL1gXqRz1otcr79RMGkry0fgRIHDt5491gApHIske+acVawQ1aHxroJOx2DjIH3CX
         VjLvGb0dpGe3FkSm4wH57xOSUb1xAcetNGGlwlvq0Tc2FkXYYhFv/tNlFVoTeAhybeUa
         Upoe5ORlpt7ez4b3218LKgpuok7WlOAHfXTQp2WTH8vpv04knnZS088Lx/Me0+tcYqTP
         O9WU4+pHRKn06GRw3sqaeo6WNqdBqmyUGkLLKh1dqUsJ1ZIXXZ2VIYf4K9H+f/h3ZEAs
         dkUpMNDKdwZ0wzL5wIIXEetCukh6jXOQpnE+EcUTaGM9WWamh5XNpHnmEIZOMXRlrMha
         wbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219748; x=1753824548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67QEz9S+95ZQDu3rHCjWe+DFBCPwq22amqFwl+XgLLI=;
        b=dmk/R+IhONK8duGo17iWLQXq6/GfezAW+Cl/bJqrB0vo9t0f/iKXu9WjqpKtWxwIVZ
         qeGnpCnLgZUoqLnyH6CiFS/Q247q5jOX2YNGYJ7NfiftVMSH5btvLluVCXXoqly6dX9T
         MAki90SyF4kaATCLiRwAOGOlM3IZmScOiJvoMxPrjDqzAQYdKU1a073EBO2+swbj6hlN
         phogZ3lkzJlsPiGqWxZ9yalNzIr1m0ErfOK7ErRPetljeVtW+BqiEJLmEQmfIJzDwYvY
         MjhxKg6JwOz2MoiO6KpoLGsgNj09jk3jz+49Em6/y5X4yooFZKwZT7V/QfKziQBQhGdt
         szDA==
X-Forwarded-Encrypted: i=1; AJvYcCUF0z9ENHEyYxKgGpmlmWZS3dQhwjqeBEDmC56QcejLvbTYSM4NiY6eUgEpdFd0YsyY6SvuMSdDmVVgLrUMTGdW@lists.infradead.org, AJvYcCWnAMnF2edpZJE3AyGRwY1/7uY5vtiFLVp20VN5IxGvsbENBbKmpfs3fKPtytSTQ1mTYSogPxeO4JhAYqY4994=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Xo3nnkYQiGCEvdeGG6yhqlozwblA/fCrUFYDv3RG0fIe1sV2
	wWiiNnBlIMNs8fVZOLObNYN0T3WonkMTDWgM14WEJBZxk3IzlIpj571q
X-Gm-Gg: ASbGncu5/HfPgz8q4M1H4gFIqp9CB1BWe8iTFkNpetlAs3bJ8CwqFpqLZ7D0mBUSQHy
	fAW8omInk0Gzd3d/w6eN63nyCkso1DK2q3iAhmqjaMmjccWjR1kRD6il7Cq3qos8aR4h2ZVr3F5
	RaV8b7mPHMr4PT3nivNV4d5QeI9Xu8s0hkmKiCOv+fkxMoJwbWqmQAy+LhXwip3D9WRe5Lcr/cW
	Z+cKapjXLIzAXTaazvGPeVK5E5iNXNyDAD2psJRnTpXrWuMc/LQB5JsD9VDFGaXRnfCUIQW3bvA
	sDt/a9hOvgirvUnWu/4TOV8km4WankW3jg3dHZlFKp8wplYPtuIylhMNH4PpA8lqM7cDqyzlK6u
	v89E=
X-Google-Smtp-Source: AGHT+IHAVxGiZOrlaAUSxgUbUh6FKWopOqgmAMQnmnuTA3s27a7MO8YmCyqzn+U2fdYiR74X38P2ww==
X-Received: by 2002:a17:90b:5844:b0:31c:3651:2d18 with SMTP id 98e67ed59e1d1-31e507b41d4mr1284874a91.16.1753219748471;
        Tue, 22 Jul 2025 14:29:08 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519ce384sm94942a91.2.2025.07.22.14.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 14:29:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv5 wireless-next 7/7] dt-bindings: net: wireless: rt2800: add SOC Wifi
Date: Tue, 22 Jul 2025 14:28:56 -0700
Message-ID: <20250722212856.11343-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722212856.11343-1-rosenp@gmail.com>
References: <20250722212856.11343-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_142909_350397_9296B2CB 
X-CRM114-Status: GOOD (  12.81  )
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

Add device-tree bindings for the RT2800 SOC wifi device found in older
Ralink/Mediatek devices.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/net/wireless/ralink,rt2880.yaml  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
new file mode 100644
index 000000000000..04dc5bb2edcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/ralink,rt2880.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink RT2880 wireless device
+
+maintainers:
+  - Stanislaw Gruszka <stf_xl@wp.pl>
+
+description: |
+  This node provides properties for configuring RT2880 SOC wifi devices.
+  The node is expected to be specified as a root node of the device.
+
+allOf:
+  - $ref: ieee80211.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ralink,rt2880-wifi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    wifi@110180000 {
+      compatible = "ralink,rt2880-wifi";
+      reg = <0x10180000 0x40000>;
+      clocks = <&sysc 16>;
+      interrupt-parent = <&cpuintc>;
+      interrupts = <6>;
+    };
-- 
2.50.0


