Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715C6CD5BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 05:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wN6p5ipIiIYD/CpscowQBMdhRp6W2cnFcXjzihsioww=; b=v9+JySjmm8bkErzYaILfEMn6CF
	PoESEZhQFjZDx0oQqckzgLOWUHGy6fqhh1R/F//Tbi4ryCuosH+nosjkPKqBavK2d8Sq45xNj+M4O
	3cUawpDZQOaHNZ7UE6F8OoZ8U8xjPFFvpNByDL55lk3hbo641ULQfD0xTD/1/Qg8a8YkUFXgeW0/C
	/GeOTh+kuFG0+nU9FxAMAQcFlTtZZ3MpEUoUrP3u43/39MmcQpzeWNgzmcyW6Q0KgmvOOye0y2yrX
	T9JjYrvyfto3AcVd5vSle7AruET4OGFEha2JQpflceZMvWqAY5kJyV4AFa1Y7augX7cxa0g1h1VA3
	CuKYC/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRO0Q-0000000GL2Z-0QPw;
	Mon, 25 May 2026 05:37:38 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRO0E-0000000GKtl-029f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 05:37:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6h/FIkl7O4gV0q5MEuOA9gaVPMMe0a3UpSvKtZJxuP6qSp0q9Pb3K+qK/YjqrGrlz4kX+3Ac6wTMwgn0c2dnronhqVgHpf1Cu2Y0h4TWXX2BEjaqpfmenE5RowarnDXIsRejseCSZwcrzQjfB3PqfY00PvzWq8etaY2IO7pmpMqhJBwsc4ATblmau3i8B3DVd7sbK3LiwTiUxXPGWkkgbzccp6JXisQtMFcB2c/CJ2b374NaS5r7geOtS+L4zXU1d7LU3KJFCoaipbbMGmsEHxP7VW9ILgz4u/sH0sJIvRuTLHOsjNTzfXhJercBXWZwqcwnUpNKr53EuUVOdl8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN6p5ipIiIYD/CpscowQBMdhRp6W2cnFcXjzihsioww=;
 b=T5bDFZuJRg8HWCxeg0cAIITYqvvH1YADZHgzKqQLXmig9pclI54QWHvoUOxDQXs7h1oN2/iMO0Sd8YBUVJGB+tNNeETH1VCf9BGT54Ju7zmq/zm3bc+f9i/hkrD018qJoctxP+S8xYlqFbbeQmllYEYACSv0omVfCj8yngyOCmPSYMnU5HDipPztD66GC5sUxtLdyopPrspw9/jbptw/MkDgG8prjT6/KjYgCTeFxxX/IXdX2cXKBd2SleUy2Ef3XJ4TMzA9NTdWJJGP3oCJGBJSQsJom0f2Cp96wB5jySH9TohnMbktAaSPcmEevZ4INriUPEmfIcWXo6AVLpgLww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN6p5ipIiIYD/CpscowQBMdhRp6W2cnFcXjzihsioww=;
 b=lx9NdvPThas6wUGOtOBV16YdvcnJiXYDJftQT2CwZ4B6t+4AYZSQ9YDD3YZ3K8S9w57UWM19A4zJH0hjHtHQhbxE/aaNlUFHBnZ7AvAnC59mWQacBpq7uKtMPAt6mXG+JJPlzDqIiWPQClNqyhmcTeDwE9hRsUjqiI0B2DBcLvnMaeea+otSy8hI00AOkUPdouzkMMRX+zbCLSk16vrSEeKxbCXxx5Vsdbq6D4iYhLwaAKKlot5C/pU+b3Dh9WRPm6+ZX7gwzDlNxt87JsJuFdz+Bt4dp3QjF6cdpGRPaU8/oA6DP+e9y1dGKWN4PlifYi9P3Lb4PoowQeSW+Mbi/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM0PR04MB11996.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 05:37:22 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 05:37:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 25 May 2026 13:39:28 +0800
