Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB94DCD0435
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 04:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZCUUF+cc3bUZCjGGatEjWiinH1Ku7vTcJDNQ+XaVWU=; b=duiSU7WhWJ5hIIvH+vE5yhWxQ+
	1Dwj4eD+ls6MZvtIENxX2PIcRiillOI5o5AoZI629GOrFkEmuEihzSSuYoeD1ASoUHi8neAEXgiSa
	IBO6RlAtXTemucteDzeqHx+J3+8DAM7a6aILpWE1s41Gx6rwriJEFlNeXivJ3Qb+xiL1bTgk2OZIr
	/eQ3SlfCNIpmqvMiJeedMWThACnUS+0NuhK7KRsL0Iozbt9N1wJISsWs5F8a2Emt9kor7dWMRdmpG
	wfvaBj8mKZzcACbBsSEvKJUSnQBDD9mLLTNP1JdjxfFftFr9XbX/uhgvu1jy1piHnpu32YM/4ogXN
	JdU6GImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz3k-0000000CPsP-3Vyq;
	Tue, 06 Jan 2026 04:52:44 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz3h-0000000CPro-3bqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 04:52:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERb2hhu3P6FrPzy9TFC8Rb1iyYbFaS+58amtV/NxHNwmokP6XSIAR6RO43LJ6MvYSsS6f8EoKnQZkRLirFa7PScPuB7ynZqWPpoXf217daP1PNOfy83uR4WZ76+skhvMxfbQHZRlqqlTjhx3NsEI8WBbWlPWgax5QT27UjgonauDXiuJsLbNfsyArplWu1aMYjf2yjnSX84XwvBF2kXYjp5T1u7FtXMoGJlqIHypq9IWzMjQUZ7QELsFLHh9uT66bDDZI30zAlbeIEqMgYSq/wc91SS+wiyaPIgEgLlZ+jV/DegsoS8UMnpX8/QcATwneijBRRGoYbDY3enXpcDzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZCUUF+cc3bUZCjGGatEjWiinH1Ku7vTcJDNQ+XaVWU=;
 b=CpaPtOSpPxFgzhjRS/NJAvnlIJtwJ2WGhkbgtFFqreO8YMOvcWVdc3E4Hu2HkNhWaPADk8qbDYKJOiRaEKmOrPxWXPrfwP1EqWO694+cQ+pBNLLNYGQA/4xQVpBUK4teTo7+RawXOOttxyvRy3fNdwR74D541XIj4XgAEMxu1BnfmQLQxz5HT+o1rs2n8Z0BrIh5RBI2D7P9x7J5/UyfKg7r//2FaMYC6616mUoRfwqbZi1IOI0cztDFjzaz0wlMjTnk5LCxsGxW8DI2GuAnoSNLi6Gv//C/8Gy63h2N8kNcx8giQmJ3V3E2ZaxdXBGgFaxThqoe2WtIzYzFa1vwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by JH0PR06MB6414.apcprd06.prod.outlook.com (2603:1096:990:10::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 04:52:35 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 04:52:35 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Peter Chen <peter.chen@cixtech.com>, Fugang Duan
	<fugang.duan@cixtech.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-cix-kernel-upstream@cixtech.com"
	<linux-cix-kernel-upstream@cixtech.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIIHYzIDEvMl0gZHQtYmluZGluZ3M6IGFybTog?=
 =?gb2312?Q?cix:_add_OrangePi_6_Plus_board?=
Thread-Topic: =?gb2312?B?u9i4tDogW1BBVENIIHYzIDEvMl0gZHQtYmluZGluZ3M6IGFybTogY2l4OiBh?=
 =?gb2312?Q?dd_OrangePi_6_Plus_board?=
Thread-Index: AQHcfU9MA9pbVtmtv0ykgDJk1l8qrbVDPd0AgAAFxICAAAbEgIABSZcw
Date: Tue, 6 Jan 2026 04:52:35 +0000
Message-ID: <PUZPR06MB5887263D5B0A6DB373816925EF87A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20260104075400.1673101-1-gary.yang@cixtech.com>
 <20260104075400.1673101-2-gary.yang@cixtech.com>
 <20260105-excellent-uakari-of-joy-f0dfa4@quoll>
 <PUZPR06MB588755A9FB6B42AAA870E30BEF86A@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <63454553-01df-4c40-aad3-7ea64bef685e@kernel.org>
