Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D86EC1EB8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=388WzPcc1qexD/0AEeyI3mTDP+gdBLVPlhckg9V1mn0=; b=CdM4rV/ZFOLJQ9
	4u6BGVQhaXzRYW+U0ZrAiu6OranVBexXzXqJX+uYwRAV11jgsg1PN/mABuOUaQovn8NH1IRY9c4oS
	z2xppPMxuaKipnbwd/EXvobaTBRgKqek7SfMxiekc+WT1VWlmgiG7G+D1JCMT3vr93uRBeVjf1LRQ
	MxTxVQePQ0Syi6fcecDcmEaxzBIV0V7fk5TrA0yPiDyYODlxOAVNzjKGw12W+QF8vF37iVJ3oCasa
	lAWO+kF0Rr5z9wcU1seM4jfBJenRtjEov4Ak0woNmqPaj8KCtwEUyMANAZm2g91W/2e1DEf7nh/qo
	rw54PikptIbMP10ssGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzaK-00000009xZV-1y9s;
	Thu, 05 Feb 2026 13:39:52 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzaG-00000009xYP-3IRe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:39:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DX5qGLn4AxAYbbgDjS6R8Avr8MdpH/vFCbB/Ntsjtc16dvPka8i81zx2S2zGyohaj0tm00Z5jJvuOShz5au7HbF+rUp4CWRMI9iZvBlPd4PsIpwlcze7Uh50cfOJIBolY0Mjhz/QTIGOnnU+JtGlpC8GhdNlYLxbtiSetNV7vLjQ+BzJEmObSqLye0g0P8mOv1nF8TQ+sR9s3uLBadQ+ZLH3WtShUBurLpViwcVUW5ne90//Vhzr5iRnJXlkCPB9kxj8Mo12L5hgvglkOvMAu/dqaEQ+esHKzOgdhech87IkPpie0Y2oqhSkTCo80cBvQXvhOw0ulZJ+4pwwSNRa9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=388WzPcc1qexD/0AEeyI3mTDP+gdBLVPlhckg9V1mn0=;
 b=gzGDTrAenM1DdprdgVFJMukmKwtTd/g7yzmaPBxdNbQmyQPR7sDj0WujH5kvx1RkMi7TQ+KjPbVe927fSglsM3OtvGvrXRfFlstHCEVtjYGxXPh9OcI+wsVQYax8lEqvZuASKaydu0DlyhEv7CaPqlLGlXwENDzrGmV2IAZPj9OSzyDN/Y3hDiJORLTO7ksBhiPrkSnRKBarnG6gHlKgcWsLNcqKBBeoAS69uJ4nzGF7O8Yy8nOujCn5RiXSb/84gz5wW64oEM71Wg48WG5i+NtgWNx35horfRl45n8SZGt/MS1qBni9aXBUceioERBsEdA+h+SDccrzRFYT9X7uwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=388WzPcc1qexD/0AEeyI3mTDP+gdBLVPlhckg9V1mn0=;
 b=IPpZlLhANU9bhGXDMtK4WOH7H/fciTpv45dl3w5xwbeI8m85nKYs9oc4epusjPijIFYgXmgUKee4z/X82TTUiRUgd9jmX3GSOh1voYaCfIhA0ZA3J4vvAWhMM82Yft+uvn4IUeQ2BP0iXh1Dxo39Ag7TGFNBGQA10Thq6rsH36C8Z5cd7PpC8m0LaKTKvN4n48elSXN+qRLz9bGHXV9uCAvtif3dTDyhxVi7Wn3/NziMb6VqzFyRGBEnfsofcEguvGwB0eMkSE3apKMVtUZEx1XQKbl18LcndG0oY+JIYNMShkLPkJhzzVxN79F5252LjiaRiRIV8cKFyNjkGYiIYQ==
Received: from AM6PR10CA0050.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::27)
 by DB5PR10MB9737.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:651::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 13:39:43 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::e9) by AM6PR10CA0050.outlook.office365.com
 (2603:10a6:209:80::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Thu,
 5 Feb 2026 13:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 13:39:42 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 14:41:22 +0100
Received: from localhost (10.252.13.241) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 14:39:42 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH 0/3] Enable display support for STM32MP257F-DK
Date: Thu, 5 Feb 2026 14:39:39 +0100
Message-ID: <20260205-master-v1-0-fe6399aa3aab@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJudhGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNT3dzE4pLUIl0LQ0sTA1PL1CQzEzMloOKCotS0zAqwQdGxtbUADiy
 h1VgAAAA=