Subject: [PATCH 5/7] firmware: imx: ele: Correct check_hdr_exception_for_sz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ele-v1-v1-5-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
In-Reply-To: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM0PR04MB11996:EE_
X-MS-Office365-Filtering-Correlation-Id: df032414-6c55-45a0-c9d4-08deba1fb18a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|6133799003|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BfGA1n8ndkAH+rKHZkKZlejiXFKi1tSE0iarCgPvZvGojgSamGYmEG7RfyNHVUBrROaSm2FToO53E3uJTXKQhxxI0CAUmh2NGEhurYzukFMaG/FA1H8R39Jp3Hg7EYbzeejjHQCTLFI9QNc0zj03kx0x9mFYRuhhQbAwIs07SStUJOxtP+2hdLRmEjuHEP0Pxd/q6AgzeAuF0F3TlmykONg79Da9udaQ0A0cqLInHJ9v51oOpbpND+D7/Blo9P8uvNNQ0i/1Cb14v2BUiNwpePUjf/tYuKwMrIHSWpWSNBVUidvJFK67YwOKi1VXXIePZ+lI3OryzsPPFPIS/2NtdmfWK3B+6z8LlM3hviUaIIEp+el8MZuhsrZo1BhXnFimdnaH+vl80bVRzV8UXyDsPDqod1kyepscie6dtzcjmuKXgL9lu9jpEP6/ztsi+QPEkMHZUsdKucrkYGJoqGxCLTPAXX4fE3kuDSbWGVgMzJPDQdbdce5GF1gzYM+WsplJQLk4QB0ZeD/3mSSI9/DVaDX9/FBIMupt5UU1zo9TkVQj1SNZdnx2vC/FzdiSTxapiV+R1gZhWA88Zz+Wbq3HTS3ZTpY8NOQWidSPrJ2X18Yzj8cS5wcx1jj8SkG39iKpdI2UibpehPqz14129cLzgzXJpx+viA8HlOmoUrgXwPU6qRObRhY/CyPmT0MJpEe/RnLvz9tIx0aKPn8/FMypHxdacgF1VyGa213EidvPeNGJgpMJ4cHLEW5+aoXONlCq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(6133799003)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDNnSUFhSVF4Z3pTZ0IrRzI4MlAwamZtTk1LQWRCVmFiL3Q2bzZJaS80UXRC?=
 =?utf-8?B?WCtkNDhZa1FiSVRBTUdXaVgvaXZWWlhEZVJGL3VRcThvRlJDL0RtNEduSlhl?=
 =?utf-8?B?MW52Y3ZTNkZSN0dWYWh0TUZESWIxdjRXelRidE14ci9hTXg5YTBWYzZKRUFn?=
 =?utf-8?B?cWsvc09xc1Bjb2pnZVA2YWlsdnhiaXNLdVM4Tko5UU0rdmhUbjlrK3VPTytZ?=
 =?utf-8?B?MnBxVEdxMWJVVWtDSkxpMUdLL1lkeXRIa21LVnBBbzM0Tko1RkN2QUFKclZU?=
 =?utf-8?B?em5UWjFPVm9ydkl1NGV4TXl5VW1GZG82ZnlVK0VsRGdlaEVzMklqYnB0ZXZy?=
 =?utf-8?B?WUJ4b1krMFhlNEN1RXJxUGtRazFEZ3pnK1hJbG83Wnl5STk1UG12VUcxOU1u?=
 =?utf-8?B?UjI2bTNuc0crY2g5Mm9DQ3V5RUZlcTRoVlF1MTVFMXZDajFtbEYvaWRVdU93?=
 =?utf-8?B?bnhaaVFtaTN4UWJUWkpGN2orbStvNjhPcFdrTFo3TDJMKzRpYlRUR2dvYjRq?=
 =?utf-8?B?UTJIODhlTi9qR1Rrdm1abVZieWM4U0tuNExSd3ptKzhTYnZRekhQYzNyUEtO?=
 =?utf-8?B?Z3FZakZPQUp6VElUMGhzcHE3djBrRGpVVjU4Q1BMMXlPSWlBUUV6Q0RwYzUz?=
 =?utf-8?B?MVlwNExaR1VUNW1aVW00TzF0SkhUS3h1NE5ZbjRrRjFROUdtbkR2UktIOTYr?=
 =?utf-8?B?N3JrZERTNXpodzFZK0JqTU8rMTFOYmtEeDIrSERUSUhwbnlYOVJLb2tUSEsr?=
 =?utf-8?B?ZEVjZm1HYnhEZndqOUxpM3RJWGJlUE1udzRoLzVXMnN2bEtHRzlWa2IvdU9D?=
 =?utf-8?B?VXcrY2tjOHVXQ1pGdlhHbGpXc2ZudlV4cks4RGdxMGI1MHpodk13U2t4WjZC?=
 =?utf-8?B?c3hvRG4rdW16RzdWYnlsNnlGdDFHYjJ4b0VMWVFENG85cXhjNjJ3L2xqQitC?=
 =?utf-8?B?YjhmYmE2aHk3QUlyakxBeUV6MEpIVU5nRE1aNTJ4a3NHSUMzbEErS3dWU2F6?=
 =?utf-8?B?c2d4WDM5Vi9lQzQ5SzhQUC9iZVNqclQzeVRmMkkxMmNhanF5TE1LaWNBTU5L?=
 =?utf-8?B?OHdyNGtud2tCUGMwZFkyemlzdm4vWGlZWWpjckRrK3VZRGNLb0xxbjdyOVN5?=
 =?utf-8?B?ZUlPbHlHaW1YRnh0VW5sOExQQTVoMFdPUXY2VUFYbFJIbmRrY1hVOFpDdldq?=
 =?utf-8?B?OGJKb0JVUEIvUzJqR3Yyckg3czBqcXBMNkR4ZlFkWE93cXhnVkZ6V3ZqZmVP?=
 =?utf-8?B?dDRhTDZZNHVSRW1IMkNPRmlHVURySWQxQU5xblE2alBPelNiNWhOLzliR3hR?=
 =?utf-8?B?UVN6YnlJcEpGcjliSGhpeVdOcFZLeWk2SHRCQXA3UVhMaVJQZVVId3lEUkN1?=
 =?utf-8?B?MGJMbE5JVXJnNVBQWnlHMFo3SXQ0STBtcE9sNjhnY1BwSUVNSDBMOWljYlhO?=
 =?utf-8?B?UUx4dlhVNDVtN3IrRUlCVG1VL3RleHZ6MTBNWmVza1lVNlk4NFdXOElLQ1Bs?=
 =?utf-8?B?b3RGUnh5THJCY3NDRDlrRVF4Q0JCZEZ4T2ZKN3U2MGo5b0VLWjdaUTQ3Z1d6?=
 =?utf-8?B?Q3NXblpXV1NvcWpVOHAwSkNFZ0pjNEIrelVnVGQzWmxCQW5uTVhZdnYrSlQ3?=
 =?utf-8?B?V09rOTJ4TXhNNXV3anZwTjFpVU5mdnhDM001MHNSelF5MlZIUkNPeDhRVTdS?=
 =?utf-8?B?VmdMRlRMWXBOaTFkMzdZU0tzMUVJRkZBNzdXOUhkcWlOZzhXZzRuVVMxdGZG?=
 =?utf-8?B?aTFISFZZYWpiRHl2NU9BRHNLbFhKNVh5cjdpeW5oVkYrOFgwV3RBcnl0ZTlY?=
 =?utf-8?B?cndRMmlEdHlGelFSS1VFdjJsUWxwdUR1Smg2R0N1ZExtcXYwajQ0RWxRbUp6?=
 =?utf-8?B?T1JLZW9hUWp5eWVaNTdVUmNiWkFXT2V1cERDVEdWVGhqM2NFbDEyUEZWSnBs?=
 =?utf-8?B?d0oxU3J5emRKOCtaajVzRHRZa3VFYkorbFdHVFdZRTJPT0FodTVTVmtMUlFz?=
 =?utf-8?B?TUhDTWVjbDAvMnZiTHNmVzdub29HZ2FoQ2RXYWVlVk5ka0t3cWZhSTc0ZUtt?=
 =?utf-8?B?NGRWeUd4UlgxWktlZ2NpOWpVV25MTlQzWUxVY0haR1JwTWgxbHM1T2RCM1Bm?=
 =?utf-8?B?cG5CbTVXZUFra21ZRmxESFZTTytYTUhoV2xJRlcvc0ZZRnVmOTNmbkNTMFdD?=
 =?utf-8?B?Z0M3Q2hyU3lIbFRJdGt1ZzlhcDZyRXlMYTVBNTRsdXQ0RzRYamFGQU5hbjhS?=
 =?utf-8?B?WGFmVzN4Kzhseis4azA2eWhlYzZmYzdOeVlybVlJYWc0Y2krYWRMSURuQzRP?=
 =?utf-8?B?SHNtNXpBME5rUFQ1bzViOWlXM0xVdUZCSklaejA1dXpXd2l2amZ2UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df032414-6c55-45a0-c9d4-08deba1fb18a
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 05:37:22.1513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vtwRx+5XpTl2+/PacfvIUPrswh2VvbH1nyPLtsb+wkZh25sxx/POtuaKRTPdxqa0ccpkywoMcJBbHQVVdMT7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_223726_053752_757007C3 
X-CRM114-Status: GOOD (  10.36  )
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

header.size is u8 type, "header.size >= 0" will always return true.
Actually the check condition should be ">= 2", because a valid response
includes at lease header(4bytes) and status(4bytes), total 2 ints.

And ELE_DEBUG_DUMP_RSP_SZ is counted using bytes, need to divide it by 4.

Fixes: 106ffe5d78ad8 ("firmware: imx: add driver for NXP EdgeLock Enclave")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/ele_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 8daf32eded43c62daf56540b63e292bf0c6c9845..76bd3841acfcb1ff33d3bc5d900300493190b8a8 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -164,7 +164,7 @@ static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
 	 */
 	if (header->command == ELE_DEBUG_DUMP_REQ &&
 	    header->ver == priv->if_defs->base_api_ver &&
-	    header->size >= 0 && header->size <= ELE_DEBUG_DUMP_RSP_SZ)
+	    header->size >= 2 && header->size <= (ELE_DEBUG_DUMP_RSP_SZ / 4))
 		return true;
 
 	return false;

-- 
2.37.1


