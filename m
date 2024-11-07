Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12C9D4337D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srPpJF8wHI9fclfesOrJGtRZDSjZFqlhqtlMS9iDpmw=; b=Wbqc8EQ77wPVUQvFSWQWAJjVm0
	o0Jlj+bjyCNvvXkMM3D0Y4U/qP/SOJz3fjx63yLIae6LsEQb5XF2ADiUSHI5eIpTQ537xzle1tLUO
	PsY6u/ABb6aCs7XFTY05Rvx57dKmMf6fVOVYsk21UdnBGtsCUGHj7KlOrYenD0CqSjF44LY4nMwTJ
	Q5x+pm3L5xG25lFTBGUIfpdn87igHdqHK3u2oqDkQmD4Ec4p62ZCJtJ/NKiKXpHvuJQpP38E18wUa
	XEhk1afm/g+3zjAwb0a426JKUf8IikpGvxsXDueFpe1vtD+UAMX2thsdIrB2bMqODCMFsyQFPPHOy
	UbIubMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95tS-00000007kC3-3spH;
	Thu, 07 Nov 2024 17:02:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95pK-00000007jYW-41Em
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 Nov 2024 16:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=srPpJF8wHI9fclfesOrJGtRZDSjZFqlhqtlMS9iDpmw=; b=OunuLypOYB0ZO7wg5WBKrdbaxo
	992NKpI9EyqrXejzYiLJ04uf05dnZzjPx/y3Tn4GJoeeNVU5v3pA/XobEKlklZZHLkbPgMGTTGt66
	AQQb4Zor7eTj8Lk6Q6LLu96DaCvBzHN4Q1KTp7Y0pzp76/2j8o4EMX8sbmTo+7Tjd8ifgtwpQ3rXf
	GZXNR4I3yRt+GWs06JkTInbjudisj7JvCGGCsZQH26B3EIIoVuph6goSbTD9STCRzU3jAP57kprS0
	75FTuOrL0J5gT3KPR+qdNr/d5vGwP7tzPbun0ckFYapu8swbvo06AuBWH26eht23azj9JpgldHBxd
	VoxMJmTA==;
