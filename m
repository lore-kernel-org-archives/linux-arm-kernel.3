Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F41FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQPs44/r1cMuZXbVFTmHCJsY0uXkNtGqC+MBDW2Zprw=; b=oikEOdIZUFR8a/2C/HRQbjFLnJ
	R5ms5oYkZ+UxlOppa5JQpFf3ozwSX3JcjJqEEsEa5MlRre2j9xT2sszKKplkAalZGANLl4kVXNjLq
	4F0juR+MFElzVyPwDzjU5UcILMSLL5HseUN3XeS4FEFuD8UXfS9Gq701ApTI6sp9cK6FdIyvrZhhi
	DkPMy1GosBISWIdfZpDBilQv4RutEPsEVICnZrL3IqoaKFFopPtAnUKdUCz6iq7+UyV5O9FRcd6Jv
	X3zy2LY0YvP52iSG9BBwB8SsZfr949KiEMbsj6yKSkppQxlMl7EcMqh1DvY6raDfsCWWGiCx7uQ96
	vB2qyfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Mo-0000000ASjC-0wRZ;
	Thu, 06 Mar 2025 09:18:10 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Aj-0000000AQp8-0idl;
	Thu, 06 Mar 2025 09:05:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kauXJzWjASzncW5mOsZQ8mPtCttqDL2lgbn0gVJ6buXtSDa1S4FOPAMb9fYlBX1UtzT5nutXSDmuguJcOcnuRhoIAPy6qN1UZjg4e6NlAXTilDp29ECOfUzP63p1Ao3nsTkBU+F8mk/k6wIidRdVPGGuTzNmU1CCMwxJpB4UkdJMKYbLbzdZiCWRgIRTtkn6WBNfNmM4y/Bi45G1aP4gaJ7hRyf1ChR3Yu1Ue18C1jsO3JeBrzEm4wIRXzHSDQDUT83zq03QOG3tIGw9pIRtkAC9qDUZUB3fUs7N2XJ+BIHh66ChSmywKeHYh+cBN75wsR8Ugjh+usqYcdC8oPiprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQPs44/r1cMuZXbVFTmHCJsY0uXkNtGqC+MBDW2Zprw=;
 b=R/8UhH/jxJ3b6VXeO2VfmpNCsxDDHOtOTd/PZjzg0VGSv3iIAsDyznOwqq8xRFxIpDn2ic5n9A0mohp3qPbZSzsvEvhXPRh9mDbpug2oU3yWNomUtaILa6eD/pMKE5W1kVyByl67LXQCJN/Eq4P1NpNYVLQD3jC9n6u7Qwgwe8oDvJozENqJRsxQDNPE77/0QdmwtwJmoTy3VuE/HFt6q0C12umdQuPVh/DiyzwO5lLy1df5kAqBwyEsIMsaxhVC4bAkK+HepUrcw3kYosJZxyV06vp85XNf/N7OxxfCmaI24tfo1nwY3+HjaFCrij+pSF/GKYK73Cd6bVKxR4/EnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQPs44/r1cMuZXbVFTmHCJsY0uXkNtGqC+MBDW2Zprw=;
 b=w4u1KJn5VkwGXM9qrjaGNAkqST7vFrShRba8aDb9actVtlEfHxn72NCKu9ZJ9AFMHPfkH8AfdTq4xP1x2/k9H2cSbuZ5hIVx1/8oGGMaHiVOgcw/1dVt1FXUfnu31TL7s1wWr/C5DSqf8AmaJuaQwaNTsoWns5V9/6+5ht6sR/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB7755.eurprd08.prod.outlook.com (2603:10a6:150:56::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 09:05:27 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 09:05:27 +0000
Message-ID: <137eeb26-65df-4dfa-bece-08a7758ae5c2@wolfvision.net>
Date: Thu, 6 Mar 2025 10:05:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] media: rockchip: rkcif: add driver for mipi
 csi-2 host
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-6-e906600ae3b0@wolfvision.net>
 <3fztpczfxlfzt3bdll4alzllrrqvvr3akhkiqtmtam2v2sbw2y@6hb3aok7h62x>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <3fztpczfxlfzt3bdll4alzllrrqvvr3akhkiqtmtam2v2sbw2y@6hb3aok7h62x>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0126.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::19) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eed850e-60bc-496a-3177-08dd5c8e0942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akVrQWc3QjE5M2ZPZEZ2OVVoVzhqb0NOellsN1FPNUpFbExGNUFOQkVFVWtW?=
 =?utf-8?B?MEZScHIwV3NuSnlKMmRZMk5FalQ5WjF1WkhUQ3AyMzg1VnhIbHp2SDBWb3pX?=
 =?utf-8?B?WDhlVzZUcTR1L1hzYnpXc0ZyYkl4QmpJQXlBd21GOW1GT0xXdjhVWjVYcytW?=
 =?utf-8?B?RlN6aVN4K29VVlY2VXpObHhXSXMxemM1aXB0V210ZGJiZkdiQThEb0ZyUTRy?=
 =?utf-8?B?T1dBL0lXSFhhOWN6eDAvVjhOUC84K21xeDdlL25ycWd1dExwb1F4T2tWU0Nv?=
 =?utf-8?B?dGxiaDhuWGtMY09MdHFmWGcwckZhcUZzR0ZRTURYN2hnZ1NnNjRyRTA0VVJy?=
 =?utf-8?B?bitIZVJHbWN6Rnp2Yyt6RTlkMEduZmtnRWFjMGt6dVI5dk5XNkladGdHSjUz?=
 =?utf-8?B?Q1Vya0FFVHBJLzVsNDZxWHFrWlNhT014THJ3Ui9oVk5ncWhCNFQxOUcyMS93?=
 =?utf-8?B?QkdPRUF4ZWU5TUhhaUR3NHA4YXI2LzlBa2RsR3U5QTloSVc1L09PZU1JSmsx?=
 =?utf-8?B?T3hrNmo3TUZoY2NUQ0kzQ2FaOEtvRjJXMEtibXJ6akhmSmQ2cEM2amlqOW4r?=
 =?utf-8?B?WlZUY3N0Z0tCWWlxOTBKU09kZmZaMHZSeXV2SFhxbHZNdG9tUlFNTDd0a29o?=
 =?utf-8?B?aTlVK0djVDdWc1FIS1hPMGcvNFJGV04yY3FQbmpiR0JZVzJuT3BPUkp6bXRa?=
 =?utf-8?B?eDRUbndpNk1wdnY2emRXN3Jkc3IyRU83ck9ZNStpbWhHOEowbFRVdER6a3cw?=
 =?utf-8?B?Q1daOGI0N2kzRG1zMXROeFJ6c1BSaWNITXRLWTEzbVBIa0NOem1vTVBoZHRQ?=
 =?utf-8?B?QnFXd0k3ajJlSzVtSk9pWitvT01JakxxQ1FYNmE2SXR6bytZcEF0SVBVRWph?=
 =?utf-8?B?dHp1by9McVRUVXhJWlI1Zy9STm5SbHdVanRHN28yb2pCNUpXNWRxY1RqTm9k?=
 =?utf-8?B?Y2plMEEzdzM4SDFpaFNURXJuQkZCa0hYd05KakswUUs5M1V5Zm9UNFo1bEpu?=
 =?utf-8?B?R3hQVTVWNG85MzdKNUxhVXlTU245SHFFQU5XMzJRcllsUDVNNldQRUUxYXRB?=
 =?utf-8?B?RGd1OGpZRHZmazRnRWc2SE42bHh5SkVhcGFCd2plTG9Ca3JWb3kwNFp4b3ds?=
 =?utf-8?B?YWJKYlVTbWt3K1hCZDVGZVpuSFVqbGVQN2dSN1ByZVBaRnBwTFdIeG9lbEtN?=
 =?utf-8?B?d0ZKUFR0b1RocklwKytlK2NHWlFnOEY4ZEo0bEczSmppdHdxRlZFTmJUcTBR?=
 =?utf-8?B?dmlOL2JmQXJNWWsrbkl4bXA1d21kZ0hVV3RuSVhKVi9iZU42NU9LUkt4cDVR?=
 =?utf-8?B?R056Wks1Wm1rMlF3NWFtL3hUV0QwWktYK001KzNydlpVdml0R0hVMmdTaWh4?=
 =?utf-8?B?ZVN3S3RNRDNMZnhUcHlrRGZqUjdlR05jZ2IxVVZuRTJyTWlDUUM0UTlydWlI?=
 =?utf-8?B?TXREcmE1RGNpVm9LVGpNZDEvMU0wa3Q1NGZCYWZ0QTlubnVtR2RZazI3N1BZ?=
 =?utf-8?B?QnQxWFhYdHhGbkMwQS9OY0Vjc1ZFZUZkSXBQTVlsVEkxdTA4dlN4UGFOUjdC?=
 =?utf-8?B?czBiaGZQZHNnOVpqQUV6SFh4VDFUR0hBaURXMWhyYUJUTi94bWRCTytFeVlF?=
 =?utf-8?B?T2ZmZGg3UVNNT2NVa1JEek9xYWJ0ajROSEVmNXhJYUpaNktRUmRhQ1VLWTkw?=
 =?utf-8?B?aWNwTzU2di8wclNvSjhrUWF3eDdETmYzTjBzRSsxcnRKU1Jsa2lXSml0U2hZ?=
 =?utf-8?B?NmlRazZqSW55MHR6NkNZV1pkMVM2U2VQT0xlSHA0RW4vT2UrQW8xSzhMR25m?=
 =?utf-8?B?ajdpUGRENkliRUJOWVd1RXJOYmZ2RENZSHpMUzFFMmRtSU4ycWkxZDVrUkVj?=
 =?utf-8?Q?P3NU+0KbqZhZp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFJWL1AweWtSQXIvRzMxSXloMG1NcmNRODlsRjFuWGRWaUh3RWpvQ1BQVjVN?=
 =?utf-8?B?Y3VoKzZpWEhNMW9KSnd3YUV2VlNVMi9McnNOWnFhcmMxbUxCMGw5ZTk2c3NX?=
 =?utf-8?B?elVHRU0wMDlwaWg0aU5GUVdiYUJWT1oxN3VHYTZlSEYyTHdpSzV6cVRMMll4?=
 =?utf-8?B?VVVOcHRzOEthT056MjlxNXZBR1p5RDd2WXM4dmxYS3RlY0VEKzdZczllSnZP?=
 =?utf-8?B?ZGdvSlJLMkJadmtZa2ZzdmpsRS9NTHZBVStKTDdDVS9FWk8zanh2NUtTeHEx?=
 =?utf-8?B?MURVeTBtTTVPZGtaUGJVT0hyWFdZcHhlczdVSXRvWGg5cDJLRk5sbnJ3b09k?=
 =?utf-8?B?MzVkcGIremdPTGlWSmdlUXpIUG9Bb0RvaGtrUEV1MnRXdThnQzlNdE5lelNz?=
 =?utf-8?B?OTV0SUJBQXRNSG10TGZObndIVHN1U2hrcVZad1dURzNTMU8wajhxVlhJS1Vt?=
 =?utf-8?B?bDdMRldrNC9XVU1VVi9OQ3FFUmF4eDFGeGNGcEsrTnhmUHg5R1FMNEttWHVj?=
 =?utf-8?B?b05OekUrdDVzdUx0L29PRnBJOC9BcWZWcjA2VjZQM05JRWlKRzdLQWR3Q0to?=
 =?utf-8?B?cVR2aGlLVTJxb29FbjlVd3pYQWtmRmVEYWUzSzEydC9GczhSdUtQQVdTR05B?=
 =?utf-8?B?UkNOOXBCUHpkcWJEV2J3YS9jQXlpdHFCTmdZVC9rMDdHVzk3Z1Vwa1JFUmZS?=
 =?utf-8?B?SVI4NXpHSFdDWitPcHVLM0o5a1h2SExSWkpHc1M0RmRaMWdtaU82NElkdVZv?=
 =?utf-8?B?OWNtNi9WU25pNTA5R3V0Z0djcUFsU2QycDZVdTVyK1MwcUFWV2tCVzhtNGZZ?=
 =?utf-8?B?T2lIZVNFK0NqUlE5Z2NRazlQaFdRTm96Q0dTV1I2bDJxYnJJcmRGb2kwSks0?=
 =?utf-8?B?K1V3ZTJKN3owdHllMDNuNm9KM1hYeWFuS1ZQKzJkL3BrUUk5aHpsejdoSU0z?=
 =?utf-8?B?YzhlTDVRcTFoOWN3ZldRN2dKQXdSOER0bU5YUFVuNWdrVm5YeSs3dzB6eG5h?=
 =?utf-8?B?ZnhGeHlGWWlIZm9WdnZkRG11WEsyL1BndlFWLzhSK09Sa202b3p6SXJzcVB3?=
 =?utf-8?B?VGV3SjExelFMbVZ2R0t4VzI2YlhTSXorNVhtUE1qUHVkOW9NRUJtUVNxOU1v?=
 =?utf-8?B?YkxFbHR5RW1HQUdkdXVFaFFKOHppaUJuYmpWQWNweEszaDNCWnJiUklnZnpU?=
 =?utf-8?B?U0dYSXlBRWNGQzdZVGM3QWlnSFBXc1U2dm41YVZucnkyWU02NnVMZ2Fzc29m?=
 =?utf-8?B?bGRJOEg0MVYrQ0hTdEZCL2Ewb3c5RWxTTHpPbmFzYkVGTjdKMFlmdThnRzRR?=
 =?utf-8?B?TWxpdXB3Ylh5MENFTFpqNHllVmxRN2YrWXY1bGI4V0MrUXVUTmVRSHJWNExR?=
 =?utf-8?B?aFBSaGVtOVp4eUlrblhsUUM2R2VzUTROejZ5V0hxQXludjE4U0JBbjdUcWZO?=
 =?utf-8?B?MTJFRVR4QXhmM3l5Zlo4Z0xOdmJNa2ZGVHdKUVRzT2pic0g4TlRURFVUbG81?=
 =?utf-8?B?TFZzS1JjN253b08yM2pFZnZOeGRid3ZXdkh5czdxVXk5RHNtZmZHRGREdzdl?=
 =?utf-8?B?c3p0UzMxNzEyaWpRSW1rN09WR0p6NlRJY1pQQndXcFpXR0prZG1QSkh5SHJV?=
 =?utf-8?B?eTl0RVBBMDdhZ3R0QmY2cXQrb1JMUmVvTmsvMFdGQlllcGlvYklabU8wcm12?=
 =?utf-8?B?bjhWZ09JeWZDeUJYb0JndEJwWCtGR21RcG1yY2RQd1pyY3I3OWJtNC9jRzFU?=
 =?utf-8?B?bUE3enlqQi80dHZqWm81dFd4aExrb0ErZ1NpKzlFV1NqcE9WQzNkLzFHc2ts?=
 =?utf-8?B?cmhVTkdudGdwV3RWazAzakFDekhPekF6NW04ZkpFcmRCMEtHaGxwTWxvcDQ2?=
 =?utf-8?B?c0w4ZmNPd2hxV093aEk0emVQRW50dEF3TXRsYVEzenQzdGl3MHNzc2NNOENz?=
 =?utf-8?B?NnZkRGJmRkgyQTdLUUNlQ29nTHZSUDk5MDlpb3NNbDVlNWFSOG1udGgxM1Va?=
 =?utf-8?B?cTdNRU50MVZ6cnFtTmlwSUtSSUl6VjVGNGc4VGFBbjh1VEQ1WlBCNU8vY2tV?=
 =?utf-8?B?V0J5bXRUSVBOclRSdWNRQ2FiTHFCWHloZUdwTGRTbmUvdm5xb1ZIREs0UGNl?=
 =?utf-8?B?OCtXY2VSVzJNeXd6L1hEb3piTlRLS0RjODlSUWI0WWlHc3JLcCt1Q1psUFdv?=
 =?utf-8?B?WkE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eed850e-60bc-496a-3177-08dd5c8e0942
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 09:05:26.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvAqXIK9B+lQfNh2PZLbfsBPN/BGpH0c1u1nJRJ+OmoDXc1j+LdwvfZpOHbxvPHf3klVxqqS6vk/azYzSEeVVuJbdxtt/82oaQ6ktZTb70w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_010541_307268_C9A1C17F 
X-CRM114-Status: GOOD (  29.50  )
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

