Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4729CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 04:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/SW60XuvWVs4JyTRLIRiu2EpF7OaSYs1B49vP+EcrQ=; b=Ui+8EpmcQgdsHbtwdaJitB8T9s
	E+lbSrfjvyglD6ZhzRnWHW/0T2tP1ce2ufsQD/Ii1ShRX0fdadtQ9V8e0cAsRMnpEF+F/se+l6Qxa
	9Flj8woFaQ0oJii1I8bmuphi587hXpoM/Ss8heXFJpzfv/ddtNuZC8cEWGqgtncnDiiOVLBgR9Wik
	eAK229OdtTn5UxCaCPcW2ix3keRTtYs1Z+fSTxIrdlhglEOB+T/QHAWHi0u9oVIPG95CSlkbyDEr2
	+Nr+MhWCMRlHJ0AwwKNTRyAslGSxWbDp+UJR4ul6y8pYr1dgmM8OSbP5xzm6CDPwlvRMshiCNKMCM
	YRyvgZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukcc-00000006bn1-3rhY;
	Sat, 06 Sep 2025 04:33:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uukJ7-00000006W4R-0kKw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 04:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43FF04508E;
	Sat,  6 Sep 2025 04:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BB9C4CEF7;
	Sat,  6 Sep 2025 04:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757132024;
	bh=tDfUpZExKmJMXStQh2fTARqlHOrlMBEVmIQj8qTNpp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qxcX3hDdhIcHU3lc6DId6MV315Sk7yYxVfYARSA80aE259q6UGqWfhpcdvQ0sSDMW
	 vw1uu7EhOf86FWBcj70eUuJ9tjOsPY6MCZNGXZRQUxX85V0Q0y4d+/lujPNMTEhnNt
	 0LZLQY8AuPtKB/8N3aoy/aEzMmwa6iQ6EQfJ07B0Uyxx9tzWn6CJZYsrzpkLhglHqK
	 sLJoe7ZZuMUA4hpYoh0MsrEFY8XOkCSc6pMjCrkFNoKnPKoi+tm1U1V3r/+LTuHmEo
	 XGnTuepdldm36U+VNpLSWxlkPOre2hll8LTqd30iQligkWtmm/w16k591RYns7Xenv
	 RuVsh29ymcmcQ==
Received: by wens.tw (Postfix, from userid 1000)
	id D59155FEF5; Sat, 06 Sep 2025 12:13:38 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH net-next v3 06/10] arm64: dts: allwinner: a527: cubie-a5e: Add ethernet PHY reset setting
Date: Sat,  6 Sep 2025 12:13:29 +0800
Message-Id: <20250906041333.642483-7-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250906041333.642483-1-wens@kernel.org>
References: <20250906041333.642483-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_211345_259251_4745F56C 
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

From: Chen-Yu Tsai <wens@csie.org>

The external Ethernet PHY has a reset pin that is connected to the SoC.
It is missing from the original submission.

Add it to complete the description.

Fixes: acca163f3f51 ("arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 70d439bc845c..d4cee2222104 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -94,6 +94,9 @@ &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		reset-gpios = <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <150000>;
 	};
 };
 
-- 
2.39.5


