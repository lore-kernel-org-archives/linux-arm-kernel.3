Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B1CD0D145
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 17:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0iHqrG/fSpsyvxbDBih5rtjZl9joKUHq9DpgYqHUFA=; b=fsYpH34HTkwUIYanK6SHysQCU3
	6KeeXPwjc4mGmg5pc8HTVVeVhLJLudDGx8aGyUkSN9ZoLSKrfNubqLmK3N12718jS+ZV8k9+vtxQb
	xvMpBpXuYU0YXBfBWJiDLIRYSZYvYlznOJOv31F1huBO1NwlWqVOjb7c17PuBNzts8rVHWamlfe1G
	PzmNToBLW3Tm6wZFqIEITxmJ2Pb1gA9x8cRga0kbUhUQ4MkOULXZ7rZ4IHhomjHf0SXfcod2q3cYm
	BOkKFiNlTnAq5avSo5tOFcNBC08nA++6NsayI8asp23CARQeBW7anDoIsxGf+RfCKXpFbNtQpWT8W
	khtFmdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWum-0000000FLbz-01C6;
	Wed, 07 Jan 2026 17:01:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWuj-0000000FLbU-46ba
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 17:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 171B660007;
	Wed,  7 Jan 2026 17:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4993C19423;
	Wed,  7 Jan 2026 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767805300;
	bh=6uEVhzlmhQI9tsyOAY16BpmJz+ZIZQnfbzuT3IRizoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MVNEKDSbcRXzlWQNGU3FsWplI+O0TVIBENkGefy9VbrMVJTgkJKa7+2XSkNzjERSb
	 j6FT0CoXVEjEpqktyD7MFWdDQCP7i2+NvOkMQyxc4/81zI5L5DE/PeLFAygQ9IgPo4
	 apWHXNQTxlp7uiL+KU0Sbge3suAfAd6YAe8WxmQYtPfL0tmLcfXOaJw+ocoUPy+jYc
	 9idbEy8AglaqdZBQHRnqHyQuxCVEAWI0fIuq47trnVFaU23ZRjRDVWs6Kmx3whtxu/
	 gU/N7ZcBaZVoYfkuBSBNsDEkq4emf2GDSKkwblyS468zzWZXdvpRfqmH8B/ZghF8Cb
	 V0T/nquDfeswA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 2/2] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Wed,  7 Jan 2026 17:59:10 +0100
Message-ID: <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=chleroy@kernel.org; h=from:subject:message-id; bh=6uEVhzlmhQI9tsyOAY16BpmJz+ZIZQnfbzuT3IRizoQ=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTGTXi0ZH6ii/rF5Gv3G3auNtvOxcIRaz75soCefUC1U G7CofPTO0pZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEJngxMsyR+cnV+dJpxkmF 6MBDbNOsLnznKOoIymac3rr2/K/PsdMY/vD9MQ9fVOrMVnOn5PVeLut76aE/T638rj3hg6/P9gO f/jMCAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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

The QUICC Engine provides interrupts for a few I/O ports. This is
handled via a separate interrupt ID and managed via a triplet of
dedicated registers hosted by the SoC.

Implement an interrupt driver for it so that those IRQs can then
be linked to the related GPIOs.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
new file mode 100644
index 0000000000000..1f3c652b1569d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale QUICC Engine I/O Ports Interrupt Controller
+
+maintainers:
+  - Christophe Leroy (CS GROUP) <chleroy@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - fsl,mpc8323-qe-ports-ic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#address-cells':
+    const: 0
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#address-cells'
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@c00 {
+      compatible = "fsl,mpc8323-qe-ports-ic";
+      reg = <0xc00 0x18>;
+      interrupt-controller;
+      #address-cells = <0>;
+      #interrupt-cells = <1>;
+      interrupts = <74 0x8>;
+      interrupt-parent = <&ipic>;
+    };
-- 
2.49.0


