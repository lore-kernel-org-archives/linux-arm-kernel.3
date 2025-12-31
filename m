Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEC9EE6427
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 10:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOBHJX+q02TVDHNuAO8LtVZLQsK6tQm89clsq+BIRMU=; b=m8DZ0uHNOmLO5BaLHtAHYWlZuB
	r9cIUI7JynN5ZhuwsnO1Lxd2atJC0XNGfupsRnraJS5EL49rV7Eb/FcYX5tiR1QMiZMfTzgIwyFn8
	FwLDKpvJJCdr82PVktQA1Fi/LGUJ+6EbNFhrXr7apl7sDjFvg9a6bOLP9Md/dywvpgNrS7VDywA67
	xL/TEPqUQeuxVv6gqWgySXuruIQPLgAy4+Ekj1rhJhN185hMJEj5/xsdbehV2q/Hq4O7HlhxHS40V
	72PmuWrNyPe7UVq49sNQCCEYjw5Gm8U6vaMcQTSZah3PKgiqDYS9c1E/oe7dbWSmt3ctyz/tSA2W1
	IGEKm6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatCj-00000005rgl-1mbB;
	Wed, 31 Dec 2025 10:13:21 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatCg-00000005rej-0EtQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 10:13:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZiaT53lozhroaFj93k+VwP9Mv9/vbUe86k98wkHTvH4jhn4I8XRqiDrSh/FtFEuZ+rwNQp7AE86fYB6W+zV+6aI3svY4s447mrHgVcQw+/FYiELR4M4tc8MuFIwTUFMFgu3ZNO9dje0AzDkMieegGGS80i/1VK66kg3Iao8DEXxWhb5hdBzAvUjR7zqUpA8ltFmjF0J8jE9UjDbEZyGIuHEj8WCsQIoHcuEKmXQ+8w1/99Wi7TRPNiszT5YGScFiulOocPNBwaLtBFK2AIiZLdGsuV73NFKr8McMYOS7w2h9jUVPzxPM1daldsx2AesLXhjooK8RPVLqkNQTLEYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOBHJX+q02TVDHNuAO8LtVZLQsK6tQm89clsq+BIRMU=;
 b=wsXJvMvhz/Aa8WwA8yD04b90bmxnsJarpZSHyJuDN1TO49iA/ElA4ci5lRxuOz9CG9LZMOIPJPybb7k9wKR4Q8nxma5VEATUt/glUEvMgl9RENrNdl41c04sXsP0JQeYjuEZJ4nZSZ+HlM9CVDQNuJ2ZZlEnYIa0T/dsD1fA0QFTuXrdJ+4GncINY1CvMgRP1F8xNiIdeDLXm3o6vjH0P38+gH/51mnfc39mQJOr/pBmXOXMZNK+A4hJbcon71UvVV1a2r1PU5cQgwKRl1SGVqBeqJOAJsBzEF8MrgpPTfFmsXWyRXt+D38/bS8oeWktxzezxVqMiPDo3CNeEgFLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOBHJX+q02TVDHNuAO8LtVZLQsK6tQm89clsq+BIRMU=;
 b=tRocbjNdVWY/tpqdrDebe7Ts+wtDsZduFltgiVVnru+iFNwGLilcaWk5hRRz4c4Ibs52g66NvxIaul3G+4xEJZ+6bUxTlxbe0u5HATNskcrIQmbz38CN4mtyljuyR7+MBFzpIxV/oaoi7sbCMXSVrBtu8Crav4j49I2xBnCO+jSFeUw9NOaT1yQ6k2ea+Hwn3v1ZqC4lhAbGVkrwn3OQnYTelI670tuPMeKQ4B8q4gub8kU2UgDufuj/8ciZkfzzF1Df2bbYriMqRyKlN3VhG0DTvkhRw9ng7zdxEpv2HjBBSF90+1KnbFuTBGoq+DXcGoeSzYfhir7X+J/GLt/YhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU7PR04MB11089.eurprd04.prod.outlook.com (2603:10a6:10:5b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:13:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 10:13:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Dec 2025 18:12:48 +0800
Subject: [PATCH v7 1/6] dt-bindings: clock: Add spread spectrum definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-clk-ssc-v7-1-v7-1-380e8b58f9e3@nxp.com>
References: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
In-Reply-To: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU7PR04MB11089:EE_
X-MS-Office365-Filtering-Correlation-Id: f5073e11-c071-4075-904a-08de485534f4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkdZN1Y0NldIZm1yT0dzK3ZXa3FQT2Y3cU9RNHdNeHJFNkZlV2wrNUliVjlN?=
 =?utf-8?B?YjhqSitmbmRzdCtLTVNybUlXT0cxVFlSakdNTWxNQ1JxU3lwbnFHS0NDTkt2?=
 =?utf-8?B?M0FtTCtBMC9yUVlvdWxOYTdBL0ZRdHVldEFCaHZkNHhJUWo1WTdsSWZmdWox?=
 =?utf-8?B?dmwvaVhvQ3c1ejNERWdQZTFnR0NyZDlZQW9xbHhjZ1hGL1c2b0RtU2JoeXBC?=
 =?utf-8?B?WTRnSEFuMFFFYUdqRkpTSktQWkVjRG96SlY2VGNRTTRGdlBPT3QxUmQ3bVFp?=
 =?utf-8?B?UU5yWEVBRHgrUldaUWV3ejM1aHNVOEMyclNHL1VIbDZOL08zZ2lEVVI5NmhU?=
 =?utf-8?B?M09lVUJIejVrM0R0U01URDZJQkFqd3NjUytkdzMvdldUR0lOR0lpTFQ5aUJ6?=
 =?utf-8?B?aXhUOWZIU1NjT1lUeTBDUlVldExFZDkzT3U1MWlqeTNrbGl4d1RQenNvSkt1?=
 =?utf-8?B?ZTZEMU1XZTgrbk9WUHlnUmRzRVVxbklGbmZhMk44a3ltbHlscXpybTdJalJY?=
 =?utf-8?B?eDFLc1FzemwvMFp6bGFCMS9tdzMwTThXckRncDdaOVdZaHU1VmJYaGZFaXBj?=
 =?utf-8?B?UmYya2R4ZTlzaEdjNkhvaFRxanFSdUhyV2NKeVhYK1VzZVQrdXZFekpLZnAr?=
 =?utf-8?B?NGc5elorR1FPWkZ2UDhxVlZxTVFTQzV1d0diMVhEamFsVkFyOVZmSXhzcVhm?=
 =?utf-8?B?ZVdpZVhTZGREZ04rV3p1K1RLTjFFT2NpNkM2NmhFcit4eDhqdVpaNDg2dXJK?=
 =?utf-8?B?SXE5aWFEMUxsKzE4UHdBSm5meDNHeUxnSThaTTY1ODFrSDFmWTBnN2g5am5V?=
 =?utf-8?B?Wnd0RDRLeHRaUGsyd0pZVllTRUs4SHoxQVpLdll1ZFhaV3AyNXNQMUgxZTZa?=
 =?utf-8?B?WUcxUVpsWWFxSVFEWk5yYTdSZTA2eGhJUWpGUnpuZ3hGODhSSWVON2IyK2cr?=
 =?utf-8?B?TDQyVVhkelJvUEtXaUxNaURJS0V1Z1JpOC92V2FQcXg2VkltUEZWNmMvUVVL?=
 =?utf-8?B?dGI5ckZTdGFXRmN0ZEhuK2c2VGRSbWdiUTdSV0d2WFJEM2VTdlkxOFk1Uzdm?=
 =?utf-8?B?dGFpSVYrRGJ6TjB0T3hNc3dTeW1lWFBhdGVFSFNvaElmUGE5MGliQjhXUXYx?=
 =?utf-8?B?UlB3aXVoU1lCaVh1YWMzUFN3S0dFQ1RJMTdhRmE2aC9aeHhLTkdKQWJvOVBk?=
 =?utf-8?B?RW9XbjlhcHMydWFMNGl4cXBkWllCM2IxMXo3bEhORXI3M0VlV3R0ZmN4SE1U?=
 =?utf-8?B?QjNZOGR2QlRNL2MxVFJzKy9OTk1SMmVGQ1JnQzhzMCtzL1FsV0lyaDk5ckg2?=
 =?utf-8?B?QWpmWnpoZTZwUW1aOWZxOUEyWk14dWR3Vk4xYzFWQ0ZxMTNHeEdsMWlRSkUy?=
 =?utf-8?B?TURZbzdtWnMrc01ndGg2ZGZETmZJdWVHRGNYc1lNNVl0cHZRQS93c2JPdFZH?=
 =?utf-8?B?MWY5a0ZTVTZLeUpBWUN0NE4rMFhqS1lLWnFDZDlmdVR6QlAvZkhIK0lmZUIv?=
 =?utf-8?B?Y0N5K1lXWjB0VzdocVBmaWZnZmlUcUc0L3cydGxxNml5cGJIVEFWQnE5T0VE?=
 =?utf-8?B?SWdlb2NRRDY5dmo5Z3ZxVjBvMTduYnN0dmxyQWxEUnFreTJReWZ3enhCYUxI?=
 =?utf-8?B?UjVQWTVpZVdRR201RXJNcFlYamFUZE95SklFbXNIOWtIWTgwcmgvZXhPdFJN?=
 =?utf-8?B?d01WYlEvSEJVQ0h3bHBnVjNFWXJTZTlLZVhrRGxtUU9GS2lONUs2SWxlM1RG?=
 =?utf-8?B?MzE5a3RPVVlaMk45K3F4RG1GTVRqUmFFVXZsS2s2VWdFdnBEa0luNHdTaVJE?=
 =?utf-8?B?WWNQMW5mcnNaSndKKzN5bUJNejFGQ21SQXlVckRVTFRNRjd5d21qTnBoVk1x?=
 =?utf-8?B?Y2w2ZjhCSkpYOHl0V2JHUVhRaGtiUmxPWC9qOUszQkJodzVmNXE3Q1RXQXFz?=
 =?utf-8?B?b216c1YxNE1uQ2xRUE1oVkdnRHFCcCs1UnA0bVhLcGpVaExscDZwMFJVOGZX?=
 =?utf-8?B?cks2a2dUc0ljZUN5UmtpWmJqcVBxbDdnbmZvc1BmLzRyQnZZZHBrcnkweXNl?=
 =?utf-8?Q?6GUux0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmM0czk4Y2VhMGVWTVNXZDhkS1pMalgrNkVlR24yOURpekdDanovbVZ3cEM3?=
 =?utf-8?B?dmJUU2J1YmU0N095c3pqczZoekpnYnl1bUtEN1BNK3J3WDR3Q08zYkxSNzh2?=
 =?utf-8?B?NjlYd1pOUVB6ZVN6UnlXR2hZemRQV0ZvQjNRMEFmdUNNanlIdEVRR0RPMWJU?=
 =?utf-8?B?dkFwajBMc1lFSFRadExjOHVOWjBMMFlHVUFGcWlmL3NwVGJZRXJZaFdwNEU5?=
 =?utf-8?B?QTIrdHBma2JHUUU5V0VUTm1JUFE5Tnlib0h4TEVFMFM4QVFRL1FpNUtGR0RZ?=
 =?utf-8?B?bjU1Z2pjZzR1MXNnekUrcm1qcDI5anl1RnA4NTlnYlRPNzR4cXM5RHk1eExa?=
 =?utf-8?B?NGQ5K0JKeFN5T1VsMnlQNHgyamJWdEdmU2MrRGwwazUzYVRnNHVhM2piRjFP?=
 =?utf-8?B?Z1FsZ0YzY1QwbTVWUUU1QzhFUm56a0RMbEwrQ05Tdno0M25Db3RTRkxUTWRQ?=
 =?utf-8?B?ZEsyYWp4QlN2Qzlsb0RIYWdwVyt1cWdDa1hKSVJuNkY3V1g0WW9CRm1qUGhF?=
 =?utf-8?B?LzNFb2xQZitOZTdjVnVhelhHZ08xTzdQeXBWdWJPUHY2cmJyOUV5RXVyZ1ls?=
 =?utf-8?B?Z0pVZ0h4ODBEVENaY3lhdGdTK0F0ZERwZ3RNNmJWT0lONmJJU3poSlZxZ2ox?=
 =?utf-8?B?em1GOFVyZkZyU3RnMzl5dmJwczZDVEkvSmRlMzRSMDR2bWFvVWNKV0pIUlFv?=
 =?utf-8?B?TGpILzNkcWVYWlROK0QrcE5rMjhMVVg3eWdtOFJ1UTlLcjZrS1dZSitwaCtW?=
 =?utf-8?B?aStnUldjVFNaTmZSR1ZOL0Nvd1k5Q3l6VXhOby9JbzZEYU1ncytGUG1jV2Uy?=
 =?utf-8?B?WWpnU0JQeWducThNWVJpL0tSVW1TYWd5S05wTTFHMzRTcXV4cHVtUWtPMUJW?=
 =?utf-8?B?VldyQ2tnKzZTNXAwRk9rUUdXMnhTOGhWSWVSdmxvZCtad2wrL2dRK1FhSWo2?=
 =?utf-8?B?dVRuNU5hTFNsZStKZmN3WitkdzB1ajBtYldiRlg1OU5BOUxlcGQrY2pEWlho?=
 =?utf-8?B?OFlxaG50QzhVSGFqeklvd1BBcnFia0E4L3ZuSWFhaU9TSTJ3VldTdUdYNExM?=
 =?utf-8?B?WmNRYUxqeXBRbW1mTWs2dktRK1N6R2xsRFpvM0xOUGl4Tjg2a0FZTkEvazA0?=
 =?utf-8?B?dHdTeTNIRXk3WmxiSVZjM3BoSnBnZVR6cEQxdExRU1VWL2c2QzFFM0RIWlpO?=
 =?utf-8?B?WjBCTDBoZUx4UGQyUTlXYWhQeHRaVnNpNXZKcElOWmlVNDhsWDF5NCt6QXVs?=
 =?utf-8?B?R3czWnVrT2lST0VVYk9FdFA0Q2pWNXl5VlgwWUlzbnNzVTBIVFFwN2VHWEVn?=
 =?utf-8?B?WUk1bTFEYlVUWGM1WUJabm0vNXA5U0JNQkM3aS81eVlZazdlNVBQcEEyL2tw?=
 =?utf-8?B?Q0U0OVZhVWJuUzRENkRGZnJBUjRzVHgxdENrd0sxL1BaVlFmaXlSbmRsSXpn?=
 =?utf-8?B?cjQ2QWI2U1ZUYXNlNVhSVlJMRGsvd0tjZlJHTHh2cWFJbDFzVmRUVElkSXlI?=
 =?utf-8?B?SmVHMmU2TFZpbUZpcVBsSDM4SGN4YVArczVWekJMTG8ycnhVbGFOSzFmUXpq?=
 =?utf-8?B?eHlMVkgvYjlJVWE3U0t3NDZER0lzV3FFbVNscHBYNTUzS0lyQzg0Q1VManJZ?=
 =?utf-8?B?Mi9GcTRDUHIwRjFHR1YzMUFFbjdaVTZ4WTExRzM2OGZ0WWh0WGdCUVJjdTY4?=
 =?utf-8?B?ZlNXdUtnT2xUS1FaNzhHQW93QkZ4YWw5cUlwMGdXK3AzOFNwNm1uVS9wRG1C?=
 =?utf-8?B?cnBDejBFWWFuSVEyTHZRVnB3TVJIaERBVlcxOVRnSVR6Mm11RFpZaTFMWE1V?=
 =?utf-8?B?VXNuWmpza0c1NjE2eXBLZEZhQ1dKNHFMcWNRbk1JU2M4MTMvMkFrRzJWdmdU?=
 =?utf-8?B?YXdWL1RmcDU3bU9UUHNoR3ZOVWVzckVLS1VOUEJrS1drZWp6WnNobTdsUVFD?=
 =?utf-8?B?bVdVT3BsTVlPbExLOEltMzBaeVJlZWtkVnc2dSs2QWZCVFFaczdzY2ZGc2x0?=
 =?utf-8?B?YTNTcktxVnpMTHBJYVpRUERjZThZc1ZXY2FlTEQyaVhzNllTOWZERkN1UCtV?=
 =?utf-8?B?S0hWTUgvbk5Sd2M5S2tvU1N4dDRiUFlNQ01EOGgrNEozU0VSNTk3Y01hTXdo?=
 =?utf-8?B?elNCMkoyeFlLcW16aEVmWk4vTUw0QUI3THYzUlZBUzhGVWJKR0FwbGw4QTNz?=
 =?utf-8?B?VUowVDJhZmR5cEt4UTU1Vk5WMmNwNnJvMnh1TnpoNHFZL3NIWDNwOG1SOW94?=
 =?utf-8?B?cVF5cFpTZ0IyanFjVmhrSW9lZmVFaGF1WVNlRVZYeThkd1YzR2hsNkdSOVFp?=
 =?utf-8?B?cjhhQlVOK3UzWmd3UkVJS3UyRkozN0NtdWRIVE1TK05FYytNOEV6UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5073e11-c071-4075-904a-08de485534f4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:13:13.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXAUnaBdljd7XJi+oORwVo8hmIHeHyf5qm2/w0eKI3qTNNFlsGSJX7gIy6qxGiaO+l2w9xQJ0FNBsU+WSc/JPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_021318_101327_A6D6F06E 
X-CRM114-Status: UNSURE (   9.41  )
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

Per dt-schema, the modulation methods are: down-spread(3), up-spread(2),
center-spread(1), no-spread(0). So define them in dt-bindings to avoid
write the magic number in device tree.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/dt-bindings/clock/clock.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/dt-bindings/clock/clock.h b/include/dt-bindings/clock/clock.h
new file mode 100644
index 0000000000000000000000000000000000000000..155e2653a120bf10747bd7f4d47f25e0493e0464
--- /dev/null
+++ b/include/dt-bindings/clock/clock.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_H
+#define __DT_BINDINGS_CLOCK_H
+
+#define CLK_SSC_NO_SPREAD	0
+#define CLK_SSC_CENTER_SPREAD	1
+#define CLK_SSC_UP_SPREAD	2
+#define CLK_SSC_DOWN_SPREAD	3
+
+#endif	/* __DT_BINDINGS_CLOCK_H */

-- 
2.37.1


