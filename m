Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73347D2E9F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyAsWCWWz8WK2yUFnergg82sc3oC8YnTgkgyqPMqRTk=; b=EJHeQ+MvE5n0hWJlYN8uGnFpHO
	ZBn+g8tW9p37nrtfGZbEw2uymlYSUv6zimDT3NRvFXu5mOIQ4nwlebxuXv/UFJUENJ44kl0M//GVW
	tyUzgzWiRKK6DK5NihCSwJwRc4esdUnM38WaslLKuk6Vgfw6G8BVvm2zpKc5++dKd2XblnJ0y8hLo
	cQ91yQkZRyO22GokfHEiOXFDKpToeFTpVcj4FjMSgXtC7oSWwtGY13A/YagcxOLAxiJ9TjM2fwAaQ
	FLcckVOWGtBtb9Po4ulejtHRpxCXkYiwtQhzzbwFV1/5T0zqu9dpi+tqcODgGT8LNb1bicYqLGOKc
	jC/5hWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAV2i-00000000Fxa-2jAr;
	Mon, 11 Nov 2024 14:05:24 +0000
Received: from mail-vi1eur03on20618.outbound.protection.outlook.com ([2a01:111:f403:260c::618] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUxO-00000000ElX-1UNL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 13:59:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQ/0s2gS6+ejqv0FkCIm+HUXuW/itDnCX72gRd7yYAKeBsCEqgEhgGebjIZUwGmN2rHaIkpb8WvvzihygAeNPaiWuOpvU8NrjqL1Yf/SaV7cB+4X2ViaXJuHQxbRFx+S6PixQasEXHon6Fwess5LWQcbk8x0cUqO+aPQ6AOCU+L+324HYv+M7uixm95HBMfExOg/yyPQ+Q0DC9s9Ykwbnc61ZwyqXWtDwEFlQ9DpeyfNsLMOnPAIMAHxUxuZKFW0BQOLGAuEL1j0Tn735h/h9SCVbmNngk2kdpjGcJWZ7LftUtJ1rAlO4nekACaJXhwbrcewFYaSeUWEQjV1SubvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyAsWCWWz8WK2yUFnergg82sc3oC8YnTgkgyqPMqRTk=;
 b=kYhqZBrzvGhWWR8No9Oqho5mTsZCsicxohKVLu+HAmUW0uphiWfaVDjrprRdIZb4m1PCB/LnWG1MMDeU+nVEtjEbeP6pAKQW59m4hYSIZ/KBaTGFfXkWzE4HqzG+nK81EzMbc2r1hsuNt52EmtVd2V2y/Sv4V1Kp2vo0GAVPdrnrZZZ04CvVjwxGiHiErm5n8xmOuBC7SBguzwhMaq8oTDelY4RB/J5cLylb2MZyl+ZjFVVRg1a9YTZLmoSZQspI003gKLXKb/S9MxdMtiOsUoJqHKXEY9cLhzfe6WQ4euOLx9GDDniKzbSrxpnQWiLG9aWQVJCaXN4/eFn9aBpy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyAsWCWWz8WK2yUFnergg82sc3oC8YnTgkgyqPMqRTk=;
 b=icvlHjCSVBhOKlOkauJaSOG8pgffPUv/6zu8H7bLJY6VF6z0oK0llWtW92bPBSGNZXFXAl+pvCLbUNelNW5qw0uvrZT5qcGMpcEIWKVFp3yL/rMLlLQBzvLbBwYeDW1nArleElYTwuN3f0Ei1uikX/F0yYOTgFycNVoIAXAWQwTAOKPtQyLoh+awlsa/0/HioQeQBQh0Y3NLt9ZMf30zepMRJW6F68tmErFLICWBCx8OVtvoPFiMs70fXd2s+4VU6fizN0aX2FdTa9g4Q9aKkB3L4DBgbEKVB48ostfyd3SsEb6Vy93DRJ4VP0xVEyPqNYiKuOyVP/wXezMu0RGNaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:59:50 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 13:59:50 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 3/4] arm64: defconfig: add S32G RTC module support
