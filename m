Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A91EC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 02:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/BKbhuL0vKp+y2KpfAqEHa8O7EtSQwyOm6GZvSm+1w=; b=nF2IlN7CDBBv1SrWRdD3RyV//T
	iRWP+bcK4ExDuKNplO8IwzimOUMOge+fIaY8z1yQ/NNvIN5LIbGreBnNFuV9RRd8h/EndNLMek+68
	4vYDbQLp1/HriAI+vllb2oF+wTil1TMHjQcz2DLrVnSadu9Sip98DTelMxijTFp/5SL/lMVSUwmrh
	s89B4pzqp+3kpm9a3BcDLXOAqbdHm0nLjqloobkOwC2nRM8UisOyw9icgyeedV7y5fQHfe+oACSCO
	UGyfWBC8Tudmp5E2aZLzElc2zTxeubB3EwHAdSLYiqvNuhdgtcTiupXJb/p8zJmTnBIHFS4M/hd/L
	POgVr8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugDyq-0000000DUTs-2H4c;
	Mon, 28 Jul 2025 02:52:49 +0000
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugDkP-0000000DT5Y-2Rpj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 02:37:55 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202507280237496c29f72375d9616a19
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 28 Jul 2025 04:37:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=q/BKbhuL0vKp+y2KpfAqEHa8O7EtSQwyOm6GZvSm+1w=;
 b=OiUClBy6R0YgGTQrQf2qBC80TEj3PkJmCgCgrMNtFZxEmcNPi4TxKWJ29lZ9UZNxYFH2CH
 QwD62LSEl0FewM+zRI9Tb1ndtoYvZHArFL2a/wQmZzzKeiQ0ic5MIudfRpMoxMCQ7vb6F4ww
 IlffDujgEDssYRysjsWaKdZ32ZhHV0dCtnvcvqciAX3DK+CzujBA3xPE8VQV8+J4ptVi0os9
 zeJS+LrB7RfemsTfTyak5DWhGpHRS28AKrdLV0cKGD0WL9PK5v4F5+k6D4yketwBhQ1pzJDt
 q0PtoxYg5nSdODNw0WKh2Kqiaqhkg+RWXRDFOcKu65oAHl7lCYmpmTFg==;
From: huaqian.li@siemens.com
To: lkp@intel.com
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	helgaas@kernel.org,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	oe-kbuild-all@lists.linux.dev,
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com
Subject: [PATCH v12 5/7] arm64: dts: ti: k3-am65-main: Add PVU nodes
Date: Mon, 28 Jul 2025 10:36:59 +0800
Message-Id: <20250728023701.116963-6-huaqian.li@siemens.com>
In-Reply-To: <20250728023701.116963-1-huaqian.li@siemens.com>
References: <20250728023701.116963-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_193753_762423_6C95FE14 
X-CRM114-Status: UNSURE (   7.90  )
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Add nodes for the two PVUs of the AM65. Keep them disabled, though,
because the board has to additionally define DMA pools and the devices
to be isolated.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index b085e7361116..be65e6aa7b80 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -843,6 +843,26 @@ main_cpts_mux: refclk-mux {
 				assigned-clock-parents = <&k3_clks 118 5>;
 			};
 		};
+
+		ti_pvu0: iommu@30f80000 {
+			compatible = "ti,am654-pvu";
+			reg = <0 0x30f80000 0 0x1000>,
+			<0 0x36000000 0 0x100000>;
+			reg-names = "cfg", "tlbif";
+			interrupts-extended = <&intr_main_navss 390>;
+			interrupt-names = "pvu";
+			status = "disabled";
+		};
+
+		ti_pvu1: iommu@30f81000 {
+			compatible = "ti,am654-pvu";
+			reg = <0 0x30f81000 0 0x1000>,
+			<0 0x36100000 0 0x100000>;
+			reg-names = "cfg", "tlbif";
+			interrupts-extended = <&intr_main_navss 389>;
+			interrupt-names = "pvu";
+			status = "disabled";
+		};
 	};
 
 	main_gpio0: gpio@600000 {
-- 
2.34.1