X-Change-ID: 20260205-master-8194059eb646
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Philippe Cornu <philippe.cornu@foss.st.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?=
	<rgallaispou@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.13.241]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|DB5PR10MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: deeb6cfc-86d9-44b9-94f8-08de64bc04b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emRPK3VSOFVUeElhbzhERnVYN3BtMkJCRUtyRzExMnZNd3JUS3dqWVVPYUo5?=
 =?utf-8?B?Z0tFSjdDWnhzMC9EQlhWVitJLzFKaUVheURxdldhakVHQ0Vvck5ZTHQ4ZlJU?=
 =?utf-8?B?RFJWeHQyb0hvRTdoYjlQODBQb0FKSDJUVEtXZ3VRaHhKeE5rUm1FRFFwWndZ?=
 =?utf-8?B?bTljckpFSlZYamxRZ1NIRUsvalJvU1BGVDVlOWkveUVpMjB6WWYwWmR3YlRj?=
 =?utf-8?B?RlBhV1BoeEJRMTNqZ2JvZHhCVW1DcEtrazF1eFFxeGtnTzRjNG9wbkF5WCtK?=
 =?utf-8?B?VmxuRjVZSE1BRnpoWEs4c3BHTG1qRWloVWFIU21vdUZQTXdCemJRaG1ncDhS?=
 =?utf-8?B?NU82ejZiMFJROCtVUlcreG9ITEtmLzU5aGMvcjdjZXpNVnJIVkVsQkRyWXBO?=
 =?utf-8?B?VGVGZThWdkFHdXd0dWhsaU5DNXB5NmErVlRDcjhLNVFMcnBBcGc3VVM0N003?=
 =?utf-8?B?ZEJQeUVhQ0JiaG8rYzdCZUtWY25NUUkyRmR1K2Fmd1ppKzlYWnNETzQ0bmhZ?=
 =?utf-8?B?aTFzZFZ4a0t0ejBOWEN5MTQ0MEwzZW5jaHRHdWJROUNKendkalhTMUJSK3Qy?=
 =?utf-8?B?UXJyU3hOV0RNOXRtVTBLYUd1M2pEc0JKWVlGQ1RqaUpnSnh4NUdVYW9tUzVU?=
 =?utf-8?B?UHFueFRXVW5WVXpiYmJXaXJ2ZHdrVE9UWXZDcjFmU0g0bGJrV3VCemFlTk1w?=
 =?utf-8?B?b3NmcElJOWk4cTBGUXVSa1lSdHl1RE0yMjRjaENQdzltR1NVTWNsRlAyc1ln?=
 =?utf-8?B?WGFkTzdGUk5RalJRbmwxbEhjMUNtdm5IWmF3QU5TT2J1QnhwckIrUGQyaFh0?=
 =?utf-8?B?MXVoblhDQnZZd1ZSUTdWWER0NUI1aUpPSStjOEcrRm54bWp6RFc5NXpSQmRu?=
 =?utf-8?B?Sm51MHAzWFZjQ3Uxb3p1SSs2NEtCU2EyNktlNjJLNzdhSFArSEFQbGRpeVQ4?=
 =?utf-8?B?N1haWEd3ai8zb3pDNG5PTzBqdGlTUXR5S1BvOEMwR1BsUW5sOU01OHRjWHZW?=
 =?utf-8?B?eWdkN2I3TVY3RnJJZlFzL0ZVeXNHQWR4VFVMRGJ5cE85N0lxNE9KSk1LcjBH?=
 =?utf-8?B?K2VhN0Rwc2ZDWVlsemp5VmtuUEorSHhIYzJ2TFlzalc1amNpU0lsT3pXVTdl?=
 =?utf-8?B?T2dCOVpqdUZFWWhGdlRqZi8wamMzYXoreDhnNWxnR0dOdjB4M2g2eVlvK2tE?=
 =?utf-8?B?N2RhaUcxMmtOb2VsTmNKZkFNMVNSMGRVVlpWOS8xM1pOcDY1ZmRqdlgzRmNW?=
 =?utf-8?B?RnY0MjF4UEhlLzFSaXVpbkpRTE9VYTB6ZjJadm9tWTdkUjE2VnNYN3hBa0Jr?=
 =?utf-8?B?UkZjelJuMEpzK0VtSXFzTWhadCtWRW4zWWVFR2lBcnoyeHVsZHROd2dyc1Nt?=
 =?utf-8?B?ZjhsaHFLdENIQU80b2NzZ0JKVXpoNDZyN0J3ZjlVTm5YekgzY2cxcGpCcGNX?=
 =?utf-8?B?UmxUbEdzM2QxeHY0Mytra0pOM1hPaDF0Q3M3UHo5eEx5RzRrbkVkdStoMTZh?=
 =?utf-8?B?UVpXaWtZYVp1dTRMUGNmb0RWN21HQmpkUU1abWUrMG5FbWU0V1BVYmorSlFx?=
 =?utf-8?B?cURiTUxyK0NmUWtvZUZPT0ZOTmc0NmRudEJYRW1yWTkvMTF0eUZUQXI4SGVD?=
 =?utf-8?B?YlRxMFVUV0J1T1hhUnQ0RkprK2paaWVVWnE2THJhRUJsZmF3d3VwVU12SjdX?=
 =?utf-8?B?THg4TndIY0hHUzl3Y0ZrR1NZSjAwRkI4YnNYNkNJS3JWYlpmTngzNUprMGhY?=
 =?utf-8?B?K0RxcWdvem5tZDlWUlRCMjFUd2VCdjdVc2dsNWhaUXlXQW5yMDllWDhEOVJk?=
 =?utf-8?B?bFZmUUV6akZYa05XWlB0QnJOajdZd093UXFqMi9ma0JqSmFwMEtPSVRkY2Z5?=
 =?utf-8?B?VG1oYzFwQm5CL0RpM3U4R2k2UGxUK3E1THgrZUtqeGVxMnhDR1ZiRXJjUWVQ?=
 =?utf-8?B?WXlBdTZBZC9wNUVPS0JFWDFhSHRyNUdseTdLWm1VY3d2VmhLRDZBK2x3dTFH?=
 =?utf-8?B?WmszNnlBbzAvZVdXMmM2SFF0UGJ3K1lwanBrcHh3NFlGVWwrL1h1YVFjNDhu?=
 =?utf-8?B?TGNxUnkwR21FNmRXaFYyeGQxd1dxRzJOdGZKeE9DVlpLcStwSXp3SGVCeG9F?=
 =?utf-8?B?VjVROEo2R2RrT3kxaXp5K2VhZmNQUm9UR2IzYjZtV0lYc1JDaUpYa3BhS1Zz?=
 =?utf-8?B?MGlENVZMeFRFNUlwNG94RU1lTkxSQXRDTEN0aTRKRExKS2FwUkRzRG5LTW5S?=
 =?utf-8?B?V3VablU3OE5Mb3hzaGJKampSUW9nPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ubELgBQRjT4T4QLAddnuUFyizDIvaRQW/MURA9ImNUay9CoCm6NMX4cw9enQv3aGZVXFg0mGtoDi745c0peG1GqkZYAtoxinvy0zGrl/Ld1nx70tBB/P9INUshRZN9Rvgq4HsnTLmH7HVGi2VVQ6gKSgua3r79d0dG2nqL2SMjbZLorZ1T63+9B7SD9SLZ2LFlLtX2Kvc5LWfgi7CK2drlS3UqPBIorGTXcoCY1sGsLNGFcE7cwCl0SsJQHWp4eRVgft06XE81cFcAsYd1B4wJZj6fGKy+CWfVI2WcO0Hlw5La1PMdDkwz3oaWMJaSG4v8gkQhgHM+R9Xk3kD6HOVzmER1sJ8AGOo/Sdel1lIaj84ASw+V89r2NdiK2UaOUVkd3DZBmpXu+yQRTVuA+A+/CMkr225uEZF32llgMYIp1UbNf0i97Um24nBi6kY9Py
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:39:42.7544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deeb6cfc-86d9-44b9-94f8-08de64bc04b0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB9737
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_053949_377420_89A4265C 
X-CRM114-Status: UNSURE (   5.14  )
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

This series aims to add and enable sufficient LVDS display support for
STM32MP257F-DK board.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Raphael Gallais-Pou (3):
      arm64: dts: st: add i2c2 pins for stm32mp25
      arm64: dts: st: describe power supplies for stm32mp257f-dk board
      arm64: dts: st: enable display support on stm32mp257f-dk board

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  17 ++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 118 ++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)
---
base-commit: f14faaf3a1fb3b9e4cf2e56269711fb85fba9458
change-id: 20260205-master-8194059eb646

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


