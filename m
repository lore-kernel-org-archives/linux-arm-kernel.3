Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9F2CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/s6FlFwAKjgFLjZDZcFhJiBB4O4U8XepmrU/CXy4uk=; b=u4dJRZjX4DMwUUEZ66dJM+gEoM
	zYzGBVBcjjTpWJkqqDPAhOkqumPgbBPHHhLroIXdLgRG53eGjCQvXPW6tiddCNik4ILM9cIbtOjXO
	z0IoXUK/Qe0+v2XiV5XW7eCxg4J1cfHMkmAAtqn+haRcZMVSJqs7+MYCUmnoQkpxJL2aFFJvOsfgU
	xdPXOZ19UQKh5fp0tJY1I2sZKMaOHkYLn/2OLG0MvVK0pBZ0iLKct3ERvycWYki7mbAsi1pC5tdl/
	50iZzdCoLdHWROKq5gxtYiXhrRQCRJB13CanEPY6qP/1Cx3bNUPIozOQxNDIgtJotSvaYIcNPltK6
	ZV0LTKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBncW-000000057sP-1JFt;
	Wed, 30 Sep 2026 06:16:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBncU-000000057s4-2SQ1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4/s6FlFwAKjgFLjZDZcFhJiBB4O4U8XepmrU/CXy4uk=; b=bHN0XGa9Ssvs0xRBOtSob1h/wQ
	fU8c4PIvTT6sbslBak6YyIwP0eoagmOmNGSCDCSuzNaxRgLm5qbusntYv6udXg/XDSzzPDoYrGOtY
	cGKPi3I71Jm0vDPwxJBhH5RMgWE/LZocrJDP7XE5X5Q9hDpBNFip+vLVjo53oGjntO4nuGsSay4+c
	iGpG9xFehT/GHAjEGtsXZG4MlR8hIYloyNxeUGY7+jeqYnaVirg23dBYAZZTS67NsoLRC1paD+XBQ
	amDm5BtRZ0juN7NyqxXppb9lMvnnTyxabGcf+h2wfRRotlojXTYfl+wYFOUbIfodVLRwKbodnDVvj
	bZ/BGo/w==;
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBncR-00000003PF1-1uZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/2IeUma4SsPlbgT2TDXFYKr83IGglrAlm/PcqOcuN8JMRO/sIGBdeoJFZRsjeb9hRty7XO9wEIx0Xlqtf4ybUQSx1N2daz9cplBp3gTvk16YqN+F7SVSWBznRlre2JduBrFgSdpctFJXTZyqPYLtyv9mYxnUFQUuN1pnNDwBzaCo5U3Hzzhvn9ce2BEFmedlROuzo78Ypoqy/HdVZZymook1/S7o5pj0etfeTdmws6dh+jHJkG3VlgYCNdJebME/rlcLjZ4Os4H6zjqeaShutfLNtBSaX0oFX9jsm3mb8A2520mmGR8eDk1ng1NprTeZ45N2Naim+Q+9PUAxC1dbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/s6FlFwAKjgFLjZDZcFhJiBB4O4U8XepmrU/CXy4uk=;
 b=I242mOY8QygEXiB7sRXPziGS66A6AIZRwEVwJtgEYZl0CLI8SJ3mtSG3PqQ6Q2CZAz0fOZVTlKuQmKGDxiw86UDpGlstwDJw1/7DgWV+EgUwnki3ygkCb5Erbc/sB2ygy08f9tIg4xSEVOXt7bsr+sTxEOfUZHLycwsV1bp1dYfyA3HiNd7tJnTTHhp93ZNizLi4SvOD2zJDfJ7RunCYaK9MRfZTV6Egg2K7BFhhikfGtyVbf2jfGbK7p89tuA8pS8Xb7C/Kwkz6l89FO+NGEkcMLq8T75+Iir8AzrU8SI744vr2Kv3g59NaHC/KYsezS5Uxo0K/y1yKvkIX3FlPIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/s6FlFwAKjgFLjZDZcFhJiBB4O4U8XepmrU/CXy4uk=;
 b=ZJWdURVt2lrsoSzIW2aieIh/PhoHIOxFNyxgXGp7TCPnlubVpXDhgAzZeIx22APZtN3aeLgqdKKA+LalOMJjP8ZH0jj2z7V+qJrr5cRx9Y2ceuGh9jY+wmAWRotCZ5DdW542ONhz1U78F2msLP9JmYMe1YyUFkqs+ZBtHw0JOuFuQhI1G1YaHmssz2DTkEPDbvs2m3DWOSLWEw+NsrM9ZyF3YGjOQPsxjePQ2JGVE4gMco7kwDhoKoSAawMLCao4ctIVIPP38aatattL/WvQPfDEgOgM81UK5tJrNeujWOrtqSr78XVQfTI6Pptfp0g1Wn+UiZDtb0uCX5kBZNS+Bw==
