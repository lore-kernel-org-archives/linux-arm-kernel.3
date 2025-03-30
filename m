Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D732BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFYNJp1q91kxPG/H+VOGMsvd3pVp9apafCx8eaD2V3Q=; b=it+0EFMMcfZp6mxZhMJBkj+W/S
	FbeUjeI7DvFnoRjWY8a5ZduOSTjUx9Q1+VnervvQNakuK/v/lGRcMU0TR816/dfDaj1bFDDACVc2P
	UEPC2cpOmCEBUNejpfpUupsQ2KNyQDvdv3ZmX+FhRe+Nac6GRKltuGuNE/dQvpbS/2lFjuKAjc3X3
	1WvpnwIjsxOsCg9aciuQ05BGYuiCtCAz84g2qFUlbkOMQOJfn3sXNlvrWcHkgDs2UNZ97xl6jMJZf
	XpKW+IS2Tw12d1wFCYsL9ZyVVKtFKJMP/OAdhjTofsxmJg8Oy/rMHlEOPG+5JNjXzsp+VQsoCKhR4
	iH5+B9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyrF-0000000Gd0Y-3EJ4;
	Sun, 30 Mar 2025 20:02:13 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyynk-0000000GcTW-3a9H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 19:58:38 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZQlSS5x0Mz9tMt;
	Sun, 30 Mar 2025 21:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743364712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFYNJp1q91kxPG/H+VOGMsvd3pVp9apafCx8eaD2V3Q=;
	b=vxch+Ql90wwi2KwUc+3O1anRnVoHEhcEBabr6VOPgxsWbtPt8cr0cLTR6i5gxh15mXmqlY
	NBYVMANACNKeYKLgJ2bLaH/tCg/e8Q9MRMmNcOWIPW9KKjynqhf8jIE5j0onMTFwYZPHuu
	RyzXhEOr/yoyDaWnSQEJ8PHxM55RgGjlI4G80oSE6yUBLW3QvNdEKInUKM+NVlqVv6kZxQ
	qaVaJRYHJkg1hQQnYoFCUDuwWNWU/lUUONb3IWlcLrLNOGeG/LYbWojeoX4hC7TzS1Vm3Y
	yyZAd435A3ufqKH8r+KjDDyvI61NTSQZs2IeVTaSGZBZPnXJ+F0N3Mujsmkbtw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743364710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFYNJp1q91kxPG/H+VOGMsvd3pVp9apafCx8eaD2V3Q=;
	b=H1BpsCWVtiHOp7/LzfWsgrBCWkUEZlQfXHArFOx0zWI0n0VLK5XB43NArNE+2jqAYxrGAK
	pKcna13LpqHs8J4IpUm2xq9bndH61nOTmlHBcNebkPnroxkjSeMLlt0L80c7esvYS+W5jH
	7sftrJ/J/2yjDdbdv13F/niWXoNlaI6+qfKRjRLKbLWCrE4Yz2ifFTtdC6KpjH4HTOTuzl
	TEo1yCVUzKm5gTdbR6KDs6mS6SuSuDV70pqk3EJmRMOVNlkxqWFLoJNcm7Ur6II0hN8lDp
	BSR/cR91bBgBYEkjEWro1lUCx6c+01mHFUeUQTJHxgVaZAXwtOBF7MExogrcdg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
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
Subject: [PATCH 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document optional aux clock
Date: Sun, 30 Mar 2025 21:56:09 +0200
Message-ID: <20250330195715.332106-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ftkny4rcrcptq5mm8d8hrq8nw5ziwthm
X-MBO-RS-ID: 55d868de086f88903b8
X-Rspamd-Queue-Id: 4ZQlSS5x0Mz9tMt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_125837_039555_B0C60DFD 
X-CRM114-Status: GOOD (  10.81  )
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
 .../devicetree/bindings/pci/rcar-gen4-pci-host.yaml       | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
index bb3f843c59d91..5e2624d4c62c7 100644
--- a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
@@ -46,12 +46,14 @@ properties:
       - const: app
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
     items:
       - const: core
       - const: ref
+      - const: aux
 
   power-domains:
     maxItems: 1
@@ -105,8 +107,8 @@ examples:
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


