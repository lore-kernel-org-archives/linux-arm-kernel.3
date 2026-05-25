Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC54CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 05:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZ1165Nl/d2RVlyQ9pUOxC11xORdcffFfk+jsgA83ww=; b=JuTkl2IVim3RYM0bXoU/6+mWRt
	8lkhcgvSIMmwx3KYHdSeHsf3S+Mw59YeBRpE+ho7QIvgjP1KPh/dFjjXKcmbzF1or3/0tDCOlnNZk
	rDDw9dy/lqRK5pji0V+hBvJw9S/Sk8fZvE/xVWYePRElT7NMqJhDKZ8okDdNhR6R5nVSW6pR956SJ
	OASMBgyjeyIEfmW6PkyEisfyQqhqV84hFi9AwdJyN+O8G39AdO3WFok1OSQsma3vMXMRfN8VOza1p
	/Tp4uvi2KotWQTYH5Q9x3LA5U+adyMj7ZblqouxaBZy9PJjbZ7Z7wpOxqaJw9t4b7Oug+ggdlrlkw
	KzKZoncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRO0F-0000000GKwL-3MvH;
	Mon, 25 May 2026 05:37:27 +0000
Received: from mail-westeuropeazon11010045.outbound.protection.outlook.com ([52.101.69.45] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRO08-0000000GKrf-2fMg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 05:37:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYYY3/x69CRllxYdbMX5nslMpXN6XHmud3PocwwYIq4wYSP3tBcsuP9EfE/bXLX/q0746ys89JHSBP7+HfAhAhL4BD1ymXga2kjwZZQRJM7eRP+fuP+s9VErMx4pVAGdpW21Upy9vqEOh+QhZ625UzAIongrjYtxUKgYpJf/XgXe3Twv701BlLy20Xj5PeoG5xur/PD5QNtE37FuN01bzki2HR2dmXfHrNlr2UMoOiqpoYr2+cO0sd59jbny1Z46SfqNMzoTsX5OBxdxYThWSrjpoh8IHGqBog9sKVrIlBDfRdYdVV1VqnQVK1GoSCBq7L7bMv1YaUvQi2TNz/lFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZ1165Nl/d2RVlyQ9pUOxC11xORdcffFfk+jsgA83ww=;
 b=Sk8OB8tXibp1/td3KNHrGVt5o/+CNWcVMUEWNcop400OExtBfuA+Qu0oy0yZLX76F88rSMc2e2tkDwyxYG+YtT83PcbexJWU3fi/NJTHN6Igm0zepjFRmdC7MIQh216Q17JYzN4SfaZGZbAs3aOtfZCHTMG5zZuYXZwqCdcTemONWfQsZ0psccjNoP1vfMlC0azAXpsFTiAer+LTivfOcxuHfTqjx3jKwDcA5082nIKQN24uGL6q/Y1mRsgHAkXx2vCNfrr11aaJsC6DvYBCztf4JV1wwChPCNQS98xLqhSbjk6yi3eG+Muo37EafYDGdZjKfndw5lxNDSkS2jvLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ1165Nl/d2RVlyQ9pUOxC11xORdcffFfk+jsgA83ww=;
 b=nEylpHXmBM7wfaqqRhyscC78C6WuOxVBO8a3zqOAzCPL88ZFnog4VxRXLi43Az4YqhnpX/mwqiTRjAgwAdrQcUnUcwvwCK9JiNsND1VZtgNbhLDt0y0Q02YiAvPzdRCHL9pc34/w0FLIPUjL6AriVtPlIjA1yXa6zEDcotJGFwPP4x0pkQi0gMkjXGq/BBA7OAUaAGmg9BmT0AXwHvwwlfvJgPlNhoTKxBQQp7Ts2aj/CR54n+zt2DpeXRSGGtFiSyLtFrI8wfdtvotvcrIX0XICq6jd5zUl2YQHNeDPCImWfRGrhQ2Jvdggh9jaRlAcNpz+7ztJIHlfPmdQzrIoHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by PR3PR04MB7257.eurprd04.prod.outlook.com (2603:10a6:102:93::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 05:37:15 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 05:37:15 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 25 May 2026 13:39:26 +0800
Subject: [PATCH 3/7] firmware: imx: ele: Bypass memcpy when ele_get_info()
 fails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ele-v1-v1-3-a9570c4bffc9@nxp.com>
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
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|PR3PR04MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: dbefe960-95e0-47e7-1300-08deba1fade6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|18002099003|22082099003|56012099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info: 2dR2EZdXc4JSPRFL288Xo+ufrCd3pJbhsaMIHxHIdkejlWO6y/0y28lq1fOQx1TNzSOJ4FQzIR+EZfRrjWOGK9yqYJiGV1UFFHY6KMpIUfB82+x7HLIoKf+ACG/qIGFdsTTYsU5YsSND16alTVf01hBsr26LCWY/xJfjE02ZuPXxjsoNGMqqJmP+fxUq1GhhHpp105nX4ywIAdaWURrR2ctgXiaz0mbyDQh9THAGN+v5AUJGUaAcNUhIHmRygNJR6/d9lhgd6vydo5NCgLeVwIuqKybJ/x6qnPd6bIyiVCTW7zzMcYlemDyx/cjt26IJgwBtAOe+J+p0Kpn4OTPKOmUbRyfDdEFAf7vlUbS+d8a8RLo0mNiMnCrAkhGY4K7VTkoUXK8+5IZqLZu36e+crq9Zm0kbkKf55Add1w9wvTNCP491orF71ImOEpqJuhcIYNihkEE3PNW5LDT9i7P3rQfH7WbBdCV6xzgEu106uJ+abY6aIgiYgLtewyYdCTw1bFTUdj3iWTKyfGu2pterztay48bxJD+wp4AEUN8gJuBlctpxrbv+vTyNfbfFdm2+IzpENQ8uSGbLpgmoKXBPUM7/rYFeJ5SQ8bL0V5AY0K3Cu0OhhGcPVkZtoychWR8sWVlFVDeKkG78b5GDxGk1qqWz9QHEWUwo4qffIdC5PmYB5WWtjtJxkvEjtzdPlSf6jMfJ54YzmofvZRphYp8aK9WiEQG/DXA5etvaXuU4c4c4PYoyL8vW5Zc2fN3WEyiR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(18002099003)(22082099003)(56012099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1JHMjNMemxwVFZwd0FIM2pBOFkxbDRLWmJDc2d2Z0J3V1BqTUs2cFQrY0xj?=
 =?utf-8?B?QXdweTdOSUZVMVNmQmppZXlmVmQvY1lTbWJqRngzQUhnOHN2dHZWczZxOVRp?=
 =?utf-8?B?bVg3Ri9ic2VpYjJUdzB3VHZFckJVanNDRGNlNjM2ZThhdno4bDVIRVpjcUtr?=
 =?utf-8?B?ZGljRER3Q1F1cVlISlVVM2ZoNVdDUEpxNWtteGdkUmdXZFJoQmRjUk5RZVA2?=
 =?utf-8?B?NkdYbys4MWwzRDVYOFBRSlIyQ3Z1R0NyaDNUNkprZjZjU1VkdzNPOVN5WWVI?=
 =?utf-8?B?eHVETXMyUFVENklxYmdYTUY5QTVPTGRCRFhDSDB3RTlxeGF1NjZWSWNCUVlu?=
 =?utf-8?B?bmExa2E0VVZaNUtaTlMxWlp4SCs1SWhoMm5YSEQ5Nm1oZzNNWDdHbHBiRWZw?=
 =?utf-8?B?ZXJmZXFlYVI5M3E0ZDYyV3d1SUJ1Y0NvT1grQWJjUG5NTXlBblArenl1TjRv?=
 =?utf-8?B?WE91MUs4ejEweWZSRGtWYm10aEw3UU1DQWxVWWhTeGlrL1ZzVDlCQStkQ3dh?=
 =?utf-8?B?T3ExUWVpUlk5R3Mvc2JrKzV3NmNBdW90OUZUb2ZJTGdpa3hvVGdSVFRlL0hH?=
 =?utf-8?B?cllzVE0xNFdoYW9pUXZrUmU4Z0lQRlhiZGtLSXRDRDBadWlHWGN5UmNRTFJu?=
 =?utf-8?B?dFh0RU16cjB3TUZFUzVWQWxZU095TGF6a2FUTndoRVdoOUJYOEdRM0N0ekh1?=
 =?utf-8?B?VTVMcWpaUnFhRE5pOURlZHFocVgwNEdqZmk4enJ6ZEc0RUtDazduTGFMYTZC?=
 =?utf-8?B?TmpIUVZzR3lFdkJlK2tsMFdHOTgzZ3F3TlpYYmNGU2JzVlpZRFREcjV1andq?=
 =?utf-8?B?Y0xreS91OFUwRHp3S0k2bHdBNmFGaVEzWHZyTk13UjJ0OGZtTXBXQWo4Y3pM?=
 =?utf-8?B?WkpWM1RKeWlNMlc1L202VFd6U0gzYU40US90QlUyZUVmYm9SSmRGY2ZNa0sv?=
 =?utf-8?B?bFlteGh0SGNwMUhBb2R3QXhVUmtCOWJZREhpVVdhQ0dLYk1jbXBUejlTWGpw?=
 =?utf-8?B?aG02V0lqcnY3dnBsQnkyTFozbWtYUXJ0d25EK3VxUzN6YTZySTRSeVBLbm4y?=
 =?utf-8?B?aG1lVUNJcHhIT1hSUW1CQ3RpSVpYVkM2V0JLeEtENnp1YmdRS1lrSUpYMEhn?=
 =?utf-8?B?SSt2TWVZVTQ2MzVURVlsZXJDWmxVaUZWNUREaUhiOFRFODZjaDlBa2pQc1Z3?=
 =?utf-8?B?TFZWMzA4TU5IOTlYYXAwZi9KVlNaWng2RXordGJCSWFRTXVsbzA2ZHBPdEJu?=
 =?utf-8?B?ckIyREg5NG5XSnBFbTZ6N3ZVZnNsMmdkOURWMTZsbjZvOFdRKzlRNklnRFQw?=
 =?utf-8?B?bjMxTU9lUFoyM0ZBdXZITkZ1UFUrWUI3dWxRc200ak5GRVlJRXdQVWFSTFcx?=
 =?utf-8?B?Zytjc2dEYU1FckpKU1lRaGtYMDJQWkYyZ0duQkF0b3BhNlUyN1pjclBOYUha?=
 =?utf-8?B?aHlISDI5cURMWDllK3E3ZmhQcCtrNmFZNm5SVmtkeVIvM2tCbVdPMm1Cd1FF?=
 =?utf-8?B?eEczZUpKUFFGTGErL09zM3RhZllpTlZzNVRObWttVGt6RitHcjVGVjM3V0Vk?=
 =?utf-8?B?Z2NmaVI1QzdmY2RtSGRwaEQrcTlVdGZNTm1wMFdMTlZqeGpaem5ZaEJPcHhn?=
 =?utf-8?B?OUtwdllNNDhTYlJORit6OTlZVWQ0UjJ0K1pHcUJjWmxUeDBHa3JZWmxwTkpp?=
 =?utf-8?B?SmUrU0NmdVhKTVpwUThVam9GU3Q1cGpHU2ZQZWMvazVNUlo3YUVxVEViWU9E?=
 =?utf-8?B?eHZMaXRvamFsNkUyY2Nyc1VMbGFmQ2l3OUNwSE5BcVdoWEV5UW96S0hDdS94?=
 =?utf-8?B?UDhvVDZUWkFmMmRkTmlOem1RVGRQK1k5UWRxVXVMaGZxMTZNbFQ5aExrUGxw?=
 =?utf-8?B?ZUFrNGVVUVh4S1VkWjVwZXcxWEVZWXZpdFk4elBaRVVVS251U21UcFdGZWpI?=
 =?utf-8?B?SkFub0ZBV0FqOXVBMWpwWFptY01rNDNtdERJbVhTZTNWRzUwUURYY3hwak5m?=
 =?utf-8?B?QytNTnk0cVFPNTlaK1k0a01COTVjNDMrWFZzdjFTM3BGY2h1KzlSZlFrMHA1?=
 =?utf-8?B?elJ0Zi9sTldKcUVjMFJJeStwZ0ZNMFRMQ0c4UXFZSFNmNlRsV0dDUEhEanow?=
 =?utf-8?B?UDUzMVQvclYzWU9ZS0VnMmNwdlVpQUhaOTBiVHNzN001NkZRZVNpMHhJSjlS?=
 =?utf-8?B?aFBEU09oaU0rcXIwWDF1ZWZxd0FJdFdJSXB6U2JYMERGLytNWllBV3l1MW00?=
 =?utf-8?B?a1VvM3dwd05wQlhRUkRsUkRKd0k2dXNKWmFaL0ZISk5yWFZZSHZNTGZlazBY?=
 =?utf-8?B?cThQeUQ2NEFpZUFhV0NSbnhwNlpjUTd2Q200cDdKTzJ4TnBRQjFtZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbefe960-95e0-47e7-1300-08deba1fade6
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 05:37:15.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ3+55Mk+2X8bhVnIA58up0HOi8s+/j2Y21mRdM/evZuToqiR4WVrGa/DFvppske9s/MOm6iYXVNHHCvDnUOrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_223720_681671_4FB41FBC 
X-CRM114-Status: UNSURE (   8.45  )
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

From: Peng Fan <peng.fan@nxp.com>

When ele_get_info() fails, no sense to copy get_info_data to destination,
because get_info_data may contains garbage data, so bypass the copy.

Fixes: 106ffe5d78ad8 ("firmware: imx: add driver for NXP EdgeLock Enclave")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index f6346f15450963b9dd8d2df7d3e6b2ce6b4602ce..05a518df38cd6a068266757969b361249ef0560a 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -95,6 +95,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 
 	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
 				      ELE_GET_INFO_RSP_MSG_SZ, true);
+	if (ret < 0)
+		goto exit;
 
 	memcpy(s_info, get_info_data, sizeof(*s_info));
 exit:

-- 
2.37.1


