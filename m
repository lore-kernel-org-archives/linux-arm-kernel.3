Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646D9C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPGrfqg8UaxEktjEHfSecm4NyduW08Yu5c4nY2o6pg8=; b=UsVOqmNuRDQalAfwe+j2fIeXT1
	qNTg8FLqQUMw+OUtm5gqRj7JX7bX9nW6Vb3qemNHm4585ttO1jOCC6i1gGUWaFCz+ctUzGp9cTdBr
	VJeLHh7ZWF+rf82lp/3i1atcMK6CX/AzyezMvdMAicJFX+ChSUlsWtEhd/xtXT9Sz9Zr7IT0MgpD6
	BNO6vJPQec+Mlilu3B2QcOb8ehoFhCq2l0sPgzkoQYsVKYsBaZUkeki/lLUvWutqI/nUxzYGGTxmO
	0kQ8NRCiMGAiOwGXYt48EF3fUSHodbw39RRiTRC/ux1kzOBLYiTTQL94glbQvsW9bzqDiKvAOCTVv
	dm4Px7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqEw-0000000HLPK-3Uri;
	Mon, 21 Jul 2025 13:07:34 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoZm-0000000H4WQ-406v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:21:00 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LB6qGI018077;
	Mon, 21 Jul 2025 13:20:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fPGrfqg8UaxEktjEHfSecm4NyduW08Yu5c4nY2o6pg8=; b=f5nmHjvn4IpzkOBS
	T9BjLS6WLAVsGTndvlbqeiKu7xeh5SADJr8xPJLXgSfi/P2ENunRwsTEZDACrdxD
	ouQqSNZPnjGvjDOFf+u6DBzYv0jNWJof5JbchdAFj4K822olnI8syeC8wnRC2h4Z
	u/C2Cwp0tFPnc6wjYWwhUdvlsLtM9da3Ihrh2NHTA3Wy6LYdZMGM/KJcyD+Os/C5
	V9pWZnJLpC2Mz9D9qnl1/EZzDHpaRZr8OwHjWtP2CsGRgAq1Ek/zw/bJnRV1kaiY
	K+4L7jMeTv2C6BQb2XjpRsq840oxFe0Slp3dCpbHvwOklXQoL/grEClMYXpU+2Er
	afmK9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q20mm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 13:20:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D2AAA40052;
	Mon, 21 Jul 2025 13:19:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 119277A16E0;
	Mon, 21 Jul 2025 13:17:49 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 13:17:48 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 21 Jul 2025 13:14:46 +0200
Subject: [PATCH net-next 4/4] arm: dts: st: activate ETH1 WoL from PHY on
 stm32mp135f-dk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250721-wol-smsc-phy-v1-4-89d262812dba@foss.st.com>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
In-Reply-To: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simon
 Horman <horms@kernel.org>,
        Tristram Ha <Tristram.Ha@microchip.com>,
        Florian
 Fainelli <florian.fainelli@broadcom.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=731;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=5zlOyseGY2a12mIH0pp7n82/QDRPL8mVnq+tTRpVY5E=;
 b=owEB7QES/pANAwAKAar3Rq6G8cMoAcsmYgBofiHZMUPjiV5/QfVT9gWzWZYWZtjpH9vw1Lm1Z
 fKGFiG/opGJAbMEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaH4h2QAKCRCq90auhvHD
 KJxPDACVprDiGGi6h62GgbvAIbaolnGJjbtI3aAQUy0LzF8zbEIgUY/GruoXoMtHLOEpIYWosco
 R3udACN4dTSARxGTXGEB09/s/QQ7gsm4JnJ+pT3zGPghDKb4fZrrDkXfBjYQfUoayN8dn0HylCt
 1RsKyLZ8HNqbeqcvQSyCugjKrXUqnsMqXs/t326ToQAGXcdPKl2uy/NeiCijpFaaA/Hgclwjdsk
 9CXiEHYIrLdTZJd2PaBBlOpd3thUXZZAEwmhboqZhJKzn4j3wSLMcCkSnWZXB6JYQhoo3u1XdYb
 z+THksSe77k6vlhS809zwnHywkwT70Zfk4Wouje8pe8bvTFIlPHOafNqXcPSNdfBxQJTolTWk6i
 1QcO2iPovhd8SYHyH475smn4qm8Z9OWsPY1eKaOHsP1d+zDjIDsVoGrvhsch6XX3kHey72ksXzq
 PzHgTqYnPaXdoScj8smDS94Q8EbUpPAHGbJpsmLRb7iKEbpKk7Odx0ALbdu1S38J8IosI=
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_042059_283119_2667AF6B 
X-CRM114-Status: GOOD (  10.43  )
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

On this board, the ETH1 supports WoL from PHY. Add the "st,phy-wol"
property to support it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 9764a6bfa5b428c8524a5902c10b7807dda46b3d..d746424b039013759bfbcce5193a701ff775e715 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -193,6 +193,7 @@ &ethernet1 {
 	pinctrl-names = "default", "sleep";
 	phy-mode = "rmii";
 	phy-handle = <&phy0_eth1>;
+	st,phy-wol;
 
 	mdio {
 		#address-cells = <1>;

-- 
2.35.3


