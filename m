Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C779C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YG/EpZPq1BorRdg6IjN9D9zhwDybJQRNSAEI6nbxWDg=; b=Kz8fPqox2qCctQ7w2QGHzZkVFE
	xJcIeTi+pwRSSMY9Wz7zSlVjJthy3QMBWdCREm5hn/ECFfzjkV19jEM3SrNaXRi/6lQaJcv1AEzqY
	d8otbgR6poVGqfQ/oESdXE5HDMhCCoNLjMLk1usIetqfzywHOXec8OsSQJpUzYAxE0/qqbZc845Mo
	sbt7VIE7+yYpONYbOKyawDoOLQarXvMY6nlyqlaD/r7icZzU6tmuAhZDKrEn+RFGQjSzxZfpc1Iud
	gojJeRYZB8JHvoavBj4yuDCBIo0JuN5SKpSFVat3DIt61SbI/JkqTqLOd9tCwcavNVJoQiCj6XBxh
	pUQZvY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF54-00000001uPN-2Akk;
	Tue, 04 Aug 2026 13:21:18 +0000
Received: from mail-norwayeastazon11013044.outbound.protection.outlook.com ([40.107.159.44] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrF4z-00000001uLD-3zfl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:21:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PncSUpRCFwjNbD5aNjpgNOypWQkRgWOze+RHdIYzgDOUYVjxzwd4t2eKuo6I1lEa1WUOUd8LD1Y1U4YNj8U4YpdWsJR9dM/sQ7k/xD06Ef8keJNN0FxPEs/utxIW/qTgq+dizVgxO4022FlRnc5ajJFGq1W+5QdqbnzMy0YE2QQKe+6A9NP2A/hNaYH5JYeJQDwHF+Q+lU3UV9rdyDS3dB8jBtj94OMJVMMYQJJTZcPlEPxfpMkvmbs+oPpmKnylxqrkW38EzNsKu7GeffmfTq+yQvntC2H4DO9713ShTL0HpjyJ8EbvHk8wVxHvCA/DoJNdoTJXWZeh6xJUbjREeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG/EpZPq1BorRdg6IjN9D9zhwDybJQRNSAEI6nbxWDg=;
 b=ZBCPR51TzlL3WdZDCtsBU8zIi6n3yCt+yTi8ZXU7hudxJuNS65P1FvJ/+hfXkw0lI01RdI7WWx6ExcSOboRetLc3/C514Zapio3p+SgjBOKxffK4oLcChFAkhmbWjp5HGRF24NAco2MWqVVSpIB65Kxh76ZHi65Rzam+YY70Ln7Tk6VkNuQmehPoQVDLAAa8KuNh5RjRzJmv2UyyFb63PkoptchsOWr2kbxQW4cpFnJ7EPKFuSAsWkhwPU4s6SsGmAuWOiDgxd6EerW42jHkT1+UyoUuXSibqPcEj3r1dp/J5qfqorxSphc2CRO3OUXA+ILtCh8hQQULqbfYkQ4jlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG/EpZPq1BorRdg6IjN9D9zhwDybJQRNSAEI6nbxWDg=;
 b=SipiQ0ZLVNmWVSzRTehR4RnwxQaq0kgpgb7ufypEW3POgXhj1jgetrRF5anm7YigGPRfpfv1kMVjcjnQE9JnmNMpUFBa8N9nrwhdXCOFThnrWHzY5a1cXkfw2g3QL+8QOyVCOHYnQ7rEHY/+8daGsDD6BiGPuinqpR7PZC4DYIpaUAQkjY2lzPa1QvCF0VfRBhfjVFsZGGfkPDApZReJh4xg5dgDjbj1TArj3u3e19PfjalnOurticd/fIPvK3uY0P29g5Hp4wRmUWzjfUXZLlk81Au2FtMENcrBBUdJbhT8Q4OtZ3YLRUY8nyRjE2JahIwIKFfuPbjy/d2b1gWzgg==
Received: from AS4P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::6)
 by PAWPR10MB7792.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:369::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 13:21:05 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::3a) by AS4P192CA0020.outlook.office365.com
 (2603:10a6:20b:5e1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 13:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 13:21:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 4 Aug
 2026 15:26:30 +0200
Received: from localhost (10.48.87.235) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 4 Aug
 2026 15:21:04 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
	<antonio.borneo@foss.st.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] arm64: dts: st: increase deassert of PHY reset in stm32mp257f-ev1
