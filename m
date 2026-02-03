Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99451E87834
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhxjvqrwmjt0J2NunMRr0NMEhIpL8VncCZ4W562DVTM=; b=V9I2GmStxIeRavGqN7qfzxPEOx
	hlJ+WgkWsOFICWO0HrW4v4YhWMvb/dvNgc000bMe3y/WfUtVIr/huNNgdJVziSjQm0vaIxS9d/cgw
	p+2mzovpsOKim9Vag/U6k9uT/55AZb98K873s+IS+zdpNiwgU1dU/EH313qgdv+tzvpyRTLN88hyz
	zDsBqIjc1sOsjDsVO0FvQfBQjDf91tVQSfreI3TJ8AJmdw157nwwb8vy+oCgKqvlNBOLqkEuTRNJA
	s1vjlAwr73pBUogOWD1k84qvabHUEYKIuAHqfzwJKG2B4b9FB2/6Jxtlo2GtDkOkim0rI3yw99HHD
	B3l+NA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHOA-00000006l4T-2qSG;
	Tue, 03 Feb 2026 14:28:22 +0000
Received: from mail-northeuropeazon11011027.outbound.protection.outlook.com ([52.101.65.27] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHO5-00000006l08-2pwM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9N9b/SHgQAJSXAUu45bqyp2wyfhrvXKWfCuy7B3c2gG2OpRk9LuWEQgjG/Dm/+8PEUWMLZNrB6M9MCVCio3NHl7aKtSSvCzPsUVEOjBU0xZecY/QtOQj4Lz+C7WTZpiYEE/shcKFA+8moIdli3uwPETTmkjkL3NomPotS7zz1bbF8eCcjfKHue9uAW9YZar80xh6ve6VitPdVhTYrHciDEXtKeJ7dfdgEyYB7gqkosQG3iXB1RRm4tpni1W9bkFJf4TZ2TUNoqRKbk6VYYB3609DfTbPrALE+Svil45bvApb+gvEWrZTCr4NtYMRaHOtX+5mdh5xhbfkdeXAiyEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhxjvqrwmjt0J2NunMRr0NMEhIpL8VncCZ4W562DVTM=;
 b=JxSQzdHjbrlVxNWyrf2v1T5y8Lae44Xv5hz40K3NYI4z2fQjr4hMyLKuxDEXYZwsv+RLXv22Mg4WlRHbZEpcIxW+xy9cFx2Cx9pNvQugfK/bdEciivtq9wa+5vCZJs45QRlt3PD8Acy9+mtSOH7oLBfmKVul38r5ZI5lTir7H14PqU0nRsbO1OA3krOs51C9bDV+OKUS/x3s+jqH8OkiLZRl+eonSFq12N+a/lUzvmQ3fWg1g2wPEEN8jd5oOuL9vvonpFFA6ffhLQrFlD5tYVytKJ7ahlYfRwO49EEPa51CzfefC3FAaGDzZu+TuuvYqUN3aU6ZfeF8EGg6Ztu+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhxjvqrwmjt0J2NunMRr0NMEhIpL8VncCZ4W562DVTM=;
 b=lydHKkIVhuBWKwG3iQbZ/HsqNORvsydH60K1vqFz3UxbWOX5Yf7Xf52A0mq6Iday7h+1ajqnFpWTpuDdw6kxQ+to6iQ3/9xH5mPiHLLuTxvT1ZwFPnJ0T+phSuTxvQ4aHJdPGJ+WUgXOsWHLEUYVM/EUc32mCZ1VSrjlrQ2jP7nLWqWNrbf6W6qOIH3KZaGw2UWG6kjhS9B8dox5k5kYHtO24M5co7nL+WTL4HnH2x3vEF/a7U0NHnh7MqkWEW7hs24Q6w8Y7pmkAu3Ii3NIPoRvW1t7yZo7biDvGZH07NUHr4YvhnWw4v/KfRksd8UjFm67sa0xw1QVrHTGB+c57A==
Received: from AM0P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::30)
 by PAVPR10MB7355.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 14:28:08 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::64) by AM0P190CA0020.outlook.office365.com
 (2603:10a6:208:190::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.13 via Frontend Transport; Tue,
 3 Feb 2026 14:28:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:28:08 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:29:46 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:28:07 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 15:28:08 +0100
Subject: [PATCH v6 2/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f7 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260203-upstream_uboot_properties-v6-2-0a2280e84d31@foss.st.com>
References: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
In-Reply-To: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|PAVPR10MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 143a3de6-2f7a-4bd1-53f2-08de633073d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHFRUk92Z2pPWS9Dc0dQWll1L3o5Q0p1MktNYVdnc3JSc0R2Rmp6OVBnQnJi?=
 =?utf-8?B?bXVna2ViQytZWk1QN0xEWkdxcEZGU1FUWEVjQmZpYnAwcDNIMHg2MnJNME1n?=
 =?utf-8?B?N3FRRkszTk9CVXdMeGVYN0g4dkVyclJObi9aU2lzTVhuWjd0TW9ZbkcySGNN?=
 =?utf-8?B?cnVITUM0VWVkQzBhUzhiSmxTMHZyWHpjcEtSa2MzSVBHdWRFcEdpdjV1VDZv?=
 =?utf-8?B?VzFaMTJVT1lxVWIxZzlXTitHaWllMXlqNDhOWkIxbkJNNmVQaEdBRnRFREtx?=
 =?utf-8?B?eXBxQ1p3WVdBZldrbjdzWCtDNXFFUlpwNVRtQUlMV29XWkU2UVcvNGdGNlQy?=
 =?utf-8?B?VUR3RFJSR3JzVk5IUUNCYlhvR0ROZ05QMjZuN09HWVo0NEw4MG5iUHhjS2d5?=
 =?utf-8?B?cmx0WWYvQ1VuUVFjT0ozVUlJOGQ4TmJCRVp2WDgxNGhyMjAxK0J0c2NEYUVU?=
 =?utf-8?B?SW55VTVMc0NzV2EyMnNpMzNVbU1scHliVzVuN3luTmUxYmllR0pXQmJLbTVK?=
 =?utf-8?B?eU5IbTZNVkozWmFtalNOK0VXTEFSckZVM0dMWUxIT2M1dzdxZ1grd0hHdmQr?=
 =?utf-8?B?L3RiMGo3SFZWTHdkSEhUZ3Q0bEMzU2RHZ2VJdXR5QUtRaFVjZG8yQXgrM25h?=
 =?utf-8?B?UWRhbHFreDI4TGhQY2x1c2dFczVwVFJ3TjYwc2hjT0t5WkdnMWVPaDMyd1E0?=
 =?utf-8?B?d1JrNU02eXdrV3lRTi9CQlVsMG5aUFRZUVE0akdYa1I1RFVpNkVoN3oxOXRS?=
 =?utf-8?B?T1BPckN3YTR3WGhkY0wyN09IYVFrTWpEQlIvaEVxYXViL1EvSUtOYk52aXli?=
 =?utf-8?B?WU0wODgzUEh1Zk44dEIvcmZUUHBTT3lNU0sycXdmeTlRc05qUlB0dkNxUGda?=
 =?utf-8?B?U0tYdGQ3aC9aUDd3NkxaeERhcWNGclVSU0YwYUU3WnJ1VHF2WHVKSjF2NFJL?=
 =?utf-8?B?c1cxSkVxa3BWaGVRbFl0R3pMVTlpcUE0dm9EdmNGeXFaMi9hSHljZVB5L1dQ?=
 =?utf-8?B?dnowTkNFQ1ZHRDQ4bmhGcVhBNGY4a1VwQWZTUDNLamd1VXllNUVKMHB2YTFi?=
 =?utf-8?B?SWtsUmc3Z21RRWhXL3NmekxkalJxaGsvR2J4UktTM25Rc2ZZWXQzeW93ckN4?=
 =?utf-8?B?NmJXK2o5cm80b2VrVDBlQWU2SktLY3I1UEN4bWpYVmhiTlRsSU5ZYVlDNnlH?=
 =?utf-8?B?c1RDMUlWOGMzcGxDU1pIZncrNWlvTGI2RjNxZExDNktQOFZPZ201WlY0bUx2?=
 =?utf-8?B?ejZNaHNuakptdHFHMDFNQTBxL24vOXh0TnRaNUM1VHZWdFdHcUYySTVaaEJI?=
 =?utf-8?B?c25DRW5HZDlMd1Nnakkwa0lCdXBEQzhZUUdFd3oySzEzU1kzSDhabjBRM1cz?=
 =?utf-8?B?WTdLSlIyVDVRL3RjNllEMEpqVG81SEpkQzEzdzcvSVR6V1gzaEU2aUNvZXls?=
 =?utf-8?B?UmEzazc5em1kb1gxZXh4K3dDV3djS2x0NTVEbzIvRTdlbjZVWCt4NFBJTmxo?=
 =?utf-8?B?OU0vb09DNldCbjhHZkRiZHdLOVVGTktjVG5MM1ZTU3V0dVBpZTIxekszZU5m?=
 =?utf-8?B?KzZxTzhKdHk5aEc1RTRLMDhFamQ4VitucWNzdHRxeGtUSVppaEpGV3h2RXlE?=
 =?utf-8?B?RHJldDByampxb2tqdmZtc3Y5ZzVqZzZzVkJ0dlFCei9iZmlXbExFSCsyOUF0?=
 =?utf-8?B?dWJ1Z0JYMjNKazAzS2xPdW4xOTVGS09aME5xM3pHTGVpSDMxL0JuWkFPSzZ5?=
 =?utf-8?B?bE1XNEVqQUxPSnJneE9xVGZ2cHlwbVpQZVY0VE43YktJMlNWVC8vZWRMMklZ?=
 =?utf-8?B?MFljaWpiOHhRY1YwQ3JLdUVGVWdzY0JWZmx0bTlLUDNTV1BqQ1NGRFUzT2xZ?=
 =?utf-8?B?WjcrOWRkeCtkbXZKRC9icnNDY29OZWlnYXZzazBxcklWRUd4YWkzZEFXc0FW?=
 =?utf-8?B?VjRjbFJ1Qjd0VmZ1L1lFV0kvNTZnTVd5djU5Q1MwdEdabW9oc1FoN2tKRHBS?=
 =?utf-8?B?bWc5Z094cENBQW1ZZysrVjZ0NHpDcFFMVzNLZG5HeC9LY2g2bVNaWmw5V1R2?=
 =?utf-8?B?NkZSQmZwRjFNTHU5OEloSXo2RmNPRXdkaDNlbnhqeU5GOEtFMmhBWExUUnk4?=
 =?utf-8?B?NU11aXJuRkJtZkh4T3EvSndjQ2VjbVVPVEhaa2V0dHZLUy95YWVENHo2Si9j?=
 =?utf-8?B?QnBLbTVZb0xNa1Y4dWRWK0ptVXNuUE1NS1ZWcUMreU1YYWdwdTV4T0d0ZFZr?=
 =?utf-8?B?eU90QXNXd2pIRndXdksyQ2hCRU1nPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ptNjdaswbdzLDiipKwMwKxyZwHwoRa+3uTkci2Uw1wA6n3j/AJElpFAk728US4BVGizdCUsAAnJIyHyzaAAPTwsqiQACcWXdlU5tx7ZLXTAK+L1ZLKZzcv2yTHL743d2dlqC7xlXJ7HYljcS6FOqzKk9P4B5zVanKTRXY/0FwNyi/D2hOFNrrBw2tlBL4Fme0d09mf9GuEGWX6sIXFMSseGhZqhG3a6jyXibLXlA1n1+00JvnJUVS5RI233f8TvmWe4Cb/eLEcLoBQQ8iMHYJ6SpW8CDEUI3dbaP4nmWu5pNMj2pvHmSSBQHz/ubGBWLcqQ2yXQr+guEN4vFH+ReGcZWGNFOWjGs/Dpu9Px+PkOp5Fa3sVK1mtHs1AhIzw46XU9XoAzas6NCHpw8MUz8TG7SZDPe6jW7DpuJScZCs43mlU0zU/485ZUF39L3cQs1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:28:08.5332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143a3de6-2f7a-4bd1-53f2-08de633073d5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_062817_865707_B326D1D6 
X-CRM114-Status: GOOD (  10.77  )
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
 arch/arm/boot/dts/st/stm32746g-eval.dts  | 10 +++++
 arch/arm/boot/dts/st/stm32f746-disco.dts | 75 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi      |  2 +-
 arch/arm/boot/dts/st/stm32f769-disco.dts | 76 ++++++++++++++++++++++++++++++--
 4 files changed, 158 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32746g-eval.dts b/arch/arm/boot/dts/st/stm32746g-eval.dts
index 6772c1f9d03e..d66b670de6f2 100644
--- a/arch/arm/boot/dts/st/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/st/stm32746g-eval.dts
@@ -226,6 +226,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index 61ca41ea523e..5db37bbe6c2a 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -150,6 +150,51 @@ panel_in_rgb: endpoint {
 
 &clk_hse {
 	clock-frequency = <25000000>;
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
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
 };
 
 &i2c1 {
@@ -179,6 +224,7 @@ touchscreen@38 {
 &ltdc {
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -188,6 +234,22 @@ ltdc_out_rgb: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
+&soc {
+	bootph-all;
+};
+
 &sdio1 {
 	status = "okay";
 	vmmc-supply = <&vcc_3v3>;
@@ -203,6 +265,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -214,9 +277,21 @@ &timers5 {
 &usart1 {
 	pinctrl-0 = <&usart1_pins_b>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
+
+&usart1_pins_b {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;
diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..1fede5bdc347 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -75,7 +75,7 @@ clk_i2s_ckin: clk-i2s-ckin {
 		};
 	};
 
-	soc {
+	soc: soc {
 		timers2: timers@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index e5854fa1071b..7338e78847b6 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -128,10 +128,6 @@ vcc_3v3: vcc-3v3 {
 	};
 };
 
-&rcc {
-	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
-};
-
 &cec {
 	pinctrl-0 = <&cec_pins_a>;
 	pinctrl-names = "default";
@@ -140,11 +136,13 @@ &cec {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
 };
 
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	ports {
@@ -181,6 +179,50 @@ dsi_panel_in: endpoint {
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
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins_b>;
 	pinctrl-names = "default";
@@ -190,6 +232,7 @@ &i2c1 {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -199,6 +242,19 @@ ltdc_out_dsi: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
@@ -219,6 +275,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -230,9 +287,20 @@ &timers5 {
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 };
 
+&usart1_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "otg";
 	phys = <&usbotg_hs_phy>;

-- 
2.43.0


