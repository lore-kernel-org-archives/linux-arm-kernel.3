Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB427D4417C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpBbJsP7rmwX+qsyihWxoytFoWTF2d1HWEud8uNAEkE=; b=ijJ2STd5Ssi+cs8K8P5FRsZK57
	h+mgG+5vbuQtxqXqw5bIeO9ZF6yzVQZ/O8eV1eBUKmXGMZ4FuswuPoNcScVcgGHjQulE+v72WP5Es
	GsWHeLokldbeJMC5vlHuitkrczBCEsWanLmwxTNpbMoWHBDjGImkl8Swhv5flftRUt4Ms5hZ1tO1t
	EFkSqBQPv/jjMLpyZKVBKTb87nPILE0Nr00ZpfEpYKAhNXZJtdPbOarz01ztF+UbLUqP7tdifEsd+
	bKxWoBKhLQj7DzSNRj6K9PyZVKB6XSjmjPHrsN02buplmwb+lNQfjW/1XL8Ua5HIF73DVWUq6Mvl7
	8M2M4KMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1Lo-00000000TLX-26RO;
	Fri, 12 Dec 2025 11:30:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1Ll-00000000TKv-2mGh;
	Fri, 12 Dec 2025 11:30:18 +0000
X-UUID: eac725fcd74d11f0a52f393f94899d25-20251212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UpBbJsP7rmwX+qsyihWxoytFoWTF2d1HWEud8uNAEkE=;
	b=qc8H4QUSsZFZELPbh/JmQheE7MV5aFZJfWBdALYzF0wMnvF5XHniiwcSk/uuJh3reBET+5gftOnEdsOAdg8KCvxmB0wU72SCgi+kRH6N+QCMpmPlq0T+1DuVORAtmJCgLGxZoLaBUbP1APDU5KgF8C8z9uW15WR8H7HTsoyaOlo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:283bbb86-659b-4f19-b60a-71f0e58f4a2f,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:5c605fc6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eac725fcd74d11f0a52f393f94899d25-20251212
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1442066569; Fri, 12 Dec 2025 04:30:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 19:30:07 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 19:30:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDGLZwI87wfEpx3PUCfc4PNgG4xxkryc6zLZqTZqzMxRGhnCk1A9aDeEJJHQGibF4WDvbov+26Ag7EX7ZvOMSu3X6S5GoLTN8rPfPXdUgoC11Zl4mNp/bl9XfprQHbUHua89Nnyh7KfTzzEvSTdh9R/IfmmcvMWn0NjAC7RN3CO7HTNncuPhFMNS45r/MNiv2DGkXLmfkmBlz3jlebSAT9+TBKpTZQYnS/ZENZkBZulTDiiUqgRC3j+zwQezd/Hj1CemWrNwmq7FAjYAYkX+2kQE8Qyty7QmqDqr6ejpGoR0kDz33QCCq2zMQlko7v0PIHgb6Z2w2JeS8B4lgC/prA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpBbJsP7rmwX+qsyihWxoytFoWTF2d1HWEud8uNAEkE=;
 b=lK9SgPfV2WqwE+ZYMSo8Vnusu9uqxCI2gZwWF/wx+o8DudAU1+e+5bgmGyQab2YWyVY7bjf5Y0potqqihNRlffJk9XxYCofWu14YEGyfVTQV/WajZrbqUi7sqCsH0YegIfRe4YTlAZ/trFqTF2X0HFlTUF2mxTZcPb9ol8ft44R1tw0o/brVyLm/DZX1XM70YPb3JwgzA6vpJI/Gun39iy7f3DHtXqT1gfHaQ/WM924+N6O71nKTxhi2i2LuX37fH5xLzPJZKM1Q8ce8JTJbEcsyNBNQay11gWEc3jAZibJQF2NmJjRZxnKOg126t8jKavzE6AeTtIk0Hp4b8h7qvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpBbJsP7rmwX+qsyihWxoytFoWTF2d1HWEud8uNAEkE=;
 b=OqsGSJRfmyW4CTkzeVJsEg9QAWnx4/WSfi3iSJopnnJDmPZO8Uqh1OsC7zoYHDUmFySHcDUhiWBSha7fpud30iM/CQDXrrTogAlXWgE5xiUE3fWpJf4UNOWlZNjR8ThDXJbyyWKSmA8isxCq3rNISl7Y7L6Zeje1E3N72yXTZkU=
