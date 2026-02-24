Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985E5F3C9A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BH8xx3eFAlZX20YywnahwczwWy0A0Fa0+kHbPd/O2WQ=; b=ruDnN15hv4gAxO/Nst/0WeaweV
	oa9BcIvb6O6RnPlKy1JEWdL6fnoyQHfktV1/9s5Qymo6KxSNDYF1oF75GGRyg7L2WMkiODD3UB6cM
	lnKI95P61+a520yO02nwYqaDLqwbEw7Qi/bxrrCtVXtTqcLlObR69vDJ+ffF8pAqshELK36Et/dLA
	91hWUqYMSfQdsi0tJzbRBE0DHcSEDbd9Q/MFXMegENwLMDLhYQiADwKgttqkzE7x/IyLWvDGUCMHj
	EtRb703GSvNPAn5K98uYsI110pzv5w8yyCq2vlWmDVIA7QWnYE5MyHsrOS6kNR9O85qAR9XPaXVxJ
	cMATWqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuufV-00000002LEV-1wi0;
	Tue, 24 Feb 2026 15:49:49 +0000
Received: from mail-swedencentralazon11013033.outbound.protection.outlook.com ([52.101.83.33] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuufM-00000002L7N-3grP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9Bu6nj79mQyG8NiSLg+Vqlt5EMz2zp1+OQsRdT7JCRJcUiOslkaW5iE81nen0hEw/2Vv+fO7YDOFKHMLDS6UlyoiVbFyRdMZuNlMyVCjepbg7wWx1TvuqF2O8nek67NVabK7TUoitfaQjmN07F+dbI4A/niezke36IMkQY7QI4sLrs+4J9oeXl1X/RxSxHIjqX0ueQtYGWGPLnYJMBAPFtopFgBYaeAvKE3sCsAYGIX2d4YwYL3rfoUd0fJVweQY3+C0qEL3GsElS6iFU3iiahGWQf7rMNvfxFKtY9uCmpw3AVlA6WCReV76SnssPE4Am4OS3BEuITsun5OOgCOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH8xx3eFAlZX20YywnahwczwWy0A0Fa0+kHbPd/O2WQ=;
 b=N0cNUnVlLtem11oNOYs5mCZeYUtOh3wTR8Gt3ibDSXemxVxWcfDW6q/Dk5oAWHQ7CVhuQCPldu8aZZcTb8Tu+1/hSX3cRxkl0/rKwHsB+SlwznEVXYKcOlicxvWS/4CkMMoLoHMUf+6FO6mwBO7VdUUONWEQBdepQCvJfsFXspyS+9Cmef+2lpg0U2Wrk0qCxgcuR4ngmXjPCKZuw3t36lP86bfTdnwjUO5WKbnf/ptjlCNtPmbkSMhHw+1YKDB0tDIQ6nyVB8MY0cEOKj7YOpA3PPePCqtmqMGSzvHGvCCgnFj5/QSCBADmuAd+GBvfwI2FP/x9oXZBXX4hG18E0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH8xx3eFAlZX20YywnahwczwWy0A0Fa0+kHbPd/O2WQ=;
 b=B/f9ek5qrQWaEKPLuqQ/92f5sbDoipKCC8uHVqr2N8GaCBifsECXQbu0SFwBPffSokyUSh/Jp0gDtndemWA2WLelYwzXHvmjIuzm96Olqy1b0dSKaPhi4zap4TU8YcVN//dOSjQ87dMpM0URY4wYDMl3pDEiYtWEiP4BTD3wIdQduN9KkniZYgrPcSIrmDS/IpBBJOsBSYkT0MCfbieTO+YMjQkam/RX9yiDPy5KewQ2zeCFRADtb2PMu+o8F6xrLL2SQyP6mUVO1PCyJ1V+ASDpFnVh3w4jvmOak+KUIng0ZEST4DjfTs3l5ULjEOp2Rjieu2JRQ01ZUyBVag9mNA==
Received: from DUZPR01CA0146.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::9) by MI3PR10MB9900.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:290:73::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:49:32 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::9) by DUZPR01CA0146.outlook.office365.com
 (2603:10a6:10:4bd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:49:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:39 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:32 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:06 +0100
Subject: [PATCH 3/9] ARM: dts: stm32: remove i2c dma properties in
 stm32mp157c-ev1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260224-stm32-i2c-dt-updates-v1-3-347cf6fca7d1@foss.st.com>
References: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
In-Reply-To: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>, Olivier Moysan
	<olivier.moysan@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|MI3PR10MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cba808f-03ea-4bbf-8c00-08de73bc4db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THk2SHJEZzhMWmJ5Y3NLY01TMUoxamY5NTRFYkxONEcyd3dnTktZMWY0NUhQ?=
 =?utf-8?B?cktBclBKd3VEaXFtNWVGNWdqajl3dGZXOWNYZGlLRjFXQ2tyK1dia3RoNEdh?=
 =?utf-8?B?cjk2QzYyZytNeHltcWpWajlObmdnMnRjeUdSVSt3SUl3M3V2RzlPZVVEcDg4?=
 =?utf-8?B?RW9ReU9WZ0Z3MGJFaVdWZ1AzVE14N0VQL0Mxd1pBUmxHME1LZjdlbWRvanRF?=
 =?utf-8?B?N21Qcms1b3BmdjBOU1lIZVowa01lR2pEZlpQbHppZHZvQnNNL3ZzcjFWVDZt?=
 =?utf-8?B?Y1d2TXNNeUtJdDNrbWJvWTI2VGhtWFVnUjZ5RTJ6TkNEVlVLbEdXeHA5bjBs?=
 =?utf-8?B?dGhKb3ZEK2l0eUczbExkbFV3MTh5V3RudmZOWURrY3c5OUhNV0RIYlFQUVdr?=
 =?utf-8?B?YXNtWEtDbXJNdG5BR1dscjFBTVg3aXJHblU5eEtrMGRuTi9nVnlaWWtrZFRp?=
 =?utf-8?B?SGFZbkVvc0YyT0pXeUkrdlNiWCtLZW5qR0kycVpCditBSU9pOFg1eTU4Q1NS?=
 =?utf-8?B?NHRMa1R2OUtScDVPd1Z2UDVKTzZyd0c4S3VnWE1pYnRDSnJ0UklxV1lNdjlQ?=
 =?utf-8?B?MzNlNVVxVlE5U2lCbDRGUEN6c0JhSzFtQUhOSG1KdzBUclZMMGRHdmdXQno4?=
 =?utf-8?B?Qmh6S3RLOEJUTVZUS1JncHA5dHZmOVQzd05WZUZaQjYyTGhFd1d6ZVBmTzdu?=
 =?utf-8?B?MVNtTjFIcWt0NHRKSXJEOCtRMndGRXo0eG1sM2JVaDc5RHV4dDVPbGgvUGJw?=
 =?utf-8?B?cExpMSs5NlFFeWx5T2NrQU9ZU0xmZXR0eDg3d29pTWkzVXozWmpOdzN3SUZr?=
 =?utf-8?B?Tzhjd01jYStwbmltVUhpRUFvK1NIYWx0VVRxOFRaVUdIRUYxM1dnZ2J3OVRL?=
 =?utf-8?B?RVhUQ0lDSUhiYlJZQXova0gvOUcxRWNRYnJoK0ErazQ0bDJ1d3pmTCt0RC93?=
 =?utf-8?B?bi9XeWpZSit5UFVuellVVnVaSzVvdWdraHZHRkVvUEtyWk1BMkpUUDNsMlcx?=
 =?utf-8?B?eVZnRlVqYTcreVZiZWVZYythaUV6TExlaVRKRXZsTzFMMEhRN1RENE1pVHNF?=
 =?utf-8?B?RVFlQmhkNUdUL2lBTzJMaE10WW1XUzcyb0F0dWh1S042TFpocnZ6ZzJOOERB?=
 =?utf-8?B?ODJGZWdSYUlzeHdTM0ZocVNlOFlnVTF5TjBUalNKYTYrZlVvL2krUlVDd0M2?=
 =?utf-8?B?amFLbXNvTWtraDdSUnp3aGNtemsxTTQ4UGZLZ3VQTkhXR09pUmtOQ1p3MnV4?=
 =?utf-8?B?d0M3RHZieEh3UGRmLzJ5TTBXKzAxaVZobmNQM2JCeEpEbFhTZDdMOUpQV3M4?=
 =?utf-8?B?U0czblFKVzMzbTVPQ3N2K1lFdGlEU2NvOHBlV0wyUzJudUFYbXJlTE1FQmxz?=
 =?utf-8?B?eG5lZjA5K3ZWVnVhUWF2aXJoZXlUN20yNXp2eHpwOXR1bmwvazZkczI5ZjBY?=
 =?utf-8?B?MzJUcmZrWEIzMU5jMFVBRjlYZ3h0SG44WlVjTnh5M1dUK3N4enk5RmRGUkdk?=
 =?utf-8?B?SjVJTklTZElCR3VvVENiRE9jbEIxS2lNVnBaOVEwK1o2azVDL09xNlVXY3VH?=
 =?utf-8?B?WmxhUzhSemQ3RWo5TThiVlhrRGx1T1d2RzdCVTF0SE93QkY0dlMvRmtwdE1u?=
 =?utf-8?B?eGRqbkhtaHRaMm5OUnpkamZQV2ZKQUM4MEpKNGhXQkpOdFVNcitHNE5LdEkw?=
 =?utf-8?B?TkdhaGF1emIvWVdlczJIaklvZ3lqN3F3Q2xaOGp1OEJ5L21CVnVhZ1NyTmxD?=
 =?utf-8?B?b2NkZ2N0dFcyOEZmR0pNU1h4ZXIwUFRrdUw2MFhvUGdjelNGekdlMU9xOW52?=
 =?utf-8?B?Vm9MbHZVQ0dWNzhqWWg4OVZmaXdLZ29ia1hJbmRFVytsZDVxcVN3a3VhMWJU?=
 =?utf-8?B?WjMyQWl0Q1loQTJDa1V0SWIzc2FTNlNuS2U5RTcvNE5hbWluVTE4NGVDdC9S?=
 =?utf-8?B?ek1vMWwzQVh3alB5NHVmcmJJd1doOVdhVitsOEdJU3kxaW83OWpEbGUrcXJm?=
 =?utf-8?B?RWFNUFlZb0k4M2FMN1B3WVplT08vcTlvSi9lK0llNlJ0YnJMdmJzU1c2K0c1?=
 =?utf-8?B?RUNnTERibFRpMmtTZWozYTVYV2xNbHZlVFdYQjNUMnF2U2FkT1pGdU9sMjZV?=
 =?utf-8?B?MHhoUDRuTk5qTkc0SmhFdDA3S2ZmdGRYSFVzUzZ6NXdybUs0MW9TN0NFL2V0?=
 =?utf-8?B?UkZ3ZTJ3QmRsdEFBVWtPcWVJbER4ZjRRbjJBZ3d5US9RUkJNYktjLzM1anNF?=
 =?utf-8?B?WEZiMm9rNWYzR09xWVR3NzVHS2pBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r93CrMpiItuGipNf73Q7mWFt6wU+zVkrYWIufkKYXcwjGnCg80sKCaxwynu3a3zlEbCk9oxdQGXoG3qdgHIebdQ0f2vLpqeVVmPwWXQ5FrPrU1qCg6+1BgJQjD/9mfAdXxC6GEyMehspSNv1xM76/C5c9LYDoTtOej/96TJFsU7H+Vwpv0yIIJcAIbqWTeV3iNl8B108j8csWBKySHOiZ86xAM75dIYiiHDR1Lxz5B2EvpK9k6oCgIwXtk7DCh86mTWEWMz/LYX2U+JPbihRNH4g2pkHCkgGUPuPMFPjZqBqaiv6ajU/7zdVzpfOmuSCTGlY3knaOrZFPZDS1Nyg6ixVkciGG/cZaLSwKUawZix/Br4d8EobBuT5ofe3rQijKcxqHqAQ7/hzc/mbN/eN5YYoVpch63tCIxqVsDI+DUN8X7PPq28n+6Nt5JSq/eKu
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:32.6972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cba808f-03ea-4bbf-8c00-08de73bc4db8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR10MB9900
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_074940_922928_E7F9DC61 
X-CRM114-Status: UNSURE (   7.62  )
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

From: Olivier Moysan <olivier.moysan@foss.st.com>

Since DMA resources are limited, remove the DMA related properties
of i2c2 and i2c5 in stm32mp157c-ev1.dts.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 4e46d58bf61f..c33a8f0e7fa2 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -171,6 +171,8 @@ &i2c2 {
 	pinctrl-1 = <&i2c2_sleep_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 
 	ov5640: camera@3c {
@@ -227,6 +229,8 @@ &i2c5 {
 	pinctrl-1 = <&i2c5_sleep_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 

-- 
2.34.1


