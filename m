Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C05CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 03:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8HYVN07gDSXaOu8STfHqlIIT7RwSFQ27jn5Ap9U6NE=; b=yxH7HpV5Li/EJ1zFcwgDZSiXKI
	FxngUJbkyqAKRtoD4jyOh955enkci5TWZ8lzDSu5N4qkUO0bL+5vGR1asyOwXtSFGyQ5/xBXIU42T
	JUZa7UEPFUWCjR8Fh4Vk0s0Y4gK2zHKCvp+h7Y6tDewoEH1wMaFy6M+ygaPEOw5FjQzHR77uGZb0A
	DpJ7rcTdnokz55ClpZZT5qqWOlaHLLX2xyabpZIff0ykuEfGxIYfc479NklCVtnUZycT+CL/1OWBt
	L0mAONAkdjW30pLzVa9E9UhLlYg3i+FJFWrgf75IcINbrLB/JsHJmHtrPRJrxdWs57a5+577HemCI
	TFoJPLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XhQ-00000008kCZ-3UfB;
	Mon, 22 Sep 2025 03:58:48 +0000
Received: from p-west1-cluster5-host3-snip4-10.eps.apple.com ([57.103.66.161] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XhN-00000008k9c-1b7w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 03:58:47 +0000
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-3 (Postfix) with UTF8SMTPS id CC0A8180017E;
	Mon, 22 Sep 2025 03:58:40 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=O8HYVN07gDSXaOu8STfHqlIIT7RwSFQ27jn5Ap9U6NE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=zfXqqSvSo2hiSBzhqwoMa0kVDBiWu+8TEBjzfboVPMcS+Z3nEXqmOicqsru+wLCgfwoUciJRyXWUtg23d5Y4tC1NMBjUOmZfM/yLUCDQej4QFMPXsF5avfDWn1MI7JRFabhfEi6E+TL1BjvBqJSxVZtEeVDP//LmluJJetPInfoPPSoFVMB2+ZHcDWOayxajddfOowhZACoVxeBx3mPGnc9+0yqx1fn7eNKpo1E/uyHyaf2p1NljovRkcC76v3rI2gerPx5QI8QM2EMrXZt4l+muFjTcte1dNmDB5va0GXqs1GJTBljdgyVVRc/nF7+YoHyXa4OH3fcW0rcOd7Mk3Q==
mail-alias-created-date: 1643268037438
Received: from localhost (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-3 (Postfix) with UTF8SMTPSA id A97921800996;
	Mon, 22 Sep 2025 03:58:39 +0000 (UTC)
From: Bryan Hinton <bryan@bryanhinton.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	daniel@makrotopia.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bryan@bryanhinton.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 2/2] arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200
Date: Sun, 21 Sep 2025 22:58:10 -0500
Message-ID: <20250922035828.2941327-3-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922035828.2941327-1-bryan@bryanhinton.com>
References: <20250922035828.2941327-1-bryan@bryanhinton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sGNH0LLxomuWs5zuOuM8AUACzi5xqiJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDAzNiBTYWx0ZWRfX9QFjB1qO+EX+
 qiVq3UoucsRK9+nJ8ZjW1rh+OYb/ucu/xu3LFsNH0uE5TvUdtWxI8xK/Sz3AZyi+t4IbgG576so
 tKrXM8RVAe5fY8Y7A4n/HphrWKxGmW94Pmsw6KP4mPZjOMKvWUyzt4Pzk8NKa9diIMyrt/t56mZ
 3CnPbVsLcVyZYbT7KTaQTtOTuKtzeGD71BHatZFEKqiUyO+vsbOtKDPv4x9P1XDT4tUPeKFzs4Q
 IqysVsli96UrigaJ3y7xt0rK0vS/WmUBddu16TGdS2+/EtkeSPngrLaSvVraP8yMgpxX8aSUc=
X-Proofpoint-GUID: sGNH0LLxomuWs5zuOuM8AUACzi5xqiJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1030 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509220036
X-JNJ: AAAAAAABK2AL0pTFOiWYOHuLVg1Con28PkBY+KehYDhRl6RrHefaG6yK+xCLhqqn6rHCLGKaEXKI7Ta1pxkLtyg19UlsbWmk+oXHOl3grC7SKjrMD9pNjQcX/M+ga7RAtXHCTFmliFSFBi00JsmmRwP5zSaytW1mAOhCrS0B4eU2E27jeUTgkbIdFvvKKNWJoJ/aV8zGNf0G0LnAnWwF2SOQOM81nkPD62B0S05H/m42mzkmxmQss9hJ+tbmCE/pppGMr4CnfEsLyaHImDVeEgP9iZWi04ME39cyWfOgqX5Z3lUFxo/pffkCCnupDzdrNDLh5zviVugBMAHqzr1s4g2d3JxuSPsOp3kYxzksB0t43GhHVzKRGx9dlzmXbS461HuOEr2OGotNxxwGCLZGzjLCQfasvY2SodH24AwzDMcBmro6PpAYqQoqNPwkkp159MKHg/Ac498O+t4RWMoySAyUwmG/4ZGt9w62jXs+qj9TbtjXeY0N+HObGpPo/cusjLq1wSezvfRUMlOYZwhaURl1z8BwHXrhar/gAFLZ8Jy1uNCN7kzlo9KMY4JgKmO1UYCHfArcmBFtPaoklGxRP+/OtFNMWCrMGvaaEdpUr3A6ysJ2kEJwACNC2zaE1dTsvtoaGO63Rp9vJ+p/apg4GFssJ46zuy9CvorElgdUjpif2lb7QC2WRd7+ajLbgnvUpC99y3oNEWQCMaqS5iq83+GPwKk8uv1S9vIWCqVzAXpvjghvINVdVvGyGTbtPorlgHTAF0CIrnDTwdkeu7bns3Q/s1c40sjmrek=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_205845_436869_121E8B69 
X-CRM114-Status: GOOD (  10.29  )
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

Use the new uart0 label for the console and make the speed explicit by
setting stdout-path = "serial0:115200n8" under /chosen. This keeps the
DTS OS-agnostic: no bootargs or distribution-specific properties are
added.

Drop the 'current-speed' property from uart0 as it is not allowed by the
mediatek UART binding. The baud is already provided via stdout-path.

Verification: Boot-tested with mainline Image+DTB via U-Boot on OpenWrt
One (MT7981B). Serial console active at 115200, DTB decompile
confirms serial0 alias and stdout-path set correctly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202509211032.0rJjPoYE-lkp@intel.com/
Signed-off-by: Bryan Hinton <bryan@bryanhinton.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 4f6cbb491287..968b91f55bb2 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -8,8 +8,20 @@ / {
 	compatible = "openwrt,one", "mediatek,mt7981b";
 	model = "OpenWrt One";
 
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
 		device_type = "memory";
 	};
 };
+
+&uart0 {
+	status = "okay";
+};
-- 
2.51.0


