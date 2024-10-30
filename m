Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C8DD5CCB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4lEO4hjAlWtTRFTbGG1pUvFkVw1v+dGMUB4J4mUyZVk=; b=qxcyBmTXMwcjGaAdROInnK0VRu
	/PsdftaQGxaFnsIhmBArnlGbDC2/eCpzjxQDYo4IXNrdvo2qJ0eYUX2HIFlTh3xnM5mhmYagw0v16
	3VGxjewksOZm9sBVdm+amLqHmoEqznCCCyyDMWAcQSiLUeAAcKRX3VSYUrFZf8nrGN2UG5FI2ihVt
	esQ2ssOmScaGCnaRJYQ0T/6haqIyMilCKQ9Ozc6GN/EL6IqQ1c9hW91QHWMjFjz6WJHqlrHPYXTb7
	HcPf2tYmA0KgYa/AcvDmoNd229tViGwtNOhTr8hMhqEgtMC7ckGFKmu2pMN6JuRNe/mGr0WVVuBUz
	HtDk5fsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ABm-00000000l45-0pkG;
	Wed, 30 Oct 2024 15:00:50 +0000
Received: from mail-dbaeur03on20720.outbound.protection.outlook.com ([2a01:111:f403:260d::720] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68tX-00000000V65-1Wph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:37:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYp6xBSRVB4JOLcYdzTCHFMIgZO49OrUnXwwORAJNSF3lmrIVac7zma9jqOW6LpbRM2464ekbsJYrIu+k4h7YnQW/9Nj9JJ7siYHXPOO3uHiOPezZlV8B94RC762OI+nHggVripSdReJTECd6zj/8yiSm9JYatlu3wkK2ALRa2w+ObB128y0NIbLZpzsGI/+dfSCMRVcpyobYfm0OIIB4A8OzQ6QJVogKA2Zty78A7fSaqPgq53Dwr1zBjMus2DIaDXX/arMX8Bn6CNyStv8GwaHBsXdr2gsN7a+V1dfk38NNZSnhg4UCyBJ6Nmr5T4XuRo8mwOfSnonNt1YcS++Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lEO4hjAlWtTRFTbGG1pUvFkVw1v+dGMUB4J4mUyZVk=;
 b=ldStGnjJfiH2JaUPmuQ0dG2MaoE1KwdYb8Pw/LWlcMBarpxSPivRlLSug9UCe6mHY33BpZPozCt4BtDnibqUPmdoq2eOVBwnOCc25tooFupQCFcISbGxpV3SRRlDzUVYNrPqm/XFoLw9xBOV36FWTyja6uLCnwa2kRBTskZOXhrSF3r5PvBG3EwEU8sXMePKRbS914kldtmmsHNub/pHxSMJhlHkuHJYoviwecR4gEsu7DLTUNU7Vgc7IkrgH6Lo47FdE9w+cmCEdcHdWj5gTZtomiI0jmZmfB+odpKpHVBbHzI8a0zkTcxO8AHbhpuXR3198Kg7ZGqi+2MONzHRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lEO4hjAlWtTRFTbGG1pUvFkVw1v+dGMUB4J4mUyZVk=;
 b=NCxFuHP4jRZmoc3xUcp30yADQvVpw/eYVbha6sHUnYZT8WwusA909e7BEReJm1hpdH/8Hc/jTllXMTf3MdNMfvv+QMljqvQb2DNS0Nwdu/0axrTor+/VGYg3aQVdTwIqoTEv4XxqUE3Rxbl0ug+Zf1azt05bQrHtv3snfJq+fnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by DU2PR04MB9097.eurprd04.prod.outlook.com (2603:10a6:10:2f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 13:37:48 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%4]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 13:37:48 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v2 0/2] mmc: host: sdhci-esdhc-imx: implement emmc hardware
 reset
Date: Wed, 30 Oct 2024 14:37:42 +0100
Message-Id: <20241030-imx-emmc-reset-v2-0-b3a823393974@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKY2ImcC/3XMQQrCMBCF4auUWTvSibERV72HdFGS0Q6YRpIaK
 iV3N3bv8n/wvg0SR+EE12aDyFmShLmGOjRgp3F+MIqrDapVmlplUPyK7L3FyIkXNKSMOxGR0Rb
 q6RX5LusO3obak6QlxM/uZ/qtf6lMSOjOrrWdUZdOj30KT3EY3/PRBg9DKeULn/t3kbAAAAA=
