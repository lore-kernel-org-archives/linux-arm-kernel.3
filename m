Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A3BCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=; b=dtZRS14cYd029tsAphquWPXDXA
	iD72KWIOWiTkst+C6oA2axWazhhp5dP8LMzHe7s5dNXELmJZiCF/DBTGNip3oZkNX5ncZC92Zbrhq
	6SPhdOOzwKM/HM8phK0ZlEvVKKFeIEPVocpOXzK1q2wNh2D7qJqhtIuuaEiUQYHWnFs0GJhkL4IIg
	XruOPYS9WNgauC/pOrEXa/DyGOBNr10LUc6NlBOU+cp0xZCQ9GIiecYlqNifIM8BuU8KdAVstRO0D
	1UFWBPJhU+hGO77/sRVXJJrCZnXgZ4HJlU5guSqifblt3XQiboCd6MUP2tPL5UrSnz0dnwktATbpc
	buUlTfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5SJ-00000008LGR-03al;
	Thu, 21 May 2026 15:37:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5SD-00000008LCR-2ACH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:36:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48896199cbaso49188595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377816; x=1779982616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=NEFcbwT39Ey7nTGg1KHptffFBSpGQ+Sp9Xn/lC4kOl9MsDwW36wj3ZL4cEFd3BeNnm
         bsP8Xc4L38348393GYzQ4F3JxJ/0ltMfIwJZCiWuxO09n6vRzDFBmMNn9JJrEtvPFBcC
         nRNxsx62WBlW/2ojuxb9QFFXYstcVfRiykgaXxCyxrFtGDr2LhCEaVx0vM9hub9VjNaI
         QkETTXyF+hr8sJv4imqz3KDxbRSNyNWgDeyqQnkvjt059nVY9JsMok92StlaH0X+5C93
         QCF16hkYzvF0hhHdVjgwPOScY8ZhJVVET77zfIZK7UsfWhB0ctsEj3C7b+o3oUhk0Hzi
         USdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377816; x=1779982616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=D/xbL3WaOlyG8K0ogIeHcNjOSeLFbmhEX0ydiSjcX/Zm6oA9y3sj+BTyMBk/sV/3/5
         sNBcV70Md7ifIjZQnwKDuDcjQPnw+c2Hmy4BjuQT3cE+q61z4dZ9KY1JwXZMDKaYapya
         UqWreNNYvgtF8gcOGrlnshYL+b/p1X4QMPApoii/rOFgJdoxa9uhZFqCTwTpYTQ2RQwA
         AH5HkWQw0iu0a+6VdIQLh3O0lJpPI4j0wqFiwS3sO6TjZ2MOfGVDgXsuvS0vOoc3BeWS
         5QET5bdPZRp0sZIwKdBBLQXRDr6zusDbuETmJh4LdumRUYgdZMFXL8OZIC1StZMaQAun
         9/RQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oL9qDeZpCvgN+9cpw7kiba/Y/E15W+Tu8y3RdwoZ8rbwa5xI0TD/PMfeyAaQ8OkCGc+XvMIpCGQgcJjjEhubF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn33TFhSwaySEfNNqSAcm9SDLib4J8uGWO9cRiZsCW+Qy480f6
	rGGv58z2VjBg8qIm10ENJa4Aw2MxyBXXMtcyEKIVexJmJAOtj008fAGz
X-Gm-Gg: Acq92OGWPoggWmlIN9lFRw8OhywGxbK7uvoP/AnNT3ATMqXz5Ll1u0a6UHPJtJQNrih
	rYUpn0fpDBJjnVyuzww6kUSBZ81bpVET1U7mtfkOEewp98UjWKF4fxwfOD3f13lRk5p10QprwWo
	v1UL6wS2Csx5eC/7o+NB3jWflLyAiaqNHr+FoLIjB3+bv/WFncIxv0DuYWRIrTO5LK1JDNPJTiy
	y3lgh016HgwaTbL/I7O9VLEJ7q+KJmuP58iSeNrFKJOeq6+MoZnrgTNb1vszqNsQx/HoWQ8Hm/j
	sHWB+CX31KbS/z0Ys6KGqkJAKjpLJAoDWKVYjtTi7bHNli71PzwEwxoxGSjOS8Bs2LOMq1+P6eN
	paumZ7hPCxvtp4ZjpD7U5H1Cu703BNJtDPFh2K6NuWzcKgV3jMDRcHXTx5YfuxwrWyAdUmx55IR
	INL9B7/y2eV/i0fg6LQ2AdJiQdgsirhGkByA+5lOWFCTgFWxP5utGEmXcoAYV1RNE=
X-Received: by 2002:a05:600c:470e:b0:490:3ec9:8711 with SMTP id 5b1f17b1804b1-4903ec98789mr14784095e9.18.1779377815576;
        Thu, 21 May 2026 08:36:55 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm79159825e9.13.2026.05.21.08.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:36:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/5] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Thu, 21 May 2026 17:35:52 +0200
Message-ID: <20260521153645.7028-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521153645.7028-1-ansuelsmth@gmail.com>
References: <20260521153645.7028-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_083657_586801_87634E0B 
X-CRM114-Status: GOOD (  15.41  )
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

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

- PCIe1 Serdes can support PCIe or Ethernet mode.
- PCIe2 Serdes can support PCIe or Ethernet mode.
- USB1 Serdes can support USB3 or HSGMII mode.
- USB2 Serdes can support USB3 or PCIe mode.

Add bindings to permit correct reference of the Serdes ports in DT.
Values are just symbolic and enumerates the Serdes port with a specific
number for precise reference.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml  |  9 +++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h              | 11 +++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..913ddc16182b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,6 +72,8 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.53.0


