Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E323CF6ABF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdgesra8sUsh2QVglCjzufnpeFIapWv6f1CrS9FLne4=; b=3HHnqkaJsrHEJYyEpdMW5ZqKmb
	4H4xbvDEkKmAtVC9pqcU/gWiZEf1CML6Efq1UeR6p+t9t1hE8nBY/n/32mDOEVy3TSOWzShZnoO60
	GQLDJL+SCaN8oc0l8jd+PXHnC8ZTGLMnT12irwVSIArm4CMITCfAkPjlsaHofeNaOtOAr+OcNCsKU
	InnyC6D2PxCCoqSILny9iPEgUXLMGlyG0OH8lw/X7IfHNND9uN6jnUi/Ob+t5+OGgbszA5XwmTRDu
	eODoge4m3u7Bulv7WlVfJ+gmeFwAxkv8MNBg0/6/TE5S78s3oTfhjE3ADuN3gsD5tDJlC2iVt7nla
	x6vmuIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hx-00000001zxW-3lXn;
	Fri, 09 Jan 2026 09:23:01 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hu-00000001zsU-2YlQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:22:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E83ofx2me/rocbGFaBoi0yihXDjXo+70LLpT5YpyVJBPUPmKyFhnwzH5DS+TQOLwu2lECNVHJvW8fHpCL8RGDWJ6GzZPZAjTq99IfW3W+TQJxFWvcVkpxFaxmBsPuZtFYuIqLxYfe/UI5EY34MZTMIFUL2q0DVh7ase0AGSqqD0QP/JHFxf1sHpUokSFFYkdByBXfOtFTnSXH3n2RkT0DxzP6XnCae6RKD0HfzAWXHKbXU6YKDjB/uVss89lyqOfWhKVSG1rwWmUw4gstVD+tPCjZU9yuOyy3DSNLFzHzDjIiyR4QEtnr49EZUhn8LtJGQ100Wxgkl0uHkGyhuxVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdgesra8sUsh2QVglCjzufnpeFIapWv6f1CrS9FLne4=;
 b=tBLxipXb9gdL6SsOaRLGWoJqkQs1QdBhhFW56POQS5Ieyd6iT6ICEEF/5OjVXKMYPxizemaxZhYgiKLxMFplVp4Rd7BNfak0AY06qvlBf39jku/JyL+Eq9B21czimKJA7lvBA78rnv4RPcoz/+mXy3viMASA69dpXfjvJdjSzseCnWMUSARBNNPXrGtkUHOz7LvmoPxopgdvqOZBL3gLaGZiSL02JtsHsgImhoRNbxsYyq0S73b6QN7vYTISfmw4sHxdOMU376fvFFq1nuf2L5T3xEdjoBYwG3bQgeJopm+8z7wAr7ajbWdKtyc616K+AeMmilekQTJW16qfwi1LTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdgesra8sUsh2QVglCjzufnpeFIapWv6f1CrS9FLne4=;
 b=NOKvq2++BR3B/GChnMzdajZujvAELb4UJLZL4sv4x0o+TnTF5J3UnzCx6tI9eHlMpWcWm382Pwn/kLbviObTlClED6Mb5DYHjk3ppzsAud78M0Sk6S0jf7R1pHdVp2/Zkjby/DAMSwdE9fBvHayPIRg2T2YyADlbOTLcTg55nCuVWFL+TbclNAlMKE9tjL7CCHL+r1JWehLxYRVQ0eI8qldk+S+GX4CI2fg9iy4NOneyJE7r1Fy/8d1JpbLuVQLDEXfY0pRZKl4moXDu8KKWZ6jHzWw/O42GpXZzCYlhJq5Ye+xpAOOqkAJF9hQVrZJ+sQr9PugzR4JRAOUcU6ovwQ==
