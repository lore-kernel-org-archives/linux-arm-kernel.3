Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47464D0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVCK50bNEjVLgCUgG2YXc/QvN5ACnFAC0CDYP6iAhSI=; b=dr8nZOEL+RJErCMawlx8UM6Xhe
	vjISGA2wCBRBthv/JrU91O2nUWzXmsdrUO8gOmdsRAl4nMZLD0CUbLJlvJSsN81YT7foiARHtItsG
	vfJiw7XfG9vWAQvltQg2p18F3GthmgmnKvFnTrgKOjOFMO24oghZNSNjqNSI3x9D7RRUNAWGTmso2
	BK1VTZ5Kwo6X+1l+jA8xQ8u6jpYCpkvzN41u6YE4cH18IXmq9FkMXT0w22lkljlCdaBRrKahGucM7
	F6vSpnP++p/NllOIBkldwgA5zsdpmPxKfiI+2J3y5wRfcC0tBMCYIBdQ1gVE9WFmaqGfsJ2OiHz88
	3iZwP1LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r5X-0000000GsGd-2CBo;
	Thu, 24 Oct 2024 06:12:51 +0000
Received: from mail-germanywestcentralazlp170120004.outbound.protection.outlook.com ([2a01:111:f403:c20c::4] helo=FR4P281CU032.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3r3x-0000000Gs0E-1kn8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:11:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gg1Uk6MyNwTn48YDIWIcAYoGDCN8D9XGk8cYAqjrtPQQZYhCH79OVdwijZOR0OLxtI8pmbLvZjz2dUOldyGxZce8SfzvDi0f/2K6/TxnrE/5IF3/DksVkS+lpgD46gap2vwxNKsfDCAm/6v8wSAXV6M9EeO6jXOF0UnD5Rw+8nPVXSjGuBbh+1Vnn1suM0kswpluuD+N8l3mjLvESMZlqPZcsUoLpO4ZFiQEYsjN7zWxczfszpfdMuuFJwgS58zrYFW2GYLGRU9QAGJTWusoHS9H6XY6heacYm7vbKjMltX7YVtPtYTGa1AvaHFRDgvUeaPRfYSO4I56J3lkv2GalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVCK50bNEjVLgCUgG2YXc/QvN5ACnFAC0CDYP6iAhSI=;
 b=F362U3nGm40AuWJZFoj7ytMrhYuF8I37T/o72avNv0ZZy+kR1SycKV1n82GlSk4kKArDXYMQIjwNddF/3t4zHAYLbreUh/Dl1s2vpYLLddE4+3OQwT6Ms6eb3TYfD5pyHejubqWCXInYE5215/3kpEqiO+DZ93vL89r8YSiv42Msqslbqh8qlAHu8leUIZgUowM2kH84lxzIRz54OjQ4RvT1tqt437LawGbvWjzTk26JiXvcEyoWhntNZyzx2nrzRZHA9hNrz9xc2aD/BhtRyYmrJxAYMwxMk9fLzXeKPXmiLp1vPpLL/rNC3OHPBJMKfPwa4ivjfUg4MSXMfguJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVCK50bNEjVLgCUgG2YXc/QvN5ACnFAC0CDYP6iAhSI=;
 b=4pby1CFvzz05n7ERfFwhGtvDbO0Pqb54wAp03xckYB2ZyRY/aMApBlE7TFVIrrDu8qu3Mqla0bdEgdL817XYngZg2w5qn1O+swUctwyFYAn7fT3N4vuasdGTyV7qDGkdQeKQ/zLdYKtsJaJ4Dif2CCiD433MSlsJ57hXSnmpI6xTWNOn6qSYgkRuHaaJK4sS5g4dQTM8GuyqzWe1IKfrsHg0ZYkT+Q+cxaIG56jcBERxi4KvTdXnuNa4JJRmdC/932IpScPf4bijAJy/RMcoZpd/dVlSBoEHHcDwgQS3TyFRgdHTTM3bfLD4Cpk0j5zMe9ItTqQeNGedWH2yZAsRLw==
Received: from FR0P281MB2809.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:23::8) by
 FR6P281MB3454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:c0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.18; Thu, 24 Oct 2024 06:11:05 +0000