Date: Tue, 4 Aug 2026 15:20:51 +0200
Message-ID: <20260804132052.205273-4-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804132052.205273-1-christophe.roullier@foss.st.com>
References: <20260804132052.205273-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.235]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6C:EE_|PAWPR10MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b09388b-d8ac-4d90-7c68-08def22b3d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: jCMDOQ/wcnOvNgSB8ew4FJaxmgoUH7GNCDWomFq7qj9TUDftZtQaLKlXH9IllCkxz5r2MUV9i/3RsTjIbHLwk75y/TbJQ/4WgCEMSlcR4sCajp+VNA0CKBKqTTonPFZTfRO3TvX/21uF4rnP+6wzfOtOagqgbOgtZzIMU2gcYyPog4QaztwrdPEirTHZOJeGQlLp2lb0cvapjBVgtOuyI+K8VjIqBA2fCikeqzraWivF0rJ+ZLHCoJpkbO2iulZdoKhgMMwuRu7wU34ct4p3hddFmQkm2E+9Ba0swshvYgPVJTR/MchPwxbEFqllwzRKKOI7CTQuR8ji977Q2Mv8SiTKITteH4sNsC6p1ZbHge0pWAzH4qvREYVsrKmBaELA3r/PRBR0KZdGRxC/6eksUEpDF7gwwu7bVtRT3oefpMyaLZFkPiLCfggPMgbawNeabffc4XnHPaZ24XnEGVpVv1nxf0sKtmdaqyewoY6pzC9cdJNEYSWaGUlyY+yTU/kY3xQjJMMQIooTsl/wtbRT13y6ewR3L8mqUW3/6nWF37fzukFAD0uheclg89Jp4Og9kVpwvtPnmnC+wasfzdPVriPluH4TmU+5fuqqfpcZ5aN06i+0q+Ps6qsXeKpRZSPfrKt+RswWpMkPNhDScJm86q5jx910llwRw9nCNgyZZFmhQ+EliEVIUKtmT5ZFqktlTv+MlYhLAaU//RYCLnWa2FapsGZHc4Ns5zBJEraLt++0tmfWpBXOjdJHk29g3wP2
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OcKSYVRrBXXJ217Bi0A4RQ9NDRkuIgNKGDgQmx+zNj+mteXiCckyuU0ORmT1uuF3d+79BiXdXJTY4wnpQnXo37yrzmULOxgpxGmmIkW45vF7d91ZODPSrJelNLwmSpSTSm6mqcrUl4aBQWHmJoHEbHNJAWtvL1Aj0Uf7D3qKkd5AyOBjotbSTxxT2XkgrXwve6hyfcbIGoqJm4xF838mnjkCw2jS8Ow7aDMQ7QYGXK6zTFFh9TEfI2ARVQUZXJnIl4aLST5uU2vdkWcFQ+23/99sXWuEcdO0APpBiJknKZky6fuaAXj5VNAkJQxrmRQG70ZHI69HGheiykMPI/LIp4DVlHUftMyswHAdXsXEm6zyL7o33EEThr8o76flPtLbgVS7xuJmujsoEgcOkhNCozrVR/CB7clzbzBvM0d3Kb0wiahbi/cIGVWtstuuH+B5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:21:05.4592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b09388b-d8ac-4d90-7c68-08def22b3d13
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_062114_014211_A2E32C90 
X-CRM114-Status: GOOD (  11.90  )
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

The RTL8211F has a PHYRSTB pin to reset the chip.
For a complete PHY reset, this pin must be asserted low for
at least 10ms for the internal regulator.
Wait for at least 80ms (for internal circuits setting time) before
accessing the PHY register.
All registers will return to default values after a hardware reset

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 14e033f365e3..a41ab55aa8cb 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -247,7 +247,7 @@ phy0_eth2: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <300>;
+			reset-deassert-us = <80000>;
 			reset-gpios = <&gpiog 6 GPIO_ACTIVE_LOW>;
 		};
 	};
-- 
2.43.0