Date: Mon, 11 Nov 2024 15:59:39 +0200
Message-ID: <20241111135940.2534034-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::11) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5c6baa-bc52-40be-eb34-08dd02591b99
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDZOeHRreWNrMUV0c0Jzdyt0Ui9HVlZESUNjSDZjVFRDR1NoZ0hndGtHSXVS?=
 =?utf-8?B?TUhaZVhhK0VRRjROcC9IaEZ3Q2xHMThMSFB6bTcvbzhUM2I2Q010a2ZjQkd4?=
 =?utf-8?B?SEZ5TWMvVHVKU3BvekYxZ0MvVm5JMW13cC8raVFmaVpqWXJvVWxieVV6ZDlW?=
 =?utf-8?B?RE5xMTVBQUNPbWJoZ3g3dW12WXBPbnBuZDUyUVh4WE4wczlKTlRLL29Jekh5?=
 =?utf-8?B?TkwxMzRidHdMVUJRQzQ5UExQSy9jQUtWclNEdWtoNTQyc0hvRUJlOVJ4U2Zm?=
 =?utf-8?B?b2dzcCtTakk1WmtiSlUwNmx2Ri9Zc3gzR0JZeDBrQXFkRkhDZndHa2x0aENq?=
 =?utf-8?B?VEV0Q1JUS3B0eW9pM0NvTVk1R21Ud1FMWERPYjZEdjFHVDhaeGJjVFhrWmJY?=
 =?utf-8?B?OERTZDVsVWI0cW1Jc3JPU0crU0NpZ0VxWEpyYUZURExUVG12WmswMk1BZUdI?=
 =?utf-8?B?ZUV4bjhaa3ZteFFwemc2S2RuQ2hGUGpmb1BFaVJQQkd6cFRmQjIyd0syWEt4?=
 =?utf-8?B?YXRzRmkvdGlMNmYzcnpyVGdaN3hrOE5uaGxsciswNGtxbmovYUNXekU0dWIy?=
 =?utf-8?B?NFFJVUZKZ0JFR2FPUllJanc5V3NPSGdjbVhXM0tjc0Y3MlUyQlZBeWtaNEg2?=
 =?utf-8?B?cmFpZGFYeFdTL3hQN3plMkFzTTlUTWs5cEVDdm1HOHFTbStvaW9PeVE2SFNt?=
 =?utf-8?B?T3NUM2pzU2ZPdkVxQ1NNMW1pbEExQ3FnVWttdk4zT3p1YWxjekZtSWxFVnJQ?=
 =?utf-8?B?anpMOXBVSHIwbFliU0NtYW1rTi9jYUxhbktpZUNNM1FwTytIbGxTbjVmdkRE?=
 =?utf-8?B?c1Mrc3pkY0FNQTAvWWs3ek9IZ2ZpcEdYY1BrcGJEdHRvQ0xRVlFnUmcvbnRG?=
 =?utf-8?B?VmlyTC9NZVcyTFA1Q0VQWUZSNi8xckVZZ0VSelRGS3VPeDhhODVYa1ROUEZu?=
 =?utf-8?B?eVEwSGVXUEVDSVhVKzI0a2d5dHV6T0RDelFZa29ZSDd5MmJhckNLRm44ZnV3?=
 =?utf-8?B?WEVNNy9NOFFhTnQySnM0UGVhYWlzK2hsK2Y2L0ZUSXdMME5aZzFXdHF2SDc3?=
 =?utf-8?B?dVI2U01LbmJrbnprSk0zMU81akY1cFhoWE1qczFFSUJGdVJML1hIYTdZV05w?=
 =?utf-8?B?NHFDVEdDT2ErZDVyK1oyU3o5eTgvNW4ydGhOaHdhSjQyZ3U2WmV2elZGZ2lo?=
 =?utf-8?B?VmdaWnR0MXZSWWpVYlk3alhSN21TdFhuTWVLMUVrV2xUUzg2QWhzdDJ1NU9E?=
 =?utf-8?B?ZUl6T3ZqMituZWgybTAraGFuaXBPT0ZwaVVKTHpRZGxjZ0k2dW1OUFlmSUJa?=
 =?utf-8?B?MFBwRFlWZlVNcWtrS05scUt6WG5xMUFsallpTWptRlJWVHRRc3VLUHowZlBN?=
 =?utf-8?B?YXMySnJRaFBCTFdvdi81MWR5alpGbzNrN0JxenpMQWpYYldoTHlzMWZaVzZn?=
 =?utf-8?B?UUdUOFBkd000eS9UNXRSbWNTbUY5MWNrdHlrT2NldHUyRnFMVWkybWZDaHg5?=
 =?utf-8?B?ald6MWt1RGkyZmdDaVpvd0ZsUDRiMktkWUlSNlI3RENaRzhia3o5YUE0bjM0?=
 =?utf-8?B?UHJFL0NDU1luMFRKdXc1aVBFdGtYR2h0QlVxVzBpa0lyTkZkQU80bnV4bjIv?=
 =?utf-8?B?WnViVldtMjVEenVkZkY3UFlKMmUxWElnU3R4d2dYOG1lNnF1ZVN1SDZCVXFC?=
 =?utf-8?B?VUdHakJyb1ZUdHlSbDU0RE1lblN3Z0M4ZWgwczNKZmFsQXVjRE9EWG9MV0s4?=
 =?utf-8?Q?Q5Mo6WQbzAo3lcl3wbHfmUs9/1tasZTqOQ2H/Ig?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzNQR1dPdFdBdVcxV0ZUU0V4WXJiR1lJWFV6K2taK0ZHVWpoY2k5Y1hGTmdq?=
 =?utf-8?B?OW53Y1F4WEJCZWxZVHIwZS9lUXZuVXcxSkZIR3V1U0F3V3VxaUNmNHBYMUJk?=
 =?utf-8?B?SDlFV1hHV0ZuNDlBOCtzZDRCWUNJTlpIVTJtQU1VbElwT01qR0hhc04wM3No?=
 =?utf-8?B?WUxsQlVYWHZ3U1dGVzMvOUZwUWNEallGWUwvbTIrNkJkWlRJU00rTEdId2Z6?=
 =?utf-8?B?RVJlYXZwTndYZVBzV0R3UWZSN2Vjc3ErZjl5QU5HZnBYUTA2c05uZlMreTQ0?=
 =?utf-8?B?QkVnVS9lRmcrMG54YitEOFNSVldoR2Z0THFFZnhGMEtPSzhMVzZpei9NUzVB?=
 =?utf-8?B?SXg2WnNzdW5XU3BxbTJjS3dnNHdvVmhDQkNGVEZPZmJVVGpGNnNSbHIzM3BT?=
 =?utf-8?B?M3lzN0VBSjNoTkRDR1hJUlBTalEvVFllWEFESlErK0RxR3RzMzRyY0JWSGFD?=
 =?utf-8?B?YytXcXdPQjhjU1BWbTZSSU1IVXZHUkEyeUVlb1RhbDV1TlB1SXloNUFOVklI?=
 =?utf-8?B?OHV4NEVUSTN1MDRWdy9ERnVjaGdZQ3JqZDVsZ2MrS1Q0VnRuMERmRkFzY1VH?=
 =?utf-8?B?WW0rQzZ4b0s5bmxBNkJzRG1VNXBPdVVkV2dZcEIyU1YrNzBUMzFrTDJnemdW?=
 =?utf-8?B?NlB3dmFzYXl0czBPZTloaitiTmw4Yk5DUGRVNU56aytoYjRtMnVkVW50Y1dm?=
 =?utf-8?B?N1UwUzlqeUdQQUU2eGhJRnkwcGJnMXZONGtiTnBib0oyU1dmcWYzWStkeG5k?=
 =?utf-8?B?VlplUEdTK0d3UXp1Q2lhYnoyaGswbVd5Y2oyMFRBSGpnVTRQbmdqRU1qWkFw?=
 =?utf-8?B?TElpeW5SVmlnL3BDanJ5Vkp2ak5ZbXIxYTI4cExKRDNUV2loU1RSRGxDWDVn?=
 =?utf-8?B?WFNRSERDdlNMbm8yT0lYb0FESkdJaWJPekV0OFJBMzhzTk1BcFhRKy9hdUd2?=
 =?utf-8?B?ZllTZnJhOVY1Zlo1SkJBWVQxdUFXUXVWMzNaN254dnMyY0U0RlYxb0VGbGhT?=
 =?utf-8?B?SGRnRzhVK1hIeVo1OVR1cHFnWHp2b05WZ3hOSTlsZWlQbndmMkQ3MEJDeDRK?=
 =?utf-8?B?b3krQ2pLWnJHbC9GRGdROU5MTHNudnQ5QkVlVXlrWGFlNlQ4NTFQeTc1aS9F?=
 =?utf-8?B?NnB1Q1lFMDVYZkVhNlFlMlIvdHFyZU9YQ0RwTWZGR3M1enNpTzdOZkxjemFR?=
 =?utf-8?B?dGxiRmRHMWhBY2dsb1luZ1dWK0pXSXRVUnRWOUV3MGIxbXB0REZmaHQzMHYw?=
 =?utf-8?B?cEJ6YmtmVmRyUU1DcHduS1hXN2NTMW0rSGZGS2srempoK25MY2RwYXdySlE4?=
 =?utf-8?B?SzZPM0w3SVZKZml0dVhDck9FUmtWL29xVGloNmdsVmwvTlRZUzdHNmZnYi9i?=
 =?utf-8?B?cG82TU05NHFkRlBwdCs5SE50aVNyQUtIRzJZdlViYjdoZlhiYy84UFNNa3Jy?=
 =?utf-8?B?clN5bE56KzQzTXR3QlRrMmhFOGkzTDJDMDkwQ1FIN0VUUlZaaGNFM2swQWxD?=
 =?utf-8?B?aFRSRERncXZCaXErOW9pckxrWWZPRmxjNHlNSXJIK3dnYThtZk14OVdha3JG?=
 =?utf-8?B?ZlVNQ2JweVZmdzR2KzhNWHA1WjNDZVVtRlVObktwR2hQdDJ3dVRYcCs0dVdN?=
 =?utf-8?B?YjJwaUZLaGNLekRrbjdIdDNmT3RReFYzWVgwbGppakgyY2NTdUVWV2tOd1ZO?=
 =?utf-8?B?K1gybkFSMUNrMm5DbFBkMGhBYzlPZ3VhcFFKOG9yb2R2bzJIcUNGdGtocFZN?=
 =?utf-8?B?d2dkaXhpWDZ0d2pabllYKzBLdnVaazRwa1lqb0hBNFMrYVRUcE5LOGZRRThY?=
 =?utf-8?B?a2hxOS9yVHh0eTExTEhYcFdHdG5vY3g0QStyWjRGRDJkOXBDQXhSdlAwRnpv?=
 =?utf-8?B?TXRoMlQvSzcxeks5ZHRZUE5vbDJ6azVWTFFDc1hxbFFqSmJUaHovTHVoRXZ4?=
 =?utf-8?B?Sk5wRHZBUGEvVG93a2NmdEZ3T01sU1JFS3FuRzM3MkM3cTYySUpKdy9iOXBk?=
 =?utf-8?B?QUU3QzNiNVRUT0tCRGwyWndmVHVUdWovbUl4QU9DSkVraHlYQ2V0clEwUW15?=
 =?utf-8?B?cHIrZnorQXIybW82dHlnR1pIRGJjVEtiNE5pdlQ3TTdOMWxLYVptL0x6MDdl?=
 =?utf-8?B?OWhOdXlwdTkrUkcraGE2dkZhS0Z5a0locEdJT0F4QjF4UXEwa1psR25Jb3JW?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5c6baa-bc52-40be-eb34-08dd02591b99
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:59:49.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XOJ3Eybjo0JLpj/29lRNVqRuKcWmG01yjRjVB2AFqM8ZOIKLWzkiYuPQ6k49RtFqP1/Jvf6qoR2up8FciNf4jNd0PhyosO0F6q87XOGkVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_055954_428414_7BBAE4F9 
X-CRM114-Status: UNSURE (   8.59  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC module enables Suspend to RAM (STR) support on NXP S32G2/S32G3
SoC based boards.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..584cef78c984 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1209,6 +1209,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


