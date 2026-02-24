Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBC4F3C9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eN2M3CDKRVjoYG3dYqFOPsyN210l5k/gYt2RoQNitk=; b=mJkKnQCRWc/YQusnXA3PzcqhLN
	+Rps1ZFB1E6tiOBy/+34ZhqNbAr/CVYGSHTzUd01xbEtp4BsJhUmWn9Jc6Y5EA0hH4vgPHmvy9JKa
	mnyZ6B22WQB2GWvPkojUV4epgNMiKTeA9bNFbtFGErs9kSQnfLHJuQK5xgsUjLnmV67Qp46pvEZU2
	jVrcX7YG9b4t5xVngduNBSdQUZEkoDYFwcywHpxiC2P8wJX88mNvfrw25joSYiifCwsGoUcJ07YE1
	XBEdMMKf0Sui7rn1bN004cNG7JEVjAXerf/M9Lz9s1Pfq9Zck0srzSVbGjpA3iVZm1d8b3Kczm58l
	mLK09QtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuufW-00000002LGs-3T0w;
	Tue, 24 Feb 2026 15:49:50 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuufR-00000002LBm-33U3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAjbM+Gw8T90I18w7IguiofZhqP/E/q0cXnwFOr3T5XkSvowlpckrYowirzNaxhHUKD632njZYUL634zDfR5TwKm1eJ7tezvOfUDPozucdQEzZ5AwZAtfery33X1aeZYbMv+3o+osNnOvE6t9MhFoSw2AofKdw61A01eoGUxBAyaJtbiCaWdj7xTXCzWQZFuh7t7y1h1RAx9oessZxMJ3nBx7NfGlk9fzL4Aw/jeObWUm1SVIHI7p5vk1Bbf5eIDUhAUTBb/wF/RiGMie1EuliRUVxnJGSmhIQtcCnQRBATJjOJaSt3okt5xrhtIr4moer/LTPMchCHP6WVUDlZTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eN2M3CDKRVjoYG3dYqFOPsyN210l5k/gYt2RoQNitk=;
 b=OvqufwX8+KdwIvshLhLxIjpyS1gPLz8XCltmR6xkpPwGi21hO9/pQwjc5hmQpJyDUFy4tGJcZQeJ+fbpu3EOZzaOKuq2x1oH8wGenNP4wjey5C/DEYQ43xCOKfa7q7zh9rvhvVH7K67v8AYvCAiYlX9pNnBTzKUNBpUxuKPirqrX4WqG0qHLPjk67vRqewMFc5tEoL4zMsQH01ls7SCxtf8TBsX4yQ6q7812+6hbraMNXEgExyX4iWBKYBGa/GLQkdqlyVwW5dWQDzM2SMMvZ/o17sJ7AmjDJ1gNDR59VAFeM13B/+Uu9Etl3Cr3rkVP3S2Z0SqzPfDuhM15/SkrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eN2M3CDKRVjoYG3dYqFOPsyN210l5k/gYt2RoQNitk=;
 b=hdT02DJA7taouHZ0qTYG3p+rEcODwUSS2FKNy0UXyK2uq13lckb+xqbTAI4KFDrKcsQn1XpDrSp/qOOYjJlz03KbSXtJL517O6ayWJNj8aQ/NhMsHR72jQIZhME7oK45+2rpJJUV7++UZHVJGPkPFHoAoBHHNXZX+YVjMX/WGUkqdzEZ3ql4pc1iajIohZNiGopmAIamfULnqvVcxS6iAbNy0qtDW16rq5V3v5JeqcNoLY1jYKuz5D/E1w1bQ3i873uwTDCgQyc7uDgID1D6qZXIPt08SlRJmYdvJzV0pwHHlcG8f3Sfun/c4aDOUzclVrAXWQtuaQInMAm6+vjmkA==