Hi Mehdi,

On 3/4/25 20:41, Mehdi Djait wrote:
> Hi Michael,
> 
> thank you for the patches.
> 
> Sorry for the big delay!

No worries, thanks for your comments!

> 
> On Wed, Feb 19, 2025 at 11:16:37AM +0100, Michael Riesch wrote:
>> The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
>> and one output port. It receives the data with the help of an external
>> MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video
>> Capture (VICAP) block. Add a V4L2 subdevice driver for this unit.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> ---
>>  drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
>>  .../platform/rockchip/rkcif/rkcif-mipi-csi-host.c  | 731 +++++++++++++++++++++
>>  2 files changed, 732 insertions(+)
>>
>> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
>> index 818424972c7b..0c18efd1f1b4 100644
>> --- a/drivers/media/platform/rockchip/rkcif/Makefile
>> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
>> @@ -4,4 +4,5 @@ rockchip-cif-objs += rkcif-dev.o \
>>  	rkcif-capture-dvp.o \
>>  	rkcif-capture-mipi.o \
>>  	rkcif-interface.o \
>> +	rkcif-mipi-csi-host.o \
> 
> [..]
> 
>>  	rkcif-stream.o
>> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
>> new file mode 100644
>> index 000000000000..fa3f42b2dc55
> 
> SNIP
> 
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
>> +
>> +static struct platform_driver rkcif_csi_drv = {
>> +	.driver = {
>> +		   .name = "rockchip-mipi-csi",
>> +		   .of_match_table = rkcif_csi_of_match,
>> +		   .pm = &rkcif_csi_pm_ops,
>> +	},
>> +	.probe = rkcif_csi_probe,
>> +	.remove = rkcif_csi_remove,
>> +};
>> +module_platform_driver(rkcif_csi_drv);
> 
> [..]
> 
> When adding the driver for this CSI-2 Host bridge, you added another
> call to  module_platform_driver()
> 
> but in the definition of this macro:
> 
> "Each module may only use this macro once, and
> calling it replaces module_init() and module_exit()"
> 
> and as you can see in the diff of the Makefile,
> rkcif-mipi-csi-host.0 is part of the same module as rkcif-dev.o, where
> you already call module_platform_driver()

Indeed. Found that only after submitting v4... :-/

> I think the solution here is to call
> platform_register_drivers(drivers, ARRAY_SIZE(drivers)) in rkcif-dev.c
> 
> with
> 
> static struct platform_driver * const drivers[] = {
> 	&rkcif_csi_drv,
> 	&rkcif_plat_drv,
> };
> 
> then define module_init() and module_exit()

Ah, I haven't thought of that approach. Actually, I was going to split
the cif part and the mipi host part into two modules. This would keep
things modular (literally). What do you think about that?

> 
> Btw. MODULE_DEVICE_TABLE() is missing both here and in rkcif-dev.c

Huh, indeed. Nice catch, thanks!

Best regards,
Michael

> 
>> +
>> +MODULE_DESCRIPTION("Rockchip MIPI CSI-2 Host platform driver");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
> 
> --
> Kind Regards
> Mehdi Djait


