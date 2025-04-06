Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZfk8RedLxtNCRcmkK7zn9ngWF+gdEznqP4g7JRtTIA=; b=25FErQBh04d9j/Iw7vsneyLp3i
	lq5d4oqXiYOWKjhBdjFyB0C5nbo2YG8w307jhgrwTxs+jLeWi+GSJ1xC+3rM0GPnlSOxga7MFfzJ7
	H4yPcIneVu7dvnQgz+NG4PbGeSv+a6dBb2/MnfokuO2Cq2Um6kWIKu0huWKZIiuP4p9jwYc3DJoPX
	ZBXDkhzWQMqKczo2Uu+5GzI+XA6ITUDPbx7Di3pt5Mf4KqIReCSChsWDn5rFbGOiK3MLckdrfm11F
	r74I528CxYLXJS53dJwdU0AV0gf9c+zZauiUdpxOGcrbpy+iRYbUfr9HziGUQpQLj1aAjKrnp78fv
	NsnJDirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RMa-0000000FRuQ-224S;
	Sun, 06 Apr 2025 14:52:44 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RJ8-0000000FRUs-2sC4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 14:49:12 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZVwG94DQTz9v5Q;
	Sun,  6 Apr 2025 16:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZfk8RedLxtNCRcmkK7zn9ngWF+gdEznqP4g7JRtTIA=;
	b=mfar+LwcHRFAAtIJakws9GLQUAKJL6p4GuUjpDXHMMu4dqt3G9c+ziKhT1zztKCavyQFlc
	oD1TuhQmpmPcU9rjJ4VWH6pJ8zVsLjcX6TCH8S0TPKQmcHJRPcfTTK6FOhyAVcf/uP7QqO
	uLgGtyr4+P9N+J1a4WpSZpiFqnaLX4sGd9G2HsJJsxKFIddBEWuc3/24vILjpE0IfPnyaH
	t0Vq7IJAWbQCLrYTlM/ms2hWtbHYisFPL6DpcCAFiZH92rOdaqTIvzQPmb/E7ZEWE5epk6
	o6CUEuIgTWgvnhRk6DbiaE+heriE5R4lotjqI06vUtEbC1agTZI8kM8OHef6Aw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743950943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZfk8RedLxtNCRcmkK7zn9ngWF+gdEznqP4g7JRtTIA=;
	b=Q5By991cWEpFyGc0WcGeB+yCJHOfB9nkul/mqE93eW5FDMfg/KQZfF297oATa24l5CDLQ1
	LUX5MjnDhBKIAf3xaNuu3z93uwTw2TR9DRXv2KnSik0FVCyD3H1bovvd1eHnwk+SqXSy3x
	eBe7KADGE5MSaSRCTwrmVQ2DX9/h2bfOGyEMR0AWEXtTJ02IC8I81UC4X0hx32zdAaIvYD
	oPgI9hxH+IXqzyfkWv0QC2JtrOY360uQtddKP7BAsqj+0nLY3dJMfDz8u2+UWENeO09sa7
	0h1s5kteuqdZGJjv0tEvmivAdfN5imZp+cXd+XzynE2+5ggj3Zr96FcJQktc1g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document optional aux clock
Date: Sun,  6 Apr 2025 16:45:21 +0200
Message-ID: <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: dbb51fa08f898da8fea
X-MBO-RS-META: k4sadesb9s9f6djnzfhmuzp6g8xxmzxa
X-Rspamd-Queue-Id: 4ZVwG94DQTz9v5Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_074910_868146_88B06E0F 
X-CRM114-Status: GOOD (  11.48  )
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

Document 'aux' clock which are used to supply the PCIe bus. This
is useful in case of a hardware setup, where the PCIe controller
input clock and the PCIe bus clock are supplied from the same
clock synthesiser, but from different differential clock outputs:

 ____________                    _____________
| R-Car PCIe |                  | PCIe device |
|            |                  |             |
|    PCIe RX<|==================|>PCIe TX     |
|    PCIe TX<|==================|>PCIe RX     |
|            |                  |             |
|   PCIe CLK<|======..  ..======|>PCIe CLK    |
'------------'      ||  ||      '-------------'
                    ||  ||
 ____________       ||  ||
|  9FGV0441  |      ||  ||
|            |      ||  ||
|   CLK DIF0<|======''  ||
|   CLK DIF1<|==========''
|   CLK DIF2<|
|   CLK DIF3<|
'------------'

The clock are named 'aux' because those are one of the clock listed in
Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml which
fit closest to the PCIe bus clock. According to that binding document,
the 'aux' clock describe clock which supply the PMC domain, which is
likely PCIe Mezzanine Card domain.

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
NOTE: Shall we patch Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
      instead and add 'bus' clock outright ?
---
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: "Rafał Miłecki" <rafal@milecki.pl>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Junhao Xie <bigfoot@classfun.cn>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add TB from Niklas
    - Document minItems in clock-names
---
 .../devicetree/bindings/pci/rcar-gen4-pci-host.yaml      | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
index bb3f843c59d91..528b916fdb99b 100644
--- a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
@@ -46,12 +46,15 @@ properties:
       - const: app
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: core
       - const: ref
+      - const: aux
 
   power-domains:
     maxItems: 1
@@ -105,8 +108,8 @@ examples:
                          <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
             interrupt-names = "msi", "dma", "sft_ce", "app";
-            clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
-            clock-names = "core", "ref";
+            clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>, <&pcie0_clkgen>;
+            clock-names = "core", "ref", "aux";
             power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
             resets = <&cpg 624>;
             reset-names = "pwr";
-- 
2.47.2


