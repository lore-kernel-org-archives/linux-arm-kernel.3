Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12DFE7544E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qgdvzzx9dC9pNAyoaR2xtsFwhuW0FSoD7l8IHn5rP0=; b=JF7vjdVZZdW5HCeJnGHmwWZmXy
	PdYPYluBEh81hlGIgNE4A8gfvJvtl5ew+Vx1KMNMMX4FQ5wUjgVohlB8xvWdFpNYkzo/kFn2EaZkH
	c8BVXHsUcGJiqWaE0VpxP30gZTh4DGZO3yq0BDB3mMX5wetrHBtAzlhLSX9jhNjoFoJj9D/s+iJE+
	T5PpyUVX2JlT7bhoxPYvWeiBwpMONLStqyA64+KI7mb2IZ+N8IwPCNIvpqdZ2jgN2Jb+xNj8AwFKd
	2Gtwn3w7NftfsQW2uZYBN5I3Sq1NZuSNkNiUJiNxjmajRBf1oLayMsrJ9juNY+1sm/atNkhMcjjxv
	glcN3Cag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMoh-0000000GjD7-0Gw2;
	Wed, 24 Dec 2025 11:14:07 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMod-0000000GjCA-3KYb;
	Wed, 24 Dec 2025 11:14:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKMARgokgW87ynW+I8VMo2waBxmSM1Zc7cvMJ6L8YPS/lGi4O4jJvh4xzuv90HLlxTbZ46O8EOGzaqlIm63wGC6buTaywrEgl7cGDjTnGLgemcGOLeCx4ef1KRhs1ZdAyw426stsnAZ5ODO9qI5w8f1/vIyrkyl5w1fyEG9+hqnY2bDPxOzsE85+7Vo1Z3FUyU9cz0F9FU7wv6xlWsQmXOTRvFUJldJMtsOLd5VlgBXuZZuKmxUpsJanc4lu/pPLx51Qn/doI3gNX6XRl8CMf+l1LP7MbwAUakVkwMdIEEUaWS+uyp9y7x5F9mzqbLsUhmiqnZt1mQgoI5PVC+k3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qgdvzzx9dC9pNAyoaR2xtsFwhuW0FSoD7l8IHn5rP0=;
 b=Zu5AFFtajzrdMc5s4M6ySDBadCmGwqrgJwywLFJNGIVLvaCmqSMy7jaQOV26vzxIWXCG/NQyppr0g8tac/FTSfhPq5I0WMM/y+BCilwBp/QJEK2KNj1cDWuuAsmLkrPCnc3mzrECBX3jQwHvs8bolsUuPS6RINMHgci3SPI4ozYZSr+0611lxXmn3hVvXDdWn5vQ+4LrFCvS0q6t+4W5mh280Nk+nPvuEldlV1oAoK8z5cTEdMIIIFUYncBVC8/hrmFnoTxGL8sWhFCVT2xbR09EBZit65cEnK75RMdJ5EllMiBrqUbNX5nBYlYWVHtLkDuV6wn0lhaEXuQDQpnPrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qgdvzzx9dC9pNAyoaR2xtsFwhuW0FSoD7l8IHn5rP0=;
 b=eZmQTjb9NnGzXvj42vks8UKtgg1t2tkZM0q+KfIlA4WiRgRKbFBcZb1/hWEmaTKgs6V0uI/qI/PoYbJCebvUUBRLLdeqLyLNpAWF+3CEFRZT8Wq/yVGj8Uez0k2ZBwH7MeMo27+2Gr/BiMPnpDqgeJyGjdGVL5QR9mCCsSxEPIzM+Xc9FBONQfUt420zajab8aWL7xbYB8WNsG7hC+jHCXC93W4YttwdDqzZyszYHxjJbuyGmm1KhaZYdjUsOmlKsP2ZGji79nuNKwS8eqn3tnxHAsMch54OgvLfSQOF0DbdGv2A41vqE4Y6vwekGqYOp34J+3G6c5XvwLnARa3swg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10753.eurprd04.prod.outlook.com (2603:10a6:150:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 11:13:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 11:13:56 +0000
Date: Wed, 24 Dec 2025 19:06:50 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, 
	festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <kvxt4hm3y5hsjiir2nnycr5kqgflswt2lra4b2akh5zju6ahqw@4w2xmkjgho22>
References: <20251219075447.3672833-1-xu.yang_2@nxp.com>
 <aUqk3z8CSVldoO5V@vaman>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUqk3z8CSVldoO5V@vaman>
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10753:EE_
X-MS-Office365-Filtering-Correlation-Id: f7dad2b1-9990-4c2c-810b-08de42dd8788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEw2KzRIdStFSm0wb1M5VmJEa210SjBFMXBnT3RxSjdXWTA5T1E2c1ZvSmZ6?=
 =?utf-8?B?b0lCQjFrUm5Na2dZRGhJZFBDU2t0bS81V2Rqc3lzM3U5WjF0cGNVeVRubDNs?=
 =?utf-8?B?TFE4TlpNaklTaFEzTk0zMFdlZjJ2RzNaMHMxYk81YXRodW1pMjBQRmU1R0Na?=
 =?utf-8?B?YkZUSlBOSEo3WUgrNzZDWFY1dHZYYnZKbzZNT2FPcVZEZ1BVc1RuWmoyRHRp?=
 =?utf-8?B?Tmc1eTVGTjYxZEJ5VGU0RXlCVmJEOFpPOE9kWk5aVVozSU54MjM3aWRWdkd4?=
 =?utf-8?B?TnB5eGcvU2xzMHlYVklkS2FGQmdLMDZDbFNkS1pMRzZ1NkF3NGdDM3F0cEo1?=
 =?utf-8?B?dlNxR2Ixa2hyRlh5bExpa2tXNmVUWVFsdURQbUcrQnZWM0J3dEZhVjQ1RjBQ?=
 =?utf-8?B?Wk5ITkZTdVlWRW5HdXFFSzlabnpreUd3VUMwTERaeGlaWlJkTFhneXVhRlNK?=
 =?utf-8?B?N3dPOWhSeEJ1U2V3Tnk1NWVzZmxZc1VKZzAwc0g4VHBFU0VGUmp5NUoyVkJB?=
 =?utf-8?B?NW5zWHpuNTNCckpmVkl1eWFpaTc2cW1YdTUwUWNvS2tpWDlwbFBYdDcyYW5S?=
 =?utf-8?B?aVRRTlF2dmpFdVI4U2F0NVlydUcwK2F1RU5UQ0tuY2VBS2tXZXpVWjVUZ0Yr?=
 =?utf-8?B?bU1sQjBmQTkvdnQ3OW4wQUk1MmtvZDFVZUZaRWZrNzgycjRFRHpaNGFaNDNh?=
 =?utf-8?B?d2k3NzQ2WGl2Q2VRbkFvR1JESE03Vy9oV1BtUW5DUlMwSURZMitjRUtGMURm?=
 =?utf-8?B?RmsyVHh1SmZLMEZzSW5wUXB3M3BFY3BHTEdMOEhpZTRQcGlmNHNsN0NnMzNS?=
 =?utf-8?B?YjJ5K2tGWjRXL2hpZHZxc2RVbVB6bGJoMXNtYnZGQ1lDblViaGxsQmFyNUg4?=
 =?utf-8?B?L0tCZjh4UDYwa2tJdFVmeFkvV2lmcDNXQ2JMZkU2aS9EMlAxMjQ3TnorSDJt?=
 =?utf-8?B?OStxYU1yaitCaHVPeUpJTFBLSHRab3JOS25BV25MSnhIYTRpWDY4czZGYWt0?=
 =?utf-8?B?OUorcXlVcjkrbnNGcG1oYlQ5ZXRnYnlMajQvRWhRWUVaZWlSYWp3UWt5UC9H?=
 =?utf-8?B?RE12cWZGdHVPZFFaelFRK296eWxvNDc2T2xSOEthTkhrcXJURmg5TklqandW?=
 =?utf-8?B?c0hRbWEzZkZSZmtwNVRSV0NmaDI1OCs2WXc5Q3lPZHUxZExsM2lsNlQ4Y2sy?=
 =?utf-8?B?ckZNQkNjR0xaK01ONzFHQTlnU3E1dlhBUXJGaEx4RmtqNThqMzRFcmRKaDVN?=
 =?utf-8?B?Y254MXI1cFlwNDVzbkNhSGMvdE96dHdHb1QzeVBXRVVwbStocDlicU9zZjBx?=
 =?utf-8?B?TlBPcEltUEE0WUM1NXFScFpiU3NManNEZGhsT2ZFQzR2QlpVZVVzS1YxeEtH?=
 =?utf-8?B?dUs1Q1djVTdPcXpxR20waXB1aDRGWk56aTRCQ3BEZ2ZNRExqa2lBa2JJb0VW?=
 =?utf-8?B?ek5SVXFVeGxoeHlRYmV2NElxWHlsU1JTdGN0UDMvUmhMT28vSFpKZmhOVUdv?=
 =?utf-8?B?aTd4OGN2U213eXI1TUpNTzg1MGttSmJWV3NIVkdLSXNzYVNkQ2ZBWStMV0lr?=
 =?utf-8?B?OEczVXdnQlhpTWEwc1czVXdTUTVtdU9SeDZqK2orYVUrTlNQRVRtOVNyUWpn?=
 =?utf-8?B?NGJyYkpkbTkvWE9ubWhqUVV6M3JGN01ZOVZyaEpVdUpveGdxQU5rcFpxTkRn?=
 =?utf-8?B?cTR6N3NNblBBQm1nNzdSN1ZUN0p3aTBHSkwveUNXUXlQREZwT0w4NWR6NnpY?=
 =?utf-8?B?RUhRV1I4UHd3MG9ETnM2clNZR2ljdURWRXNBM2hPV1hsdXh3UVVjVVU2aU9N?=
 =?utf-8?B?TndLN3FLVXlPeFU4clIrSzNZMXNKK3BSa1BKam50MHh4cXlvWlBnVWhHOWc5?=
 =?utf-8?B?dmRSZk8yYVdUc0FVdktab2lPeTlLaVlCaEhzK2xra2VGbkJ0VWhnaE9QcmJq?=
 =?utf-8?B?RjNNc2thOVdtN2J2USsyWVo2Tlg4U3FHZ0FiUXRDeGVlS1hjOFZsWnZJRFI0?=
 =?utf-8?B?MFhkMHc4eEJXVHNQbjNQWGJ3czhoQjNxRlU4WTFJOGh0QjdiTHdONUUzWHFh?=
 =?utf-8?Q?S0VsYY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDZyWlhOaWhtS25VY2lacUpwZWk4RDRkRWp2R3FqNkh5WUZVcDRxbjdIcDNC?=
 =?utf-8?B?K3ZDT3kreXY4cGNEa0pwV3BJb1BhY2F2eTN3UldUTzd5c0pUYVZlbVZpK29u?=
 =?utf-8?B?VkhncENBTmpRU1Mwc1UzVXN6ZjVCallKRGJNazJDVms0eUN5UlA1emg4TVo3?=
 =?utf-8?B?bXJaczRyWW1rc3phWGN6TU8xaGF4R1ZBR0Framh6aFNmY2VVK0tTZWp4OENk?=
 =?utf-8?B?M280STZ1U21KTTJVdTN0bno1c1l2eDNmbU1sdkYzWGFDR0RFNG4wWWZYQm5y?=
 =?utf-8?B?cktuV3N4THNUQ05JL244TythWTYxVXB3UkRIdnZoTitMd3Voc2RqdTd2Rjlj?=
 =?utf-8?B?TUZpcjhuWjk1c3lOenZjZ2p0V21qcnVrT3g2eDRqMVlmVmxyTkZUbVhjRWU4?=
 =?utf-8?B?cEtEd0NpVHlpSW13eVN3c3VVZjU0Uk1zdzJuWEI3dXM0NTlteUFTY2FzdERD?=
 =?utf-8?B?STEwa2Jvc2hTWE5RWjBrTUFnWm9KM29lM25VaEUyN25ab0lickNMRVIvYlVW?=
 =?utf-8?B?R1czaktFSSt1K3RpY2ZSc2psc0JYQllQbzFpbjh2cU9aRVMrdVg0ZmhoY3Bu?=
 =?utf-8?B?SjUrWXJrck93bFJ5N0FWUVJqbTVpL0pJOEp1clRjSk1rNWtOUXZLVXd4RVJq?=
 =?utf-8?B?Y3E2Y2ZkWnZCVHl0UTcyOXU1dklNUS9NM0UvZllWN09NWTBLVVRhYjhudkgy?=
 =?utf-8?B?enJsTGxZYnNaRkpLejlXUHVSMHVlcTl2ZEMweG5NYlptMG5QdmZ1cDU2eTla?=
 =?utf-8?B?ZkVtQlROckI3S1g3NWxwVGw2U0lqS3B6RVFBUWpWd1NtZ1RxUm9kT3V5aUUx?=
 =?utf-8?B?Qm9aR2JCak9wVXZXc3pEV0ZKVmVaTXA5QjRWUFdyR1dzQXozWHhGeGtEQS9V?=
 =?utf-8?B?a3VNZDY1Tk9lWjF1R1FMVEUwY2xvcWdjQmF5Y1h2Si9kUWptajZFVkxBa0VF?=
 =?utf-8?B?VU05ZHpPMTA3T2Y3Qld0MTJpdk94bHNQTzJaM2dqeHc2TFFlMlROMnVyZ1dm?=
 =?utf-8?B?VmdKUVJkZHpLaC91R1RJeU9sOVkzcTJiWHNLVUlNeUl0Tm9XWnVpYkRtWFhU?=
 =?utf-8?B?dkZOeW1pSVp1YTJYTFZXYUFFZ2NnRTdvU0ZsZXRaZGZEYVp3QkFZTmgyYkpr?=
 =?utf-8?B?b1ZqYlBGQWQxcG8xVW8vWktMai8ybDRnODJ0eFVKditFMEVCNkRWd1lvZHNS?=
 =?utf-8?B?ZTVtWDJnQTV2TDd2Q2VyeThtK0FiSzlzbTc0Z0YrdWhLNzI2dzlzTVdXbUN6?=
 =?utf-8?B?eVN5V3V1eEYzSzByYXRtS2hYUmJsKy81NjZud1pYU1lKaVZTcVVOTVJSM1Zx?=
 =?utf-8?B?YWdEdVpIMm1rMFgwOWhaY1hEd3BFR3hpY01VblpraDg4dE9acm56aHNxZzZE?=
 =?utf-8?B?NkpWR25zRGRWOFpoNWxXTjJCc05LcUhkazJLdlFmcnBnYW40NWdmVzV5ZWhi?=
 =?utf-8?B?bDBxWGpVLzZvazMyOEJ5RjZrcFM4MHRSd1g3bWhaVU83YWE4M2dWYjVseEY3?=
 =?utf-8?B?WTRpMUJodWFmcjVrbWk2cUtRSDNGcTVZOXo5cXZDc2ErQkFlbWJJUEZVVkE4?=
 =?utf-8?B?SGZDUWk0NktJeXN6ZjVQMzNFR1hmOVAwY3NPOG9vTXc5eklRNnlKeXl1YzdW?=
 =?utf-8?B?aXJwdjlxQXh6TEIxL1k4ZmYrZmlTSVRpRkdiME5PQi9DSUVwQkZaQmdBZFNJ?=
 =?utf-8?B?UU1NL1hDUTkrZG1SQ2FkYlMwYmV3ekFtQXFTNDdKT3VtdkxuWE9DTjZZRHRD?=
 =?utf-8?B?a2RWYmhrU2I2RmlTYUl2bW8xK1dMeCtycEduVXYrSUQ1RjZ0NS9lU1V2cmpw?=
 =?utf-8?B?Y2VtY3djQThITE94eTN2ZUdFMEttQS9kOENoL3BCSWV2NWNiaHZmbzB5b3Nm?=
 =?utf-8?B?YWptNlk0UEJBWWREcUpmZElHcWI3aERLM01vRTRnU003WTR1NU0xUHJjNVlE?=
 =?utf-8?B?ancwTkhKYzdza2tBQnhXb0pibVBtdzh2WkpvNFlvZ0I2MCsvNGVTTHRHM3Fj?=
 =?utf-8?B?cStJV2ptTzA0ZVBjVTNLL2QyMEovd0ozVVV2dGtZVllvNytTUXZyQm9GVnBF?=
 =?utf-8?B?QUIvL0wwcUhYUWI2Mm5LYTBzUnltdnFIcDRIOGFuWVVMSU5acld1SmJPNDZZ?=
 =?utf-8?B?b3JmK28ybUgvdDNlZi9yRXdXWWlHbC9iQndrZjhHQ3VmcmwwbVJka1p6akdQ?=
 =?utf-8?B?bkIxc3kvYVhuOWVDZ0ZGNUxDWm9HSWZoMFQxTWNYTjMzUnEyVFJ4ZXJ3SnZz?=
 =?utf-8?B?NGorTVBHaWtQUDFZb2xZZ1BNanB0R01LMzVsa3B0NzFWcnZROFR5Z3F0WUFi?=
 =?utf-8?B?MGdTdjNqT2xOdGp4MXVBamJBUStUYWt1ZWlwcXpYZ1Y1bklTeDhVUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dad2b1-9990-4c2c-810b-08de42dd8788
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 11:13:56.8346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3h8yziVDFweI+pNkVcPMq4n0G8nWAvAA2YNJLFuwv0B+L1/PzjK0Euitr46EC5r9uOWawA0O8m6jXRcniN1fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_031404_030984_AA45E303 
X-CRM114-Status: GOOD (  33.65  )
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

On Tue, Dec 23, 2025 at 07:49:11PM +0530, Vinod Koul wrote:
> On 19-12-25, 15:54, Xu Yang wrote:
> > The CR port is a simple 16-bit data/address parallel port that is
> > provided for on-chip access to the control registers inside the
> > USB 3.0 femtoPHY. While access to these registers is not required
> > for normal PHY operation, this interface enables you to access
> > some of the PHY’s diagnostic features during normal operation or
> > to override some basic PHY control signals.
> > 
> > 3 debugfs files are created to read and write control registers,
> > all use hexadecimal format:
> > ctrl_reg_base: the register offset to write, or the start offset
> >                to read.
> > ctrl_reg_count: how many continuous registers to be read.
> > ctrl_reg_value: read to show the continuous registers value from
> >                 the offset in ctrl_reg_base, to ctrl_reg_base
> >                 + ctrl_reg_count - 1, one line for one register.
> >                 when write, override the register at ctrl_reg_base,
> >                 one time can only change one 16bits register.
> > 
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 221 ++++++++++++++++++++-
> >  1 file changed, 220 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index ad8a55012e42..cb2392008ad2 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -1,8 +1,9 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> > -/* Copyright (c) 2017 NXP. */
> > +/* Copyright (c) 2017-2025 NXP. */
> >  
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > @@ -52,6 +53,21 @@
> >  
> >  #define PHY_TUNE_DEFAULT		0xffffffff
> >  
> > +/* PHY control register access */
> > +#define PHY_CTRL_REG_COUNT_MAX		0x42
> > +#define PHY_CTRL_REG_OFFSET_MAX		0x201f
> > +
> > +#define PHY_CRCTL			0x30
> > +#define PHY_CRCTL_DATA_IN_MASK		GENMASK(15, 0)
> > +#define PHY_CRCTL_CAP_ADDR		BIT(16)
> > +#define PHY_CRCTL_CAP_DATA		BIT(17)
> > +#define PHY_CRCTL_CR_WRITE		BIT(18)
> > +#define PHY_CRCTL_CR_READ		BIT(19)
> > +
> > +#define PHY_CRSR			0x34
> > +#define PHY_CRSR_DATA_OUT_MASK		GENMASK(15, 0)
> > +#define PHY_CRSR_CR_ACK			BIT(16)
> > +
> >  #define TCA_CLK_RST			0x00
> >  #define TCA_CLK_RST_SW			BIT(9)
> >  #define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> > @@ -113,6 +129,9 @@ struct imx8mq_usb_phy {
> >  	void __iomem *base;
> >  	struct regulator *vbus;
> >  	struct tca_blk *tca;
> > +	struct dentry *debugfs;
> > +	u16 cr_access_base;
> > +	u16 cr_read_count;
> >  	u32 pcs_tx_swing_full;
> >  	u32 pcs_tx_deemph_3p5db;
> >  	u32 tx_vref_tune;
> > @@ -420,6 +439,204 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
> >  	percent = min(percent, 100U);
> >  
> >  	return (percent * 127) / 100;
> > +};
> > +
> > +#define IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT 500000
> 
> empty line here, possibly move this to top of file

