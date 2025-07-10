Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB4AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LINvhFocgr5lRpN7zPL/hoUtBtdS8dAdR0UzAxBMMSk=; b=FfYhStzO6XyNhFxzyQRset9bik
	PvwF0qu62saO3ru+5tDklm1bPZHgJ3Za/JPQAHoxgIGf1VsLUm+O5wzO8WkC0FD6i+gbPyBL2KnzI
	InswLFvCQRTqiiFx2f4ZOj345Xf73tWLimMjZOHiBWL0B+v9uUdhg8sqMBTMwZpxPAcEUmN8AUCGH
	BNnDCOUKlWJ5vs9ikweNtEXdsBvNpkjLHy4k7RQNEYtljXF1HoO5pM6/bxSgjQJpUhM/k7ze0cBc6
	6RJeNMlfiuMpYWfDA1H1qN9aMuGTRrFq90dHfYv0YWk93QhkaPCHmzo9hnu3+iQ2o/omMd8zXGXQP
	B7md4V3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0Eu-0000000DDVd-2kSl;
	Thu, 10 Jul 2025 22:59:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZL-0000000CtBO-1Cj6;
	Thu, 10 Jul 2025 20:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LINvhFocgr5lRpN7zPL/hoUtBtdS8dAdR0UzAxBMMSk=; b=nYF/9jJZI2TKuAI0fu+LrNsz+Y
	OlstYCwGCZkFP03Jq7YAtv51q71RywZSrCLCEU6aJVKDJ4sKcZ6OiA/Q6QdtlpwRAjMQEQAwir7BX
	ps1ZdffoBlKPI2/nrvVxO+ftawB743lsN+qTSApo9+Y4l3RwMbbWM/0pXbMXZFiB5G6EPcVl7slY7
	sCuBLBYxkP6tbB4gApD0snWdeuqUCkTONyLcGdYzpc610zoUheFayBN8JZs32Jp+e66fZuaAF3e34
	0wY73Z4O3B5Zl6yfacp9pPt8q7oUhrTCvUHmvAxMiuvNwfJsrnIFLbWcN5p9BeA3ocUaBScHgdqWL
	rV925zuA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZI-000000098zm-0t5m;
	Thu, 10 Jul 2025 20:08:34 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74b54cead6cso1036845b3a.1;
        Thu, 10 Jul 2025 13:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752178111; x=1752782911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LINvhFocgr5lRpN7zPL/hoUtBtdS8dAdR0UzAxBMMSk=;
        b=KHCWmTLZDNbn6PMNGCxCggpTLvVtwu/YEGIrxkwu6o2I8aGI1UY9pOx+XA/MTieKdx
         iF/TETKnZhtjj3A2SK1DYoHuAcA+q1i+XAjxi618Pti+Jhy3PfmwVLZ+yhmdSGMGYFds
         iY8YrPoXfRXYM73gH44zoTsvigxJ0vnGfpV3iDeEZXHTbBaxnp17IViUXinTT32mgzE6
         KZ6It4BdSqrOr/j+ibUDn1wbMR/1sfZtDsUXkL749VZYNu5X8YFpHMtjehIg/nny5rgF
         c02QzTUIHkh9ICNGS12KJI1UzX8pEBqujwz9qP83YflBfcwmyhE1eUUTQZwM5LFOWNuZ
         dq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752178111; x=1752782911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LINvhFocgr5lRpN7zPL/hoUtBtdS8dAdR0UzAxBMMSk=;
        b=pENLuo2blAGCX6A2Nm50rftKJwR4E0TxoIOcL5cQOq2OtJX+65PZ3yQHKvZw3avGEx
         lLlb+gLIJZg9iJGFlZIOilb9kiKaZJoHKfgE/HbE5RqSdF0t6an+zUVGeBL6Aow3D/7K
         em2e96H0XayxmG0VxQboPHz4kjUPz45c/uOQ/v4XhhljRbZboBpxwvZBFvT+kTF1HTYc
         1BVO6rG6CSTdqPjRPDnAdczH1u09kn3rzVTCHlU6/aO7cBq//3iLcwjvX8v584NUepVO
         HKd1ryyBWHkSQt/JsW5AkDSsLUWpTtrcpj/J6Mx7Jp8yMNBwB3cBVr3BsoNiK43BqyDw
         wRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK+lfUTpu4gu8QHVDAZ+XMiAzfHNzOHaBg7i/UKD4ijp32V1xhSG0mL4hL9Ms3PbicsW2EJbY+NXRnl7Ef4mg=@lists.infradead.org, AJvYcCW4FuWUaVP5CzV6/Y7dLzv1POzT/6SAy6Qpts3HpGT/9O4Ed4GRMULf57dlrEbi6fvzGr/bvI1+I+O+7GMGtXZy@lists.infradead.org
X-Gm-Message-State: AOJu0YyGff57OsSuIvC43kjq7TP9p5kGj2kzOL2JZJ7qvSrezunYSn9J
	FNkYpTx+2wrz/mu29XfofV7dgrWZl3CZDhGc1v7ZYbpNnVWBZO0rc7R6
X-Gm-Gg: ASbGncsqyfy6VXK2XYE6zyCmUWBqZedmwF4On7ujgG5F2wE4A4vyv67SnJFc3cOknxe
	M9tG+DQ6GLis0XN/VFx41qFvSKaOKjpA9p0bfhGbnzu9vZTNZuzuRORxrJANKghqwkaVdFqhmmr
	MVBz/LtMA3kIXygdgmPHhUBw3uxnVeszdTcxa+u7jsZkmiv4nqbquT1jW1Jpsw46EmhxwBJiA0A
	iZbHTLTjJIP3dftID8pGG11BsKVKH78r7tyiIb1j35xdTjlwbJP7+V/pvIFNPRI54rFG5L4yiRi
	lrz/1IyHWnN+iDondCP6aD/0w4VDT8V4puOFMvrZGgY=
X-Google-Smtp-Source: AGHT+IEXno8suPMIMXytYz8ChGbVNsFci21RBtRSQCE+mON6qbu35E5Mu2Owh4P2zQEHpWvQFLXmsg==
X-Received: by 2002:a05:6a00:ace:b0:748:2eb7:8cc7 with SMTP id d2e1a72fcca58-74ee3629862mr469552b3a.21.1752178110664;
        Thu, 10 Jul 2025 13:08:30 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b29asm2729453b3a.87.2025.07.10.13.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:08:30 -0700 (PDT)
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
Subject: [PATCHv3 wireless-next 7/7] dt-bindings: net: wireless: rt2800: add
Date: Thu, 10 Jul 2025 13:08:20 -0700
Message-ID: <20250710200820.262295-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710200820.262295-1-rosenp@gmail.com>
References: <20250710200820.262295-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210832_401029_2CF6F69F 
X-CRM114-Status: GOOD (  12.56  )
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
 .../bindings/net/wireless/ralink,rt2800.yaml  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
new file mode 100644
index 000000000000..8c13b25bd8b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/ralink,rt2800.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink RT2800 wireless devices
+
+maintainers:
+  - Stanislaw Gruszka <stf_xl@wp.pl>
+
+description: |
+  This node provides properties for configuring RT2800 SOC wifi device.
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


