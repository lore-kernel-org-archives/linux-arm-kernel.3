Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A7ED72367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6v/PI7R1mVhQR8EuPqU7o9W3qgnM8/sNOtT1B/C6FUw=; b=I3Ya95VD7Ve3uglXbeTZMFkOJ7
	r6SzEO0s2uA/B3E2e9+pG2Sd7HVcPSfJEvpXe7VKw06T7aO1lV4x3ylRCpYWsthYEvMGZ7X5ubLD7
	986B3eKr6vdv9qb1k2DlYP8c/sYYk5j6zjzuJ0FACqle3NSfFv6D1efRiVc9tLf8guZdoUc7oNWoy
	mBzr6v6tZxhXlq6DSHrg7OT7CA1LpjWsLJjejRfKN0r9avxCRhH0V0dTQCbzqUx928mdoVCSD1PoE
	7T11OS/DjClLPtgBnOgpwlTsiVup9ajmRU4VifIYZjIaG4PCx0jKhQnj48palvDWJzbO2kcJZ1ZBq
	1AIVrclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBm-00000008h8v-1Kip;
	Fri, 23 Jan 2026 10:14:50 +0000
Received: from mail-northeuropeazon11012052.outbound.protection.outlook.com ([52.101.66.52] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEBY-00000008h06-14am
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 10:14:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey5aE+7VAoniTbCYW49hFyGriswJapvFxMMFXK0YTUfdV9wC19XXKKxPHaZw8C5ZsTxuLpasWPkVnKCvUv/ytFh8AIZDEJkBzy4CcenbC3YqzccnB2q0t1FJFS2+x2kv1+t8QfYSkt1cxjCfTZ6g+T2TXDp7hDm6lsJQxgX2dB4nE6iE11WyDRo8jhBJoYJBcKM3grvDomhhtiqUJ88NdjtZgloG17xKaiyc8MSrbp+XiwFZhB6kgkWuwfIuc0m4pFzUEnpJ19t0vg50L+AcB+8PBpEl8YviG6J3nIcjbr7wgi0EF7XfesMTgea3AuBdcyj5+4i4MYO7kTFmZy9ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6v/PI7R1mVhQR8EuPqU7o9W3qgnM8/sNOtT1B/C6FUw=;
 b=pGf4TD9r1wwwZ+B71k+Cc60NPkVVUhW9ii1ifVxZ8UpcDp5cItpzk123Bi+PxzjtSl+rBKULVCxew7SkPtiZky/pjQXAmqGT9ZT9D/CA42J9ltLVEpCrkpgCq8Q72esUcE5fBjBaznBVWzMkUucNJ92lvp5Bf/857173VbLTN1Rbu1KnO5M2BZvyz28S/j8FJd4oMKXnTUxonTdPK8b5SgpqYh4d/Ay5Uoz0d2hHFKW0EQslK3Itesd70Rjk2NsXWx8kLehl3ccf9h4OHFpdC/b+OQ8ImFJJzd7+XJMNbwHJKasSJ2BTzCVVrDkkVvXkzB+zVq20eG56nCOFtCNskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=dh-electronics.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6v/PI7R1mVhQR8EuPqU7o9W3qgnM8/sNOtT1B/C6FUw=;
 b=iV29Z4M6I7+nnC7jtMuFd2+6jZbP+H7BLWjeq8hYr+SN/Vb6d5SNhR2NkDcoGU4T6xESoibdACrMUagwrhQ09qW5ipncvDInyg3iHpddiGbILwp+L3TrzOR30sUN88TLX1+8QjnwFXqxUMRAD9jCRVt79vO1gBlbK4Cl95qwMAx+p3G5iZq7PYlkzsIvrXj30dnugNb6AK17cS42jPvr7AbSVUJEWPyPp82uxOlqIf9vQ80LpTiTBGwpfOH+AgrOVjaGOIxlPKc6P/i0hHXOlWotq2aJhA0CvjGaQu6PX8OaskD/dK4ozYEqg+pO6HNKieZ7qQe6/gPxXrqfPWXzDA==
Received: from DUZP191CA0056.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::14)
 by AM9PR10MB4104.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:14:27 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::4f) by DUZP191CA0056.outlook.office365.com
 (2603:10a6:10:4fa::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:14:25 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:15:38 +0100
Received: from localhost (10.252.18.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:14:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 23 Jan 2026 11:14:06 +0100
Subject: [PATCH v5 4/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp13 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_uboot_properties-v5-4-5167929d5af5@foss.st.com>
References: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
In-Reply-To: <20260123-upstream_uboot_properties-v5-0-5167929d5af5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.18.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|AM9PR10MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: f452d2b7-cb29-4429-8f61-08de5a682f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHZMcEhscS9BWkp3NytCUnN4ZWFQblM0SjJmZldpRDdKLzZsd1hUQU5saDdx?=
 =?utf-8?B?K3Y1T2d3Yk0rTnZCL1R2cGZKOThGb2c4UVFnM1k1MFZVdFpLUGR5MWh0a21w?=
 =?utf-8?B?c3RWdkpvU1hZaldsMnoyM3hvNXF3NGRhSVJac09tV2NBVXlqNEU3VTc3d2dB?=
 =?utf-8?B?Q2JhSkRhb3doOVhTSEZObXYxb3ZGcW5HVmgrTVVrcDBDaXF5eEl2ZVF2REI4?=
 =?utf-8?B?WHlUOTcvbUJjSUx1VHZMa1BTMytKYk5QaFoyajJ2cVRaZmJ2cHFjM08vdzYx?=
 =?utf-8?B?aHFjUzNQeDBaZDBaVHlYMmF6MEtGbEpYVDQ1TXFOUWVmU1NwcDdEcGNTdDlp?=
 =?utf-8?B?RXVTZGtpcWRMeFJKeUE5NGlwMndyVHZrVWtTZkRNdWVYNnBjU2VpVnhFRnB4?=
 =?utf-8?B?eHRMUDljUHBqVXVETHV3UmI5VE13RUdEVmJ6YUEyblk4RGxNYkdSaERHUUhV?=
 =?utf-8?B?L1ZBRzFSYWJFK0VKM0UxNGNadGVGYUVlR2NYOUdOcnA0U2d4Y1JEYjJSRDBw?=
 =?utf-8?B?b1NxZTVXdUgwUzdiem5obUV2OHFHZUJFUnJzMFRnRm94OExRVzB0RThmVDJ0?=
 =?utf-8?B?U3p4VVBla3JiaGJKYW8vTXNpVmRHbSt0WkV1NEJJU3FTMVhqaTBQOGZXbVpa?=
 =?utf-8?B?SWFlczQ3SXNnbzdEdzRhMWVVZExsTUxIeGg0OS9NMHd6WWgvNnFwNzJld2Fw?=
 =?utf-8?B?SkxFT3NnSVc3Z1RDVmhYSUJNL2EwSTc0clROZ2RTL05lRkVNbEpRNkxoYzN3?=
 =?utf-8?B?Tk5JTDVnVUN4dm10bURTYlVMRWl3UUJjby84Rlk3azBYTkVxcTVmRWIwZTNI?=
 =?utf-8?B?S2FsMUx0VUNnVHNsNnNFRXFqUDV4dW5xZHN4TDFOVGJaOXpNOU5TakNGNGhh?=
 =?utf-8?B?YSt2eU1zeTVjei8xVUZVekVXbDJmMmZSRksyYTJLTUpwMkJqbGI4cHlmalJN?=
 =?utf-8?B?VERSc1VzNDdhN2krUjdEaFprM0lKcFR3T1NaOHZlaEtuM0VOdFNxOXI1ZTVo?=
 =?utf-8?B?QlJGakdvYnRrY0QxdGRwcFd6SmVTYXJEMTB0Z2V5WnphRDFkR0NhejBMclBo?=
 =?utf-8?B?MElxTHF2dkVJelY5bzVXQVJUbEJMTmJ6RXl4VlRRRDFaU3J4Qkh0THpQV1gr?=
 =?utf-8?B?SUw5Ympxb3FVWUQ5TDhFdXVNVjlOSG5BOTg0M3lnakNQRWM4TGFNVzRMSWRr?=
 =?utf-8?B?Y3I3bHpLdTk4QW1CaFFwbFIyUUk0cGdldFFHZjNzOUhUSklvcnhFZFpGQlFx?=
 =?utf-8?B?ZHF1a0xGWHNHQks2eHVQenN0cEsrclA5cWhZS2tlRVFSQnU5U1BNSmNXL0Nl?=
 =?utf-8?B?aFlIa1ZQSklLQ2hxWTY2c1haSnlWMyt3QlRCajQwbzZjd3hQU0k5R1o2alJ0?=
 =?utf-8?B?c2g0T2dhSVFhbTZUakJRQTVMbkwzSmtaMXRvZWppbWJtTFZXa0pXYzhoTFNO?=
 =?utf-8?B?RnV3MkJFSndEek1od1g0cjN4MGc5WTNObnU5dVpUM3FsQmhxTSszV01zSXpn?=
 =?utf-8?B?WlBoU29EM3MzU25GV3R2WlVya0d1dEJKQU10L084RnpIN0xhUldwT3E0U25V?=
 =?utf-8?B?UmxvOTFjSTkvZFpwYVlHT2kyT3VNQjNXQnRXS2psRE5NSWxiM0hEQ3RNYkFZ?=
 =?utf-8?B?RHprZkNQT2N2czFCY0hOeEhwRGg2djBUMGNTZWhPNG1VNkt5ajFsSCs4WU9K?=
 =?utf-8?B?Ti9rRVA1Ym5pcGdseHJoYXJ2WittT0gzWU01VVV6aldlbjZJaGg2b2VodjVw?=
 =?utf-8?B?dUdGdmRmSVVwT3pxbTRldkhhVzZCa2tQeDNNR2RsZ1dWVUJqeXhjTngzVW5v?=
 =?utf-8?B?WnV1alk1b244d01Lc2QzVmxlN1NZbUp6aVpnTVpqYlExN3NSRk1rQTNwQ0lr?=
 =?utf-8?B?Q3BGMGdyZVIrdDVBMmVzNElpdytaUElVeUNPeVJ4bm9PL3JabHRCRGt5SGp6?=
 =?utf-8?B?dFBLY2NOM21KYlcvdkF1RnF2em1kWkc4TnU4ZkpTUWxTWTV1MmNIZ1RBTEFK?=
 =?utf-8?B?QzNBYkFSdnBnb2tQb2Q0TnRNTEpFOG9jb2RieitIOTJSV0RmV3oxY3U3TS9s?=
 =?utf-8?B?YXNESi9YTE8rNkowcUlMdThja2k5bXZybURCOXROZmY2bVpCN0xLTS9ITUlP?=
 =?utf-8?B?YnBzMG5kbDBhR1ZIUnlZV3VhbnNmbGNic2tQb3RJZys5OHRDMHhyeWdiWnlV?=
 =?utf-8?B?THcvRkhwK0pRbm9SaVZLZ1B5SHg3N093ZGgyREg3d0lBTkFEanJidk5YMUMy?=
 =?utf-8?B?NGkvdlFqZVlFYjVibDBRd2lrQUhBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ipkEoszTd7vhX/Sj/Rre7fuAMeaB30Ia5TQIPbRJfE3AY+bsutQdJOWlJFw3HKA6TF7G5jwattERBW6T5W/wA7pObj+cw3DomNQEkVelTUxafxLyKmZ06hYn/bi3YoFaRQnLNxEang7XjXImkVrkYL2b7Qrxxfl18lXl9eA+jwev7IDXyyioONYv1dqG//w9sjIutQeMnCzcjtQ7jN/D8hNmhC1pVTni7QGdWafMFFUH2UnrOERDI6IlG0iK3ydFpelhkraz0yvrsGX50W4JSXcxc4FXXhxyhVNEQ8Q3Ybahw0mhRMFe0hk0cB2NILODc5tEj15BASVHZBUxZdpZYaXsdctF2DxxTT7ZC9C0a5VEWAygFxedwNztmAo0eMcoA97FeGHVycYZz9IVkpKMPxfFYGj9ZyClqxqqZ6Yw5N0kVwnUGvHJwDATd+r+XsVa8cPw4dYGSHWLxQEkHW5fMo/pU4DwVIe9kFlHSRhBW4v5YSoibA9vpND2+vDIr0X4eoZ/UddMR20YlVPs5Jxxf9F74tK6WGedAyXXnNEiSSsA9UKYTM8c4H8IPANBD9+OWl6Tmk4hjrJmCZE8k1j9vFV6jyy2x1PX7fN/j5Wt5ad051NKJBT5OrjTpwlB5irDzHrMTnOqCVPQbjUPp52Evmumw5CKQWKG5wHquP9AR3qfaKJ9SvWHGdqlkbdujIpoLkj0Y2wIM51+5bW44rzGdg==
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:14:25.0746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f452d2b7-cb29-4429-8f61-08de5a682f6a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_021436_456666_BA399639 
X-CRM114-Status: GOOD (  11.21  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi             |   4 +-
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts |  21 ++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts          | 101 ++++++++++++++++
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi  | 145 +++++++++++++++++++----
 4 files changed, 247 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index fd730aa37c22..80c97bc830eb 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -30,7 +30,7 @@ arm-pmu {
 	};
 
 	firmware {
-		optee {
+		optee: optee {
 			method = "smc";
 			compatible = "linaro,optee-tz";
 			interrupt-parent = <&intc>;
@@ -85,7 +85,7 @@ intc: interrupt-controller@a0021000 {
 		      <0xa0022000 0x2000>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 9902849ed040..526ab2e1a93c 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -350,6 +350,21 @@ timer@12 {
 	};
 };
 
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_b {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usart1 { /* Expansion connector: RX:pin33 TX:pin37 */
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&usart1_pins_b>;
@@ -367,6 +382,10 @@ &usart2 { /* Expansion connector: RX:pin10 TX:pin8 RTS:pin11 CTS:pin36 */
 	status = "okay";
 };
 
+&usbphyc {
+	bootph-all;
+};
+
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	status = "okay";
@@ -432,6 +451,7 @@ connector {
 
 /* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
 &vdd_ldo2 {
+	bootph-all;
 	regulator-always-on;
 	regulator-boot-on;
 	regulator-min-microvolt = <3300000>;
@@ -440,6 +460,7 @@ &vdd_ldo2 {
 
 /* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
 &vdd_sd {
+	bootph-all;
 	regulator-always-on;
 	regulator-boot-on;
 	regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 9764a6bfa5b4..83bc5ea90c3a 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -161,6 +161,10 @@ channel@12 {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -208,6 +212,42 @@ phy0_eth1: ethernet-phy@0 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
 &i2c1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c1_pins_a>;
@@ -342,6 +382,7 @@ goodix: goodix-ts@5d {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -349,6 +390,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -358,6 +400,22 @@ ltdc_out_rgb: endpoint {
 	};
 };
 
+&optee {
+	bootph-all;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rtc_rsvd_pins_a>;
@@ -369,6 +427,14 @@ rtc_lsco_pins_a: rtc-lsco-0 {
 	};
 };
 
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vdd_adc: regulator@10 {
 		reg = <VOLTD_SCMI_STPMIC1_LDO1>;
@@ -392,6 +458,10 @@ scmi_v3v3_sw: regulator@19 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
@@ -402,9 +472,24 @@ &sdmmc1 {
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&scmi_vdd_sd>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 /* Wifi */
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -436,6 +521,10 @@ &spi5 {
 	status = "disabled";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers3 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
@@ -517,9 +606,20 @@ &uart4 {
 	pinctrl-2 = <&uart4_idle_pins_a>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
+	bootph-all;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart8 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart8_pins_a>;
@@ -583,6 +683,7 @@ usbotg_hs_ep: endpoint {
 };
 
 &usbphyc {
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index c18156807027..4efaca84a72c 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -54,6 +54,46 @@ vin: vin {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
 &i2c3 {
 	i2c-scl-rising-time-ns = <96>;
 	i2c-scl-falling-time-ns = <3>;
@@ -216,9 +256,18 @@ eeprom0wl: eeprom@58 {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
 &qspi {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&qspi_clk_pins_a
@@ -229,6 +278,7 @@ &qspi_bk1_sleep_pins_a
 		     &qspi_cs1_sleep_pins_a>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -238,37 +288,35 @@ flash0: flash@0 {
 		spi-max-frequency = <108000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-all;
 	};
 };
 
-/* Console UART */
-&uart4 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart4_pins_b>;
-	pinctrl-1 = <&uart4_sleep_pins_b>;
-	pinctrl-2 = <&uart4_idle_pins_b>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
+&qspi_clk_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
 };
 
-/* Bluetooth */
-&uart7 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart7_pins_a>;
-	pinctrl-1 = <&uart7_sleep_pins_a>;
-	pinctrl-2 = <&uart7_idle_pins_a>;
-	uart-has-rtscts;
-	status = "okay";
+&qspi_bk1_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
 
-	bluetooth {
-		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
-		max-speed = <3000000>;
-		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
-		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
+&qspi_cs1_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
 	};
 };
 
+&rcc {
+	bootph-all;
+};
+
 /* SDIO WiFi */
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -312,3 +360,56 @@ &sdmmc2 {
 	vqmmc-supply = <&vdd>;
 	status = "okay";
 };
+
+&syscfg {
+	bootph-all;
+};
+
+/* Console UART */
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_b>;
+	pinctrl-1 = <&uart4_sleep_pins_b>;
+	pinctrl-2 = <&uart4_idle_pins_b>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+/* Bluetooth */
+&uart7 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart7_pins_a>;
+	pinctrl-1 = <&uart7_sleep_pins_a>;
+	pinctrl-2 = <&uart7_idle_pins_a>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
+		max-speed = <3000000>;
+		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&vdd {
+	bootph-all;
+};
+
+&vddcpu {
+	bootph-all;
+};
+
+
+&vddcore {
+	bootph-all;
+};
+
+&vdd_ddr {
+	bootph-all;
+};
+
+&vref_ddr {
+	bootph-all;
+};

-- 
2.43.0


