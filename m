Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D2EC5AC79
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asRUn7cBeKUnXZTYnXu4w26HcIWr8Eb2OndIWlqWV8Q=; b=WvGTXjOV41w+7aNSbgPrgZF8gU
	aSQsHLHoou6uRPS7uXGb5B7m0hrAPJbTA79PAkrhzXzCsddhyhn5cgNTL04aMULs+byEVJo/r7vxA
	ewP3m4x7VkUKxpc/8lRxKffOS+bRDBo7SVaMf8h0JsX9NNS4qyuVtcuXWNNnbV6d1Y+Td2n4FRv0W
	wqKMR/LMMIR44tMubR+qmbFfPXu86qlE2AcFX53iL9q208wW2XTNXo/39PYZPcYr7d52Y9n1dvQ1I
	ADhp7BqhyX7DSp2mpovY0m98/iVl7Z2x3Z6kezP3lNbsuDRHXhvxADCJ1Sh1GpIdDxSgXm8gP5Tyc
	UglKGduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvqn-00000005bIU-3gnv;
	Thu, 06 Aug 2026 11:01:25 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvqh-00000005bDh-0txv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:01:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qbne2MXyPkzbrWkhhRlJ9RJLyKunRN+nUKA5HFUmHqrwLGoRrPtlnE4r3RgOlmqfS/Pn4/bZHHo1qcWpaH4Wlr/PUIn6DhzSmJvn8UBx8SJXlnKVMmEgnSwnA9zMfmnp5YNw2rc2H+1mfsQyEqT6/v9guDxV7vXSsKtmlfqbyYfvMtmUYQ74W5ADyxeUbx1PojKvOCFdbTFwY4+SEPrjC78aeAaSvgcP84G2nNjbr3qHlboDBJ9fsLjbGIcYlsHPUEOP49hBLXxZJUMvyhUg4OsTRoCYYsl3zMsTKqS7o/mdZzofriDJuNChH56ozNrPDZZzP1fJ20Xl8fpIVhdUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asRUn7cBeKUnXZTYnXu4w26HcIWr8Eb2OndIWlqWV8Q=;
 b=LlVYzkr3nEffZbzQe10JluONkLweOtEW3QWp2JLuI92e7l4tyaqEEMCe8jX/s+YlXWd//xnt+m2wFj8CnFEBFnw2Vl9psJDW3fHq2WatCpbgsiUATBl2s9gh8tk3ZIbII8mNbKDPrxLPxa6qAnBKNOdQdhg13hJomF2MYter6ISqu0mFG2rIbH2t+ZlDpnrW2TnxOB/F63tTHArVySrR5vVqpN9livhEbv4IZyL7wHZoQUTm8Xbseo81lcHTY2t0hTzgkOaIpUGYUGiFrDvhF7brJ70RxtCs+lA+U1bS9CRDfd2DBwzEbftS16S9UI2LcRj4DbbXNd+XRJkWEZrmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asRUn7cBeKUnXZTYnXu4w26HcIWr8Eb2OndIWlqWV8Q=;
 b=x+XBpnkG5Ihu1f9b2sGUtnxw8vtwHo6Y9ckCyCyzA5RfPbtEw6uU1LSH6YsX9gLc3QwMu+8M30yU5YxIbK8Kmq9QpxFgnAzkj3h5h42XXmuHDRUgqgMJ2N+c02wMP8zduskMuTLom7o1TZoG22FJCaVW6ChAH2Yis7EWMl5hX2kYDy4bBaPVhH2NEVDBgoj87wxxJ2ukemPsjadGs/BTWBbf0lNP94+vYHqy4UJcynlk/zbod/epZ9snS7SX7DlaE+iehiMPh+0l3tyms+g/a/9eX0e4CpachPtlbYIEFEcyVdDmccRG3ROd/FmZzV0lJ1bp3cVXDSM8ftOpgFDD7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI1PR04MB7007.eurprd04.prod.outlook.com (2603:10a6:803:13e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 11:01:15 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:01:15 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 06 Aug 2026 17:21:37 +0530
Subject: [PATCH v35 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-imx-se-if-v35-4-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
In-Reply-To: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786017100; l=13976;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=rboH4Kq8cEx8ii9v1dt0V9U4MBQ7gMQYcVOHTD++Nzc=;
 b=0RGp+1cvgwwfkmdWIzoVgZmnnSdrUo4Vfqdl3VeIQNVoE/zJoCWBzTcYRy/X2MlQXnHhvLTtj
 /TS3FZ/jfjnDtMX+/NGHHHIG//y8rvjOrILhMgPnxDKG0bAO0EPrDVt
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI1PR04MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f45e5c-cec6-425e-1d7f-08def3aa090e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|7416014|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: VUuoUblMu5CV6NyMjf0LahScTtuzYgMNuJeUAzg/RQngAW6KdJm2mj9MVWcdhLfRfvQ0vN5dwu+JFOZyTlC20MlvWzreLISUlNPDqNECFw5tLWhtX85LCm3rDhzKTosXMs8ds7Ouj+oktQgiLVN+Kg0tUz0RO8cU+cIXDPNCPsqfUDyeswNYJwYU/rGsPfuO0Py4m85l72t2mHhCVXRCDoWHf0DqBZ7Ii3ETlHsktkg6UDqixdlkKZ8rtAv3HxG9/9ISZ68CbHBRWAO8ren27b0yydJ7Kun/FJE/SM4Toc69ry+El64gyt2Nn3KkepLXqku/v1B/kUnDNsnTaDLxKuX6ykmkQ0+AZ2FK+iI76n9nus6GBwpZGNUP+UcWZkFf6jZFxSwvMImFjPsQ3NG5MOkD38+/SfL8vUMiioCY8kVCAHSoGYruLf55mMXXWTQg9HNnjFdtpf0WuWwx7m5OroiPf81M9nsms1zirkD9YV6JZUamtcP8aTZC/Pa2ugPVJvTkJI/OKiuXOMnJ4zSICQ3YLxLluDxQmDg/ZFUt572ZOt2PmmZ+EKmPyVaNfngZYMZXV5TQWVKvbRG3/EApzWLxCpBm5/j/3kD85DGBIktR3f9p7atlWlKuwDmgEy81LOrabrq5MDQ3eL7hRhczjBuiEgREj88hD1IKgdu/9OBKzB/BgjkNT1NcENW0PYsTvXz0lSBv2ds/APtLUEo1kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(7416014)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OCt0U3dPWjFqNTJZZ1lGNEVvajdEdW8vcXFFYnVxeDR4YTZ6Mm1EU2IzM0ZW?=
 =?utf-8?B?aHpIaGxvRXEycE90bGZCeUdNcnZsbUQwTG9qQlBrcHdyRll5R0hEWTZta25t?=
 =?utf-8?B?aDlIdkxUREZSblhwcVVMMnhUTC9kdERTWk9Fai8wSW1jTzF3aExHbEJYZjNJ?=
 =?utf-8?B?SUxJOWZtS3NUQldhNTFvTzNMVXpxdW1kdWo3ZFlpSDc2d3A2dHVjd3lyMXhK?=
 =?utf-8?B?VU9BVTZwWHdTQzFPV29MU1VZcWpLUXZUYU9VL3FzUXd4YkwxUEh4Rm04M1pY?=
 =?utf-8?B?SXJabDMvSklWK0VMemVjMkphNWdBWmlZemY5ZzZKTmtkdG5VdXp4RFlMZTZs?=
 =?utf-8?B?Z2doUUl4SFAyajd1OWJDaWkwS0hVOHI0eHBqeGRNNVZCL2xBTTVtcTNIQU5O?=
 =?utf-8?B?VjNrRUJ3UE1hUTBtRDlUa3cxV056RlBieWZnbTJmUm0vRTBmUzZIby8xeXZq?=
 =?utf-8?B?VkU4eURRcisvZHlUZDAyNzZiMlpBQXNxT0tIRjR4NzF0amdUc2ZLSTNLdHRX?=
 =?utf-8?B?RUlEbTB6ZHkyTElrSEZvM1duZ2cxN1RIcDdhSVRMKzNmYms5MTlaTW5HTVVq?=
 =?utf-8?B?ZFNCandhNXM1Qk5NMXV0RFJSQVI3MG4vVFFiRmE3MmJucWcxai8vckpzMCsr?=
 =?utf-8?B?TlZvbGFxUW1IOGZ0M0dnOUtPWVc5SWZzYnVScWNGb1hsTjE2Si93VGNYSXE1?=
 =?utf-8?B?VCt4T2ZUWGdVczZBS1Zxdk5LdW50YUNSSTc5S0ZJMTlpclIyak9HdWxXRVND?=
 =?utf-8?B?eWE4UG5ZZTNuaDlQUEpOZmlFN2V4NytHN0EyWmdwdExKTmZYY0FXZGFzWThX?=
 =?utf-8?B?cGE3YkNZOFZ1bVVGanRzNjlaZU9LTnppaXk1VGcwaUdlOElBU29TanNXWW14?=
 =?utf-8?B?SWVrcm5PRlpqamlwQUNSc1RZZEEranA4aDVBbUp4MUNnTktaWGdyc0JyTDRB?=
 =?utf-8?B?TFR4ZkprZ3RiUGVsbDh6VHlBdDBFcDh3SkJQUlZUOTNGRGdpME1RZE51RTd6?=
 =?utf-8?B?cXNhV0VSYUZGWmxPZ21VV0huR001NGZuQmc5M0VPc1YxM1ZzclJ1MS9MaHho?=
 =?utf-8?B?MkkrTFdwQzkxK2Q4VnV4U0NuUUxhbDZPRmlNM2lNUTRGVU5aNFVoRTh4VFk5?=
 =?utf-8?B?c0xwK0Z1L2ovVHArS3hkTGc0NWdZRmdMOE1GVmFjdk1sRkxxcFdqZ1RzOFg3?=
 =?utf-8?B?cHBrNDdLQW04U1VtR2VqQmRubzBpYU1xelMxUnZPU3BXcHExc1VIU2d1WWR1?=
 =?utf-8?B?Vy8yT0lTbXcwVG5JTWdCYWtTcXVPN3pjRFFnV2ZlTzE2NHB1Z3lvbmFEL3Vi?=
 =?utf-8?B?Qis5NW1CeWNHU3h5UTNHeXNzV2lDd0pWQTBYeFg0dVQxR05ycEM0aGRrQ3hk?=
 =?utf-8?B?NWYzQzY0QlMycEVhc0NCMmVRYU1Za2U4TE95dWdEcTNhb2htZ3V2eUMvWWU3?=
 =?utf-8?B?MFRJYUVBZWFEMGhvd0l6eGVDN1hxSmpmejNnK2loeDVwTE9MK0I4RTZCSXI1?=
 =?utf-8?B?SmJ4bVRnNFF0Sk1seERQMC9DbDlUbnBML3N0c0RiRTE4VkVLNkZJZkZtdVVo?=
 =?utf-8?B?RjRJTVdKbEV2R2lpT0FVVm85UnF1VWV0OHFjanFwYkMrOVZRVkRxajZuVzhq?=
 =?utf-8?B?a1lndmRWNU1pMll1UlJqZXlmNWxGb3lHTXRVaUJGV0NOWk9NekI5RzlDaHVr?=
 =?utf-8?B?UzA2VXN1Q0psN2o4VDBDYm1raW5lSFpjQ2dWdzRYajNNajcydWtzcFMxMlJH?=
 =?utf-8?B?dWs3T3l5akNFeTZUNGFxdytXOXI3T2VNVmphWUlBVDVCaFplRElLM1hTakFp?=
 =?utf-8?B?Y2dHbmwvL0YxdGVPcUtsZi8zZUZkZW5teUxka3JWQzU5UlE3Q1dwVFJtYkF5?=
 =?utf-8?B?K293WlJFSnZXK0oyZFlFQTQ0SkJNN09IcnpOenlUVUpEMldyWC8vdkpxaUt0?=
 =?utf-8?B?eUFscXF5ZmdadzV5clIwZWYvcHdMREdiZmFtUTlBUkZKYkN6OG10VDhhNy83?=
 =?utf-8?B?KzE0ejJLbEh2RWlIWkl2MHFSSWtqS2FQTGFRKzRZYWdjZ0R3VEJXVDBmYVNY?=
 =?utf-8?B?eGdQUEJLT1VFNThQbnVCSWdGK2xJU2M2TTNsQk5VditGcis5a3dhOC9MM1lN?=
 =?utf-8?B?TFN3bUNUWTJuYkhHTkFPM1hvUEkwYjZjdVNQOUZ3bDVlMUdOU3cxL1dMdlJ5?=
 =?utf-8?B?MzJNaTFZbkhuUnIxbzN3bTc2STNGOWI3UDBhUXVyTndXcW1WV3RzTHZtRmY0?=
 =?utf-8?B?YUVRNmhtS1NMN1dvanRxS0x2d0FyVkxIRWVFdXhlMU5nVmZUNkFyT09RR0JH?=
 =?utf-8?B?eTllSDdnMHp3UDBQUzI4U2Q5bFl0VmtLQzNYYUFBMy9EdllnKzEzd1RQbUpx?=
 =?utf-8?Q?n+IsFPsGQvY4R/Uo7qUxi5GFDIxdgQHAdxD3E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f45e5c-cec6-425e-1d7f-08def3aa090e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:01:15.6617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qt60MnXeM3dnCfZ4I2QxUXy4LxADdiKidf03Y6NZ7F7tbxnHb7G/Fj69SYqvhcBLaousH2PxwyI5jdsorSwZKvYhpTyCtn5q8g6cHcgtV/lQofmqQERNOYOwv6qBwtzZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_040119_420745_F81CF110 
X-CRM114-Status: GOOD (  12.88  )
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

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 15 +++++-----
 drivers/firmware/imx/ele_common.c   | 55 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 41 +++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 ++++++
 5 files changed, 94 insertions(+), 34 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 724f6e913ce7..b70e3ef88a16 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -71,8 +71,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
@@ -117,8 +118,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -165,7 +166,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -213,7 +214,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -251,7 +252,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index bc08ea2dcd87..707fb69431ba 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -46,8 +46,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 	return 0;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
@@ -134,7 +135,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -146,9 +147,9 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
@@ -158,9 +159,10 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
 	 * the caller-owned buffer may be released after a successful send.
 	 */
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -172,38 +174,41 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 }
 
-/* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+/* API used for send/receive blocking calls. */
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
 	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0) {
 		ele_msg_send_rcv_cleanup(priv);
 		return err;
 	}
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		/*
@@ -214,7 +219,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -243,6 +249,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	const char *devname = NULL;
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -266,7 +273,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -280,8 +287,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -296,13 +303,14 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
 		 */
 		se_clbk_hdl->rx_msg_sz = min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
