Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6AED35688
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 07:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3Ym4+4MyayGEZhAOcCDA9kqEF31XKM8h5sIG1pEUp8=; b=orQv2vF8paJVJWm5Lz/VHZj5v9
	KdaVzUaJ4KVBruheuIU9yoqEHm7690Mt82KjM1UQ/J9qt40btJ4HvzmXdVZKHc+YSsw22bTZllQpt
	wTaJXF7iH76jmsCduPZxZXXGn9ldUSczlUMQhS6BSrgRDGfVSK7ws7W6bq2AyiRqKFbTW2dQ3XXCy
	gq2zBq6UPTVEqK6MbOITXQMszgoeEel4aa9CCEsz5/mSTcf99JV7RRexYj6nfm5G9skiHTmdjkQ8X
	KUMS0G5bJnhI44FENWZ4zBU33ozYN16ZFrSGe1z9qZmkcWJmx1/HPmWHUcuQrOKRAqUTBS9dQS2sI
	/jHCEYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkzni-0000000FYxC-3BoU;
	Wed, 28 Jan 2026 07:17:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkznf-0000000FYwl-1RoN;
	Wed, 28 Jan 2026 07:17:17 +0000
X-UUID: 4d34617efc1911f0a16f0188aa809bee-20260128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=L3Ym4+4MyayGEZhAOcCDA9kqEF31XKM8h5sIG1pEUp8=;
	b=c11myEmVSrJ082gapQ4eSVOe21t59Gu5g7n0i9hKKRwk0Ithq9Ixnq7ik0Ko4OkUdzpG2vfp7exUKWHw/MINKit+tXKgh1yKMONFAYoKlLpKW5fx89tvXZbzsgzS79h2URKN6qzm51ofmpvJxG40+3a9bTnb9Pk2IvXy/bfJh1s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f221ef60-ddbe-45d6-8e41-b631945ce53f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:1373a65a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4d34617efc1911f0a16f0188aa809bee-20260128
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1194840036; Wed, 28 Jan 2026 00:16:44 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Jan 2026 15:16:42 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Jan 2026 15:16:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3ZI7eR3DVckWqFATppxLcmif9jH5KmswQKlYmtkZ49DNUNcHtB0KQ2Rxo5SlqQVr1Yd6RYcFcWUJ19ahCwFXGJiJVe7VnJCHhBIhupMbEyAnGv5yC9ofOHIFBi8mzEKn149aCvV+NXyJSIu0KQxW8mtG6Lc7PRYh8kfu4m8WVkA0Zj+c3y7sFWJeKT1iYTi9KqnA6SgpNrvkLS1gYTbBKIEUMYA6SrskhpTGqlllaMFqb9jbcIlpLs9PD06zDznknSsG7p/S3HXCLAQsfSgWh4RFnLilrk55bRukyvh9XX954cHd8W0OSEhgIPf0OFuqt2l1RLRpQN9Ju0WbCogbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3Ym4+4MyayGEZhAOcCDA9kqEF31XKM8h5sIG1pEUp8=;
 b=dhK+D/SYVKwG1e8wq9JGy9PTvzpki4/mBsPc4WPsC1gDXUXou7APQxtOviNB1tWARpbxe0m8ucFFt4epKgU8MDLZ8Ropmm7LSsG4uXYrdaH28NmUL3G8ZPk/6NkryWyXZLS/DYdQ5amH+jZ7+PF9UyqXt5MNpu3z1l35V2KPNfB5iriS4Zsd1/CQlWrs0U3qqv4dcwMzo5BiUM/Fd81rYuvEwee5oEBFPBYKixYPEOUX7lZbY0lkIXtkw8GNlrAMVRwbMrLjSsQLBCCMFlzEjzyN1iWrswz6vUcnUlinPuaH4DqErcWV1Egzu6N+rSSClh/vt87PdxFg/FPlnuG9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3Ym4+4MyayGEZhAOcCDA9kqEF31XKM8h5sIG1pEUp8=;
 b=vaAYe80fvPcA9u/AajYDDhg5P4bXGwdeSvrOSTluMxMcLiXQM3Gx5Zt+pqIBuicYTRQezMX+mgNSW/Yw/wo20NseA0jz6urPHHynJYCluXi5AbFGQRChWyBnOBB0Ul9BteoLM4yKk5WQqLdO4KwCRyblaL+cmJg98Mmxqvh1KBo=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB8580.apcprd03.prod.outlook.com (2603:1096:101:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 07:16:36 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 07:16:36 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"yunfei.dong@mediatek.co" <yunfei.dong@mediatek.co>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>
Subject: Re: [PATCH v7 03/10] media: mediatek: vcodec: add decoder compatible
 to support MT8189
Thread-Topic: [PATCH v7 03/10] media: mediatek: vcodec: add decoder compatible
 to support MT8189
Thread-Index: AQHcjzbQZ4CgNGf8DEGCoQ2SYmAVj7Vl7JaAgAFBDQA=
Date: Wed, 28 Jan 2026 07:16:35 +0000
Message-ID: <fa37c94f39b18f7033e878a2d1473cd68a7069e9.camel@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-4-kyrie.wu@mediatek.com>
	 <069a1c90-9592-41f2-8f45-707231f782f6@collabora.com>
In-Reply-To: <069a1c90-9592-41f2-8f45-707231f782f6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB8580:EE_
x-ms-office365-filtering-correlation-id: 7bcce139-d2f4-43c6-6189-08de5e3d2c18
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WmxJVGwzU0hjYkt5aDhPSzZUcGZPRHd1SlJkOXVQMXQxU0d4QWw4cm82MlR0?=
 =?utf-8?B?MmlacjhwQmtod2xjY21ocFJSZzlycHdsdWNxekZjNm1uL1dBT2x3TWthdTZB?=
 =?utf-8?B?ajZHaTF5RS9TaEsycUV2eVVDTUtINkc5UWJpVys1MXQ5YVFxRUF6eEtId3Vw?=
 =?utf-8?B?VStCVGtIcVRDcDFLRWd2Q01yYldsaDVGNWVBMlF2NEwvcEpZc1dERjVBclJv?=
 =?utf-8?B?elZQcWNGV2srQTlKMmtUNURBdDgwVUhUV0QxdWJVeXVXUERoa1QyOEZ4OE5v?=
 =?utf-8?B?akxQbjgySEJZbFlsNEhORkxFSFllYjRwR0p2TFNGOFJBTndMUDBpaDF0aGdE?=
 =?utf-8?B?aXhzdmhyd3pnRG9EYnRTSTRrN3NKQXZkZGZpRzltSDNSYk5EQ2Q1TzJVK0RR?=
 =?utf-8?B?WGRwYlN0UEZtVHVZOHhtaWlSQ0llazgrWW5HblBYaldrdTd0VjNRT1NRZjhu?=
 =?utf-8?B?RUp1MTU1NFhkNGFSQXRBWFRmV2ptMEtKOS9kdlNzSjdXUEZJNjlVODRvTXA1?=
 =?utf-8?B?TE55YTZIZUFoNkMyeEpzemNRekJXYlhsNEtOVmhQYmZZYjZ4M3ZnTThYWXBw?=
 =?utf-8?B?L2J0TzlMVFB1UmU3M21OdTEyd0w4MGtRU21GOUtFT0tzSEoyUzIzelFDT2ZY?=
 =?utf-8?B?VkR6L2trei9PZDZCMWlGbDRqK3dCTE5vOWhpMWRKL2crYm9KSDhFSlR5WG11?=
 =?utf-8?B?dW5GNGE4clhrRERRb1MrYmlEVFg2M21JRXRWV21Kc0ozWFVRejNzYUd3NmZ5?=
 =?utf-8?B?cCtVY2tzZ21PRkM2b3NmTXRnQWpjZWh0eVJacGM4U2s1b2d6ZmF0N0tzajVE?=
 =?utf-8?B?VHVvSjlYaEhvbVpLdzNvRzhib1Y3aUphZFk2VWV1Ym44bEZMR084TFVJajE2?=
 =?utf-8?B?b2xLOUlFdU50amwyQnlxL1kxWXVMdThHbmhvSVQ2VE5FSmlZK0Evb2cxZUVk?=
 =?utf-8?B?dVRjYjVqNnRCZ24yUXhuQU5zWmF2dzhwM1ZSTkRaYWR3S2N6QTh1bG14MWVa?=
 =?utf-8?B?dEEzaTlhRjFLWjZJbkFnRU9LOXVId2dPdEZKT1RjYSt4OUR4VGdZYmI5Z1c1?=
 =?utf-8?B?RE1IR0ZzTjFWU1hoeVRvZlZVdlZ5ZmRkbzZpTktGanpkbTY3TUdOdGNiYUdr?=
 =?utf-8?B?OFpVMzllN2ZsdHJxQXNobEEvT2p6Zi9pWks1Z3pDZmp2dFk3bk5KOUJwSTFP?=
 =?utf-8?B?d0R2OU53dEJFbTJKck40ZFZ6WDc0eTMrNEFIWlR0cks3czYvbVhsRzQ0VmVT?=
 =?utf-8?B?dGl2NDlyL2hhM3ZYTnhrNS8yWUVoQzNKbmt6MDVINVQ3akVNb1cweW9zQVpl?=
 =?utf-8?B?eVBhQ2J2bzA2NDkzN0pKTEdZVEdIM1VVWEt5R1o1MTFzdnBTTjU5TzV0dVli?=
 =?utf-8?B?cnRFN2tmRW5CcW9UTHVjd1FlVm1qc2hOL1hQc3RpL21HU0IzUktwK2g2L2dM?=
 =?utf-8?B?d3p6eGlMRStzdWt3RkhQV1JodHE2aCtMWjMwMFVaMXRjZWZjYjZEODlpOVEw?=
 =?utf-8?B?dy9Ba2c1bm82OEtUR09pWnhvT29XZ3czaW9GdW1IcGtjS2tSMXFMeDNSVUlk?=
 =?utf-8?B?TTFSbDMrS2w1S3lwWkFXT3dDTTdab2FpSjlLM2paTjZhRS9OSU5nWHhoMmNj?=
 =?utf-8?B?Q0t3ZG5qOHhPME93cEhuWUQ4TUljelkwTTdPMUFCSG90NU9kQlZGT2xVbXVz?=
 =?utf-8?B?Ly85OXhZVFhsL1RERWQ5TVZpUHZUeGJjb0JLVHFqVGk3SlZNbjVsS0JUQm9Y?=
 =?utf-8?B?VDNQeW95eVZ6dUFPQ0VzaVl6RnAwVXNZV3hodDgvR3hXNm5PZXhtRjBMYkFu?=
 =?utf-8?B?c1N3R0VHamE5QmZ1SHB1T1drbFA0RWl1NExnYkpsMCs0eUZmNEIrcG1NYmFn?=
 =?utf-8?B?QlpZUlZ3TlhkZ2NMbkFZVVBFM3k1U2NVUVhNTlc5YWFSTzJuQm1YbW5ienBI?=
 =?utf-8?B?OE53SThwc3pDS0lUQ1lBYnY4VTQzMHhUL0prdUhXcmtOdjZXRWF6N2FHRWR1?=
 =?utf-8?B?TUpEVWxiZWN5UW9sTllYdkpDV2p6bmp0L3Y4RWcyVXJxb201ckltejRvcjUz?=
 =?utf-8?B?M082NzFrMzExMkphNlN5V3I5QlRCZkJ6ZHNLNzRVK1puZmIxN0lRK3ozelFU?=
 =?utf-8?B?elUwaGdyNm5oTjhoeWVFN29rWkgyMGlpOVBmVXg1Vk9tcis5NHFQNUV4YVBG?=
 =?utf-8?Q?3QcmcVB9TF1zCDdZGxjnz2E5xE2wPWUu06XdtQfAsZ2r?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0w4YkdYT1pCSWZiS3ZpTXI5SktZcmVXMXZ1TEJQd05nSHFkK1JjZDlDaloz?=
 =?utf-8?B?aE44QnhySEd1OTRsNlJhRDB5elQvOC9rVUVxdDBrVkppZDZiVXdqSU10djBa?=
 =?utf-8?B?QURHRlZLYTk1WGFCZ291dHdGeGZqcVdnL1lXcVNIMEtyd21rSks4QnM5NVFS?=
 =?utf-8?B?cXl6bEpCcFNaRHJuaVpMLzd6SGZ4aFk2NzN2Sk5wQVNEUUJ0TGZxT2pUUnc4?=
 =?utf-8?B?WFIzeVE4Y3l2cnFNZHlHZkwzZ2JLUU9kdHZmaTFCcG9LWmU5YU1QeFJQNExY?=
 =?utf-8?B?cldJemVuckdTa21VdzM4bDAyR3Bob0tsbGFhUDFqZmJpcEN6OGtJTTh2Q1lJ?=
 =?utf-8?B?Zld2RHd2SXdiNk95K0FSYmxzYkwybWtBUTJWaHRCeUVxL0RDOC83TkNtN2Y4?=
 =?utf-8?B?Smh1NG15MENhaW9SSmk1cXFlSEpyZHhvTGpocFlzNUh4c2hQaUdmdkdRNWZQ?=
 =?utf-8?B?RSs5a0kwcDFDbE81QWhQOTl5MFhLMmdQK2t3aXF6Y09HMHU4NHMwNVY3ZnRp?=
 =?utf-8?B?WTVzN3g4N2kyeGdoZnZsckljTFkyTkd5VlowL1h2SzVaSVVTNVd4RTE3MjJY?=
 =?utf-8?B?dXNOZHhwVUhzeXRYaFlGWkFYdzZtNWhNc1dOTnViTGFBTmRUU0lhLzd2NkN5?=
 =?utf-8?B?UElYdHRiWksxbUhTWEtaYXlpU3BTZWFUR21GMlFxclk3OWlOb3N5c2R1ZFJK?=
 =?utf-8?B?TE5vT21JMWNPRWE0bGNqc25JYitsVi8zVWNpS21DNlFZbDFJR2JVQUJIL1Rh?=
 =?utf-8?B?S0w0UFJOQWpBSW8xN0swaFhxMWpRaHNpaC9iSXExeXpEUlFSdkhSMDBBSjZX?=
 =?utf-8?B?aE51UWJMK1NDd2EzUjZEQ2c3SG0rWXdqT3A5bHJ4Yml2dW5WSUFYSVBUTFlv?=
 =?utf-8?B?aXdJS0N0UEZsbUhsNmJ1VUNzbVJ6SmtnTytDS1lGQXNIbkM1c0ZSNDNHaXhu?=
 =?utf-8?B?cUJZYSt2a1didEhqRFdxa2hiT1F5NnM1OWlBTW5pZ0VSdkphR3hyY1RLdksx?=
 =?utf-8?B?d0tSVm5PRjdhYlRXeno0ZEVSbkpBU2p1aytzUXVXVnUwbFBIaDdsampCTmpp?=
 =?utf-8?B?ZXpvVUFhQkJDMkVlQ3QxWStYOGVrdUFFWDJUbEo0V3lUOEpTZEsyTkVpU1VG?=
 =?utf-8?B?WjFCRUNMUWsrQ3pFUDB0TXFoalkxN0UySk1DWHIxTDF5NlZadnN4dTdzVHZY?=
 =?utf-8?B?YzhpRC9laDFBM2JucmRDMlBHWGpvNEJUSFgyN0NlSXFieklGVG43SjZlOEU3?=
 =?utf-8?B?RDVGREMraHZHTk1paE8xSWRGUWtpTlhxUzJBSVBRZlVCZ0pZVGtpOE5WVW4x?=
 =?utf-8?B?d3dFS1l4ajFRTFdSNENQWm4wR20wTUMyWjNZS1M5R3NJZHk3THhwSi9tWXA2?=
 =?utf-8?B?ZC9QdFJXS1AvMzFNcXRFaVdDZy8vRytiMFNCUmpZNmZ3NXo3KzFlYS9ObCty?=
 =?utf-8?B?bjFOd3pXNnFFYjFwZjF1R1psZjZCVkFpYXd6M3ArcC9ubGpxTkVsSUVhaVN6?=
 =?utf-8?B?SFNmWkdmUC9SZWJYRUhDaU5LdEZ0Sm43eGZEVTRTNjlZSm5vYUxxSGEzcE9T?=
 =?utf-8?B?TGhKTG1OV05WL2ZEZFlWdDBzSTBGbzMrOHdZYTJBdVdmZnEzWXI3L2RtKzdz?=
 =?utf-8?B?QzlhemJ4R1RtNWlKZnltRy93cWE3NkMyQ1Y2MmFaRFZGc291bTZWVVJDdThY?=
 =?utf-8?B?YlZjTjVVbG1KY01wT0s5ZUV2VVN5VHJrbkx4cHBUQ1hmTGxoc1dmS2dEbWxs?=
 =?utf-8?B?amZKa3RSNHhmaUdadzBjVVhZRTdGRHRvTmNSRXMyN3BneHN4UmxidmlHOXdW?=
 =?utf-8?B?dHg0YlA3d2gwb3dLS0x4TndzQWVCc1FtSE0zeHJxMWZOMU95MnNXUzZrckRF?=
 =?utf-8?B?TFRmM0RaK3ZGckNQM3VHdUZyZjI3OW82ZkdsbndZZUpZNzZXWU9HMXRFVEtK?=
 =?utf-8?B?MGF2bHBMV1I0cU1Td25YeTB2WnZ1SFQ4N0JMWVFXMXBkOGVScGlKcEdPaXE0?=
 =?utf-8?B?bHFaaGhkVldBTGRCa2NKQWc0ak0wd01Zc2tYd2p6TUh3aXlxbVVYaUdEb2w2?=
 =?utf-8?B?dXVsNWdLT2xFWno3UkZ1dEhHZkJpVzJwbUc0VWlkdHhUUmVrY1l0UnZ3M1V1?=
 =?utf-8?B?OExtSHRRbU1wREk1VThuNS9UWEZHYW1nQVFjVld6U21Yd2RNeVNwV0EwWkdC?=
 =?utf-8?B?c2hZRkU4R3FuQTBnZVN3SXJVWjFlNVJTbThNVXdZeklQc0FhWW5WbDM1dWxs?=
 =?utf-8?B?N3ZSQnhZZk01SURJaVliK0RiRjhGZ2l0VFJvZFVjL3JtK1VtNWJadjVMc3lM?=
 =?utf-8?B?NGdBTURPRUVqSnUvNC9ndW5qSzZuYWhPeDdOYUtGdUp2MlNraE5FZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89A20021B81FA94E826579D341CD783A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcce139-d2f4-43c6-6189-08de5e3d2c18
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 07:16:35.8500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qWFcQnkCebOewiXa8pkA4qGDoI1vJRwjFH9MBKgq57E8/L3GaAgLcsqZHAijFRTWNc3kuob5WdZy1h5kA44s9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8580
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_231715_411062_B6594679 
X-CRM114-Status: GOOD (  12.92  )
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

T24gVHVlLCAyMDI2LTAxLTI3IGF0IDEzOjA3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMjcvMDEvMjYgMDM6NDIsIEt5cmllIFd1IGhhIHNjcml0dG86DQo+
ID4gTVQ4MTg5IGlzIHB1cmUgc2luZ2xlIGNvcmUgYXJjaGl0ZWN0dXJlLiBBZGQgaXRzIGNvbXBh
dGlibGUgdG8NCj4gPiBpbml0aWFsaXplIHBsYXRmb3JtIGRhdGEuDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiBSZXZpZXdlZC1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiA+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVs
cmVnbm9AY29sbGFib3JhLmNvbT4NCj4gPiAtLS0NCj4gPiAgIC4uLi9tZWRpYXRlay92Y29kZWMv
ZGVjb2Rlci9tdGtfdmNvZGVjX2RlYy5oICAgfCAgMSArDQo+ID4gICAuLi4vdmNvZGVjL2RlY29k
ZXIvbXRrX3Zjb2RlY19kZWNfZHJ2LmMgICAgICAgIHwgIDQgKysrKw0KPiA+ICAgLi4uL3Zjb2Rl
Yy9kZWNvZGVyL210a192Y29kZWNfZGVjX3N0YXRlbGVzcy5jICB8IDE4DQo+ID4gKysrKysrKysr
KysrKysrKysrDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zj
b2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjLmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWMuaA0KPiA+IGluZGV4IDgw
Y2I0NmYxY2RlZC4uMmJkZTg3MWMwMjI0IDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlYy5oDQo+
ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNv
ZGVyL210a192Y29kZWNfZGVjLmgNCj4gPiBAQCAtNzEsNiArNzEsNyBAQCBleHRlcm4gY29uc3Qg
c3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRhDQo+ID4gbXRrX3ZkZWNfODE3M19wZGF0YTsNCj4g
PiAgIGV4dGVybiBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGEgbXRrX3ZkZWNfODE4
M19wZGF0YTsNCj4gPiAgIGV4dGVybiBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGEg
bXRrX3ZkZWNfODE4Nl9wZGF0YTsNCj4gPiAgIGV4dGVybiBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2Rl
Y19kZWNfcGRhdGEgbXRrX3ZkZWNfODE4OF9wZGF0YTsNCj4gPiArZXh0ZXJuIGNvbnN0IHN0cnVj
dCBtdGtfdmNvZGVjX2RlY19wZGF0YSBtdGtfdmRlY184MTg5X3BkYXRhOw0KPiA+ICAgZXh0ZXJu
IGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YSBtdGtfdmRlY184MTkyX3BkYXRhOw0K
PiA+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YSBtdGtfdmRlY184
MTk1X3BkYXRhOw0KPiA+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0
YSBtdGtfdmRlY184MTk2X3BkYXRhOw0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+
ID4gLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29k
ZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmMNCj4gPiBpbmRleCBjN2FmNDhmNjg0YzUuLjhm
NTJlMDAyYTUxZSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmMNCj4gPiAr
KysNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIv
bXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmMNCj4gPiBAQCAtNTU1LDYgKzU1NSwxMCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiA+IG10a192Y29kZWNfbWF0Y2hbXSA9IHsN
Cj4gPiAgIAkJLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk2LXZjb2RlYy1kZWMiLA0KPiA+
ICAgCQkuZGF0YSA9ICZtdGtfdmRlY184MTk2X3BkYXRhLA0KPiA+ICAgCX0sDQo+ID4gKwl7DQo+
ID4gKwkJLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg5LXZjb2RlYy1kZWMiLA0KPiA+ICsJ
CS5kYXRhID0gJm10a192ZGVjXzgxODlfcGRhdGEsDQo+ID4gKwl9LA0KPiA+ICAgCXt9LA0KPiA+
ICAgfTsNCj4gPiAgIA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVsZXNz
LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIv
bXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVsZXNzLmMNCj4gPiBpbmRleCAwNzQ1YmMzZWU0OTAu
LmFiYTI4ZDI3NmJkZiAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVsZXNz
LmMNCj4gPiArKysNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVj
L2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVsZXNzLmMNCj4gPiBAQCAtOTY4LDMg
Kzk2OCwyMSBAQCBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGENCj4gPiBtdGtfdmRl
Y184MTg2X3BkYXRhID0gew0KPiA+ICAgCS5od19hcmNoID0gTVRLX1ZERUNfUFVSRV9TSU5HTEVf
Q09SRSwNCj4gPiAgIAkuY2hpcF9uYW1lID0gODE4NiwNCj4gPiAgIH07DQo+ID4gKw0KPiA+ICtj
b25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGEgbXRrX3ZkZWNfODE4OV9wZGF0YSA9IHsN
Cj4gPiArCS5pbml0X3ZkZWNfcGFyYW1zID0gbXRrX2luaXRfdmRlY19wYXJhbXMsDQo+ID4gKwku
Y3RybHNfc2V0dXAgPSBtdGtfdmNvZGVjX2RlY19jdHJsc19zZXR1cCwNCj4gPiArCS52ZGVjX3Zi
Ml9vcHMgPSAmbXRrX3ZkZWNfcmVxdWVzdF92YjJfb3BzLA0KPiA+ICsJLnZkZWNfZm9ybWF0cyA9
IG10a192aWRlb19mb3JtYXRzLA0KPiA+ICsJLm51bV9mb3JtYXRzID0gJm51bV9mb3JtYXRzLA0K
PiA+ICsJLmRlZmF1bHRfb3V0X2ZtdCA9ICZkZWZhdWx0X291dF9mb3JtYXQsDQo+ID4gKwkuZGVm
YXVsdF9jYXBfZm10ID0gJmRlZmF1bHRfY2FwX2Zvcm1hdCwNCj4gPiArCS51c2VzX3N0YXRlbGVz
c19hcGkgPSB0cnVlLA0KPiA+ICsJLndvcmtlciA9IG10a192ZGVjX3dvcmtlciwNCj4gPiArCS5m
bHVzaF9kZWNvZGVyID0gbXRrX3ZkZWNfZmx1c2hfZGVjb2RlciwNCj4gPiArCS5jYXBfdG9fZGlz
cCA9IG10a192ZGVjX3N0YXRlbGVzc19jYXBfdG9fZGlzcCwNCj4gPiArCS5nZXRfY2FwX2J1ZmZl
ciA9IHZkZWNfZ2V0X2NhcF9idWZmZXIsDQo+ID4gKwkuaXNfc3ViZGV2X3N1cHBvcnRlZCA9IHRy
dWUsDQo+IA0KPiBZb3UgaW50cm9kdWNlZCBgTVRLX1NUQVRFTEVTU19ERUNfREFUQWAgaW4gdGhl
IHByZXZpb3VzIHBhdGNoLi4uIGFuZA0KPiB5b3Ugc2hvdWxkDQo+IHVzZSBpdCBoZXJlIHRvby4N
Cj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQo+IA0KRGVhciBBbmdlbG8sDQoNCnNvcnJ5IGZvciB0
aGUgbWlzdGFrZSwgSSB3aWxsIGZpeCBpdC4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUu
DQoNCj4gPiArCS5od19hcmNoID0gTVRLX1ZERUNfUFVSRV9TSU5HTEVfQ09SRSwNCj4gPiArCS5j
aGlwX25hbWUgPSA4MTg5LA0KPiA+ICt9Ow0KPiANCj4gDQo=

