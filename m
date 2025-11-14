Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E923CCDE032
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFG888Gb9Ru3OuBdwJfnSjD0IrRTCToX06LrZpem+M0=; b=G5XNqVxburChOUVEQRPGhN1c+e
	CfOXfazUe0ZRnjGxG1qRYnhKq4TxJ3LW17Yy0B4uKNp9yzzOdkFUqIzrCOlKLfb9+vVKfqk+WzW/5
	pmD+VEdGN4u3MqyfWOzuK5vcDjVJwgzc3GlNJxuu2Rh1+KPzAg9K3NUVteRH/NXy8pPcOGVy1Tzbc
	d92J1PCcE+p7JjqvYMoihTplHEUZqQvTYfhtPeGhK2hZng2XQezVwga/0qZDFD7oOFQ2fB9Qll4U9
	pS13SdH0pfvHD9gBcOdPilzkCxF19p/PEkZ92MArSZfvsKiM+ao41UCa1bqsXc0EuMdU26XlSNtNI
	pdlfLV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpMN-0000000BpDv-2t0D;
	Fri, 14 Nov 2025 08:40:47 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpMI-0000000BpDY-3tpM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 08:40:46 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=wFG888Gb9Ru3OuBdwJfnSjD0IrRTCToX06LrZpem+M0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763109628;
 b=q6q/C2TSaEYJzatf+sUx6edaCnRISqlfI8ijQFS3qY1nPIjB1khGAyFk4J7rouvqoYFaqGNe
 qEpR3+kW4bdtj59Cwizd1/+WembdAEnxCBDxcG/eFxX8aVQ1/X/+sGWnk7cko3ajawRNLWiwDyV
 54UOC7NhOrgs+HzXp7wap+V9eUFsICPZ3qIblXklcr1VL0NJ3iYrbQdVzCWRUhSzhGZlTvSY6NS
 mjqNhCUp7QhZL7tzOuahiUNgkoAE3uzJzddZf+tr9PBvjdSgmdEszsI08XOyKnFqEkAH57dqqtZ
 ekLMT6sOM5LbB9u//9J1z88VcrFyq4c8W8m8Q03UZ4jJQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763109628;
 b=ged8YmZ2E1hDJYdF1O2aTcrQm/0rxcqhSLvVD65a6HHBl4HgLzqWg86c0u55vm40qeIDDx+r
 7uNOwE6d0XMyOoaBwMFXNcfzPgdHvg18LPii/yH8aVYXS5v2PXtdSSqG2iIITnt4iLJtYW8vuVB
 ZpHDATAnirozHAifY0IW5fOeGFijd68SuKgVZS32+p3Q8HnM1308ZAaCyNJEfWJKeupb0j3o/ry
 MfSSV6qVgJaibBaQ1CBRWqd2I+ZKPdELFQXtKq96hDD5/1aQ4OmMJ7f3sNFI9YpcBlkZViyMEFw
 VaOdYEdegm2FDNQMxauH/6c4khPQNYbmp7PO84Ry2OV1Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Fri, 14 Nov 2025 09:40:28 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B0F20220D04;
	Fri, 14 Nov 2025 09:40:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: freescale: tqma9352: Add vcc-supply for spi-nor
Date: Fri, 14 Nov 2025 09:39:58 +0100
Message-ID: <20251114083959.1463736-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4d79Z33Zbfz4MQ5P
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 3960ebd3158cf10cca87d14920876d23
X-cloud-security: scantime:2.484
DKIM-Signature: a=rsa-sha256;
 bh=wFG888Gb9Ru3OuBdwJfnSjD0IrRTCToX06LrZpem+M0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763109627; v=1;
 b=C5lFYY5kDS+TvBFPgcD/sMBaYKq7FakSCPjyDZ5EKqTeK8REnxUjv1k8ve8Ts5hnpB+u0Zw6
 MM88xXKYmrK3qcgljfNspAmiO9FCquzJcsDRgKaGW+hf0h2IJ8F+X4YgzU2EeDfxppfwAaWFKoi
 sts6HtaLWVcfDdmdJys+Zpl6ivKIorE+37uSpGZlDJt56SAQnQPwFna42jrU/kuStQVd8gJPdDw
 8eL0BgIDVNuwd9pYN+7mdqvN8sVOew3QAMvXAsylLJlAvhwUAWVNUbqxkG8qYZbugWd4RnxvYuo
 PL41R1kYvRgziyM3k8YZE3Ve0yX+N7+/85Ypn7Lsq8TUw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_004043_556848_A4780EE3 
X-CRM114-Status: GOOD (  10.69  )
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

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 82914ca148d3a..3a23e2eb9febe 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -67,6 +67,7 @@ flash0: flash@0 {
 		spi-max-frequency = <62000000>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&buck5>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.43.0


