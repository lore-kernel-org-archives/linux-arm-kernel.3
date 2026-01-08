Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF38D1D480
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiuyxLeQgyxw7XgC4GwO3U+M9n2koPdGeNQJdrIezF4=; b=Hi071DcdUrf4ar9YotrYXCUp8l
	2vTNvlhZ8OtqNIHPWDn0rv9mP2HJJZks5E96sQXIHb4BogjetJLPM8TsTbLqi9QDGo3tDCaui+SxV
	NFg++iMQTC1vAqS5GuL0rZoPzzkq90J7+1cz+d4J/rE31Y6kuCipzpBcpRW9V9oGU1E241cPicOn2
	L5/cSQsQq/69dmoJjYU939Vvfy8Er/g3iR0uDaE3yTuft7hhRdF6Dug5rmJDHW2a81oZW1wmL39CI
	MQ/wtgJ5Xo3m9rSP1/JeekHUSWe4oxMr4sZTv+gWzfeAXQYcQJdjCmv2gs92S0A6uRrm73z3zcTEr
	rKLEgPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtca-00000000LTU-0A2c;
	Thu, 08 Jan 2026 17:16:28 +0000
Received: from mail-northeuropeazon11010071.outbound.protection.outlook.com ([52.101.84.71] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcT-00000000LJi-2uMW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:16:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMmgQZCnazriLq2G2poTlQhjnrmhJl+7JDUOg1/SHiNwkcsFnK6e5ieDwBkY1EK2pIo7+aDwkk2kN7aPsIEsXJE/2Cupr2zjM2YEsEOLZGiRg9idtB5viU3VIyIY/9Q0Vt8QrX0IPU8NNEmurvrpcjHISzOyZMt1c6mmIMVmOwhyPQLOHHtd4W1LDuAbzuMB5YKoCaBMlSRg3x52zmKQ5ue8kRiIbVWxsSKrtGBehbxDZhEg0hwa8OtZAA8+gqMI5KFHPR3zvnl7cQJFcfd8pC3gPLRqpLhxx4N9rGctKb42rEJ3atqqUvyw4QxEq2WSemVkHdliEHya2ZpeFaAS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiuyxLeQgyxw7XgC4GwO3U+M9n2koPdGeNQJdrIezF4=;
 b=jCmlcEixicaIInf0iSdVFxyJRsSfjnh5195s275NpnobypKTxXVw+rgjz7cCBICJQ/XsNjnWbMujr6MKVxnJdYslpUsHVKGmtlyOA07/ucuPTK2PEMesaEmuZaG9SQNtO0t2KfH91AIqE3oMVviQwjbg02aCgZBPJyrFzsx/KnUmjV2kMLOG1ZDtjiWmU+4LeaEPHlu2IobDuCNpmIKa4V43HRle+RegzrvtKeRSsujL4PK2gXyfpLtb1xDOERg3w/pnjgrpTLdKHWXpEtKBuOm9kMmneIUQ8xmvrevR4fqMC/DX7nuu1eoNzhxtIwoAVQ3I3qQbE+4P27kogKv6TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiuyxLeQgyxw7XgC4GwO3U+M9n2koPdGeNQJdrIezF4=;
 b=IwAyr2QEP/ato6F7VLabiM7q1yojKj/r/iPzmJXk2wCzIgUXNW5JNzj/EP3KSAvJET3F5zoYpphTktjBhosOZWi8CEdCPlMbmns9uxXBUzq9477somQB5XDasfk/h/QKK4zMo8ZplLz1b9NL9vclcX1P6NbIfbi+X1FvMDoeLQzs+AeBfH6VaNR5PWU/IlRShy+nj2BhYKYpzcVG1g+x65ahNuJ5PPdmFOqYbYiiQSv11ySYIRHao9Dg3YKjBPGGyDblMYURJNayC15s+tlirvBPI6RPWJA4nppRRX5KZOSFYkjQWKQQWXWxTkhMnzzqtxYHyqLOcvrKvS2eQqDFMQ==
Received: from AM0P190CA0006.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::16)
 by GV2PR10MB9676.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:359::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:16:07 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::e3) by AM0P190CA0006.outlook.office365.com
 (2603:10a6:208:190::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:16:06 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 8 Jan
 2026 18:17:20 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:16:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 8 Jan 2026 18:16:04 +0100
Subject: [PATCH v3 5/6] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp15 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260108-upstream_uboot_properties-v3-5-c1b9d4f2ce8d@foss.st.com>
References: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
In-Reply-To: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|GV2PR10MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: 6feaeefe-6a7b-46cc-2dc4-08de4ed99c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUhlMVYxdjNKSXpxT2VPR2NCNHlFVFUyWTJSSDB2d1Y5WTlXcTdIQ0txYUFl?=
 =?utf-8?B?c2tQNUY3MDFKak5lTnJWQUhvOVFQUmtNSnBqT0VnT3VXMCtscmVRUTAxS1dw?=
 =?utf-8?B?eTV1Q3ZlakkyMGZva1V0N0pBb1NSck9Ndzl5TTRidDladC9qR2laR0lUTys1?=
 =?utf-8?B?M1JOVExhRDJucVI0dHNVZjY0d0MrMDVTQlZHeTRRZkRKSDRpdTRud0JvMVJM?=
 =?utf-8?B?S2dQR0VSLzh6Q0EwV2d5bGhidERsSUdVNnpBVWZFbW8yK0hmdXBYaGQxNjZp?=
 =?utf-8?B?RUlvTC9Ib1IvV3p3Zk11ZURLTWgxTXZBSjdjL3JJY0tBNDBrTDFFbUIzb1M2?=
 =?utf-8?B?WTlQaTFXcVhTQUlzVmpVeHE5clFaZ3BGbS95SjhCMCtpVUhYcVpoZjAvV3g5?=
 =?utf-8?B?My80RzRGdkF5VkRZeXc1MzFqcjhXZzhHdWZwMkFVb2dkK0hnVnArbnZBd1RT?=
 =?utf-8?B?dThMMTRSdnpVY0MwNTZlUDZWUG5CcllQeW10SEVSVWxreEZuRHpMeW51dkh0?=
 =?utf-8?B?TVhvT2RENjBpOUFVQUt1WlgxUjRDeXFCQzRKUGJhOEprUUJNT1Y2Ym03aDlv?=
 =?utf-8?B?UFFpYUlZTCt2Qk1XdzdvQXZ6Qi90WEZFTXpYOGIvWFgxV3NyczducUh2MU9z?=
 =?utf-8?B?UUhxZWV2WS8rZVA2S2hpc1RNVDhOb1gwMGk5WGQrNzVEcnVwaVJ5SGhwRVIz?=
 =?utf-8?B?MmwxMWRsZ1hkNnhkVW0vQlF3QWplSWxwYWF5eER1RjRxTlZYNkF6NkJyT1FV?=
 =?utf-8?B?U1pCRVFrTys5ZUF4WU5ham40Z2luYkU0K3VIZHIyQm9YMnIyYTZCM0pCb1Bp?=
 =?utf-8?B?aXQzOWZjWlU4RHZodlBDU2hyN3M0TEFvY3VmdEVwY0MvSHd3QmZJSUF1ejdj?=
 =?utf-8?B?dlhsbWIzSFF3TEZaa3Y0NCtwSUdMaTloc253WFZRby9UbG5JMENiR2ZCUjZN?=
 =?utf-8?B?d2gzbElubjdRc0ZwL2RjQ1RrMDhOYTdKOUlCRFFmSm5OZHI4Y1VNb2hldFVS?=
 =?utf-8?B?TS9LMXlzVFNsZ1lPUUtFajlESjBiSmJpR2FrTnVreG5JOGtFbFVWcjhBVjdT?=
 =?utf-8?B?cFErRm5qZjRadGhMNGp1QXJKUkJNZVY3cGJocU8zQStNMXdHcXZZb0FJbFdh?=
 =?utf-8?B?eVloTVJIUDRyL3FlWHdPSUpTTDJXQVBkR2tkUFZmRkFuSTNoQm0va0lxK2Mx?=
 =?utf-8?B?b1lyTWVoS3FtemQ3TVQ1dDB0VUpHdTJzeGhnbVY4SEZRZ0d2OWJTOXhGbnhB?=
 =?utf-8?B?S2hBTDE3ZWxoQWZQZzVaZTArNkhpZzdHYnJjR1gzMHVobUk2bVp0NzB4Qjlp?=
 =?utf-8?B?WXFOdENCRVpDbGxQL2R1WDBJUXc2dEl5L0dzWEpmTEFqTkdFdFo4QVprUDM3?=
 =?utf-8?B?R1VVQlBEdnRGbExkTXRHWDM4VmtWbUVLbXhKM2dyamllVlVLaG00ZVgyUUd1?=
 =?utf-8?B?K2lCUTJCdmkwS2hlSjZGVEZJQTcrVDVCd1hSelgvV1NSWEllSy9yclJ5QTdk?=
 =?utf-8?B?UlJ4c1M2NkcyMkFMZW9QRTVKK01OanhIT2xRbVl3V1lwbWNDa0ZYLy9MWTB6?=
 =?utf-8?B?ZzNYaGJEamwva0QvYmI3RWlMd2JENEhNekluL3pHRGgvTExkTStXTytqZjBv?=
 =?utf-8?B?S2FhK21nZ0d6Y3V1NS8ybGRSR3FqVFh3eThVVUVSSVhlQVBZbTNqSUoyRmtC?=
 =?utf-8?B?eTdraE4rOTJNcThjUVN4UmxkTUIvd1lLWmEvdjJQSEJFUVdZNkVIeXFoVHBF?=
 =?utf-8?B?VVg4OVZHZUp1Z1crSEk3Y2VKRnNkMldJMUFsMjFPUjZqMVhUcWp3a00xMzBw?=
 =?utf-8?B?SkRQWkxMbGFySitCM0huL1BQdzBnMks4RXVKVlJJZ282WGIzMDVZUzVXUDkz?=
 =?utf-8?B?cGJxQjNtcHNEdXdHZk5hTFlKbmh0a2lVcDN0R1B3VnVhNUxYMlZMTnNQdDN5?=
 =?utf-8?B?bmNHd1JoUjBJUkVWUCtLakROT3JyT3A0Z1NndTd3ZDVQZ051N1pwQjVWbDZs?=
 =?utf-8?B?cEo3SkFUK0djU2Z3L1VBam9MNE16YlRWOHVwYjZVSHZPOEtqRklWdS9NNjNp?=
 =?utf-8?B?VDdiL3NLY3JGZEhwTkRZTlpsbEViN2Y1WkJwVUNMYUVkY1dqY2Rzd0g0TkhR?=
 =?utf-8?Q?lILY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: SIAFVSahnAlIDNeDYh3CopRqOAY7MbeqAH/0En827Iz42jbo2EjBWUMw11OPaWQnWwFnv7NHX1WW7ul42F+tGigdazddZnwtWlu/Mn4GlTNyBe8HJ5AHvjO8yaYTS63mXF9Y0H/MhoUZBkqWpYrl5MNL2x3uq9y1F3H6pmVLgfI4UyPqtmESHr16M77xkdCn5apuhIDdVx8yQvvRQrHsa18C1U4FaLwADaJXvScmj6SDWrEVK0WOzwZzuDVhJViNajTsDmkyZqVdOArQmB0bl10kY7Bdr3vStlVIESACD892jOh15qiEE7R12Ht4Qgk9MmnAZPiru5XKZKCf+Wr57PrUysnDl0tnk/O0+kA3HzkhCwtRytEVP/oBBTumda3OtxSkruzGbrdAnY0DlFRFnt+uXqkLuNkInn0VIYtf2ELnychg/Yw3nWI4FKLGNoBmP9BPPJ6uf1xCwg9qP/3OYZ5K5zyyJn3wf/sH+WM2BaoJfV+cIuOtHhnmYrs2glxPaquvfv5i6E7NXm6xXX70GeD4rZwNFeoYLy+ag/eZveWrowY5+7fMK4KsmGYimb6SowgJqT+/IrCPj/xumgs3zbKZtgmCovukNu294KxvMwwDMALMjWqAYoA2Bt270vPtFRbVdVVp9KybOZOkcahBE/dpIi2GtR9W8aMFf0OJPl8Hq8pu2u+RyCXpc3e57xSM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:16:06.7909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6feaeefe-6a7b-46cc-2dc4-08de4ed99c35
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091622_045394_38C1F9F9 
X-CRM114-Status: GOOD (  10.00  )
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
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      | 26 ++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 25 +++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
 9 files changed, 290 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index 98552fe45d4e..c58d81f505be 100644
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
@@ -64,6 +66,26 @@ scmi_usb33: regulator@2 {
 	};
 };
 
+&iwdg2 {
+	bootph-all;
+};
+
+&ltdc {
+	bootph-some-ram;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&pinctrl_z {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &reg11 {
 	status = "disabled";
 };
@@ -72,6 +94,10 @@ &reg18 {
 	status = "disabled";
 };
 
+&scmi {
+	bootph-some-ram;
+};
+
 &usb33 {
 	status = "disabled";
 };
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