I'm going to remove it after I add a helper.

> 
> > +static int imx8mq_phy_ctrl_reg_addr(struct imx8mq_usb_phy *imx_phy, u16 offset)
> > +{
> > +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> > +	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
> > +	struct device	*dev = &imx_phy->phy->dev;
> > +	int i;
> > +
> > +	/* Address Phrase */
> > +	writel(offset, cr_ctrl);
> > +	writel(readl(cr_ctrl) | PHY_CRCTL_CAP_ADDR, cr_ctrl);
> > +
> > +	/* Wait CRSR[16] == 1 */
> > +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> > +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> > +		i--;
> > +	if (i == 0)
> > +		goto cr_addr_err;
> > +
> > +	writel(readl(cr_ctrl) & (~PHY_CRCTL_CAP_ADDR), cr_ctrl);
> > +
> > +	/* Wait CRSR[16] == 0 */
> > +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> > +	while ((readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> > +		i--;
> > +	if (i == 0)
> > +		goto cr_addr_err;
> > +
> > +	return 0;
> > +
> > +cr_addr_err:
> > +	dev_err(dev, "Failed to address reg 0x%x.\n", offset);
> > +	return -EIO;
> > +}
> > +
> > +static int imx8mq_phy_ctrl_reg_read(struct imx8mq_usb_phy *imx_phy, u16 offset)
> > +{
> > +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> > +	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
> > +	struct device	*dev = &imx_phy->phy->dev;
> > +	int val, i;
> > +
> > +	/* Address Phrase */
> > +	val = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
> > +	if (val)
> > +		return val;
> > +
> > +	/* Read Phrase */
> > +	writel(readl(cr_ctrl) | PHY_CRCTL_CR_READ, cr_ctrl);
> > +
> > +	/* Wait CRSR[16] == 1 */
> > +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> > +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> > +		i--;
> > +	if (i == 0)
> > +		goto cr_read_err;
> > +
> > +	val = readl(cr_sr);
> > +	writel(val & ~PHY_CRCTL_CR_READ, cr_ctrl);
> > +
> > +	/* Wait CRSR[16] == 0 */
> > +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> > +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> > +		i--;
> > +	if (i == 0)
> > +		goto cr_read_err;
> > +
> > +	return val;
> > +
> > +cr_read_err:
> > +	dev_err(dev, "Failed to read reg 0x%x.\n", offset);
> > +	return -EIO;
> > +}
> > +
> > +static int imx8mq_phy_ctrl_reg_write(struct imx8mq_usb_phy *imx_phy,
> > +				     u16 offset, u16 val)
> > +{
> > +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> > +	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
> > +	struct device	*dev = &imx_phy->phy->dev;
> > +	int i, ret;
> > +
> > +	/* Address Phrase */
> > +	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	writel(val, cr_ctrl);
> > +
> > +	/* Set cr_cap_data to be 1'b1 */
> > +	writel(readl(cr_ctrl) | PHY_CRCTL_CAP_DATA, cr_ctrl);
> > +	/* Wait CRSR[16] == 1 */
> > +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> > +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> > +		i--;
> > +	if (i == 0)
> > +		goto cr_write_err;
> 
> seems like a repeated pattern, maybe move to a helper. (if driver used
> regmap, it could have used helpers from regmap for this polling)

Yes, good suggestion! I'll add a helper for this.

> 
> > +
> > +	/* Clear cr_cap_data to be 1'br0 */
> > +	writel(readl(cr_ctrl) & ~PHY_CRCTL_CAP_DATA, cr_ctrl);
> > +	/* Wait CRSR[16] == 0 */
> > +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> > +	while ((readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> > +		i--;
> > +	if (i == 0)
> > +		goto cr_write_err;
> > +
> > +	/* Set cr_write to be 1'b1 */
> > +	writel(readl(cr_ctrl) | PHY_CRCTL_CR_WRITE, cr_ctrl);
> > +	/* Wait CRSR[16] == 1 */
> > +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> > +	while (!(readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> > +		i--;
> > +	if (i == 0)
> > +		goto cr_write_err;
> > +
> > +	/* Clear cr_write to be 1'br0 */
> > +	writel(readl(cr_ctrl) & ~PHY_CRCTL_CR_WRITE, cr_ctrl);
> > +	/* Wait CRSR[16] == 0 */
> > +	i = IMX8M_PHY_DEBUG_PORT_LOOP_TIMEOUT;
> > +	while ((readl(cr_sr) & PHY_CRSR_CR_ACK) && i > 0)
> > +		i--;
> > +	if (i == 0)
> > +		goto cr_write_err;
> > +
> > +	return 0;
> > +
> > +cr_write_err:
> > +	dev_err(dev, "Failed to write reg 0x%x.\n", offset);
> > +	return -EIO;
> > +}
> > +
> > +static int ctrl_reg_value_show(struct seq_file *s, void *unused)
> > +{
> > +	struct imx8mq_usb_phy *imx_phy = s->private;
> > +	u16 i, val, base = imx_phy->cr_access_base;
> > +
> > +	for (i = 0; i < imx_phy->cr_read_count; i++) {
> > +		val = imx8mq_phy_ctrl_reg_read(imx_phy, base + i);
> > +		seq_printf(s, "Control Register 0x%x value is 0x%4x\n",
> > +			   base + i, val);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ctrl_reg_value_open(struct inode *inode, struct file *file)
> > +{
> > +	return single_open(file, ctrl_reg_value_show, inode->i_private);
> > +}
> > +
> > +static ssize_t ctrl_reg_value_write(struct file *file, const char __user *ubuf,
> > +				    size_t count, loff_t *ppos)
> > +{
> > +	struct seq_file		*s = file->private_data;
> > +	struct imx8mq_usb_phy	*imx_phy = s->private;
> > +	u16			cr_value;
> > +	int			ret;
> > +
> > +	ret = kstrtou16_from_user(ubuf, count, 16, &cr_value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	imx8mq_phy_ctrl_reg_write(imx_phy, imx_phy->cr_access_base, cr_value);
> > +
> > +	return count;
> > +}
> > +
> > +static const struct file_operations ctrl_reg_value_fops = {
> > +	.open		= ctrl_reg_value_open,
> > +	.write		= ctrl_reg_value_write,
> > +	.read		= seq_read,
> > +	.llseek		= seq_lseek,
> > +	.release	= single_release,
> > +};
> 
> please use DEFINE_DEBUGFS_ATTRIBUTE for this

This "ctrl_reg_value" file can output more than one register value. So I
can't use DEFINE_DEBUGFS_ATTRIBUTE because it can only support one register
one time. I'm going to use DEFINE_SHOW_STORE_ATTRIBUTE instead. 

> 
> > +
> > +static void debug_create_files(struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct device *dev = &imx_phy->phy->dev;
> > +
> > +	imx_phy->debugfs = debugfs_create_dir(dev_name(dev), imx_phy->phy->debugfs);
> > +
> > +	debugfs_create_x16("ctrl_reg_base", 0600, imx_phy->debugfs,
> > +			   &imx_phy->cr_access_base);
> > +	debugfs_create_x16("ctrl_reg_count", 0600, imx_phy->debugfs,
> > +			   &imx_phy->cr_read_count);
> > +	debugfs_create_file("ctrl_reg_value", 0600, imx_phy->debugfs,
> > +			    imx_phy, &ctrl_reg_value_fops);
> > +
> > +	imx_phy->cr_access_base = 0;
> > +	imx_phy->cr_read_count = 1;
> > +}
> > +
> > +static void debug_remove_files(struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	debugfs_remove_recursive(imx_phy->debugfs);
> >  }
> >  
> >  static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
> > @@ -724,6 +941,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  					"failed to get tca\n");
> >  
> >  	imx8m_get_phy_tuning_data(imx_phy);
> > +	debug_create_files(imx_phy);
> 
> please use phy->debugfs as root node

Okay. Will do.

Thanks,
Xu Yang

