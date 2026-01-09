Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AE0D232FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/v7Wc+CiB5AicWEesw07ipFfLSOnijhp/pWCD6xdAlU=; b=PdcshdI1dJPPeJQGHajGXSUUwS
	2p51KQuEueAiRvvh/s/b/eU/Vc31zwhIvQGjMyCl8PRCsL1gocoLuwkUxUu5eFaXqSmQymZ7mV+Zi
	kBNWE7V+3Wt430/relBwexZ7XeC3p01UlmuwvkjivRDSAGqW+lyTCd/TfusPxjBdh7q/iPnf/m9Jp
	/ewP1U/x4lmAGGuda/edALjrDogVWlv49NVgEBTbPasZxMnjpUVeiribI55uPmLiWSiA+f6aKMwFW
	U5PxpsitbRXxtAt521FokYTrR3R1urOBrYR/sWSX1NId3MsDKPz7Y01DwtadCSDiEigYPHLTrsphB
	miaeVurw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hx-00000001zwa-12G0;
	Fri, 09 Jan 2026 09:23:01 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8hu-00000001zsT-0nKw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:22:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoIeg2tYr9cMqxZXj892JpLmiX5iEqPs0kPOhjaFvRZF4yuXsgXNrvFXWDdAkcj5BGpGAItUsIT2CAdKB/eiabQckJq/s1nqH8zFaIDqrmYc6xZXUqJ3JCbt9wsDp32vhefEQN59/hiZrwAOu2mE6tb9Ev38oTqh2lie8PNu3ivI6Jldr+3ygv2DCIFKu8nzRnYbLAH+ETv7zIyAdXOD6SxdabuG9XTLQXAC//3A8pWoN9WtMXJhtJsg+OZ74OM4pGfujB6g+0OsOzAI/yXBJmVp/57nddtuB/X0/pN4DoJGA6gkTFh46XstBHCwt/b6BeEvWx3/XrxL7PxxY0Bb1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v7Wc+CiB5AicWEesw07ipFfLSOnijhp/pWCD6xdAlU=;
 b=l9e7wG85QxydhyL70IfDM8XNxqLR1yZ/zCSZ2GNw/b/LKdjhZCPLwSWOTEKgPWc1PttoYbN5E65Useo2lJz2vJwQ1ihtXXlPj7D1cAS5EdSdHz20QoTXYGDW2xtgw3D8y+OvzQwlrflRK/7Oe7kvbxSlfVqv2MXgGxOiYfP3uhY5r2M10zeARKEIrrD/jTgaR+zJ9J1kUuOTqWo+oFhCJSbsOOVBcAMfAzxw9GO5X6OSmJqfdp7u7DqxIlzgmQ/RuPrC6c5iQvKGiETvNfSS8VTZOwtN0QNipFWJsqNmZY84TZkhhdHVM6xNRSq/MJA/eHhOOGl5eJR6bLWuJscucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v7Wc+CiB5AicWEesw07ipFfLSOnijhp/pWCD6xdAlU=;
 b=dqmSd7LJO2yIZnROOLnbySk1Yhj6U/A85PCtu6eS8FAN1rVBF1OkPgrWSoSs/5mAp/E5J/nSY/0Z5/MbOs7jhABSy2pub62yTsyc116qHyHr5LXKVV7zqfA5kcQBQQdOgoCSPAGaljN44TqVytfGL/EPYArvKmJHNMONa3gQ2t3CYIOrlFQmUbkht6MkxPricLBFS0psyP4jiEHua8NYvRrRD5ziev9/zkKcHVhPnkLS3yJc+A4Fcw8yIo8l4kk0Qv8hB0n8ADMwyMJVjVbVm7ACRUex4LnsxF2CPJgvdEyLY8sWPRF8EJah3Kv3UbJ3jzo9HfUPac7WhPswHuWoww==
