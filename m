Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7A7C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qCPG0kEDS78xJ0ah/aRN88gQ7J5AUD8Pnfr/KlZT+hs=; b=3gLhxRMN5lqtz9svK/hzfeiuBi
	Qeh5o03GF/AVxYba+DnIzhrYDo1V1IzqHfeqNqS2pxAGWf47wHotYgFLanZ5PoEprN7IfkTnmzpa3
	n0K0RaTy8fP1/X68XXDfBSnmPC4YiQduXT/h7OOOp+VL3CrxKUmlAMG6+L8pPKed9VYJ5kn/H4uxf
	7f5atn+E1ITTNZuD7F3G9BDZmULCfsj4l3WOV8dfu5TxtssGdh8fcQMQGVUiPhFeKpryknP8JYMiz
	6eB3i9v2x/z2Jt6CsyJobP3wpr/XJosU+86BbZAcrssKm/xhbq9olKz7djmwwQajYHWkbyoHSfg9G
	PmaiuEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Av-0000000HTgZ-4Bbw;
	Thu, 03 Sep 2026 14:12:22 +0000
Received: from mail-francesouthazon11011020.outbound.protection.outlook.com ([40.107.130.20] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28At-0000000HTfC-2gZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:12:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MB8Pl8tZXmTeA/UpTnj2iOXTkxSTayywJmUBcrpUJT0QthHFKI5rTBZGw80Yb5pcJnY4Frc9H5BMKcCtkyhda3o/ID6CXYSkEhbO2UxmQHapUyFxEaA9WB+tHP8/T+AsdKYSyEPw7oe9OJDDr1VUEUMQqrozvOte8sUU/ajV42JfrW7sCuHwJOnL+cYE3d3O2z7cZc02ovZpJKEukXPJIurArJOFIIcPWd8s2FFY9fZ1ADBD7m6gVI+qY4cTa+zK+z2WzRKXdlOE5n1zM4mqesmOLRv6u851Faci2/Fh5I0D4bXt6qJOA133UTrWkbAtXyQ94L/YXaLHnABM2bfbMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCPG0kEDS78xJ0ah/aRN88gQ7J5AUD8Pnfr/KlZT+hs=;
 b=l1bJBKSZQsmC+3Q6elX/hrW0I2bmJtMzCxysFbXKmfiZv1cfIhcUourXN3XRyFVvIAln/IDJIky7JbMfspD8lrQg9YLf0CO4hkROwgrfOog91iCOkCly4XtE0ye7AA695pwB93fwBHrMNHpdkUbiLEW5mkm2niNhrwV5r7iTu5xTxRtPmdyGRE7RsM2qst/nwQfjVAdkXtVWAD7DmcFVNwR7MrY4UL7og101f+7CRNCw47t/uPk6CnqwY1WjWe2v99wTy7E9Z/x6NekeYXsmn+0wTLzAVfQcPvbFCLMZlrb0C7tZ/vPYu2ZoRaqfPsyf7dScsLkt3HGwYAVJUGgkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCPG0kEDS78xJ0ah/aRN88gQ7J5AUD8Pnfr/KlZT+hs=;
 b=t3IEvduApewNaF+Dtl61DNryRUMkOxvxZ5M5bWLTBfTzGCq56B8K0X6pUBNYba535tD/Wloq1JkNdBBsSdsx5Pd7MiY0WL9fXT6gSp8M3QJOmsGuw8oPm9dbPJkifTGv02FJi6i+qG8dq2vfnK846Vhvy4YYGOVMuLWu+hBO/aZBCieQ1hm16/0TizmARNF0lfUqgOtxSk5Hzc68MOTvG84O92THi0hApoNeeUn06p6uvOIEATIoKgV+OowPn1oCTSdfEP0rl52aWrN2QxV6CaJbXVEUXOEF0ldnlfvw4POVjQaP9vG5RvPRYYXI8csK8bHOvDuJ99QPdoNOTaC0Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10303.eurprd04.prod.outlook.com (2603:10a6:150:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 14:12:11 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 14:12:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] dmaengine: Use non-atomic bit ops where safe
Date: Thu, 03 Sep 2026 22:16:11 +0800
Message-Id: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuBmWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3ZTcRN3cxOJs3ZSUNDOTFHNzgzTzFCWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQBYD5vvbAAAAA==
X-Change-ID: 20260903-dma-mask-ddf64d770f7d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: 84183449-f71c-44ec-6f67-08df09c558de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|18002099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: JuZBmBtjAyC89Ec58c3I3v98tt8gcLgdkVEzKeczF0itdGqC7dlONB6y3eouuXDXZKeicHZnAEr4Dhn1fiUZc7OLAG/uVOHS2UXM4fbWJXPBGrv3DKCMzFlf/GEObzIeHVOLLbTFIO7yEMZSdPqC/kPmNKESDzTgQuLB3U0/Ng6Six207lvSjrfHrj2WABCoHu/ryryulyk/uF/PL83odDg9HaT373Y0EqMIOvES+acx1/dEsn8eFjLadUq/DPodyd7A3We0p0TrXalqYzHR1Og/5FIfqSVrIpi4wA/0wpIm5JbOBhru5Ry+hc7NX7weSm/ZceknO4FTuvXtsM8Q0w87OHaRYrXXEvi8VdiCrggwRrH7yKN1kQcJEArejUQ6z4TaWMd494dIQmPNo5TWD9Om9VP4uVbGkQ0DjIKBkBcm/M3TwqmPsrc17t7PniEeI6yIkNesDTkCpv1eG70U1itrzKJg1ZYzIQHdfqHEUSrUqGMvvmLKjYbIlVz2l86LGQS86E+FGKW67wj7w0cpH/M625iiiWydqQrkiGNHEqMWuAaFeeUeP+vUyaBM7n+OxpzcugNjr17wX73rKMMX6yBAZu6nIrwr32tdA7HbeSfPMMC5l+JhBSe0uTbLiPuxT/CRStYIlfL+NHy9YIXtspzFhR0OgpN8a4WOt3Ikm7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHhkbi9WVlNMS1lBeUZiZzBPNG9TQnNDZzZhMjQwQzZZMDFDa01HNFRPQkhF?=
 =?utf-8?B?YXFKUEp5RXVicVNGUjErcUNuWDJmaFRmdk9Sb3Y1UkJmMjR0OU0xRFdBVmli?=
 =?utf-8?B?TjBCaDZDT2hXNk5VbUJJWkFNa1c4TzdLZXNnSGFGZlljTkx6aVFXM01HenM2?=
 =?utf-8?B?WkdJTGJtMldYL3R0V2JuaStleThaRFYyb0hLL0ZMbXFrWnU5Ylo4UXNpQkZk?=
 =?utf-8?B?aWZqU2hsR2ZuZDNEdUlQeEJKcy9uR3BueE1GcnQzWHYrSDdNZUpKdHFIeGxk?=
 =?utf-8?B?ZUFkTmVvTGkrdGs0WlFkMlNJaVUwUngvYXRneFJxNThLQkJ0aFdpVlBSRmE0?=
 =?utf-8?B?Mm03dTVWdUVSOG9GaWlTSTd6blhUbmpDNjd0NE1oYkN0YkI1b050eXl5SmdV?=
 =?utf-8?B?ZlprdEVEUzNtaE9XTE9vVCtxUEw2b2JEZ2hualc5cGxSSGVLUndEMnEvODd2?=
 =?utf-8?B?UXJJYWF2amVGMkdQSUllL2F3N1p1aktEOUJSb2hnMmg0RjVWVFozSEZyeHBO?=
 =?utf-8?B?emQrNzhqQXNiOVlGWUVBNk9yV281Q1pBb083SCtJdHBUNC9mR3BIUXRNcVIz?=
 =?utf-8?B?MFpOa3ZoYlp1K0RIeFZuWU5kblRzV29XU0ZUd2xzWjdrS0I3SysyZTdaTE51?=
 =?utf-8?B?eXMxbzh5ZmlrYTl4ejA2ZGk3bzdEM1VxdDAzdy9xK1FwUGdWbkFpOU5yRmFE?=
 =?utf-8?B?SDdqdVpaeFppSzZMOVRObzF4UGhlQTZiODVyWVlmUGI5ZUI3NGk4aGtyRXd3?=
 =?utf-8?B?RlBOc1lKOWJQNXV3aXhkMUVWY2l1MEV0aXZrZ0VqcWkyL2t3c1ZyNUxsVXpk?=
 =?utf-8?B?QlhpSXpRYjRZTm0wSjRxSDg1NHdWZWY3K2NDd2s0K3BZWkJ1Syt1RlpUM3I3?=
 =?utf-8?B?NURkR3FQS1NLM3hnRzM5aENRVWZJQ0pWODRGdE5tb3l2YVorbStGcE5MdjBM?=
 =?utf-8?B?em52ZktSTktxbEV0SDdqUHYvMUxmMEtIVU9ETi9IOXhCKzcwU1kzblY5Si9z?=
 =?utf-8?B?ZHVRKzJzZEduamlES25zQlhiNENUQ2ZhRTdlYnRzRzBmd2dNdURFNmxWRXVL?=
 =?utf-8?B?eFV5bml5d3pyZS9hNGNSdmw0MFRLWFdRNnlFMjNQcjl4bksxYmx4c3JJRjhM?=
 =?utf-8?B?YjJZKzlDUmh4ZFNORXh1SWhpMmhqK28vcFFnT29Nc3VQUVEwcmpPWW5lRFNm?=
 =?utf-8?B?TXJpQUQ5MWRyanFKWVgwZnRRYXZwelFkd2gzdWN3QnpzV0VMZ09VbzZTVWNC?=
 =?utf-8?B?MXdhQXBlenhLKytUSlVRSEdnNVFJMzc1emduNGpxeWwrWDNORTc4OW5uNTA3?=
 =?utf-8?B?WjZaalRKZDlueklrMjhsWEgyTHJKY0FjTmY2Mk1obDI2YlNyZHM0OW4xK1lp?=
 =?utf-8?B?d2Mvem1WY1h4VkJrcmU4Ykg0b3EveUFFeE50UWJGOVdSenlmb3ZIUTBiSlVv?=
 =?utf-8?B?NTEwUDRsV1h1UVlWbGd2MzBZN2RFeEdLdzVHR01WVGkrRitjM2pjNTlReStZ?=
 =?utf-8?B?eVNGYTRaZzFMYTRhazlHOTc1Z1FUeXBrbkcxSU5FbXdjOTNxaCtTcCtQSFJV?=
 =?utf-8?B?clFSNks5RWNQb2lXRi9GSnVGUkRUSEd1TEVSQm5ybFM5S0huMFZyMnNuWFFV?=
 =?utf-8?B?NU1TN0xjaFdrcC9sTnlDWkJvcHZuc01DSEpSamVYbUVWQlQrUTNFZ2dISXIv?=
 =?utf-8?B?T1hUUnVRM3lGS0IxaEtPQS9zUEJRSjBCbUZtQStTVnErczd4RU90L1lxS2Nh?=
 =?utf-8?B?NWVCVWMxeEl2QVRXejFod2xWbjdQTWpvd2t1TFRvZ1czNEtzcjdiSlZDdEtV?=
 =?utf-8?B?MURHMGhEWGZMSVJ1M3NLK0daeXQ2YUl5NmwvVGlSUVNSYk5DT3IxV3RwVFpF?=
 =?utf-8?B?aFBkZmsraC9wRUgxRkZoRWd0YWxEdTh1RkNxRU5rWndKZ29udksxNVJCSDdX?=
 =?utf-8?B?SDBSd2swY2hzdzNmS0dQdUkzRmV6RURjWFppZ2dZMHFzK1UrWWhma0hETC8z?=
 =?utf-8?B?SjhUamdBY2M3OHpFekUxWXkwclRuelV4K0UrWnB6bjlDbjBMZ1dhbFE2UDA4?=
 =?utf-8?B?U3cvbXNvMmpGUTQzNnlFbDA0N1lZR3RNK01PeUovUkJkbEkxSnI0ZkFXYjJX?=
 =?utf-8?B?S3VJWEZLRjlyVU5NV3JUWlA0YzVwSk1KU2xTRFVaN0ZHNC85TDdyY0RhcXNh?=
 =?utf-8?B?QlJjQkN6L2ZIY1ZOWEpFQ2dpTVZ2U0l5b2E0OUpPWlVVVlZocUZxVjVRUENw?=
 =?utf-8?B?bW5kRE9OVDZ4Z1FqTXExK04rUWtHZGlkRVVnMUJ6SklSeEpoUG9aYmw5b0pN?=
 =?utf-8?B?YjBYODZUcGVsWlpYMjgyL2w1dW05elRCTFRZU3dOOVN2eXE5MWNIS2tIUG53?=
 =?utf-8?Q?EJdsHsRvxwOSljKBXri2APX+x/ss2XT6F7zSe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84183449-f71c-44ec-6f67-08df09c558de
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:12:11.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: riOwkofIG6hB++I4LbjcgmPXz3GMbqTyCPlQ0Gqh8/xvXqN6a0V3jp2Ijt9Y4ofXpYf92wwGjpLnuhNCDFEQUrmoCiaH8LajF1NNWqluSu/Lb+LUmTUNNTpOA+7bYmrq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_071219_690350_ABB9A9C2 
X-CRM114-Status: UNSURE (   6.51  )
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

dma_cap_set()/dma_cap_clear() and imx-sdma event_mask setup use atomic
set_bit()/clear_bit() in contexts where no concurrent access is
possible:

- dma_cap_set()/dma_cap_clear() are called exclusively during driver
  probe, before dma_async_device_register() makes the device visible.
- imx-sdma event_mask[] is zeroed and configured during channel setup
  while the channel is disabled.

Switch both to non-atomic __set_bit()/__clear_bit() equivalents.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      dmaengine: Use non-atomic bit ops for cap_mask manipulation
      dmaengine: imx-sdma: Use non-atomic __set_bit() for event_mask setup
      dmaengine: imx-sdma: Use __assign_bit() for ownership configuration

 drivers/dma/imx-sdma.c    | 21 +++++----------------
 include/linux/dmaengine.h |  4 ++--
 2 files changed, 7 insertions(+), 18 deletions(-)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260903-dma-mask-ddf64d770f7d

Best regards,
--  
Peng Fan <peng.fan@nxp.com>


