Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557ACEE6427
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dynqfXZ9adj1/uKkn51wf9Ht4fXvBAZzv4PC+HPQrXg=; b=iCEksJRe6LSxt9VjraH0JQAuvX
	8WGbHG2f56dl7ddobia6E2vgiVmfrABOpw6L+XTui5vzNXxBMVDtK/vM/j+UEVqjNstXTXD92IL2H
	XQqaQthWqOVYPruUM+ycRbDYJmpliBoeB4btfOjsqC/YRcXTA8OMwXJpb/IYsHMLHyhR7hHkRHRXQ
	KDBpsv2CJqB7zYV0TjiSLO1JQfuMSvmT3HDSjZRPlxB+9OnyHCjJZrOASYjfDrh0oOBW363SCl47J
	vF5lzvnvQnl3wP3QVI41uHZTbBBi94+uJgOONrBR5qvpZpds+NlsDtk57u/vYY6UYV5XMPlw7+6Rw
	UwQd8gXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatD8-00000005rzA-0Bws;
	Wed, 31 Dec 2025 10:13:46 +0000
Received: from mail-norwayeastazon11013022.outbound.protection.outlook.com ([40.107.159.22] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatD0-00000005rrg-32t5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 10:13:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWkBMTMkd8tcQiKWEioSP4ca+GnzZuST1wuzVo9PwUE0k1sgpIyRt5qgWE7wEijrfoDQCDPnYYlnefSFp1PkFNR3iGcrYCJqEtAXQnrFBsyeaKtpJPnW5TyD4C5dcszYbhUpRdkFD4qZtrViTnawvJkQ58EuRNx6xwg1MCpojt8gWiTJOcpfI0sC8C2fAlT7UzbuYsXL4zHLVGmsy3jfRjsnboPknReYrRGIDoJx1cdNxHSyI2q49MONxrNbX3cvhQOQYOkuGpfzn3I6VLGL3L+rSfv3sCV8GXAkxsZ1ODqVs5anLFbGjODl0AWWUKhPQKLzexL03urBRzGQuTFo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dynqfXZ9adj1/uKkn51wf9Ht4fXvBAZzv4PC+HPQrXg=;
 b=xwhsRjaAu/m0aZUD5SM6oiwDvKQZrNmI6PZAv1imClr807r6l6NGIrNT0rFxc2ZD0fdyNn87qXNTwitd9XlFUfgVTduekjcCoPZV9KdosAeQtLUPiZuC5bGoKk9CIVrNE9AVBE3sOsQwUE70ncwkP3N+qXpX1MZwibgZ1ohzwybkTW+qqOB1biUwWaUHNWKzfvg1xyBkISKmJIoIIkA09RvOjmhtxSoxRC7HzL7xDQfOtbbLIhLXBH6uwALa9O9gcaY0xTzAgrUuFJE/zTjASJoczi0P1h2Y7sggT68YxhgWmj04dmLpdBJ1Klw+kOLkUyS3ivGU+n21oothJIvGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dynqfXZ9adj1/uKkn51wf9Ht4fXvBAZzv4PC+HPQrXg=;
 b=oMyYcJmMPsIn67f3lOoauJ82wm7UX7U2ky8Q3+fNBE0hd12l8a2uik4a/q5ZxYKdz2zZwdME1zDl3d0QiMhWpFwIEBjrQpijyryTYhMCjKhi055R7SLcR4EBFsNA/uv+NplnA7DYT3QS6hm3qBpQ6Aa+xAP6jCC3qmVN6S0mAFjezA40LoA+mqtgiKf+ZeMHltCmnfpyiz+Ia8eHyeTszkQRBy5pktNkrxGoBkMxJhdz6UJ3dzvecYKAwWZlyL4R9BLBjxsbcMvTDvH5t/2c41fEf50sBeraX+6M/3svOxyytI9ZcxEIjgEpGUuKyjfe3jQmOINb1EaxK/zjLWfS0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU7PR04MB11089.eurprd04.prod.outlook.com (2603:10a6:10:5b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:13:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 10:13:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Dec 2025 18:12:53 +0800
Subject: [PATCH v7 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-clk-ssc-v7-1-v7-6-380e8b58f9e3@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4903579f-0e64-4abe-86d7-08de485541aa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0luZEtpWU4yejVaTnlLMHdRNHBQY1dIbUphSGVxU1ZvWG5WOFRzb1NRcFp0?=
 =?utf-8?B?WHlCTWhWTzNJZS9kbHoxcUNiWFlCc1ZOUmpCWkhTdXRTYzBaRU1udkFzUlpG?=
 =?utf-8?B?T1JqY2hmTGd2dFVlODlDdWl5RHFVTDZGbUtHUHE2MHErVDNVSVNqYmF5S0tP?=
 =?utf-8?B?N3RxRnBkL1BIRzRnVWJKa1lKUWY2ZnpVOCtrdEdCSWZKN0x5RmZuZU9Zampo?=
 =?utf-8?B?R2pUZDN4SnIxZWpjV2FjTmVoZEplMUlmL0Z6dzV0N2V0aTVIMDltUkRnMllw?=
 =?utf-8?B?Uk5wcldtQWFHNitaaW14U1hyamVOUGVUZEg3OWhxUlBUL0t5RFhiU0g1UlRT?=
 =?utf-8?B?dzI5V21lWld0YW93M3lhNzB4cEI4VjMyUng5cXA2Y1E5ZlMzdHBJY1prYkRo?=
 =?utf-8?B?NGJSMW90eEFDRXdIUjRCUjcrS2I3d1Q3YzRJQk9KNWZVeENVSlhOUkJtbS9J?=
 =?utf-8?B?bm13ejhRUlBUWXBYVExwNmRnTlo3RnovNWJnNjNQVGZKMm1yQTBIZmdYbFh4?=
 =?utf-8?B?NllabDdWWGtsdHZQZ3NxQkxESWw4VWhJeUxjL0Zlb29TVVljZmVKd01Tams0?=
 =?utf-8?B?WDRpQ0FOQTg1dm5pbmF3MkZZYVpJL2c2SXloU1BhU1B6V0Z5d1RZRE43Tk9r?=
 =?utf-8?B?K0NEMFlPQkd3NE8xYzJaZXBmTDlacnNHWkdJR2tKajJWNG1QajdXOWZvaXdH?=
 =?utf-8?B?cGs3VEIxRjdLVTVGbE9PSDd4Mk5CMmJwbFlybXBnMkVRcnhiT0p4aUV2UjI4?=
 =?utf-8?B?NWJlSlFpR3ZUK1NXOEpPcFBTOElkaSszSlhXd3RhTXpCWEhiZGpyODczeWpI?=
 =?utf-8?B?YTZldHZRWkR1NER3emJmV3JYelVWcnNRREJJR2hFYzc5NmN4KzNBVHU1RExE?=
 =?utf-8?B?R2JLQlZXVkZrd2REUG15VFV3QUNZK3ZseE00Q2FDalJPVVBiSUlBVmFBcVNL?=
 =?utf-8?B?ZURMWUxPbDkrR2c0NEZwL1NXTHp3N0R4ODRoZUhTa2xtODdxYXl4RFNMV3RZ?=
 =?utf-8?B?ZjU4cnZKY2tNQkxRV1g4cjNEWC9mV25rMy9JQUtrTTVTY1NtY0Vuc0RwUW00?=
 =?utf-8?B?YmVTR29hYmhJa2YvcWY3dkhDVUpld2xCOExveVJrMEVjZk01VHRDNmhRZ1lF?=
 =?utf-8?B?aS82cENXemh6UFlITHAxTjc2SWlLOTJPSkJzT05aY3lISm1sc285MjdRVWpt?=
 =?utf-8?B?Q05QYWYyRDR1UUY5d05ZdzBBRWxwdnZXUFhEUGk5NVFzek9pRWhYVENiRmpV?=
 =?utf-8?B?VDR4QmlWVEhBbVdMeHF5QVEzNmt4TGduRHg0RXRsQXk2UWkxejVHNjN0QUxm?=
 =?utf-8?B?ZHpHWnYxQmxzMEZZeTN6d0FrT0lyUlhLZkxHd2dRMDZ3QVFiR3RNR28rYmFx?=
 =?utf-8?B?bE54ZkRkTHhOWGZLRXdMQ3B0UVNIU3VMMWFpSGhXSlZrWW84c0tOL2Y2bnlG?=
 =?utf-8?B?WTdBcE8xZk13ZGN2YllBK3hLdVVwa1k1TXJzNjZqN2VDS0FlWUtwbDlCUXVP?=
 =?utf-8?B?N3NIZE9JQ3U2WEYybjF6SllIL0w1cXBBU1A3Q21peVVXYXd5WXZja1JOaHRH?=
 =?utf-8?B?Ly9za3htS0dkUVM5dDZFWERtRkNMU3c0Z1U3YnR4SHZEdTFTbHplT1pjWVlw?=
 =?utf-8?B?dG9Tbm1JYWpranRFcUZYa2h4SkNmOHRZbGpnMHpJKzc1RzFiL1lHL0h5ZFRI?=
 =?utf-8?B?VWRGb2FCRlZEdlNqdjlZazYycmJvczhNcXFSdURFYWphekdPYmg3KzhNNXQz?=
 =?utf-8?B?SVoybEQ5ZTNpWjhFQ1liWFVMRzZOUDNFcGJUR3dZS09NY29NWXJKRGpGNTJy?=
 =?utf-8?B?K3JXVjdZTXJWM0p2WmU3ZVlJSGNsOTh4K21xMVUxQTRCNzJqWEcvVW52VkxC?=
 =?utf-8?B?TU1Sd082bFE3YjVPM2R2T0YxY3BTT2lYbkhUL1k2NG0wNWJzM0U3R2huc0Rx?=
 =?utf-8?B?NVNCMFp6SlJlUjl0QkdnTTRYZ1lFK2lReEJESWxlOWhBMWZmK3YvZkttcWdu?=
 =?utf-8?B?bjd0RU0xckM0NC9yN3FVcitnTzlYeXhoL09sKzBXdXFLUm5RUThaTjRiTVEz?=
 =?utf-8?Q?6E9NYV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkE3Y2dzeXRtVWZUZ3lyOGtBMHJHcmlyRjhhQnRXWDRQSW9OSXJxSUExbFQy?=
 =?utf-8?B?RmU0b0xvYkUyWmFkdlh1emQ5ZlVxT3FKdHJKZ0UxbExGS091eU11b2VzWGUv?=
 =?utf-8?B?U09iMHB4eXRXbUx6dmx0ODlDa1pKMGRqN0pBZlQ2akl3am1QWmNxUERWeVNL?=
 =?utf-8?B?b3BKVjExUHhnR2V5QUxmV2hoZCtDODVOWFhlakFXeTYrNnpSWjlFNFJXc2F3?=
 =?utf-8?B?MHRjUEJ2MW05WWRSc3lsVWViTjc1Uk1iU0pQWE81U1NxMWVpL0dYQTdSWXpx?=
 =?utf-8?B?QVlyNzRDMjlLdjlJUk5VUHNlTFVnYTgreUdUUE1FR3NNeGw3Nk4wUlhoUkg2?=
 =?utf-8?B?a0pkOXNaUnpOR016U2N4MU1nbnNPbmZCUTdXaks0c0tZVFAzWDVhQzFyWGtF?=
 =?utf-8?B?cHVhZzB3dXVjZkgwMGpWcDlsOUtWa3pKem9wczZSZVhuUjc2OVZyajRQTmZQ?=
 =?utf-8?B?N1pKNG04ZTg4RXR3OG1Kd2dxOVF3cW52U0YyRnZoTFA2WWdZa2d4RG1NMEhR?=
 =?utf-8?B?cnMvdVhOdVBDRTlac3o3QTdxT2J6QXE0VUxWQTQ4cGNkSEVjdE1vYjR2SGx6?=
 =?utf-8?B?WmgvUE1XU2tHYkcxK3A2T0VSOFhvNXNDU2ZwTE1ySS9DRldKeXdhOGEzR0pu?=
 =?utf-8?B?YW5idk53Qk9XV0RkbUtlb2hBRWk0VjlsemIxUEZZYjdadVZtUnpENFptTEQx?=
 =?utf-8?B?Y2F5c2N4UDR6dSt0RXo0Qzg2K1JGS1pZbFVqRDIyOEI5cnd4azJvajlmZExH?=
 =?utf-8?B?Q0lrYUNYQ3BENDdvdXJxUjk0TytuUVpORFVRZHl2d0pXc0xmVmt2UFhUaDVm?=
 =?utf-8?B?NVNKWFJGbjV4K2VBMFpkZUFEZitGUVdjZE5zaXZuVk1uWURpLzNyemFsNTd2?=
 =?utf-8?B?OWh3RDFmYlZ4ZldRVThoNWdQRitjUCt4SUE0NnIyNzdqUUlMY0xKNFBaSGVD?=
 =?utf-8?B?aFBKa1NNc1FtMjgyVGlpVVQ0SmJ6MmtqL04yODVIMlNlWjVvMFVOV3o1M0ZR?=
 =?utf-8?B?d3FzWXV4MVEvaytzMkJ0RVJzNWU0ZGl2WVRMMTN6VU1LQjFzdHUrRnN5VEZX?=
 =?utf-8?B?RFdDUkF4VTdBTUtxaDlQRzNCRHZnQmRzRURXQ2lNajYxNWtjNTFreEQ5QjFH?=
 =?utf-8?B?c3IzdmVRZjRjazh2U2pyejdSNU5rYXZIWXNrdEtXSU15Vm1pMDB4ZWtmbU1y?=
 =?utf-8?B?ckUybThETUJmNXVMMHhuVnoyd2w5NEdsaDVVWVQ2TmZRa1IvenR3cDFRNWhP?=
 =?utf-8?B?c3NZS3BwbVNlYjZ3S3FqcmtIUThOK3dXaXFwWlB4RmxmUmxEYjk1NXVTNWli?=
 =?utf-8?B?dVZud0JTaFBCTU10N21iS3QrcnVTa3gxakVIdUxCSjNvaHQrZ1YxTjFMMTIy?=
 =?utf-8?B?Q01mNnRMWm8wMzZPeFlMandxaWVVajlyWWlReWw0aG92N3JGWjZ4cE9IRFdp?=
 =?utf-8?B?Q1RFTGl4bS9EZktwWG5wZDFuRy9QcXNlK1hVM01mZW1RQnR3SldkNjJzczF6?=
 =?utf-8?B?Z1pEdGdOdkt4Yi95cWVFcHJjTUI2dGZDTVVpL2MyT2RGbUM3Q0tFR1doRlJv?=
 =?utf-8?B?ZDMxRXN0TE95bFpXNDhCbTFtdnMxbjNDQXJJaWNwMktSSWZTcUFieVhnNzg0?=
 =?utf-8?B?ZXF3ZVhzRHIrQzN1ckIwVVIwRit2UjVaTWRrYlVRaFZOYThjcmdzZFFrT2NK?=
 =?utf-8?B?Q0VpU1FhTDdnTlNwREloTlZPZ1pkdkkrd1prQkp5bzlGd09rZDdMSnN5TVd1?=
 =?utf-8?B?Yi9FK0xLT3FmRVcvSGFTZWgxNjlvd21RUWVUMGdEcHJBRGRQVWJ3akx5T0FO?=
 =?utf-8?B?Q2hHYktQVUFCWU5hc0lQbzZ6KzgvakVDYjBUejNPZ3Q4dWMvdmY5SFdabnpI?=
 =?utf-8?B?eDRpVVgzWmpKU1paMHRTb3YvcUYwdnJWUkNEVVFEamxBRXJzVkY4NW5MVkpD?=
 =?utf-8?B?aEtBbUFVQkRpc2ljMmYybWpPVVJyaTQ2MCs4YVNwd2VvSTV6RDlQNjlVZW1O?=
 =?utf-8?B?ZE5YRHFrZzFpVXFCMlFobDFHODVqY3JGWTJsRHRuQWltbWt3MGRwVjZWdE02?=
 =?utf-8?B?REwwejFMaWtCYmNxZVJob2dmYjRSemdhbkRZRFppU0FFYTRZYk9hUlNlZFQx?=
 =?utf-8?B?bStnT0c1dHkzNFVmS3RKeFJEYk1kaVZlalhOUFErc1l1MCsvbkFBSGNhY1Y1?=
 =?utf-8?B?VmZJRnFWU0VsUi9GOVZMMXF1U2hLb1oxbmlPYk9SS2t1a0g5dUNieWlsdlA0?=
 =?utf-8?B?TkxVckJ1eHFRYnpmbU5wSzBrQzRVdDNyMHBXc0ZNczBDUEYyMEtnWDN4c3F0?=
 =?utf-8?B?dWdjK1Fld3hxZjVURm5iK1IxUE1wM244NGRTaSs4dHdXanBxQURIdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4903579f-0e64-4abe-86d7-08de485541aa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:13:34.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHyKrfPADcb8qVs3RusKMKzDEBwt2WRe6A0tLRRmTNFXKk/5WwZhgdXuhscKwNqq1ck5c+DyvNhoBd6Ltnifaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_021338_781965_C3AD5CDB 
X-CRM114-Status: GOOD (  17.46  )
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

 - Introduce 'clk-scmi-oem.c' to support vendor-specific OEM extensions
   for the SCMI clock driver, allows clean integration of vendor-specific
   features without impacting the core SCMI clock driver logic.
 - Extend 'clk-scmi.h' with 'scmi_clk_oem' structure and related
   declarations.
 - Initialize OEM extensions via 'scmi_clk_oem_init()'.
 - Support querying OEM-specific features and setting spread spectrum.
 - Pass 'scmi_device' to 'scmi_clk_ops_select()' for OEM data access.

Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/Makefile       |   2 +-
 drivers/clk/clk-scmi-oem.c | 103 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk-scmi.c     |  19 +++++++--
 drivers/clk/clk-scmi.h     |  11 +++++
 4 files changed, 131 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cb10156db2a37e1956d84113d1711e23d9d864ab..8e0e03a79f793ffab6c8636b7796c067287e1712 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -95,7 +95,7 @@ obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
 obj-$(CONFIG_COMMON_CLK_RPMI)		+= clk-rpmi.o
 obj-$(CONFIG_COMMON_CLK_HI655X)		+= clk-hi655x.o
 obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
-obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
+obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o clk-scmi-oem.o
 obj-$(CONFIG_COMMON_CLK_SCPI)           += clk-scpi.o
 obj-$(CONFIG_COMMON_CLK_SI5341)		+= clk-si5341.o
 obj-$(CONFIG_COMMON_CLK_SI5351)		+= clk-si5351.o
diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
new file mode 100644
index 0000000000000000000000000000000000000000..fd81aca7bfca254669ee117ebd51e481a74cdcb4
--- /dev/null
+++ b/drivers/clk/clk-scmi-oem.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Vendor OEM extension for System Control and Power Interface (SCMI)
+ * Protocol based clock driver
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/scmi_imx_protocol.h>
+#include <linux/scmi_protocol.h>
+
+#include "clk-scmi.h"
+
+#define SCMI_CLOCK_CFG_IMX_SSC			0x80
+#define SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK	GENMASK(7, 0)
+#define SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK		GENMASK(23, 8)
+#define SCMI_CLOCK_IMX_SS_ENABLE_MASK		BIT(24)
+
+struct scmi_clk_oem_info {
+	char *vendor_id;
+	char *sub_vendor_id;
+	char *compatible;
+	const void *data;
+};
+
+static int
+scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
+				 const struct clk_spread_spectrum *ss_conf)
+{
+	struct scmi_clk *clk = to_scmi_clk(hw);
+	int ret;
+	u32 val;
+
+	/*
+	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[23:8]  - Modulation Frequency
+	 * extConfigValue[24]    - Enable/Disable
+	 * extConfigValue[31:25] - Reserved
+	 */
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
+	if (ss_conf->method != CLK_SPREAD_NO)
+		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
+						 SCMI_CLOCK_CFG_IMX_SSC,
+						 val, false);
+	if (ret)
+		dev_warn(clk->dev,
+			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
+			 ss_conf->modfreq_hz, ss_conf->spread_bp, ss_conf->method,
+			 clk->id);
+
+	return ret;
+}
+
+static int
+scmi_clk_imx_query_oem_feats(const struct scmi_protocol_handle *ph, u32 id,
+			     unsigned int *feats_key)
+{
+	int ret;
+	u32 val;
+
+	ret = scmi_proto_clk_ops->config_oem_get(ph, id,
+						 SCMI_CLOCK_CFG_IMX_SSC,
+						 &val, NULL, false);
+	if (!ret)
+		*feats_key |= BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED);
+
+	return 0;
+}
+
+static const struct scmi_clk_oem scmi_clk_oem_imx = {
+	.query_ext_oem_feats = scmi_clk_imx_query_oem_feats,
+	.set_spread_spectrum = scmi_clk_imx_set_spread_spectrum,
+};
+
+const struct scmi_clk_oem_info info[] = {
+	{ SCMI_IMX_VENDOR, SCMI_IMX_SUBVENDOR, NULL, &scmi_clk_oem_imx },
+};
+
+int scmi_clk_oem_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	int i, size = ARRAY_SIZE(info);
+
+	for (i = 0; i < size; i++) {
+		if (strcmp(handle->version->vendor_id, info[i].vendor_id) ||
+		    strcmp(handle->version->sub_vendor_id, info[i].sub_vendor_id))
+			continue;
+		if (info[i].compatible &&
+		    !of_machine_is_compatible(info[i].compatible))
+			continue;
+
+		break;
+	}
+
+	if (i < size)
+		dev_set_drvdata(&sdev->dev, (void *)info[i].data);
+
+	return 0;
+}
diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index bf85924d61985eb9e596419349eb883e3817de73..1ed2091e3d4a951c8662db4c94dee4b9c98b8326 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -14,6 +14,8 @@
 #include <linux/scmi_protocol.h>
 #include <asm/div64.h>
 
