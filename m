Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820CDC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMwhXv8P9WY+Xb2KVF4+Pr6FW0ZCaljgt7C4V308Elo=; b=MhKI8s+jVYldv7yz0el4Gl6EFY
	zDADtxmTjEEwYqMQ4+Ke4jrRi4GRurrYNPfDmg6dlSeyUKKtzGrrwIsPewqXN4hHWTfO1J6y2lGzy
	EyH2u1A3NkRXXt0hL02ZiBkbe5eutISp8NtiJcp22uc05mjnIorduoi9vZSoaGJp6JACgPxWMAkLt
	/rnCGEULdLo2PYoX0zPpmY3/mO9MwA4yPpHrE/ARjb31OepZjtxm+A4EeYAa4Swn+kKCoZXm/Ix3M
	PJ0mykAZOL1s1gkAGvbcnFUJ4hR15McfTmiLsh2qHiDt3XSe2m94/bJgm/tlpMBsk7R64EFR8qh5P
	4b6dmmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfZz-0000000BZnc-1Hx6;
	Wed, 19 Feb 2025 08:37:15 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfHg-0000000BSvS-3Ad9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953100; x=1771489100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MMwhXv8P9WY+Xb2KVF4+Pr6FW0ZCaljgt7C4V308Elo=;
  b=Q5IKy7pWq3iKDGPzBOtiky9776uM/BDgHi868vvJVak93AnT4ibII7jn
   YUKwFmm1ka8fVZwueIr4ESyI4e8rmNBpXlCrLqwhaXhc9ctEmQXyWepFN
   kbE0B+qD0pMji8pMoeWOiF0RW+KuIltkzPt8cQpnu56a5OJIn6XrHcRB6
   kWBHz/3WuSaJEilcA6Vz3BZYhjLZ4pQmhIE26pqr6kBLKcC8JHWtbz8j8
   i6ndpvKfqHvBLlxup82QhMlDLY59+oy4jx3qOHRs2uZdSo12Y3jZpj1uQ
   B7dMbAWukifsfoSh1OdoSRUfxenpBo2PR8W8vav8WifrRK37PXhFcxnkB
   w==;
X-CSE-ConnectionGUID: npq/NqnPS2iQ3j+nmK7d2g==
X-CSE-MsgGUID: S3fJk555SGm5XApH0ngXFw==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945140"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:19 +0100
X-CheckPoint: {67B593CB-47-C21CC984-D1047F1F}
X-MAIL-CPID: AD5A523AA63272FE70A3A68D3939B9A5_5
X-Control-Analysis: str=0001.0A002107.67B593CC.0029,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0323F16D341;
	Wed, 19 Feb 2025 09:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MMwhXv8P9WY+Xb2KVF4+Pr6FW0ZCaljgt7C4V308Elo=;
	b=EKwPUgyspPK/Y/4yb/imhYeVXzhW0gEKeTc3ak1METQgl9khL8IF/SfRzgtQH7QFDSR/FS
	Cw2efIbXBICQNmh6YTjcpnHEW1N97ri5pfQXmMkHADmHb1neOdpT/81sPQkFmcoz5D70/o
	ATJ3CcotpgwdDeoaNOfsWBonPbq+HO2BKsiQSnXWlhX22hVJghZVQT/a5zG2BjgCumv/fi
	Fb9CyJ9RMhKd/sCqii0dZhQVcbQwhbRZJ/CL2PbIq7gc/ELVeMlZLtQkw11NrFU8orEl/Z
	LY2+gHgwQZIUvc/FfyzRSZuDJSmVmjU3Rgp3pwZ3pjJ3P2+RlDhUBbL1h/OTZQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 4/9] ARM: dts: imx6qdl-tqma6: Add partitions subnode to spi-nor
Date: Wed, 19 Feb 2025 09:17:39 +0100
Message-ID: <20250219081748.1181507-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001821_100368_0EA389B6 
X-CRM114-Status: GOOD (  11.50  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The bootloader may add MTD partitions in this subnode if present.
Add an empty partitions node which the bootloader will fill with
configured MTD partitions. Remove #size-cells from MTD node
because this is deprecated.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
index 6eee1a4b0b19f..07492f63a1f80 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
@@ -17,10 +17,14 @@ m25p80: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <50000000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		vcc-supply = <&sw4_reg>;
 		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
 
-- 
2.43.0


