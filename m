Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED0C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qq48PaNhiydZ4XhZssZQP/FuF1+9caRFDHcLr7t/Kb0=; b=KeLVZXrpSflarpO/ZlXaUPJs4Y
	m3f0OIw7UucLFQAXA/LJesGWPXkGIXdmGhZa0RGkVqVzS2+wWxdC2zUhObfOcHPmxlvV84IZ3BmOv
	2Fx0aCJu+ewsgXGRiqT7Dc0xGR0AvTgigt1YhjZchCqSQMvv24MfQCADq7AEzqK7AjpbknCPHnmwY
	IOpNeuqDzw4z9BA53JWFQ31IuMQl9Y1ORaPa4GcWyHKtyPRz3FaHeEQBQqsv9I0hp1z1TJB12CzSM
	MasA90plorR3MMjZTjyIMcimbg8XnseueGFow7/rU3rlUNDsFsNfCjfbJdjBi2AfGaCPjwPWlNac4
	wwi8eJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3buC-0000000G1ka-2qdH;
	Sat, 12 Apr 2025 14:32:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3blS-0000000G0fy-2kca
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qq48PaNhiydZ4XhZssZQP/FuF1+9caRFDHcLr7t/Kb0=; b=C4CxLhelr/9KI8lmFTOAL/EJLQ
	TBYVMBGsvZMCN1LIUYFCJ52zySRQV9chGAJufrtHH6D0HsDz5v6dKSnXp0/JFyERZMl7Em700MZiK
	D6Wy8l7KJkNsLRkk9V99q+qwGL4MuECgv9EFWfQVHU+zFMq0hsP7g5EQIHwr9J0XtXdRcDC/c0ZED
	Lap3pMsgZja3PYJfiOfBYQTl8J/g2hRMhzW+clKoR6r4EeqfjnPWiaZIbqm0LSa9590TfcPjyF1eB
	UtsKQxqYC0M/atGqmP2pu3xuNQ2/FbPZ4fVWFuGgii+9Ge/bHq+5E8B2uZberUb56NthoXo3eZZUj
	Q6vAGCNg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48302 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3blO-0004do-00;
	Sat, 12 Apr 2025 15:23:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bkm-000Epw-QU; Sat, 12 Apr 2025 15:22:40 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: dts: qcom: remove max-speed = 1G for RGMII
 for ethernet
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bkm-000Epw-QU@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:22:40 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_072322_694971_A5788790 
X-CRM114-Status: UNSURE (   8.90  )
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

The RGMII interface is designed for speeds up to 1G. Phylink already
imposes the design limits for MII interfaces, and additional
specification is unnecessary. Therefore, we can remove this property
without any effect.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts  | 1 -
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
index 9e9c7f81096b..9d077930b135 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
@@ -326,7 +326,6 @@ &ethernet {
 
 	phy-handle = <&rgmii_phy>;
 	phy-mode = "rgmii";
-	max-speed = <1000>;
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 177b9dad6ff7..bc9ae093fc50 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -155,7 +155,6 @@ &ethernet0 {
 	snps,mtl-rx-config = <&ethernet0_mtl_rx_setup>;
 	snps,mtl-tx-config = <&ethernet0_mtl_tx_setup>;
 
-	max-speed = <1000>;
 	phy-handle = <&rgmii_phy>;
 	phy-mode = "rgmii-txid";
 
@@ -257,7 +256,6 @@ &ethernet1 {
 	snps,mtl-rx-config = <&ethernet1_mtl_rx_setup>;
 	snps,mtl-tx-config = <&ethernet1_mtl_tx_setup>;
 
-	max-speed = <1000>;
 	phy-mode = "rgmii-txid";
 
 	pinctrl-names = "default";
-- 
2.30.2


