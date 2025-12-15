Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531E7D5B86F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xd2xszWLdwRmGmmRfRKjv6Ud8DXA7mr3aXv1B0jrWGg=; b=awMhl+VcFxt4MZPXRS0Mdk7pgJ
	JX5GwhkW9JHLjO4RwBNddZVd0kfkQkcgEGfNmdX1gPsc6jodSXxyHEqkstOC3d5uQMpnP3y2nnieg
	MNK1wistq9bOv6moK5fav1eTnPu1V7Ee2T5ASoh7DffwB/D5VXmweqYkOIz2KsqUYl8qHXEdYGd2Y
	Q4ZAbmkYS5XrQ4ZwtMn1FD2+puDOSfmo6uFtWPmNX3+5iFqja4TFmBizUmY00glXAivau9cZDKGby
	W5iAYl8cO+cPW1X9AUXQo4M+tU5NDW1vf6qKLc1djXPww65pVBGbKX6jbZGjDeFcz+0vaaguxhVD2
	VYcf8bbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG41-00000004HXJ-2n5Z;
	Mon, 15 Dec 2025 21:25:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG3z-00000004HWi-229k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C37FB4002B;
	Mon, 15 Dec 2025 21:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BC6C4CEF5;
	Mon, 15 Dec 2025 21:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765833902;
	bh=M7UaQpz4jW3hjZgi/W6Zm+fYN8tvjLjDw0dBDQ15e5w=;
	h=From:To:Cc:Subject:Date:From;
	b=QPAgoKHwzAjngSr7dD6jsQOt83/ddfFyPv3JcLp+nD1FckJI4CvnsyH0ZFgpTjLGO
	 jfE4lyFoG8jArUnY7vEDdQE6T+20LPtjWSTBMmY29CCKSXb5xrIjgFPf2o62+pOd2c
	 +2PukrEpvdz3LXC0iCGsKFcg0GTdRVlrW17CyZlcmLAhEuQGAtfP6QBhJi4d3SBs1u
	 syk5UyqDf4svXhMQPj9igK//9DxQRDmG4uyBItLv/u/lPXbFjtohbta+HjW4iN04O+
	 8pl0CUlAXHnkNbIBRdfszk6wuHABre1hLkIHEu7cWahjP6Q+VCoDxFa/R79kzlB9YR
	 s0/p09t4Jog9w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: PCI: socionext,uniphier-pcie: Fix interrupt controller node name
Date: Mon, 15 Dec 2025 15:24:56 -0600
Message-ID: <20251215212456.3317558-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_132503_540840_6C2C16E4 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

The child node name in use by .dts files and the driver is
"legacy-interrupt-controller", not "interrupt-controller".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pci/socionext,uniphier-pcie.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
index c07b0ed51613..8a2f1eef51bd 100644
--- a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
@@ -51,7 +51,7 @@ properties:
   phy-names:
     const: pcie-phy
 
-  interrupt-controller:
+  legacy-interrupt-controller:
     type: object
     additionalProperties: false
 
@@ -111,7 +111,7 @@ examples:
                         <0 0 0  3  &pcie_intc 2>,
                         <0 0 0  4  &pcie_intc 3>;
 
-        pcie_intc: interrupt-controller {
+        pcie_intc: legacy-interrupt-controller {
             #address-cells = <0>;
             interrupt-controller;
             #interrupt-cells = <1>;
-- 
2.51.0