Received: from mail-dbaeur03on20624.outbound.protection.outlook.com ([2a01:111:f403:260d::624] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95pG-0000000CAFj-32Uq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:57:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmox07iUbaafKVrJbISUUcQYs2UCzuvGuEcb7w6b+O5H82BOKkghlllveo1dJUTzsVoKpAdlfSZDTom9GQQ9N3p5LFFQ6WzUdMKZkpBYJ2djaQInP+shVun7OFEE2fl2l+hZMo52Bf6dyTmcF7d4S0pKWXspEjEmmkg/mc81NL2+1Ce6ZMmN67NXx0O2kIlb+Gm4NzdmDyftn9qiWqDSrD4aRJkTnxvAsfuncegVOUFQP7IoGcOjVSBTQ0rVTsIEtWkglpeEHQN74mZeQtYDzdU8DQk0w1gEqE8Yc3zzqgB7chl+sKWuMbE3LRDW+rp/Dfi17+My9PB/Yt3po0oOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srPpJF8wHI9fclfesOrJGtRZDSjZFqlhqtlMS9iDpmw=;
 b=btX2fRvkhil3RBZ80YB+6ho6sszh4n6fFkq16dS13n8Z8MvN52yP7U5Q4QBtD2jZJRVluPayeEM7PTMUWuhCLXMGoKu7W+wtsLbs2Ctz2Aq/m2od+twsXGukYWs1W1/ad1z0EDRocQKaVSQFkIdlGt+SVVNlpgjdDJ3gGv3RuAOBHTTitjeA9EsNpYRCrkJdEGmiH5tXl6i0q750R+QpaKuQLekK2GfaKFMZs5Xk9TvXVhMjZFDME7Uwi2eNXa7pMCh6QlSnQ3B9EsevHDT215frps/1145RHtGCScwv49KRm6U2inrVZWiEYtIZ8JeuriQUZPtEh6m4MlI84RImXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srPpJF8wHI9fclfesOrJGtRZDSjZFqlhqtlMS9iDpmw=;
 b=fk4MlpoVJbmWFmbKbKutCNtxuoVgCWPZ30TVERQ2fxjBO48ESITYpv8X0EaQE2WkfDnbtN/dJqrBGvXThtW75IxAFbkAc6HAPC/BRqcSFypQW4jjBnxy86YgiYyiQC6gleLg8Lhu/7Vq12LFEz6Pt6mbHBDkGJwmHQVaQ1nc1wKZzf+HDXvKnhVOAgTRONXGsL1xbEOD1I/iSlq+/BmgwXbLlO+UB2fP1mF6eaqLHYYq9Bc1trHryuIxY8D0WuwlLu1xOD/JpuDLmVDL2+SzXei7ajda6pSoJFUNA3uQftfdJveHbvCrMhGFrgUeJuiwe5PYgC75ogR5GbFkfOp3vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9456.eurprd04.prod.outlook.com (2603:10a6:20b:4d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 16:57:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 16:57:33 +0000
Date: Thu, 7 Nov 2024 11:57:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kw@linux.com>
Cc: Hongxing Zhu <hongxing.zhu@nxp.com>, Bjorn Helgaas <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
	"mani@kernel.org" <mani@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Message-ID: <ZyzxdnC4mm4GwoOx@lizhi-Precision-Tower-5810>
References: <AS8PR04MB8676998092241543AEABFAAB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241106222933.GA1543549@bhelgaas>
 <AS8PR04MB8676C98C4001DDC4851035B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241107072005.GA378841@rocinante>
 <AS8PR04MB8676F00E8F76B695772EB3B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB86765B904FEC1AA88F6F83468C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241107163058.GD1297107@rocinante>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107163058.GD1297107@rocinante>
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: b933605d-a324-4928-6e77-08dcff4d460f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T004bi9VNlZESUEyWi9BeWxsU250YzhpS2ZlN2pNMXlhNUN5VXFsMlVBQ1cv?=
 =?utf-8?B?ZWlwK0tORFpJZFJqWUhaSnJWRlRKeWQwNjZPY0hzdE52d0ZDdGpMY0RQZjNv?=
 =?utf-8?B?WHdlU1c1QjZMNElUbkplRUthaitFSERMZTVWYkpPZmNRUmsyZk9HRk1manlH?=
 =?utf-8?B?blE5UWxiUWo5NWNnTHBvc2ltdFNHSDJjU1kxc2dwOGZWOUUwd1NoTEF5eHQ2?=
 =?utf-8?B?cTA0aTZkbVB3cXZPRi9idzZQTktEcTRDRjQwWUxYbGV4aXV6SXEzcW9uTXRQ?=
 =?utf-8?B?N0YwNE1FQ3pFVVFKYlEzVVFrdGNEWHBUbk1sMWhuTmVndlRuYXJDc2ZEVkI0?=
 =?utf-8?B?dGVtYXdMMDdHd3FhVUNKc3hFTHowbXFpZlRqemFkR3B2dktFRE8xdC9ZR3BW?=
 =?utf-8?B?Sk5UL0FTZ3JDV2VWVzZBK3JVcytPTG5xME5lOStNSVpDamo0L2hnQm40bmdC?=
 =?utf-8?B?V3pLajRYYkRJdTVDbzY4U0M4RGx6YkI4aitoalB0Q2pSNkVKcEtCaG1wR3Bi?=
 =?utf-8?B?dzZ4SDZNK0ozSFRZZzlaYnRUSVNoaTVOSEc0TnVnZDhGeFpscTQwWE5mdmtD?=
 =?utf-8?B?d3hVTjQxd2xuOXJyNnFPaW1YcHJyYTFXb2NDUFJnRE1GZEtqMndxdUtZS2pE?=
 =?utf-8?B?U2xWYjlBMFkvNVBFV1Y4UnVNSmViNjluS2NJMXM0NisrSjJLcFRkVmRaZEYy?=
 =?utf-8?B?Tzl6ZEJtSk9Sa3MwV0Q3WGs1VDhSZUlRd0dUMGdiTkxCZ1ZhbWVTQzZnbHcx?=
 =?utf-8?B?dnRIdm9lRWY0cU1JV2FHemNyUDVwR0o1ZmVYdkFFb2JYNmVHNE45ekxkcGtu?=
 =?utf-8?B?TXhDbnRqNjNBalNjdENPRTlhRTFkZXhrYXdlbG1sOG5aM0NkZ2t0RGIvZTBL?=
 =?utf-8?B?aXZma3RQLzNDYUI4WWtkS3BFbDBmSUVZTkd5STBYNEVQbjhraklSeE1TajI5?=
 =?utf-8?B?anFObmRsZi9rQ1lFS2RvbFZuRlcyMVRoWVdYWmM1Uk4zd1RYdTRNcUtuV05P?=
 =?utf-8?B?bG9LWW5CbXgwdmZUMUptNHlnN0I5T1JqT1puK2Z2UWRvMGZLdkxNOEEvNTNZ?=
 =?utf-8?B?bXNhYVoxdXFvTDJ0dlhTVVhnNWhldzVJK2Q1S1BxT0EzRGhHMDFvYzBvVVRP?=
 =?utf-8?B?UlliWUZTR1BLNzhoU0RGM0d5aWhOL3BpeUkyUWtoVzZTTVhrbngwRElLdmV4?=
 =?utf-8?B?Z3BjRnlUajdQaGpPSDI3U2h1bXp0QXpZUE45M2dNZTIvUE0vRnNXb0JXblBj?=
 =?utf-8?B?aTE1Q3YwRmpwWUpjWitBWjRQZmZHcmpHK3Izc1VOVU1kQTd1bGoxV0pNUnVx?=
 =?utf-8?B?eERyR0syOEdsaVFzY3AzUnQzL2tJMXY2Nm4wcXJLRFhLQ1RRYncwYVFCcXEv?=
 =?utf-8?B?TFNvc3Y0UTlxMDVqaUpWNFZYdHVNYkpEOFh5VmJ4dC9PRkVleXd4MURlUVVr?=
 =?utf-8?B?OHRrTS9wU1NKN0p1TnZRQXdDKytiTzhoc3FXWWJBS2F1bVg5bkFpNnc3TTdo?=
 =?utf-8?B?dEdHTjEzT25Zc1h1dWlaK2RZeElUenIyVGlFUEJicVp6VGtmd0c5NkMva1Zp?=
 =?utf-8?B?TmRVSUE1NFdwc3NObGdoOGpOL0NDY2lpSjFaenJTS1hzQU1MWjY3MURrbjVi?=
 =?utf-8?B?Rm5zWnU3MHdJSGVsL216SGxLTGc1QUpjRy8vbk1hUVpMamJDVS83TUJORzZV?=
 =?utf-8?B?cHhTQUo1MWVwMHh2djlHdlViclpUME1TMU1nSG1mcmdXa3RrbDdvbjVYSHJG?=
 =?utf-8?B?Y0FxcHlDMHFTRzA5bXo4Qm4yRGd4dDJpeUgvZytvSkY0UEhpenNHb0xZRHBp?=
 =?utf-8?Q?/nNDp8z3zZnFWeJfQc67mkwRWqp56pKwgz0OE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWtzV3JOcGF1T2xwQzhUaGYxTnF5TFVQcThRS0VyVkZpSHRPNWVkanNvSXVj?=
 =?utf-8?B?VE45LzVIV0ppd2dHMHNjd2V4THhMU2tVbXFsdEpjYnFxdDh1ZjRCRnBPTWNV?=
 =?utf-8?B?RGVzeDJJSEFmLzBBZlk2N0phajBJYTRKaUlHb3duQmhnSUVJMjNjQWpuaUpx?=
 =?utf-8?B?ODJ4OStFOWVMUlVNVHczM0VaVHNNUjB5a05qSG1vM2x0ejFvUVR3TVo5N2h4?=
 =?utf-8?B?UUhubUY4OXlMNGJnOTY1WkNDZCtldnB6eHBpajlwYlcyKzQ5SUJ2V2dzR1Bx?=
 =?utf-8?B?U1M2eldhVUVpSnlTNEVNR2pBdGsvbWZ0QnVLMWhSUXFxSDc5cWRQcWorazda?=
 =?utf-8?B?d250YWJaNGFvcGk1dHBTc29hd2RSbEVRQkptaTZNa3Rncm9Wa2k4N1IrUHA1?=
 =?utf-8?B?cks1dndUSkJ3cDZTWjlubmpjRkdvYjFHWU1QNTlWK0FicTRkdTVJMktXMDk1?=
 =?utf-8?B?dkxOYjI5ZFpFTlVpSzNYOEpydS9GK2NKanhWTmJUWVUwam1pcDRkY3Y5V01D?=
 =?utf-8?B?NFhHL215RURyckVNbTNJT2t1NlFoNGhZUkkzT0J3UkNHMXdNNCtXYnl4Zyty?=
 =?utf-8?B?aC9LaDFEdmc5NlVNWjRtUE14SXN3MUZkQ3NEK1RGK2JHYThaRGRaL1Z4UGxP?=
 =?utf-8?B?TXovcU80T1dwN0hQa1RkYkxHS21uWXY4c2hmNVczcHdPTGcxVVl5NkEwQlEv?=
 =?utf-8?B?THNINzMvY0V2Y0lFRmRsZXE5bnR4OExNcysxK1g2dUxCbUMwZXRTcklmT05L?=
 =?utf-8?B?T1c2UytpRlNVU3phY1VLUUFEM1NyUWo5dHl0ckZzY05SWTlnbDlsL0o5cXFQ?=
 =?utf-8?B?R05Xd3VNSENNOVM3ZEtDK2NWZEwvTHJyZ1BIRENQV3k4eEZuVlI1MzdvTnBh?=
 =?utf-8?B?dEJZMjBabUxmcTdKMmdlcTQvT3pwZStWSllTdEh0R001d2FqblFpUmF0VHFR?=
 =?utf-8?B?VnJIMDl1TWtaMzM3QVV3cEdaTzNHNXNYMEZsMlFSd0o3dDlmYkJZM082bnM1?=
 =?utf-8?B?U3ZkUWVOUDN2U1dsMVhxZWN0QVN4SzhtZ1dZNDBzZ0E1WFZIejhVa1VmNzVq?=
 =?utf-8?B?bGpzSmg5MERud1M4Z3pDSzVUM0d6ZXQ4RC9leUFMWG1aSWcrSncrVXA3ZXlE?=
 =?utf-8?B?dU5lcDFST24wb2JtbnVrZzVsOEZCVGc4R2EzOFJ0bWFlVzAxS1VSaWlQUHFw?=
 =?utf-8?B?QWlCcksrdEI5MExzWlFCQlFGMGxyQVdhd3IwZHhjUzdkU3B4QTVrRkpaLzBl?=
 =?utf-8?B?ZVhJOVZmSnlmTHJscmdDTFVEQVdWNnlLWURHWWlCQXpYSS9SRERHNjNVbXJB?=
 =?utf-8?B?U1ZDR0VlSW5ENUVKOXBqOE1JWUdTVTFLWHNwR3BLVjRORHl4WjBjSHNPTTBP?=
 =?utf-8?B?cE4wV3cvQU05eUFIRlN5UHN1SkpWbGY2QldsVUtVU2svQ0NXRzFGcmdpbU9u?=
 =?utf-8?B?Nzd6WFkvdkxQRHBrdzdBcmJ0b3JySEwwbzhyTGNRUzNROHJYaEZIc04yTDJa?=
 =?utf-8?B?dllKSE9saC9oNU1yVU1adWQ1cWxMLzlvWXRYdEpiODhmcytNR2lUeXB2ZCtk?=
 =?utf-8?B?RHNlN3dybGZYM3VvR3N0YWNFbDFXdjNYVi9LOVZqMmZxRnpDam5lcUJyRGpR?=
 =?utf-8?B?eURveVhGTE55L25VUGp0bExJNlU3RTY5ajE0RGErTHkzRXZxY3pRTlNMTU5L?=
 =?utf-8?B?QzM1dXN0cjJWQzVaZHorWXJiTzgvd1VwOFpUdk5aRkl2aFBodkFjbVRBLzJt?=
 =?utf-8?B?ZHB1YmdBeEtQKy83ckZ6WnpzMVV1OTQvejg4UGZlL3l2blNCbDdSVHhvU1BL?=
 =?utf-8?B?UU1oWTBiL2xtMmlIQ0dQTUtEYmpVV1FnRkd2YU4waSs3a2RuVSt3Z0w5ZC9W?=
 =?utf-8?B?OCs4cFJoemF4Mnh4NTJMMHZoSGQ1cy9va0h3ZUxSd1drOVIzWGlNeHlabVcx?=
 =?utf-8?B?Ylp5dUxXajE5ZTNXbWpQUzcrYjM1QVQyRTE0Vzk2RCtaZWduQzZlSlhjbHJU?=
 =?utf-8?B?WFBGK2l5d1JWd0pHWU1kU0JSdk5YYThQWDQrQzR0QlY1TWx3RXVZUG1iNVNu?=
 =?utf-8?B?ZE9MenRudktlY0ovYTJjUkpYZy94SGxtSmgrQWlTUjQ2U2Q4UUtXbGR6bHFY?=
 =?utf-8?Q?+tMhCOh/Qu/I1YRvbVBVx8fu1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b933605d-a324-4928-6e77-08dcff4d460f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 16:57:33.3961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uzx+4viZ023nDpAI1vunsn7ojsu3vmuBO0GSjuXzgBmTwVUfxv5frQXHMfVI+tMnAGQ6fDUWiQbHRHpZsPlTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9456
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_165742_878481_8101FF9C 
X-CRM114-Status: GOOD (  22.12  )
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

On Fri, Nov 08, 2024 at 01:30:58AM +0900, Krzysztof Wilczy��ski wrote:
> Hello,
>
> [...]
> > > > If the changes aren't too involved, then I would rather fix it or drop
> > > > the not needed code now, before we sent the Pull Request.
> > > >
> > > > So, feel free to sent a small patch against the current branch, or
> > > > simply let me know how do you wish the current code to be changed, so
> > > > I can do it against the current branch.
> > > Thanks for your kindly reminder.
> > > This clean up small patch is on the way.
> > Here it is.
> > https://lkml.org/lkml/2024/11/7/409
>
> Thank you!
>
> That said, there here have been some concerns raised following a review of
> the new patch, see:
>
>   - https://lore.kernel.org/linux-pci/20241107084455.3623576-1-hongxing.zhu@nxp.com
>
> Hence, I wonder whether we should drop this patch and then focus on
> refinements to the new version, and perhaps, once its ready, then we
> will include it—this might have to be for the next release at this
> point, sadly.

I think we can continue discussion at refine patch. Add kept this patch
because it really fix some important problem. Refine patch is just make it
better.

Frank

>
> Thoughts?
>
> 	Krzysztof

