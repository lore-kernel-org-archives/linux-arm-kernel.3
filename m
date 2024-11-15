Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F58D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzSMcVGymxpJIlyUvludt2Ox0CLAR6F+IBTo1DFr50A=; b=nDyUQ4IsLAJoOOOu9omfo5JDZD
	04xwaPGwtq34v1T3G4NyczU2b91kw64n/YCmO6VuMecV5XGfsO+P3RFb/tsMJYt2KkHyvqshx2CGW
	TuTfCqipW+SrPnAOjbw1XOK2kebh0u5+djlVV883p7re7JLz6I07CpANMtPMJ83vECg5Q1W/HGxMn
	dZn8ythKVjzWPv1Fn2wqmseeUOgeV1j4Qo0WH5OPqS0Q6gcYggheR+qdJpe9K29ZdCRuRIhZPCpf8
	oC37CAiLa8HL+wYPctsGCo7QundiNXk+laoAtW2D4SSl67oxe4reiC5EAG8AlfQgyVsGOyeagtbrY
	FyCA0nrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC25U-00000003rkm-0gBG;
	Fri, 15 Nov 2024 19:34:36 +0000
Received: from mail-db8eur05on20615.outbound.protection.outlook.com ([2a01:111:f403:2614::615] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC24X-00000003rZA-1dII
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 19:33:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Po6P9aVtEG7M4vGb42+hUhQ1u0WGD8HuBOQKfifygvChwTzXzPiFfTQwE0RWRb4owb1Q1+ixjkSHbDLVr1WuZshohvztLM8GpX7Ky7va8IF5WWojS2QuKefPuSfaLAjY/fq/RXsG9+5II4JlbZkfbru9nNLNWI0GT56Gxbrjegsb+2Du4AWDsYMekpeoHIuAuJKoyrSAGn5TkraZuEN2FQSyTUfrj7KnLG/kdwK6WdV53Dimx4Nof6Qld9ptdyysHMkT8MczekU206Qf8VSaFM9gekbxQKFOkfMpuEkPlpsMZreQGlwxfT+GMJj6y6y3JsIJSNBc9YqjWnExH+JzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzSMcVGymxpJIlyUvludt2Ox0CLAR6F+IBTo1DFr50A=;
 b=OnV+gnUzvvqHi5uNuKP5MV0GtNaYOxBqwzAnMDJSoOhKAmiDkm90LGnCxN3/5mfQWmMKqgqZvyb1INX5wnHMuJj7c0oDGfFL4QUyA5alUS893D4E/ti44UOKmOVEI2inxVqwtEqTijXVd7w3cIsUeWyEcEzQMhZSWpVL0uoJH8pLpdTUotzn9xD8OnBJVnPjGBO35pN+1/IeyAQTfEqax+hE/R+7fTApR06GGrQ9w5D32lRfh+B/yxwAsOIlvB8K7Y1+gm/k7JYzhQHTQnA+bPdsVAJdwsxZq0iMWDBHU9EuPcv2Tuyf71fmUL0ncLkclBE71Sa5KWqPdREfY/Sutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzSMcVGymxpJIlyUvludt2Ox0CLAR6F+IBTo1DFr50A=;
 b=XsVm4zdidRsavU7X5R2VJHACgimpjFszuN+pEctKrJOLCZhk6fejmnGCaf5o4Sj1DMqN1C42p8MVQqiKOUk+0bOGUM7SUkPB1sI42dS9ksBAALI0i1xcDtNUYaE5igPvAjAyCU4ZytOMG+wWHusrJ4LV9uHfhNryl9H9y5i3XpuwaFbwyNZ2taiyeH5zr56JFs+BAWVeOySF+t8C5JylUY8p6IkKUngH+HdUPf8PrjbDjwoM6D+c68AJHxGAENaYQ9YvgYVQrwI3xVJTy9OEmWSTdPplbMDP0BZV3k9tDBZivX++Bm5QSs+w4jiu6FjYTNWfjoOg/DmbnOZuYKUPNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7421.eurprd04.prod.outlook.com (2603:10a6:800:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 19:18:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 19:18:45 +0000
Date: Fri, 15 Nov 2024 14:18:38 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v7 2/7] PCI: dwc: Using parent_bus_addr in of_range to
 eliminate cpu_addr_fixup()
Message-ID: <ZzeejnBC4KrJoHqm@lizhi-Precision-Tower-5810>
References: <20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com>
 <20241029-pci_fixup_addr-v7-2-8310dc24fb7c@nxp.com>
 <20241115175148.tqzqiv53mccz52tq@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115175148.tqzqiv53mccz52tq@thinkpad>
X-ClientProxiedBy: SA1P222CA0063.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: e257054d-252b-48ba-9f2e-08dd05aa52d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzRZeVJ1ZkFMKzRDQUYyQ2dMVzZ2N2lLbHA1V2JrRnRJL0wyNTF3YjN6SHRj?=
 =?utf-8?B?Z1VIajR1RG9NRWl3Nmt5aEFqamx6RjdWSzdyU1lBT3NPNGxzYitxdldOWWgw?=
 =?utf-8?B?dGQvMkhUWjZrVW1VdGgzWjVWdmowODl4WThabUJtaHBQMDUyNnlrTnJsa0RU?=
 =?utf-8?B?NzA1aE1zUmpNcUVUUjBwNzhLUVNoVDRGVmtudXNWeGRKZktHR2hNZW12MDhE?=
 =?utf-8?B?MmhaTzdQRWxWRG1Jem5DeUp5RXB1aWRNNkRPZ1VGaWJqRy8zQXY3cDg3cGtK?=
 =?utf-8?B?RVpjMEg2K0c0WGdCUjVJRFNXeEgxMGFnVmNhcDh4M3dxYzZwT3NCNllvT1k4?=
 =?utf-8?B?OFhYODdSSTFyczI3dUNZeXBRMGdCWElXUE5HVGs3ZHR6Zm81RWdHMnJNeHE0?=
 =?utf-8?B?TVB6TGg3eGF0NGQ0RkE0Q0FRRTN3eWxleUJjUlZZTDU2UVFMenYyYWN0SXNq?=
 =?utf-8?B?dXFQelRadTBhMURaODcvMUx6QUd2aGRVVHFyNGlpYldJOUdpeUh1akNWVk9t?=
 =?utf-8?B?YytMNEdqVmhyK3ZCVmZQMXlFaWtibVF2QTJERHZrckVOSjhmdjNhWFFzZ3E5?=
 =?utf-8?B?NUFBT216N0JXREJ1clR1R1NWWUU1ZW56V2RiWkE1WUhnMmFCeVFvMDIyS0dK?=
 =?utf-8?B?NjhKUWpSNVd1TlZmZitnNjViakwvTzIxYTdCTnYwdlowOVlWejIreEV1VllX?=
 =?utf-8?B?ZGs4WnRqMHJrQWpyS01sLzRCdnBxdXM2YW5UaDc3SnhTdUNZZmluWTRLTit5?=
 =?utf-8?B?VE03YkFTb25hQ3VHc01XV3JMWFN0a1kwN0tVRUlEdTBCSEhpcWpPaG1rM2Vk?=
 =?utf-8?B?Z2pwalc0MFVrQWdrU0dsYlVnZ1JPcDI5Q1pTYm1RdHFXbW10UkNzdlp3WWRP?=
 =?utf-8?B?ZDVpRkVFRnQrcWE0dDBIeTVpMitoSnlXQjJGSUZmTlpMUXpNb3lmMktEL1E3?=
 =?utf-8?B?U0V3dStVUTVoS3ErN3lGdVdNRW96YWxRY2dFZ2R2OEFNMzQ5RzFueW9GblFU?=
 =?utf-8?B?ZE1lbFlVY0JlQXBXY0ZLNkFtYTI2TnFGOHZwNFhyOVFsSndOem91S3lXWllY?=
 =?utf-8?B?QzJselkzbmlZZ01VRWNyVFg1a3AwSmcyR3BReWtPRC9FQlpYVkRYYWFpa0NH?=
 =?utf-8?B?Zzd5NEYwSlJqSTY2NE9FVUc1bDRTcFFoUzJFaWdxZU5QV1g2cVFRWGtMdXhX?=
 =?utf-8?B?b3o3SWoweEFuM2ZaOUV1VWVoa1N1RU96T0lTQmt6bzJkY053UmVsN1FJVmo2?=
 =?utf-8?B?Y1UwQ09nZ3dJd3VpRXFMR015Z3NoSXZDVVhqa3R6OEVtYVVhamU4WjlQd2tC?=
 =?utf-8?B?UWd5dks5VGpHUTFZWm5oUWpCcmYxeEhndk9URmVMQ3NnSE5tdFpueHRDVDNr?=
 =?utf-8?B?UXpHTWpKNnNzRGJKRDJhdTlTQ1NmbWZLQTljSmQ1ZTQwSWZCWXIzazVTaTlq?=
 =?utf-8?B?ZmlJRHdlRDlUNlFOUGdHNm4wWXp1NkxDUnlIS25Jc0tBNHl2NCtrRDh5STVK?=
 =?utf-8?B?VlZnN2JtU0pza0lWSFNaelBsZE5ueVRsUko0aEJUc3FoSGtVUnJoRzZGSWxt?=
 =?utf-8?B?RTFtNWFMQlBYalFYLzZRQVYrSnVheTNTZFhFL2VPWTQyQThVNGc0Um90N28x?=
 =?utf-8?B?R2RDak11M0JCd0hzaWdUNUNTdFBZaFpha1BBN2pabnlueUJ1ZUVkcGhoTnh4?=
 =?utf-8?B?SVZEYVhXbm9iWkZrdktFMzVBUkhhbzZrUU9ITzJHKzFxQUh5OWMrWXhJcTZm?=
 =?utf-8?B?ckgwYnlobWZGL0t2SnZ4L2tOdkxKMTVXaDlUbjNreXJTa2I3bkFVK1dUVnVm?=
 =?utf-8?B?U25nT0p2N3R6TkZvMlBDVXg5SFU0YXFleC9PQTNtM01UWnIxa3R5NkVJWElx?=
 =?utf-8?Q?TKSsyoCDTfj5U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1dwODhJOTM4OUZlVGhGSHdMMms5NGgrOVo2S1NQY3dCT2tkbW9WbFM3dmJW?=
 =?utf-8?B?YlBpRDdWNTZFbDJlcER0Z2NPbkFKVitMUXVNeE9SUVVHWHUxN1FISC9RZ2hX?=
 =?utf-8?B?aHBBWTR0MjJYQVRkczFMcnQ4MTRiUlJyeUNOMVRaSHgrRlFlYzFtWGVLSS9V?=
 =?utf-8?B?K0NtTVh6cVRvcFJiV2crYlZ5elo1b0hrNkdCOWpRd3duY29ONnJwaHlGTkov?=
 =?utf-8?B?SDVLbGcrRkdVNXJabU1uRVB5WllFdkJKMlZSdVp6S2xJcW1QYVVPRFhOeFls?=
 =?utf-8?B?RU9ib1JUbWJJK20vczlNNFNpN015dXh4UFlTWFI5YVlPcC9XTlMzK241bHBu?=
 =?utf-8?B?TUdWc29WSjdOTWdUOUFVOTdyVnFOaTVJRk5PbzdRNlNTZzhzdGpVd1J3NWYz?=
 =?utf-8?B?ZnhMbzBFMlRYcC9xRE9QQzZ1cE1QQ1Z3NEF3QUpXTEpZd0c5UEJxSy9kNGtU?=
 =?utf-8?B?RE5nL1RiRHlJWTJXRGhSdFlkNmNMOHdlR3R6R2hDN1UvV3lBblc1dEN1dm90?=
 =?utf-8?B?MmxJREFrRU9uZjcyTGNhT0FvZllIVnZzTm5mR1dpSlRqRnphNVdvc3c2aEUx?=
 =?utf-8?B?YzFCcXJZcWxYZlNOS1BQUCtLYkJuNkxNdWpyb2laYjhRaHM4K2IrRHNJd2Ro?=
 =?utf-8?B?RUV5WmdBZlVTZlcvQVhSSUFuMjUrWkcya2lYWXJ0OUxuVUtGdnMwZk94YVp1?=
 =?utf-8?B?a2ZocVJDak95T3U0RGVwYnVtcHBreVVpUzI2QWFmLytxSmVBdTRFSmNJY25Z?=
 =?utf-8?B?dFFEZWdYTHBBOWlRK2hiR0I0K0JmOTVjTEJyditQdWNSakRnVmNCVzFOYW40?=
 =?utf-8?B?aXFlNStwQU52NUVha3ZwQjhEOFJ1ZkpjemJJTnZYRDdHM2V1ZXFoeFkyKzJP?=
 =?utf-8?B?dk44c1d6Z0k4QWdLdGdVb2lKMEdKTC9YL0xYaTIwZEY0cG9PUm95TFNUd29t?=
 =?utf-8?B?YnlSNFpvcTRqQ2RUNU5oTjYvb1l5a1R2b0VRRW5IR3o5SkxaMUVWZk5IYlM5?=
 =?utf-8?B?dlEwNVJoRkR4WmxBQ2FEZzd3cFhzU3N6K3lIWFZYK0pHNTczaW9hSml6VDly?=
 =?utf-8?B?aWgyeHpqNmhnTWhTUTNmZXJObVIzSDg0UVU4QzB3VDF1a1hVNHFWQnRPVkow?=
 =?utf-8?B?emRuT3l2YUp5UVp2ajB3N21LYUt5V3BJMjVGOTJlVzZIaitPRldNMUd3T2gv?=
 =?utf-8?B?WWxoY1hPQlc2Ky9LSUh4K25hcGoyT1JOcmU1REdkYWJZT01mN1NjNzFGVW00?=
 =?utf-8?B?cFRGOG5JaW9lK0llS0MzQkJUOE9BbWVNZXpUelpvaE1FZDFEYlFKYXkvKzBp?=
 =?utf-8?B?MUEwWFVyeEpnQ1B3NnNXaDRNdmh5STgwYzBIcFJFSUdTV2phb3QrRDhrNVlL?=
 =?utf-8?B?ZS9JeVV0VEE0VWJ5RlBEc0hIYUxBTFFPVzhhenBSRzRwbTcyNU9aZlpBY2pk?=
 =?utf-8?B?T25CcGFWT3hLYjNodzd2RWcyVUoweGoyQjRLdHFKZCtqc1BkbDF1VzllK2ha?=
 =?utf-8?B?eGNiQlE0VzFKaXJpWGErUi9sWHhqQklVYStXVzhxejVER2ExTlB1VStrVGFU?=
 =?utf-8?B?QlhpaWJoWUozM2JXWmkvbXVyUGhUUDVLQWh2VGpEMC9qNjhZTXRySnVDT3ox?=
 =?utf-8?B?bWZVL290MU5Dc2hDSThjajVRUEo0RFBHRnpKeGpEMDJydU0xUTZ2ekZkcDFQ?=
 =?utf-8?B?dFg5b3BaZS9pa2p2RUdMOVNXSjJkQmdXTU1JcmdVczFCZmttWlFkWHlhS3ZV?=
 =?utf-8?B?Y09xemV3R2NOdkZDdyt4TGN6STZ2OFB5TmcwY2h2NDVEQzJMSFVNRE4zckw2?=
 =?utf-8?B?bklHWWw4UUxqVDlPSWgxenJjYTZoT1AyMmNLWTRiL3pOU2ZCR3BuRGh6dTRw?=
 =?utf-8?B?VDBXUVhuOVlHaEpMZ04rN2lUNk5veW1ndFB0WVRWQTZyZ0hlUzhhMElQTjNH?=
 =?utf-8?B?eDh6cFVURjZUVWd1YlUxcit4Q3BJVzVRbGhXMHVtS05TbWs0MUlWOHpBUmRZ?=
 =?utf-8?B?Q1hYS3AveGI3RFlsbmFJVGZRVVZpZy9aQlpydm1RQzlZMnlXQ1ltZ3l5V0li?=
 =?utf-8?B?ZDNmT0V0TGJHRDk1Ykd5N3ZWZlNnR0pGZm5iVmU4QlAxMEZzVmFCd2xudVow?=
 =?utf-8?Q?ZkSA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e257054d-252b-48ba-9f2e-08dd05aa52d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 19:18:44.9677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAIl1JHamekowx60VB3r01dI7I8R+NsuW0e5kwTTtuiwZcTTm9d5IPcxLvPsKEuZHWTs+yUgGNzl0unP1MZCew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_113337_573271_C72E9E0A 
X-CRM114-Status: GOOD (  28.79  )
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

On Fri, Nov 15, 2024 at 11:21:48PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Oct 29, 2024 at 12:36:35PM -0400, Frank Li wrote:
>
> Please reword the subject as:
>
> PCI: dwc: Use devicetree 'ranges' property to get rid of cpu_addr_fixup() callback
>
> > parent_bus_addr in struct of_range can indicate address information just
> > ahead of PCIe controller. Most system's bus fabric use 1:1 map between
> > input and output address. but some hardware like i.MX8QXP doesn't use 1:1
> > map. See below diagram:
> >
> >             ┌─────────┐                    ┌────────────┐
> >  ┌─────┐    │         │ IA: 0x8ff8_0000    │            │
> >  │ CPU ├───►│   ┌────►├─────────────────┐  │ PCI        │
> >  └─────┘    │   │     │ IA: 0x8ff0_0000 │  │            │
> >   CPU Addr  │   │  ┌─►├─────────────┐   │  │ Controller │
> > 0x7ff8_0000─┼───┘  │  │             │   │  │            │
> >             │      │  │             │   │  │            │   PCI Addr
> > 0x7ff0_0000─┼──────┘  │             │   └──► IOSpace   ─┼────────────►
> >             │         │             │      │            │    0
> > 0x7000_0000─┼────────►├─────────┐   │      │            │
> >             └─────────┘         │   └──────► CfgSpace  ─┼────────────►
> >              BUS Fabric         │          │            │    0
> >                                 │          │            │
> >                                 └──────────► MemSpace  ─┼────────────►
> >                         IA: 0x8000_0000    │            │  0x8000_0000
> >                                            └────────────┘
> >
> > bus@5f000000 {
> > 	compatible = "simple-bus";
> > 	#address-cells = <1>;
> > 	#size-cells = <1>;
> > 	ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> >
> > 	pcie@5f010000 {
> > 		compatible = "fsl,imx8q-pcie";
> > 		reg = <0x5f010000 0x10000>, <0x8ff00000 0x80000>;
> > 		reg-names = "dbi", "config";
> > 		#address-cells = <3>;
> > 		#size-cells = <2>;
> > 		device_type = "pci";
> > 		bus-range = <0x00 0xff>;
> > 		ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
> > 			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
> > 	...
> > 	};
> > };
> >
> > Term internal address (IA) here means the address just before PCIe
> > controller. After ATU use this IA instead CPU address, cpu_addr_fixup() can
> > be removed.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Add a resource_size_t parent_bus_addr local varible to fix 32bit build
> > error.
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410291546.kvgEWJv7-lkp@intel.com/
> >
> > Chagne from v5 to v6
> > -add comments for of_property_read_reg().
> >
> > Change from v4 to v5
> > - remove confused 0x5f00_0000 range in sample dts.
> > - reorder address at above diagram.
> >
> > Change from v3 to v4
> > - none
> >
> > Change from v2 to v3
> > - %s/cpu_untranslate_addr/parent_bus_addr/g
> > - update diagram.
> > - improve commit message.
> >
> > Change from v1 to v2
> > - update because patch1 change get untranslate address method.
> > - add using_dtbus_info in case break back compatibility for exited platform.
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-host.c | 55 ++++++++++++++++++++++-
> >  drivers/pci/controller/dwc/pcie-designware.h      |  8 ++++
> >  2 files changed, 62 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 3e41865c72904..ea01b7bda0a76 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -418,6 +418,34 @@ static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
> >  	}
> >  }
> >
> > +static int dw_pcie_get_untranslate_addr(struct dw_pcie *pci, resource_size_t pci_addr,
> > +					resource_size_t *i_addr)
>
> dw_pcie_get_parent_addr()? Since this function is anyway reading the parent
> address from DT.
>
> > +{
> > +	struct device *dev = pci->dev;
> > +	struct device_node *np = dev->of_node;
> > +	struct of_range_parser parser;
> > +	struct of_range range;
> > +	int ret;
> > +
> > +	if (!pci->using_dtbus_info) {
> > +		*i_addr = pci_addr;
> > +		return 0;
> > +	}
> > +
> > +	ret = of_range_parser_init(&parser, np);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for_each_of_pci_range(&parser, &range) {
> > +		if (pci_addr == range.bus_addr) {
> > +			*i_addr = range.parent_bus_addr;
> > +			break;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > @@ -427,6 +455,7 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >  	struct resource_entry *win;
> >  	struct pci_host_bridge *bridge;
> >  	struct resource *res;
> > +	int index;
> >  	int ret;
> >
> >  	raw_spin_lock_init(&pp->lock);
> > @@ -440,6 +469,20 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >  		pp->cfg0_size = resource_size(res);
> >  		pp->cfg0_base = res->start;
> >
> > +		if (pci->using_dtbus_info) {
> > +			index = of_property_match_string(np, "reg-names", "config");
> > +			if (index < 0)
> > +				return -EINVAL;
> > +			/*
> > +			 * Retrieve the parent bus address of PCI config space.
> > +			 * If the parent bus ranges in the device tree provide
> > +			 * the correct address conversion information, set
> > +			 * 'using_dtbus_info' to true, The 'cpu_addr_fixup()'
> > +			 * can be eliminated.
> > +			 */
>
> Nobody will switch to 'ranges' property if you mention it in comments. We
> usually add dev_warn_once() to print a warning for broken DT so that the users
> will try to fix it. You can use below diff (as a separate patch ofc):
>
> ```
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 6d6cbc8b5b2c..d1e5395386fe 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -844,6 +844,9 @@ void dw_pcie_iatu_detect(struct dw_pcie *pci)
>                  dw_pcie_cap_is(pci, IATU_UNROLL) ? "T" : "F",
>                  pci->num_ob_windows, pci->num_ib_windows,
>                  pci->region_align / SZ_1K, (pci->region_limit + 1) / SZ_1G);
> +
> +       if (pci->ops && pci->ops->cpu_addr_fixup)
> +               dev_warn_once(pci->dev, "Broken \"ranges\" property detected. Please fix DT!\n");

How about "Detect use old method "cpu_addr_fixup()", it should correct DT's
'ranges' and remove cpu_addr_fixup()?

>  }
>
>  static u32 dw_pcie_readl_dma(struct dw_pcie *pci, u32 reg)
> ```
>
> > +			of_property_read_reg(np, index, &pp->cfg0_base, NULL);
>
> Can you explain what is going on here?

Because dwc use reg-name 'config' to get config space,
of_property_read_reg() will get untranslate address 'parent' bus address.
<0x8ff00000 0x80000> at example address.

cfg0_base is used to set outbound ATU.

>
> > +		}
> > +
> >  		pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
> >  		if (IS_ERR(pp->va_cfg0_base))
> >  			return PTR_ERR(pp->va_cfg0_base);
> > @@ -462,6 +505,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >  		pp->io_base = pci_pio_to_address(win->res->start);
> >  	}
> >
> > +	if (dw_pcie_get_untranslate_addr(pci, pp->io_bus_addr, &pp->io_base))
> > +		return -ENODEV;
>
> Use actual return value here and below.
>
> > +
> >  	/* Set default bus ops */
> >  	bridge->ops = &dw_pcie_ops;
> >  	bridge->child_ops = &dw_child_pcie_ops;
> > @@ -722,6 +768,8 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> >
> >  	i = 0;
> >  	resource_list_for_each_entry(entry, &pp->bridge->windows) {
> > +		resource_size_t parent_bus_addr;
> > +
> >  		if (resource_type(entry->res) != IORESOURCE_MEM)
> >  			continue;
> >
> > @@ -730,9 +778,14 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
> >
> >  		atu.index = i;
> >  		atu.type = PCIE_ATU_TYPE_MEM;
> > -		atu.cpu_addr = entry->res->start;
> > +		parent_bus_addr = entry->res->start;
> >  		atu.pci_addr = entry->res->start - entry->offset;
> >
> > +		if (dw_pcie_get_untranslate_addr(pci, entry->res->start, &parent_bus_addr))
> > +			return -EINVAL;
> > +
> > +		atu.cpu_addr = parent_bus_addr;
> > +
> >  		/* Adjust iATU size if MSG TLP region was allocated before */
> >  		if (pp->msg_res && pp->msg_res->parent == entry->res)
> >  			atu.size = resource_size(entry->res) -
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index 347ab74ac35aa..f8067393ad35a 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -463,6 +463,14 @@ struct dw_pcie {
> >  	struct reset_control_bulk_data	core_rsts[DW_PCIE_NUM_CORE_RSTS];
> >  	struct gpio_desc		*pe_rst;
> >  	bool			suspended;
> > +	/*
> > +	 * Use device tree 'ranges' property of bus node instead using
> > +	 * cpu_addr_fixup(). Some old platform dts 'ranges' in bus node may not
> > +	 * reflect real hardware's behavior. In case break these platform back
> > +	 * compatibility, add below flags. Set it true if dts already correct
> > +	 * indicate bus fabric address convert.
>
> 	/*
> 	 * This flag indicates that the vendor driver uses devicetree 'ranges'
> 	 * property to allow iATU to use the Intermediate Address (IA) for
> 	 * outbound mapping. Using this flag also avoids the usage of
> 	 * 'cpu_addr_fixup' callback implementation in the driver.
> 	 */
>
> > +	 */
> > +	bool			using_dtbus_info;
>
> 'use_dt_ranges'?

It will be confused because pcie node alreadys use ranges, just parent bus
's ranges is wrong.

'use_dtbus_ranges' ?

Frank

>
> - Mani
>
> --
> மணிவண்ணன் சதாசிவம்

