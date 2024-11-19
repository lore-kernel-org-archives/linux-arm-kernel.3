Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C76D60D0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 03:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vaaAwP82EEkak3EibruVYmycrwaT2pwi3dqccRnO+0=; b=F/os0TrweyV5JCmScaZZrVymaP
	qlHlOVX9gy0W65CP3szjGaUEf64knGYuh4UtH0VhDFeN2tXJxEPqFpWNH/1sF/j/W6yGPJSW0JA5/
	i3lWTdLuLIHhJGbsBPEaE0oQZ9huqf4yUoeK44do+9hdeo2lYZyaAFKpodTRKtpY3YweYVA6XNitL
	ZsUdKnygai6+gB27+Ob/b0p2guo+wI6UqBxYH3CevOmH4JLrWZgwhrLk5/25IiNEj3kwD8e+I32yB
	jXZDOx6Vjxv4mbHQjBIs/MuybPbtUBSPq4SuN8lOg23VioDV+v1M0VMyFc+8b5Wey5EL+wzMPngp7
	UYarjyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDEVb-0000000BEzV-37o5;
	Tue, 19 Nov 2024 03:02:31 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDETn-0000000BEcA-1D2G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 03:00:40 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ea568d8216so1612211a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 19:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731985238; x=1732590038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vaaAwP82EEkak3EibruVYmycrwaT2pwi3dqccRnO+0=;
        b=XRHk1KiQv/ZRA/uAs+SqRA4bAFWRZiRkBE6XcMllMPfS1OGQQcB81wVqLXq4D1jbWR
         fzO9VPbi3NR3azd8G3aoOhyPduAcns0MrabPdplW/MgD17PJDjj1MuTuOojT0G6Fq8r9
         2HT2r+imbDmvPJ7uHR0Nny3fiXmA495ZwldJ6pheYrV7BtGzSaz9uX8tv7qRCk7hUPaI
         JbldVGH/7S30+sxXzXxJD5qrhrCYwWxmzGTZBNeZ+eDY1/W3bz2Loly9FXmnccla+sgz
         ParfmFTmlGw4fxY0mXmvq4bq71VU4UvqI4tVHy1Sxk3WiYZIQ8EwnckiFPIcCLdd41rO
         p4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731985238; x=1732590038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vaaAwP82EEkak3EibruVYmycrwaT2pwi3dqccRnO+0=;
        b=jCU6NKKCi1ydnBo969fVekcPAaB17+x9UNacsfgibSL3Kt7XCQSIYDNwyBDupOYVhc
         XBXyVC8gcpdB5UC7AjdPVkvtitKaJBx18kqk7u8hUw3JJPcIG4j5HGFkmWp450tNcL+l
         +1je/UU2VrNOXLTRvo8c3tePbdxSW94FV8vYnus8RpUEyQWGPWWOYzuWITeEF9WsLYkB
         bn5GbLv9Wg1viO5Kp//Xg6jRmre8EGZR5JKbp5hndZ41hBBQ6eyM8mufCPOBuN/s6061
         /9c3+kR46Xy+etOe5JuASMct7rS6VQRtCy0GWOCkM19ItrInTw6ERI7hxk2w7d0Oard4
         sH8A==
X-Forwarded-Encrypted: i=1; AJvYcCXiqaSfbmy36hmXD6vM820abK5E9Aie+NVPXcJdvZahXHRru/1iK/fbdT8QmocUqEm48v6/vKoyom5uimVrwFE0@lists.infradead.org
X-Gm-Message-State: AOJu0YzFwQ4VA+WBDThIdXXM9ObV2ElEDLRtvulBg9U6l+SV0oP/83bo
	WMGaKnaHF6nSv+fOIWMfckjE/4SfwLGhgGixicEBNiVpB/pbJUZfsplyElJZ
X-Google-Smtp-Source: AGHT+IFVHX6iGXJ6c8Im0zcXAzR6FVVI8K8MQVMSFY/Le+InvoR1Xuwz3DMH5i/H8I5J9enh6cMEHw==
X-Received: by 2002:a17:90b:3a43:b0:2ea:3d61:1848 with SMTP id 98e67ed59e1d1-2ea3d612074mr10645022a91.34.1731985238131;
        Mon, 18 Nov 2024 19:00:38 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21210fe87f8sm32760785ad.29.2024.11.18.19.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 19:00:37 -0800 (PST)
From: Ming-Jen Chen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Tue, 19 Nov 2024 02:59:53 +0000
Message-Id: <20241119025954.4161-2-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119025954.4161-1-mjchen0829@gmail.com>
References: <20241119025954.4161-1-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_190039_330156_163FF0E8 
X-CRM114-Status: GOOD (  13.73  )
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

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..9ccd81a2574d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Keypad
+
+maintainers:
+  - Ming-jen Chen <mjchen0829@gmail.com>
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-kpi
+
+  debounce-delay-ms:
+    description: Debounce delay time in milliseconds.
+    maxItems: 1
+
+  scan-interval-ms:
+    description: Scan interval time in milliseconds.
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - linux,keymap
+  - keypad,num-rows
+  - keypad,num-columns
+  - debounce-delay-ms
+  - scan-interval-ms
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    keypad@404A0000 {
+      compatible = "nuvoton,ma35d1-kpi";
+      reg = <0x404A0000 0x10000>;
+      interrupts = <79>;
+      clocks = <&clk>;
+      keypad,num-rows = <2>;
+      keypad,num-columns = <2>;
+
+      linux,keymap = <
+         MATRIX_KEY(0, 0, KEY_ENTER)
+         MATRIX_KEY(0, 1, KEY_ENTER)
+         MATRIX_KEY(1, 0, KEY_SPACE)
+         MATRIX_KEY(1, 1, KEY_Z)
+      >;
+
+      debounce-delay-ms = <1>;
+      scan-interval-ms = <20>;
+    };
-- 
2.25.1


