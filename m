Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1703AC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjpHESv7Px3oV3ysOGVoWTf3bwmuOKueJ9TXRndyrNg=; b=VNAEadRo3TPqg19W1kkwVR3vPb
	xwMJZdzztPdESdPjQcBjuSGe6iSv7gVicezYbWEjcKnvjloY7GCpZWjI9vYcdmFsEEvRr0GercxYk
	gAukZ7e6jtBQ7z23JI8aMw6rkrssR0skRgnwIqiZi4A5QZc0ZaI634QGC8GiEesClLQiMYHVKxn7T
	WnMdSzmGsBe+Apzpup/sJh3D4F9oRUd6zqKPTOyI65N3pUWsuU3HrTIp6XAKYUZ63TnJ7BhMgI2wi
	6hw4qaHeo03d5ORuaEv9rRB//jSAi7IfodXHbiL1YCLE8tuBR9jsUBi4+WTY4wh7OPJhJ7pAYdgCH
	WCF8vTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYXKc-00000000s0q-3DIh;
	Sun, 06 Jul 2025 21:55:30 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYX6u-00000000qnj-2nB0;
	Sun, 06 Jul 2025 21:41:21 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-748feca4a61so1327860b3a.3;
        Sun, 06 Jul 2025 14:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751838080; x=1752442880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjpHESv7Px3oV3ysOGVoWTf3bwmuOKueJ9TXRndyrNg=;
        b=DM+jf0ROd9VgWQnmp/DFXUbv6gAe3yYikD9FaOjTK6UC/WDqSQjJltDwQYa+p+egKv
         La8Izt1fMAHD37FrfjO+cL56oJNkmJjurcgxzv/CZIkPdA2Pzhtm0HR1rdOD/5jKHpxR
         ytoBQAPvL4Bb799lS7g5LOx79RFsUuLVbu1BZonmIq/p+q9igmSW+mTKXciCxZXv/NdX
         LXKMm2QLdZ52tLOZ4DCU78uXHJu5Hh2gOt9b92u/33BffNylRGu4JhkNtq3lCAx6up2s
         VuvRdQI9hiNcf71XXEDaQ96LpKVtzUkJjYd34rCv3b76Wozi6KCRnjMhEwgHQp6gSmc0
         4mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751838080; x=1752442880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjpHESv7Px3oV3ysOGVoWTf3bwmuOKueJ9TXRndyrNg=;
        b=DFciO6RnQqyLi/SDgxZtXaZMdA7i5svliF+mqkWk6nVR/ll5t/grVTCdUFyV0ceNNm
         d+tt+X+A/PIkwi794tHEgaqY9cbhT8rEj6iyXKqsfGnOqQxNUKsykfMPrJCo+fR4dhEG
         dXRHNCRbtmUg6/FF4tEmOMbtC3UxfJJUIEqgiEu7jZ05C/QDrou3BA5FAGImWwkpEKAe
         9+P2pTMvBOh4/e5fhpmgDh/rYK3I8WraHTwgEiKf2JNBJU0YECOCdU4F5gB4m38vdHs3
         1crwC8x+Gmoyoojj3oRXdOppdiv8jgwAN9+CRNZ85Xg4ReMqVsv7Q7kPAElZDWBebvi3
         tzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFGPXfuujIBqDxBFNgfQIOccYzD3Tf+B5A7XDv40iLMjIXoIQwK+4SXNbaT5IiMc8bly9QFeGwiUQXLI+eM+T5@lists.infradead.org, AJvYcCUZzxKZtgywSnQ1f7IxJRD9MxoPgo+evLgN6V+yLYaLbutxKAuA+06f6kKqnQz7Gaopo/6iSYYjeBeAAjuNKZ4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAOcIwhZrz2rKV7P98oSO9HFmGj4YsKWcYrZRryDbdTAseppkj
	SE5jUtcdtpi59mxD9w6eh2MDeByNfR/o1lu3zIQzlAIjbEJ3h4g3pKqK
X-Gm-Gg: ASbGncvLCe2ZUQATeYYTP7+dzvYmaD4stc6SxdgXWpjU7Plq7jtcPSZCHWoTJTzVUe+
	6bR33jU1IMMTLd2/WxC3A/R8bOO2HN3MRMnxxl01wIs/zFWH/JCmsPoMAGxUWm2ptKLsbInP63L
	rHbK0fW9+GI06y10GroY+ObXhq7BEpt1Hf+AKDvvNVdbU9STlg9MifcjS7dNxjh6Y/Rwxw8/b63
	hal5uqqwAkXuFiSrcdGtiiuZSBMeslrs7Tkbj4WZzQZH6uDvO698IrCQRpbxdxzO7by9wHjK1vw
	rRFpwIFEGBirgnwF9FpF6eSSMs+BReqjUaMR7ro+m45ZHLcoBqpmiw==
X-Google-Smtp-Source: AGHT+IHwiZU5cyKcS3pY2lliuwvqMo5NFkP/fRh4U3ufXzqxUy0ex0mXgD2pjjdqIUXlLCc7QhSCgA==
X-Received: by 2002:a05:6a00:194a:b0:742:3cc1:9485 with SMTP id d2e1a72fcca58-74ce8a8ddb0mr12232948b3a.12.1751838080087;
        Sun, 06 Jul 2025 14:41:20 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74cfad75020sm4126416b3a.109.2025.07.06.14.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 14:41:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	yangshiji66@qq.com,
	ansuelsmth@gmail.com,
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
Subject: [PATCH 5/6] dt-bindings: net: wireless: rt2800: add
Date: Sun,  6 Jul 2025 14:41:10 -0700
Message-ID: <20250706214111.45687-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706214111.45687-1-rosenp@gmail.com>
References: <20250706214111.45687-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_144120_700996_EB52632F 
X-CRM114-Status: GOOD (  12.50  )
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
 .../bindings/net/wireless/ralink,rt2800.yaml  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
new file mode 100644
index 000000000000..fef14ca20983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
@@ -0,0 +1,49 @@
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
+      - ralink,rt2800-wifi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupt-parent:
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
+    wifi@110180000 {
+      compatible = "ralink,rt2880-wifi";
+      reg = <0x10180000 0x40000>;
+      clocks = <&sysc 16>;
+      interrupt-parent = <&cpuintc>;
+      interrupts = <6>;
+    };
-- 
2.50.0


