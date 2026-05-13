Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7700CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/sFC2kSGTyFtrbTtclKppW4ZsYj3YmalyhxxSPZBTP0=; b=kg1ndHdaDhzjv8bt1A+jPhxeoF
	59BiG1eFgG0s6KjPdb4lgnh2or7+rzTw0P1BFXVF9ENrWwwn80O6UrBNTk94YH4VnqvAY6WA6jzO0
	C+10HlWO53Gu3TttQKVBc3wZr1YePDSqB2aESgb50/ZzcyNFr24sibSMTxCYFGF9nn3mYK2uFF8QN
	bmj31Fdjch+9VPIZpOLsqrqHF0Xm5S0UeeFeKO/BNn6WivVTV6mo0luByPKz1jU9Rk42kEL7EpYIl
	gHCTAGX/kYtsZ5nsNA/ct+WxNZwlo7qe40QbMzD5Ks+eIEwR/Ff4KE8LlXJ4Pc3n5ZfjUbXgwiFRc
	Ztwqq1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAb7-00000002w2B-41Ih;
	Wed, 13 May 2026 14:30:05 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAb3-00000002vyA-2Ho7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:30:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm2AJRaEEDx8mJFyJf+2r1rn8jIhZZYLUg4Jkrr9WTbYIjt8Op0d7xPN+RnWp6YRkKromz2U2B3Ma/D4Zgjdd/LVz62phFjf70F5vLHb6qBu/ou3G7mIZZYDkeSfXl23Nux+gvEJsF+Y0CfdJl497rPaQh67rs5xW8XXAhzCWZasU1jnLLODNOp6Y1m5K+21pKLU3KxXtV90Jnv6ENpX3js2FcoQF66OS/54lKj2CyN2pDadZapF1ma6Ozj2K003riPFViq7ZjLLKCDNnvEBMbIku9oqr3Fbn0f2bApwNDJhxYEex00pIoGO2GqiZTDmeLaMtfj6U/70r+W4NqIGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sFC2kSGTyFtrbTtclKppW4ZsYj3YmalyhxxSPZBTP0=;
 b=w6ewPkfjbIuUVcmkAWnfxymbRTqAYvVV4iw0loD9FntrjbvlyPQPzCF7Nuz+VzE8RnuFGrwcLeeInyn0XhPOVSrC1HhBlnzp1TdkzMFyc+cz28c9CGYGTBFGpzZ7uoPdopCxKhTuA/vXGrM0lOCQ074IExjLFwKw+lVoFRWoYfHqFbamuw7SFEJIK9wVzI2z/Tvtp8omfwsS+rRiGQ4FQAnYioiOfo7s0tONBOWjG7QeT0Tkb9Ifb8aubh6xuzngVxVLfpZtEuxUjvVyrTcnEgsKI+hIXG2J3IwPvHNf7xHikfP3iRP6dTI5a0BD1pidvsrt/cdb6yqfKjCaJqGggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sFC2kSGTyFtrbTtclKppW4ZsYj3YmalyhxxSPZBTP0=;
 b=OXjQsuXqsLIdG5CA0dDA9+Ddvrz+Wv8eiuZ3PSexK91apfeFVOzY9MjkfSeKhJQr9zgz/i2WmI6kRs+TeH5qir2lPBhyj1H5WwrD+f16yqtR1ZExAcGtcBOP20jsiOa9ziyb1DzlUQgYd0Ei6z1g89JpMBcKrmE27+Ej9xBQa4yydCxLJNOX0/yQzWsxcsnWWt6GWUlegMenWopyO68d0ErJ1wx8Fub5a/XCZmJun2sjXmf2PXc7ZXoUwBqFKrkEMRf7olrMCHGp5b8/d0jLBuAig06nQnGWy7LGYn0MJ6/Z1ThbAP0bFW9xaNla//dNhL/tnQuK21N5J/YXjMpZMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI1PR04MB6815.eurprd04.prod.outlook.com (2603:10a6:803:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:29:49 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:29:49 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH 0/1] add SAR ADC DTS support for S32G2/S32G3 SoCs
