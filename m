Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF561C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do+c2jt3ez/mwsIBzhfn197DCYpfGLyk5Y7H1RPahPg=; b=S9wIgvggHhsPQIVFbkMN5GE4rJ
	/2GHbiHHVmSfFWRn5ecr2uA779Gvee6GHt+yhrlIh9ArMhTTEdigsebHemOewkIk2qhcPoDQY3X7U
	+x6p90NvcZMxYXf0uas842MYd4SDRURasIjYeeJlghwTkQsvF2lgcCi3ukgfCDQCqvhN+IVHjjKO3
	TbBSvLDGcfrDCBKtpbEgbQ/AxPCGuHMCd7WUjgI/UwzgVjKlu3HT8KKwW3CCcelQsnlaSDKuDXsJK
	+c/KAjgxrXYASkIjKOMxnEIMi7iGqbDpcKDKCbTfDsDpDKXCKDKtL9JCNnMO1fJb0cEIRs7z6Dfnm
	4zfk3/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSDv-00000008m4P-1rq7;
	Wed, 26 Mar 2025 14:59:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvN-00000008iUw-0hJ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso53479135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000008; x=1743604808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Do+c2jt3ez/mwsIBzhfn197DCYpfGLyk5Y7H1RPahPg=;
        b=aOBk+YlgB4aYo35lnU508N/859NSGJqQhXkrKn1CGw4dUvhuYkycXdYqER7tRyPyrf
         0MqUzjIMulzhUaFCdiCZxm/rxSqcBbkM0otX/8NDP35FIqQnhCF9WTX79/5hfbd6+oQb
         ozi4q85tjMHBvuIjuBZFoOp1FBYFVrvipMocM9V5uoovrGxDMwiplCedsNu377N4a1l3
         QNJyz8QTzLWGa+0cd0uMbRW1DkY3oEB1BxK+KW67QW3PSv7F9OsmmbsoiAFZ7GtshDGJ
         zfcB7ZgGKbMbmyavzaNEDtdloQ1kgOxTlMdXQk1tmUNs4N/4LXPW1Ro/N5AaE9cJ6ouw
         slTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000008; x=1743604808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Do+c2jt3ez/mwsIBzhfn197DCYpfGLyk5Y7H1RPahPg=;
        b=Pxcqld60OOhtUfdiHaWprRiTXwvdyh8VA+gWjOSsATbHMJl9QrrJJGOTNRbo58OTIb
         6jaYLXCvFvCl37b5y4t7uJMnC9UjFNvREMFj+NhNbYgypCJI/VTUvOWKYpIKW5eKcy4g
         PXpCs6fuseIxbBbP6TfK8nJ6PeVXUsAJ3clNcN9OFbPIga+DsUY6ll3oICpJHztuEFPi
         MeKWaF0+XnTZbioGzIIdm6WHTcCjF24Vkcp8tB8H7I0VI6MkWfK3WMyykpqtkw+nsHP+
         MRWLFP/gBgfK9jPiS4KIi2JDmEA5U3Zp1PTeeBa5LLK8v81okamvizARzCCYScIKpTja
         axXA==
X-Forwarded-Encrypted: i=1; AJvYcCUk24tRh1UFw3+WO/SgJ3Af6A08HlrfcwQXCCdM5CFHx1fPAeLDp9+xbz+hKqiOhOOam2ON6l4P1HvKvQUNt3vu@lists.infradead.org
X-Gm-Message-State: AOJu0YySm6rlMuRDMEGFa9G14CEN+FbEdYYFs/2T6wCPnKn7Kj9Llb2o
	R1phAN2aabeqby+tF+pLs8zV4Mp9Y5xpcR5BJ0wdJApmfTjxnOHd
X-Gm-Gg: ASbGnctRu6KuoYZEiFYgyXYsF/MHfrVgFKP8EIOvS5107XFRea0gRqPHpXYtWFhwUUc
	RVXjS1kN0c9ZHKNuEL0Jov6kq5UymdBb1Y1Pj3vbo7mVbdhQ/dq2xKlXauhd3OwAgKGBNEzxKCM
	uVG7RStzg8nunFROyCWOykjOdyPhnAqhHe6g/TGf6dXdnYGX5rz7vkua4V0pZcfmt2EormSG7p+
	t0lv0VMTnFrobhSJbl/DUsPW0mB6f0TYkqd/ZXyWCSKBVYPNbKxEbxnfmftn/7T3SHfshe7se1N
	fKyd+W8L4G7VCVUSsC4zXtTTfDmjP0rqpiHlwEXgIy97CxmNtTllPLFqAOktmUe7iBcy
X-Google-Smtp-Source: AGHT+IH7yjSccBFCk7mQThkh+BIzoRh/WlJjnbk5vOyrqffw/vRJDSY1aH3bAENm+vJkBJ73vzMiWw==
X-Received: by 2002:a05:600c:4584:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-43d509f433amr208304605e9.14.1743000007409;
        Wed, 26 Mar 2025 07:40:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:06 -0700 (PDT)
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
Subject: [PATCH 08/15] dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
Date: Wed, 26 Mar 2025 14:39:38 +0000
Message-ID: <20250326143945.82142-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074009_266242_2BE15093 
X-CRM114-Status: GOOD (  17.06  )
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

Document the device tree bindings for the Renesas RZ/V2N (R9A09G056)
SoC Clock Pulse Generator (CPG).

Update `renesas,rzv2h-cpg.yaml` to include the compatible string for
RZ/V2N SoC and adjust the title and description accordingly.

Additionally, introduce `renesas,r9a09g056-cpg.h` to define core clock
constants for the RZ/V2N SoC. Note the existing RZ/V2H(P) family-specific
clock driver will be reused for this SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  5 ++--
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h | 24 +++++++++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index c3fe76abd549..f261445bf341 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -4,13 +4,13 @@
 $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/{G3E,V2H(P)} Clock Pulse Generator (CPG)
+title: Renesas RZ/{G3E,V2H(P),V2N} Clock Pulse Generator (CPG)
 
 maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 description:
-  On Renesas RZ/{G3E,V2H(P)} SoCs, the CPG (Clock Pulse Generator) handles
+  On Renesas RZ/{G3E,V2H(P),V2N} SoCs, the CPG (Clock Pulse Generator) handles
   generation and control of clock signals for the IP modules, generation and
   control of resets, and control over booting, low power consumption and power
   supply domains.
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - renesas,r9a09g047-cpg # RZ/G3E
+      - renesas,r9a09g056-cpg # RZ/V2N
       - renesas,r9a09g057-cpg # RZ/V2H
 
   reg:
diff --git a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
new file mode 100644
index 000000000000..f4905b27f8d9
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* Core Clock list */
+#define R9A09G056_SYS_0_PCLK			0
+#define R9A09G056_CA55_0_CORE_CLK0		1
+#define R9A09G056_CA55_0_CORE_CLK1		2
+#define R9A09G056_CA55_0_CORE_CLK2		3
+#define R9A09G056_CA55_0_CORE_CLK3		4
+#define R9A09G056_CA55_0_PERIPHCLK		5
+#define R9A09G056_CM33_CLK0			6
+#define R9A09G056_CST_0_SWCLKTCK		7
+#define R9A09G056_IOTOP_0_SHCLK			8
+#define R9A09G056_USB2_0_CLK_CORE0		9
+#define R9A09G056_GBETH_0_CLK_PTP_REF_I		10
+#define R9A09G056_GBETH_1_CLK_PTP_REF_I		11
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__ */
-- 
2.49.0


