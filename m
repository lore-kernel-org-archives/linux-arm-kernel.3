Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6A4C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 13:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATEJOv5JRXd5mDEFh5TKeAEKiCU39svbKkcn8dQQ6kA=; b=u7qx5c1ruVoLVkZe1CmyVN1lXT
	0uYB/Db/lll9vq9DaQygWbwZm3cKEBuL/c+xmj/1Dh/RW+k+4GKPItBOPGMW+5FtvUbexcsTfYBTV
	MB/0UQnR3endUVeGzSP5uRaK5hIZZ4G9BzU4KJcK9is6VGj6Sw0j+XzgXzD9ksb87KOlaNCsO9mYt
	vTiIDDTAB75l6AGgCJwjemgEfYMv5u3dv/thWck8pfotA2/ty5ryYhMw8c+fCU88fkGkSGFETUPrV
	u1RaCoDgCZYJ3ECbbh2jLOfYQmN6/fMeyIiiiM07So3xLy3F3QgqJL4ztd73SjTKwcdpE0xEZwtGM
	9tYMFIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBj-000000009Qu-10z4;
	Sun, 18 Jan 2026 13:51:31 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBZ-000000009L8-1Z5D;
	Sun, 18 Jan 2026 13:51:26 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dvFP3077Zz9tnr;
	Sun, 18 Jan 2026 14:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATEJOv5JRXd5mDEFh5TKeAEKiCU39svbKkcn8dQQ6kA=;
	b=AyKVMLIU82YPC5uzQmcTkvWKSbvjzIGCqZjgt4iOLHzKpud1fqlfDI5l/ukPCiMkHcqmkG
	RNnN+sPJXTwhYdrPnaVWoAYbG+D8Y+lnYVE/HD4dkA/SzvaH6JH5dVnFcd5F4EviYb2eAB
	KV5oHqLkK581J2FONq569Ka4DeY54kXMuo3tCOqfL51SB/bG/6sxs3+p7zWUvnATdgWqS7
	hoBMeC2uJ6Rl8+eCasq3zERw/59chB+Nqo3M5ZszbUuoY6EuoeyfCmUWC5PzmKtMrriTHD
	z3n4k3wzFxUZPv7iKjVd5QD25UFSKHQuMkNwzEiQQuofE3hnejVWNuYH2jUGoQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATEJOv5JRXd5mDEFh5TKeAEKiCU39svbKkcn8dQQ6kA=;
	b=Qv4AhdJ07o9L6xHdrzyU1A1SHFrIFTXDezDCnykBAQdBk+kdaaLeNxDBDPCMPjdXtr+SbL
	HL50IJqmCdqqmYsM0qP7jHj0da8jRCSJmGbuX4u9e+ygA5rGQB95LapPu/yQ6l6soab8Gl
	G46G1BFGNPh3m/epcN3jfvu7sBAUg2QWAXn8p71H6Gd702NOMDqzwb9NWGpc5VArL5YPS1
	k0cHwtynF/vLvoy1qw8IQlRB1DkPJz2tMd0wLd+6eOutBRXj1D/LHd0H6G6dNRhiqTtxRQ
	f90pHL3ujsdlO8FolKoECSACdw+AaxngLPQPjCNhLUWNAZFBkf9bYfm2Atz1sA==
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
Subject: [PATCH v2 2/9] arm64: dts: renesas: r8a77960: Describe PCIe root ports
Date: Sun, 18 Jan 2026 14:49:50 +0100
Message-ID: <20260118135038.8033-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6qzzupo9auurkjxax49ksd8prsxnfg71
X-MBO-RS-ID: da2ec94324d16aa443f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_055121_570428_8440D223 
X-CRM114-Status: UNSURE (   9.77  )
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
V2: No change
---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index e64c7b1aebc47..ad36aa8e75435 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2619,6 +2619,16 @@ pciec0: pcie@fe000000 {
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
@@ -2648,6 +2658,16 @@ pciec1: pcie@ee800000 {
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
 
 		imr-lx4@fe860000 {
-- 
2.51.0