Received: from DU7PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::14) by DU4PR10MB8722.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:56c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:22:51 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::c6) by DU7PR01CA0011.outlook.office365.com
 (2603:10a6:10:50f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 09:23:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 09:22:50 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:24:07 +0100
Received: from localhost (10.252.25.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:22:50 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 9 Jan 2026 10:22:49 +0100
Subject: [PATCH v4 5/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp15 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260109-upstream_uboot_properties-v4-5-75e06657c600@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|DU4PR10MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2a098c-1750-4972-b41b-08de4f60a96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGUwcGpoSWp6aEt6LzVxQzlOUlJjOWNkWmJwNTBaRkhQYnZXSTloTXRvMXl0?=
 =?utf-8?B?K05vZjlpdUYyQkpoS0U5WEZsVkttRWhQMzFSWGRhWkpQbXE1RWtBMU9mS0lM?=
 =?utf-8?B?TnFZc3RJL2NSVEorUTYxdW1TVGt3OWh2dmcxZWNBYVhuODJQMFJEUkI4Yjgz?=
 =?utf-8?B?TEVKV09aTVpHS3NEYkJzTktQSDIwSUFpVUpFZW03NFdtOWtSL29yVTVqaTNJ?=
 =?utf-8?B?WjlPQXRKbmJra1FONjg0MllNTzNKUXRGNjNTYlIrL214THNVYzQ1b0hNVWtZ?=
 =?utf-8?B?UUQrbjdMelJjK1lMTnhYYWMwY25vWUdPUnpPZW1qTFBtMWxVNEpqcklneW5D?=
 =?utf-8?B?WnVJbmtvYnB1MG01SlNDZ3ZZUTNMTTFjang0eHQyVHh1dXFJbVIyWThwSTBl?=
 =?utf-8?B?MmlKY1ZMM1VycnViY29zSHRtMGtLaCtPMzN3TUdWTGc3VEtxMWdRd2NGczh0?=
 =?utf-8?B?SkY2MkxkdkxHaGlDQzh3S0VlS21vS0R6VFZQVWtFZkx6cUUvUVo4dERFcDJV?=
 =?utf-8?B?cG9UZDZqU3ozZkh1dXJtclBCU0xoV2FzdjMvWG9lejVuVnNMR2hkazRzQWdQ?=
 =?utf-8?B?OWdvdUphT1hPMDlVNlYwTTVsT0c5RkJuV0dJZHJFcHBYOUJLcXFINDhDVTl6?=
 =?utf-8?B?SUh0WXUyMjRqNU1ZdHRqeTlDckhoeS81N0hEMmNBc3g5MzZNOUJmWTJoOHJJ?=
 =?utf-8?B?TFA5V1FpUmhIY0dZMllicmU1SjB2ak1wWG4rdjVMd0w0WElUR1lqODFld1hk?=
 =?utf-8?B?QVFqSDNGSFRYVW5MdWI0NmRjcmx3K2FvSU4rb2J0bW1RNlZNaDJETHNMVy81?=
 =?utf-8?B?ZmFUcFJXMkhiQ1c3YlBZT1d4QWtRdmhRRHlwa0tZSEN6RWVlY0xtY1Z2bEkv?=
 =?utf-8?B?UFFDeGd1aHl5blZJNHRpWk41cXl2K3Y5OUNqU2tLRjNHMTY2eEFXTmN1ektz?=
 =?utf-8?B?WWo3clVpYk5adGlLaGExaW9EanIwb25YOGtTdEtrN05BMmxXQ3VWNDFOeW5q?=
 =?utf-8?B?V3hpZjNnNm52dHJ0ajRCdlZ0VFBjRUQrYkxhMllXSWduOFdXemFFdVU3ZFo4?=
 =?utf-8?B?VHNuWnRxTWlLK2RBcjRVQ3BSWS81MWp3ZDEyNnM1MXdId2tya01IWXp4NnlE?=
 =?utf-8?B?R1VPWVprYUxhd0p1RjU3bTZiVTk4SFNDUE1vdllUMUFYSFA0Z2E3elRSU2Fy?=
 =?utf-8?B?Zlp0d1RiM3VETU1KeGpFVGdqeDNONzJjUXYrRGp3VlR2SnMyUC9ydFdLa0F2?=
 =?utf-8?B?MUZTQVBZeE5DdVgxa1RuTHRBcEVaRFBDVEdzN2lndjNYNk45eGNUUEZMdXlR?=
 =?utf-8?B?b3kvc0p6Z1UyTWZZbExLclJ3ZFhRZGRSSER3cGUyd29PTm5vQStiMHE3bW8r?=
 =?utf-8?B?NnJRa1B3NWg5UmFyaXUvSVZScUE0QWN4YnJXRm96VGVLNHF5eXlzMmpYRHhR?=
 =?utf-8?B?Z1liTi8wdjIxNmwrbW9LRHBOMGpzZVVRLzdFVVA0Vi9peFEzc2taZDd3NXFB?=
 =?utf-8?B?cjNmRUNqVzd6cXg5MDBIRXNiaDFWUDBJVm92RlJvYTlvYnNvMWdvRCszZVZq?=
 =?utf-8?B?dWFUUDRDZ1oydmtLaDhpQzNVaVFPQzQ4RjkxTUNOVGVIS1V3cnY2N2FoeGNJ?=
 =?utf-8?B?TGJBeEkyWXNKRlowT2Qvb1VFWk1XeTQ1REMvWkQ2c3lYemd1dmw2YUt0TUVt?=
 =?utf-8?B?R3RpdGZ5RCt0c08zRWtORk1tc0dMakhXanc4dzYzUmMzWFNGTFYvYzhWcGNL?=
 =?utf-8?B?cVg3OTJ2WHBsY3lhTHBxS1FReXVJRnk0WFRINFdlaTFMS3pxcGpzV3VXdWtX?=
 =?utf-8?B?c1FGeEVWVUtpcWZhSGxEMlNzWnBJa3Zwa1duRjR5aGJNdGlPeC8rdlpKaVpV?=
 =?utf-8?B?OU1ZaGIxSEpDeW9xSkxEY00zN0VVNDBrRkJubUsyMXN2RzRZWXlBMXZGQTdx?=
 =?utf-8?B?cDBJVnJYbXdjUXNmbk9wcnlzVk44OHk4RElnZkNncWE2eXJyTkhGcFFPWGlI?=
 =?utf-8?B?K0pBUmJEOEY2QjFrNXVVQjNaeHNUMXlWdU1WeTJVZHJpUHVrNEx6NWk4NDFj?=
 =?utf-8?B?ck12dHpDaEN4eG42d01aT2o2U2Q0bUhzRzE3NndoY1VLdVkvbitDaHgvUHVo?=
 =?utf-8?Q?D6ps=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 82fyded2gJfGQJkPUKgRi/c5ABGCFZ7J1a1u3cRky8VtUe/uP7nHaRxzvLjnvxwtb635FQNES0ZbNmSBHQD+/wpoDbug6FsFLZno1ExSyRmfyHnpoRnjyMrCT87+sza6CxZt3/09rfNcbbl+YnuI0hAfh9J26paHsCsG3nBxy/1cb4fS6rXoJsKJFMyK0U9A4I5FNYbi0HMZTcUXYDNh4ZkrBvSjTiABq/YPBE5IxAzxkCyzhISoHrq/03zVdgHyfrIB4NZEc28a1U5a6jhlWOT+yoh46VMPuBr3RpmS4bT+7G7O3Cf9HEPKggTCCXII8fDQdoiyyrW7I1g22gkP76hCFq7X3pgpKqEh5ce99g7UVZThvK1no8kAOnPSeHC9sD5XdWCE1EK/dms9bc12jZyFx4dB8p7C8III+zBgTXq+3X/NgzEPfUxF5qz7pmiAbjrEMxNl6z7b85Yrx+tv1otTfmpKMJXGfGkSfeSAPoX7Bbgnby9wTDUlL8lWCq+YNwdaZ5BCEsha6sX+UFWFa2fvBI0I0Xm6f4Wjtan96nkCS+pkWAUoQWcRAshgvL5nzdKzZkGQLZX0wHzbiWGvX19eI2jVVQdN1p19uQ7DZ83k5FsgY1ySdLUl5mq4FIYAyfBKusfo8Hl9PASN2JDeqFnXjaT1ons91vZMf3lntj0V6UxwWEknFhEjYiS9Vf+k
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:22:50.9903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2a098c-1750-4972-b41b-08de4f60a96b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_012258_431380_D1D88214 
X-CRM114-Status: UNSURE (   9.98  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      |  2 +
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 25 +++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
 9 files changed, 266 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index 98552fe45d4e..4bac528e07e3 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -13,6 +13,7 @@ optee: optee {
 			method = "smc";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-some-ram;
 		};
 
 		scmi: scmi {
@@ -20,6 +21,7 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-some-ram;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..7abee7ce0580 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -33,6 +33,7 @@ arm-pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-some-ram;
 	};
 
 	intc: interrupt-controller@a0021000 {
@@ -54,34 +55,41 @@ timer {
 	};
 
 	clocks {
+		bootph-all;
+
 		clk_hse: clk-hse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <24000000>;
+			bootph-all;
 		};
 
 		clk_hsi: clk-hsi {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <64000000>;
+			bootph-all;
 		};
 
 		clk_lse: clk-lse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
+			bootph-all;
 		};
 
 		clk_lsi: clk-lsi {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32000>;
+			bootph-all;
 		};
 
 		clk_csi: clk-csi {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <4000000>;
+			bootph-all;
 		};
 	};
 
@@ -122,6 +130,7 @@ soc {
 		#size-cells = <1>;
 		interrupt-parent = <&intc>;
 		ranges;
+		bootph-all;
 
 		ipcc: mailbox@4c001000 {
 			compatible = "st,stm32mp1-ipcc";
@@ -142,11 +151,13 @@ rcc: rcc@50000000 {
 			reg = <0x50000000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			bootph-all;
 		};
 
 		pwr_regulators: pwr@50001000 {
 			compatible = "st,stm32mp1,pwr-reg";
 			reg = <0x50001000 0x10>;
+			bootph-all;
 
 			reg11: reg11 {
 				regulator-name = "reg11";
@@ -354,6 +365,7 @@ ltdc: display-controller@5a001000 {
 			clocks = <&rcc LTDC_PX>;
 			clock-names = "lcd";
 			resets = <&rcc LTDC_R>;
+			bootph-some-ram;
 			status = "disabled";
 		};
 
@@ -364,6 +376,7 @@ iwdg2: watchdog@5a002000 {
 			clock-names = "pclk", "lsi";
 			interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
 			wakeup-source;
+			bootph-all;
 			status = "disabled";
 		};
 
@@ -404,6 +417,8 @@ bsec: efuse@5c005000 {
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
+
 			part_number_otp: part-number-otp@4 {
 				reg = <0x4 0x1>;
 			};
@@ -1876,6 +1891,7 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0xa400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			bootph-all;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1885,6 +1901,7 @@ gpioa: gpio@50002000 {
 				reg = <0x0 0x400>;
 				clocks = <&rcc GPIOA>;
 				st,bank-name = "GPIOA";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1896,6 +1913,7 @@ gpiob: gpio@50003000 {
 				reg = <0x1000 0x400>;
 				clocks = <&rcc GPIOB>;
 				st,bank-name = "GPIOB";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1907,6 +1925,7 @@ gpioc: gpio@50004000 {
 				reg = <0x2000 0x400>;
 				clocks = <&rcc GPIOC>;
 				st,bank-name = "GPIOC";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1918,6 +1937,7 @@ gpiod: gpio@50005000 {
 				reg = <0x3000 0x400>;
 				clocks = <&rcc GPIOD>;
 				st,bank-name = "GPIOD";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1929,6 +1949,7 @@ gpioe: gpio@50006000 {
 				reg = <0x4000 0x400>;
 				clocks = <&rcc GPIOE>;
 				st,bank-name = "GPIOE";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1940,6 +1961,7 @@ gpiof: gpio@50007000 {
 				reg = <0x5000 0x400>;
 				clocks = <&rcc GPIOF>;
 				st,bank-name = "GPIOF";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1951,6 +1973,7 @@ gpiog: gpio@50008000 {
 				reg = <0x6000 0x400>;
 				clocks = <&rcc GPIOG>;
 				st,bank-name = "GPIOG";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1962,6 +1985,7 @@ gpioh: gpio@50009000 {
 				reg = <0x7000 0x400>;
 				clocks = <&rcc GPIOH>;
 				st,bank-name = "GPIOH";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1973,6 +1997,7 @@ gpioi: gpio@5000a000 {
 				reg = <0x8000 0x400>;
 				clocks = <&rcc GPIOI>;
 				st,bank-name = "GPIOI";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1984,6 +2009,7 @@ gpioj: gpio@5000b000 {
 				reg = <0x9000 0x400>;
 				clocks = <&rcc GPIOJ>;
 				st,bank-name = "GPIOJ";
+				bootph-all;
 				status = "disabled";
 			};
 
@@ -1995,6 +2021,7 @@ gpiok: gpio@5000c000 {
 				reg = <0xa000 0x400>;
 				clocks = <&rcc GPIOK>;
 				st,bank-name = "GPIOK";
+				bootph-all;
 				status = "disabled";
 			};
 		};
@@ -2006,6 +2033,7 @@ pinctrl_z: pinctrl@54004000 {
 			ranges = <0 0x54004000 0x400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			bootph-all;
 
 			gpioz: gpio@54004000 {
 				gpio-controller;
@@ -2016,6 +2044,7 @@ gpioz: gpio@54004000 {
 				clocks = <&rcc GPIOZ>;
 				st,bank-name = "GPIOZ";
 				st,bank-ioport = <11>;
+				bootph-all;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index 847b360f02fc..f721c398e576 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -85,3 +85,17 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
index 0da3667ab1e0..c4581e28504a 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
@@ -23,3 +23,46 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&i2c4 {
+	bootph-all;
+};
+
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
+&pmic {
+	bootph-all;
+};
+
+&sdmmc1 {
+	bootph-pre-ram;
+};
+
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 1ec3b8f2faa9..4fc670bb4cb0 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -79,6 +79,17 @@ touchscreen@38 {
 	};
 };
 
+&i2c4 {
+	bootph-all;
+};
+
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ltdc {
 	status = "okay";
 
@@ -93,6 +104,10 @@ ltdc_ep1_out: endpoint@1 {
 	};
 };
 
+&pmic {
+	bootph-all;
+};
+
 &rtc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rtc_rsvd_pins_a>;
@@ -103,6 +118,20 @@ rtc_lsco_pins_a: rtc-lsco-0 {
 	};
 };
 
+&sdmmc1 {
+	bootph-pre-ram;
+};
+
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 /* Wifi */
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -127,6 +156,20 @@ brcmf: wifi@1 {
 	};
 };
 
+&uart4 {
+	bootph-all;
+};
+
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
 /* Bluetooth */
 &usart2 {
 	pinctrl-names = "default", "sleep", "idle";
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 6f27d794d270..00d4855f9a85 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -90,3 +90,17 @@ &rng1 {
 &rtc {
 	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
 };
+
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index f6c478dbd041..f63a3d68d2b4 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -168,7 +168,9 @@ &i2c4 {
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	clock-frequency = <400000>;
+	bootph-all;
 	status = "okay";
+
 	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
@@ -179,6 +181,7 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		bootph-all;
 		status = "okay";
 
 		regulators {
@@ -314,6 +317,13 @@ watchdog {
 	};
 };
 
+&i2c4_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
 &ipcc {
 	status = "okay";
 };
@@ -365,9 +375,30 @@ &sdmmc1 {
 	sd-uhs-sdr25;
 	sd-uhs-sdr50;
 	sd-uhs-ddr50;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_dir_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
@@ -381,9 +412,27 @@ &sdmmc2 {
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&vdd>;
 	mmc-ddr-3_3v;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc2_b4_pins_a {
+	bootph-pre-ram;
+	pins1 {
+		bootph-pre-ram;
+	};
+	pins2 {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc2_d47_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &timers6 {
 	status = "okay";
 	/* spare dmas for other usage */
@@ -399,11 +448,22 @@ &uart4 {
 	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-1 = <&uart4_sleep_pins_a>;
 	pinctrl-2 = <&uart4_idle_pins_a>;
+	bootph-all;
 	/delete-property/dmas;
 	/delete-property/dma-names;
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
 &usbotg_hs {
 	vbus-supply = <&vbus_otg>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index 6ae391bffee5..bcf80f76d6bc 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -77,6 +77,31 @@ &optee {
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 };
 
+&qspi {
+	bootph-pre-ram;
+};
+
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &rcc {
 	compatible = "st,stm32mp1-rcc-secure", "syscon";
 	clock-names = "hse", "hsi", "csi", "lse", "lsi";
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 8f99c30f1af1..879436cbb72d 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -262,6 +262,7 @@ &qspi_bk2_sleep_pins_a
 	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-pre-ram;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -283,6 +284,41 @@ flash1: flash@1 {
 	};
 };
 
+&qspi_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_bk2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&qspi_cs2_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 &sdmmc3 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_b4_pins_a>;

-- 
2.43.0