In-Reply-To: <63454553-01df-4c40-aad3-7ea64bef685e@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|JH0PR06MB6414:EE_
x-ms-office365-filtering-correlation-id: 96833ccd-bf92-4a4d-b277-08de4cdf68c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?gb2312?B?c1hjcjlPdXpLaHJFTXU5Vm5nNnpuZEc4OFZ4eWlnOWc4ZWE5ZkR1REJsQkFl?=
 =?gb2312?B?RWRBM0xST1dpakhSWkpPa0RpNStWcHR1NjRPL1Y4VHpsVmRkMTNoTUhoRWdX?=
 =?gb2312?B?LzU4WHdZRU94MHRjRGlhV3hBRG0zaENCV1VaMVF1TWtmcm1HM0U1M3VIbGhJ?=
 =?gb2312?B?dWtxTVYvWGF2L2xRd2k5cnBCMDZxWGFRbmswSXpRTGFMYmk4TC9xdkx2aGxw?=
 =?gb2312?B?clorNGVhTjJuUHFseVNqQjZ6NmcySklCWWRtczZpUmlZcHNKSnBsNnlZTSth?=
 =?gb2312?B?VUlHN0xqT0pET1ZZS3gvT1BzK0JXTWJ1SU5pNWpUK3EvY1FodzRaK01oQ2hs?=
 =?gb2312?B?RVhiMitGT000YjMyMGM4SDZraE9Xa1htVjVFb2Zid1daSXRhZzJrQy9OV2xX?=
 =?gb2312?B?NncvVXc3aVlkbWl5di9CcldJM0hiZjZEelRpdWNQVHVsRUdHb2JCbTJ1N3Nn?=
 =?gb2312?B?MWtSeXY2dkRKbytUQjFvWEw2bUxJL1l5UlBzc1BKZXhEYXlucUEraFFGalo0?=
 =?gb2312?B?ZGJldWdkWlFnaThaa2NaWWVzVEFEVlZCWkZ3OEx4YnJwR0pFczZNSmRVZ2lz?=
 =?gb2312?B?SGZJZ1BOVVc0cDhWck9tWlZYajhTZ1M5V2VJN09JNkNmcjVoVGxzeVhHMEVD?=
 =?gb2312?B?K1lYVUQraWZDNWVvQllvNFRldyt2SCtBY0ZiZjlJcnJYRWkvS0VLekdkQytJ?=
 =?gb2312?B?NjdnOHhtMFVwNlFRN2hMSjVLOXNLTnpZK0F3VXF3TG5Sa3d6UW1URTYwVmRH?=
 =?gb2312?B?dDFIYjAyUE0ramxtKzNxQjNKNEYrYjk4Q1FNQnpSRldOVEE4bG1JOG5XcTZj?=
 =?gb2312?B?ZEhIUlhQeTZseHZZbkpVZHl4RzVDS1YvaEdyV3VHcnoycFh4QUFvc3RJU25E?=
 =?gb2312?B?UEdEQ0N6elZpUlJDODh1UWI1Yzl4bDNzZ3FscDR3UkhOMktJeGZWUkVPOWdX?=
 =?gb2312?B?YWtySUUvbDBUSzB6bGhwRjZrMDVGL3RpUVN3akZROVk4L3AzOUFOVDJMWVRN?=
 =?gb2312?B?a2ZlY3pFVWZNaC9KMU92UTlJeXpjUGdveVVpR0pHWFE4aklFam56ZDNxK0Ev?=
 =?gb2312?B?UFRpUXA2NDZiVEZsSTc0WEY0dnJsTEFxNksxalpTeDNyNjdESFZ0bHNJeHky?=
 =?gb2312?B?dmVEWnlqbnJCR2dsajArYXZvSk9jY2xEQjhybjFzYUlnM2pLRzBxM0s4TjN5?=
 =?gb2312?B?NkxtMCtLcjlhcHVLaVhYbGhBUGkwL0wyZjBuNHd6NFBFNmlWZXRNK1hvYnF4?=
 =?gb2312?B?TkxDVGlxSFBYMlRzT3YvWFZsSC81UmwvZm90ZjQ5K2duUEVRdThqdlp3L2Uz?=
 =?gb2312?B?dVhIcU8yQUhxbldpWlpNUWRSdlhsQk9QdFVRZk9mSFNzY0pnZTNnUGw2YUY0?=
 =?gb2312?B?NTFVWS91ZlZYVE5xRDRUZkJuYUpqMHVOTEIzbXdyZzJ5ZFhjdVF3SWZnVTdS?=
 =?gb2312?B?OGhSbzAxVWpEOEQrV3lyd2Urc01PTVpGUkdZLzdGWUdYOEtKWVQ1c2ROa1I5?=
 =?gb2312?B?am41Nmd1em1EQk16Z25laTg4U0xpUWtDSjhic2Fta24yNExLMXRKR2xuekN5?=
 =?gb2312?B?cE1qMVYybGljTXdhajNsUmpJSzlHMTdYSUxjYlJRajVQQ25qeDI0RG9oQTdm?=
 =?gb2312?B?dWQyREowQy9FTW9iY3NsdktDK0NDV3pyQ0w2Y3lIMXpZUm9jVUZYbHc0VVgy?=
 =?gb2312?B?c0RSanhmWjRXbUVYUkxUSlR4Z2w5SHEyZ2NDbDVxWHl5RGN4eC9LdkNpMzFB?=
 =?gb2312?B?aXRmZ0MvcmZiZUQ3SWhWYVBSSlAvTlU2SlZuWkdpV3ZRU0tqUnFUWVlDN05H?=
 =?gb2312?B?TzJURnkzei85bUhKWFk1NmdKUy9uT01vdWh0NVV6YXZyanRXalJ1TmlJdk03?=
 =?gb2312?B?Z1RBZUxBNzFNZkFFWW0yZHdrREZjL1FxeGhmR1VCeDVoOGJFSWpTODBKcVcx?=
 =?gb2312?B?VHBWMVRrMVVFUHpFVnVjOXcvY2htdTBOSFFBNUV5MS9GNUFqR3pmYVBORDlW?=
 =?gb2312?B?dSt4Q1FjVUg1RXI4NzQzR3NaYlA1TjU2YUFXSmgvdDUwUDRuWFJBOUlqM012?=
 =?gb2312?Q?llwYx6?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?aFQzS2tTekZWSS9xT201M3VTYWNsR2svUWYyL0VrS1c0N1huVnkyZHVKSlJR?=
 =?gb2312?B?cmR2TFhZSEVxVlVib2x3aWEvT004SUh1VVV0dDVKcDFwaWc0VzREendCTG1o?=
 =?gb2312?B?cTk4dWo2WENzeXlueHNhKzQ3aEgxL1lIeUJxajFwaHE3VjZGVG9IcFhOekZm?=
 =?gb2312?B?ZWF4UFFidzVidzBOMkNiUk15S1AwUVp6a2FjMXJrUE1GaXpQbzVRK3NubUpz?=
 =?gb2312?B?cEd0UGtWMHd0OTlKYUdRQTdjakNqMm1WbVgyQ2pLdzdqNktxNjY1dG9SVW9x?=
 =?gb2312?B?UWwwakpwTldtNUhJOUk5N3FEa1BUelBMMVlXLzNtWGdmdnVMdGxSVXpCRVZL?=
 =?gb2312?B?cCtUdE1ONG1ETWFZZ2pTd0ZwZmYxS1BEdy9wVHNwRytwUFdNWTc3dXo5Ukds?=
 =?gb2312?B?OVhFWS9WN3Vob3EycTFyZVZ1b1dmZ2RGclMyU1NLeXNFMm5rYXBnK0Q2djA5?=
 =?gb2312?B?dFFld0RLYTFmRGNaZGZVNVF2cGx0cjltcW56dWtPeG1GdTlzWXVleXBkdG5k?=
 =?gb2312?B?OEUxRG5ZaEFURVNnaGoxaWFDdXJjQnFmVGUxTXVSS3FteGVQMmgvb1A0b2NU?=
 =?gb2312?B?dWJac1JxamRTOVhBV3BKdm5sTTBBOEdNaWhKakFiM3dsQ3RrOU5VVjk4WVB6?=
 =?gb2312?B?b3BHMFpDWFcvRW5oVlc5aVYrS3RiZHRsZDB1MDZCcE5tRXI0SVd3SUhRSDhO?=
 =?gb2312?B?UzRkR01WZ1FMVHQxalZCeUVlcEtlS3dVeDJRbTRkR2krVEFuNWdyb1k0alo1?=
 =?gb2312?B?YnVVOFB1TE83Q1hYUFpZZnRwaWhTays5citUQjNUak1EVTVJbTZWdmZieUFq?=
 =?gb2312?B?ZTNTeWZ4V1FsNmpjV0g3ZVpqeGZCblRzdE9tNHNLM3BQN3BZQnZiYTMvZ2xr?=
 =?gb2312?B?REVpRkRiSkRBR2dnc1pUN05ZWFJkTDZJRzZvNC9rc0pYRWxvbWdTQkVEV1Vl?=
 =?gb2312?B?UG01bElSWkwrN1pMZjI5Y1pBbTIzbWZCbEk2TzZOWVNHR3R2aXJNVGMzSjFk?=
 =?gb2312?B?bnljUWZnNCsyNFp1M3dNVUxMTXBlbU05Q0YvOGFkQzM4UGNseGZFRlFLVG5t?=
 =?gb2312?B?YnpDK2Uzc2FkYlpWQ01meEsvTUR5K1ZtUUJjcFRQR0JKSkZ4Mk1sbHZHU1l3?=
 =?gb2312?B?Y3oyRHVZbjJXeXc1enIyUi8xdFllZHpBOU5zb0RqV01PUDlJTFJ5RGh5dXJh?=
 =?gb2312?B?OUtDQ3QvOTc5b21kT1NuRDNwU1BpVXV4bDBZcjVPWFZrS1hyb3ZRRWFrMGxv?=
 =?gb2312?B?NzNEWnpZc2R2YmR2MXAxNzRmeTBRLysyN3V0VmprZ05XeGhaV25rU2NXaWM5?=
 =?gb2312?B?ZlB3Yk5OSXpTN2U4dUEvWFdqU0NncERUczA4QjJ0aHR2STlib2FqZnY2RXVv?=
 =?gb2312?B?cDdUeElWSzR6QVNBZGNDMGp0bzNWVlRCSlZabFRLbFdkM2EzUnJUQlZ5NVZL?=
 =?gb2312?B?eEUrQjY4UGptaEd2dURYRk9WazNWYzNwdXpIanpkTHJRUmIzeHEvK0ZRNXB0?=
 =?gb2312?B?VUJGeWRETE9RYlo0dnhaaUtuMGprdEpaY2V5eUhnaVlUNnpoSS9WSmZ3TzVR?=
 =?gb2312?B?d3A2amc1cmY3MnpoMWFWMWExbFJFQmRWb0s3c214OUZNZE44OWZCMVZHZk1m?=
 =?gb2312?B?cXBLUlV3VFVpY2hISlVabm11NEN2VFc3WHR0aUF0ekYyWHJWbVBDd0JjcCtJ?=
 =?gb2312?B?UG5qWjJ6SGpWY1UvbW1sdThHOEd1ZkdHbm1sMEtjNmJGWHFTeW1CSkR4VlEv?=
 =?gb2312?B?b1B3VnpYMG90Kzh5dUlFbi9TRmxXNkpFdVh5aTg2UHRwOG9QWTNJT0tBZUFj?=
 =?gb2312?B?bVo1SFY0KyswRE9FZGszRmgxTjJObTVEWHBvNHZmSk1rZnJtaTdxK29BTlJI?=
 =?gb2312?B?WEZhZnNjMkpnQjNRY1lDVXZGSnF6WjdrSEJvak05c21RQ1JRVGpMcVA3eXlY?=
 =?gb2312?B?WEFTeTVTbXRxQUVUL1l2UnJscVRvSUFQM0UvNUVVUDYvVE1xSVMrTzVRQUov?=
 =?gb2312?B?WU9oclpMcDhrY2Q2VzY3ekM1eEJPUVhOOXhLNWUzbnJXbWpFKzJncDNjamRr?=
 =?gb2312?B?S0N0NWJKdnRkV0FOQzBKeldQM2E4aWMrVWc1OXNMdlZzS1JHWXJLU3FmcW1u?=
 =?gb2312?B?V3YwWUNDTkpzSngwQmh4REFBUUlZNkNNRVFTbUNlaFpadUNOL3N2WUZISXpk?=
 =?gb2312?B?T3NmbmU4SGtkNXZsNXNtd1c4aWFtSFBVb1YrTWFnR1FtUXFrRlorcmQrSi9K?=
 =?gb2312?B?blM2bW53aGNmUERQNlVWWVEzSjM3RDR6eWJhZGF4eG04K2RxZkVidTVmbVNV?=
 =?gb2312?B?enVNSkozbmRkUjVJTDJnRk9wc3g5VlByZWtLMm4vYjVCRFQ1MWZ5dz09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96833ccd-bf92-4a4d-b277-08de4cdf68c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 04:52:35.2368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhCEj+heVp3KR1qk65C29LONM2yTNvVcH5X+EU4lnwQtJusuAANdv+oEJfDhLEmYcuJY+GMgm+Pm/N047eIwaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_205241_899772_CDF79925 
