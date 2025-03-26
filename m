Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F819C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/lomG6J/G1Z46g4mIoWdtRmMOjFhTy33WeBBrymFoI=; b=CAbqYewL0Unpf0YVOFZ466nsEE
	W+rYtYmc72TEri1AJKIjR7+VepMYzxKimdC1yu/ZBYkP48RrFbxDFS/c7oCqz5/phQHTsSNQjrROx
	RW2lUGHTYWBj/YgpIRYxsye6Hn3nyeuo3ypJcJk6IEHyIms6gShfFenwvfxlV7/meW3UYTOTufz84
	F69icqU4pPef/ekMtcIOt76CFrVFZvQ9OxxVdJfXRonFRAt35ZU29OqDMBLuAcf6Ir+caR1Wx8oU4
	m6tYVb/bZEtV1ZUYhVy1DD8DdJ6oVEM9WdvR3UOHdUxjyHorcJm2sfMQFN+ntXNh/r3m/+U4WxhHG
	wwC4a7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSJ3-00000008n1A-13gU;
	Wed, 26 Mar 2025 15:04:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvR-00000008iWq-10I7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso6714105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000011; x=1743604811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/lomG6J/G1Z46g4mIoWdtRmMOjFhTy33WeBBrymFoI=;
        b=JWzhAQbZhjMJI+/5rkggtElhFEdJj90RYSjM9AEUgTx7PNpXOz8+YTplz3MAtbqJq1
         RdlmIabS5J95VSmdqkXbYory5FOw4y7StaLmZ8QcQ8AXPzDLhN7IfBR+uCPkWvAtB9TW
         otdX7CpuX24zT+SVL6X+YBnjwXpunPe2mG2Cae3JxyEz/mM1IfMX9ycorQXnQRFHz+NQ
         k5WY+drbh9/+I6FTaOwvtood8nUtHqAjgKQETEjXWRd+N6RNyuZeAnzWLTk8UuaHjcVV
         FLTItZTHnJk5/jZwFdUVDAqA/LolfrXLtYgJCSctKF6864Vsw9R41xUMlMJElZ/iDNXl
         8Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000011; x=1743604811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/lomG6J/G1Z46g4mIoWdtRmMOjFhTy33WeBBrymFoI=;
        b=hlJWgYf9moBCfWKiYwirQ2gYw1fX0r+XKhJpjf66qhbKlSYTQPaXwQkeZfqbifS9y7
         gVZKfoM4P3/y1b0oHluVxvd/8w1lKALivaCS/dirrA0DpYMFB548H/fuSKgPDUtbHQY9
         qkanGU+V+COne9Q792EaR7hry4g7JXMUaKxhd8TZO0sjrsmDUqjkEjEdG2pT5j1E3U8f
         pQaO5iNBM+JbGLoIWH8pJ/slloxGaLY2NgKEoM8ylNBlg8pwrY8g5u8dwsQIF9inGI2V
         //kw+M3O8jJcH0elzoRvkRRF+dhd/8GsvtYEWQg+r1DEPMvcPDS7SdCGgnDI3UUrd47S
         o55g==
X-Forwarded-Encrypted: i=1; AJvYcCXcqlD63ajCq/koWs4Zth0AZy8wGR7Irrf75eICeNNq5Bio0FsLWQIrTfpMsxSsiGuwTw4x11MrDchQAeeJ8LRf@lists.infradead.org
X-Gm-Message-State: AOJu0YwEpXC1xOrxyxXcCgqrLCKTOsnESexA26EPDwA6E6CRh1XAB7zY
	bdNYjLUWcb0T6/2oo5VlVtkrskEwFw7z/+zcjqHCc+PhmLfjmiqS
X-Gm-Gg: ASbGncuEjoXKjRu7GzNLVeKxcJ0+P67sKEJUKgAjqiG6ITtke1+wuLMQ6fXO1fzENcI
	HUDi88SgM42h9mb3daelcaDkeQhCVXuJwcz8ynbmT3xRPeykE+ed0UWOmvGJHRH3s1wMfAOnAKa
	VKlEMaursdNWqDyzzNmC0/DYcJhjN+owKOOC9niB1+9V+DwdWs0svuADwLoW5IlbgdgsTm+DqPE
	AmxjVnEQzDhmlXL9ytTwLwE+qDiVKYNrBcoPEhbF2ahpHSYPHn1mgXEWCfuxUOZs1kUAQl4RVMf
	Tsq0UIQaGyPP+IWMF4taQzrUuoGNqAMBHRUh4lgAPtCpASvHNpoE40vRj7B9zqKG038nBobOrqb
	K8VM=
X-Google-Smtp-Source: AGHT+IEIcUFLZuJ+CZrWTt/yKGPAxWem+MKUwzWCtkifX+BMYe55mgN/WTi1vPZkmR0ezxHKuAOQsg==
X-Received: by 2002:a05:600c:1c07:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-43d77643440mr34306375e9.12.1743000011301;
        Wed, 26 Mar 2025 07:40:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 11/15] dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:41 +0000
Message-ID: <20250326143945.82142-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074013_283054_3B887C88 
X-CRM114-Status: GOOD (  16.57  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add documentation for the pin controller found on the Renesas RZ/V2N
(R9A09G056) SoC. The RZ/V2N PFC differs slightly from the RZ/G2L family
and is almost identical to the RZ/V2H(P) SoC, except that the RZ/V2H(P) SoC
has an additional dedicated pin.

To account for this, a SoC-specific compatible string,
'renesas,r9a09g056-pinctrl', is introduced for the RZ/V2N SoC.

Also add `renesas,r9a09g056-pinctrl.h` header file which define pins
that will be used by the driver and board DTS files.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 ++
 .../pinctrl/renesas,r9a09g056-pinctrl.h       | 30 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 768bb3c2b456..5156d54b240b 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
               - renesas,r9a09g047-pinctrl # RZ/G3E
+              - renesas,r9a09g056-pinctrl # RZ/V2N
               - renesas,r9a09g057-pinctrl # RZ/V2H(P)
 
       - items:
@@ -145,6 +146,7 @@ allOf:
           contains:
             enum:
               - renesas,r9a09g047-pinctrl
+              - renesas,r9a09g056-pinctrl
               - renesas,r9a09g057-pinctrl
     then:
       properties:
diff --git a/include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h
new file mode 100644
index 000000000000..206bba07c288
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/V2N SoC pinctrl bindings.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A09G056_PINCTRL_H__
+#define __DT_BINDINGS_PINCTRL_RENESAS_R9A09G056_PINCTRL_H__
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZV2N_Px = Offset address of PFC_P_mn  - 0x20 */
+#define RZV2N_P0	0
+#define RZV2N_P1	1
+#define RZV2N_P2	2
+#define RZV2N_P3	3
+#define RZV2N_P4	4
+#define RZV2N_P5	5
+#define RZV2N_P6	6
+#define RZV2N_P7	7
+#define RZV2N_P8	8
+#define RZV2N_P9	9
+#define RZV2N_PA	10
+#define RZV2N_PB	11
+
+#define RZV2N_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZV2N_P##b, p, f)
+#define RZV2N_GPIO(port, pin)		RZG2L_GPIO(RZV2N_P##port, pin)
+
+#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A09G056_PINCTRL_H__ */
-- 
2.49.0


