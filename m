Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75022E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 05:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbLAgjXjhD46oGKQLWhlHSclrDOmmgRZNY+dScF3B/M=; b=iEYzGqeApK4YZ3RYU5/CCl7g0b
	H3fLG8A7xrnaMrncrMfrrU833CzMh8Tffc4IiOp9m5iPRtTp4BZHryrAqmfcB4YZVPNWJHFPpcm9z
	FFOroUYWd9/8g9QCC1RJjKmB5uzxzc9a/XxFk0KbthU3bQYGATvcaSyOZIveDkEe3GUbRoEQEaf1U
	/xiC6OybO+yDThhQz2smoDiLcHM2cp8TaV2sDlsp9xbzXipjbpc95nbYe5qqjQHi+NTOBW6yRzCqx
	peRNmaHCQyPd3x5vHxOdY2+dRJLGpJTUsDKuM7ao0oGs4ieKXUvj1Ae7klEIQ5lVrFvwtQZGUkmxa
	pDLiW4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3yY-0000000ElsX-2mBD;
	Thu, 05 Dec 2024 05:00:30 +0000
Received: from mail-dbaeur03on20600.outbound.protection.outlook.com ([2a01:111:f403:260d::600] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3vH-0000000ElKn-19jm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 04:57:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkaKaYHF2kDCYhcgHnjH8TJVUPwC7oJqneXe/gwT28Yh8Lhp8qjno1KiNZKMnWtfSfEDjsI8+QEnca93lK+45OIiDhq/9hOyaY7Q928L/gDRMzxO7yel2DUfvuuzStQWHtR+pVjLmojUySGFfS29Ogow2FPJpqvBqgu5ngdJiF4H1IrCJFUuVKKWWV7S1KKtYbmjG2PYZCpmapC+8So8yjizUkaqGY/cvS4ow+UiuS1/L61Zl3JrST2fDz6v4lPKn93kNWEnOcZqwHdjlr1vtvb0Af5H50U7DTlPuWa5k50MYJUoUSimrCxwcCVCm7zD8yWheJMEkA7nLWy/twQ9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbLAgjXjhD46oGKQLWhlHSclrDOmmgRZNY+dScF3B/M=;
 b=NvPxYRtJTp7hBeAycLIUaUKcMQRlJhSR8whYKfJfRepDM7QqyCvpkb40yYYcHsGvt+hzyfZMyGELtyg6TJafiCDXteaooFX8grz+MzK6QU+3yLDwvkbmc28/Mo/ABkgrYE52Dk0geWSVXjWEheohlSnYPnuw8WW5Hufq61SYGQh1C33I3OsghHWR/nU/4sPDPfKlCinaDcxaCKB6dnoCdd8HhYnTOq7FcCznBa6u9HcGBJj85jEQ7B9GzyT3ojJv9Oaub6Hk4+V9SpPC6pni0PrhF74wBopOqVjlNKaf5qawDsAF4aZOx4LGNq7LuxG8BdYU5jiKzKKcLQIv2TKagQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbLAgjXjhD46oGKQLWhlHSclrDOmmgRZNY+dScF3B/M=;
 b=CeWik/dYqdYhDGS2E0j7gccAdpzGOa8hp+/Jjx9TgQkAq/ZkBhkVJ1p0Xn/UQOnsMq/N/kUJ5gKHmRPFscHDuOKerKpeDRBbkZkm/D8VIHmw89hJIasOMMWTBtboGPCx9wyV1ebVIu35W7lIHsDLorUzo7Xc61tSlgBeXsP3gt4UXnrNSx+cpzPPpHIuVfxtDDm8xrCZJlOq/xNEdFUb9T/C+/gZaRwIzSWiZKzEayYBPNR23M/RCWyBjHpcR67ltFHVcDYpExRLAKD6SMeWA63WfbjhkLiLB6opeUKrrPt9Kx4wFpulCedYzTkz0zUJpsismp5IHGpi53Hp22Bq2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19)
 by DB8PR04MB6794.eurprd04.prod.outlook.com (2603:10a6:10:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 04:56:55 +0000
Received: from AS1PR04MB9358.eurprd04.prod.outlook.com
 ([fe80::d74b:21b6:d315:cb84]) by AS1PR04MB9358.eurprd04.prod.outlook.com
 ([fe80::d74b:21b6:d315:cb84%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 04:56:55 +0000
From: Vabhav Sharma <vabhav.sharma@nxp.com>
Date: Thu, 05 Dec 2024 05:56:33 +0100
Subject: [PATCH v4 2/4] arm64: dts: imx8qxp: add node for nvmem property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-secvio-v4-2-5c37cdc39573@nxp.com>
References: <20241205-secvio-v4-0-5c37cdc39573@nxp.com>
In-Reply-To: <20241205-secvio-v4-0-5c37cdc39573@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, frank.li@nxp.com, 
 pankaj.gupta@nxp.com, daniel.baluta@nxp.com, silvano.dininno@nxp.com, 
 V.Sethi@nxp.com, meenakshi.aggarwal@nxp.com, 
 Vabhav Sharma <vabhav.sharma@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: AM9P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::27) To AS1PR04MB9358.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dc::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9358:EE_|DB8PR04MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 59238006-47ee-4bc5-6593-08dd14e93cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTRaa1VIeFhRZzJZWjMvM0hNV2t3bHY3RFp6Tm1BWHJtdFV6YUQ0S2lkNHlu?=
 =?utf-8?B?ZHJWYVZsY2tJQ3FZTU9aS1BRK0NaWTJsWVFpVFZLeVhSZEkyQW1VWG5wRXpJ?=
 =?utf-8?B?K1VMRHE3dFFzRGp6bHRwQ2FiRmZTWVYxZlBBKzcwWTVReVJPcDRhSDRuaTVW?=
 =?utf-8?B?enFuVXJPV2VpUTlSb0lPZXFoYVZnckNSOTFheEVaWEt2ZkdqZWQyWldTV09C?=
 =?utf-8?B?emFwY09FWkU3SCswVUg5cjgrSE5JM1Vydmd3TzBndzY5Q3p6Y0J2VzQwK3FU?=
 =?utf-8?B?d2crTjdtVEU5QVFBSlNOb3kyWGNMNHI4dzdoNjBOY1R4ZDN2TzRzeDV5dEYv?=
 =?utf-8?B?enY1NzBnbEZLUHBtUnpsZUZ6bGFSMlhTRm5ZS0pwOW5ibytNUURSQmVuOVJa?=
 =?utf-8?B?a3RSaTY4c2kvOGh2SzNlWVVqdjRVdnNYcXd2R3ZCblpRZ3NWdmJ4d2xKanUz?=
 =?utf-8?B?SDhLQzU2QUtub0s3RWJoNmZXdlZHRmxTL2srMXNwZkdoQ01DRFA5d2owNU14?=
 =?utf-8?B?ak5wOXFjUTJBZ0F2M1l5MDFjOElWTVJPK1hoSmxYRWRJRFNwR3dPc0NOLzkx?=
 =?utf-8?B?UzRhS0lQajBYcnJ2b3cyOCtHZE8vQmFQbEZ0WTMxS0FSd3VhUFpTdnoySVZR?=
 =?utf-8?B?RnUvVHZxalAvYW04d2pkSjVJeTVKOXNDdWI5MVJFMGQrQTh4R3pZMEdnNkxB?=
 =?utf-8?B?RW1POXY5NVVhTTVXMU1aUndkOUllRFZqbzFIN0pEMWtqMlNMdXpteGFwUUlK?=
 =?utf-8?B?eW9XVGk0OU1rZFZTUmY1UUpzUFcxOTZjWnRiWFBsSmZ1Yk1VTjBQMU5TUXBE?=
 =?utf-8?B?cURBUVZWMTAvMFRLbnhJYnd3UjBUeDIvKzkycWhMSXlsbGZnSDlDeUkyQlJa?=
 =?utf-8?B?bDFJYTBLTHNaakx6NUI4N1JUUlE2eUZKVERwakYvc3VJekF0a3JjbUp6anF5?=
 =?utf-8?B?OVBSWlRnMzhMVVhqMTg1WTFYTCttc3ZwYjhGanVmMEdQZEFPTytYa1NsTFpa?=
 =?utf-8?B?Y29aWGVQZzRMbm5ieEd6Z3E5MVRIMGpkQUtaU1ZjQkhHUHY1L1h2cHo2TjhV?=
 =?utf-8?B?SFFvYlZXay9GVS9XR0NjbDNBZVhlUU1sUVZEL2RvM0FvNHh2eVY4R1Q2R2hM?=
 =?utf-8?B?ZHFXVWc1amFZZWEvbGNtNUNXNHZIclMxc2NQTEsrZHpWTXRFT2ZxSWx5WnRN?=
 =?utf-8?B?YWZ1RjBMbFJPWmQvaGdXRVY3RzEzODEzWmNtWHNybEhKdEVPTUZqTTk5NERZ?=
 =?utf-8?B?Z2lmS1NWbGVTbE9GWlFhVmRyRWhGenBQelczK2h6WG5mR0ppS3hnZTdQZVBt?=
 =?utf-8?B?V3dYNjhOZVNJZklsZ3kwdmJ0Y2dNc3JsbWhkOE1yUmRjOFNPR09PdGxSNmQ1?=
 =?utf-8?B?aGdkUURCWUZzNi9LZERQZndNbVgwZXkrSmpISG1iOCswazFwUVVIaXM2cEJr?=
 =?utf-8?B?bkcvK1BlQmh6M0pxZ1BrUGtqWXltUXJTMVZ2QXZjQ3ZFWmdKd21hdDczb0Rk?=
 =?utf-8?B?WlVFM1pwQzBNZVY1NFRHak9RT01jdmNIQnZ4Y0p3NlVBU01qTWdVNDRHdmhT?=
 =?utf-8?B?QXBGUDNDNmlOUHhpRjNCWnZ4bFpIMEM1bFFUNExKY21IZnd2aVBSMVZ4QTFK?=
 =?utf-8?B?OEZLMmtIb252QTMwVnVDckR2ZmtTSjFVckRTSU8zbHplaG1uVnhXR0taKzJ1?=
 =?utf-8?B?bGovOVhmcjNpdDFHUDZoU1BJRUVOSU1UaituL2pYZ1JmcGVjcFZvZlNPZENK?=
 =?utf-8?B?eG9vbG9hZ2VoUi83RURGWVpiK0s4QUxRVlVoeUpjWHJJci92UzBzUityMjZ1?=
 =?utf-8?B?cFN3VVhSNnlGMWU5MDZ4U2NTMXVjRWZXVXRNZTl2eE1PV2JCVDJUaGpLakFw?=
 =?utf-8?B?bXdscFYxUzMvR0NDWEJCUm45RmZUbEVGeUJpTk4yZFFlQ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9358.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0NvZTkxRFJiVjFXeEtUeUdrVnY5clRMbmNZQklCeUVmRkswWTJqNW1PaW44?=
 =?utf-8?B?ckhOMkFPV1drQmpZejkxTWtUa0FsdmtNZW1Xd0FKS2R3cFl5RjZWd09sSnp6?=
 =?utf-8?B?SlRUMXJtZkZUQ3QveDVLK0VVaTNJR05aTi85NndDajVsWDhEcVJDaFZsL2NT?=
 =?utf-8?B?bXVnS011ZDZkNVp3a1RBOXJPS1FncUJhU0kyY2NJQTIrZ29vaExVUEZsWTY1?=
 =?utf-8?B?K2F6c3V0WGdsTXUxbTYzMEcrT3grcUw4THpVb2M5MzV5QloyL2RqcWh5bUI4?=
 =?utf-8?B?ZmZHU1RnL1NaR1lDMUZsdEthSEZwNXVMUllTaG5aR1JJdDlRRk1WV0g0TTAv?=
 =?utf-8?B?dDMxNm9XSG4yQ1JjYzM5clFhbzJqRllTZXVYczZ1cXJ5NHlnazNINVQ2dUk3?=
 =?utf-8?B?ZVFLNTg1Q0IzWDd1dDNrQUVmMlJiOFllZTBNd3MzTEcrdzE5K24rSHo4eWNQ?=
 =?utf-8?B?M2c1b2xlbWRRQ2xyUEtFSW9xY0liWnQ0dEdxY0JWMzg1ZHpZZjRkY0EyWjFN?=
 =?utf-8?B?L1NqZiswclg2SDZSd3hFeHdteFIzU3dqOTRDbU1rL3l5d3NNN01JZUJZRSt0?=
 =?utf-8?B?ZWFGRENZK1U1TnhCZEJKUjgyZVE2ckZJeFpzYjkxY2NuQ1krT0RaZnBxdFVO?=
 =?utf-8?B?N294c0RGVmhuRkprYmtiWTVMaGlBYVZJV1d1emxwOFEzckE2Z1Q5VXQwVWNO?=
 =?utf-8?B?bkZVSE5ncmxrYzl0L1dwQ21lTVN4cmZRNmpmb1V3ZitKeldjdWQ3OS9FLzZ3?=
 =?utf-8?B?WjZ0YmJCVjdaUEtCeW9KbE92VmZqNmV6ZnB3RHdpNWdDQXljUXZSNzZob0lC?=
 =?utf-8?B?ZkFEWlQ5Z3p4bmxhOW9nNC9Pdk5WUHpIVW9QbVlaUEVWak5IdUpaYWQ4NTVk?=
 =?utf-8?B?RityMG5GTWFIUjFiVUdRK2NhdU5tZlI4b2E2WGhIMVI1cW81REFNdkRvMTZn?=
 =?utf-8?B?cHA1aGR1VFFaZURWQ2pyTGRLcjkyY1p3TFpyS3pjck5FNjVzdlFta01sb0xa?=
 =?utf-8?B?K1V1TTZwL3dmSTB3eUJCQ004QkhEV1MvOStYOWtKa1Z5amM5UnBRSXNaVnkx?=
 =?utf-8?B?dk9ZTW9Nckd3ZStYMDRRdUJkWGU0clUxVU1CaS9SYmZEbjRQTldtd2N2Y09l?=
 =?utf-8?B?MitBV0ZZaGNvZmlqdVY4Q05KOVBkOGMvUjVXVDlNL1ZBUU1QcFd0RUlyQzVP?=
 =?utf-8?B?WVRPNGRPekVxaGdPUnJlYzY0L0RCS0pSODlHNTJWOHZ4RkMvK0E4L2ZKMC9G?=
 =?utf-8?B?dmh6TmczQ3pSS1NhUHVWdU5sL0tYVmYzN2ZRU013dDFFUFlqelFXYVZCNGN3?=
 =?utf-8?B?TWtGay9nWFpLTTFJRHBwVmlvR2xKOUpIUmFLNE5QZDVoNnlORHl0S2NPMmFh?=
 =?utf-8?B?WGFKMEt2SnJuM1J2MHlrSFlFQWdqTHhucVFXSmoxZXBoaVlvZGdaeHFOZkRL?=
 =?utf-8?B?TllScWFWRmhacXdVMUVWdmFWOWtCYS93Z2V6OU5FZ3JBSTU3TU14SUE4REpM?=
 =?utf-8?B?RFVDb0xJUTA5aWpEdWFWTFlTQm03VmV3QThNUWd1ZW5ySEJ1UGY4ekorYlRY?=
 =?utf-8?B?OGlHa1RJSlBJay9IN0NIS3U1QUNQTWxxOHhsSUNtdWZFcmQwUFg0a2pwS0Fo?=
 =?utf-8?B?ZytJaXhJWkNJSWpTNUx0RVJBRFQwSGttQVRyRXA5V1RLNEFVNWllcTdDRUc0?=
 =?utf-8?B?U3JJaWtSVlVJRzRYUlZxK2paaEx3Uk5lMU95N0Vac1hDSkk5U3RCcjhaRm9K?=
 =?utf-8?B?RW95cGxrUTlZbjZhb084VktHbk9ybitNODF4dXZua29uUjlPWno0MFdJTlRQ?=
 =?utf-8?B?bXpYbEUzVU9Fd1BuVEdvTWJnQ0pEOW5RWUI5U1V5QU84ZTJjcEZ0MGxTUU5Y?=
 =?utf-8?B?dHF6Nm92U29kdGhTR09XZng2RStFMjZXdkw3NFI5dWdRQjk2QzlPWFp0cUtu?=
 =?utf-8?B?WTdhUFE3UFJCS2Y5NnBTU0g0YW5IQ3pMTE9nL0tjU2xZM0FWbTMvU3NFeVZi?=
 =?utf-8?B?RytJK09QbEFobStJb3NCUC9BVktFRVJnUzdIaUI4dzlOcE9SVXdpbnZlNGZP?=
 =?utf-8?B?TC90MHNzSXJweEg3d2lhYXoweGl0MFcyWEFSKzU5a1A0bnRTL1h0ZDZPcXJ1?=
 =?utf-8?Q?y24ckkbjbwelK3Iuq8LTivrUY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59238006-47ee-4bc5-6593-08dd14e93cea
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9358.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 04:56:53.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ws+DVrKmnBLECMgIpjEcnXj1hCpGpBVKa7Bt5i92Pp5DhKFPCk/2hwr7dvXuJjLKE1Hy8wQ5deJJbLeCXvoTTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_205707_318854_9CAEC204 
X-CRM114-Status: UNSURE (   9.73  )
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

Add nvmem property to be used by secvio driver.

Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 0313f295de2e..2b1dd0addb50 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -210,6 +210,7 @@ system-controller {
 		mboxes = <&lsio_mu1 0 0
 			  &lsio_mu1 1 0
 			  &lsio_mu1 3 3>;
+		nvmem = <&ocotp>;
 
 		pd: power-controller {
 			compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-pd";

-- 
2.25.1


