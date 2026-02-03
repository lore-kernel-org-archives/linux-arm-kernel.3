Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4287EE7C714
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=641mfZC9UhARD4jrIgtik2gClfPhuW2WKmijqdYnG9Y=; b=oihleJW2o7RhB+iw43Prj/YoLF
	pPXzEYJDy+0/oCmj/QscFy7erQudvcRIcI9fRHK5ANw0N30TggNgFA0MS7RGYbug2zHFBgYIDsKBu
	QGA3yUr1Sr6ZzT9W/ZU1qypcKEcg8D4bq7jKmKpA8J6Sr/aQ5dbcUz7G/jDIqE1vhz/UZ022iXTH9
	JwopdiuLpTkXuEfJ0R/62oKbNpLftoJQYaIUJ4R/bYiq3JhrelSfUNOLBaVzVG98nQeiJHhB6twO6
	9KuEhrmnoEZnEKCYLoKJP3mXDFnY+uUt9LxDW8R5KBCK2UsCL+64O/pQaq2+g6Lzwe+iiEIm4sP1x
	lsDVstUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5si-00000005tpb-0hkG;
	Tue, 03 Feb 2026 02:11:08 +0000
Received: from mail-japaneastazon11022131.outbound.protection.outlook.com ([52.101.126.131] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5sf-00000005toP-06oN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 02:11:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0e8JhM8y/tuOAx4H+UridGgsTzOsEgE7R9UGRXLJHRWe/BcmcRJKTVvNaID93IKJ90R38mGVoemZxml5awkK8qjbeFzzYQJl7iSHNwMPNg7YagnEJnJYy/3Njw8HOeAZhDIi1bppMXH0hbW/kUVIA0RUxwn1K9ypwqTI0+BgNgpYqCOGRdmwsPlFeCCBYB8+9yw2vBXhkkIw/h3Dgnp1yrYQP/2fz3WuSZCX3/jm6uhj3CFwrceebjWz/6300YWkGyxrCN81xKgKHHCIg+QhsHBDKJWf6czsK9lxb1YdUDM0JXbjgyZ6fztIWPpX4z2wWwjnE3W4Lu//fM7gnwutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=641mfZC9UhARD4jrIgtik2gClfPhuW2WKmijqdYnG9Y=;
 b=yjcLNm3OYUTL+PuStBdVjlG0p9wk6D0lEV2ynuREqnovsD8rpgTf/XQ3Eqh6vtbe1Wm5qnKwyIkPGv0Sq0WewBNrGj1DeKdZQghyEsy+YYy2lvDQFVsVGhVPUZaYoe/XwfSZpzUKMzJLBGKD9JYFhhHL4LZvXVuTAmOkEcpzaOS2tT4UfI7rdtXuolPOwqXS1Bn7FLY38WZskVPRvdrAcpmAo/aMChViNA29xyFou2BzBSJgHaLmZ7C3nHrGp77C4dmQuV3VBjmO9AGSzzz7SGVfvgRt5OtT8ChCUI47tsKj1NMT3qD3spsk1sUexZcX4hFHKwgGUD2CY6bxBnLvjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0152.KORP216.PROD.OUTLOOK.COM (2603:1096:101:35::11)
 by TYZPR06MB6913.apcprd06.prod.outlook.com (2603:1096:405:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:10:56 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:101:35:cafe::a7) by SL2P216CA0152.outlook.office365.com
 (2603:1096:101:35::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 02:10:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 02:10:54 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 037A8435071B;
	Tue,  3 Feb 2026 10:10:54 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v6 3/3] arm64: dts: cix: add support for cix sky1 resets
Date: Tue,  3 Feb 2026 10:10:53 +0800
Message-ID: <20260203021053.4073258-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203021053.4073258-1-gary.yang@cixtech.com>
References: <20260203021053.4073258-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|TYZPR06MB6913:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eb4e0e69-9ca4-44a7-a4af-08de62c976c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F04qO7rLTplx33rNDDihdJGMAPHUj1sos8EBXO2br3q0o26ZRpJfUihL5Qun?=
 =?us-ascii?Q?71E5VeU1t+h64yiPHJMNmZkQcCCrXBrBZtFqQaC1OvPBz0rxdHm7KsVIT8J1?=
 =?us-ascii?Q?/dYDDH32iW4ljSsWXGpf20xLBI1yuVBxb2geNDH3UpdwAqWSUI5/mHtST/RS?=
 =?us-ascii?Q?tYcfQ0z0tHrk0diNtcii7G18k2jl2s0s70N4Y74TsnCO55VpQChMw1zJhuei?=
 =?us-ascii?Q?5RSm0IlktO/HA2QHXMsDlQ6TjaxBBiHuCLnN6B+dloZsKGrfy5dWjr5PJSqb?=
 =?us-ascii?Q?PAJ3ABAQtwDUZMh6FCtt1BGTG2DjhWTzGZKD9fGuSWb911/aUqtkJmNUW/cT?=
 =?us-ascii?Q?aa+pA15IzREaKqyU9Q5Fd4ZC4lZwA8XLxNmGVUw6KQ/0cSzWiRSdJTShxu0K?=
 =?us-ascii?Q?Qd4lLwOOq9ljV1gTkdfIA/7bdOFqAtSMcUttKr3N8O7EktFmhLADADuhrELW?=
 =?us-ascii?Q?usB2m13SZqCop0Y3Uj0eJ2VrGiiveR7Yc85PTt6s8ojXyu5nrRnmKCB+1qaZ?=
 =?us-ascii?Q?byBTDgNv1gkfJE6sdANG3EGvJd2QrRO6Xs+sg0zX6jJ6YuOr9a349yI1QewO?=
 =?us-ascii?Q?gSZLIL3LBoXhTdZAKADq2i0qoRb6tT42bG08XtxCbzli1Ld4AAX7zBpmimW1?=
 =?us-ascii?Q?8pXCCXKng3jO0kAYmN2dD591KAaICj74b6Rf3vwHF2r5TZyNJTiB4wMFj9iA?=
 =?us-ascii?Q?STEUUjxqii18uggUAPedQRhWOu03JyfzIxxGGncAiwppArvK4fLngp6DM1Ci?=
 =?us-ascii?Q?iNgFeaf6qMDHgCZV04tgS4BS8wB7qh5SjlGtGYEI8y/L/EcKCP4QlHyCWxOl?=
 =?us-ascii?Q?0etX/sGfN5r8VZcs6nXluKNcC7lG0GteJw6VreoCb7179amfVwPDWbSz7hLa?=
 =?us-ascii?Q?oIeZw/SuuJsaTtgCW2zZkalYk3idoU/M8JR5zCrQjk20bfELBHtegX0Vy/gj?=
 =?us-ascii?Q?g84afgpZSjJ+s20snC9Cylp0czussP7GyU9ca0U749PICVFpGyWLlOBSDQRB?=
 =?us-ascii?Q?C2JdmgnYWqUqhNpxmRdXLjr2qVqVbFObHKP64+W0QZBcDeTVbHsIkH27k2Ic?=
 =?us-ascii?Q?CGPo3IYejk8txS3O9L9wXQpMmytjoHgLn8B/0yLrSeCsER7K+seKvLco1FMS?=
 =?us-ascii?Q?uw7g3qtAA628P8frf47LWBLox0foV46DNG198xVFLDekrUY+MFePIu5DM7xR?=
 =?us-ascii?Q?oNeOj26dDGqTWrgNbZ1IS5tylla2OjYUTji6BIvMFjli/T8DzbwQV0aSwvF5?=
 =?us-ascii?Q?OM4ahB4E8clpXtVLesnWE6XqKl8FCxnuAG3IFiUb3r2W2FnvGqHdJDWmJks2?=
 =?us-ascii?Q?hftwxmOj0hctRi2+yJ4gCRbeWARyF4vWwMgPaB6jaHJIrWVLHN5CP3kApmx8?=
 =?us-ascii?Q?U2NzCKcPLa+s+TwlMIayFgx+99CQSCr1re4cNAIb9fXGURwa/JK/MHnHVCHI?=
 =?us-ascii?Q?liYgffUA1dWZB2x0XhTMVA6hxr7VZPshkH3tsMzZYpwjwP/ueGue5KSU7TdL?=
 =?us-ascii?Q?WFk8W6h/Vf0FzGTogGbYm3l31cVGd30k4a7I6LlTy2VDjfiiLyELQmhNoWEq?=
 =?us-ascii?Q?UpaNMyNi8AsSp2FMqk3BW9bht9uMUhHdMJtokNmv2vE3ABRHbwi7Abc035q2?=
 =?us-ascii?Q?siQxfayeRnIJTqqCTC5b4DcQepHaRucrM0mC0+gOq8NUoJK065Q3o/kSH07s?=
 =?us-ascii?Q?VP1pgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +1xZSB2S0/2RKRiiWQIybFw1tWzy9TpKJhV4lF6Z17Ib3OfE2IWeUBgBEFXB5wet2tju4yy8IKW4z2LLodDI2OgCljA6p29rZ0pE1v9JBBXgrbuwU8CYFvUzsZfJ+bVwPPHl4nwYDtoZ7r9ebjbjAOiOJm5cRhUC/C18dd34L/JFSbMtJoXS8+CNK/mrNMZkAxKSPZ7Yn3ktZK9lwuThbNTbc+kIoV5V6c5LSJj7tEHio05MTHNQed5//Yn5vG2ebE8iP9YkBcmpvMGKLdAPW3tbLAR1atw3QesasgV8XVOf98NsUesDfXQnd/PrYvEENn00MJ42RNgvQyT76SJAtBjIiI9+x9q3Nh+ZBvMvHyv8YjBSAwVXQMd3uNVAAQLtgCtd62atEIYZBiUKvDLN6dRTrpt/UEvJ8H3Rg2xSD8J1jZjMmAd8SORiwzJoK6kV
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 02:10:54.8530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4e0e69-9ca4-44a7-a4af-08de62c976c5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_181105_088139_5F606974 
X-CRM114-Status: UNSURE (   9.06  )
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

There are two reset conctrollers on Cix Sky1 Soc. One is located in S0
domain, and the other is located in S0 and S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 64b76905cbff..37dca97b6b67 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,13 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		syscon: syscon@4160000 {
+			compatible = "cix,sky1-system-control", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x4160000 0x0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +575,13 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		s5_syscon: s5-syscon@16000000 {
+			compatible = "cix,sky1-s5-system-control", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x16000000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.49.0