Received: from AM9P193CA0004.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::9)
 by DU0PR10MB5148.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:344::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:22:49 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21e:cafe::1c) by AM9P193CA0004.outlook.office365.com
 (2603:10a6:20b:21e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Fri, 9
 Jan 2026 09:22:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Fri, 9 Jan 2026 09:22:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 9 Jan
 2026 10:24:02 +0100
Received: from localhost (10.252.25.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:22:47 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 9 Jan 2026 10:22:46 +0100
Subject: [PATCH v4 2/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f7 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-upstream_uboot_properties-v4-2-75e06657c600@foss.st.com>
References: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
In-Reply-To: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.25.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F96:EE_|DU0PR10MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: 30654785-d8a2-419c-3a28-08de4f60a883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1kyZU9FOVFYc2NvKy94a29hRnFFR0J3WWZPRGZkcExrbmpWSWU5Q2l5Znpz?=
 =?utf-8?B?Q2w2NFVXdndmNVNsRmhlL2dEalp3YmJMMlM5c0hiYTVkZGxOUGx1ZE9qTlBp?=
 =?utf-8?B?cHNlcTNwbzRlaHB3NGE3TXl6aDgxSTJVSVlkVDBVVlZpbmVCcmNDQ1greWxQ?=
 =?utf-8?B?STdicHJndUJEK05GRTBHNGRYYy9rRUVLUUtUMXBaMG1aTTFPM3UrZk5TeVJQ?=
 =?utf-8?B?TDl0Ri8xamU2MFFlcXhRRjlFNjhTTmttSlBWNVFKZVdyL0k4bWRpNHFYM1Jm?=
 =?utf-8?B?UjY1WDZsNmZiTjdEdnowZHk0NmhORkx2S3pvRmM1bVlrOUR3RStPb2lGWjdw?=
 =?utf-8?B?VWJWMXJ3dUZndXlzbGNXZjlHc1YyN3Z0d1hrOVNwWlJ6TWpzVnQremlaQit0?=
 =?utf-8?B?Sk1FbFcrMzhTc1ZFZmlxUDFBME5GUFp4RTR3VEFWdkNXa0xraGJoY0NBSlBl?=
 =?utf-8?B?UnZhUUE3SHhvTlZIV29yeFVJRThTSmhlTVp4RFdOS1p2NURVaWk5SmJ6QWdC?=
 =?utf-8?B?TTVlWHVFWXpyUlBzOXlQTEs2SHJPTk1jVUtObTVXNWNENU5KMXRlZjhiQVhp?=
 =?utf-8?B?N0hocE5WODRLNG56OGZNemhyOVVKdDVwYkdvd2JUVzc3b0MraFJ3bEMzeTNQ?=
 =?utf-8?B?SWpxQ3B2Mm4vVzUvMExUN3o5dU4vaHZRNXJmWUxyd0lxVmpSd0czcDROdHov?=
 =?utf-8?B?aS9RZDRuL1FJMHUzOGZQLy9FNS8yUXZCYW9VajRWRkttN1kxVy9HaWhDMDB1?=
 =?utf-8?B?U3RkcXhTeStZNmlYcFQrbXB0TkRyVFE5UEs5czNUYzhhcFpNSVY4aHlpRHF1?=
 =?utf-8?B?cVI2K0dwODluTG5iR1JqRnJ1V084OTVCWllYNlFOZVN6OWZ3K0NuMi9KZWVo?=
 =?utf-8?B?UFVIRmM3ZnBYc3lIT3dXUEp6Rzc3MEh5Z2dRcU45OVNOanR6OER4bWIyMjdv?=
 =?utf-8?B?RUkvQVp1MllTY1lMM1FtNWh2d1ZxVHFTZmVBT1pjeXRZTXFtak1xSlltV2Zo?=
 =?utf-8?B?WEZpTUdLVFhWc1ExN2RaU2EvK1JGcWZUaFBqaDRvNFRUSlEzRWZFOXVJdDc3?=
 =?utf-8?B?MGMvbjMxQURtemdLRWNobWQxMS9DaDFXYXByTHJNeG5yekxNSDRlRUlrZ0dm?=
 =?utf-8?B?MXh4Q29OYVJtNFl2b0t5NFp3MExIWHlmMmhIYjVLdDNPY3dRWnZ3QldjR2Fz?=
 =?utf-8?B?WTNVdHFDOUR1cSs0V08zQW5lNUNVNEFJcVhtRTNpSG1MNjFLY1JQT1h1c1U2?=
 =?utf-8?B?N1Jia0xEY1BOYWNucWlwcUVpeFNxc0JYZzZsNlVSWkYvNmo5R09PUm1ISFRh?=
 =?utf-8?B?dkhIdUp1RTlrZ1FGWkdqekhndDhlSGxRSXd5eHpxbWxndFByMHpoOVJIVU4z?=
 =?utf-8?B?MWJaRnNPdTVuS1ZGVExIUlg2ZkZ0MTE1UFMvVzV3N1J0cjRPd1JtT1Fhc0xO?=
 =?utf-8?B?Z0FxYjcxcXdiRjM0ZkRqcnBNMzV2M3A2L2pDMWxnTlJMdTlvbWRzc3dtODAx?=
 =?utf-8?B?TktZMjk0KzdYUVVIMFZKV1pmaXl6OHpPQStGRDlEcm1Gd2lQcWcrdlo4Sm5j?=
 =?utf-8?B?WGdXS3MySDJGdko0NWVOaE43M3luRVlnZ0t0SDRlRHhGS2JoOHpaZTd2U1F6?=
 =?utf-8?B?WlplQkhBd3ZCWlY2bTk0NWdNWXNFMUJqNG5kaDd3cXYxTCtWTStDbzdWc2xj?=
 =?utf-8?B?ck9WOUVacDJmYjUrSmoydGpRWFZMQmtXcEoyN3VlY2dYUXpxaFcxZ0FhVEF4?=
 =?utf-8?B?N0hOSVZMRGtoR3ZDT0pPNVEvL1VmUTR3bk1odGFyNDhZSzRWNWdqZGVkTE1M?=
 =?utf-8?B?V0VzSURWb3BNUCtqNlBLVXc1ajAwLzVBSktaMTlKZkc3OThucThyd3lNRlgx?=
 =?utf-8?B?Rks5Q0hwNlh2WWNLQTF0UjRwYkk3aXAvTWRqaHBXRmpxZkRoMmdsZDk0emh5?=
 =?utf-8?B?eUZnWXdkQ3R6cDFZYURRcGFZd1U3WWYzSXhRUUdXMzM5TjFnZDkvK1JBRE5R?=
 =?utf-8?B?TTN3aWlmRVdTTDhvcUpJUzNnb095WXlRNGtUZ0puQ01mbnRlN2FpNlM0R0VM?=
 =?utf-8?B?ajNRdkdXY0hMbzQyZzBRY000d3VDOEV2SWt3dHo4ZW5nRm1UajMvelBVZW1L?=
 =?utf-8?Q?vdgo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: b5DvFj3bQUsTRHaZjXsbHjE57zM+mEJdxMF6ZshTHuSHiy+BiKRvZsUI9Yt/Zq1BAlnIb2YwTk6CGWFebEuDzYBOO9Ox0ZM0qN9KpXEkxA4C9+a5MzJ9bA8/paFxat6gE3EDlGXWPiqQJRSmsT8O44g4UheMaESB6YjFVCBgxQb1p8/XJUaP1WAYMskDSj8Xl12CavHouzcBTdGdtJpz8sRDP3BCnqch74DN/FTSKgZtpCBdnfVCVPMylZ+PHNppuKNbPd4yrAWV5JnY5fGgOA0vzjrCNmJ0rdkCUg3Ud+ktXFanSOvuidgHbOl99cF98g0/UN84M8pcZKY/CIblmXfUJyK8TIoV/WVfjmk3jzirgeX7BgJNLzx8qG8uyoLA2W8tO4IOC74DpTHmNh9/30BRrBp2Q14H8kl1SN3qYi65hQDNaIfQB8uZ2vti3SxjNm9X4MkX2wZ5N2oE/0lK23MdbirYAxOo3moKhSJR1Eg17kBbnT2evGuntzoD8XG1LOmtC6MsU6XSZRb1buhWc368gd/dyWoognU32F3FPo61uWxqYQvf6JUcCD51dSXE5yFjBdMdEytMB9vDCsAMvfixbDIfbAm+Db1WtRZexDMCoIK6HCOQbYEGb/6WUqN2iVDJmA30r4rG2LTEFBKGbzGV1OeTLoCtdndw+vN/ZE3ac0N9/Dkgyg8Cii9jK4HE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:22:49.5000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30654785-d8a2-419c-3a28-08de4f60a883
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_012258_800046_B178BCD5 
X-CRM114-Status: GOOD (  10.59  )
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
 arch/arm/boot/dts/st/stm32746g-eval.dts   | 10 ++++++++++
 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 11 +++++++++++
 arch/arm/boot/dts/st/stm32f746-disco.dts  | 12 ++++++++++++
 arch/arm/boot/dts/st/stm32f746.dtsi       |  5 +++++
 arch/arm/boot/dts/st/stm32f769-disco.dts  | 12 ++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32746g-eval.dts b/arch/arm/boot/dts/st/stm32746g-eval.dts
index e9ac37b6eca0..26c5796a81fb 100644
--- a/arch/arm/boot/dts/st/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/st/stm32746g-eval.dts
@@ -213,6 +213,16 @@ &usart1 {
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
diff --git a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
index 97fc3fb5a9ca..6b01c3c84272 100644
--- a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
@@ -24,6 +24,7 @@ gpioa: gpio@40020000 {
 				reg = <0x0 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOA)>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 			};
 
 			gpiob: gpio@40020400 {
@@ -34,6 +35,7 @@ gpiob: gpio@40020400 {
 				reg = <0x400 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOB)>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 			};
 
 			gpioc: gpio@40020800 {
@@ -44,6 +46,7 @@ gpioc: gpio@40020800 {
 				reg = <0x800 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOC)>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 			};
 
 			gpiod: gpio@40020c00 {
@@ -54,6 +57,7 @@ gpiod: gpio@40020c00 {
 				reg = <0xc00 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOD)>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 			};
 
 			gpioe: gpio@40021000 {
@@ -64,6 +68,7 @@ gpioe: gpio@40021000 {
 				reg = <0x1000 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOE)>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 			};
 
 			gpiof: gpio@40021400 {
@@ -74,6 +79,7 @@ gpiof: gpio@40021400 {
 				reg = <0x1400 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOF)>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 			};
 
 			gpiog: gpio@40021800 {
@@ -84,6 +90,7 @@ gpiog: gpio@40021800 {
 				reg = <0x1800 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOG)>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 			};
 
 			gpioh: gpio@40021c00 {
@@ -94,6 +101,7 @@ gpioh: gpio@40021c00 {
 				reg = <0x1c00 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOH)>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 			};
 
 			gpioi: gpio@40022000 {
@@ -104,6 +112,7 @@ gpioi: gpio@40022000 {
 				reg = <0x2000 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOI)>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 			};
 
 			gpioj: gpio@40022400 {
@@ -114,6 +123,7 @@ gpioj: gpio@40022400 {
 				reg = <0x2400 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOJ)>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 			};
 
 			gpiok: gpio@40022800 {
@@ -124,6 +134,7 @@ gpiok: gpio@40022800 {
 				reg = <0x2800 0x400>;
 				clocks = <&rcc 0 STM32F7_AHB1_CLOCK(GPIOK)>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 			};
 
 			cec_pins_a: cec-0 {
diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index b57dbdce2f40..9545b14d77c3 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -169,6 +169,7 @@ touchscreen@38 {
 &ltdc {
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-names = "default";
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -207,6 +208,17 @@ &usart1 {
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
index 208f8c6dfc9d..b0f012de759c 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -54,6 +54,7 @@ clk_hse: clk-hse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 
 		clk-lse {
@@ -76,6 +77,7 @@ clk_i2s_ckin: clk-i2s-ckin {
 	};
 
 	soc {
+		bootph-all;
 		timers2: timers@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -149,6 +151,7 @@ timers5: timers@40000c00 {
 			reg = <0x40000C00 0x400>;
 			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM5)>;
 			clock-names = "int";
+			bootph-all;
 			status = "disabled";
 
 			pwm {
@@ -645,6 +648,7 @@ ltdc: display-controller@40016800 {
 		pwrcfg: power-config@40007000 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x40007000 0x400>;
+			bootph-all;
 		};
 
 		crc: crc@40023000 {
@@ -663,6 +667,7 @@ rcc: rcc@40023800 {
 			st,syscfg = <&pwrcfg>;
 			assigned-clocks = <&rcc 1 CLK_HSE_RTC>;
 			assigned-clock-rates = <1000000>;
+			bootph-all;
 		};
 
 		dma1: dma-controller@40026000 {
diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 535cfdc4681c..539517c7991e 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -133,6 +133,7 @@ &clk_hse {
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	ports {
@@ -178,6 +179,7 @@ &i2c1 {
 };
 
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -221,6 +223,16 @@ &usart1 {
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