Received: from BN0PR02CA0055.namprd02.prod.outlook.com (2603:10b6:408:e5::30)
 by SA5PPFCAFD069B8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 06:13:56 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::b) by BN0PR02CA0055.outlook.office365.com
 (2603:10b6:408:e5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 06:13:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 30 Sep 2026 06:13:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 01:13:55 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 01:13:52 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 30 Sep 2026 14:10:14 +0800
Subject: [PATCH v9 06/15] ARM: dts: aspeed: anacapa: Align PDB fan GPIO
 numbering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-anacapa-devlop-phase-devicetree-v9-6-f08aa0d7182d@gmail.com>
References: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
In-Reply-To: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Rex Fu
	<rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790748641; l=1800;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=BVJMmVa6hiP62Rq3KeFZsYo9O8NS8epFWSmQDw7StNA=;
 b=VXijVoEnoR4Yy4i0XxrxsvNFnhghhnVnx3vks3uPXQhbi/Jpj+jrY0uSBZMKIl9Fq8PF5+oGB
 2L1dL+DvA84DOH9NOgD24une5owPkei3TZQAZuYoF7iuvyX3ae93wGH
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SA5PPFCAFD069B8:EE_
X-MS-Office365-Filtering-Correlation-Id: 0598973c-c5c8-4efa-29f3-08df1eba0265
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|48200799018|7416014|7093399015|35950700016|61400799027|82310400026|56012099006|10067099003|11063799006|4128699003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info: Aaints30NnFPUKgSfGUw6Qhd1n0rzIOG1y/rOaAiB2QvHpNgVIxzMY40DiI7Hdc7CPml1ua9hmzulhFqB5KNAPWxrOdVvQoyRpCHslC4JAVIIVZ3miyYZJNMWrNtpsKEpoZ59l9J6PWmoJwdnuWVZGhg7aqjSlYHLatQ5ero9P+qeScZuwrQwtOZegML91ftQubv9N2mgCq7FvULYexaWkpWuM2YPjqlvin5VcfAqEPJWD+F2XCqL9J9CAQizCs1i/5Cfs1Y+7VkV6YNAkMIe0AlcpSR9RIRxPFK3AL3m/kXzdo5FCUCYmsfzWRKLv9ugYkm1gG3cjWEXFHAip39b53CUIWWgQH5FFFJDg4tDJyTR7do0PAyMhlJD8Z2EStQMZGZHUHtsNZtzDaZdfdVxSCn2+9XxYNPtC6i5zoxvXAUa4d2dIBBgC063gzGEykgEjKDGKJqSLvrmImxl1Xv6gkuTdVyziQCiWylCgRLUMxgk3hOIOTYONaMKuVGbLwkUsvvR4bTfj/VdtLmyYT5rRJyzdJnJTSsefbkBYB250r9QgHjISywPOwQ/iheDFnZ1DOmL/purKn+SlhXRIvF937YXphy4dIrPKRxJNx0R+XOUiB9MZbKEOfOca+wnro5Jq/CPyMEqCJcvdfk1VBwX4BUoxwUjYBVeNHaFUjAFWbVMyGZAHceQdRE/Mz4WrVFP62dBvFU3f+8Qo80Ivinqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(48200799018)(7416014)(7093399015)(35950700016)(61400799027)(82310400026)(56012099006)(10067099003)(11063799006)(4128699003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0M5sv+s9VW1GDBlccm2wVkl+hDJXbyfjl6KPB7NC0dh3bQXPrUwHSf+kCbT3/PSuAHU5HZBnjuTGzCmA6ErgAj5/hzbiqHnZ1ZLxUDkq/9/nBehwR1rqBIaKqx3V3c/nHcf24Vs4fmZNmZ0xGZ2EKYhJfwgTEuXC1UwKXTUJfpqdhnWeOLj/7zX8YYSLzh+AHokI9RvzL/MspPaPLJ663lR/hlOHvSbGwt5zKK4i3lfNp9i2iyMUJcPXUtrV2vDbD9YY7+bsHzd1L21IRyVRGT98HSOQkMb8ban0N+4c49NAY9L1wHm1b1n8UGoNtHrQywsSPI4mADTHECQ6p8pdL0aEsDelghFb5dmmpK3i4EM+EerIpiezaMHTlRtpUCaw6bPhOnHa6QhDsQ9T/iDmqFYcE9TAq2GQqTRU0bDJQKv4GwTfh0hRBaTmSwGPsOdr
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:13:56.2382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0598973c-c5c8-4efa-29f3-08df1eba0265
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCAFD069B8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071643_774138_02D2241D 
X-CRM114-Status: GOOD (  11.01  )
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

From: Rex Fu <rex.fu.amd@gmail.com>

Update the LPDB and RPDB fan GPIO line names to align with the platform
fan numbering scheme.

The LPDB fan GPIOs are named FAN0 through FAN4, while the RPDB fan GPIOs
are named FAN5 through FAN8. This keeps the GPIO line names consistent
with the fan inventory and platform-level fan numbering.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index a2392f684b80..3ea5d67865d4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -2,6 +2,40 @@
 
 #include "aspeed-bmc-facebook-anacapa-evt1.dtsi"
 
+// MB - PDB
+&i2c8 {
+	i2c-mux@72 {
+		i2c@0 {
+			gpio@24 {
+				gpio-line-names =
+					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
+					"RPDB_PWRGD_P50V_HSC4_SYS_R",
+					"RPDB_PWRGD_P50V_STBY_SYS_BUF_R",
+					"RPDB_P50V_FAN5_R2_PG", "RPDB_P50V_FAN6_R2_PG",
+					"RPDB_P50V_FAN7_R2_PG", "RPDB_P50V_FAN8_R2_PG",
+					"", "RPDB_FAN5_PRSNT_N_R",
+					"", "RPDB_FAN6_PRSNT_N_R",
+					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
+					"", "";
+			};
+		};
+
+		i2c@1 {
+			gpio@24 {
+				gpio-line-names =
+					"LPDB_P50V_FAN0_R2_PG","LPDB_P50V_FAN1_R2_PG",
+					"LPDB_P50V_FAN2_R2_PG","LPDB_P50V_FAN3_R2_PG",
+					"LPDB_P50V_FAN4_R2_PG","LPDB_FAN0_PRSNT_N_R",
+					"LPDB_FAN1_PRSNT_N_R","LPDB_FAN2_PRSNT_N_R",
+					"LPDB_FAN3_PRSNT_N_R","LPDB_FAN4_PRSNT_N_R",
+					"","",
+					"","",
+					"","";
+			};
+		};
+	};
+};
+
 // SCM
 &i2c9 {
 	// SCM FRU

-- 
2.34.1


