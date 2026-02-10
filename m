Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E67EA3F38
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 10:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzomWFjhUJqBNH0ueCecxQWjP2BPVUZ8Gv1NnrbOK38=; b=zA8Arbk/0aDIS5CuNnBzOeZrFf
	3eRiTX0kApzznLJBwJAldbMBYeg+GTRX9qO1vr1AFkWKOVzoDZgp+IxLVdEzkTnnaqcb7OgGQ10uE
	4qbHtiy4KDfcRrVBKtRmnyLDzPmV3m1up7h83nqxi+/K6PR92lv4PO6WF16ai2pt7/bkcvpUUhgV8
	vCDrD44KGN+wsFBp30PxY0xNFTq+OT8OJ97BL31zLgQXSvV4YZ7ILUJrwJT7hxv6JaE5HTJqs/Bh+
	UeEbj9l7b1sn/2TFLfwxP8FEy+v964EMk3g0AQw2Jl9/pbQDDft65m2O2DEaWHhE5vXEK/mj/ssqF
	HYE7FLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbE-0000000GnqP-0iha;
	Tue, 10 Feb 2026 10:04:04 +0000
Received: from mail-francecentralazon11013007.outbound.protection.outlook.com ([40.107.162.7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbB-0000000Gno2-2C5H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 10:04:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7+ZjhASVU0SxCylmKsBAM57ZL2fTDfzUIo7W/etPKMUuKb/vtvSF/0UEjDItr0L853sCipPS5MS93d/4s1cxXKuV86tiKd3ifYGVZEwKy7k3GKG+UG1BHV7CdUw24gJgO67ilb/gzceHFjmbHsP5BndazBF4B5CzkDDLDzgyqJi1Sp3wdpil4lmOAOxCYQZ0SEhaW2+EMKtyzx4CZmHVCm4n65tli4k1Wxp2tlUkXrzBJepY58/1nt2VdTCnr69DnvQ9O9SVDSJ4Vmcg6bXfmjB9+mmB4XRYQK8eLI7mcKJtsR9pSvCIdcCw4eDxxZZWAXa6Z2Po7kCLFACr8n52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzomWFjhUJqBNH0ueCecxQWjP2BPVUZ8Gv1NnrbOK38=;
 b=vQiCoBUT+aJS8JQ4k0SRvExMUtjnB5Pq2GqRHb9Gx2zWd32ZKRjSrDWGcpxVJMAwVM0KL31qXNlw+lFciFhlEsYooC3l1Ohu6/VodB3hY4M7E5pkmQ7N+SU6ujzjYcgQBxSM10Or2yWRTa+ErSAfUAqL9rXDE9bBwbSq88xLksvofHGD3ui6XKA1v2llCfbU+6QcKXLz8nfNthBW3Hz4Wen5FIrK4F3qgWrDx0LBLq6lvAKlgyvQtglQphHuDPEKWZGfmomsR3C/zMoPX8LSNRRWJXFdceTeg2EoFafOUen4+ZgGWopudClF/7cZ420wGe0BM2wIg1MQvRuJ7MG5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzomWFjhUJqBNH0ueCecxQWjP2BPVUZ8Gv1NnrbOK38=;
 b=ga8ryw5fI/OEgU6AJ0W44OgquSQCl3BOSRD0L08WYZihZvc/ZZmozpcLCSPKDjkDL12mNcgm6G9vyQd3WWYv9GQVe4edHkTSRbhvx2pFW7IX1SQuG1hOG8xUQt3wTxTxUp9OcQRfQtQYURf0a6ZXoaZTvWZXRfdzk3WilVctVzvmBRzvkFUytDiHy50I8gkDqQmuOYcCj57nSTvNRc5g/04OLMeBmifowsHtUkK+ChMPAievGMeECJ2Bzil9eotHjyjFFj+CvPhERDD1Dflf4YHXLhP1wuKhQtlHd2/p2BIyqp9H1CCyuFqPMBz7igzbO6P8jbbSo8NYlhQx4mfTlw==
Received: from AS4P189CA0044.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::13)
 by AM7PR10MB3336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:106::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Tue, 10 Feb
 2026 10:03:56 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::e) by AS4P189CA0044.outlook.office365.com
 (2603:10a6:20b:5dd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:03:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:03:56 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:05:46 +0100
Received: from localhost (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:03:55 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 10 Feb 2026 11:03:58 +0100
Subject: [PATCH v2 5/9] arm64: dts: st: add clock-cells to syscfg node on
 stm32mp231
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260210-display-v2-5-0592bd514958@foss.st.com>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: Philippe Cornu <philippe.cornu@foss.st.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?=
	<rgallaispou@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.75.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AM7PR10MB3336:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3155b4-8d76-44f2-88e9-08de688bb3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGVNa0VDU29IVU1Ubjl0ZHJqWkx5RUdqMS94b0REMW9NaUdYazVxMjVzdGdp?=
 =?utf-8?B?Q3FSZHl6a2gycXFQNC8yNzhNSDNJRzdUcGlyV2ZaR3RSakpiNGNBZFdtWmZM?=
 =?utf-8?B?Yzk1OStZZ0RJOVF2c2hKcTViLzMvd3ZSWmw3YXRGM2JJZC9QRmZLR1VhMVhY?=
 =?utf-8?B?UmtwNG1uUWU4bVdyVW5mdEVRN1J4aUt1dnlvN2NxdmloTHpBbTFvVFNiRm1P?=
 =?utf-8?B?K280L1cvWWlnWm0vYnFMYUpLeW5CS0RyMC9QOTlJdkxDdE1iR3J4cDBaQ2p5?=
 =?utf-8?B?eVhkVWdhRzJpV0N2YTZGb243RTRBZ2w5WkRsTGllR0VIMmlCT0dmbjRvRmFw?=
 =?utf-8?B?TnlFODRJM2NwL2tBUFFVTHFiUzV0VVZhVjJISXM5alpFNXI0MFozTnE0YTdm?=
 =?utf-8?B?Q1lUd3E5NkNteEQrS3J5T2EvclArRWVxdHZKRytVY2tpNmZNTGp3dE5mN3ox?=
 =?utf-8?B?NEdCdC9FQmNXUWh0NDhZTEhQZjhQMWVMY3RnMlZsNm5QanJxbENEUEFFLzRX?=
 =?utf-8?B?NXZ4a3NLR2RPaVFtY2pBdU9HTDZCdUlkYm45Z1JxbVE5aEtqS0VSMVVneGpR?=
 =?utf-8?B?OXRFcSsvTmJVa2VyZjFHeUxEUnNrMTlvczMyU25XeEN0THNXaFBGUE4xc1hu?=
 =?utf-8?B?a21zVGV5ZWpleVFKcVJtNVdVL1E2dGFFWXZWN29YSGdRblo0VVd0dzFEdDhS?=
 =?utf-8?B?d3gyUFhEMFE0RTFXaTB1MjcxMEpNYTNJRVZpTklDYXZvWHUrTy9iU0U2Q2c1?=
 =?utf-8?B?NEVodnh4ai9ldmc3VDJtcFdwUXhpQTRvK1JkOWE4YzNqUjVRV0hDVzdEbXVn?=
 =?utf-8?B?R3ZFOStzeTFJWFhuT3NSTkU0K0tEcTVDbVpZcWJLbWlhb2VMRUJMN1NieFAy?=
 =?utf-8?B?d3VhNnVFNzBiUld4TGZlbERrTGlXOG9vUE9HTnFVM010MVpOMXdSeHYxL0s2?=
 =?utf-8?B?TktQVDZMWWFYMkJTeVVBZ29POVhkSHoxU1pCeElmanA2SzA2L041blpqbE5m?=
 =?utf-8?B?a0dRUWJRemRyWFBTRjRCbFVKWkMweEFZOVovSG14VCtkRDE4ZU52ZWNjbFhE?=
 =?utf-8?B?MU1lVTVyMVpjeDdvcVRURk52UnlhRzFaaE1UdlVTdjFiT1dkcXpCbmdhTE5Y?=
 =?utf-8?B?bk5mV0lDZ1VVVmFndWtoZVpFK1dwMThHa3dSTEpjcElrUU9oUG0rVjd2Q2lO?=
 =?utf-8?B?aTluQTFISTNMRFFaRkY5U0J3NzY0NXVZczdIdzhpNlczVkFsS1lFK3BML251?=
 =?utf-8?B?ZW94c3JMdjVmRm5OL2FhSWpYZlBDSTdaRjdjRHpUZGhtU21UTkZpQWpWYzlY?=
 =?utf-8?B?OTZaVDNOY08vU3dFL1phVVpBK01Tam9QNHhOUkUvUG95dURHbjNkS09qbysy?=
 =?utf-8?B?RE5MYlhFVGlQNTJPQlF3RDVTT3gyRzN4TmFidUczM2ZhZW1YWDNTVko3dkh6?=
 =?utf-8?B?amFzdm1qQVhERDFLWGljbjZHaC90ZUVmU1ZwbEk2VzZNNjlCRWtDcnMxUWNY?=
 =?utf-8?B?OUNUTWVORHhMcEVuV2U2NHlzZmtFWFBIb3VUUThydjljN0Z2NnVLMk9Nc2w3?=
 =?utf-8?B?c2l4TFZQcktYV0t0anpTWklOSkFaZkJzb0RoMFdxZHh3NUkwaG9ERTMwOGxo?=
 =?utf-8?B?ZkFpZnpxYnpqakgxczJaZlVDS3BlcnE5YWNQV0p5UCtSR1hnSTZEV09JajVB?=
 =?utf-8?B?b3R3UXp2Vk8va2NIbCtmdnhpSHJ3aDhlM1NmR3dNaEJRaVMwNk5XRGlCcUpW?=
 =?utf-8?B?UUE1b2Z6OUVRWFd1RTN0MlZQcXBmaUFYM2NHQ2t4RWZnMUNUZXFwc001M3Zp?=
 =?utf-8?B?RVJBckpxT0Z2S3VoMk5hbElrSTJONkFLWVRVamZXWXU2VDBuZkwvREc3WWpu?=
 =?utf-8?B?ZDdLS3YrQVpYU0ZOVkdrU00vZ292OTh5bUlyNFp0K2VHbDFSQ3VkMDVyNk1P?=
 =?utf-8?B?U0NKRVdwb040UFlXWnh5dllGTTQ1RlVqS2Urb3l0VW91Mi9tZHJLWmdsdWNt?=
 =?utf-8?B?N3daN1Z1SXBBSnZpN2lOTStTN2loU2g2WmhORkxJWEdVOXRqTUNrTmE2alhp?=
 =?utf-8?B?dExyMktWNnA1VXlqcDJ4TTA4N0RTbUdrbi9hY0owcjc0d3QwN0lUOHczaksy?=
 =?utf-8?B?WldoUUg1WTFsSmh5TEpEbTVHUW9xdWVNSTlUV1BYWlRVZDROcnhWeFF4U090?=
 =?utf-8?B?eFJQM2FSVlAvMHNuWG0zR1UzU3huTVhoSkl5KzlSNVVVNGZpVVI5algzQ0Qw?=
 =?utf-8?B?YTEwaDRzeTMrV2NoZ3JGNG91WHpBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZZogJySNKdl3BMLQBR/iBoCeaPqgP615nJJUCPo+MEmN5xQivpa/BcnWVksJFYpVMs9/nLr2SZjFSZnE0Fmzc318p2b5piLe6unylu6AUKfjd95yblfwo/xjI7Gji70/qRj9+whPOzT643kCm2XIZNvVkVAm7abqXdV4WYcCh++nwpdNb7R/CuaDr+wQOEuBKb2TUXovuYQZW/UKUcBUlfq0GVLLkMTMVCp4ncEhLX5Ed7pf37NI2/WgMaYNJLh3YHlhJC5zN1TOWJ1nNQNCNogit1y2tD4EfaLrxYxzDooq5h3fwnXwIs4OHxRpMK4lgwcweY3kH+r6eJGntoOYDG9Q5Gx3v4oeI1ZT9/PRromRUDAKlU3dAP8pkCyPvoqb2iQL2TYI+gFogq840ed/DV1cRugQyJdoONBp77N2CNSAwIaW5M/+aftx2OIvNsbN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:03:56.1776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3155b4-8d76-44f2-88e9-08de688bb3fd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_020401_566130_10EFA98B 
X-CRM114-Status: UNSURE (   7.38  )
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

Make the syscfg node a clock provider so clock consumers can reach child
clocks through device-tree.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 05055bc523850282a2e2b217b180930b39231189..74df739d8f8cdc82922cad9993486b97c50d9084 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -961,6 +961,7 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp23-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
+			#clock-cells = <0>;
 		};
 
 		pinctrl: pinctrl@44240000 {

-- 
2.43.0


