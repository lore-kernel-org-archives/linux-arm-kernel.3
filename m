Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D382FD5F94
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Xxc3zK6SIdByfw4TosU1MRd81eT8dzkbFGpwBIzduQ=; b=RamulO/p+lnSUXZFLANsd9SAXv
	B2wySrgb3kwFQ8bNiUrnML3+ay5NDdiHNOdckLLvrCOeugaC9VoUBTniJMYjgtEukWZimgBdattBu
	7XDcSozkBkd2zj5b1MM5j39rws5XBwE21xmuViaye6uMjMkMFuIAFlN4nx6uz+MFC19ETRT9e7gbc
	W05OUrNaQM6bKafQ2NnJe2AxrtpaoWUSRLPtjskRdzAE1N4SdDnsaBvoj41rJ55VItoydHQLbGDg/
	FfKSi/yKGQhMKcM2+DqR+PoRbBLONjSeBeUxkXLt8G2lge7emDG7jpReFN5seaC2lQTASh85/7nzS
	btDgWFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANfp-00000008Sj2-0TQe;
	Wed, 08 Apr 2026 07:50:05 +0000
Received: from mail-northeuropeazon11011025.outbound.protection.outlook.com ([52.101.65.25] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANfl-00000008SfX-3Mlm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 07:50:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8SYta0ociRZtABzxLW8PgoMgiFPWPj7Njf6yMBzvl7I3nFveryutCaVGPJ2SN78WQZLdAaz+gd723h/GFbTCXlmPO7nUs/cxMdsM6fpH/KPh5Y8kR3+umQtwu7V3lQvMf2ksD9n1m2bVAeULju0KoxTlntWa348F2iG1bL7fY17IIluF47Mnv23QzgMIZt8I5tx9+cjuyY8nmdQOW9cSO57fiGzuxVnC69dZU5z7lmKDejGb5JtOkZUgXOQedaAtv7Q/XAfB3uvj/U35hRQtQ0CuS5HqS77KpgYb1tHXGSxezBkdut/OLJ4SLqoz7eBfQTd2aHinJllYdbYo/F/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Xxc3zK6SIdByfw4TosU1MRd81eT8dzkbFGpwBIzduQ=;
 b=d9KLCe4gz4TKrMmQjvaqYSd2+dlzjM7K7dALpV1KnYYQ4JCy+H0Y6OPmByf13X000TCpS+dd6MZul9QWBQRM+WcHLTwT/RjO/pOOmjIX9h9AtGV3UmX1NIL8rVFUu5lXpHI4dfzPC/SP0LTuBGP987kJ55gznRzAyYqJvbpvhK0uhEZLYhcfKFIorl238PkwRMsqWsp6eRH4d1UZ3Z0s/S6eSt6WARcNk8E20trHkDC13p3JPX/IImOOowVZP1u+WcvpYmv0RPoH2W8DO9QhxnQxUXleIsrGOedHIPZXYMPrycFAe1vpc3nlUZ738rYF+DdA+ngzIUiRoNsf0flcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xxc3zK6SIdByfw4TosU1MRd81eT8dzkbFGpwBIzduQ=;
 b=uE/fQxMGmCOUyd8i2rFvkFB6I5BebYs5XWtWUYRf+CC1DfL13xzw2Izlxi6jxsefzTtyHtdzYwzfYFaqaM7viql8a1SZLT3+RkB+Mg8/FWGDcB/BJtULYUKrPx+ro95zTWRBHi5eK+LAuse/VTBMQ0OGhWoxY0YrZ6bMFvQP0OwLf9JfLkEvrTGIrkuFMSTO68X3gpBD0Az0edwkM59aFuNoMQrjnwXGek08lbDqeqUFuZNccUuzl0dsLll+ku5B/JGVe3UPzUGFAtVF4IZU+tRDhmckKFMBs2CsMU/gpDFr2Q7ZZijl4Zx47ICn9Whgw03IDpN3gMOLlcSXeQkd8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 07:49:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Wed, 8 Apr 2026
 07:49:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 08 Apr 2026 15:51:16 +0800
Subject: [PATCH 2/3] iommu/arm-smmu-v3: Populate PMU child devices from
 Devicetree
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-smmu-perf-v1-2-d75dac96e828@nxp.com>
References: <20260408-smmu-perf-v1-0-d75dac96e828@nxp.com>
In-Reply-To: <20260408-smmu-perf-v1-0-d75dac96e828@nxp.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR03CA0096.apcprd03.prod.outlook.com
 (2603:1096:4:7c::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd0043d-671e-4c44-4ec2-08de95436e2a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|7416014|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 17qVDToWPTHjpDEJn1M1OYwiAG7++vdKz8SyTnyEsK7PlG77JDtKuVjYmmjQht8ifoCvPAODSM9ETuz1VYa1rCOPcT5b149aMnZ0D8KFE68AqkAQo4WBK9zAKyaZRsbFQc1zmel0Q8QVbHft+t8x6YTzw9IZ2ghZSzCGjK2a3aNN0IZzll9gRGgYcKZZO8cNeYz9pqL05KsEUWT6/CYCXIOFZqC29Gcr9KrgokufEHp9+rRyDKbxsORQzybO35QY1nlZVpmlGCSi8+08nnOfZiUaouU5RllUQO97DxFFo0MpzI2otB3TFhpiVUerLJ5Q1oEy0nfJgsRi/xmjzoQEBPbI/r7PpC43K4LXbgSz3cfcfxYn4RACZIx4VVkpVFoycKiP+Yoltxxxqajd10PUpWyNqyXZUZYhymU2Uce0fuAsVPu90UVxEkzw4iutuU9buFmJYuGa/8smUCyZJEGswc8q+5wngqzeWLaP68WccrPw/Qm+cFEu9yqUHnxRZaiPuzysBJlngQV0Y2e7al2ED2hQ6d1H6te0cYkX/9/sNXqvgKT4bLBs4tFQPeiyvqpLo5T8QAozwJ2HjAt8vVMFga3JYNpXrIeS6fn1NTT062TO/Jq+viBehccV5dkw3kfV1wVpRgVyH7AxufR/3CVrjOPK45Qpdwqz5i/S6RZW+wUWHbf09rDBHWiRybQ8yaRnBru38JiRk89qcsUITst28+B7tjmY1wER0mdlPlgiebEjeaMC/mlk8a3LlD5HqhYNl1cLud6H3wRA6H3yeJUiZPHTOvza7NMKgLBTR8Gd1XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTh1dkY3Q1loeHlBS2ltRlB4cGhCQzhrV2pXMnRSZDlwZ24xVXk3VjNNdlJR?=
 =?utf-8?B?Tkx1UXp1ZVNwWUYyYmlManNJYXh0YmpUcC9UVnlpaEJ0dkVkZm9VWkVIaE01?=
 =?utf-8?B?c2k1V2EzUzFRV1BuU2R5WTZlZnZMdmNMRGw2dHFybWI5cXVRd1IrdTlwcXF6?=
 =?utf-8?B?WkZOcWhlNkxLbG1zQ2Q1dGxuK3VEMG5nbENFZHNVd2Q4Vkg0N1Z1bkM0eTBT?=
 =?utf-8?B?bGw5c1kweE5YallBc24rSnc0VHdzV2szNnpNc0xCVG9YVS9GOGVVdmZrY04w?=
 =?utf-8?B?cnNUV3dVay9YVzhzR2tPKzdob01kUXY2WUlONkVyTzhrWkIzR3dyUTV1S05M?=
 =?utf-8?B?N3ZXRUdZOEVyNzV2TXRGOGVKbTViY1lYRFU2OVpCZlRrWHBCWWFTSHhybGVJ?=
 =?utf-8?B?NTU3Z0VhQ2JVYnZaM2NlQUtxNWxhbUtqN2p3bWc0OVBrcEFycG1tYmNJT1Qx?=
 =?utf-8?B?SEJaajFZMUptcEt0UDl1NWlxRndTcXl4cmRUTUpHSkk1N2dVdnBBbk1HY0Zo?=
 =?utf-8?B?QzBUdGZJb0t0Sk85ekp1YUV2TWRCT0I4bzV1VU95SFErUm95b0lDYlY4RUVW?=
 =?utf-8?B?WnllMFEzSlcvU3JOSzF2eThvcm8vTDd0ODBRNXZhUzYzQ0ZHY3o2anJGbklP?=
 =?utf-8?B?bDdJMlI3dkUzQm5IZ3RrdWtOUnc3S3J6OVkvR2o5RllrRFpWUU9wY081UEhV?=
 =?utf-8?B?elV4d05sOTJQOStBT3AzTjhlOG1VNFNPUHVzVkRyQkxqeTIyeWs3WldRR24w?=
 =?utf-8?B?UmFZY3dNWGdHSEwxNXYxektCY0VOcWVSaTBGUFB3ajJhM3ViR2RGRWV3V05a?=
 =?utf-8?B?b2RhL0prcy9vZnkzWEs5WlB6MjNTOTF3UWhxRkQrcjBPeVhlR2NEUEtkZS9j?=
 =?utf-8?B?SDEyRkFKU2t3bTE4M3ZsaEplUmg4K2pBSmVkNjAxY3RzMjdIQ0hselduQnRR?=
 =?utf-8?B?ZFpzTGVkcFIwcU9pVUxzdWdGTnBvdnd6RkxRaGNsck1ScGt1bXhIOHNMUlY0?=
 =?utf-8?B?aUFGcU9oZ1FramVTcXpISXBUNzMxb3M3N0RLbS9mZHhmTUV5ckt6QkQwU1Az?=
 =?utf-8?B?T21lQkJTeEMwNHVQc05uN3ZzOWVZcG5Ic0t4UVM3Rk0yRlBnRURqRVU3UmFF?=
 =?utf-8?B?cjBtNE81MzQxQ2gwaFl3b2dGaFQwRjFBVXVURXlndy9mVU5CV2h6VHNNMFNi?=
 =?utf-8?B?M2NyM0ZYMm9hdWczQ0xmaFJhamlPbG9haXJlNm5CRDFBWmFtZkl5bHdVUW50?=
 =?utf-8?B?RG5jcXdIa0xJSjZTYit5Yk5DcjBtU3duL0xwTjRJUjBTckJXR2RhV2dXaStw?=
 =?utf-8?B?TDdZR0NXeUxaU2gwaGZCOUl4SGpoYUtsaXA2bUNKREJOL0c2NHhPQnZ3TFFk?=
 =?utf-8?B?WS9nRER3R2ZCMjE5dk5xUWJpMTBFV0FsRWpkRWhrY0xsN1BvN21GVGNWWHNZ?=
 =?utf-8?B?NTdEYzdSYVozMVZSYnkyM1kwM3k4WTBQR2xxNDQ1anpVd0IwelVpdURQRDEw?=
 =?utf-8?B?RlkzK0kxWU5qUTBGY0lPVXRrbEp1eWt0anRDTytsY2o5ZzlzQ2Y0cUhrQ2VS?=
 =?utf-8?B?TWIzRTM5bG14VTRPemVwaC94eDlEMEk3WUNLV2tVTjlxUm5KWENjWXFQQUdj?=
 =?utf-8?B?Um9hSlRRVkgxUk5JQVYrN3pvTE9QbWFrNGI4c0FKei9QRG9XRmNCc2xCdndx?=
 =?utf-8?B?NlVjM1RmSUdKbWczRWEyZEVkRGovV2FmL0UrLzJvbmFjVFBWNkhuZzArbVMw?=
 =?utf-8?B?dkdta2E3UW45d3lHMEJZOHRnNHUyL0hrQ2JkQVBvOGVVYnl0QXlVTXlFT1Y0?=
 =?utf-8?B?SFl5ZEhDTCtxUVVVMlNERjM1Z3c0TWFYVHEzVm91VDY1SnQvSmhjdFNaSklm?=
 =?utf-8?B?aGI2cFlwRjNrQzRvdE5yNEI3UEJTcHJOOFlpRmQ4TjAxclpldzloQWRSWm8y?=
 =?utf-8?B?LzM4U3k0M09PbnZKR29RQmx5T3M0NFhkZGFtSlJlbXNIL3B2YzlDTjYvR2VH?=
 =?utf-8?B?dUdMU0pOQVZrZzRNYmVtMWkvQzNGUjVTMWwwWXB2MlNwNUUzbXdWUHpLWjlE?=
 =?utf-8?B?MzBaLzAyNmFQNFRudk1aUW5rejk0ZmNBREZ4ZEY5eFVvZS9PVHdROWdIU0Ew?=
 =?utf-8?B?enYvRzZTNlNqbEkxNURlZ1BTQnRSUXhudUd4aXRITHJ2UDVTcTdidFJ6NjUw?=
 =?utf-8?B?Njk5RWdZT09UYVFRd2tMeVN6VWtBQ1VnMUZobGdGM2FpS3MxR3JNcEhGU3Zi?=
 =?utf-8?B?alBaOGNqQm5uRjdCT05wZXVUTnh6YjllcWpMVWt1dXU5eUZSUHp1Y3FaRTdO?=
 =?utf-8?B?M0c2WDc2QzFTOElOd1ZXRzU4ZkpQa1hxRmg0ZUVEQUdycStDWngrdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd0043d-671e-4c44-4ec2-08de95436e2a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 07:49:57.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IC/YcobRIatFizny9J4MzOlfKuCikdTsJudCxKVr4pqIMnuXVOMYiqJcjd/lKrEiC9xNxyE3xW7pmUK6U+ydsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_005001_856754_5C5135B3 
X-CRM114-Status: GOOD (  10.04  )
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

From: Peng Fan <peng.fan@nxp.com>

The Arm SMMU v3 can expose optional child devices such as the PMCG-based
PMU, which are described as child nodes in Devicetree. While the binding
allows these nodes, the driver did not populate them, preventing the
corresponding platform devices from being created.

Call devm_of_platform_populate() after a successful SMMU DT probe to
instantiate any child nodes associated with the SMMU device.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0302191c3c7ec4c6d7564062f6236..0ce1d41c5ba6864ccad8291551f7f5c91c27b3db 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5363,6 +5363,9 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
 		tegra_cmdqv_dt_probe(dev->of_node, smmu);
 
+	if (!ret)
+		return devm_of_platform_populate(dev);
+
 	return ret;
 }
 

-- 
2.37.1


