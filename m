Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2EDCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYbyt2QVvWK0yfYfpwd+l+UaKa0wzEpSNEDN1sJoHOc=; b=pRsF1OQFJJOmLz4WjhmplVJbvK
	r9T366Xx/S3mj//nO2qbfC3pbUEffgDIwhI68Wap5Aht7LRo2nYDUXEbkjKB5ApVkveqyjLtIJHKq
	i/g3t1SkVHwZo4cxLH4f0CRcBbofDRhyq7ZcUoj7VifQfv8ap32v3m3HJ9Pb6F+9IG1T1gczlphVD
	+w3mRcjYMp/yfZ2+Inkj2VB3j5x24RcPDNGLSNSYeuebHGxr+gXaVbzJYSXdKvvX4BoX4JC/8pDov
	k7JOYXmaerauoGzYfzu+s1fxNdOmzVAh89um5UknVO3WpiuiTMXwe5DMXPoSD8aPOiZ75+3ArhGGJ
	zOpzyIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJY-00000009GLY-3GOH;
	Fri, 24 Oct 2025 11:50:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJT-00000009GI4-2BFO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Oct 2025 11:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HYbyt2QVvWK0yfYfpwd+l+UaKa0wzEpSNEDN1sJoHOc=; b=ZRCKFAd7F+LIqt1lmeHaFGt8Xa
	UMCsvOumctevBwGU+bmLZm+UVm2qSSPuANA2D0MYa7Emq3w92Owymn+4EOvwZxodj67Ql69YeBDrC
	dm6EAUgjpb/HIJSRSMGql7ozdLT1Lm4ldAiC6ooLIr05wPva5qQTFhsnRu81JuOrgQfud+RA6SraJ
	AcFw3Jo2mfi9qW2uUtcwfSsR1qBAOh3+zGXGMOaw5MR6wbL0wEBNK2EgAgAWv8CX2RXcDwDZJWAmS
	GiLIDNtUe49+WIS/mo2H5JcY9rtAix8nA38V3R9g7APg3/KmL3yWjEVw+0ctyJ4SpC2vfZWXeVvkA
	UcF2nTfQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFRm-00000002FTN-3OOK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:55:04 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vCGJA-0002FG-0S; Fri, 24 Oct 2025 13:50:12 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 24 Oct 2025 13:50:00 +0200
Subject: [PATCH v5 08/10] arm64: dts: socfpga: agilex5: dma coherent
 enablement for XGMACs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-v6-12-topic-socfpga-agilex5-v5-8-4c4a51159eeb@pengutronix.de>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 "Tham, Mun Yew" <mun.yew.tham@intel.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_115502_919146_D70BBDCA 
X-CRM114-Status: UNSURE (   8.67  )
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

From: "Tham, Mun Yew" <mun.yew.tham@intel.com>

Add dma-coherent property to device tree for XGMACs to resolve kernel
panic error on dcache_inval_poc for XGMACs.

Signed-off-by: Tham, Mun Yew <mun.yew.tham@intel.com>
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index d0c139f03541e..63c0aa8550313 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -558,6 +558,7 @@ gmac0: ethernet@10810000 {
 			snps,tso;
 			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
 			snps,clk-csr = <0>;
+			dma-coherent;
 			iommus = <&smmu 1>;
 			status = "disabled";
 
@@ -672,6 +673,7 @@ gmac1: ethernet@10820000 {
 			snps,tso;
 			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
 			snps,clk-csr = <0>;
+			dma-coherent;
 			iommus = <&smmu 2>;
 			status = "disabled";
 
@@ -786,6 +788,7 @@ gmac2: ethernet@10830000 {
 			snps,tso;
 			altr,sysmgr-syscon = <&sysmgr 0x4c 0>;
 			snps,clk-csr = <0>;
+			dma-coherent;
 			iommus = <&smmu 3>;
 			status = "disabled";
 

-- 
2.51.0


