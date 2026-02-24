Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43BAF3C99E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C1z4Kh9U5yC+A1wVAddKD8P9gjD1yb1wUmyNkEkI8M=; b=hfbp1R5l/SOwMGRu9hVBSePK7F
	LGVC/xS3zLU1lJW3r25+WEl5/++UDCt7AKxVpxgEQr+g+d5XRPY11Eu9IHlbuBhN+0z7sXqtz5RKV
	dW+vmY5VoAF58Ddu7y4zZg1N3uVsoXgcOD86bw6qeLRVrhzXMbpdwFrkbU4GGvz0kw7j7IoOd5fT+
	vpwuHTv9G8D7QTO4X4D02TorM73xBlyaqFHTifv7AMq48Y9b4IU5ZkYLpoOTGvcu11WrlyyEajZ48
	1vpikiEXMa2BfVLX7Qc3FIXtQxH45h3LoeTvb/rzihZn0FsYIZN4mnlxylegGQwMAGg86QQHJ5RUm
	0w+jw1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuufU-00000002LDJ-3HLR;
	Tue, 24 Feb 2026 15:49:48 +0000
Received: from mail-swedencentralazon11013047.outbound.protection.outlook.com ([52.101.83.47] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuufM-00000002L7p-1jw2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0Aylr48nz/mz2XGZiG7vEodnOqMdrJZyx2p2o0oh4EGfhO0XfaXSbTwc/yx+piHtfarC8yY4HH34YDrnBm72sz1/Gf1lUumWc7sWd4sfsKFnY3R2ACnNQe2k7qndc/z2Y1t9chq9WmRwD0Yb00FJWzE9kW9iDPTtNNF1g91R68fOqpKmcSa37wE+EJliP+5POhoKcSXGTxR7Cwl18p3lJXNJkpAhZ8of9/aVhMoMYWzj3gEn/wlHBQGOQlbQ/RfBsfvI8kBGPrNlfRPLja3gf4WO4dlfC1lCo0qlfCepqsU5/HAXxnpK0uzKN7dg8L0Zw7ueB809ABvKbSSsnYW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0C1z4Kh9U5yC+A1wVAddKD8P9gjD1yb1wUmyNkEkI8M=;
 b=AOR5KgagApG69VJrQZeCc0rn8WYclyjMQhDpJVmpoz6vcbpr1BexvADwI8LDKIEFOyv6tRid6gep6pKe53RIIY722n2vM3xKlx56L+6iCOJe6RW/EbL1F6ksSyWYdVnWYDgyr/5jwoiK8+qYhoE6XR3ojo52GyH87Oy/6kelpgykI7g0jtdcyzvf4XT7uvQvHV2XDPRqUx0dMQAfQO792FHFmY8uP9xjjmtTOp4qRxOcnLeod9NslffWJl0qzjSggSwa0urIL7mI+Vf7A5VXE/WVLw/xQV8PKAy9/sjwkbEm7ZGPm7LdT1f+fAzSIgQI7mGVhfjT0Rnuxin9COB/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0C1z4Kh9U5yC+A1wVAddKD8P9gjD1yb1wUmyNkEkI8M=;
 b=bWx/cJQzmZ53BIS7t7F5MEGacr3XfZLQWlJiOwxnUybH19KtnDDbp3lBtLNc5wT5DqF3OzevuhI5WdXq6OWfDsmL7JRlq3BiH5M4KyXW5OlZbRPCjVvUctMLSYmCb3ZnwKXF11r+egoRTvaL4PZ16LfqmGF1hZLxGajfzVZDP38g5VIs6fLCLfxPGa8/UdTwVkImM008ioMFrxE2Xn+3K6fvxQDHnfaXcRIWQ39gARe+YetzqQ53nNXv4CWDFplK0yAE4oqgjAkBtmLDc55CPYuvshXWtMUtO2x81TJ3KG+uFv9Tftn2qPyEdn9TjNigLIUldTFsnm6q/hWW5N7J4A==
Received: from AS9PR06CA0501.eurprd06.prod.outlook.com (2603:10a6:20b:49b::26)
 by GVXPR10MB8528.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:49:35 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::af) by AS9PR06CA0501.outlook.office365.com
 (2603:10a6:20b:49b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:50 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:09 +0100
Subject: [PATCH 6/9] arm64: dts: st: add i2c2 pinmux nodes in
 stm32mp25-pinctrl.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260224-stm32-i2c-dt-updates-v1-6-347cf6fca7d1@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|GVXPR10MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: d685a364-c76d-42e2-5e1d-08de73bc4ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bC9XM3pDZ3dtRXUycWlGNXg3SkhXZjlnQUFSM1VqYXc5RCtCY3JORVNDWU9K?=
 =?utf-8?B?RUlWSUpNQjkySDdDNktxaGRJWWFvRVhoREdVZWNnbW9xTURlSGcrL1hyOW9j?=
 =?utf-8?B?UmFuY21RN2pyMmRQMC80bkk4OWZKZ3RkMFIwZjFlbWtyRmdiNDFmYmxTVEFC?=
 =?utf-8?B?WllNU0xSSnNkMVNEeEwrc0hnL2tudWpya3ZqSUdJdUdnTnNZNlNMN09YaHpY?=
 =?utf-8?B?c3ZXSldzRksxQkhCVm1KQS9rSkVmMTVVUUp3MVFRRTlMeHlKSTRYRG9iK0FK?=
 =?utf-8?B?YnpJYjFjYVJaaytucmlYRlRLQzV2bXAyVi9kS2s2eUIwTnoydW53L2lUN3Mr?=
 =?utf-8?B?UHRVRmpoNDZYUzFnUnFjWUhQZzUxWmFMaHNEVU1jeEpGUnVvdkpXZDYwMlJX?=
 =?utf-8?B?UFlyN1JwMkJUWm1kZlU0cHI4aXdIQUs1ODhNYi9MTHpzeUtiYlJpaW5RdUkr?=
 =?utf-8?B?SUlHRStjcjg0ODkrZ2s4Z0dpWm54TE1CcGhsTm5Ia0N1Z0Z2Qk1vcE9JVVVC?=
 =?utf-8?B?VjBXWXVhb2M2NWx5WW8rUW5tZlRjMmlPRk5OS2xldlNoeGUzSmF3ZnBNYk5Z?=
 =?utf-8?B?VmVDQWhMb1BOTzQxSEFySzB2RUhFTXZqTVA1TytieENjbHJyUXRuamRvbVFq?=
 =?utf-8?B?eFl5b211aTJwdGdzZkJXMXFZN2JZaFVnck1hdm1ZZTJHS3lnbi9JOFQyMmJk?=
 =?utf-8?B?a1MvR2JNSklnT0U3SG13cy9rMXp3RGhsc08vRkF6WU96Y0NxZGRaYVNjQUdI?=
 =?utf-8?B?enhPOTVUc2c2SVBkM2xncU52aXNRNGRaZWpXVU0vcERnOTF3YnhTaFVTckdp?=
 =?utf-8?B?RkxKZGtreUllVmt6MFh0KzNxNnBqRGNNNmpXS1NGR2xTc1ZZZVZyL1NNZHNU?=
 =?utf-8?B?eEVUcExUYnNsU1R2ejgvbkJlZ1NLeW85SWVIZ0JDb0NvaFZ1djM1WVdOSkQ5?=
 =?utf-8?B?aDl2Vlhkb3MrTVlaWWJHNzEraFlPNVNUUjU2cmV1Qmx0d1ZjQWc0azhKWk02?=
 =?utf-8?B?ZlpXZ00xRVZwR25hdmhLU3dlWVlydVJUd05wVTBZdVVGeStkV2FhRWhZY29M?=
 =?utf-8?B?Q1J3ZlNHMlZBL1dzV1h5cHhDc2ZMdy9GNnprQ1IycWpEcEpnbFRGemFVdkNZ?=
 =?utf-8?B?TGtZRlZxUjk1T3BnQ0VLdlErRHVicFk3eVdKUTd4K2xGd3FKTnZoTkE5UHFq?=
 =?utf-8?B?RThUYTBBdHF2OW9Wclg0SWFpZVhrQXNmQXd6OVN3RCtMdDc4cFIycUFrQ29t?=
 =?utf-8?B?UVk0VnhJSStWbjVXc0xzS2RHRlRWbDVkU091UW9EaUliTU1HbGJkYWRWakpJ?=
 =?utf-8?B?R1hhemJmbU5hTEVVR2VFQ2kvRytHN3pDYXBGRnZrUmZjbHhsY0RrYjJ5SGZ3?=
 =?utf-8?B?RElWMGdyenl4bUtkcFh2NnQwa3I1Y2pNeUh3VzczYmlYSHlGbFh3U2lxaUs4?=
 =?utf-8?B?M2d0aFVwdFRPcVcxYXlSQUovNGs4SFR1ZThSUmhRUU04T1pvVENmSHN6QzQ4?=
 =?utf-8?B?SGh4d3FVRFd4NGdlNjhxUzZKdFQ3UzZQUlh6OHVwRlJhRDZzaVYzZUoxdWV2?=
 =?utf-8?B?bHdBU1dyclRQNGZiR3E3ZDlzeEtEU1dCV3gxT1p6TkRxMm5oQmZSTktuMjJ4?=
 =?utf-8?B?dU1hZUdpNzZ4d1V1S09MeEEyNURsSWlOb2tpblI0N3YzOW41a1RBS2o2dHF6?=
 =?utf-8?B?dkNtVGQvRnl4NFBrY2VnSkdFbis2R1hFWjE4dUQrNFJGRzVTdnJ4OThZN21q?=
 =?utf-8?B?Wm1XYlVCKzNVbURnUDZieFh4LzRKS1Avd3NTQlpSelZ6dDZyQ2tvOWR1NitQ?=
 =?utf-8?B?S0Jqb3VXV2FNTytGQWR0MHhzazdxTm9abzI5NzlieEtYa0JSNHJvZDdaRnBE?=
 =?utf-8?B?dTRXVFA4ckNUd2d4RVBzWW0xS28vdjEyaGdTeFdPWEFYTi8zdzZGYlR3OGZ6?=
 =?utf-8?B?T05YcDVZZTdTNi9ERk51S1I3ODNwVzI2RXUvVkR0NjNlSm43OE13RGIxVTlJ?=
 =?utf-8?B?bHVyY0RpTlhnTG00SXVyWFRUTkF2Z1lOTFJCUlZvQ2o2MFNsbjNmT05OV0hu?=
 =?utf-8?B?NTY4TlBWRmYyWjJuYXNDanFQNGRrdGJ4WnE1QzFWNXZKSThuU1RHSVBBM3B6?=
 =?utf-8?B?M2E4bUhTMzVacG92RmJjQmhLZ0hRcnpoT0VmSDlnZmpUNGJPUmQrcFdPODd3?=
 =?utf-8?B?TUEwQVE4WWFybVl1R2hiVXBZd0NrRXA2UkNlM3J4eHI5ZzZna1p6RFZFb3RO?=
 =?utf-8?B?aXZvODkxa092bEtnWW93V3F3S3RRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6z+aMErfizO6oETCjtPtiFyDBvgiLhbssvql+2g/XBHpYuTwjYoVacPaT/2SRKCYrDU5BJZxmYNtaPKJI72WQ2XJf9xxIt4mTGLuxa3BCepxUT7PEh8DjUX5HssCDbqpdg4tPckbDHr1YY1U1oKCMhDikrv5L3NHBZ1JhMY/8s3WZY6nREw//hqJeO9m8hWMyF48tEo/nhQWieddeG+1GyRwcSBNDBhXq/j76bkGWHAzYh4PHHqoB3wcAwPkU6QL6GKNgbD+nzAF75DS+V27ktiqjld0qNgP5Yd2tMuQrNlYNNTrRzTkpiyE6mDk+MgmEvKUVqdV6XVTWzjoPwwoshokmvlFJH9xJ8YrjZHfX0xQi+s+0HXfV4WIM5uEw6hZtx5i0xKG1t761V3k8grFS49n23kpKvHEWX25u0y2kGFsO3e5Qy28LSFN8PTahTIN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:34.4757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d685a364-c76d-42e2-5e1d-08de73bc4ec2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8528
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_074940_459991_2BE0CB46 
X-CRM114-Status: UNSURE (   9.90  )
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

Add a 2nd set of i2c2 pinmux nodes (i2c2_pins_b/i2c2_sleep_pins_b)
in stm32mp25-pinctrl.dtsi in order to be used on the stm32mp257f-dk

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c34cd33cd855..2f853f3fae6d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -212,6 +212,23 @@ pins {
 		};
 	};
 
+	i2c2_pins_b: i2c2-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, AF9)>, /* I2C2_SCL */
+				 <STM32_PINMUX('F', 0, AF9)>; /* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_sleep_pins_b: i2c2-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* I2C2_SCL */
+				 <STM32_PINMUX('F', 0, ANALOG)>; /* I2C2_SDA */
+		};
+	};
+
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 0, AF10)>; /* OSPI1_CLK */

-- 
2.34.1