Received: from DU7P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::28)
 by DU2PR10MB7768.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:49f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:49:36 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::3b) by DU7P194CA0024.outlook.office365.com
 (2603:10a6:10:553::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:42 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:35 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:11 +0100
Subject: [PATCH 8/9] arm64: dts: st: describe i2c2 / i2c8 on stm32mp257f-dk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260224-stm32-i2c-dt-updates-v1-8-347cf6fca7d1@foss.st.com>
References: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
In-Reply-To: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|DU2PR10MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ebba49-d04a-4b09-2ef1-08de73bc4faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVlrcUV3MUhhemgvTEVjcC9abmVrUzhWaTVQaHpuaTVsZXV5SFRVRktTbW1U?=
 =?utf-8?B?M1pkWXB0Sm5Kd2dMdHNoaHBSVmRJMnR3K3VFRGhUUzJtVVZHWDk4Z3NyQUVQ?=
 =?utf-8?B?R295ZXRoL1p1d2tLemtPQlpRNThqRkFRcEVZNDNtTitsdEJtamNlcWpCeHJM?=
 =?utf-8?B?Ty9CN3dGQ2Jydnp4VzJVWFYvY1luTWpZdW1yVmQ0WmJ5RzZLQjVkOU11ODcv?=
 =?utf-8?B?a1lNbTdyNWdiZDVzSFhVTGZLT1RYeFF6Nlkvd2R4S20zYWdjTFBxb2dpS0sv?=
 =?utf-8?B?anlIUm5ZeUdtc2JqK25YVi8wakRzcTFqSTA3N2h3dk03b24wV2l5R2loUHdO?=
 =?utf-8?B?dFNXcE4rVXI3ZjA3WGxsSnJOQ0Uyc01yMnJPTnArdEJTUndBY2ZNTW5mWTZH?=
 =?utf-8?B?QVJRZit2L2ZzM2ZwVllBTVF1ZWJhbXVISnRoTUUzMi90MGQ0enRNYlN2TUVw?=
 =?utf-8?B?QmVIQnI2bGdMSTRzSDR2MWU5MFd5Q2VMNEdYSHBYVDlqbGsva1BuVThsQmVD?=
 =?utf-8?B?T2UyOEtBeGVXU0gyZk9YM1ljOGVBQm9HVi9URTBURjd6Z0JDcVJ1bXYydGYz?=
 =?utf-8?B?WG1XRHZsWlI4U2xEaG81bkMxT3ZHOEQ0MnZpdGNzbisyNXVFclF2RVRCcFdz?=
 =?utf-8?B?MFgyTVNMQnZ5OHh2NklCWlIvY3R0ZXQyYVVHRis1enRTTW1MdW8zUFovZkNB?=
 =?utf-8?B?UVZ2S1hKV2ltN2ttNnRVR1pWdWZYeXlqOFArNWJ1SWFacXFxYVNGbm5CMXo0?=
 =?utf-8?B?V2JNMTJyd1M1c0R3dHVUcTdkekZkVnNRWHpiMitHenp2RHNEUU1vK2ZqbUQr?=
 =?utf-8?B?WDh1RHJoK05NM0dHQTlpc0FIUnMxZ2FESEtneU8zRTVSUXpnNWFwK1BjMTlB?=
 =?utf-8?B?dmJKZVVnTFh0Z0c2RTN1OHpCRnU4ZWtkZU5OTWZicFFvSHRQd2FpM21uSHVp?=
 =?utf-8?B?NjhIL05Uc3BocGE2ZWpEbVRDQ2I0TnY0dFhrYjY1ekNXdUhydng2ZXR3eFZS?=
 =?utf-8?B?MDBDNDRpUzF1MmZtR2dFM2RxQWpNMFgrc3R2V3lqMkNiSTVpVFl2YjJ6VWpJ?=
 =?utf-8?B?MEhMYllIZ1BmNjhBL093OFV3WlA4ZjlDOTJvQXRxeG9mMnNnVTVNZlJGY0NK?=
 =?utf-8?B?ZkVkSUdybysvSnpORlU1eCt2WmJXMFMzNWgrK2Y0aVhIeGNRKzJ0NUlReW11?=
 =?utf-8?B?cHlTdC9tT0hXRDZ2VjgzK1E3ZytoTjMrS3pXbWo4VldlOWhTMEprMUV1VVlq?=
 =?utf-8?B?L09tK2o4cW44aDdWYjl5VC9XMGJ6VmdOZitvR1RaSTBsbDlIVUFzRnlhU0Q0?=
 =?utf-8?B?Zk10bUx4a1had3JYV096T0ppTzVlaUtBZmkxWUxXbUVXUmdqV2c5YkJTcDRJ?=
 =?utf-8?B?K0RTekZYbXI1MGhUeXF0SGJXZnhmd2JZU0YzNlFrWW9ZRU9jSTYvalN2NU1X?=
 =?utf-8?B?anUxbVRZU0N6MXhHWXY5NkdGU0xxRkRSSFMvb2lIODcxNGtKWldJZUxpMlJR?=
 =?utf-8?B?VnhCbTVabUw5UnFxY2t3WVUrV2hwWjdzd1NJTWU5MEZLUjRBSE5jS3RiQVE3?=
 =?utf-8?B?THhlakRMQTdsdFV6a2x5cG5wNDhNL2lSa2JqZGJtTjRxQk4yTjhDTFc5ajNU?=
 =?utf-8?B?UDU4R0paS1ZtNVJ5cXFUNk93cnNUejI1SjVCQ3JydXVCWWVzR3Z6SkJhak9v?=
 =?utf-8?B?UGQwczcwWVhZQmNNL2NaMkZnNXY0TWdRc09aSnJUTEVEMFR4cUYzanhNY2xX?=
 =?utf-8?B?RlpsOVE2OFRwUjlPdGg4S1prZ0dPdFROMUR1THFMNkl3SVhYTnIyZFdyTnd1?=
 =?utf-8?B?VVNZTjFRSGJhOWxvaDZzRnV2RCtqd0o3dUtTdDNSK3AyREdIK1hCbGV2dDBT?=
 =?utf-8?B?K3BsVFBxK1NLSFNqRkxwOUllalRGRTVoWUhQeU1jaTV2Z1ZtNkRXaHVyVmt1?=
 =?utf-8?B?d0ZpNld3VGc1QWFUWTUrOEFlSzBGOG9iN1l6WlBneXlqM1czM2pCT1lGTkxp?=
 =?utf-8?B?ZXhsNkRrSjBLOG43clRtZWhNNzVrQUxzQkZsRk16NEUweGQ1dkR1SEk4OFR3?=
 =?utf-8?B?d1loZXhub2xQYTg3a0RFYTVXRUh5cU1obCtiTk9JekVQbzh5Nm9IVDNqbDA5?=
 =?utf-8?B?UWhIazZMK3FuVitzc0lGV1JSRncvaHA3a25PWk9TUHRRQ1dsUzF3anR4bS9w?=
 =?utf-8?B?Y2V1ZWVFV2ZOV21IYyswN1J0eDlqZEpVdnAyaHQ5bm84ZkFOSEY3ZVBvU1Vx?=
 =?utf-8?B?MFVndk5VNmdONVNGbnhJSEJyY2Z3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vuHM1PlEL6EPOE/4fNHL90CW+ZyDr7ls94XeRO1/jU0ekEj9Wv759bjkxrRq5xoBMvHvc4+7feNCPi88uwsRtrBbyCBH8NVTGOvCxkYGfcIAzoNDZhVKqFBYRuu/FrJ+Pbpcr/iDNmqsirf3U5FmeII6e1d9swe93uhZ4O4fUFLYwGDL27BRtBpJeo24s6ftDwL/pI9fVIv/WxXPUkKiLqPy9q46Tni5OWKRbe0bM3f37hNZPwGFXyMjPKjPM9CwlXBHVyOW1u7hCrtgzy3MI+FwzASCECP/+W+GvGp5sZq0o4u14aEcO51yAbv5Dju8SKDjzLoMw4EvsCPOi6oQR3KY7BEvxR91Ab5QxGFDjTESh4NGZ+Vh77NwXiMDs/x4B+81kusr/Ndkp8+AgYGMCzHBqFFtQLEhxaHB9KNI19/bcz7aH6yaR6hf9pl04+My
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:35.9580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ebba49-d04a-4b09-2ef1-08de73bc4faa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7768
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_074945_775337_F8136576 
X-CRM114-Status: UNSURE (   8.62  )
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

Add nodes for i2c2 and i2c8 available on stm32mp257f-dk board.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 4135e7c0d9a3..220d977e9aa9 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -124,6 +124,32 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_b>;
+	pinctrl-1 = <&i2c2_sleep_pins_b>;
+	i2c-scl-rising-time-ns = <108>;
+	i2c-scl-falling-time-ns = <12>;
+	clock-frequency = <400000>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&i2c8 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c8_pins_a>;
+	pinctrl-1 = <&i2c8_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <100000>;
+	status = "disabled";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.34.1


