Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C743DC56203
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVSOsN1ks7VLJzQhKDw9Gx2RfSThw2ZZvzsniVKDgAc=; b=RplpBw39huW2PMmK4BV6kFn0Mm
	Ao2YpEybkCpnWpQXSfn5bBJYqYd2JIxQbmAqfcJ1EExn/D4Nujh1as6Hy+YuWvRtFt08uiNaq+OUy
	6Oayz1cLfswikjKhnW+8vG6VrIzIX4U29TwcmltLsXjFJQ1takvFoeCxhQuLWrziymS6cGdeh/Bu1
	GuacBJBuK5YuraDk4Tg0KPoUxPXCsVWoU/lDr5NDM0QlzhERWsVtmUjdhytplsEmevy78zRuefZIr
	qHm4oyVsB+EwBDv3JJnJBC1uLDTRQTZ8ETeGn+4P/Hpiu85Qb/6yZAU7HFm0dLO08023LxUr7TdTC
	WlN/xuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRX3-0000000Eogu-37Lo;
	Fri, 20 Feb 2026 14:31:01 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRWz-0000000EoeC-1rN5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:31:00 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=DVSOsN1ks7VLJzQhKDw9Gx2RfSThw2ZZvzsniVKDgAc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597846;
 b=Q/ISM98iDEaiVqyqAcpjOrhaJ0V5AM41GP9aS30GJqiQqjwbxrTwOiYlNlkBkpszMDRW+yfH
 BtT/3J2x8XcOc8zto3cOmuc83FtIAW921xk07YLOHuEZm93QLn7P/negehO86e4htn7pyzS1cHh
 sny5BqkuQmwLBB/rJtUEP3EbLI9WKqrVSP7lxHd8M6qliGeh3PMVh4cL0YJCvpSXn5thAwGqkp4
 sOz+N1n3pM1Z066coSU5iuANrrx8WUWLdIcJXeywnAQ/LC4ZwClc3T/7nRY59bpkt1Fkci2LT0N
 ELqqgwlse4dZgiefQpjcfb4w/rAj+suoGMzRN56fBcSiw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597846;
 b=ckMZeupNdvwgOAbN/LkVqKy2G+fv/YRqIvYg5CZtROhzj2wV5oECquD2LJTFygv/hLP04I0W
 zFuSAtI46Cf242p1jSMUsqftw7nyPvmEjxRhAwEbCZyHnTqxys2dZfPoKVHTM46RD4BhbfFqj+/
 UemhIoUemWubtWEwOPiCHKhhHgGDo/OBaOKAffr1firwwyCPXcOWTc2S64HHQy/86GVf76vZvFy
 dadkSvJhgzRcZ/3g2ARR/cElhExeQ5tnM1HjhpwVJbhEvwd8+lvOJShDWX9G6cEaCkMUCbzfLIB
 iX15MRwdz10gKLjfiiffFecJ9b3xIF7nLLV0e0NySZF3Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:30:45 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3A846A412E6;
	Fri, 20 Feb 2026 15:30:29 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] ARM: dts: imx6qdl: add boot phase properties
Date: Fri, 20 Feb 2026 15:30:03 +0100
Message-ID: <20260220143008.186851-3-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fHXj16dSwz3ybpL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 3f64774df25daa84c68bb334c57fd5da
X-cloud-security: scantime:1.961
DKIM-Signature: a=rsa-sha256;
 bh=DVSOsN1ks7VLJzQhKDw9Gx2RfSThw2ZZvzsniVKDgAc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597845; v=1;
 b=rCecv3H8rrcvfA0Fjh9Kq+Bl7xu01eCrsMRkC/HyW/fngs1nzjmaBgeaJc7p91hGLIWsOOkO
 VlvjNr/JvRkWroZf4WB2DEk4JU82PIczEaLAVPRkXLu++ZM8lgvnQGCRhIfvgcy6DR2JSPEPGM+
 fm/TP3ustXf1YLRSI0Q3NGaHJhvpE8Ngd16kAuJsNGKHxnWJa2rwE2OlZuavW7oZwY8itKPsv66
 XFYXMPUHYc63zqgUKBLYm8Dv60H8LTB+UqLvaBszrgenDPjT39fzLPEq5GRvAbF7UKI0OhBjY8+
 PrOB8kkVwNTi9EaSz1KKx69Xhq1ntzp9IWuL0damdZBTg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063057_755884_8CED9C42 
X-CRM114-Status: GOOD (  10.74  )
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

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

All SoCs require buses (aips and spba), clock, iomuxc, ipu and
SOC access during boot process.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 76e6043e1f91..1fcfe0751327 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -149,6 +149,7 @@ soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gpc>;
 		ranges;
+		bootph-all;
 
 		dma_apbh: dma-controller@110000 {
 			compatible = "fsl,imx6q-dma-apbh", "fsl,imx28-dma-apbh";
@@ -297,6 +298,7 @@ aips1: bus@2000000 { /* AIPS1 */
 			#size-cells = <1>;
 			reg = <0x02000000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			spba-bus@2000000 {
 				compatible = "fsl,spba-bus", "simple-bus";
@@ -304,6 +306,7 @@ spba-bus@2000000 {
 				#size-cells = <1>;
 				reg = <0x02000000 0x40000>;
 				ranges;
+				bootph-pre-ram;
 
 				spdif: spdif@2004000 {
 					compatible = "fsl,imx35-spdif";
@@ -920,6 +923,7 @@ mux: mux-controller {
 			iomuxc: pinctrl@20e0000 {
 				compatible = "fsl,imx6dl-iomuxc", "fsl,imx6q-iomuxc";
 				reg = <0x20e0000 0x4000>;
+				bootph-pre-ram;
 			};
 
 			dcic1: dcic@20e4000 {
@@ -950,6 +954,7 @@ aips2: bus@2100000 { /* AIPS2 */
 			#size-cells = <1>;
 			reg = <0x02100000 0x100000>;
 			ranges;
+			bootph-pre-ram;
 
 			crypto: crypto@2100000 {
 				compatible = "fsl,sec-v4.0";
@@ -1320,6 +1325,7 @@ ipu1: ipu@2400000 {
 				 <&clks IMX6QDL_CLK_IPU1_DI1>;
 			clock-names = "bus", "di0", "di1";
 			resets = <&src 2>;
+			bootph-all;
 
 			ipu1_csi0: port@0 {
 				reg = <0>;
-- 
2.43.0


