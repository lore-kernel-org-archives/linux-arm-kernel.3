Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05988CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 18:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7U6Yi/sFfhY9W9CeAkMjKP1iF2mTAty7gE9FbS5pss=; b=Pr0PUb3kcmA7JD4v1p+PRKgC+A
	+JG5xADrqGiXdQpmhEwSoA0ZWkB2sZojEaW9kJmF2jvvpK/hFALtQX/Lr3G+THLS4Po8Y2EcVAOsw
	/f5rOCmeqMeRp46kIYA/xzuhRiCYCc9s1+wzF5x6825nuPl7Ube33YZRD7QBro9NbU5CGmDtIr5tb
	XWTofX9nFx49Kx9VhYIxJYa0hgnyGofspYdLaFDpl5NvNRXFTV8lcrE7bfCIMgzTpmoYZZij47Run
	WcJ2wNbq1cAxa5kXTSSlBf/042DvhYqVXQQea/r5cD2+KDEqdOhl2u2FkwfGPxucQADjT/MQU7/m8
	muWQtMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTft-0000000Dd5q-2bAQ;
	Tue, 02 Jun 2026 18:17:13 +0000
Received: from mail-westeuropeazon11010066.outbound.protection.outlook.com ([52.101.69.66] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTfr-0000000Dd5U-0rSj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 18:17:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUBKrCCujpN57owT5naYkOdvymSR6IwEgwHhNI/kTM4q8ZXsUaBe7PGleQVza9k+GigYVsInC0SAe3jG/41C4LhEm8akeitdHJpUj2d+Su7dCD9PRwNZjl09ciODe7bs9l7GamhVqxdHKrcGlQigdm3B56fn/usQFClFtk+uohj/f8zfSq35TMHmVzynHj26/sK4ZpUwddIMFajnBgLqNaJf3mxQnYLdgrSQhtqbFNterJEwtrUR9xfl8VHi1ncGv4bdUcnEC16v/IAG7U0WTevLl0a1n6zb6LaQ4Qz+QLzXxe1E9lrmR9tUs3BJs+k/xL1g05GvP06K6ipZTucyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7U6Yi/sFfhY9W9CeAkMjKP1iF2mTAty7gE9FbS5pss=;
 b=cf470aYAllNxx7pVGCKJ8/ua9ivxTzCY1EFZFQsbuRzvI9HT2gFcwL1c9FXPEMEtcKcMppjttkgyUK/DmqpJHZ4Wg9eq+ulz/ltRPFYfMngceH2AkfPDm8nbdOTznL5JqLvmVJg/zokTX7HRkBpjEQ9myL4fzQlnwGMCYoEzpJo2OvMmPp/ZpsnSSXnymtNsBOQup1obCdljgkyn+KqpGHCrvKqmfU3ffwGulSjsaJ5lRrHDZC/C+nLiHyd9mtY/RuCs3xuP3RuvyMs0lOa6dLnEea0BMsS0MmSxrnCmzYo6uhiay8X2hEz4YKMUF+2j0Hnb2InaG74lApC61ldGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7U6Yi/sFfhY9W9CeAkMjKP1iF2mTAty7gE9FbS5pss=;
 b=n+4aWuC861bvB6ec1Am54X7pxhhnZjH33z5ola4oFI4pqGEU3fKwOSD0gW6EClQLwtj3VAHIHMiuNNL/DE0wnZuZxXgOi6PdEiar5PZ6Wd7KXNPNUKkPg3q52NWE7qHrJUSjLChbNrp848avObap3P6XfEvaQZatLuNLOa11MGrf/DAWAqg1NkaGJngVMOe2P1ytyYLMxgXgzMnRo/qj5o+GjTujN1xBouHKYIbKZCYaDZu6TjJAzfn6R1R3f9NiV91Gtp69oKBBQ7Nm5qx0SNdcCGCMPYFPiNBdzsgwkahhRxJkxFenELIJ9Eui14lj9Q4Qnuu03RUlbVhmqCMJ1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9813.eurprd04.prod.outlook.com (2603:10a6:102:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 18:17:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 18:17:06 +0000
From: Frank.Li@oss.nxp.com
To: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx943-evk-sdwifi: add a new dtso to support SDIW612 WiFi
Date: Tue,  2 Jun 2026 14:16:59 -0400
Message-ID: <178042421634.3533078.17593227763592530400.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519053942.249129-1-sherry.sun@oss.nxp.com>
References: <20260519053942.249129-1-sherry.sun@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH3PEPF00004098.namprd05.prod.outlook.com
 (2603:10b6:518:1::44) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9813:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3d9b9d-129f-460b-75fc-08dec0d32722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DxZgR3kCUYGsvkSm2LdY/UGzinynCCxqiQc3Eq5enmo4akfb4tqitC5CLPOT9qBogrVgQTNCA2FKjKIanHEnl4bJeJj9klclMQ9KQzMZpCo3YAkqln8WaSaia3A6tYE1gaRd81dD7kPAn86APTkp9846EYx7OaM8ZxUrcQ/jbsL0MOCHeyqzetYFLQ04iRukbFKfGfYxt+A04xOLcEn14JGovYkIERtz06tkymtkonUkYjowcCEytITKuizzT2gY4i+aB3hyM+4V7wyqXklrXO+THJY4sSyHeZQ0Lnbucxzb8FHIOD1WfADXsc16bBKacUrEPmKhLEXqUaFlW4TkxzF88lehpXtv5iUeCEY1mqMcyAMpnlxmAAMlhVF1fIrtlPIMGxtenGvdurbxr/AglhxUe0rc5w8g8xjIwE7orK7eWKTTkCznQiwy1eGZD6QohC10je2sBcoo4qKAvaSPxEDqhLBZGOh5Mp8LQN/R1EREiI0hXD9CPIdjoxiB8Viw9bhmzETqVhPDgOiJPn+byA1HXKO+kxzznEx1Crh5KB8JYZF0QeD1QWXdvreCBppRx0yRXzePZTZKk89GFLHLd10s8TYFJbIKa+S4LOZwVUUdkvpuCVVUKmm0fkGACDotxB8TJ2/E5mhY31XUddSSjYQQWcxQqjocFhGDfRAU+3yWvf256wEYNygfUidIUnbQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a09wTGVrMGVtVHVKQksvZ2szdUx4SGxWTlVBS0xMUXAwR2FqbVIvRmw5YTdz?=
 =?utf-8?B?ZU9zNDFhRGhjNGhuVmdXbURhUnZocHRBTnZGckM4SFljeFFYRTdFMUlEV1Q1?=
 =?utf-8?B?ZndXU3BQMFpudE9jdW1SeCt0UzgxVmlKUUFNN2swaXpNRHpZTTBOOTQya2I3?=
 =?utf-8?B?K21Hc1FHTGUvRFJMY2hjQUZBbFlsQmFQVnBKNnhHUUtxS2FMY25yd1I3OVkw?=
 =?utf-8?B?UHBCOU5JaTRFMnQvR2xSZ1J4TjlnZHVGQlhaaTZLQnh3MzgwNHc2dmQ2UEQ1?=
 =?utf-8?B?ckdPV2I4SjZQeExNV3M1TU45em1vSVlBYWIxK1dDTFlqOUZOTDZxb1JyaC9P?=
 =?utf-8?B?RjJJZEFRVmpzaFZLSjV2V2R4Umhzb1RXalpIeGcrQUgxZHkzTEpoMW81SGJi?=
 =?utf-8?B?MHNpeFdiTFAvekJUcjRuTXNZbWhBZGRhTXN1SlhPTmhlTTNjTFM0cmRQWUxY?=
 =?utf-8?B?QUxXZnRPUWViT2IzR3c1ZXNLYWMvMHF5N1R4VDd5S3pzRW9ZcGJmVmptWVBS?=
 =?utf-8?B?YldyUVp6TlZHYThZOW45VkZKMUhZbitrbjJzcXJ2a1JabEFPaGh1N1RRZWZS?=
 =?utf-8?B?dmpIV1FkQW4rdGlUdFd0TDFqSzRpUG5XSG9KOW5lZVFJOUxqTTBSWjlUa0pS?=
 =?utf-8?B?OUdUdU5JNkNhVEIvUFNLK3BMZjZIai9uVnZDbkZzWmZtRUp5VkpPTDhLTTNZ?=
 =?utf-8?B?ZCsyY3d0dVhmQWlydGR2N0txNFFHU2VVbVZMbFJtUzRiQkdMNWpUUWxEcEl4?=
 =?utf-8?B?L3RhOGV1WDBHZlM4TmpvWXFUTVVqdWVlV0NVVWV0SG13VlJVWmlzeEpNRmJj?=
 =?utf-8?B?b01zNWVBRjRVYXYzSjlpZmxQMmRpYVBnNEl4YlBUVDZVL3M3cDdQVzBZdCtx?=
 =?utf-8?B?WW9yMDVTUlAwQU1CcWlFSzh3WGhGcTcwbGJ1bmpmT05YT09DNHJVYXFSZ1Uz?=
 =?utf-8?B?amdPeTFoVGN1ekl6SEg3M21nZXdhaDZMSDlZQXlNcWhVTlhSVHQzN3NzOG54?=
 =?utf-8?B?SGxUQWhyd3RkMDdmcHk4NndVREl4VkRaaW9HdFl3OW1HVDlmSW5xNE9SSk54?=
 =?utf-8?B?WkttNEQxZU1ybXdXclFTazB5ejBWVXg3THcybUZZRUNoSmF6OFJKMnBWQlo1?=
 =?utf-8?B?bTh1eXZrVkJzVzlDOXE0QjJ6UGRhTmZCaEVqayt5ZzI5YmhBUVRXVlVRYVA1?=
 =?utf-8?B?ZFIxRWhTWXNBQk8yYjRtTm1aTWIvUnpIdGR3Mksyc3dIZ3czdFRHUWhOWjU5?=
 =?utf-8?B?L3k0MVR1UlA1MUhHTkZKTFFtTFI1aDIwSDg4R0lJZ09OR1hKRlZoNjZpRmV3?=
 =?utf-8?B?TTVybFJkSlBTVFFEOGU3YTdud3FUdEJNRHVFRktPNGw0cG40NG56TDhGNG5Z?=
 =?utf-8?B?SGFNRjhEZWlVSGdRV2F3OEJORkkzYUdrNHNPaEZRZmtBSi9IU1p1R2FEcTFU?=
 =?utf-8?B?MnVReGdQYTZ5MDVuZ3JsbGNLbjdCOVBrWGhJaHhmeCt4R1B6R0g2ekp3VEJF?=
 =?utf-8?B?OGRIVkVabGIvVnJaenlObC9xRFZ5NHJ3Qmxob3VZcG9keGEvbTN6UWF6VGNF?=
 =?utf-8?B?ZjZ0emhWUi9nVWZnR0RHR0ZKaDdqdnhFMmx6NnBsTU4vRjZHNWxodmJzcTdp?=
 =?utf-8?B?S3cwZlZoUTJlbGVUMjhZUVBvMU05T3JRMHFrVGlvK1BVSGcwcjg4VkhUbmw1?=
 =?utf-8?B?azN5bHVaT2hMZmR4RlVtYVM1UzIrMDJ3NGRmbkdLTEFHaXYveGNkWHhSajFQ?=
 =?utf-8?B?ZjN5eDdCbXRzaUxZaFQrK0Nyamg4U1B5TXBKUzhCaENZMG5EallKVG9rSGNF?=
 =?utf-8?B?Sy9zQkRtOWdSSXc0eFFqQ01vcU5VWnR6NzExdGFwM1ZVMVF3a0ZRMHV2MlI4?=
 =?utf-8?B?dDhadlE1R3JkRVJDZXdIS2FTbDBDREpMS1hueWQwemxOOFA5ckZqTnRXdGJR?=
 =?utf-8?B?QjlvL0MydkZjRUZrNDBYNElxeXZqVFZuVklkK2xOaXExS3hQWTk2MkJyN0t5?=
 =?utf-8?B?dDZYTXF1RjFha2hJUlY0WFlUVVF3NHV6M2UvYjJtZDViRGs4QTlOeUJQU2g0?=
 =?utf-8?B?bXNkTkpIZ2lNRFN1RW5KM0h0cEwwVUJuTUtHWkRsdjA1b2FwS3RGNHFSR2FX?=
 =?utf-8?B?bzdOanlvcG1HSlVVNVR6ZFlNRFVNbk9KNDJJMFU3UG80azFkWXBmc252cGU4?=
 =?utf-8?B?QzI1UEx5WDNxa2ZwTThtemlLUFcvYlV0VWdVYnBsQ2owbHBTdlZMNVdSczcz?=
 =?utf-8?B?Wk1lTFBSM0ZyWFZXZnpNTHpzNW10dEh3TFNMalBLWllIWUdsMFp4Qld2bTlo?=
 =?utf-8?B?UG93eUJncDhsOTEzTU9HYnRCbkY0eVlkdlYvYVYrRnMyaEhOS3VRTFNtUlNG?=
 =?utf-8?Q?FKTIQLJwpK9G9q9k=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3d9b9d-129f-460b-75fc-08dec0d32722
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 18:17:06.2579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGiRCIsRfahBbVCgEvCOQQs4IjV+MRni32PHvqlf9rDSKDgZk2P3FI+7nL30CC1NS7/uwmXFxfJuIiirgoU8riE7+4UeIUBNcVFIHfV/dWay9ySWn0dQ3HHxAZjbJYL4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_111711_254281_78A13C76 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 19 May 2026 13:39:42 +0800, Sherry Sun (OSS) wrote:
> Add a new imx943-evk-sdwifi.dtso to support SDIW612 WiFi chip on
> imx943-evk board, the default imx943-evk.dtb is used to support PCIE
> AW693 WiFi.
> 
> Use separate dts for SDIW612 and PCIe AW693 WiFi to avoid the shared
> regulator between SDIO and PCIe buses, the random probe order between
> the two buses may break the PCIe initialization sequence which cause
> AW693 has probability of failing to detect.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx943-evk-sdwifi: add a new dtso to support SDIW612 WiFi
      commit: b7f32cec40560bab12e4f8715e9c0655bf7fa9b5

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

