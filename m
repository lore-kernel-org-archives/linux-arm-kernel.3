Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589B2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZP3pfYuv5B3WVivpewuvZukasyQe3dvKgvS7+7X/SkQ=; b=p89CYJGWA5yfLC33vTiFjvBXUA
	4DRNt4qHKX76zpvubSlmEfgO2JdHURfwfhFw9XSWH8yOwpxC+9hkNN16slBJwbWMxKxTCZ8i0vHvT
	QlzaCERATcXcMS2njS5PHx57368Jh2G9evsloJqLD32D2ivrHEntYy5agNc6aTRS68QqvBF8SnI1p
	ntIoIz+0tZ23DEWnzZTLuXW6MkTks9K6nv3cDevQnzWsWOvXB6sojBhjoEmIRU8CDhFKDw6BHieda
	J9SXzZolzUIUTztyi+kGAXeZA88yO+BKwGkpwgU94/hAMCBKPjLGKYZDr84nRWqKNlaxg3Jwe16Uj
	U5QzSIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6dP-0000000DvZ1-0sMX;
	Mon, 29 Jun 2026 07:42:27 +0000
Received: from mail-francesouthazon11011008.outbound.protection.outlook.com ([40.107.130.8] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6dM-0000000DvYP-2nda
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:42:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h36+n1uWeZUt4xz/Gi01mztTQW8Wp5B8pfsN2PiGiPTNYQ+ssNdIqDZwR+rQ6Ydlf45s+36j6jwhbWnyaZPIYq1IaDnRqLkQ+r4MxqejYlwAx1ZHXS/EOAGQKZHZkAhjgoVicsToyNU2D2+PTw967vBKXTBJ91waJPtlQBhDbOFPwzuvdYg7+Z/JUPLS3u8Q+DJZaFvMUU4jEy/Z+9P8ZbQQdXJvdLQuwC90BAB5LVok1K6T6YhqQqH9dMh80N6h/TPzNIjNmn57PkWw28tSYsEc9+QRBGsQwD4MqYIq8kufkKiTqhGEAbCNKHC8gizfNKDl8a/Cp6GD90EKZZJxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZP3pfYuv5B3WVivpewuvZukasyQe3dvKgvS7+7X/SkQ=;
 b=Q6ZorfoqFWE4/S5SCOYKVQw7w9vrEaEAOImxPkKXQIKtolWW5k8wk769hGByV7f3U3THLZpCIsMuP5freoLn8cot07elZEPBBGWyAj2uOHEDJn7W+7N/tANNzsjF5Hwqrbp0nBz2qUeNlwzyoP0Ljkn6QDoo5/QHcKSR+o0Estb8lnO8pNu+JeO4nn7MsGdllbEXMnDR/Dmsfl+JsKgS9CEH8rXdpulk2zOgOYyifgfkVQWfRBacSHEaiC3m6x3J6JJ8Fdj+zlX3cNOFqgOB7hls4ZnVtDCX6uRlVFZddECOwOyy6SwbmYY+bR5WJTNQyar/DAIcYvGEwZ6ZkjlQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP3pfYuv5B3WVivpewuvZukasyQe3dvKgvS7+7X/SkQ=;
 b=RC1vsbPPhE1gQXEnMsSsQxHPDd+l6FtlkPNi0fb6Iii2MZaV33dkbItCro2Axoc4HliCw4DoRlNkFm9ft1ViB7Cz7gMBTcvUVJ9FgbZC4AaISSz/Ft1lrQozDuI+bN2dDuKzooX1zduOzIho2wdeSEkdKCj2mQy/mvC3j0aKv55gEa4HgZ+E3ypZfgTrLsudhGIsZ7HOB6UDKd2NadKdmeHH9VxRnpNrWwoPG1vRRsRgoTNJkQUEt34W+o2A2pbYgkuAN9Bb7xmXG2iZs1xBMnkNNcYK68rolgSlFwokDdgd7EDfARewXC7AmzlSG7odvQAgVh5svAInOobZ2SnSJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AS4PR04MB9549.eurprd04.prod.outlook.com (2603:10a6:20b:4f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:42:18 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:42:18 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 29 Jun 2026 15:44:55 +0800
Subject: [PATCH 1/5] media: nxp: imx8-isi: Fix stream ID validation bypass
 in crossbar routing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-isi-v1-1-deebfdb1b07b@oss.nxp.com>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
In-Reply-To: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782719134; l=2863;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=DhYU+0fyKaoIIURnfqGJUwqcu8nL0r5r8myOt8XH4Hs=;
 b=SVy4BS6DbZ7Qkk/lj3SPEouB6BevM62hQPWafjsaOOx2uS3Q13meYXJTaEcUGSS4gppc4CZ2P
 gKa6Sem/tyoBF4ns9maawW/ceBYAMvs/atBe9nLh3Us0lPKrf4FsraI
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::13) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AS4PR04MB9549:EE_
X-MS-Office365-Filtering-Correlation-Id: ab27a8e4-0b54-4dae-4426-08ded5b1f1f1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|18002099003|22082099003|5023799004|11063799006|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: TfdReEVLb+ht2oGIWH3TShClcHTuaHxdjv/ZJngkZA4VZ3Depil4eC+mgiKkqa9ANla+aJbRgWOdr8vYgwshPfYaaZqPlq8J1CCD/eSdHkp4KyNZ+ONNk3mT5UTi54+sqEKjxhT1zPpZktotwpVTJ0pmEohTYf8u8Sm2QrA6DlDHCyLXdbiBfoty/1HGU2Hdwi5nDo2Py3zxn+2G6QuJOpyicuvxoZqvmDORU3sDRvYKra6RTUx4I0w8abzE9VbW9Tc9nw4c7l3oUJuG0g/Ir50ieGVS4ny1YZi659gP5vs9hErMxnu/yBh4xO8+HR348q0BySOHNPmf/JpAIws8dOoy89pQU1vk2MfxFIDd2U44cW2PZonR9i7f9oPS4wfG0E3GOvMe+ki4GgxA+TssdYipyMbXlabSdO2STGyGR+fuFV46hNMmtTyQEuaYIdGfzFpqPz1zJ5Aus2NLS+nzE/vE9GadwoAACy5HUISjSeEkb1yYVHdkpyiQIYRIqPsrHBsvuIblwycOkTaWouDmIYjbnL80rAhenKMXny3bz2g8gnUpZH8ybbvbCBmOcD1exF4xme5R5nH9CrWHwdeBbeRJ3azM64i5tSqEJ+qBV7DQuYTFbhD2yKa42mQpq/lJo3hlijfrPNm3MvSQtvMwWCkmtpDSxRtxTibkL6mletU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aldGK3Z2dDNuTzNlWllJYU8vUERTdkFIelpzTnhFa3RDU01rQWVrdmcwUWtX?=
 =?utf-8?B?ajc3N1hTRHl3dnA0WXFnZElzdHdlSCtGdTVLMU1hQ3lDM21RWEpjd1ZDUHBM?=
 =?utf-8?B?VTJrUjVkekdwaUdUU0Q1V3ZqeUovV3NoR3gwRDFiUTdXWFREcUFuWWFNSmJk?=
 =?utf-8?B?WjFEeWY1NmRtSzY0TUNFdjd5ZjZOUkR0enFGQUZLckpYbDVwaHRNOHMwallp?=
 =?utf-8?B?K3RPeWxtS2lkYUZyWEZUUzB5TmFzemtWMURJY250MU1QS2d1Tk1MdXdQakdl?=
 =?utf-8?B?ZS81MzYwQ0tib0RMWjlpR0lxMS9WZHBoa3c3UFoxV0Y5WWNYN1NDRzFtMnQr?=
 =?utf-8?B?Z0ZkcG4vVGVEK0h0eFpSN3hocUxIamtkM3NiMG9YM0I2aTJNL2QvZ2F2cWJR?=
 =?utf-8?B?RG0xbWhNMGdTd1VVaHhuRDFtUkwwMWdZTTVudUtRenRENFBLYjdsRkxZOFFI?=
 =?utf-8?B?SEFGNVNTZmlyMHNxamN2aXpPYVZOZzVOeSt0VitZNjEyMUF0cnlyeFB1bmYv?=
 =?utf-8?B?RGJjdi9halBZZVFZbTlBN2UzT1lMc0lzMys0dzJxVlVDLzVRVEZJeDVTRFQy?=
 =?utf-8?B?NHBWbW9DdlVWZHNOT2ZIV0VaM3cvRHUrTkR1Vlo2cjJxZmhXT01tWTA4aWJE?=
 =?utf-8?B?OHVpcUxwNHNkbU9oVzVPMDVsaE9wdGJGYWRITW1MZXl0UEYzZmhiUS9nN2Js?=
 =?utf-8?B?YkM2ZjlyRzNlcDdWOE93QU9tR1RsZUhpSXZ2V1ZLOGc2VEJJT2VJbnFHZ3Nn?=
 =?utf-8?B?R3FmR1VWVXl3eVhvdTA0clEzNG9UMFREQUsxcG9ZVTM5M2RZZzBtdmV5SHNT?=
 =?utf-8?B?VGxFRXFoREZMcDl3ZDRDU3c3TGx3bFIrZm9xK1VjOGFmUjQrYUJCSndJU0Zt?=
 =?utf-8?B?SUxmVHJIMlZjYWFtd0tFVk9YTVV5N1YrZGRWRE8wR0RPbzc5VHpmT3FkV25E?=
 =?utf-8?B?TVRUeW1ueXY5cklEOFhxSkM1akNDc3pmYlNreHVGeEdGTlF1elk2ekR4SENC?=
 =?utf-8?B?OGVOU3lFb2FkdE1hL2hNbWJXdUJtb2lOK0dIcEQxUFo3S2Z0U1dXaUkvei9U?=
 =?utf-8?B?Y3phY2dvUWM0MGc3eDJoaS9CblMvOE13R0NuSDJGcjA1MkNsM1YrSkVISEFx?=
 =?utf-8?B?V2lqOWhid29jVUN4K3ZzWlZ6QXJsM3R5TTBNK082RlNOOWkralAzWnBTS3A4?=
 =?utf-8?B?K2U0bllsN0dWY29sZ0QvVHNRYmxnVFE2anZ0dll0VnVFY1kvUWdVTFVnd3VT?=
 =?utf-8?B?RW1tQmFuUFl5RmpmUkNmeXpHZndhMnl1Zjc1RlpCeXhrWlQ2eDduOEZYZUFa?=
 =?utf-8?B?ejBtNmwrYjkrcElGZXlMemlwTWllbWdpdmF0TnAzVytxRjl2V3BHN044MDZj?=
 =?utf-8?B?dXJtSWp6dndySWl6U2QwS1RzN1lPWG10Qk9Wa2pJdGpmcGlNSnhMWkhqVFo5?=
 =?utf-8?B?T3lPZmZ5RFRnZTRvQUd4aHRIdUtoTnBYUFp5bjhSQkFCbzBacno2dUwrMnVx?=
 =?utf-8?B?VXdwdG5NZDR1dnJIelhiYlYxZHh1SW1FUjAyait5aXhmb01QYnRSK2NWWmxP?=
 =?utf-8?B?NGNCVklSeHFoZ09MYjJXV2gvdzFVejNlcXYvaEJ0QjlwejgzQ0ViMXdndXJh?=
 =?utf-8?B?aldadlhXN0lrN21hZE94QVdlbHJScUlCNVgvSGpGWDhPcnlqbWIrYWQvc3Z0?=
 =?utf-8?B?bzRZYy80Y0kyTXdhNG94Sm9DOFZIUTdVSGZRTnNtTDAxNVloSTZGYmVPaXgz?=
 =?utf-8?B?Vjl1enVtQW1OVlJzYjZWSXdxOGV5UUdBNXlqbnl5Uk9FSk1hbWJMaUtkQ2or?=
 =?utf-8?B?dzhxTExkclhWY2dlRzZ5N2tLRlVLbVM1SFNiMEF4ZTVQZVRTTmxONEpMb3Vn?=
 =?utf-8?B?aGRGRW16dVMrREVhT2VMU2RoQlNkaWxlU3h3QktVb0ZJQ2VxSXBxNk9ybmpv?=
 =?utf-8?B?bUJuSFhvWnd1TFFPWUZxTEtRanZDZUdwUFd3ejVyZWtCckJUNENrOE9FVzNy?=
 =?utf-8?B?T01hNncwV2xQZU5Za2VUMStEY3hCdkZobGZtRXpycU9ZZU1OOUJrRjZCV3Jl?=
 =?utf-8?B?Q1I0Q3AxRXlQbktTWVNOV3VITG52TlB6VGpPenFvcmVjMnBOY1JSOG05dlpQ?=
 =?utf-8?B?QjhscWtBVEZJb2NGRDgrTnlpNVZkMUFVQ2dhOGFIeFFQM2NtaUdSanU5VkpH?=
 =?utf-8?B?Z3BGVVRhRFZFUVB1eERNVlNsQzFwVXFBdVhIVGRjcU1VNk5UK2IrdVZrSDgz?=
 =?utf-8?B?WWowbkQvMXNGcEJOaEZ6bFFHeTc2QTQ1YTRDWG5WQjZjUmVwWVFFeDVCa2ZV?=
 =?utf-8?B?ZTdVV2dJM3pDNkpBdVg4TFVxRWlXWmZaaEhNU1ZYdWJqK212YlNnNFdYc1BQ?=
 =?utf-8?Q?/BgsEDfRGc0zKTdwt1FYtNx3XZBkZhOhriA7O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab27a8e4-0b54-4dae-4426-08ded5b1f1f1
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:42:18.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abL/mxQyOv4NxJfWjEXxaTDT54W+ZAdVJMGdcFcbmkE/DwGzVdUZgCD4Y8S8CgM09AepfPL5Hs2dHnjCtWvi/cd3qc72FF96GPstApAnEi8klhUMVWwpB70tWTiZatcL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_004224_739810_212F6472 
X-CRM114-Status: GOOD (  16.40  )
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

The crossbar routing validation has a critical bug where it validates
the wrong routing table, allowing userspace to bypass validation entirely.

The __mxc_isi_crossbar_set_routing() function is called to validate and
apply a new routing table from userspace. However, the validation loop
iterates over state->routing (the currently active routing table) instead
of the routing parameter (the new table being validated):

    for_each_active_route(&state->routing, route) {

This means userspace can submit any invalid routing configuration and it
will pass validation as long as the currently active routing is valid.
This is a security issue as it allows userspace to configure routes that
violate hardware constraints, potentially causing undefined hardware
behavior.

Fix by validating the routing table that will actually be applied:

    for_each_active_route(routing, route) {

Additionally, add validation to enforce hardware constraints that were
previously missing:
- SOURCE stream must be 0 (ISI pipes are hardcoded to stream 0)
- SINK stream must be less than the ISI channel count
- Memory input can only route to the first pipeline (existing check)

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 24 ++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index c580c831972e..29f14d30dbbb 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -106,8 +106,28 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	/* The memory input can be routed to the first pipeline only. */
-	for_each_active_route(&state->routing, route) {
+	/*
+	 * Validate routes against hardware constraints:
+	 * - SOURCE stream must be 0 (pipes are hardcoded to stream 0)
+	 * - SINK stream must be < ISI channel count
+	 * - Memory input can only route to the first pipeline
+	 */
+	for_each_active_route(routing, route) {
+		if (route->source_stream != 0) {
+			dev_dbg(xbar->isi->dev,
+				"route to pipe %u must use source_stream=0, got %u\n",
+				route->source_pad - xbar->num_sinks,
+				route->source_stream);
+			return -ENXIO;
+		}
+
+		if (route->sink_stream >= xbar->num_sources) {
+			dev_dbg(xbar->isi->dev,
+				"sink_stream %u exceeds hardware limit %u\n",
+				route->sink_stream, xbar->num_sources - 1);
+			return -ENXIO;
+		}
+
 		if (route->sink_pad == xbar->num_sinks - 1 &&
 		    route->source_pad != xbar->num_sinks) {
 			dev_dbg(xbar->isi->dev,

-- 
2.34.1