Received: from FR0P281MB2809.DEUP281.PROD.OUTLOOK.COM
 ([fe80::d685:f312:e114:519e]) by FR0P281MB2809.DEUP281.PROD.OUTLOOK.COM
 ([fe80::d685:f312:e114:519e%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 06:11:05 +0000
From: Erik Schumacher <erik.schumacher@iris-sensing.com>
To: "Frank.li@nxp.com" <Frank.li@nxp.com>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "ukleinek@kernel.org"
	<ukleinek@kernel.org>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH] pwm: imx-tpm: Use correct MODULO value for EPWM mode
Thread-Topic: [PATCH] pwm: imx-tpm: Use correct MODULO value for EPWM mode
Thread-Index: AQHbJUfRxNwwaOjAIEiewaTXGCuTjbKUd9CAgAD0ooA=
Date: Thu, 24 Oct 2024 06:11:04 +0000
Message-ID: <9f65248cd396524ebe977ea48d87284e14c399c9.camel@iris-sensing.com>
References: <349a25ddce02d55cf5a321f27133cae1f34f1962.camel@iris-sensing.com>
	 <ZxkXwTXwfkC9W5C3@lizhi-Precision-Tower-5810>
In-Reply-To: <ZxkXwTXwfkC9W5C3@lizhi-Precision-Tower-5810>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR0P281MB2809:EE_|FR6P281MB3454:EE_
x-ms-office365-filtering-correlation-id: 31e6e643-9896-4619-4de4-08dcf3f2a4a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OW0xNUlwZHpMVDM5YWRPYitxSWgyR09kWlQ2MmdxcXhheGhqUjR2WnpWWEtN?=
 =?utf-8?B?czdibEdDL1hianE3b3FKTjcvQXdtcDNjbFIveG1scisxQ0RBY2Q0R0FjZ3Jm?=
 =?utf-8?B?RU83aXBQZW5iWDhzT3U0TCtJeUxRaWptb2c5cFpIT3gyV0lVUVhra2JQOEpM?=
 =?utf-8?B?NnUvOW81U1k3YXBBV3dHQWNqR2FKeGkrcWg4OTlNVE1QUUN2OS8ybUYyUGZo?=
 =?utf-8?B?L01FM2pwUG12RjQydHpZTkJpZ2ZrL0w2aWRFTW9TTFlacGQ1cFJtQURTR0NC?=
 =?utf-8?B?aDBKb3RqTCtTcFNuRHpKN3BYOVNPZkpjQ2FGNVFrOEFNUmFPSGhXR01PdjF2?=
 =?utf-8?B?ZytIQWs0ZXpjMXNXaXFqbHMyc3E2anBVaDFlc1lpWWZ2NU1IKzJjVTJ0dFNT?=
 =?utf-8?B?bHZhNVlKUkdwT1c4M3k2WmlrTzBDcmhobzh2c3R5dGZSQkw4N0FIV2kyUXNa?=
 =?utf-8?B?di95bDVQU2hXekFRSm1ERDVrZndmNlFXT2xmdURRdWVhSXJFQ0QremFuaFox?=
 =?utf-8?B?TXVqNXhQMG9BSlY0bWgvRVozYWQveXB4NFZhZ2hwVjlucFhvb0lRWjB0cnJm?=
 =?utf-8?B?V3d5KzdEd3laTWhwaDFHZUJuemcybDVVNHZETC93QU8rUW03aDh4VlpwbjZG?=
 =?utf-8?B?TldFMUtUeG9TcmgyNGQ1amxkVms3bENEdXdXd0d3RWIrMVZUSDNyNllGTXJn?=
 =?utf-8?B?RG1JWENHYkxydy9JZ1ZVbE1KTlNhVFhRb3VETitQRTA4VE9xK28xZmM5ejY5?=
 =?utf-8?B?TkZUaFhaRG5IaDNqc3dXeHhNbmtZMnM3VmFKcUpxVDFhM2dKcTRNODhyc0F3?=
 =?utf-8?B?emYvK3o4dE9BbE5jL0dUSFdEU3pVREcrYnhpdDNablZtdHV0V2dldnF2REE1?=
 =?utf-8?B?SVV0T2JDTHFwMnRneWlFR2F0VE1FaEJTc2RjS21JTkpKWTdoQ0g2SmZwNHdG?=
 =?utf-8?B?ZUFXYWw3TmRuZjRvM0RvV1I2dmxlM2hWNVBwV3RiZFVPVEZlR3hLMGtGaGk0?=
 =?utf-8?B?cmVyQkZ6dDBMMEhyV0s1czRkUFVUdURtOStHNE5uNkFRaFlkM3hKVHZBNDhZ?=
 =?utf-8?B?cEF3dE02TFdSeXpZalRmbk51NVhwQ0VSd3lBbjlTREhveXFaVHZvUlRDbEUz?=
 =?utf-8?B?K09KSUs1K3FRV0hqN1VubllUNmFHL3E5MUpySGw4em1sbzloSHU1aXBoMmJ5?=
 =?utf-8?B?UEY4eURHeWEyY3V5V1VhN0dlQkV1NFFuMGJabFE0Z0RoOVIzMDdnQUlGV2Rt?=
 =?utf-8?B?ZzdqYXJ6aG50VGVUZjdkOW5GbXpyRlZEcnZtYmR6RFVVeGpGV2VEZmNkMXp4?=
 =?utf-8?B?cklqYWlQWEpGV21UY0tFY3JxQlhrM0FFNlU1SEJvM1c2QlVOSDA1UkpOL0hW?=
 =?utf-8?B?TmVGVWoyMHI0cFQzbWJBdjY3djdoWk11RURtR2hEWFVqOVRJOFhVMzZKeHUw?=
 =?utf-8?B?WURxVkM5V1NDTEo4WEc4K2FMQkE1dGIvMUM1bHRzcU5qdkJTZHZDc21wWWNs?=
 =?utf-8?B?dTVFWGdEZkhGR3lURHNZQk5DdXlGVDM1WXdiUkVCR2p1SWxCak5KWU1MNjZG?=
 =?utf-8?B?azYxbUMyNDdaZ2s5ZWF0YzZOSCtuZ29KRjlRUGtKVkNzcVdzdTg4SEJKUDBF?=
 =?utf-8?B?S2Jjb0FBbUlYamN3UVd0Z1QybnliVm1oR2tTZmRjd2FpWVJwK0xRd3lrdDQ5?=
 =?utf-8?B?TzVEbXkxdGx6WkZiemEydGZWenRzOWpReEcwWXNaZWJWMTMzdFUvUWJMNlhK?=
 =?utf-8?B?VDJMVXJUTkgrOExTK3E3clh0VXU5bzdHV0ZGdDB0dktEY0xkQ0ZCZW55aDBu?=
 =?utf-8?Q?1uvS47rgP/ViEyubJn+e8lMYmsTtWEvGJkNz0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR0P281MB2809.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXQ5THlMTFdWN0xVY1c0U0g4cEx3M3VYcjN4MDJnWUFQMkRTV3d5dHNZRlFj?=
 =?utf-8?B?NHNrOWRVMFdiMlVkb2hPUFVQTjZRMmpXK0hOMlI1eWJMRUJXUVF3REZBYWp5?=
 =?utf-8?B?WnlCdEp6UUtYbkUxMHdpYVVYL1Eva2NYK1c3SXcyc1V5NjV6eG1TNTBIa3gz?=
 =?utf-8?B?MmNGRXFaYzF5cnUrSU5ZK0pINXR3SDJ4V3d5cWZkeThVOUNrODVRRTVNL0pz?=
 =?utf-8?B?L2FLUUVER3dXalpUb0NxNklacnRMMkJZZDUyNlFkOEN0UnJzMG96UnZVUWtn?=
 =?utf-8?B?TkF4K0VsamlJNW13TlMwOWJtQXM2WGM0NnluNE9heFZBb01udHllelZOemwz?=
 =?utf-8?B?d21NSndzajhnSktEK3JTUDFmTTk5M3VwOFcxNnFSN0liU2FIc3BnL2t5cHBx?=
 =?utf-8?B?WVlGWlJhM0N2d0VCYldDR3JvQkpSby9ZWXRMbzdTUlNlZGwwbXN4Z29pMlR6?=
 =?utf-8?B?dFFlUWlZQVgwSWE2cFltQ1N1WkRmaEcyM2drczF3YUZjWnBFQ0VWS3dxWS9I?=
 =?utf-8?B?bXNwdXQzNVlONHVqN3Vac3RyMk1Xem1ScnQ4Q3lwTUV2SU5udmlvYWFIKzNP?=
 =?utf-8?B?YUxHZG1OdkFoMG04VlVkTkdNdnA4dXJ6YTJsbnBMQzdFSzB4VzJFY0x4dWxY?=
 =?utf-8?B?dG1CcG54ckZDK3l6WGExOWwyVjlXc3FIakxERGgxbVZwN25IWXlBSGRTYWpj?=
 =?utf-8?B?R3NTYzB2bjNmVG9ZVUlrV0N4U05yQ1oxbGQ0aG9PSS8zY1lSVXZtREl5TmdF?=
 =?utf-8?B?d3VlYnNRUXJCa00razFGaTBud1BTOGVOcjlYTUtuRWNtL3J4MHNGT29VYlJh?=
 =?utf-8?B?cFlGcFlueGxIVEgxWU5lUDhDeFFHVU96ck9TVXFMK2dHMXg4c0xBb05WS0ZN?=
 =?utf-8?B?aElyc3hLc0N4NTRvZ2RmNExzS1JVeEYwcHJsRnRLblUvSktBSXdtZVhtOGZS?=
 =?utf-8?B?dHNyMEVKRUNubUFhcEwrS01hTkNucjF4WGNwMGZobll2ZnZSemg2TVo1RCtF?=
 =?utf-8?B?cm5uUHJ2RnBXYzZ3bmFNQ2JJektXd1pwSzZ2WWhvUkdxaHVLY2pUVkpQLzMw?=
 =?utf-8?B?NFpadHdrSnBPdG8wQi9tcEQ0UFJQTWMrcXZ3ZUhlaENSWmJ1a3Rubk1uNU83?=
 =?utf-8?B?bnNWMWNJaVoyZSs4Z3p5NzhkKzVsMU8rOFdEeTJLMkxsK3RtUXV1N2taUmZh?=
 =?utf-8?B?VUJqMG8vYS9qRkZua2g4RmlsWXBSU2lBTmw3MXJLbE9FWm9iOVlTbWlTZWxv?=
 =?utf-8?B?NEdKYkQ5RWRpWEVUV29ncGdqa09ZMU9jSVZTZ2ZQTFM1WWQ5b0UwR3dMYVps?=
 =?utf-8?B?cVNUbjh4M05yUDhzU1p6MVRwRWhoclRrWFlOWEEyOFQ3WmNhQTJKVFk3VnQ3?=
 =?utf-8?B?czJldEFzZEVaTlhacWNLUUZVcVN4d0pISGQ1Y0YzK0pqUWVtWGxpVFhoNVUy?=
 =?utf-8?B?enU3bkFydnVielZnTWFVYllCMHdZZ0p3b1M3WlE1OG9sWjFtT1VOR0pUSDJF?=
 =?utf-8?B?ZmRjWStZanV6YTZFVU9id2FiVU0zdi9zVFB3SzA0UWtXTnB2eS9BVzZYZ0pN?=
 =?utf-8?B?V2Z5SVYwVlN0T2xFSlFWQnJTRkxjMllGZ2F6Yk02cmF5a3ZNT1puVlhUMit0?=
 =?utf-8?B?MGxvbktWNlpsR0g5UTN5dDZlRUMyYlY1akc3UU1SSFo0VzZ6TnpZYU9JNDZv?=
 =?utf-8?B?UDgxNjM2d3VpaFJxTFVtdDZEdU4vbGYvbTNnTkVNdnhYMGVKcGJJaUY5eG93?=
 =?utf-8?B?NUNVWm9Neis0VWIzZGFWRTlEVXVLRVYwSDBEU2tZZndtM2dIRzV4dDRoUnhm?=
 =?utf-8?B?R1VUalozNUkwQlpRZ3NmTm1pM1FLSW5pazhkdVRpZUJENWpJZWhSY3kvT2xE?=
 =?utf-8?B?eHJ2S1BFS29MT1c4L2RMa2VPZVhwdXJ5ZnJEb3VpcWt1MFVDQmFmcSt4bEFG?=
 =?utf-8?B?Wi9haTdJK3NhMGxaQmV0VkJ2ZFdpOEgxRmlSclgxZFgwcy96RzNXTFVjTUFl?=
 =?utf-8?B?SXIrZWt1a1hBR2orVjlFNTVuWlMyRUdkYnhVaTNUcUVMdUd1T0dIbTFLTVpy?=
 =?utf-8?B?aXpiTHNWNUphcy8zQWhPb0lqeEtMRWRqTi9Vd2FOS1kwaDVwNDlwaExWNUFD?=
 =?utf-8?B?WHV0T1ZCVkRsb3BIbGlkbTRlV29GNUNFWkJMNGJXQlpJc1pZaEoraHdqYWZB?=
 =?utf-8?B?TXQ2RmNsYmJYcm9XYXZGQ3R1RCtnYnhkK2FSeVNLcENMQS9ac0d5SHpSNXNk?=
 =?utf-8?Q?dtq9XBAJLsQEJhRVZywt85EPzHZriznAAHWKqjYt4c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6010D648E11C94C90E091FD6E30BDC7@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR0P281MB2809.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e6e643-9896-4619-4de4-08dcf3f2a4a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 06:11:04.9928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MHNJkPmHgiT6KAASX1ypF4oA0rgRc9Nw9xaP94ts/gKwTEDau1l5WYzBFN9LOVYyj564H9FzslzL1bpQxbNHTYiX/7+MbpT2ChT9zpfH91lXVj1TJmn7Lt362HPeSptc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB3454
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_231113_501520_1E4DD0DE 
X-CRM114-Status: GOOD (  13.40  )
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

QW0gTWl0dHdvY2gsIGRlbSAyMy4xMC4yMDI0IHVtIDExOjM1IC0wNDAwIHNjaHJpZWIgRnJhbmsg
TGk6DQo+IE9uIFdlZCwgT2N0IDIzLCAyMDI0IGF0IDEyOjMzOjUzUE0gKzAwMDAsIEVyaWsgU2No
dW1hY2hlciB3cm90ZToNCj4gPiBUaGUgbW9kdWxvIHJlZ2lzdGVyIGRlZmluZXMgdGhlIHBlcmlv
ZCBvZiB0aGUgZWRnZS1hbGlnbmVkIFBXTSBtb2RlDQo+ID4gKHdoaWNoIGlzIHRoZSBvbmx5IG1v
ZGUgaW1wbGVtZW50ZWQpLiBUaGUgcmVmZXJlbmNlIG1hbnVhbCBzdGF0ZXM6DQo+ID4gIlRoZSBF
UFdNIHBlcmlvZCBpcyBkZXRlcm1pbmVkIGJ5IChNT0QgKyAwMDAxaCkgLi4uIiBTbyB0aGUgdmFs
dWUgdGhhdA0KPiA+IGlzIHdyaXR0ZW4gdG8gdGhlIE1PRCByZWdpc3RlciBtdXN0IHRoZXJlZm9y
ZSBiZSBvbmUgbGVzcyB0aGFuIHRoZQ0KPiA+IGNhbGN1bGF0ZWQgcGVyaW9kIGxlbmd0aC4NCj4g
PiBBIGNvcnJlY3QgTU9EVUxPIHZhbHVlIGlzIHBhcnRpY3VsYXJseSByZWxldmFudCBpZiB0aGUg
UFdNIGhhcyB0byBvdXRwdXQNCj4gPiBhIGhpZ2ggZnJlcXVlbmN5IGR1ZSB0byBhIGxvdyBwZXJp
b2QgdmFsdWUuDQo+ID4gDQo+IFRoaXMgaXMgYnVnIGZpeCzCoCBhZGQgZml4IHRhZyBhbmQgY2Mg
c3RhYmxlDQo+IA0KPiBGcmFuaw0KDQpUaGF0J3MgdHJ1ZS4gSSB3aWxsIGRvIGEgdjIgd2l0aCB0
aGVzZSB0YWdzLg0KVGhhbmsgeW91IQ0KDQpFcmlrDQo+IA0K