X-Change-ID: 20241027-imx-emmc-reset-7127d311174c
To: Adrian Hunter <adrian.hunter@intel.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, imx@lists.linux.dev, 
 linux-mmc@vger.kernel.org, s32@nxp.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To AM9PR04MB7586.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB7586:EE_|DU2PR04MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b693cb-b4c9-4799-1a74-08dcf8e80b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEtpZ0FoU0tQYWpQVnJvd1VPMG5RZy96MEp4bitVTFZOd3hNWjhPUnpxdU8w?=
 =?utf-8?B?SHZ1a2RvL2dXLzE3aHhQTkpjVUUzMzBaTEl2VmQ0N2NrdzAzVlRwdEgzSlVN?=
 =?utf-8?B?V25sWnZRL1hRU0xxNDdDcHZ3ZURJa3E1M0lBYzQxVm5IT1BMMkRESXF6NG1h?=
 =?utf-8?B?ZGR2ZWFsOGVLQnhIQksyTWx1c2dBelAzSFZEUm81VlZRUmY1ZURDZXcrc2d2?=
 =?utf-8?B?T0NjTTdMallrZllldkNrRVVMUTZ2V3JPQTNXY2NvaitXMkc2UG9vZ3BOZjFw?=
 =?utf-8?B?S1NVQ2UwQXpJYndDblhpSkN2VGczWXcwa2k2UFIya3JKdzFmWHB4UTlyVjhQ?=
 =?utf-8?B?c1A2MjFkN0xYNVJwbWZxMmVmSVl2aGtwcXlVZ1AzNnVBRHd2eFpDY0xJYWNH?=
 =?utf-8?B?bjlrYWZKTTRyNENyTW1GUzBGdkcyNktXY1FnLzhiaWVEYmE5dk85NndiTm5x?=
 =?utf-8?B?MllCekZ6alZTUTc1RWVEbVJKWnVWcDZJenJNL0VWUmNkSFJxUnB1RE53cmkr?=
 =?utf-8?B?VmpCbGdWVGRCbXZkTWRwTzdKVnpYVS9JK1VaUDdaaW1WcGF0N0kwVjB0MGtJ?=
 =?utf-8?B?ZkdESDlFZEdnWmJCdnFyU1lFUEpkT050V0lMVUZ1akIvSHFrV0dWZGs5dWp1?=
 =?utf-8?B?WjdDTGd1QkE0WU4weWU3aVc5U3hyWW9oNlRwY2RVTDFEdDNTUXc4K3lydXND?=
 =?utf-8?B?cHVKVU0zQ2htZjQvSmkzWDZENUJUZHFxOWQ5Y0RFWjh0d3pXcVNpalpnaU5w?=
 =?utf-8?B?SSsraEFZVC9XN3QrVUhrbGxROUJJSTJSbGVxL2hLMzViRVN0QTFDYy96RWFJ?=
 =?utf-8?B?cENGNUVYeWhOZEhGMk1qSEhydE5kYjAxWjNQYmRXQUhCUjhiak5La3IxRlNR?=
 =?utf-8?B?cFlmZlA5VElBVUVSUWNRK2xJdHF4RUNZaGVwQ0ozQy9yR2JzSmUxUTlGRVhu?=
 =?utf-8?B?TnlOREx3QVpzcVBQUnlscHlzY1NkQ0owVkdhaGd6cVpndi9aMGthZWFHdXpH?=
 =?utf-8?B?Yy8yUlN1b0YxMlVzbHlmMGhxYi9CT1lUQ05JaWQwZCtzTk1Vc3dSeFNLNnA2?=
 =?utf-8?B?SEV5d2ZOVXZRek5yRkVXVnJMT1BTTE0rUjJtT3VsaUNSR2R3Vk9ZeitDYk5w?=
 =?utf-8?B?QnpNZGlweVBFa3dJbzRaaXVaVitkMjk3RWpwN0JjNTZ5Y29yN1hvUmtEc01N?=
 =?utf-8?B?R2FUOFc3VjgvQWprNW52QzJBN2ZhU3RZOTJDQ1FCV0NEb2RZOXQ4UEliMnR3?=
 =?utf-8?B?bGNVcjg1YW00SmN3WXRQOU1MRmlnMDQrRTNwZEg4UmVHOXp3ZWVIbjRPMHlr?=
 =?utf-8?B?M3hzdEpGdnJjYjJISTFYTHNQVndmV0gyRWhac0xuaEtHSERQajlsZG15RGhB?=
 =?utf-8?B?M25oMFZiaGEzWHdVWmM5b2tZczhHS1VqMmw4K0RyTEtNREYvc2RWVnNYbnRZ?=
 =?utf-8?B?QnJ0eitSN2VJSlpiSmZIdFRaanBQcVFENzhLRHhzUE9WTVFMZTdnSFg4WXpN?=
 =?utf-8?B?ZnUyTW9nR2M2SXZ6UGRVT3Q2RGVGWVo3eC9mR1UzZWl3WFpNdXk0bkJzNHFo?=
 =?utf-8?B?VlRDRnREc05LUlRZWjE0ZG1kbGcxcGk5Z1RmWnJQSFl5a0R2TkQybUEycG9h?=
 =?utf-8?B?VXFxcFJrWHVvRGxJOGVVWG4yeGQ2ZTIrVGUrdVJQVWhqU24wTkdtOVZrbDhT?=
 =?utf-8?B?d0hEeUpEd3RPMGIrT2tOTGdyL0RZNE1MZDRVcVpTazVoQ2VKN1NRekZIR1Z1?=
 =?utf-8?B?ZTFPWFlDem1GUWN6Vll4RTM1bEZMcXExY3RMem1aamJiby9ob2FWSmNQZXNu?=
 =?utf-8?B?a3NRZjVxVU1ZcS92d3lIQW5lSUlVZFAwcTBCRkdvSS9menl2UUkveHlaOVVZ?=
 =?utf-8?Q?cpAvKQcXQqgIU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlWUkFucDdueGUwL0d3cDlWWXhsUkFrTkpYK093cVlLZnEwNDFUVG55UTlt?=
 =?utf-8?B?cVJPUjJRcEE2a0VGeXhnVW56WWt1cEN3Y3ZBUG9DSE01VkJQeUpUaFFZNzkr?=
 =?utf-8?B?RFREUzhYTEdMQUxNZkg0Qzh6cVZiTldEbkpWc0lRMGdkTWtjQk1JckZoUFo5?=
 =?utf-8?B?S3hTQmNVajllaE1lK2xUeDZGK0gzb0RqTVlOYUxrc0p2UmtTUWNMWnlLUjQ4?=
 =?utf-8?B?TUdlbnNKS2E3cndvQmI1L2RucGVZL1VySHNCVFMraE1oUDFOS0RDQWxtaWJS?=
 =?utf-8?B?OVliZXZHNlpIaVZLbU1kQVcwV3l4SnpaZ3Z3UjRPZmJWZHowd3NtYm1vMmQv?=
 =?utf-8?B?L3AxNDMwOE0vL2dOaExMRGdNY3k4OWtPSnByN3NNQTRGUVllN2pnZXhMQjEx?=
 =?utf-8?B?TTJkR3h6WWxKeEVCdktDMnZvQ3JiSDZkSUxDbGplTHVibStCY3Y1enJJKzV0?=
 =?utf-8?B?VnJMZ0FPaXNQREhWSVZqN3hKS0QxS0tMZTV1aDRTYmJCc2VnYkVXbmIzdEli?=
 =?utf-8?B?Q1NTcC9KV2VxZlAzb3VvalhCMGdmK1UvMWVpVTFYY1dvT016bDM1Ulg0a0du?=
 =?utf-8?B?OUhIRUliK0lzM1dJUWhSWitzdjJZc2tKbk9lZGt4c09kOXl2ZVlRQUNHbXZW?=
 =?utf-8?B?ejRwRmdOWGZ6cXh0WVBKQlZ4S1NLakJJd3hBZnljeDF2aHpIcjFWZmJJSFA1?=
 =?utf-8?B?YjZ2blpKV3hWMURCMGg0WGhXM1ZGc0JEN1dvN0J4Z2RscU5PUXl5WW5TbXRx?=
 =?utf-8?B?TFI0ZDNRTjJmQ0hGeHVla0JIWTNlQjJFNlVMQlZhaFB3b01jUnErUEVEajFD?=
 =?utf-8?B?TmcwRVNjdy9TalNHV0xtdnU5ZWVQajJiNzRaOEtoK1ozdDlIaVQ3WmE0ajVi?=
 =?utf-8?B?dE5hVEhDNS9sdTZZWG5HbW1URUMrZjhEUlFIeU9wbVBja1ZBTi9PRS9pVDVa?=
 =?utf-8?B?TEE2bU0rQXZUdlN4a3hBQ3lFTlVkcC92ekp1MUgzSHFqOGlYbUZrbkFHeWtm?=
 =?utf-8?B?RERzaFcyTWt4eXVYQlpIbVp6SUxCVzRXdmZzQVErWW1vSVFoSVYvcFZSeVpF?=
 =?utf-8?B?TEtYb002eSs5ZlU5eTRwVzBHc0hYU3RvMHBuZXFra2FOUnpxTVBGUDA2SFZG?=
 =?utf-8?B?ekM3aXhSUi9wTUVuL1hBaE5IZndWcmYxZEtMdEZXMlFyTzRNSHdBTTNzQ0gw?=
 =?utf-8?B?SVM1aE1BOUUvZzZGRUcvSlNVZEdkZHN0VVhIZ3QrQ0R4WU9pUU5SWG9rOGFT?=
 =?utf-8?B?cWtsK0VGaHFRMHB0U212ZEFpdEk3Ly9vOXU0Q3FLa3NhVkt1a1RxQ3hkd1dl?=
 =?utf-8?B?TU9KbkdHWmpUd3ljejR6WjNnWmc5a2NwSXR3MjJXbnRLZXVuMFA1TDZ2dHR1?=
 =?utf-8?B?Tk9Lckd4cm9qcnNiNGZiaStzY3FJNVlxaVFGRElHTzYrNGdkRlFEdndFUDBP?=
 =?utf-8?B?RzhteE80VzZTeXpkcnpTQU9wRDF1enc3VGcyTHcrbk1KcEFjNEUwWFNQcVlr?=
 =?utf-8?B?b2xrNk91dFJ2UU1WVlNSYTFyL0ZSRzEzWDRUdXRVSHlZZStVVFZWWnRTbGor?=
 =?utf-8?B?a1pHaFQyVjJjdWlROWRzQy9zeGIyUUk3YmY3QU02YWwxY2YxMlJhZTVhWmdj?=
 =?utf-8?B?bVNwY1FneXRjbVc3NEFPQWU1eUNPMWI1ZUZCQzFXYVF1SGxPNm4yYTc4bkVl?=
 =?utf-8?B?Y1NXd0szWnZEc0N0Mlh1TnV3aGpmejhCZXFsRkwrazZnbHNIYTMwNWdRNHJN?=
 =?utf-8?B?dkplRGFhV3pHV3F0Wmp3dHg1ZlI4OE9OdkU2YlBVeUpPUWY5aDU2OEF2QVJD?=
 =?utf-8?B?U3JDbjNjUzluYXRFb0hhOW9UQk9GQlQ5djBmQ3lSNGRZYnpQTVZ6eDJxSHY0?=
 =?utf-8?B?MnF2Nk1UNmloSUhkV2hzcXJWV1BDSjFLaEpZcjlCdmVOOEFnNkEzSkhFTnpN?=
 =?utf-8?B?eHhEQ1l0eHRRdDlpcmNEUHBaOUxBL2pwb2tlSFdIcHZGZlYvd0RGekNjWVRG?=
 =?utf-8?B?Zlh4S0xPUHpyWHE0dFYrZ2ovVTdSaGJYQTFQelZSMGp1NnVNaGxVSXdsMkRH?=
 =?utf-8?B?N1BXWmQyaklOUVR5aFZyakVTMlFrZXZURU9uMUdUV2tpV0FOWGJLQzBtRXVp?=
 =?utf-8?Q?Q3cnH3/VDgMI1YFU9qAsFR/cS?=
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b693cb-b4c9-4799-1a74-08dcf8e80b02
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB7586.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 13:37:48.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LdJjk4ZbXvL+12oGpV38g6QjWJaqPlyfkObwa4WoLfX0gf6MQk+2ncQtV4rQgxLAegfiH41MV+lYKrWqpLh3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_063755_447412_57DB41AE 
X-CRM114-Status: UNSURE (   7.74  )
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

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v2:
- replaced udelay with usleep_range
  (Reported-by: Adrian Hunter <adrian.hunter@intel.com>)
- added comments for delay values
  (Reported-by: Peng Fan <peng.fan@nxp.com>)
- delay values based on JEDEC Standard No. 84-B51, 6.15.10 H/W Reset Operation,
  on page 159
  (Thanks to Bough Chen <haibo.chen@nxp.com>)
- added a second patch demonstrating a cosmetic issue revealed by first
  patch - it bothered me during development but is not important
- Link to v1: https://lore.kernel.org/r/20241027-imx-emmc-reset-v1-1-d5d0c672864a@solid-run.com

---
Josua Mayer (2):
      mmc: host: sdhci-esdhc-imx: implement emmc hardware reset
      mmc: host: sdhci-esdhc-imx: update esdhc sysctl dtocv bitmask

 drivers/mmc/host/sdhci-esdhc-imx.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241027-imx-emmc-reset-7127d311174c

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


