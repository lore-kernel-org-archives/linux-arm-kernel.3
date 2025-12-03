Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25524D1BDC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzdCsiNW4aVMY6eON+onneoXp7RRIg0O+7/nJCpsEhw=; b=hE4kggMudIx3MMh+BEvzReIiGo
	3OqXox5mTL1gt0tu7sYM5xzNMfkaKWTr96Iwgq6gVS8wDAcaKUAyyo9bfsQuK6OEDKFt15d3c7pFH
	ZSKEt8aZCb9QgC0ZhDbWK+LqwUByOFsmYjX7dHpDXqdHk3Yh5o9Rvpu3mBrFxlvZyL4wqhQvTn7W6
	hO/RQMDqCbmH/RsizgRk5EhBNywCUZoUGGvCSwIEvRIpkH/aJaercYTcKB8jvr38bMBWxprdO4IA9
	lVFdQ8XXVb4d/Tc47nQApr+48QE7kcQDgwkKd82Vh1M+jgAJOuRXK8I0moNfb8LJDazj5FeAkMT4L
	16aUS0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrHy-00000006ubs-3n40;
	Wed, 03 Dec 2025 18:09:18 +0000
Received: from mail-francesouthazon11011069.outbound.protection.outlook.com ([40.107.130.69] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrHx-00000006ubS-0tAj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 18:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGlHL4Vee6Rj1ZXwh8+xlwfGD4aRIjedQ9Vs4JC+4Wm2p+hCJclAiBtQ3gxQJPg0KtgWOXUhFXgnApcCe0ppEhw5eSU6Ng6KbXKowvvnLdDKXYvwOWVsAFocWHZ56xn9aYHmkA3PagVKqCc8pXAbGsQ/1CaJD7f6QEywGUqBdA0YwDduHOhm3GUJuYvKQVi2/SzBICcfIxD1SPyv6KxX6wqHkTS/aMYJxCZSSaNgzJGCYeU24J1MVbr6GMCXRFnJxCU1dDrIOEHLNlbLDPQfie8BCNsqi7aYYYZs/WXiLql+lUDpS3NytXqMKhRdRtSOiOx2tCOoAMZdZpIMhbNevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzdCsiNW4aVMY6eON+onneoXp7RRIg0O+7/nJCpsEhw=;
 b=T4l+IlrUNT7N/wYvOWCbngQ29PwGfN+oKQNZ0UIJzGrkJc6Gk8DdhB+i2TTvgSCaUsstTu2/QxeAfyvXo7/5GAjI2Zycv2lf7KNaZS5zWOeqrsTGy+WV/msaGStgjPIxhHz/s4zDYzQrUw/V6USD836ui7vmkTFfh6fxYclrqi4hddr8lF0vMBjG7AM1W5ZRkpowjCFOyO63JvTijjQEz68DwxMLQa2wwHEn5NoWw5tshCzfMIrJBT9x5/M9MGmxUsows43QxjIM/NHVXY5XmJgAN4hFjtilXecb2pWOMd8to1q/wxOllmWVNTEmVAzPD9bb+JQ4DFQ7kxTc9qfc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzdCsiNW4aVMY6eON+onneoXp7RRIg0O+7/nJCpsEhw=;
 b=iTk7m7cxL36Vc6DG3ep2hXfZmf2ECmfJelhrcJkSUvXWczPFt35yLgzMFmdVDaBABVppVMPlNZcM5qsElrOGDH4lkSpIQicXPDkwK9Bn1Hi6OkSdYjNJ9yWylWnMIAzRfM3RjOo+xtSQ5uJzsqfQbf8T1jt918GgWLQm7KhUDYGluJdj9nAKxy52Fjrzn11hqOPcGnHQTzOYKYPD0Ifbi4uzuXa09IZKpEs0MuDd5EB4oqh7eCu6dYfqA7xXBIIeJDWtsfbIutqPVQOqXOkNB4ufXYjjMMy53q4dczcNk6R7xcwqASnGVZlS6E6jRhnb5uZhji/LtYnv9qWdQH7p5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by DU4PR04MB10600.eurprd04.prod.outlook.com (2603:10a6:10:588::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 18:09:12 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 18:09:12 +0000
Message-ID: <6a6e90fb-c8be-49ad-83b4-4b602489a616@nxp.com>
Date: Wed, 3 Dec 2025 20:09:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Wait for suspend ACK only
 if WAIT_FW_READY is set
To: Bjorn Andersson <andersson@kernel.org>,
 "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, imx@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
 <20251125124903.962295-2-iuliana.prodan@oss.nxp.com>
 <l5udmggplyatnozipk7tjugkkzwtglckjejq67aa7q4mlywxw4@4vhjkbhjthnn>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <l5udmggplyatnozipk7tjugkkzwtglckjejq67aa7q4mlywxw4@4vhjkbhjthnn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::19) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|DU4PR04MB10600:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3537f1-17a6-421b-a93c-08de32970f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1dpdzRudk1GRjhuN3FSQTYyUUxjSHc5emJuZ2p2UUdQUE5oWTkwZTg4ZVA1?=
 =?utf-8?B?UlRUbncvdWxXUldnSm1HOUNWRGtTWCtBL2RzQ0psSkxVY3ZZWFUwdkJpTU5B?=
 =?utf-8?B?alNXaDNBNWhJUTllajZBRk5GLzFjcE45NVJRamEzbEFoQUtXSkVqWFdyVThL?=
 =?utf-8?B?cG9YNUI1YmxDeWUrcEhpQjlPb0N5cHUwbGpHbHd4WGE5SkI5T0UwTWNkYWJD?=
 =?utf-8?B?OVNMN0dURDlLdWZHeUp6dkRyRTg2bnpQNitTTG41cUhNeUVhTmxEcFcvUG9V?=
 =?utf-8?B?ZFZqb1lBMkp5N1ZpUGdwLy9DMDE5YUZrdEhTMTRvRXJjZkg2MkNxb1FiS05M?=
 =?utf-8?B?TFNLMlhBTndCcUZPQTdkclI0T0hBM2dkTmJlT0NJdlRMM1ozd3ZzZDdIQlNC?=
 =?utf-8?B?T25pajZHTEpDeldVOHBJV2o5YjRiMWx6a0Zzd0FDQ3kxa2oydXZBS1VOV0R2?=
 =?utf-8?B?NFRPcjFOZGdqbDZCUFh5ZzZOekZ3dHNYZlJoOXdZamo2bE1wUUhmenltL3VR?=
 =?utf-8?B?czV1c05TRzFoMDk5VUlnM2dxcDVmdUdGelBmTDZRaXkzUkpqemhkYkRpUXFJ?=
 =?utf-8?B?L0pLMCsyWVJQcU5HcmNwRmpDSzNFQTY3d2hHRXM4Z3VxeTRhMERkazJnWlZQ?=
 =?utf-8?B?K2tZT3J4bWdCN09DSy9SMEkrZEVGN2Q4bllYb2VZelpNa0Z6YWUrS2NnanQ0?=
 =?utf-8?B?ZkJ6L1RYMnM0eWZWMDYzdXpsWWU5WWdqNnFMSVY2SURSeFVHSUprQkxLV1d0?=
 =?utf-8?B?eWxFVFY1MEhleW80cWdwUlVhakljS3IyeUs2QUFvM1RFNFVvV09udVlkY2F2?=
 =?utf-8?B?SnRPdFg1RkFmZjBCaThDbWh0cktzWiszRjdURUpVaUNuL3RpNnVKV3NjMi9X?=
 =?utf-8?B?OWUvMWY1TlV4SkRpWGlRcWpWaEViS3VHWlY5MjQyK2ZRRlY5VkFqYjdZbkNa?=
 =?utf-8?B?QTg1ZC94aDhBR3lVNVJmZE94UDFZcHpGa0xuWHZZWVpWTUtKMmk4WTVDdUNI?=
 =?utf-8?B?RVUyWXZsOG1ZUUZVWm5xRDdnL1RNS2U0aUF6aC9xaGQyeFdoaXo1M25YdFhL?=
 =?utf-8?B?M2ZjVVJPRVNmUW1HNXMzQnM0d3N1REFTRmtyckZFK3o1QWxwZXE4QVNtM0lr?=
 =?utf-8?B?em5Wc2xyQnhoU09jVTVUU0F6eGVqQXdFT0FzOVY0SUgvaTlqVng1elpUU0da?=
 =?utf-8?B?MGlFd1dPNGhnNHJyVFVZTzhqOW5pVTRmWWFLUW9CcW9XTFEyRDkxUjNEdURP?=
 =?utf-8?B?YmhuRFN2YXN6WC83aGluOGt4eXdVM3djZmIzUVcwNm5CaE9zRHJRcFBXcXRx?=
 =?utf-8?B?Z1NWUWo5U2h1NkduZU45WUVBSkpyaFEyN2JmdmhONCtVMzJ1RFB0QUpqT0Zk?=
 =?utf-8?B?YURGb2ZVWEltYjVRanpsR3FBQ1I5dFhucFdvR201QjlTRGNtYkpYSVptb1pU?=
 =?utf-8?B?MlNhOStIcG5TdUlTR1k3VDJxazM0aWNrYWh0eUpFSzRnbkFDVWpsKzZpTmcy?=
 =?utf-8?B?NHpiK0tmVUFSSU9ORStqTWFMR29uUHZwWGdnZ1dQalNIekRoN045Skt1Vk00?=
 =?utf-8?B?UmdIbUE0bmIwT2FiUHROMlBFb2RWZ2M5VU1JakhNZzE4Qm1ZVGxyb3h1Nko2?=
 =?utf-8?B?WHB2dTNENGtrWFVvYnRtMzA3ZGk3S3Rmb1pndTM4ZXZ4YTNuMlp3UWE2VG5k?=
 =?utf-8?B?U1QrZHNxUnV5WHJIOUc2MmpWdjVUTGMrcVZUblNtb3Q2Z1MwVFNES0Z4NDB4?=
 =?utf-8?B?MjkvTGJqVldZb2tXTEwyMnJYOVVoMElEclREWCtHYXZNcS8zb1ZzcWZCQmJ0?=
 =?utf-8?B?UGtQTlpKUjI0UGhjR211SWNzRkU0eFdtZVVlMnhFb1NsbG41cURhVHFBbzBv?=
 =?utf-8?B?dVNmdGRZc211NkcxMGlleU5OYkl5UktZQ1ExcVpjYjJwQm5DN05tS0xOdHlq?=
 =?utf-8?Q?QClcxKM8+xInwIlf+GK+zhG0Ea4xSvjs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wjl6QlIxc0w4T0RsbGlQYkdCTXdQS3lmZGtjWUp2S01tNmJQRFp1N3Uxejd0?=
 =?utf-8?B?cjZCR0tzMGdMMWVHSWFiVWZJSHgxd09aYUJpU3NidnRzSm5XRnppVmJNNEdI?=
 =?utf-8?B?WXNUUjcvbG13YkdUSU91SjVxaDNnMmVpclVlUnNvWE90djlUTkxMcEpGdE9u?=
 =?utf-8?B?MXgvcnlsV3hEM1phY25EZ3IrMytvclJhNC83dnF6NUVSc2hzY1lLeW92M2wx?=
 =?utf-8?B?VUJYNitZa0FJdXdQU3M3aEh6YnF5SFRaZG9SaEd2TS9zR3doZUVXOE5yRXRC?=
 =?utf-8?B?RFk2ZUdVdzg3V3ZTbTdkYWxYaTVyb2FtRXZSSUxINGFuTnVUd0pqdGcyMlN5?=
 =?utf-8?B?djBFNmZlTDdmWmhnWFhUbFNVY0NsNEk2UW1ZUS9lVkpCWEJHZ3M3ekZScVBD?=
 =?utf-8?B?TGxPdUhycU8zb0kvQi9YeFBQNFpaOHMwZTMrWHFvTGtVQjhJMFgxSXM3WnVm?=
 =?utf-8?B?Z1I5bWgzS0JoMEQ3RmxGSUJXc204aloxUzFnYUdHaE0yS1NENnVsQ25QS3g4?=
 =?utf-8?B?aEJXZENxcGIxNW1scUZvOXl6SmRzYTRwZkl1cm5aUVU3a3o1QnFUNkVaUjNX?=
 =?utf-8?B?QVdFd2tWblRncnNwQUQrNktkNWUrVFRPY2lvVSs2NllUdEU1a2pZRmxRZC9z?=
 =?utf-8?B?S0FRSWpkU0JTdXRjRUZybnQ4cWtyY3JZbjU5ZDRoaHhVWVN3VUlvRnQzcXZ0?=
 =?utf-8?B?VEtEUXFoM2lPaittZEJ1VUhBMmdYdFhQTkdOU2xOTUo4UDQ0WGEwUHFGLzVF?=
 =?utf-8?B?WDQzQi9hdlRKTzR4c1BndVduRGZZNVQ5MGxlNWNRRk9aVHRnendkME1LOGcr?=
 =?utf-8?B?Y0JLQjVHK0llM3N0VENvdzZ2ajIzd3UyOUFGako2am5GTXBVNmIrYUtoK3BJ?=
 =?utf-8?B?SmlqMEw2cFViZUE4TldoRjBoZTUyZEtaa2dwZzBTREpHbWdnVXZ0ZEpPb3Nr?=
 =?utf-8?B?VmtuaW5zQnhoRnYwZDkwQVZ5TERvZWU4bkZpYUtDaGUyanhDL2VPRUpuQjhm?=
 =?utf-8?B?Q0V3ZW9NemJYRVYxRlJGcHdIbTg4VG1LOFV1NjNpSTBpaVB1dVQ2b05MK20y?=
 =?utf-8?B?c0hoNUFJd1loMHJPbnoySWhvVFgwTWt4TnY1SHlOeFl2UWVBT0xQZzJiRVlo?=
 =?utf-8?B?eHV5MnFpeEg0dm41QUV3VzlXVlFVOUh3NzZpbzR4Q3M1b2ZhVGhiSTJ5MEcv?=
 =?utf-8?B?UXNMWnUyTUFYbVFyQ09YclN0YTRlTHJWZXhFbGd5U3JiaUVROFJKRlVCZExo?=
 =?utf-8?B?S1dZMnZUMzBOWTVMVGt4ZnFEL0pNT1VmQ3N0VlBiQy9aNzFRZFdoVDNHRnZL?=
 =?utf-8?B?V0x1SWcrd2NSOGFKV0tXQVJ4aUpBU3NQU1AwSjdxb1QzVk5qMzU2UzdGV0dZ?=
 =?utf-8?B?RWt2ZjIzOWNURldDNWZ1T1Z5L20yMmdTL1NsRFovZ0lnSE8vUlpjN0pLY1Iv?=
 =?utf-8?B?TnExRlRmOGxKeWtMS2NxMWQxbFJjR2VUT2oxazVvTXdrMk9yTkZFdFFxQTMw?=
 =?utf-8?B?WTNQc01obFZsWVFJRm9NR2JGaHFmUGNWZlg5RnpBNWFVYThYUHNNSCtiSTIz?=
 =?utf-8?B?dW1RZWdOTXNSK1c2M0I0OWpNcHJmREFwMWJxVGxRQjM2WE9NMzdZSWxDdU03?=
 =?utf-8?B?Y09Cd0hmSyt4Q2lobjcxRnBRV2tNbXQ0WlNCbkdUSjJiM2Z2M2pqV3dzZGxM?=
 =?utf-8?B?dmZPTzRjTnVlYlhnUFJEMHYrN0VEZzBJZ3NIckdVL2w2Z1hoSDFIR3hqc3M4?=
 =?utf-8?B?Ym9UWlF5Ky9iWTcrK29EM0dON2d2c01PTGp3MVRsTTRYWkdLeFF2cUl5bDBv?=
 =?utf-8?B?SnRjaVlzMUx5WjU4V0lsNG1qT1hDSlFxQnJEN3hOMWlONU93R1JhVitTMmZX?=
 =?utf-8?B?aXlQazBBVjNoYUU5TXFUeisyYVZFMHB6K3FNckxEOXlRbzMvc1EyTjBYd3NK?=
 =?utf-8?B?MU42bzlId0c5Q1NjTkkvbUhCdXNZQXArQ1VObUJXcEs3M2IrMVg4d1dqcnN2?=
 =?utf-8?B?dkgxd2VTc2FvM2RmdTdYR2FoTlVxOFFlUUwxUDJlN3U3dUhnakdidFc5RnNL?=
 =?utf-8?B?cVNCNDRlU2J1Rk9WaTNndWh3d0JnTi95QWkwSlF4YS95cFhuWXRiRkptQ1p6?=
 =?utf-8?B?T2pialRiMUVOd2RtUXpCR05XZ1FSQnQ2OXIwZDNESUZHU3FGQnZSOHA5cEdM?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3537f1-17a6-421b-a93c-08de32970f91
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 18:09:12.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4POQzuywZJnOIB4F3Bh2iF73mL5DRHFimg7GrinNxdw/Z1RsLkNExq04NQliTHo+zJtrXv1ACLscrMgS52XWFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_100917_257198_BF2F0A05 
X-CRM114-Status: GOOD (  32.67  )
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

On 11/26/2025 10:21 PM, Bjorn Andersson wrote:
> On Tue, Nov 25, 2025 at 02:49:03PM +0200, Iuliana Prodan (OSS) wrote:
>> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>>
>> The DSP suspend path currently waits unconditionally
>> for a suspend ack from the firmware.
>> This breaks firmwares that do not implement the
>> mailbox-based READY handshake, as the DSP never
>> responds and system suspend fails with -EBUSY.
>>
> 
> But if the firmware doesn't implement "mailbox-based READY handshake",
> do you still want to send the RP_MBOX_SUSPEND_SYSTEM message?
> 
If FEATURE_DONT_WAIT_FW_READY is set, it means the remote does not send 
any feedback to the host and does not handle specific messages. In this 
case, it’s better not to send the message at all.

BTW, to avoid confusion with FW_READY macros, I’ll add a new patch to 
rename these macros to FW_CONFIRMATION, since they are used both for 
boot confirmation and other firmware acknowledgments.

> If so, can you clarify here in the commit message that the firmware
> expects the mailbox-based message, and only the "handshake" part should
> be omitted.
> 
> If that part isn't implemented either, then I think you should fix the
> code to not poke the mailbox in the first place.
> 
Yes, will fix in v2.

> 
> Also, wrap your commit message at 75 characters, please.
> 
>> The driver already uses the WAIT_FW_READY flag to
>> indicate that the firmware supports the READY
>> handshake at boot. Apply the same logic during
>> suspend: only wait for the suspend ack when the
>> firmware is expected to support it.
>>
>> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
>> ---
>>   drivers/remoteproc/imx_dsp_rproc.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>> index fc0470aa72c1..e25dbe32ef79 100644
>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>> @@ -1327,10 +1327,11 @@ static int imx_dsp_suspend(struct device *dev)
>>   	}
>>   
>>   	/*
>> -	 * DSP need to save the context at suspend.
>> -	 * Here waiting the response for DSP, then power can be disabled.
>> +	 * The DSP must save its context during suspend.
> 
> Please double check that this comment reflect above conclusion.
> 
This is valid for some firmware, like Xtensa Audio Firmware (XAF), where 
we use both firmware-ready replay and the messages are handled on the 
remote side, where the DSP context is saved.

> Regards,
> Bjorn
> 
>> +	 * Wait for a response from the DSP if required before disabling power.
>>   	 */
>> -	if (!wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
>> +	if (priv->flags & WAIT_FW_READY &&
>> +	    !wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
>>   		return -EBUSY;
>>   
>>   out:
>> -- 
>> 2.34.1
>>


