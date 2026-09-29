Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C593CA5FB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYEzPh2HCvulMM7n8NLZihzPYqqg9U+hllx69esfCrk=; b=rRY50a8KSge+nF2MQdPROQAt1O
	q/b6G65gobrk3oMzWiuJcWLLux3JxB4BO5x1OYC9XYyu/6yZbDdDEciJdVaM5Vwntkt/7q3uAdndn
	YjxxiRzHCLSeypCXvLPuAlKEf60y1/XLazSuXespuWVcP2ePzRiHb0fB7NHdnn3zTbrgxTYukiGXd
	oVXialgFbuw/8pDpidiUxyBWwdZTV+BQD0rqZlez+ikLcm/UOCZpl79vA/e7OrbdPPwgHHTSG4A4t
	JH4HYgF512dkoPp18UFAzvLYMni3Gx29H21rKFYb1urIELAbXoCNG2lOUeNjyx1y2oLA40pfHkjGf
	WkQqK13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUn4-000000034IU-3v6y;
	Tue, 29 Sep 2026 10:10:26 +0000
Received: from mail-northeuropeazon11011026.outbound.protection.outlook.com ([52.101.65.26] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUmy-000000034AD-0AbI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:10:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYIMsHWZTQT+xl4HkgN39c9DxCp8WZxlQpQ65H8kNC640P/EFixwq+fndl+fHPLlPwp8zJ5ggF/RKPsks4yS6I/sDOz5XUz+A1nKkgWxqqqSBy4iN3nLr17SG9YfqOeBw5P5hDrczPDrrqbLjyRM41Fam6Iyaoe171+uobppEN/lnQ1rtCWXCMU5OG8kwlJN7hteXTIbmn/8KZ0wprQrHT1A/4WS6PSyMJX+3SrVK6OqEd9x6mRggnMlfhG4gBS4tD+5v0GBoXPF+idvQsfqgVyH7thlCoGyxjmJPRRZIVaC0d4IZ2GuWJ4PjQcGQE7akt34PZ6nt3N/mXPJT1F1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYEzPh2HCvulMM7n8NLZihzPYqqg9U+hllx69esfCrk=;
 b=tfP1DbsPCenrQD1ndytkfA6I4n02AEKH2j5upyyIbkV/HNpqOSIEBgF+S+QaQ3fc+jMDX188x2JJ+zSgtILowUQCtw81jEMGLZG20qFr+LDCSBSHblY6kKMPbdO15ZFnCUMx5EjM0mOL4Jy1hkTeN1E27DarQzG1aLjzMM/TRuIyocu1QoNTyman0vNvHoFelQA6WhZ94WAcKbd+V7iLOBRjFPbLUeRo6a9Uay+zEEkqQqyV2yEOD3e7zPvvV8BUtA+XKc2YBvEyzB/Th90IUa6gbqoks9OsJf2Q9wM/7d/AovmYMMDp5z9jPqvwE3nuDvC/UKYYBfVZxmcEs3LqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYEzPh2HCvulMM7n8NLZihzPYqqg9U+hllx69esfCrk=;
 b=wHan0x9BL3JU3X2T7R6SXdEnYNWlWSVbDESG54G+UseZLaIej7UFMsZf0RCwPUXWGQ1vrdTDyTl/N3wCLal8trI7ImUNP3hBb6+/s1WpbImfac8Pb6w9hDdTXyndRwytjrH6GKpD18kg6ABTEI9Fh0WTKq7mI+B0OAv4qnKBQFRGPeL1EraycPvm12cRMn4Q4qjUHREMs5XBmdgO47o/aVYGYPo+egUloxD2SqeJEwzVqlLC+fqH63J8eP6+F4j1eRQ3hd+GX79GszST5SmIYvg986wdnEoZpiKz6myRwF6mcE9Ylm05tDu51N3bdsGqCVYKdRT5qBHjBn/EUAEB8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by VI2PR04MB10595.eurprd04.prod.outlook.com
 (2603:10a6:800:273::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 10:10:06 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 10:10:06 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	Hannes Reinicke <hare@suse.de>,
	Joao Pinto <Joao.Pinto@synopsys.com>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Subject: [PATCH v7 06/12] scsi: ufs: dwc: Export common clock divider and link status helpers
Date: Tue, 29 Sep 2026 12:09:40 +0200
Message-ID: <20260929100946.693962-7-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929100946.693962-1-larisa.grigore@oss.nxp.com>
References: <20260929100946.693962-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::20) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|VI2PR04MB10595:EE_
X-MS-Office365-Filtering-Correlation-Id: 935ad1d3-d907-43ba-9d10-08df1e11d638
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|19092799006|22082099003|18002099003|921020|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: LMZWOLmIdUUHb5TmKHgwHA4TAn1IE8nGAYQD67lsHwO1LNFn2njQAx12xxd9r/SjvjeHNvoot+4d7B1yLukMS26BxTSdiY0DLAp8KnbHVYSoWyTRfYMQdRSfjCzx+3oqz0i07E4t1wFxWjcLc+CIm3noRxCjWRHJtJS9aCHYlRV90FB9PoShpy6TF6kox8SYku5/4JFNf09REdpmh60/PB1mcHDv+7wulQSg73ZTSh5VWe51CKq4PMevA5TtNjaYUpOVkmqjJiN7EgkXiZ7UROAiFDipyOn0glNo03ENwYhdrqx0lALtdXaqtLQQ8mNPrpOhU53Xo8Cpq6aTsAj8WVDZZicMbKh7B6Z6mF/eH7SsuH++pjlGUmySTHsIiSD7ucIbIuToggg5bQrercaGRuv0nNv/yQrPjAfpCXiOIoDRa+pFk4FUNS3Y4tCqsuOBS/T/1Umx/z4iPfYLxJZEZrDfE8wB0u3MGzK0Z8et2sc9CWgYQLoA3gAkX1MnefGrNH6SShrKTEI+YxPLzkWl5oIWaIYf9efqqLpn8hqEB3ayMujmH/mHW3y9aHTDIs+a6xv/k01v4laMEeuvwBWrgsTcx5kiCSWNqrtn7zAdWnoPfK7DAMVQN44O+J7i09kr7HVVXN/ANRoARYvZGcMkDtAMBTijAuG+lDh2GMKy6LoK2euxVS51EdYIJ1zd/CfHlDCsOSQHNLUal92rJCa6MQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(19092799006)(22082099003)(18002099003)(921020)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGt2TXdJMHlHNUxLcEt5V2RuQWl5cHQ5NS90eGhZOU1OeUhnTGo3ckNENE14?=
 =?utf-8?B?ZVJ3SlhEaTFRd2xYL3dCMGJzRnllcXY4SWc3RFc3WlVqL2FVWmJrT3JDWDdm?=
 =?utf-8?B?ZGUvaERYb0U4QndobXQyaFRzalpUemsvVDBkN0tOcmlGdWE2dmxCN0ZzYy9S?=
 =?utf-8?B?Skd0K2lzVDhORU1LaS83eVVyam5WMGU2NThLK1BSS3VldzQrNTdyallrVGhY?=
 =?utf-8?B?MXFVTk0vUC9XV3JhVTJoa3dyRWcwVHVkcjVMSHM3THhHKzM5dkFweTVSRFhH?=
 =?utf-8?B?YzRLNmpKdGdGSFdQRGlUSWlCRFhWZktWbFAyNzhud21xeTd6VndyVFhZT3F4?=
 =?utf-8?B?T2JKOHJDMjdub0dpZG1JWUJ0MlFodWZFeVl5UXZmRmhpNThsQk5VdWVWT1FZ?=
 =?utf-8?B?ZWttUElKbmNMZFJZYWY0VXdiSUhDaERtTG5xdWVQOTVaM0dKS3BRZXN6azgx?=
 =?utf-8?B?bHpPeThTczd4TzR4UjJ3Rkl5ejlsTmdDakNqY0pXUlNML3VYak5FT1dvVlZo?=
 =?utf-8?B?Y2V1cUZ0OUtaVTlBakxHM2J1cUpCUW51RUhuR3YwOVA3LzFySUh5OWhub0s0?=
 =?utf-8?B?VTJpcitiNldmcjhLVTV4YjJURkhxNUVmeXphdFNBME5WWWREcUxmQnRicHBH?=
 =?utf-8?B?cnYrd0czSmJSTmptTlRsd05JUlRVMUdSMXVpemhuS0FYdCswbDFjT2FzazZJ?=
 =?utf-8?B?ZzVxQXhhRDJyVExkS0Rwakw2TktzSTRMc1Nad1Jhb1ZRUmVIYjFpOWpMZWl3?=
 =?utf-8?B?ZWZJVzU1b05GWVdRNFlzdGhSS1NTVHVyWklCRkdLVWZ6SXZDbjVMQ1hOaVFt?=
 =?utf-8?B?TXRvN01abUovQlVuTUcrS0dUdGRvVXl0cVo4bHpOeEZMUnNkbkVIT3hnYVRI?=
 =?utf-8?B?RDNWL0tOekVtYUlqcVhqUkVaR1FYZ0hPRkV0bFM3S3lBTHowdWdWNWhUQnNz?=
 =?utf-8?B?cVVmb3ZaUXZ3QmRHM00zMDhIRzRKQ2ZQQjAvRXk0VTJVTkpGZ0NFSm1ESTR3?=
 =?utf-8?B?M25nNDVkakFCTkNscHo2WHFVcmF1TnlJd3dNZ0JoeVRrYzcwVzlBQ09pc3NF?=
 =?utf-8?B?eFNsYlBBeGNZU2hoWkh6SnpMV2hVYTgzSVBhT1luRkJITDhoeWU3VDY5S0pQ?=
 =?utf-8?B?amVHellvNFpHbnVrSklSTUIvTHBlRVNmSHpQeTdncE9iQjJjZ3ZyWWRQUmN6?=
 =?utf-8?B?cTdtQW1EcW8xNm9hTU5FbXJId1NlTXBWdlhtb0RxUjhHRlpwWjZ3Z3JJRy9S?=
 =?utf-8?B?ak84Znd2UGJ4WHdlWE1Ba0p0S1RWYlA2TFhUSmhhaExvK3JWSjBxUzZHNjlQ?=
 =?utf-8?B?NHowR0xPMXNSMVN3R1IreU9oM1ZzNU1ESjVLUzZQSk9YbWtDWVZUNnRobDlw?=
 =?utf-8?B?R0U0ejR0RlNYT0ZibTFoODg2b3FuOHVyTjIrMXhaL05zRFVySlhVcTZOVklz?=
 =?utf-8?B?MVl1NnBKUGZmTE15MVo1YUVGSXhxblc4ZWZKUTJoNDBpa3JsNmZISkUwWStw?=
 =?utf-8?B?M3NmUXJQOEtyZmNRQ0dyTzVuODJJcXpZRnFaMlBkY3grUWY2aDNZb3k3cVhq?=
 =?utf-8?B?VnByNEpMcFVWY3NtMDdnclR6c1RzUks5ckhSbTBIM254aWF0Qkx4bmFBMGxu?=
 =?utf-8?B?QU5BRmhVTjVycSt1MGY2cFFVTFB4akNEOEc0Y2dpYXJ1SFNBaVBZZlJzSi9u?=
 =?utf-8?B?b210d3dtZmpZQXZNSDhKY2ovWGtROXA2Wk9pT0FDV0d1ZmdKK3ZQa3ZhelRP?=
 =?utf-8?B?bVYzR0NZUHkyTWI0eFA2VEw5QjNxVk9KV0wxRitEMW9HaDBwc05uWFNXM0h5?=
 =?utf-8?B?aGdNV0UzcEU1eDNlQ3E5M1dpSkdndC81aGxYaVdEZFFRdHNReXBKaldFVFhk?=
 =?utf-8?B?d3kybTZSWWNxTHRqTVkzc0ozSUFIRmlKZVc1WFhzakZ0dTYxRktPS2pxY08y?=
 =?utf-8?B?SXd3WUhFelB0dDBjd2FlaTdya0M2Q0ZvdXp4ZDNiSHZIMSsrNTJDWWdJbmN5?=
 =?utf-8?B?UnlldnJ6NnhxNGMySDN3SlErY1hEbUplU3lTeFVIR3pOdTNEdzlBUzZOZEJK?=
 =?utf-8?B?endGYVMxTW8wRFVBdnJyUHo5VHovVitzcWhpSGh6bHVoS1ZFMGtabzJCL3Vp?=
 =?utf-8?B?MU1JTjEvcUcxL2hteTd3SlA0WHRBYjdvRVNBOWl3TnZPMDBadkFnZlRWaVVN?=
 =?utf-8?B?a2U2MHZzU0ZGa1V1Nm0wVEp2VUUyZWtDU3FVVVNWUWsrV2daU2FDNE1LaHly?=
 =?utf-8?B?OWdqQ09LcVlFSStxbWNpaE5qT2JYZDd6VGY0eUx6bUtTY1JIZG5vOEJFOHRh?=
 =?utf-8?B?dmtDZWJEc1lRWFpSU3I2TnZwTTkySHNpNEhyZ2dsQTlDQ3YvczVwdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935ad1d3-d907-43ba-9d10-08df1e11d638
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 10:10:06.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgQ2R/v29NF3wLdYIfbxoLoXs2/k+dPPuVupzL/NoEqHH6i3RyVZ1ug0cysObB312mGgU9RqDHbc87MEGSx/mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_031020_112990_52076977 
X-CRM114-Status: GOOD (  11.79  )
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

Make ufshcd_dwc_program_clk_div() and ufshcd_dwc_link_is_up() available to
DWC-based platform glue drivers. These helpers are needed by platform
drivers that must program the controller HCLK divider and verify link state
during their vendor-specific initialization flows.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/ufs/host/ufshcd-dwc.c | 6 ++++--
 drivers/ufs/host/ufshcd-dwc.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
index 20b7174e9498..037b99d1148c 100644
--- a/drivers/ufs/host/ufshcd-dwc.c
+++ b/drivers/ufs/host/ufshcd-dwc.c
@@ -39,10 +39,11 @@ EXPORT_SYMBOL(ufshcd_dwc_dme_set_attrs);
  * @divider_val: clock divider value to be programmed
  *
  */
-static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
+void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
 {
 	ufshcd_writel(hba, divider_val, DWC_UFS_REG_HCLKDIV);
 }
+EXPORT_SYMBOL(ufshcd_dwc_program_clk_div);
 
 /**
  * ufshcd_dwc_link_is_up() - check if link is up.
@@ -50,7 +51,7 @@ static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
  *
  * Return: 0 on success, a negative errno value on failure.
  */
-static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
+int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
 {
 	u32 dme_result = 0;
 	int ret;
@@ -66,6 +67,7 @@ static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
 
 	return -ENOLINK;
 }
+EXPORT_SYMBOL(ufshcd_dwc_link_is_up);
 
 /**
  * ufshcd_dwc_connection_setup() - configure unipro attributes.
diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
index d8673cd54d4c..53b523ef59df 100644
--- a/drivers/ufs/host/ufshcd-dwc.h
+++ b/drivers/ufs/host/ufshcd-dwc.h
@@ -47,4 +47,6 @@ int ufshcd_dwc_dme_set_attrs(struct ufs_hba *hba,
 				const struct ufshcd_dme_attr_val *v, int n);
 int ufshcd_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val);
 int ufshcd_dwc_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val);
+int ufshcd_dwc_link_is_up(struct ufs_hba *hba);
+void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val);
 #endif /* End of Header */
-- 
2.43.0


