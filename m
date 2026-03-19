Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521181075273
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vr11wK9lz51LTtFjbDyoa1pEH1BxZiPwRVcF8tnns4U=; b=sxM4IBZvxG8RUVHwGY4yV3ZIYG
	XY1gqx0sDHe6CTnUSkD0fnRWxIPXQtdNgiFlGGaCUvdqfHS+IbABZ3c42duIte9QctkoVY3Y4DndF
	nNeVEaxnuoYo3Ykz4KMuei3mNApiTg+fv4PqyZ0QGZCBGu4wtEOAnAp4sZEpho6eH0jpPV+xtZip+
	ylNjoHV1AxtKeLRMz4aC8/4fHvsyoVb4s74DyTDV4HtHXfwnOccr2VUcZ2u6Ctms5LkPpXN4QdpvU
	svffhUzDfwLlSzO+R6abxP19F+tn6rCS7el7EppAh7Hh4yFVsi4MUAG9lqYnZugpK7holEpG4g0UG
	U1LMBTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38ag-0000000ADg7-3VrX;
	Thu, 19 Mar 2026 08:18:50 +0000
Received: from mail-northeuropeazon11011009.outbound.protection.outlook.com ([52.101.65.9] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38ac-0000000ADdD-0iIC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 08:18:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8LfF+Sc9bisEwhkHSBhsLfU8UCupoDMbd/q8fZs+0ZbkLVkGp2fd1h9QF1PxEaI77pCB0XjpaoB1GIeqNc3RIotFHXciTeYkFVUxXLyWjsFsCXSThAYqiDxKzDNKuRAMESp9R6DearADQ46tIkzGNZJXx0jAzOYzoO/QDB5B1xIBLol5wTFPalcUf7g1QKXIw2fmBH8NHm4vKVzfpA20aF/aGe7UDvo+ckAAiUWrwsm2FdoLEqSrL9EpDi2NxdWfwGZ+oIJqL1ArZsA6zVzmJadEXJX7jAediGKaHpUZ82/7mLk5SkoQJqcQ6QxdDG7pe71ziXubSYMenZpMuDOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vr11wK9lz51LTtFjbDyoa1pEH1BxZiPwRVcF8tnns4U=;
 b=UWFWh2OuodkTP3aBmjRQvtA2h3uc7fSkKN8JaNrYE9Yh8509kTMyCQ9Rir/XXlAeVhh4/krm9VrKf0HTOnupu97xaC/Ujo2Ii24NQVaHbAwKVwnBv77dW+vrcfWJLNlsC4M3f06YJtKw5i/a0qF2pObiLNl40XLbTB8H1XyFcWcPIT5lmUSU6qMSHeTL559HmbtEExOWFh4RgkkIOksm+oLoYU7tRXSmMO8GojoohkVXy26YsmE4SgHPiYTjLQsrn77CaPEBQRUzVjowGDzdzldoX8KYPoykZaUPYxlolYaR/e+Wf4MbL5NPpxElOp5N7YVz40AqpnxhuwAHun6riQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr11wK9lz51LTtFjbDyoa1pEH1BxZiPwRVcF8tnns4U=;
 b=Jc8XeDfKtCl6yOMoqz3eZ7iUsvT7Vs4EuHNgXWyDvWlPl1fBshCNZPvSwXDxExEtYkpV8texSxDEO0yn7tEvi1UZzOQ8bUhCvJ/BwBeUFdSATWuRRaoAMQgJxBirpo2VI1V+/u9tDKSozSq2JQhlYfdIu6oWjJBrTIf0CSHfPEV4BK1jr4QkyHV+brsYO3LNKBLeDU/sZrvDHEIJcrHRPYyMwPLsAKi5maaWjX8CWbD0aT7N6be+PZARe82YIVXsiOHHyDVcbis/yZFx/XG16ynkbN5IiVpK0q5xIKbXz5tAzbMruSbBsuF073pVZXUFrM+L8FkPZcItjh2Oy6TQVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 08:18:35 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 08:18:35 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Thu, 19 Mar 2026 16:18:49 +0800
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX91 9x9 QSB board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-b4-imx91-qsb-dts-v1-1-2eedc01d8af0@nxp.com>
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
In-Reply-To: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d406d05-fca2-43e5-ca72-08de85901d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|52116014|376014|1800799024|7416014|22082099003|18002099003|56012099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: O8FOP8JCA5CaLgLMWodD5Iq3YTTFRJunwVG9DUYDymWliE0c8ExQ6QTTxebGkvjoJS6f5ZAW9MYikc4JT0/acDc0kBk6TF2SI8faiAK6qQLAK8d1GbjeCcVyH4HzMalEbTNMEFt5ljpO7pA1rEMOqGyNP5+SODR2Y8zz6d2bND7VN5knaeJlsRgOVowSWKMvcgLcjsEJy70PuD9EgULnmB8lLMEPVEtprY2H/Zd1FFLOqDba8ns4qtfmwnORux2TCbeyQLKn8/ELL5YNroaI4O8mgp/oq5SJkT2jMMHwMKKAZr3tT+29b5lVS+SRyW9n3hH10YkEUxYB6zBDxhsz34HZ0gfPRYHy5oJ6vCwM7Co67X2iwn0PnnwYE4CdGlfwAqyREDoDNuDnlfbKirS3XQqkzWVXdXwE+eb03+UFNk0VrufJreaEl29AtS6z8KVMIlLRpxD1vRqNwdD+unDK94Aqb4TxR+XTp7k9Ts06EPTUTfzU1H78SIJ3uKfW0Nt2yINukBWU4Q7S47hJcIYigCgEQF6KGEhi+R3JrY6iSwb4s6Ibfujqgb5Zqsf7GvzMhwtIpvT9f3nEcT4bVTI90DGSuygj6OehaiYWx3jhwiTx21NTrksqu4H+2IR3rz2gDTtAJDcGg41S/qrM5w5U7mdExlLZAsYXQUZG7zfSOZh/Z/u1b3MSLXfIrrS5gdu3Ip9w8Qr9YoWJOeI9mT4GBk+c0E3TrMfc8/PKCHheoIXB46j/38JhOtmYrXIH1o6S6b1G0Te5A8rdqiIiGQ5bMZJd4Xm8AnKPlFmao0k03XH9tDlxpnY0F35xv32DVJKN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(1800799024)(7416014)(22082099003)(18002099003)(56012099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RURhbUplazh6d0NGSWR2aElQdXpNeFdpSXdPVmRxdm1sb2NBSC9yYnhWNGZn?=
 =?utf-8?B?WGZLNFFGTDMzSUc1Q1ovVy9XWkVyc0c3dWxEOVBZZE5SZkwyTEJOc3h1NkNL?=
 =?utf-8?B?bGJ4S2UwSkhwUVc5MElOdjE5dEhVRkpQUXJMK3Qyb0t4ZXA3dytvM3ZLRlRW?=
 =?utf-8?B?cmV1VEJRVDhMWk1NYXQrWklMbkkrb29qSTF5RzIyMHRud053anRTZkt0dWpQ?=
 =?utf-8?B?OFdHZjJiUVNKWFVub3pOaVMrcW1FWG5GOWk0bmxtNnNHLzVHMGIrNzU5Zzlu?=
 =?utf-8?B?dHNhdyt4RHlURFB2U25FSUFoVUluU3pGNHdEY0I2OXhsY3JwMzIxM24rRytX?=
 =?utf-8?B?KzVNak16TGFnQnIrRWl2RWYvVjA3Tk9VaFowdWF2dnNsSXNORC9tbkpJWTJu?=
 =?utf-8?B?UzRXWHZxTVNiTmlhWWR2Vy84M3REWm9mZUEvYXVZY3NjL0VKNS8wUk52aDh0?=
 =?utf-8?B?dXpjb2tQUUIzTlIwOTZoK2dQcDdXOWZPOEpoZUtBR1lHa2xLanhkNkpqWnBV?=
 =?utf-8?B?dFY0WmtXOXZ4K0V5aEU0cFR5T1FsTE95UTdjWVY1NVBxTmFIeFdTemdZVW04?=
 =?utf-8?B?cnhJMmtSeFVxZThRNFFrYXNPNHVWTnhiWFJ4bjg5ZWY5N0ZtTndwLzVuUmgw?=
 =?utf-8?B?OVVrMFNvUHVKYkxpNjlLeGdabmxzdW9HdmFsWjVDNUgzc0YzNkxidTJLT3hm?=
 =?utf-8?B?NGJXM0IyV0t5Z3NOZU5MMng4TEFPelNiZ2xoa1hySTQ0amRGY2RzWXQ1UXBT?=
 =?utf-8?B?NjZ4azl6YmlPNkRDVTNnRFFHV0wzMUxiTkFEakhwUGdHdzZrejJybVRneDBq?=
 =?utf-8?B?US9nQWNVNFJIVmJxeUtCQjRsZCtKQTVXbktsT1VVUjRlSHJOT1dXN3Z4ZCtZ?=
 =?utf-8?B?bnRxZmtzOWI1SGN3REZTMkRERkYvRE04VEN6UFR2S2xiY2VOVit4d3FVUVdW?=
 =?utf-8?B?Z1NXT1NHNnI4aEcyQ2Uwa25uRGRjeEJ0UTdickZYbnN0NVFmMGpmMmlPUFUv?=
 =?utf-8?B?NVVOTWJBNGJjVnBIdksrR2k0SDZHWGxPbUF1WjRZSWl0T1VEZTlkVEFkd2dO?=
 =?utf-8?B?NytGSGFEWVJoY2lnNHB3aGRVUXJlMStSNnRmQjNIWi96eXFKblpKOFBjRlY2?=
 =?utf-8?B?bDZob3lnVEt6dTY0Uk0yMXRhSkhteis2WW9mRGpJS1RzSm43ZWZwT0N0YkRp?=
 =?utf-8?B?VnNIRmNCQlZndjRTVkprNDhsT21reERGeU1YdzB6Z1F1LzZLeHBMUnBLYUMr?=
 =?utf-8?B?RllZNU5sd1pibUZFQlFvZ2wyempyZFFndFRjUVFQY2dVS3NKNDFRYkQzL2ZN?=
 =?utf-8?B?dGRNdFh3VEZ3Qi9Uc0w1b2xQQUdENGdDNE1aUm9nbnpPa0lVYXVZaEdoeEtL?=
 =?utf-8?B?dEFNalZJdXVSVUV4bEpwL05GVWpqTEJkSkxwVmwzTkhJODJlUE0xYTBvUzEv?=
 =?utf-8?B?OWFXSVBjQldxbTV5ejNFR242VnhHQVVZcWR6MjgxOVZZd0txTDRLcVNER3JH?=
 =?utf-8?B?WUdvUTlETEpEYk1SeTVlZUhsZW8rM0dhZ0FZMVNHbUsvTjV6YjRsM2dDVmtw?=
 =?utf-8?B?dGNmOFJ4VmRJRlh6aC9LQXdKblQ2bWJWK256TklndmxGK0t0MnZWMWNjdXh2?=
 =?utf-8?B?M29DZjRVVUkydUErRXo4YUE4SEdxSTduYXpTVjRnRE9MU0dkN01jK21lWmdz?=
 =?utf-8?B?NkJHOFJUSWNtZW1MblVBbFBQdllWbmlIZW9pcFo3Z1FvNTdCaGdQVFpodkJy?=
 =?utf-8?B?UkdVWjVNTmJPbEN6czVIV2UvUGV5RXhpcHl1SXVnWjRPbU93MUFKMkcvRlEy?=
 =?utf-8?B?R0VPbExUdFNBeXRmakZzaVhXUHVIdGhnUUQvcU5zbmZIQW1xTkQ4SXF4NVAw?=
 =?utf-8?B?YUFSVi9wWmJ0TlZhWTUrUktiMWk1dVV4bmZTRVJ1eTB2K0N6aG5TRFFCL3pX?=
 =?utf-8?B?UnhDNTlBUDhzaVltZ2JpSnFEMWdSK01QcVhqdzlRNkhhL2h4RGJFOGorYktH?=
 =?utf-8?B?VW9EWkFsUkp1bFpLU3BVV1NJSmw5REQ0TWFpSUhxeW1wRDAvMXdJeVJvSTVi?=
 =?utf-8?B?VzdJQjJXcUkzNHZtRU5WcXFadGlROFU4SWxFQkF2U1UycXBOUmhwRmQ5dlRz?=
 =?utf-8?B?cnBsdHpiaFRrR0VNMG1pK05IUFdrZlY2SlB6TjVtREg2YXVmZWxFZTUxVVBH?=
 =?utf-8?B?YzlEcVNaZlFYeHBVS2tmSzBkNFdDVm1GRTFBZ0tIWjUvWE43UFNVQzFMVklK?=
 =?utf-8?B?WDQwSDB4QUE1V2ZrRkFFY1RLYlgxNFA5dko4WHl4SzJRUktmazBsUzh2ZGFJ?=
 =?utf-8?B?VTZEbzFibWVTWnBvczA1WC8wRVFqcklmUnNueERPWE1SdVlvQUkxdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d406d05-fca2-43e5-ca72-08de85901d96
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 08:18:35.2629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6aiyXNpdg6Vj4YAIMkSxKcB4MLDpGPXq+W4N2eRy9s+dUs8qNrYUl4EUFoPzcI7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_011846_218187_D6D7F9B9 
X-CRM114-Status: UNSURE (   9.51  )
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

Add compatible string for i.MX91 9x9 Quick Start Board.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f6417317b3bc904cc5c1953e64e21ea..6a94e0201f704f87df8b5bae0fcae9b2d9133f91 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1458,6 +1458,7 @@ properties:
       - description: i.MX91 based Boards
         items:
           - enum:
+              - fsl,imx91-9x9-qsb         # i.MX91 9x9 QSB Board
               - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
               - fsl,imx91-11x11-frdm      # FRDM i.MX91 Development Board
               - fsl,imx91-11x11-frdm-s    # FRDM i.MX91S Development Board

-- 
2.37.1


