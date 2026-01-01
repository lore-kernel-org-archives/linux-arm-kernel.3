Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC96EEE25E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkQQBcY0vCVit3MxRiSlGpKSZBu+yOk6JMQzU+ULlN4=; b=B84h4JTLIACafP2HB5uAVNMCXa
	lI7+pHGHy2xzEDV7p6id3hz3g+SgpMepmyj8DOKcHxTL2itLshv0qkZ2ZghQF66ujhL8HbhASCYK6
	3sorBYylpij/cbMW9qK1uZHoGcM1H5tw4sRI26Xhd6CSDYCOOpmX+yAuHNXd91Y0efJx61WxOlgDh
	eLHaDibbnvxGWhZ3tmRIwpTt4tan4hYlPHcbkwVbPAh95jgtUkrWZtERh+bxgRgEjIQGL4CucRcX9
	zOXqxBsbOjAdZ0PpNgiDNsaObyi3d9ZXqmIeh9zqq9yBAeVKESkwwK8fk3QVw/t9Pt6AXHgZmCf6W
	IXGZ5gKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPTM-00000007UUT-1BTA;
	Thu, 01 Jan 2026 20:40:40 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPT8-00000007UIQ-3RJO;
	Thu, 01 Jan 2026 20:40:35 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhzGv5GwQz9sl4;
	Thu,  1 Jan 2026 21:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xkQQBcY0vCVit3MxRiSlGpKSZBu+yOk6JMQzU+ULlN4=;
	b=TAARxPQYu2utKSRivz5yhsEJ8xpq7gAnMvF2+1eHA+gXuVEcbhVzwCyVoVUWo9MVfnYtPA
	FPjGNsvlAq17vdMNU5tByLNM6PzKq5NQg54tmKUDrS9g1jUjEgqKu7242DxkGZvqjh2I1U
	/nz8iTH8kyyqLnjbo6w/ecRdhznhmlLHQg/xR8eqkWJjZor1Dq3ll+WVvlQg3aSa78qvux
	Y7I0EjokO2kLWn082qgm1A8v8K0Ha2pkLLFssFpoK/c3hsYNRdoxEBcdFjnPJ8qQ6gKO+A
	1WCZ/jgY1K3XbEE27gWy9m3lmFq5X7jY0Z5qwtYI4PbkMEMcZblR/jA/WW/8TA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qNHU0+Y2;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xkQQBcY0vCVit3MxRiSlGpKSZBu+yOk6JMQzU+ULlN4=;
	b=qNHU0+Y2Wh/3/rE6SCwVVjdT1EceT4gCsSDBqkgBcKxgT6bkndzF0SKtwouSeEaBZSllLN
	Oq9AMT88kGXz0TFidIB7CR3ijoJJ7VK7LCjzQikdCgG0bOqPM17+umIGo7i0P1f9TEF0ff
	d6SRdlVRKWGM2m8o26lgNNnVAI6ov7Y1kGTh6cqFfSDIGH6aIP9CqjOy4X7T+C98HA/HzA
	zX0/w+efS1PSp4ZpK+u5skyPaM9ObqfrdeeP/7/qU6lgUV4Ctq/2UH/ad5i/BQszGF0Tbl
	7XtgUhz1QB+92PUTKyOqULfdbHCQmXNqIuppZR+ZQKSPQ6I+ZGG2f4YU3gOIPg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 07/11] arm64: dts: renesas: r8a77965: Describe PCIe root ports
Date: Thu,  1 Jan 2026 21:35:54 +0100
Message-ID: <20260101203938.159161-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6a076d3078e5c15469f
X-MBO-RS-META: 69kjem8iw9g33xmtnr14188kh68azj6q
X-Rspamd-Queue-Id: 4dhzGv5GwQz9sl4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_124028_563317_8D598621 
X-CRM114-Status: GOOD (  10.60  )
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

Add nodes which describe the root ports in the PCIe controller DT nodes.
This can be used together with the pwrctrl driver to control clock and
power supply to a PCIe slot.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4e730144e5fd8..c25772429e12f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2494,6 +2494,16 @@ pciec0: pcie@fe000000 {
 			iommu-map = <0 &ipmmu_hc 0 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec0_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		pciec1: pcie@ee800000 {
@@ -2523,6 +2533,16 @@ pciec1: pcie@ee800000 {
 			iommu-map = <0 &ipmmu_hc 1 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec1_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		fdp1@fe940000 {
-- 
2.51.0