Received: from SI2PR03MB5580.apcprd03.prod.outlook.com (2603:1096:4:12e::5) by
 TYSPR03MB7737.apcprd03.prod.outlook.com (2603:1096:400:42c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.10; Fri, 12 Dec 2025 11:30:04 +0000
Received: from SI2PR03MB5580.apcprd03.prod.outlook.com
 ([fe80::e57f:afc5:49cd:45bc]) by SI2PR03MB5580.apcprd03.prod.outlook.com
 ([fe80::e57f:afc5:49cd:45bc%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 11:30:03 +0000
From: =?utf-8?B?WGlhb3NodW4gWHUgKOW+kOaZk+mhuik=?= <Xiaoshun.Xu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"xiaoshun.xu@mediatek.corp-partner.google.com"
	<xiaoshun.xu@mediatek.corp-partner.google.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?=
	<Sirius.Wang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>
Subject: Re: [PATCH 0/4] *** SUBJECT HERE ***
Thread-Topic: [PATCH 0/4] *** SUBJECT HERE ***
Thread-Index: AQHcaxWpnVQBsTnIuEWMHAt4fF5DXLUd3yWA
Date: Fri, 12 Dec 2025 11:30:03 +0000
Message-ID: <29107c86bffb5107eb6740444b9de97bd6606e90.camel@mediatek.com>
References: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
In-Reply-To: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5580:EE_|TYSPR03MB7737:EE_
x-ms-office365-filtering-correlation-id: 974f768d-7c24-4e59-3336-08de3971cb4c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bTBsUmI5cGNTL0dYOFhVNm1CS1dkVEZBMWwyaGh6bnVvMjNFYTdSb0VnWnpS?=
 =?utf-8?B?WlU3OHVYWXNUdW9wcS81VGsxVE1Yd0lEWldueHphb3ZPRVpsMUgreXZ2Q2t3?=
 =?utf-8?B?QnorTW55b1lvU0x6WFJrMlZKODJNbWdFK1hBK2dBSngvbUU5aFAvVnUzdHVt?=
 =?utf-8?B?ek52cDV2YTFFTW9nMC9USlU0V2VTM0NQWEgyVHZGRjdQMGpMYURnQXlabU1y?=
 =?utf-8?B?THJiYXQ2eFQ0OGlhZEdxb3FhQk11YlJIbXB6UGJ1VDJwNlNud2FWQmR1bXNN?=
 =?utf-8?B?eURRQWdyam5tSU1ieGtHeFREdmJrUzhqQnNUbVhCTU5PWmFaN1RZaHhMYjFu?=
 =?utf-8?B?MFRCV0ZTS0dKSTlIeDhNN2lORlNEeGNuR1FyZlY4bUpyYkdsakx5OEg2djJI?=
 =?utf-8?B?WGlGMjEzZ1NEdzRMcG5OYkNPcjFPRXF6MEdBRHg4Mm9ObVpNLzdKNmlUZWNR?=
 =?utf-8?B?OG0rcnNRbFRSOGd2SGloVTk0c1FNOHdtMFNIb3pzZjBoaVhFYkpLbHgwYTVy?=
 =?utf-8?B?bkxTdXNHbTBzZFEzc3k4ZGpzQ2xPUWY3eTF2OCtMZzU3UU9TM0ExSHowcENo?=
 =?utf-8?B?MWxNTGlBbVFwMExXS2IyTFIrTUZQU09EZnNJWUFVTm9HSVJzNGdJNFVyNTBI?=
 =?utf-8?B?RnV2bmpobklhLytCRHFzWEkrQTlDaUlBUDdHVkwvMC8wbjQ0d3p4alVNZDRX?=
 =?utf-8?B?Z3R2Vk95ZVhmL0hzMFZDMGFGdmhzejMrRmJTQXV6UkpRTmJEWXNHdDBBUzRB?=
 =?utf-8?B?SjllUTZwZE5iL2d2TFowSEdrcjV0K2h4UTNUK3hpYno0Y1J0MkNkNHA0Mi85?=
 =?utf-8?B?Y3pqZGhxSGlFNzZaem9kMzBMa0lrQkxsUEd5OVdZTEVzWDFtRVR4Y2JkSFRN?=
 =?utf-8?B?TEVwQUhtRG45aUp6NlJwTlhScmtNeDZyUlJRVHV4eXF4VzR1YUZRN1lFMDdO?=
 =?utf-8?B?NWxPcnhocnpyWnYwdTNwamZ2ek5EYW1KampsbWZCZVZ2b1hmaU5hcVVxSkZi?=
 =?utf-8?B?NVVLYWEvYXlhOVpNcnJyei95eUJ5VktoNWlpSGIvNmRqdDlRU2ZaakFkdXVu?=
 =?utf-8?B?b2ZGVGVRU0hvT3dBOFBleWtZa3dmYVROQTlkdC83R1dKUFVFRVdXajVDa1BG?=
 =?utf-8?B?OVJhN0hzbnNVWXJwbTlWZU5YakI5VGRRcnNIMHVQR1k5emROL3BLcC9PZTQv?=
 =?utf-8?B?THN0Q1hhTVJjUHlQVDVrNFA4R0c3blBQeXA4UHBkSTJERklGM0FtRTVOVTF5?=
 =?utf-8?B?c1JRL2NRdGNiNnpVWGFZalJSb0lLdmVpNjBpcGJ2YzYveEluNUdUekFWMlRL?=
 =?utf-8?B?d2k3VlVSY1g5c2xJSzFJVngxU25wYlh4K1ZEVTN1Z2tSZVNTaGc2cytsRXRh?=
 =?utf-8?B?NFhUR2s4R2tId1V1ZGpqY0xDbkQ2aURoU1NjTDQ4bzJTcmJEeTJ0S21WMDc4?=
 =?utf-8?B?NzNNdmZCZjY0Uk9VZy94T2RpKzBpYU1DTGZOdDRWMUNVN2xwV1VJZXZCNW01?=
 =?utf-8?B?RkhnOGpWSGpQS2dWUmdzcTR1SUdvdmdsaGJGSWliczhKK3Z5NTJNZGFDQ0tK?=
 =?utf-8?B?QklRelc5YmNSSWo3S2lzdmJ1eFZ4ZEtFZDV2QmdVdUdrRjFZZXpjbWpjZDlv?=
 =?utf-8?B?bkQ4NFRjblBwSWMzOGlGV25kS1RlYWR4MjNIRTR0aGkrNDdoaFVNcU9CMmdE?=
 =?utf-8?B?a3dVcmU0YjZYeXU4eFFRd1k5YjBOTkNhYVJsWHZKSCtFelYvZFVJbHpsWWhB?=
 =?utf-8?B?Y0Z2RzVyVHZzZzhkM2s4bzA3QVBId1RYT0UvWDJSeUhiRUhib3dFUTRKQ3Ni?=
 =?utf-8?B?eU9pWkpudGowWDV2N2dYUlFwaDlEUFllakVXV3hOOFU2TUdpQW84R0N0TFBa?=
 =?utf-8?B?SGVZaXlZeEExazlNMldLMGJDeitPY3Z4T1pKdVRaM1k4TUZubjdQSFR3Uktw?=
 =?utf-8?B?VW1KZS9COXBMYjVkSllXOUNjaGlmQkJ0U1BCd1o1WlVZVER5S3VPdzRPOGgy?=
 =?utf-8?B?YSszZmF5dzJFaWpGMmJJditpcGJySmhCVVNMWmhLNldPN1FXTnhSNVRlOVUz?=
 =?utf-8?Q?+NB+Nq?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5580.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnpaYzBzQUJoRHBiL29wRlRYdm55anREU3FQaE5kRDFYN0thVmdKSFJvU2dr?=
 =?utf-8?B?Z05QbGtCYnBHY2c0eGtvYUJvMGVHb1hneTg2M2crK3A3MFZaQ01FSG5sQ0xO?=
 =?utf-8?B?bzAwMGVyMUQwWE1mMUMvU25qK094aThBS2FodWFmUlhRVC8xSHk5RFNLNFR0?=
 =?utf-8?B?dXJ3SG4xZEVrV1dPa3lJT2Y1Z0tSeUd6V1FsUmV1R0F4U0MxVG9pS250ZS9z?=
 =?utf-8?B?TTFGdi9wdmV6OE9xUytXa1ZPTFYyaGt6WHkvbDdjUDFGTzFmZC9KOVlxRmtV?=
 =?utf-8?B?dENMbS9kS3ZGNnFhL2d3dG11ZEZZR3lrcEZxQkxrb3haQWRmU1pLUG5GNXVs?=
 =?utf-8?B?bVc3VDJQUGZnQ3JJYlp4STJJOEtOeXVkWDU2dW8xYzFUNjh6cDFLeU1NTkZI?=
 =?utf-8?B?YU4zUlZnT0lySktqdm5ZRVZ3T2tJSlhVYzJjdW1STVdndDQ0c0xTM3czZnlR?=
 =?utf-8?B?V0xydEtjMFFTZjlxcW1zMnRNUEc4bUtHTFV4VThHb3c0d3llTStHSzJxd2Yy?=
 =?utf-8?B?eENjcVFDTGs2U05ONmxmWTg5Z2oyZVRocW9GVmd5dEpjT2RrLzV3QlR3Y0g2?=
 =?utf-8?B?RmRIbGUyYUxHbTREbGJlNENVb21WVHI5V0N6eCtwYnEyclBESmRLSDl4bEdj?=
 =?utf-8?B?NnZONUNrb25VZE9HUEFsc1dYcGdVNHNNd2R5bmxBWkFYWDZVbTBxN2lIcVlF?=
 =?utf-8?B?OEdUNDNuQmtxYlROK0Z6d01wc3RhZmJnMGJya2xuSXYzb2JUMVc1MGxvTElt?=
 =?utf-8?B?Qm04bkFuSklFSmNNaUNoU0YyeWc2WWNiRnMwYTRWbjBPa3A1VkFzMjg1d1Bo?=
 =?utf-8?B?TXBNdzJEKys0Z3dqQk1iT2VBVWxoMElDRXFna3JRbFY4MThoMzVMc2lGbTFt?=
 =?utf-8?B?THZuVS8xL2FTVkQwNVRMVXo2cSsyR2l6aUVNUGoyVlY0bkZLQTJLdkIvTjF0?=
 =?utf-8?B?dXh6TlpCcWVnQXNWZVB4K2p3TXdkRThlS2ROckIvekJhdWVGald3Uzc2K3ov?=
 =?utf-8?B?TGlnYk1XQWZYc293SzlnYXJtZWJPUWxMSFRGdW1vQW9rRjM5aUZwMTZHMlJV?=
 =?utf-8?B?SmdEeG1iVkwzL0NrNjl2SC9TQ29BdkdFZDlIZFU1amhYdzBYcHVRVnM1Q0Jm?=
 =?utf-8?B?Mklqd08rS2g3RWhrOFVsZGcyNngwd3NQOUFncXljSWRnckFDdGREQ1lveXdH?=
 =?utf-8?B?NzBYWkcxVjhCQ2ZQUUlVTTF3SUw5eWxoZXlzQjFFeklCcGNHSDFaUGZkck1F?=
 =?utf-8?B?eUJnWTBwRjBHOFI4THlQTVVHTXZpUkhSTm9jcmtodnA4dXF5dUgwYmF6VUNp?=
 =?utf-8?B?RW95a2d0SlczOXRkVVZiUG5MYkc1TTlIOVlhMTQ4aUlla3VjSzhud05ObCth?=
 =?utf-8?B?d09HVEpjNTMzUHFNYkhLK1RvdUxtSHFKOUs0dEJlbjZlWG9XQ0dZcXVBUkt0?=
 =?utf-8?B?UUY2bVVSeUxucHFGSlcrQW1iQTNmT0JHQXNpZHFDNjZ1TmtYWHlWNW9UY29M?=
 =?utf-8?B?MUJ2MDExQy80Mzl0VlVROHE2eTVwZEVFVWhnNjRKQWE4REZYdmt2eU1YVXJG?=
 =?utf-8?B?ZmVlRGhLc0o3UDAyTlk4Z3hMcXZncHdsNGlVZEpSRC9GSCtoNTlKRXVxakR3?=
 =?utf-8?B?SWJQc3MxQytLT0VOeUJQSjhrNEFWWDhyS2NEWmg2V1Flc3Zha0JGR2xhL1BP?=
 =?utf-8?B?a0ZKb2FpalBnREk3aGg1elh3dUM3N3pWcGRDaVVDb2daVkJVNHBnOHkySSt0?=
 =?utf-8?B?TFdEQWd3V2xMaGxadzBZaHVNNEZ5cGpJT0plYzZia0tsZi82UDJuVDN1MGpi?=
 =?utf-8?B?NDZMdVgwTyt3N0drTldvNmtmU0JZRlZZTXJ5OThtY3lhcXNMVXpJTjZnV3NM?=
 =?utf-8?B?M1ZheVlBR2JXWkFPc1RTY3Nsb0RJcnZzTXlYWUlXcVBXVUl4V3YvWmp3TmxF?=
 =?utf-8?B?Vlk3eXdBRjkxVXVGTnFVcHBNRC9BeWdjQUdMNnVETEN3YjJPckRQMnF6c3Bm?=
 =?utf-8?B?TXFFVXJzb1hjTEpGUUpkZW01NnZaVXRjUWx0K1daSXZLL2pZSDB3SkZjdTlr?=
 =?utf-8?B?YVQwMkNSYnB6TzVMUG5vRWpSN1ZXazZnZko3U1BObnBzT0w4alA2MzJhWTJz?=
 =?utf-8?B?ZmJxd0dwL2M2UmpGQmdBeCt0MDI5ZmovY0E4RTJmRlcwSUVvNjEzQVlTNkdZ?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <166F8DDA23CDC34ABA10D6923B432567@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5580.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974f768d-7c24-4e59-3336-08de3971cb4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 11:30:03.7987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DFKuteaZgdwC9ldNiWYgJFA3Ksvjq8f52bV/23kPX2ciXGeun7J7Ge+jxgABExZ51qBF+xzCVHTb0cg0Bm2si6nBQg4DabOq2ZBHNUIlHW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7737
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_033017_720566_C4226C08 
X-CRM114-Status: GOOD (  11.86  )
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

T24gRnJpLCAyMDI1LTEyLTEyIGF0IDExOjEzICswODAwLCBYaWFvc2h1biBYdSB3cm90ZToNClNv
cnJ5LCB0aGVyZSBhcmUgc29tZSBtaXN0YWtlcyBpbiBteSBwYXRjaCBzZXRzLiBJIHdpbGwgcHJv
dmlkZSBhIG5ldw0KdmVyc2lvbiBsYXRlci4gVGhhbmsgeW91IQ0KPiANCj4gRXh0ZXJuYWwgZW1h
aWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwN
Cj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0K
PiBGcm9tOiBYaWFvc2h1biBYdSA8eGlhb3NodW4ueHVAbWVkaWF0ZWsuY29tPg0KPiANCj4gdjE6
DQo+IDEuIEFkZCBkdC1iaW5kaW5ncyBjb21wYXRpYmxlIGFuZCB2aW8taWR4LW51bSBhdHRyaWJ1
dGUgb2YgTVQ4MTg5DQo+IDIuIEFkZCBzdXBwb3J0IERFVkFQQyBvZiBNVDgxODkNCj4gMy4gUmVm
aW5lIE1UODE4OSBERVZBUEMgY2xvY2sgY29udHJvbCBmbG93DQo+IDQuIFJlZmluZSBNVDgxODkg
REVWQVBDIGludGVycnVwdCBoYW5kbGVyDQo+IA0KPiAqKiogQkxVUkIgSEVSRSAqKioNCj4gDQo+
IHhpYW9zaHVuLnh1ICg0KToNCj4gwqAgZHQtYmluZGluZ3M6IHNvYzogZGV2YXBjOiBBZGQgZm9y
IHN1cHBvcnQgTVQ4MTg5DQo+IMKgIHNvYzogbWVkaWF0ZWs6IG10ay1kZXZhcGM6IEFkZCBzdXBw
b3J0IGZvciBNVDgxODkgREVWQVBDDQo+IMKgIHNvYzogbWVkaWF0ZWs6IG10ay1kZXZhcGM6IHJl
ZmluZSBERVZBUEMgY2xvY2sgY29udHJvbA0KPiDCoCBzb2M6IG1lZGlhdGVrOiBtdGstZGV2YXBj
OiByZWZpbmUgZGV2YXBjIGludGVycnVwdCBoYW5kbGVyDQo+IA0KPiDCoC4uLi9iaW5kaW5ncy9z
b2MvbWVkaWF0ZWsvZGV2YXBjLnlhbWzCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYgKw0KPiDCoGRy
aXZlcnMvc29jL21lZGlhdGVrL210ay1kZXZhcGMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDE3NiArKysrKysrKysrKysrKy0tDQo+IC0tDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxNDQgaW5z
ZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjQ1LjINCj4gDQoNCg==