Date: Wed, 13 May 2026 16:29:47 +0200
Message-Id: <20260513142948.640057-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P309CA0012.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::19) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI1PR04MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ac7f71-1201-4083-1c7f-08deb0fc1696
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: NcWNL9EqCoNcOSvxlo/cZahtjB7a70zVyI3hqIkCJmzmj3MWPmo7d3vwld3DBoQOrF29hBHkLhBoCssTbOypMWRfhL5LdiEM/RwLDvZjDhQ7PKEvkIA1eEYByt3yf1XonI4kbYZWu4nlv0LBGE0RI59T7HbBC2OH99jobhaxTXNZFuFt1sE2Y4RWimbc9FsIGKo8l+Wk1CWRxfGM2+CFk0MgHvzzc96qIN3cmftOlrqs4LUZTrZfC25hnQFXwie2UHJofSGyOgAl4meph0fVT8I/L+w0c5T/U79Ms60ipLx47XNxtiOqLm5Fy2xu1fdJzsrJS8zYMyfX2GwNiFs0OT6xpZC+XIkcdoZLvCzmndAgSTeQ6izrMJZQrSGJQT/y0/WEidaJdy55isGXlZk1bqWGqjNGwc82ZHi+usAHNqBpEKGkX/4enu0icSBdv3RIt1TMET2eqVfmP86hOI3jHjIjS/X7CaRig3w1E1+gc6u31/or8LmisN8PUFNmkLLkLzqVPeuxzAo7X06uxSHmllv7pJEO6SXyfE505pqtmXB6qVybqkicaGuzbNdKOkyesn9PeJ97jvamhusI937COtJNzbF6RHas3TJOABWnhx9aZF9bSqEXlq8XzRNuyGYlolrFySi4ABz3BCexK35w45DkMRIbGcOfv9xVOLzy3380DidGlgA/bEPUnRl3dM3v
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm1ibEhhWjVzMVNyc2M2TmxtdThmaCtWWFZGRU05Vm5PdDIrQnZ6eGJ6Tk9N?=
 =?utf-8?B?SzN0WHF0N1RjRjNBWDZPTzNDcWZhMmlXbzFDT2JUVWdidk5OZXBkU1grTTUx?=
 =?utf-8?B?Nk5sTUtoM0FiaFk4SE9NcHZ0LzdWbkhEZFJhZjNydFhkdmhYUi9iSVI0OTIx?=
 =?utf-8?B?c0V3OURqKy9ZRDhLcVlFazJMdXR1VkR4M1R1Z0hYRG0wY3hUSStPWW1KcnJt?=
 =?utf-8?B?Q3ZsaUcvMlJWQTdHUk01cWgwcE5NdzZJZmhKRCtFNTIwS3B0QlZNMklYOUht?=
 =?utf-8?B?OGlZSTBlSG9BT3NLNXBPY0VCVjVEVGVoaEhaSm4yYy9IczdDc0JNSHB6Y3l5?=
 =?utf-8?B?Mlp4ZmxPOUNCNHRJWEtVeTNsYWNxNEd0NTdCbjM0VEVXdTg5aTBXNmgwdGEz?=
 =?utf-8?B?NXFKTTFKOGMzRHgzRXNCM2w4VDNxYkZIQ2xBZkZqV0l1Mk1aMGdVY1dKTkxn?=
 =?utf-8?B?RXIySC8zeWdOd2huampCMGZHRXc4TDhQV1V5Z2pkM2kwUUhOWENGZHJqb3Z4?=
 =?utf-8?B?d1RvbnVGWGNDYWF5M3VyZ3IxRGowU2tBQTlIYkRpb0NJbnI5VXVGRU5mQXdJ?=
 =?utf-8?B?bERNYVJWQWVMdDVpUUU0OHZBL216czJlUlJVTno0Z2NwTmF5M1M3YTdDQmlE?=
 =?utf-8?B?SmR2WEFaMDFRend2cE9NK3k1T1A2eEJpMVc5Z0thK1hWcG4wc0xyRDlSeHpX?=
 =?utf-8?B?dlBVajZyMndOOThNNHZLVXVpeUR2djJmZVZ0U0dFTWpqTGxaL1dONURTRmtq?=
 =?utf-8?B?MVg5TnVYbi9xOUw1WTRJc3BKRE1PZEZoeE1oVlhTTm15dHhjVnM2R3pldmFz?=
 =?utf-8?B?dytXWmNPaGRIYlZTN0d5K0N6V2NuVlRjUXFDOXFxZEUzN3NhbXkyWkRncm5k?=
 =?utf-8?B?NG5IN0x4N2UwSmdSY0pBbk91Y2ZUZTY0YmxOczNUanBKcENDV09wYUJEdUZx?=
 =?utf-8?B?VXkxRmNPbGo5eTVlbzNoYUp0aXVwUXRkS0sxUWVNOUNYalRQWU95eU9ha293?=
 =?utf-8?B?Q0hPREVvVkVkQVo1NElwdmkrZ01lUFJlYVAxc1ZkMmtqRXRiQ29DZ0xjeTR4?=
 =?utf-8?B?WmxHTmNjUUdKazg3V3hxcEttNkRMdzBXak52ZlVMdm1IOG50aVFvM1FMaWdO?=
 =?utf-8?B?VEM0MjZhQUpZZmNyZHc2YWVDeDhTd01rT0hJd2RIdW41TkpWMkUyaURkc0F1?=
 =?utf-8?B?Z0MzTnFMM1RrdUlkSmRBTjJyZUN1eVYxcVB3TllOb3VDV2xpNE03TFkwUTFJ?=
 =?utf-8?B?REFERjRvREhFV2ZReHJubW92Y2wwaFgvM3R6b0MvcVU3Qm1lSGpjNHI1M2NF?=
 =?utf-8?B?VTlzMTVCelgzakZsNkJXUXJpeURSWHh2OHd3c0taWDJHeE1KZWY4NklaR1F6?=
 =?utf-8?B?QkZLK1FsSGRNRXNqYitsNlpURHR0cVpCZ2wvRFVEekk1cDUza2hxRkVrMWVs?=
 =?utf-8?B?S2pMajhwV3pHanY5TDVJcG9TV1JSMm02Q0w2K1BRN244Nkd6aXZwK2lyeGgv?=
 =?utf-8?B?SjBhcWdMWGRJeHNaU0FaT2hoNy94amg2bGNOeTkwVjVRRkhBVlJPWjM2eXlP?=
 =?utf-8?B?SjdrczViSDVRb1czN3BTQ2wzMmdqemFjWlNNeEo3ZTcvTk1CejFVaFQ2WkxJ?=
 =?utf-8?B?SjFpODlpN0VaQVhzVlIrVkZkUmVLcEtaVUlIemFLMUNpbnhZdzk5elRWMXFr?=
 =?utf-8?B?MEJTdWFtcEdvajZEYnFxQlQwV3V3T1ZFMWUrczB4ajFTWC8vOWVkdFI2citQ?=
 =?utf-8?B?a0djWXVrMHhvSGQrbXFXbkR6a1RCYmFPdmpMVWVMNXh1Vm4wcVB5NHNyQUhM?=
 =?utf-8?B?c1k5c09BUGsxTERENHdWN3A4a1lCbHVhNmFvYU02ZjI1ZW1vemViSURQT2Nv?=
 =?utf-8?B?TS9uYzZ2cytsL2VrNEV0ajhqVG5xZHRONkw3YWF0K2hHcmowdDdPUjZkNTkv?=
 =?utf-8?B?a0NMQUg5cTYxWm9jQnkrV0VoNXZ5RzVWMEtLVEV5UXB5RHBTSU5KYnlXVUQ2?=
 =?utf-8?B?SENFRDlST3p3dURlaDB4QWNidTNsaWNqRjJoRHVLKzF1SzFmUDYwczJPWUVy?=
 =?utf-8?B?akRQdGRRMm5rL2RQeThhb2dXd3V2YitwL2ZsVTJiYVlPcjNqSFZnQlNIMVJQ?=
 =?utf-8?B?clF6bEhyNDBPRk42YmJYdUlJbkVUUjU2SVRHVUtNNjhyT2pQcGVZT24xQmFI?=
 =?utf-8?B?QzlqT09YWmFWWkpuR0Q1VW1sWTBaTE9DWHdDbitkZHh5dFpGamN1UUoveGJH?=
 =?utf-8?B?Q1FmUVZyRG5nSld5aEF2SkYrRDhjQWRkV2VucnMxRDFIM0ttYjh3NFlHd0V0?=
 =?utf-8?B?d2dyT0k4MUovR2NveEtVa3dmN3BWTjdDeXphMjU5eThEUkJ1d0tZOUNOYTMz?=
 =?utf-8?Q?0eDoWTVdYisAOHGhc49ea7ruEhA58K1vqM9hh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ac7f71-1201-4083-1c7f-08deb0fc1696
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:29:49.1930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rn8qtXmDFcOSiteNszcZi6o8nGER5Nx4GbgCU51yGzWpH5JkOJYzvXW/66fToqYgpogPbmCZvPQEhy3rEnJPappo5+JS2HvfHtqjKGUUOOwACdlae8wxy8DN8VF+BA2w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_073001_720805_0003EF9A 
X-CRM114-Status: UNSURE (   6.72  )
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

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add SAR ADC dts support for S32G SoC based boards

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 24 +++++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 24 +++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 2 deletions(-)

-- 
2.34.1


