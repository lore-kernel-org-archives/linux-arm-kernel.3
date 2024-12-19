Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D450E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK/QCHsvwxI5jajMDK5bmLW2wqApLKVfmMXXvNmjNTE=; b=LjRA6ZpB6Ze52yVgyIVQGuZ41y
	yWQgRqhg29BB+tCC4WE5t5y6bg8uE+wvE5fi7Hm51qkcpXvnfgeqdEpB2CigIuB7m4yzJMDOUCl6I
	5ungY7t6LVmy6hOeY+Sj8p7h4Hr552wmSjBJTdPKxT/fhHpbUY9UXUMJh3yNeP3g68qePATsWxqOw
	zGtP37tvwfzLUfQXr/dHTWHPOw3QynawzmNEt/bcjlAUJ8kLkfhPEvHEL1LCQjXjFKPn+Db0JOzyb
	51DyG1uE7pskMu3KbtWm5e9LNX/32hcQLeb2deUI02Hsyz+zEyOJjdpl4U4xfDj7wOnDGWjLP7qri
	FSyMlm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGin-00000001yBF-2bSp;
	Thu, 19 Dec 2024 13:37:45 +0000
Received: from mail-db8eur05on2060b.outbound.protection.outlook.com ([2a01:111:f403:2614::60b] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGes-00000001xK1-2eiK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 13:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cS/CpqPd0wfj2v1mY1vYaaU6eyJmyRYE9Er27Tx0v8wJpC0PmFPYTy8kkh/vqma9rOeliMIn9h4V9GI/r6TGfGvwJXH7N9t4tEfjgbHUcIBGGvN1l2YcnfQa68gboQQJxLXq0w/OYsHh6rZtV/tS3QScrFJGToa3BkiYJ4BrczOdO/sZUwmoakhz/PvSFPJ0iuU6HHNEocxlQ4akkZb+sKh5OvmOecUQI3q3mW+TPCbjenG+UbwbujhrUfF7yhL+OGJzakertZ1LlPfVbiF80huWA31Whb2XO6mLGk1ksRWInMja5GK9xwhq7k+4C/qNcggwznFKB6za1AMK+jtUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK/QCHsvwxI5jajMDK5bmLW2wqApLKVfmMXXvNmjNTE=;
 b=iJVvFFIMOaFqQq1umNxmjl2RAawlRvv/6CcV83y6wWdwrFxeUSOJR5enPuQ+RCMB6rT3x2XsKW/gLxA1I5YS1cZ9gawNn80PlzMxTkbNU9wasFWK8Gs26ND2e9cVcmZ1zpp+weA0e83u0bruLscMiFb3lwm8kFGkjQIRKM4G4q5+M11igH02LeGMJxRhPwTEX7xAaJm3KQYRg+7msNj47yNrqVERUZD44bC6OhtxwoAvO2PC+WPA+aRROUqnU/+7kxKtNZo/iJ27sUmIAoKmDRBNmtVpB6UrAgjjeQ3Luo520jVed/IMXIjDp8Af29dB0CzOx0+VYntVwQ49YTPM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK/QCHsvwxI5jajMDK5bmLW2wqApLKVfmMXXvNmjNTE=;
 b=RXDx1PgzxQst3N9czrEYrT5mFuuVjKwLCvhHq457qUtBVPLo269avDrXkrp6dUEOiyYnAWw1gs+sgL6SY48LykSqgy+k4j9eEHu3Jxi4mWXLI/Hrz6YibFbA8IAAAfIPQk8H8znAaeP3wgct5C8NmYjft3kPdLFfWQy04zYieA3+/Ma7oszy1lG6VeGF96X1mU0F+z+rKgUyDO4vTE5HYFOBDIZEPpZtBL0bC1jKs1ebWJu2VxZBhmlxxIvAFO9m8agwl6iCYXdN8AXjS5HLVp/aYTD4pwfKoTJL30Z3M0pmEZeyHPyHQJl5z7AKMESCdoj9h+gDV7t320zN0cLoqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 13:33:40 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 13:33:39 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 20 Dec 2024 00:27:24 +0530
Subject: [PATCH v11 3/5] arm64: dts: imx8ulp-evk: add nxp secure enclave
 firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-imx-se-if-v11-3-0c7e65d7ae7b@nxp.com>
References: <20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com>
In-Reply-To: <20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734634652; l=2640;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=mAzNbzRWOh6wFu0SMI2UVtcJ4QuBAqfaQJrwAklpA20=;
 b=D69ghsza+3fqjFdbQ/2Jt1XXY29m8aWZFIPUjWGn2Gf5k057rT8Suquc3XtiiP9PpapJjli6l
 k1F9RYGpCgtAZqD5piVd1SzKL0LX3i54lb/WpNDg7gDLu/jB5ER0ysr
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a87e63-aa67-41eb-efd0-08dd2031bf4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmxDdk1JajZ1OXFmT0tvby9mSTZhRkh6TjQzMTlSeHhyT29yY1ZZR2lsWXMr?=
 =?utf-8?B?ODlTNGI2bStlNE9EVEMrVHIzUDhXYTBIVTJwNEpXcFRTSnJWOVlWeUpqSldQ?=
 =?utf-8?B?WHhuNG5KZXRxbVhUWWxlNTRwSjlCQXJsMlV6bjd2Y0MyTWl3WTBGTVBzR20w?=
 =?utf-8?B?NDZTdzE5d21LN1pLNkRzTWthK2JDcXJWUzhRM1V5SUh6OTZlOHMrQy9McUdp?=
 =?utf-8?B?cllxdjM5SlZNUUQwMGdqT2xpbk1wWEJJK3hpY0h6eEtZL2V2ZGlTTzRFUklQ?=
 =?utf-8?B?V0gvTThrZGNBR2F6NFd1N3J0aEVwdnpMYnB0eVVkczk3dUF3Y0RpenpsaGRx?=
 =?utf-8?B?eVVTSVlta3p2dUZqbVVlLzVSRkJoTmh3dE40bGQ0Q0hBVm1rVnFnbVNrMmww?=
 =?utf-8?B?V2VrV2t5OEVyUjd3bmNya2h6aVpRMGNrZWdZZWFTWCs5Y3dLY0Z2T0xWRWJG?=
 =?utf-8?B?cExNWEo3bWRtUHJvaFllRUhoNjhNQzdRdmJVQVo5cWJuSVdBYzAzc3pRUXNP?=
 =?utf-8?B?QXV4cVIvSEl5NXMxTmtvQU9JN0xVRldXTC9RWDZmajdUNm9Ed21weWlOUTBy?=
 =?utf-8?B?TXJxUmVyQkdXUERzTVhmSFNZcHNrUm4yNVk1MlBNeGFGYmlNN2ZwWVdFd3h3?=
 =?utf-8?B?c294WHpNaEVubkpEZmUrQVJQTkhtU1RrZnlpV3RMWkFiZXpvK1RwRU4vSUVC?=
 =?utf-8?B?MVZ2eC8wbWprMEM0YVAzaitCb1dVQmhyNnM0U0ZBZ21SQmM5SGdrS3FacTYy?=
 =?utf-8?B?YmttdUdnNVRpZ1dpL3VjaytMVDVjVm1pbXl0R2JhQ0x2bE1MNnVwVEpWRUlx?=
 =?utf-8?B?blJwRmZtek5ndGxvQnFxZXNrUk9RRlJxOFBub2NxZjY1RGR1aGJDNjlteTFR?=
 =?utf-8?B?aDE3L2FVUlUwZmtjbHRZU25aL1VlL3h1ajBBV2VvN2xpZzd0VWZiZzRSbGpj?=
 =?utf-8?B?eDMxNjNoMzRZNWhLWXhjZDlyV2ZjZlFuVUVLV3MzdHdEaTQxUGpxcEM3cmlD?=
 =?utf-8?B?d0g0b0ordUdyOEIzc1A0blRkdlRWbUFvbXNUNERNZUY3cnhTeElkYmFMcXlY?=
 =?utf-8?B?Z3hobUJpNzNNeDNkUTRhZloxZHdoa1dENk5DaFllLzdCQURiWmdKelozUjNk?=
 =?utf-8?B?cW5pZUZEQXJaYWRDLzlHY2VXNEs0UFEwMzNRZFJiNDhWK01wZDQ4eHdNQlZZ?=
 =?utf-8?B?VmwwZ2JnTFFpenhIU3NsdHVsWnNXeVYzN3hCenF4T0NuV0dyeU1xemVjU2pM?=
 =?utf-8?B?bGF0UEk3MWMyQzdzbzErVmNZdkRtRXR1Mk1XOHhuclNFYzVhUUlLRDdEM3pN?=
 =?utf-8?B?K3l3ckVaOVdINlR2aVFTcDZXWlhoeUtSbVFVbm9LdnNtTE50cmNTOFpGUDhV?=
 =?utf-8?B?VjM5TE1FaTNNN24ydDQrbFFhbWxxckpzWXVxaEJVVVlSblNEV25zSllxR0tK?=
 =?utf-8?B?Ulh5MUFBZGtKbDBDZE14QUxvMmR0U2xSRE85RDJ5UllLOUNNU01zVWtPakJC?=
 =?utf-8?B?Q3plZFJOYitsdTJ3dzZPQ3FCQVNpRW1DSzNRdGt2NS9jMHJyS0phSkVYU3Ro?=
 =?utf-8?B?TkpoVjdaU0wwVVNZVFVsMDQvMmtCVnRpT09PcTA5cUNmVDVDaENCWUljYUFp?=
 =?utf-8?B?L0FLYTM0VSs3WXByd0JsM2UwL2hvTDN5Zmc1MHphQnMwQjdxOHJJRTJjZGNm?=
 =?utf-8?B?ZHFxSUQ1Tm5XdEY3RWR4WjFaWUxlR1hFK015Q3Fic0dpdXVEK1BoYjFzVGgx?=
 =?utf-8?B?M3dJczZoYm5WVEZzbDc2b3QrL1plNUJWYjJJY2VQdGlDZ0l6cHFWTHVxeDJx?=
 =?utf-8?B?eHBnVmVrWHBPOTRUQ0ZienZNeHJMWlhpenVuWkZrVndhS0lnNzR3MUc1amVp?=
 =?utf-8?B?SWNlQlpFeUlhR0tFMVZoek91Y2lXY2NzQzlXeUFxL2dOa0RIUTJtdlA0MXFI?=
 =?utf-8?Q?1tlfcxVgD1fOjPoTGpbN2GIYN7L+wcGI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWNjVnFHRTRFY21vRUFJR1Bsc29QSDJXbUZnYnRQM3JSalpZUW1TOFVxRkdY?=
 =?utf-8?B?RUtCWFJ1cGh3RURjcUlZcnR2NERvelJvZjJMNENRZ0pGQTI0Rzkwby9sdWxZ?=
 =?utf-8?B?WEgvblc2WW9kMUFIT0ttZUwydnhwODlML0RDOTVDNlgyc3U5ZzhCVURoR3R6?=
 =?utf-8?B?T2wvM2N4WGZtTzZDY1c0TW5rZEtmUmZ1YmxxME9ac1orRGd2NnNKSzd0VEor?=
 =?utf-8?B?L201U2UrRWwxYW9Xa0FQaXVHckZvS0NYUFE5bnhVM0gyamY0U1IvSVFQOUdO?=
 =?utf-8?B?cVR0dVcyQXAyamRqdlAwcUNRUlREZXNVV1hTY3Uzdmd0Ukh1bXkzTjlaYXNy?=
 =?utf-8?B?Y0Iva1pUUm16Y0J0Y051Y0Q5M3IvcEl2SGNOZmthZ2tUYzdKOGtYdnEzajBu?=
 =?utf-8?B?eFU5YjRyNmFCMUVNZHBTNmNsOUtMRXBLV1lsdHJGUlV4SDdHSmdjOEpCUVgv?=
 =?utf-8?B?bHNqZDZXREpVU25oU2pPaGIvZ1JJQWN6QUFJbjdJL0M4WlVSYkczOUZ4NldY?=
 =?utf-8?B?bHJ3MmptN2JZZzlqVDJ2OUNpK3lvOXlHWU8rQzBVRlpUNjdGR1dpOFFWekY4?=
 =?utf-8?B?WGFIOExwWU1tMWVGaGNSZjIwa3hvcTZXVElJUFpxazFFYXpoMC9zV0NocHZF?=
 =?utf-8?B?TXRQb1YwMWxJR1dxcWdDNy94UzlHT3hTd01ybjQvY1Jpd2R6aTltSlRNa0dI?=
 =?utf-8?B?K1Y2NEtMaVIrZDdwb2dYRmZoSGg3YS9aSHAyMm1FNEJkUGxDamZlY2JYR0xE?=
 =?utf-8?B?czhRQW5nTTE3WHVPbFBFVEpWUFZMRE5NWGNhd29aSXkwY0FjeCtwSTFyUkt0?=
 =?utf-8?B?bW9VTlBkcDRUS29YSS94R2d5K0xRcW4rV0xmb2xKUU9DeitPL1BXSlZrNEV2?=
 =?utf-8?B?TjJmQkZuUUlPcmk0RWNJZ01va1hoUmtGbkFvME9KTzNRTXZWWTR6bEpYbnZB?=
 =?utf-8?B?NHhvR09RbG9kN1FDWTJnTnFrblluY1lpTjJDbng1b2dhVXlkME8yQVpSM2NF?=
 =?utf-8?B?NmwwYTQ3bThOZzllQnlBVFNnQUkyQ3U3VDU2YTl6b0RIcGxqR0pxbG53SzNL?=
 =?utf-8?B?cXg0TU5uaysydGg4L2ZFaEZCc0I1Z0xtRC8rK1dsYlZqUXNyczc3dGVGeXNh?=
 =?utf-8?B?SnljWGR5YkwrM0N0azdBd0p5elRrbnN6SzROMkljNnMyUmRXM2MrT2NidE1x?=
 =?utf-8?B?dE9hVlFLN0tYaXA2SWlTQkVsUjdQT0VrS2hKYkhPbEh3T0VxdUFUUHhQT2c1?=
 =?utf-8?B?M29VTDV5ZzVPcmQ3TFpQdnI2M0xscFdrYUZRWEVtN0VraUJWb3lLTjJvdmhW?=
 =?utf-8?B?S2l1WTBmKzZZamdwQmhncTR1Rmo4SllPSHgrUUlUMVBtMkdNQXRDZFk3TThx?=
 =?utf-8?B?L29yTWJIMmxoV0xXZzhmZ1dGUVBxcTJOVlE5M0JyNUpTSmhqaCt4eERQQ3JC?=
 =?utf-8?B?TzlPbS9ObkJDa3hnUDJYbkFzNi8yZmFYalJPa0JuOUlzNHhnSG52NFRJVmFZ?=
 =?utf-8?B?ak9rOGJCU2tDRE5LYkFwaUJMVUo4cEVBYXB6ZXJ2WGNHYXNIOFFyNGQxNjZT?=
 =?utf-8?B?aWJFcERoMTM4YmpxUXc0dDNUenR4VUlMNDUxSzJxM3ZXbEhGSS9XWVQ3czN1?=
 =?utf-8?B?elM1L0YyTXVwcnVvSmUxdXJiK01jNmFvSGxzRTlkLzJ0YzFmOHEySHFiVTFw?=
 =?utf-8?B?Mk4yMEtnTS9sOFdWV2FBTWE1SmlxUUhTbS82eG5LdXJmY2QzRnJhSStUTzRG?=
 =?utf-8?B?S08xRXRDRnZtZDFxdmZ0Ky9iMnp2L3lNRElKYTJOMFhTVDlYMDlnUkFiaTN3?=
 =?utf-8?B?d2ZobUtxQVIxNmkvMFBQZDdYbnJsZkt1YXUzaE1MZXlqeENyQmNUM2Z1K25v?=
 =?utf-8?B?aTh1aSttUGQvZDFCaC9XdDZSK0pZRkN4cGZwVlcyWE5ienhXbUJob2w3NzRT?=
 =?utf-8?B?UXAwbUNQWS9qaklhcjM3ZzJ4bkVTTEh2MDB0NEZxem1ZaXBNNXEyd1haUEYv?=
 =?utf-8?B?dWp5Wk56eUdXQ3dFMU55VmE2d3o0azR5QUdla0puWW0rejEyZXM3dkNNQ2gz?=
 =?utf-8?B?NDRNOVBYajZSUFJ4UzhDT1BzVVBabzJTeXdmTExSTFYxWHYyTk9vZ1NUdDVl?=
 =?utf-8?Q?GfX04owAY4ABma7SOO7Hfv2JK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a87e63-aa67-41eb-efd0-08dd2031bf4a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:33:39.2590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HgpmLA50sPUGNszbU/x+vdGntIIAiDWPY5HO1ZHV2A1NNwSQLltB0Up5zseu0OCL6H/1c1Q+spcyoECDyE5qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_053342_677405_AB646D00 
X-CRM114-Status: GOOD (  12.58  )
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

Add support for NXP secure enclave called EdgeLock Enclave
firmware (se-fw) for imx8ulp-evk.

EdgeLock Enclave has a hardware limitation of restricted access to DDR
address: 0x80000000 to 0xAFFFFFFF, so reserve 1MB of DDR memory region
from 0x80000000.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 17 ++++++++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 13 +++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index e937e5f8fa8b..f5963f4043c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2024 NXP
  */
 
 /dts-v1/;
@@ -19,6 +19,17 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0 0x80000000>;
 	};
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+	};
 
 	reserved-memory {
 		#address-cells = <2>;
@@ -204,6 +215,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&ele_if0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index e32d5afcf4a9..f98629b7f4cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2024 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -152,7 +152,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -167,6 +167,8 @@ scmi_buf: scmi-sram-section@0 {
 	};
 
 	firmware {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		scmi {
 			compatible = "arm,scmi-smc";
 			arm,smc-id = <0xc20000fe>;
@@ -184,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		ele_if0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.34.1


