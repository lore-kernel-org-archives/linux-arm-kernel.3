Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04433C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j1bG5S+zgex4fYsGxLk00dfHQybwBtauvPs4/e9/mQY=; b=QEyj2Wpl4GNotRRy+C/HIlkXpM
	YRVneKKMTWPTvQvh2i077U8/cW4QQCFt0uza2TTkwY3/gdxNcUn55m8SkV3B0Epc7TfJB/7OApNNi
	pqQJiYgb8MZMAQh3WQAFkFhNG1zdHBQMZ/3aNnmApYG7Fx2fYSrs1TBNCfm4gFce6xgiL5T/MoJdr
	j3KzsKABcK6s2pMCZ6UKlSfTKe3r3gCd39Kq6DOuYepLxgr+W0Ff2QLa2fFU1wmDnzd2lbmvphqLx
	R8M0K5amQda/B3cF3CmQF5gKSzxcXNBN4V6RR4NoD0c4239a+6XmJqnNxdd9VdfhgQSJ6lgIjYfjn
	nfvayqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTxV-00000000aK5-10st;
	Thu, 13 Aug 2026 11:50:53 +0000
Received: from mail-francesouthazon11011037.outbound.protection.outlook.com ([40.107.130.37] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTxR-00000000aJB-09oQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK2q9bTPagZvNul8jvHqe50DkJn9Rf6eN+xNC5l25s8XtMVjsjBKCd09ThHqxHb+Py7a3xA9Kq6wGbDWv3nFlqbQITzIR3RAJwZf89M6FDpr5DHCEjxb0ae7d7ZtAaiLX6/asI4A5Bgz6Uu+XBeDHtA6OI75bGPOphbqKSXv6Vidtndv372TfKRxAzGVPTpXo4Uhv3B0nUgXcuHfE/F94bjuWl45WGHSKxvj1X+hxx2NK+ybkzDA37xDXvK1qjXPa2ocl+Kkpv3/5vSxj9FwhPT+SHKxMNLrVY47mYLkLh2dL2LjIph6xQ4kWxCcucTKVFx2virE1rWXKNMhiChRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1bG5S+zgex4fYsGxLk00dfHQybwBtauvPs4/e9/mQY=;
 b=ljaLw+URoyVi9tJEZOFpNg1E5MaexBqGYDbRozbTjxELOcYzKW2O+45eHe1RgPg4Dfb8kdU9i90XH4Iy6aqIu3dqBlspO5DVZX4wKczsppD1LOznQtvEvZooGe4pmTMCeRZ9NsbTnoATn0/XL4eg3+NodX+qxjkTrDmXP5s3HlygsnSyia2G4Kkw5H48v0Do9bcltB7ieXWHRcKqURnEW/ieUfSnG9Mlb6Y2AD9rnfMZxEj9f3nd/9Crh1ljOoqTFmtbJVW5ro8VOtiz0Fh+Jn2Qh+GpUQLb/DV88ka/gXuUFwySrZVNJbLyY79nqPOvE1DGBWaVyouvicng4njeqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1bG5S+zgex4fYsGxLk00dfHQybwBtauvPs4/e9/mQY=;
 b=XgVgZQ0RphIzItQcFI+sz7KHkgGXGxviqL6wP9tklNYAA0rSGb2/rv9LnXS/E6acbc2r2xn9gtXU5+DkUfDxcZR1j+T7uGqgXc0RDLYmFqFunxUIBzndJA+zxLihMHwsvrVJ0Lr7SAL1Te/IAyC0vDztTqCzpwAMXi141G2DOLqShzzvbM/RvKQHYw5sxOX3Q9xjYMxvaLVH0K0R9cZxcAmeg6hvCXCe3FjdD/H3scAUs0OKEVZZwri51F84PDwtkpGes2H6+gap7ypc5XFOKXmMg7NGX1UvQmRCs8LV9X9ZMt/IxZALC3DutnrxoVkoZUDh10aND6ApkdbFJCdBoA==
Received: from AS8PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:20b:459::24)
 by AM7PR10MB3560.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:138::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 11:50:43 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:459:cafe::ad) by AS8PR07CA0031.outlook.office365.com
 (2603:10a6:20b:459::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3 via Frontend Transport; Thu, 13
 Aug 2026 11:50:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.1 via Frontend Transport; Thu, 13 Aug 2026 11:50:42 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 13 Aug
 2026 13:55:37 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 13 Aug
 2026 13:50:40 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 13 Aug 2026 13:50:39 +0200
Subject: [PATCH] ARM: dts: stm32: Remove User-PA13 button on stm32mp135f-dk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260813-upstream_gpio_keys_removal_from_mp13-dk-v1-1-b333615ac6cf@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAI6vfWoC/yXNUQrCMBBF0a2U+TaQtFWKWxEJMZ3UsaYJM21RS
 vdu1M8Dj/s2EGRCgXO1AeNKQmkqMIcK/N1NAyrqi6HW9Ul3plFLlpnRRTtkSnbEt1jGmFb3tIF
 TtDGXUT8q32LnjGv1MWgotcwY6PV7ulz/luX2QD9/87DvH/HKXgqLAAAA
X-Change-ID: 20260813-upstream_gpio_keys_removal_from_mp13-dk-c4e8a1a405f0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|AM7PR10MB3560:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5bb86c-32db-46ce-5669-08def9311abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: Lxkp3Wu2ebfBdXP+pGjogpuZaprjwVUDtxj0QYHWZbMkVKzmm0CSzIkkkMjhaaeIVsnDz+hfWg6dWk1QVfYlorE3VuKgCnn1UpFJ9wjPirncWo86Wx/8S3PyOb3+ovf06ecI60kSWcc/RNHMQPXZbL3wFzxdXi/3jUCwx0ZWYBdLj0lTapMaR4iNiWA7RThumMZ/gPIsnZHmXKniwbZ1Iud7oENc8Yo5XPIITkZv/UWHjWvJGjWro//neTX50KPzcuRd2YrmEDLSTZ2QW+Kp72lqB4e4qTXmIm1NVgERPwGjYAmIt8gYRGDfg2OZqpylkrymY8u2UbDi20LrWPl4O7IUaRlsEG2quls3EC2LYOpix7pUhQWNPurWozxIKE0Qovs4kBaMRH8IWwn+zhLbx2f2VUBFTzYJ6+wCkeUYembLzelhJXMKx6gEUizav4lXBivvIBAUBcW0sPyNuIML0Iq0jExV95SpSMMpXGQQeS7HL3cVCMdeFOcnof3hRQl+bAszo0wzjOxIVOdnRVGbdIuu8MQxwQKxUfNCOyINXR64S0Ah9ESk1FNYjvU1cz/SY/FEIAX2PBRgqwHE/vtC7Fa8L55EudzsOSAcgo1slWIiJgkajogFHEAqkUot595aHg7ANfX2rrhmqLmf1EldX81jYZ5o+W6d+SVfguB3bhpVpNjki99d44V4CU3JyAkJml0DP8Ka0FDJP4qrc+ds6g==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9klzIjjTUjQrfNut89G6Akeu2VI3gzQbDbFqerTRbBMeBObHkeb+I+24zRIev+pngonKbSlJgbDezasTbUBR8wZ1nWvGdhNz1cHQ8aFi35EctgQk7jpsMbnrWnG6rI5IV5e5+uS3kPsPP834B2VQ71uwh8fVIKsNyBedO5gCSb8mXwgJegJzfU8SXWplxb5Wjhda1S4K8XXkFKKUwqRxp4MwGHUC9SSoek9+yyn8JKHOaUJ4U7GYHRn2ON85r0UEE/s9TEBl1u3srX8HlN5J51lstAEW9xwd8EcW/VxArW1agZL646oYsnISJcRwkWjMoNPbIsiPsrZnVcdpw4fzIVMKirBNIBuqUQ5d1dQpyt/QnAuASLEcb1z/5wySMd2jASr7hLZsWk5RQXUXPGJ3o88vGi13Zy10m3vSElbhDjbJ+q2E8SarlHC4GNmL9Y+g
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 11:50:42.9421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5bb86c-32db-46ce-5669-08def9311abb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_045049_582430_5B849862 
X-CRM114-Status: UNSURE (   8.86  )
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

User-PA13 button and led-red are connected to the same GPIOA13, this
leads to a conflict when gpio-keys driver try to get gpio.

As led-red is mandatory in U-Boot to indicate the status during the
boot phase, remove User-PA13 button from stm32mp135f-dk.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..215bce4738f0 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -60,17 +60,6 @@ optee@dd000000 {
 		};
 	};
 
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		button-user {
-			/* GPIO on PA13 "User button 2 (B2)" */
-			label = "User-PA13";
-			linux,code = <BTN_1>;
-			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-		};
-	};
-
 	leds {
 		compatible = "gpio-leds";
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260813-upstream_gpio_keys_removal_from_mp13-dk-c4e8a1a405f0

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>