+#include "clk-scmi.h"
+
 const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
@@ -242,6 +244,7 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
 static const struct clk_ops *
 scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 {
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(dev);
 	struct clk_ops *ops;
 
 	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
@@ -288,11 +291,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
 	}
 
+	if (oem_data && (feats_key & BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED)))
+		ops->set_spread_spectrum = oem_data->set_spread_spectrum;
+
 	return ops;
 }
 
 /**
  * scmi_clk_ops_select() - Select a proper set of clock operations
+ * @sdev: pointer to the SCMI device
  * @sclk: A reference to an SCMI clock descriptor
  * @atomic_capable: A flag to indicate if atomic mode is supported by the
  *		    transport
@@ -317,8 +324,8 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
  *	   NULL otherwise.
  */
 static const struct clk_ops *
-scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
-		    unsigned int atomic_threshold_us,
+scmi_clk_ops_select(struct scmi_device *sdev, struct scmi_clk *sclk,
+		    bool atomic_capable, unsigned int atomic_threshold_us,
 		    const struct clk_ops **clk_ops_db, size_t db_size)
 {
 	int ret;
@@ -326,6 +333,7 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	const struct scmi_clock_info *ci = sclk->info;
 	unsigned int feats_key = 0;
 	const struct clk_ops *ops;
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(&sdev->dev);
 
 	/*
 	 * Note that when transport is atomic but SCMI protocol did not
@@ -350,6 +358,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 						 &val, NULL, false);
 		if (!ret)
 			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+
+		if (oem_data && oem_data->query_ext_oem_feats)
+			oem_data->query_ext_oem_feats(sclk->ph, sclk->id, &feats_key);
 	}
 
 	if (WARN_ON(feats_key >= db_size))
@@ -407,6 +418,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	clk_data->num = count;
 	hws = clk_data->hws;
 
+	scmi_clk_oem_init(sdev);
+
 	transport_is_atomic = handle->is_transport_atomic(handle,
 							  &atomic_threshold_us);
 
@@ -438,7 +451,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		 * to avoid sharing the devm_ allocated clk_ops between multiple
 		 * SCMI clk driver instances.
 		 */
-		scmi_ops = scmi_clk_ops_select(sclk, transport_is_atomic,
+		scmi_ops = scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
 					       atomic_threshold_us,
 					       scmi_clk_ops_db,
 					       ARRAY_SIZE(scmi_clk_ops_db));
diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
index 6ef6adc77c836dc2d599ff852cdc941f217ee388..d7f63f36c56d155f728325efd6bcf7fe2585b170 100644
--- a/drivers/clk/clk-scmi.h
+++ b/drivers/clk/clk-scmi.h
@@ -7,6 +7,7 @@
 #define __SCMI_CLK_H
 
 #include <linux/bits.h>
+#include <linux/clk-provider.h>
 #include <linux/scmi_protocol.h>
 #include <linux/types.h>
 
@@ -19,6 +20,7 @@ enum scmi_clk_feats {
 	SCMI_CLK_RATE_CTRL_SUPPORTED,
 	SCMI_CLK_PARENT_CTRL_SUPPORTED,
 	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
+	SCMI_CLK_EXT_OEM_SSC_SUPPORTED,
 	SCMI_CLK_FEATS_COUNT
 };
 
@@ -37,4 +39,13 @@ struct scmi_clk {
 
 extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
+struct scmi_clk_oem {
+	int (*query_ext_oem_feats)(const struct scmi_protocol_handle *ph,
+				   u32 id, unsigned int *feats_key);
+	int (*set_spread_spectrum)(struct clk_hw *hw,
+				   const struct clk_spread_spectrum *ss_conf);
+};
+
+int scmi_clk_oem_init(struct scmi_device *dev);
+
 #endif

-- 
2.37.1


