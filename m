Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA04FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNa4hPs6+EpEb0GIRuEgBVkSu+eNRa7QDRsXvqoVr38=; b=1IOX4hLGYCvCyPYovqCqCuAiMw
	7wl4DTp8bPv1FztEgv29Nuo5qPpwTm/BO9xTyORl2QQ6ULfsOx4X0GQyR21yw/SwX6n/qGHsycKtd
	W/hUpZ1UM46XULsOc5K+LEeT/CYA+KOXhcHvVPuV/dSVxcpSKiYJM4SW3HD0tnHnt07AYTJMx6UUh
	XRzFmdHJlH0sE8Qnqq/GJ15V4rgiMsaSb/dQegMc/gXjlNuXm5dTCntVo5kRtDoVhapJkKX9kMpZ1
	7BOj/xBkkGN8oSu+eZxKND5de2Ngv5njDRJUCYEFm32KyFViVytHxpmrfmYqs8wYvGNSBUp0nEtUv
	9gjj081A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiYG-00000004vUI-1Oxv;
	Wed, 20 May 2026 15:09:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiY8-00000004vOD-2rF2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:09:34 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-453903ee4adso2043633f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289771; x=1779894571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNa4hPs6+EpEb0GIRuEgBVkSu+eNRa7QDRsXvqoVr38=;
        b=if7ukkzvj3xgEOrh3/m0AHs/0q42dSb7XK/VsF6JfNTHyhoh5a6SexPtz8pfiKEZjo
         aEoHNOP6yjqvToaMmPiRJOrShaq7fkCh9My82MfuzLmzWRs7tcrePAuQjpOdthsoX/am
         2sriLuAFGvLZ8TqsiIiLQzkMqFIrqRX+VrgCPdkpvnI/NmNxluH6oy0Y2zCIV62YrYYX
         nAMkblcSmh9RiG91+3vxN5Fw7wcEWK6rlrpdYWhiIEOjzr3q47YCndupo3mcA9hWzjDu
         1yEvK5eFUGwuAKzJHqdB/IclS6I+i7zGBPZuwZWQK2b4EDCPlW2bUCS7yef2vS1EpKf0
         zHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289771; x=1779894571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jNa4hPs6+EpEb0GIRuEgBVkSu+eNRa7QDRsXvqoVr38=;
        b=f1G8CANyeNq1pY9EZXfb1c403ANddPpzstZuWc7KifGAI7pnnJr1oods0h8diC7Hg+
         TOqy8W+6PfUcaX3lvHpRkt8zugpv1a404sXUSnKQBE/o7V7amfURz6SJ5ipnEvW4Vw+Z
         BFLXCi98ACpoEmSqQKw5SbawextMfweKaOn7gB6ZZP9TxvKZtJNcvCBnIoufHVsjT+EX
         71VH7FbRJjYnsVWYJt0GBeowhO/JBzLsoT1saiHM5hiJP3ajDQKwXy63HlqMaWg8EPYv
         9uoO0UiB86l/XN5WeQkeEFmtciVaOTmpXOL/MZp9asuLH4GOdCQCgIQj+iNfdT1kHzmZ
         HKjg==
X-Forwarded-Encrypted: i=1; AFNElJ/WHwfa6XaF8+S7XArW5cYJxoYwi5Y2BaY4M+SzCvUzqkIX2GvbalupaQ+9vlf19oRC2V7Az659LOup261IdeTs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmg/jvaUJVcxXwc5xSS+r/wnLTrCO+FVdi6viU8SUlYfAs6vjP
	xTl3yCBwW3RWQDJ63sAdG+PReJ/pdN4hvrCuiWyTjPgPLu1DkLShamt6
X-Gm-Gg: Acq92OGkfnjJlu3sCtQcTwXzp4AULlziKrLkR79QSkJ5BofjnBLeirtPeYmOJeyuBde
	BiwoFvdTPy20OG9H+bJD/EKDxZvbjMpEdoIzlTZxcfVrpJiTIgDhOSnk/aqlwZamPL8LtGIODMd
	MveOGzkPHGn7mCUA/5BxjQEwGdBdoelWczCi/Aw4AyYOOhWaLcUAPMflREsDm5o33o2dyGKZuWz
	kyEzP0eZsT1rLgll0Dj+2Noshj8TpzJgv0Y9Ufz4BGr/ID1x9ttvRUMGDzizxJ/Mx4Kvvgq9lMV
	DDZtNIgoJl1T8BR6sSvW9MicpP+pVFO0Rk5oUhO7zuxsbWJ+Rhzk+sJ8BQRO2DV0MyTBu4hsKPN
	mD+1uEyP6Bkzk90bQF1zmyNdM3oBSrhvrRqa7ZIysHYfqJlixylhccHpcjUtnaNte40Fi04p30/
	g7Ha7TzwTpgbbFU3ks60iHWLoZnlVeYh1tXzwL0XAc0ujoGYel5w0rniM2XIZN6Pp+rui2VBZ54
	w==
X-Received: by 2002:a05:6000:2503:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-45e5c35e7bdmr39357421f8f.6.1779289770707;
        Wed, 20 May 2026 08:09:30 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm53639804f8f.9.2026.05.20.08.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:09:30 -0700 (PDT)
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
Subject: [PATCH v8 1/5] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Wed, 20 May 2026 17:09:06 +0200
Message-ID: <20260520150912.11614-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520150912.11614-1-ansuelsmth@gmail.com>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_080932_730027_394C670E 
X-CRM114-Status: GOOD (  15.78  )
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