X-CRM114-Status: GOOD (  30.09  )
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

SGkgS3J6eXN6dG9mOg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCg0KPiBFWFRFUk5BTCBF
TUFJTA0KPiANCj4gT24gMDUvMDEvMjAyNiAwOTo0OSwgR2FyeSBZYW5nIHdyb3RlOg0KPiA+IEhp
IEtyenlzenRvZjoNCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cw0KPiA+DQo+ID4+
IEVYVEVSTkFMIEVNQUlMDQo+ID4+DQo+ID4+IE9uIFN1biwgSmFuIDA0LCAyMDI2IGF0IDAzOjUz
OjU5UE0gKzA4MDAsIEdhcnkgWWFuZyB3cm90ZToNCj4gPj4+IE9yYW5nZVBpIDYgUGx1cyBhZG9w
dHMgQ0lYIENEODE4MC9DRDgxNjAgU29DLCBidWlsdC1pbiAxMi1jb3JlDQo+ID4+PiA2NC1iaXQg
cHJvY2Vzc29yICsgTlBVIHByb2Nlc3NvcixpbnRlZ3JhdGVkIGdyYXBoaWNzIHByb2Nlc3NvciwN
Cj4gPj4+IGVxdWlwcGVkIHdpdGggMTZHQi8zMkdCLzY0R0IgTFBERFI1LCBhbmQgcHJvdmlkZXMg
dHdvIE0uMiBLRVktTQ0KPiA+Pj4gaW50ZXJmYWNlcyAyMjgwIGZvciBOVk1lIFNTRCxhcyB3ZWxs
IGFzIFNQSSBGTEFTSCBhbmQgVEYgc2xvdHMgdG8NCj4gPj4+IG1lZXQgdGhlIG5lZWRzIG9mIGZh
c3QgcmVhZC93cml0ZSBhbmQgaGlnaC1jYXBhY2l0eSBzdG9yYWdlDQo+ID4+Pg0KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogR2FyeSBZYW5nIDxnYXJ5LnlhbmdAY2l4dGVjaC5jb20+DQo+ID4+PiAtLS0N
Cj4gPj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2NpeC55YW1sIHwg
MTEgKysrKysrKysrLS0NCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2NpeC55YW1sDQo+ID4+PiBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vY2l4LnlhbWwNCj4gPj4+IGluZGV4IDExNGRhYjRiYzRkMi4u
OWUxMzJlNjA5YjdiIDEwMDY0NA0KPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9jaXgueWFtbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9jaXgueWFtbA0KPiA+Pj4gQEAgLTE2LDkgKzE2LDE2IEBAIHByb3Bl
cnRpZXM6DQo+ID4+PiAgICBjb21wYXRpYmxlOg0KPiA+Pj4gICAgICBvbmVPZjoNCj4gPj4+DQo+
ID4+PiAtICAgICAgLSBkZXNjcmlwdGlvbjogUmFkeGEgT3Jpb24gTzYNCj4gPj4+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBSYWR4YSBPcmlvbiBPNiBib2FyZA0KPiA+Pj4gICAgICAgICAgaXRlbXM6
DQo+ID4+PiAtICAgICAgICAgIC0gY29uc3Q6IHJhZHhhLG9yaW9uLW82DQo+ID4+PiArICAgICAg
ICAgIC0gZW51bToNCj4gPj4+ICsgICAgICAgICAgICAgIC0gcmFkeGEsb3Jpb24tbzYNCj4gPj4+
ICsgICAgICAgICAgLSBjb25zdDogY2l4LHNreTENCj4gPj4+ICsNCj4gPj4+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBYdW5sb25nIG9yYW5nZXBpIDYgcGx1cyBib2FyZA0KPiA+Pj4gKyAgICAgICAg
aXRlbXM6DQo+ID4+PiArICAgICAgICAgIC0gZW51bToNCj4gPj4+ICsgICAgICAgICAgICAgIC0g
eHVubG9uZyxvcmFuZ2VwaS02LXBsdXMNCj4gPj4NCj4gPj4gUHJldmlvdXMgcGF0Y2ggd2FzIGNv
cnJlY3QsIG5vdCB0aGlzIG9uZS4NCj4gPj4NCj4gPj4gPGZvcm0gbGV0dGVyPg0KPiA+PiBUaGlz
IGlzIGEgZnJpZW5kbHkgcmVtaW5kZXIgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4NCj4gPj4N
Cj4gPj4gSXQgbG9va3MgbGlrZSB5b3UgcmVjZWl2ZWQgYSB0YWcgYW5kIGZvcmdvdCB0byBhZGQg
aXQuDQo+ID4+DQo+ID4+IElmIHlvdSBkbyBub3Qga25vdyB0aGUgcHJvY2VzcywgaGVyZSBpcyBh
IHNob3J0IGV4cGxhbmF0aW9uOg0KPiA+PiBQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5
L1Rlc3RlZC1ieSB0YWdzIHdoZW4gcG9zdGluZyBuZXcNCj4gPj4gdmVyc2lvbnMgb2YgcGF0Y2hz
ZXQsIHVuZGVyIG9yIGFib3ZlIHlvdXIgU2lnbmVkLW9mZi1ieSB0YWcsIHVubGVzcw0KPiA+PiBw
YXRjaCBjaGFuZ2VkIHNpZ25pZmljYW50bHkgKGUuZy4gbmV3IHByb3BlcnRpZXMgYWRkZWQgdG8g
dGhlIERUDQo+ID4+IGJpbmRpbmdzKS4gVGFnIGlzICJyZWNlaXZlZCIsIHdoZW4gcHJvdmlkZWQg
aW4gYSBtZXNzYWdlIHJlcGxpZWQgdG8NCj4gPj4geW91IG9uIHRoZSBtYWlsaW5nIGxpc3QuIFRv
b2xzIGxpa2UgYjQgY2FuIGhlbHAgaGVyZS4gSG93ZXZlciwgdGhlcmUncyBubw0KPiBuZWVkIHRv
IHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuDQo+ID4+IFRoZSB1cHN0cmVh
bSBtYWludGFpbmVyIHdpbGwgZG8gdGhhdCBmb3IgdGFncyByZWNlaXZlZCBvbiB0aGUgdmVyc2lv
bg0KPiA+PiB0aGV5IGFwcGx5Lg0KPiA+Pg0KPiA+PiBQbGVhc2UgcmVhZDoNCj4gPj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTItcmMzL3NvdXJjZS9Eb2N1bWVudGF0aW9u
L3Byb2NlDQo+ID4+IHNzL3N1Yg0KPiA+PiBtaXR0aW5nLXBhdGNoZXMucnN0I0w1NzcNCj4gPj4N
Cj4gPj4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5
IGFuZCB3aGF0IGNoYW5nZWQuDQo+ID4+IDwvZm9ybSBsZXR0ZXI+DQo+ID4+DQo+ID4+IFJlYWQg
bGFzdCBzZW50ZW5jZSBhbmQgbGlua2VkIGRvY3VtZW50YXRpb24uIFdoZXJlIGRpZCB5b3UgZXhw
bGFpbg0KPiA+PiBpZ25vcmluZy9kcm9wcGluZyBteSB0YWc/DQo+ID4+DQo+ID4NCj4gPiBZZXMs
IHRoZSBwcmV2aW91cyB2ZXJzaW9uIHdhcyBhY2tlZCBieSB5b3UgYmVmb3JlLg0KPiANCj4gSSBz
dHJlc3NlZCB3aGF0IEkgZXhwZWN0IHR3aWNlLiBJbiBmb3JtIGxldHRlciBhbmQgbGF0ZXIgZXhw
bGljaXRseS4gWW91IHN0aWxsDQo+IGlnbm9yZWQgaXQuDQo+IA0KPiA+DQo+ID4gV2hlbiBhcHBs
eSBpdCwgd2UgZm91bmQgdGhhdCBvcmFuZ2VwaSA2IHBsdXMgYW5kIFJhZHhhIE9yaW9uIE82IGJl
bG9uZ3MNCj4gdGhlIGRpZmZlcmVudCBib2FyZHMuDQo+ID4NCj4gPiBTbyB3ZSBuZWVkIHRvIGFk
ZCBhIG5ldyBpdGVtIGZvciBpdC4gTGlrZSB0aGVzZSBmcm9tIHFjb20ueWFtbA0KPiA+DQo+ID4g
ICAgICAgLSBkZXNjcmlwdGlvbjogUXVhbGNvbW0gVGVjaG5vbG9naWVzLCBJbmMuIERpc3RyaWJ1
dGVkIFVuaXQgMTAwMA0KPiBwbGF0Zm9ybQ0KPiA+ICAgICAgICAgaXRlbXM6DQo+ID4gICAgICAg
ICAgIC0gZW51bToNCj4gPiAgICAgICAgICAgICAgIC0gcWNvbSxxZHUxMDAwLWlkcA0KPiA+ICAg
ICAgICAgICAgICAgLSBxY29tLHFkdTEwMDAteDEwMA0KPiA+ICAgICAgICAgICAtIGNvbnN0OiBx
Y29tLHFkdTEwMDANCj4gPg0KPiA+ICAgICAgIC0gZGVzY3JpcHRpb246IFF1YWxjb21tIFRlY2hu
b2xvZ2llcywgSW5jLiBSYWRpbyBVbml0IDEwMDAgcGxhdGZvcm0NCj4gPiAgICAgICAgIGl0ZW1z
Og0KPiA+ICAgICAgICAgICAtIGVudW06DQo+ID4gICAgICAgICAgICAgICAtIHFjb20scXJ1MTAw
MC1pZHANCj4gPiAgICAgICAgICAgLSBjb25zdDogcWNvbSxxcnUxMDAwDQo+IA0KPiBObywgbG9v
ayBhdCBTb0NzLiBEaWZmZXJlbnQgU29jUy4NCj4gDQoNClBsZWFzZSBMb29rIGF0IHJvY2tjaGlw
LnlhbWwsIHRoZSBzYW1lIFNvY3MsIGFuZCB0aGUgZGlmZmVyZW50IGJvYXJkcw0KDQogICAgICAt
IGRlc2NyaXB0aW9uOiA5NmJvYXJkcyBSSzMzOTkgRmljdXMgKFJPQ0s5NjAgRW50ZXJwcmlzZSBF
ZGl0aW9uKQ0KICAgICAgICBpdGVtczoNCiAgICAgICAgICAtIGNvbnN0OiB2YW1ycyxmaWN1cw0K
ICAgICAgICAgIC0gY29uc3Q6IHJvY2tjaGlwLHJrMzM5OQ0KDQogICAgICAtIGRlc2NyaXB0aW9u
OiA5NmJvYXJkcyBSSzMzOTkgUm9jazk2MCAoUk9DSzk2MCBDb25zdW1lciBFZGl0aW9uKQ0KICAg
ICAgICBpdGVtczoNCiAgICAgICAgICAtIGNvbnN0OiB2YW1ycyxyb2NrOTYwDQogICAgICAgICAg
LSBjb25zdDogcm9ja2NoaXAscmszMzk5DQoNCkZvciB0aGUgZGlmZmVyZW50IGJvYXJkc6OscGxl
YXNlIGdpdmUgeW91ciBwcm9mZXNzaW9uYWwgc3VnZ2VzdGlvbnOjrFRoYW5rcyBhIGxvdA0KDQpC
ZXN0IFJlZ2FyZHMNCkdhcnkNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

