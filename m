Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC6EE7BDB8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 13:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+M/EwLPxToWmi7YohfArjjHs91QL91YZ16OIdZuH5E=; b=HUo0VXwb2aW7q0O8XbIKbcBtoS
	Em2PE5HVo1zAgczoU2ncWK8Lsj4PFkDYSI8suwGH//ODHd4++JdW92l1Z+omgMIb46LKQtTzBngMd
	0pvkSxf7pFV9IoqP/0x6NmD3OgcyWfBZnPH27Q65MeZ41xLmokJDHAD2bLWfS5uN8f5kbT994kMvb
	6ZDl5WjfqkpqhbfHoHK0wE6E7UXNnNnyReiL2SEzr+DYWWZ+3TGySDasU+nH05IipVQo3QbM461hD
	rcO03bt+/2WCTjr1gqSX/+ZXDVtAAg/8wSmJuvNQD1PZW4pqbjBvJDRQsku/ihJ3M331lh0Y1x7iN
	CDtKXXXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrySc-00000006dML-36Jh;
	Mon, 16 Feb 2026 13:16:22 +0000
Received: from mail-westeuropeazon11010003.outbound.protection.outlook.com ([52.101.69.3] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrySa-00000006dLl-0qbR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 13:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyZDS+TnAgvyLytjzYAbV3xK8o8rwllBA1KyzKmDsEVM2IX21tGQ5cemYEwhOsUT4zQYQplVsNCwEbvDJFo69f30IBm9MO2vnKFN6Q3UXrSRWZ6pSK5PYnNEwnXae+ESDcJJBh0YOSXjQyjBedaYga3fTbHl1yo+OfOMGRPmj4s3fv9bte72eV4U6NUFaWG3OJYnLh/rk4MQJQtFUjWudZ6nzuqgb0qpv1hOh4Mah/sCzYj2DeTNr/9fUmNXAD4qQ+SiUG72Pn9UpnIjiEgyp18gV1Cfn4MTFBSpcYw6WXONLvszLVwWgtoFufObtlN8THizz8L8t6k2vyTz7EcQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+M/EwLPxToWmi7YohfArjjHs91QL91YZ16OIdZuH5E=;
 b=Q/tidz4X+DIUPrP0BRkthT0EotEI3AW6i5JrnKjGh017u5shmbGWq3q/IYKel0DczL/U88Hg1t+nx/BXbaskSfzJOfRFo0cP9AFTwMv/qJQ0e59KqaCuJrtQbV7La+UqTzAqUgd3vEdkAzuRK5oE5f6uhL4243onFwe8kSfyM3YKWp6JQGKXyI5y0BGOdJAQI9EWPPz8Ftp9kBvAD/MrOYqcTvpjL9rCMKmSs0kY0o/Rjz0mgtUn5jA3Qw+95+dGTy739zG1mIr4EOSDiT0N8h9shquE/1v36Cyq+R3xpsYh72r69wk34vE6nnNL9tRuRl2Peiz1nBbHv1+FF9ir5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+M/EwLPxToWmi7YohfArjjHs91QL91YZ16OIdZuH5E=;
 b=dO5VuSfWkRA0tydNAlan+R/yM39P5pyTI2ZbSNSBVeIIYmn86hE1S7gTIW1tIczlzAgFp74C9N3Grj1gB6aOb3k1MDxGL4st1KYuXHzU/9m6vsw67UxgeL64yEzX+5vMdUtbLGhg2qe1SwfMuFc5Iv1HHJu4M6ybA7Z9fWkgB3DbTGpXaSBQtgPt/YjgNzFm3VQCWzKuqVZK0IM97tp21r46zbGBkX9L8UOm8ITI+O7pSnh+D1+FYl1zqPlV3kG1ZiR9AZGinG5tnBHcKx8gR5NiVq33ZhsGJ3OK7OJEuommYJ5bbiJKDPI7jAe86p1eb44ydsAx40yGgXrgOsuKMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DU0PR04MB9441.eurprd04.prod.outlook.com
 (2603:10a6:10:359::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Mon, 16 Feb
 2026 13:16:12 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 13:16:12 +0000
Message-ID: <03037f1a-5d4d-461d-b80e-c5b48400468c@nxp.com>
Date: Mon, 16 Feb 2026 14:16:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC v1 05/11] dt-bindings: media: Add nxp neoisp support
To: Krzysztof Kozlowski <krzk@kernel.org>, julien.vuillaumier@nxp.com,
 alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
 frank.li@nxp.com, jacopo.mondi@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-6-antoine.bouyer@nxp.com>
 <f6d4c62f-cf7f-44ef-86f8-ca496e7c8a7b@kernel.org>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <f6d4c62f-cf7f-44ef-86f8-ca496e7c8a7b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To PA6PR04MB11910.eurprd04.prod.outlook.com (2603:10a6:102:516::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DU0PR04MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b8d624-35dc-4c75-7873-08de6d5d8e70
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODlMT3N5RWt4TVZyUFhidG9GS3ZHcDJqcXp4MklXamVkM3NXVXo4d2E0S3VH?=
 =?utf-8?B?azM0Qk1zSS9OWjFoVGVFNFQzQmw2VDVlU0FKR2ZOdnQxb3lHcDZlb0d1NkVo?=
 =?utf-8?B?a0dDN2o1L3dETHlRb0psODRQeUVBVHhCN2NUZ0xjbEcrT0xLYmZOLytFSkNi?=
 =?utf-8?B?YUE1SEgxenlvd3V1S3F2MVNOMmNOa052czN2SXJEaStYMmFsVkVKZ3lwbGlD?=
 =?utf-8?B?TWZJQWxwMDhNT3JNRGhqUUkvV20vMkpJdTA0WDN3MDJaWGQrYWk5SzQrdFNO?=
 =?utf-8?B?L1pGZThQM0FobEpzalRrTHNPaDE0SHlpL2xUeExlZld1ekhGanBqaDEyc1hF?=
 =?utf-8?B?RDJlSTFZOURnWGcxY1FMaDZMMWJOeFdoQnZqL2IzbHorWk53YmlaN1J4dVdl?=
 =?utf-8?B?d005Tlc3QnIvRE9Nc1dNQU1ZNzdZZEFNd2MyRWFTeS9FK0VaSkVCWDVBckJF?=
 =?utf-8?B?UmwzNk9LbERXdkQ1L3ZlZjZucVZpcXhrd2VFOHBEeVlzS08yZzY0NHBNdTBz?=
 =?utf-8?B?NmFUb2NKY0d4Lzh0bHh6R0tSWVdqK2NSaGl4NzFZYmFGNittUXdqNzFzRUxv?=
 =?utf-8?B?MUgyUVlBSFRuL2tlaDFWZTlHTmFPM3pzNWMzMzFKZkZYQkxDeEFPNGhsdHNq?=
 =?utf-8?B?bEo5V0tpT1Q4ZzljSkdCSTE0OFp2RDNXeDdid01wRWk0T3B0c0g3QysvTFZC?=
 =?utf-8?B?WlEyWno0WDF0QUo0VEdmcVY3NnF5WmFKMlhPc1VXekhqaVhTVjI0V2d6VTUr?=
 =?utf-8?B?ZFNTY09LZHUvWXB1UndaZzhUdUtFdEFUMzl0WDBrb2FUMGtlVDZURWJCd2Fz?=
 =?utf-8?B?VmIzWlkxYklpZlFzNTNhaWlIWkJhT1UvcE9VdWhKQVAzRGNQcHhYUDB6ZFZj?=
 =?utf-8?B?N2Z6RmdkWVBYOFpTblZ1Mys1NCtBMmlZbEpMdC9ZY2RDVFFVK3F0c1RrbE01?=
 =?utf-8?B?RWtJQnQrWlJDclBYZ1ZMenRVWDJZRVQzMm05aTBFVERrbTM5UkpMOWVuUCsw?=
 =?utf-8?B?Z1FsVnNOaTN1MGxWTGpsVXdMdHgxbGhYcHN0dW0xRzhhZHRqcmtFMmpMdS9B?=
 =?utf-8?B?WGdhS2Z3ZUhQSHBlRk8wbk1CeWNwTVhGSEJONjQ3MEFEb2Fodi9acFBxWHpX?=
 =?utf-8?B?dWhkUk9TRHlkQnM1dGNmMC9oNUFlLzlmU21YQ2NIYms2TjdZdEljYldXcloy?=
 =?utf-8?B?alUwNUszUWtNTVBNODVweXF2SmJNSGUweUxDb1pHbTVLRkR5MTNPUTZWUDJj?=
 =?utf-8?B?WFk2bVduZ1h1b0FFNFEyVjdVUDhVUCtBaCt6MkFjZWZDSC9xMSt1YUh5UVZM?=
 =?utf-8?B?Q3NoTEJNa1A5RWthRW83T29ZN3JGMitMVlZhQm5XYnhRSGtIM2hXOHNQNlBG?=
 =?utf-8?B?cmZmTkpsZzFzenN2RWNjUlE3ZG9LYnJaN1d6L3NWdnFlVWYrL1NpS1piU1A1?=
 =?utf-8?B?ZW0rOUtPUXpPVkpCV1V6VkxqZDVYR3BRa3F4STQyRHJ0MDNydG1GYmt4WHM0?=
 =?utf-8?B?NXIweW1TVzhzL292WDVaRm1hZU9XdjRXWk4rYmNFNUMzMUExYWs3WWt6Mm94?=
 =?utf-8?B?Y2h6SWlvZ2tWYlNlVVh5SDVWMUUzYmZmaDNpQ3owMVN1Z0JEdHl2WmtOY2Fu?=
 =?utf-8?B?aWtWV29KZW1Pd1pTSTY5eXdhWjZsbG9WQ25LZng3VHgxdFUrNG5mMDFjK0Jy?=
 =?utf-8?B?ZUc0K3pjSHpXUWszY2FMbUk5MlN6RlhyamF6UEd0UVkyQmwrQ3JaYU4rOFdR?=
 =?utf-8?B?aEpWZXdDam9RZ1E2YllpWjR1LzhYUGlibGF5cENrMEY1MEZ1TjJCbzFxNkh4?=
 =?utf-8?B?MVp4bnp5b0plUlZ5T2VOS0w2di9rK21iM3lmdDlRdTZjbEJNclZYZlNndzVo?=
 =?utf-8?B?c0V4aGQrM0RpTE50OFFRWGR1NkR0NENlUHN4TisycFBUSno1R0NlUUtqSllv?=
 =?utf-8?B?QU81NEJTdkdKaW5BeVBpUVIwZ1hpRVNFYk9EaGJTbzFpSFE5a3F1M2RpTUJD?=
 =?utf-8?B?eUxZdUZpaVVHZVpheTNpRGxUY0NCVDRHTi9iQVFkTlNFNFNNa3ptT29qOVRv?=
 =?utf-8?B?OWtLemZONkNIemxkRlpaeFNnNURMWi9mVWtNNGVJY242UXFxcTFqcDYxdS9n?=
 =?utf-8?B?TmtITWhGbTFoL093TG1zR1JXSDlhV3poNGNUUnk5TlRueGVycFN6VkRRUDIz?=
 =?utf-8?B?dVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZiM1N3WHUycFlqMW1mWWUzM2VncnRFcU5JWmRMbzJOVVg2WFhvaDRLYWJS?=
 =?utf-8?B?Y2lzNE5WMzNrYnM1UXhLRkRUTWx2c2g1UG03ejZ0bWx4S0Z2ZHJpUkJlWTJv?=
 =?utf-8?B?QXh2RnhPVzZzZk8yNmk4QTlXYlJvSTliYzByT01OY0RMeE1rMCtUT21zbVlr?=
 =?utf-8?B?MUdxdUkvbE5BdkFzZ3Jhby9SaTlFRXJGcDBRdU9ZWTJma3VyM0VHZ1FtOTR2?=
 =?utf-8?B?Y3lZM3c5NWp2ajMzMjdOY0VQT1B6d1lpdWpnNWJoZm83bWRGM1Z5c2trQnBJ?=
 =?utf-8?B?VUJ1bDZYbXFVYUYyVERFblVEUjMwVzBtWjdEaXp1UkxwUTIzenNVYk8vKzdN?=
 =?utf-8?B?aXM2bEZmSWlBQTc0Wk5SOHVXdi9VNXhwMGNWQjVzQ3JmL1cxL2dHWEU2cU9T?=
 =?utf-8?B?S1JoR2I5VEF2R0ZGWXZ0Z2FVV1BWMlRwVFNwalZ3ZlY4K0M3aGlkanV3S2pW?=
 =?utf-8?B?cVFsTjZrL1NVL0Q0QnZLeGw5Q041QTlNeStBWW1jR0htL2RuQjBRd2NnS3J3?=
 =?utf-8?B?dG5GUkQ5enk1TUg1eEZxZmNQa3B0eFMyc2o3ZVJKSlNxTzAyUm5LZkdFRU8v?=
 =?utf-8?B?eENVZE9LMXJWRlNaVmpOcnVUdU9RVzAxWU1mVVczRlBVMlI5R0gyUXNUdm0r?=
 =?utf-8?B?U1NOMTJOSHRoV3FDSy9vZythM2tiMkpTVEE0N21sU3BvY0U3UUlWeFZSUnlh?=
 =?utf-8?B?WUJyWTBpcHpQQ2FiMTVZcmtycWlSTkdSdWtlSW4xdERDcWlCZUhIejE5WVJO?=
 =?utf-8?B?TXdNblMzVHpRc3lBWmh2eHUxQ1AvdlpLZTgrVWRiNGxiRmFkeHUzRFJIYjY5?=
 =?utf-8?B?b2dDOWhWQUFldzlEMTFlSEluNnB5RGtLMGkyL1lNOHNWSURHTG9nVWJUL0lz?=
 =?utf-8?B?clhtV1lCUGdWdnNjOUVXVkg5YWZ5ZDMyTjN3RnRXVEFSNEVXT3NjSTVrTU1j?=
 =?utf-8?B?NWVzTDBmM24rOHJzVDl6Y0NZU3dwVzlESGNNMmRORUk1TDdxUWRLSFdHVW9N?=
 =?utf-8?B?TkZvNksyUmdyZGViMG5GZ0JTVSttdkJ2ZElWS1NoOGRFK0lZeEZUWkdidUx1?=
 =?utf-8?B?UGoxQzJuQXBCVHNOaUlPSTIyL1FHRGtwc1VWNXVWS0hhc01yMmVuRG5zYit6?=
 =?utf-8?B?eDJoU1pMTWVxaUVuRUU5bDc2cDhJVEN0KzJXK3ZsMVdjdXptbnJqWEF3bTdT?=
 =?utf-8?B?R3hNOE5zY3JEczEzZ0ZsTFdSQ0NsZHFndjZCcWNmTFRsNTFuaW1uTENwN0FV?=
 =?utf-8?B?c3dXTjVNOEducURHREtzU3VRbXJvdlVNd0g1eEdXSGZGWXc2dEc2cldrd0F3?=
 =?utf-8?B?ZEJ2djJ2N2I4L0t0WHJpUUxqd0U2UURSd1dQSm54YlM4Rlkzc2pVK284NUkx?=
 =?utf-8?B?bXppanpSdWt5TTBYdW1VQTdmbzIxejRnQmxNV2V1OVAyN2dTSHVDaEhLdWZp?=
 =?utf-8?B?NmYwQXBYOWxoNDZNYTI2dlV5cVhXUmZHSStSVkY3aEdRbnlaWmJQQ2V2YlFj?=
 =?utf-8?B?bWxSNmlzbjFPTCtjbUNMdWhDVk93UU41WGhKUTZwRkh3d0xGaExZcSsxemZU?=
 =?utf-8?B?c3ZnOGFMdHBmRHlURFkyWG1DNnQ0Smt5d2N2d0JhcEo1V3FCZ2EvbkdBY3FM?=
 =?utf-8?B?NlpzcndkREczbFJYcVFSOTdZVDcyNUNaQ2dXdjgzZ2hVTXprUElGTDZzRm9q?=
 =?utf-8?B?cisxODdtNkpnNXJBcnpCU012cjc3Wis1bnhYQXFIa0xSTFJVTnQwV01lNnIz?=
 =?utf-8?B?ZzBCaWF1RlhzSHJZSDZIZXdZcEE1VkRDOTNRendkWDJUZ3VNeVFHNjZUc0ts?=
 =?utf-8?B?cWlpOEE2d1padTN3c1pxRzlPL2xUQVR0RXlSV1hCelhJV3RUQkNNbmlHV2lz?=
 =?utf-8?B?VDZ3V3U1aStkMVpBaGdydXgrbUgyanRCZFI0d29tcndwRVNxdEtmWnVxMUxr?=
 =?utf-8?B?OE8vZnhRL2xWMXNYaHJoM2NKQmR6UVFPNGE1TTF3bXpWRHdCYlFTSUFvWVRO?=
 =?utf-8?B?ODRXdTBISmtFb1dQVHFSMDZ6a3hYTUxlSk9rV0U1WFRnUC9tYXhkdjc1QlJr?=
 =?utf-8?B?V3NZcGdzMEMyYy9JL2Nrd2VNU1hONy9mcUR2THZMWm1jT0M2S2swdjgzMk1Y?=
 =?utf-8?B?bWEzYTJaWmlzS2xraUJCQlRnMldON1k1VEJ3TWIrVjJuaGFVN2NlNHE5OWY4?=
 =?utf-8?B?OWF6Z3RzZ1FvSzYwTHFyMGt6SzdFQXBUNXV4aTdEWTBjZ3hnUW9TTWxuR3I3?=
 =?utf-8?B?eWNWOHJDWGc1NmpnTS80TEw2VVBFN1grajUrcTQ4cWpLT2J3djdoVGVLUjRI?=
 =?utf-8?B?cVVXQ1k2Y1FRY1Fac3l6WWc3RHIrNDRiN0lreWluQTJNTTlhbk8ydz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b8d624-35dc-4c75-7873-08de6d5d8e70
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 13:16:12.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbWz9t6++czOiJaPjD2DgBMhVL+K9K5ZdTo88DYG3t8wFiLKvFh6rjHNCAkgoHS5hD+lulfdiLGg0+nbeTOgbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_051620_278477_4B8E0ABB 
X-CRM114-Status: GOOD (  18.74  )
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

Hi Krzysztof

On 2/5/26 10:43 AM, Krzysztof Kozlowski wrote:
> On 23/01/2026 09:09, Antoine Bouyer wrote:
>> Add dt-bindings for NXP neoisp module.
> 
> What is a neoisp module?

This is Image Signal Processing IP from NXP.
Indeed my commit msg was not well documented sorry :( Will add more info 
in future patchset.

> 
> 
>>
>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
>> ---
>>   .../devicetree/bindings/media/nxp,neoisp.yaml | 65 +++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/nxp,neoisp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/nxp,neoisp.yaml b/Documentation/devicetree/bindings/media/nxp,neoisp.yaml
>> new file mode 100644
>> index 000000000000..4dc9fa5a03b7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/nxp,neoisp.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/nxp,neoisp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP NEOISP Image Signal Processing Pipeline
>> +
>> +maintainers:
>> +  - Antoine Bouyer <antoine.bouyer@nxp.com>
>> +
>> +description:
>> +  The NXP NEOISP performs a set of image processing tasks on the RAW camera
>> +  stream and provides RGB or YUV enhanced image.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nxp,neoisp
> 
> Please read writing bindings document.
> 
>> +      - nxp,imx95-a0-neoisp
>> +      - nxp,imx95-a1-neoisp
>> +      - nxp,imx95-b0-neoisp
> 
> Nothing explains me why one SoC has three neoisp. You have entire commit
> msg to explain weird things.

Actually, there are 2 ISP versions (v1, v2), and 3 i.MX95 versions a0, 
a1 and b0. ISP v1 is integrated into i.MX95 a0 and a1 versions, while 
ISP v2 is integrated into i.MX95 b0 only. v2 has some HW changes/fixes 
compared to v1 which are handled in the driver.

I kept exact SoC name in neo compatibles to avoid confusion.

However, since a0 and a1 are not targeted for production, but only b0, I 
will keep only one compatible: "nxp,imx95-neoisp". Will use same as file 
name.

> 
>> +
>> +  reg:
>> +    items:
>> +      - description: The configuration registers
>> +      - description: ISP local memories
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 1
> 
> maxItems. There is no such syntax like you wrote. Look at other code in
> case of doubts.

Ok, I looked into other bindings before submitting of course, but missed 
it sorry. Will take care of it in next patchset.

BR
Antoine

> 
> 
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camcm0
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
> Best regards,
> Krzysztof