+		devname = se_clbk_hdl->dev_ctx->devname;
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				devname, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
@@ -324,8 +332,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -337,14 +345,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			sz_mismatch = true;
 
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		devname = se_clbk_hdl->dev_ctx->devname;
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				devname, *(u32 *)header,
 				(header->size << 2), exp_rx_msg_sz);
 	} else {
 		dev_err(dev, "Failed to select a device for message: %.8x\n",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 7bf2febefc45..07e6b6a1bafa 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -16,12 +16,12 @@
 
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 53091cc37e7e..a8974eef190b 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -284,6 +284,36 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	const char *err_str = "Failed to allocate memory";
+	struct se_if_device_ctx *dev_ctx;
+	int ret = -ENOMEM;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+
+	if (!dev_ctx)
+		return ret;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname)
+		goto exit;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return 0;
+exit:
+	*new_dev_ctx = NULL;
+
+	kfree(dev_ctx->devname);
+	kfree(dev_ctx);
+	return dev_err_probe(priv->dev, ret, "%s", err_str);
+}
+
 static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 				 struct mbox_client *cl, const char *name)
 {
@@ -328,6 +358,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	dev_set_drvdata(dev, NULL);
 
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	kfree(priv);
 }
 
@@ -425,6 +460,12 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 54b2a262a2c3..dd4a1ea7e35a 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -44,6 +45,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -106,6 +113,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0


