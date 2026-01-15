Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B98D46617
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WMyqdhoD6O7g7byXDTqfJ7+5NcHDiFJ58QtABjWjjw=; b=i3p30n//6Yn5dEW+DOFnT70t4D
	ow9vTNNMsuxCro5e7H5MIqLqCC+s9rBXEByhsOaQZVwC9DXCVWAWS3dfyJVNBXcluI0GQO1nxujK/
	PAC9HPBq4P3Gl0iYsHP7fz+zT7dCowiPBsw7R6KUJs3/26IYHowSxLVu7KUbk4c3Zy1eFOIWgNFyx
	l+cliwC5zNVz7KkU0KGNgIMH5SrAG+w9mV6G2vce+Q04aXZhHH/pPlzUwp3Nm/cLHOSz8WvwQcZra
	Wy2AI5SC63IiY/MgUuDTeT+zMH9PqnhLKDsWFaxC10zkS6f9f9Z6/P29jDtkJIK6xRc0dL9fcUwGT
	frZrHPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSjp-0000000D1Yv-1WVe;
	Thu, 15 Jan 2026 19:10:33 +0000
Received: from mail-westeuropeazon11021094.outbound.protection.outlook.com ([52.101.70.94] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSjn-0000000D1YX-0uy7;
	Thu, 15 Jan 2026 19:10:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyIMa6SEhesPhPvDJlaVNoo0j/+lH2xpPS+pJCUV+rFgFzn3wuEonc6kiz7dJuO6QZWgrmGqF2go1gXMfiUNMVPoFpk/6xWwUGQKIX0l029s0Q4rrJayjH8DQXj8WxdyQAzjLQr9NUVLzfcQfgstIiTJBZv7PFakEU9nVNa2Xl5/b7BkRTV2MKlcoWtcMQCZf0sRlb+gFsQ9ozt7UFujY2dxOISI8nH7eWEX5mQeb7q2/L2QPkWzGa+WjvZtFVr/mqwYDE1GI+jQkLBztEhDA+cJJSMC3wVw3Ynk9dQCHu6q83eb217fIm8bMBaF9xT4UmWrdz4/gVKiHwVLIhJ6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WMyqdhoD6O7g7byXDTqfJ7+5NcHDiFJ58QtABjWjjw=;
 b=XcMptoAGe4jJJIEJUt3mHrBgXkwvgFRs791DouSsgLNl/tSokve8EdNYM8vQp8WyTElvDztBLAu78ld1wWsuiAyHI4A2mxa1Cfk92bVGjxu1JXoEv9e+J8IyltFER4Fru+fQijU/mxOQ65iyYeTVZRQnVy6vTiQsr537Z/3QTH0Qy+AHrSc4SfLg/vy7hOoqd/e+sUl3YE+j72Ipdh7l2wQ7GRSjNw7X6xuns9Ef2+IIxR+FLlxE0qT8fa6uYu9Ixclhin6TbAmIw7RJKIX8AdFmhMlJLt1W2QqlHErTNsWvIaBg2qSb0gZ8vNEXmVg6kTUuWp/TGewBoj7cPKLPGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WMyqdhoD6O7g7byXDTqfJ7+5NcHDiFJ58QtABjWjjw=;
 b=xZDm8P+aV6j1f4idkkyFMszcfStbtqCJBddLWWSSicF97t8wcFMry7Dm6Oe17wlZA0JRkIi00gUahwZ3HfdL+Xug6uHvD0UD50HTMCI+Eb460tYt31p5yFBo1Arf2Rvizpfj7eVnLfRUobfsIVYGEXF8CG3T7rJr46v24i4RRx4VYjl9SJQk8XxcWZt33W0tfKCkzRlMmuMrlg0GEVLI4qxeQpfilE+r4TkVyEJme1PV8nOmhhfK4ytKgQ+VtvKRMLcxPH9PMXdVlk6epDTOr90vZ+KXMOI9inZZbT2JZIatzRbbFIvmGfT/2eeIqOK7bMB9IeGHuESqORsswHUhQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by VI1PR08MB5485.eurprd08.prod.outlook.com (2603:10a6:803:138::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 19:10:22 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 19:10:22 +0000
Message-ID: <c69e5d8d-5f2b-41f5-a8e9-8f34f383f60c@genexis.eu>
Date: Thu, 15 Jan 2026 20:10:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: airoha_eth: increase max mtu to 9220 for DSA jumbo
 frames
To: Andrew Lunn <andrew@lunn.ch>, Sayantan Nandy <sayantann11@gmail.com>
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 sayantan.nandy@airoha.com, bread.hsu@airoha.com, kuldeep.malik@airoha.com,
 aniket.negi@airoha.com, rajeev.kumar@airoha.com
References: <20260115084837.52307-1-sayantann11@gmail.com>
 <e86cea28-1495-4b1a-83f1-3b0f1899b85f@lunn.ch>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <e86cea28-1495-4b1a-83f1-3b0f1899b85f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0093.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::7) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|VI1PR08MB5485:EE_
X-MS-Office365-Filtering-Correlation-Id: bed74a47-a633-442a-76a5-08de5469bb0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzdnMTQzaW1aR29uU0J6OUdJRlhlZWJOSHFpZ2o0QnFvaWZRcEdHNVhrbHpP?=
 =?utf-8?B?ekVvdTNoT0tEQjhFKzgxOHFhMnFtZHlIRHZISVpQMmhvcXhlUm56T1pmTHVM?=
 =?utf-8?B?WEV4OUROTy9WVG80TlRjUzBvM1NSdHRPTUQwMFNUOW5zWlpiRDlsNmhZME9L?=
 =?utf-8?B?b0ZscjZpaW84c3p2bnBaeW9xazA4eVVFL3JDcFRwM0ZGUmVFTjFnWE9XUHE1?=
 =?utf-8?B?N3ppeUFiTGFjMGM0TDY4VmJwTkxvZGgxekRBU2t1bGxpRmVzdEYxTHZwUTZa?=
 =?utf-8?B?aENKQzlQNEc4UFhITFZFTnRKd1p1eWdzd0pGM3I3a0NiSXE2a0phZ1Y4Z0pO?=
 =?utf-8?B?TktnQmdNUzJoemlOVlRGbHZZQVJlMnhmYitUbG5aS0V1NEdMcGxzZyszSkRj?=
 =?utf-8?B?ZnZjV0p6eXNMYmErOU5TYVpFQkJnYnRGT3YrM0dIYklvRzdjUHJyMVNUUkk1?=
 =?utf-8?B?N1dVdmpNR0Z2STJkTFBXclVzQXV1WW1LZ3NaL1dEeWM2M1QvRVgyYTJGNlNI?=
 =?utf-8?B?bGFaVlNKenYraVdxaS9scDh1Ung2L0l3WDhWc04zV2k3WTZtYkdlWXdJSFNC?=
 =?utf-8?B?NWFaeTBhOXdFbHl1UUdDbENsMldXd2kyZkU4V3V5aWFhYWZ1Q1A2VVZNWE16?=
 =?utf-8?B?QTZJTS9jeXNWa1VNY3dPNWY3Yzl0TmNvanlsN1pxVWcxZ291SUtyRThUdmFw?=
 =?utf-8?B?QUZmOGMxZHBObjJWVFJFYjh3Ym5uK1hsS1BUSFRNZzRaK3JNekRQY0NmdkR1?=
 =?utf-8?B?R1FZa0pmVmlQSEgwd1Q5dG15bTVaUS9JZ29hdjQwRTFIK0xSSk1zVUlpN203?=
 =?utf-8?B?cDczdFVSazEzVnJUYm9RNWFGL3JUZFQwd3dWMk8vQ1VtSG1Ma2RBRmJtSmdP?=
 =?utf-8?B?ZHpIck5PajU0SUNOc2hTY3hOU3BJcUFwbS9jQWVHZW9EMHNsZWEwRmZFdFdN?=
 =?utf-8?B?UWhJaVpxQThjYkRxaXZhRXU3VEtJamozUXhXbitWT04wV21ocEJBMjNvYktF?=
 =?utf-8?B?RGNiRzVnWHp3MGJrNmEzb3I4d3RZK2N0TXMwR1BkWjI4YmtKbVZyWDJ2Sk1M?=
 =?utf-8?B?Nkk1aFY3b3JQdWFkYzdyZzcvL3J6YVVUTUlSL2tGT1BLSEhDd2xmSjRYQmdx?=
 =?utf-8?B?cnN0YnpmNEIzRHkyY0NCWEp0R2I0QTRlZXQvSzQwczB3YkQxMEZMdEF6cUpm?=
 =?utf-8?B?SVRPRnBPUmNpcG92dGQ3NjV4UGw4bHNqMXd5bmFFbVkvakhiZlBrWVV1djJy?=
 =?utf-8?B?WkFNRk5neTA5N1Ziem00NVZydTFZZWROSDVIclJDQ2ZUZExVektMcWQrYzZU?=
 =?utf-8?B?NGgyYmNrU0lRZDQ5WDBTcysvQVVLSGVBaGU3MDZGOWJKQzNiNzR4aDJ1UGVJ?=
 =?utf-8?B?aSs2NmJpVVdGSFF2NmhjNXYwajhJeEtwWlVpVmI3a0RCNGFZOGE2dlZRREFL?=
 =?utf-8?B?YXF6K2xWY3ZnUXRJOS9PNjN6S0EvUk1zakowRzZjL1p6bWVSOTVhU2diczI2?=
 =?utf-8?B?WEdwc1I1UUVicGtTMVo4TEliWmpUZWdQN2kvT0V4V1k3eTFndExkOVo5bnJG?=
 =?utf-8?B?aUE0VmRCZisyU0ZRajBpd1ZhTGUxTndFZnRsV0N3M0NTUUZHcTFCb01aTXZu?=
 =?utf-8?B?MW9pZmRmSUV3MzNYWm41bnpCWldVSC8rMklvaExTS2F1aHdrSWluTC83RENY?=
 =?utf-8?B?a0dXcVZvdmpUWHE2QXY0THlKTzZzNUZJSkRHajdoRXI0K2pCWjc4ZlI2akxR?=
 =?utf-8?B?d0x6Yk9ydlRsRk5HUFdoY0syUHprREFlaDFCYkpVYlZmekl2L3dEWkNZcE5v?=
 =?utf-8?B?cXhYbDNhTHFGRTBKaENJUWplQ1ovSzdDeHpRTEx6Z3JGTWttUlVueHRVSVVU?=
 =?utf-8?B?TWwrd2krblZjaHZCUFg0ZnU1KzVtb3VnT3g3TjJZS2dyaS9YWGxBb3ZCVmpq?=
 =?utf-8?B?NW56UERwWGp2OTE5Ry9jUnBSYm96VUJDd21TUTFkWEFsRFM3NFlzbnlpaVlR?=
 =?utf-8?B?ajRHNGs3UHltSVhBYlE0YzZIZElHbnhrYXZGWmlWTTNoQVJ5VDU1ZXFTMFQr?=
 =?utf-8?B?SlBhaWVwMG80MUFIelBiWkFWZHc4OFViU0xlQXRpSWRSMlVpMFVPOVVlK2tN?=
 =?utf-8?Q?Y1dk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFErVWNUMHJIZi8yeHFQMFZ1L1ozVTRRa1NjTWw1Y1lmRlZXVTlRY0QvbHpn?=
 =?utf-8?B?MFJSWFV0aWFEdnFFOHpIQVM0dEFENk80OXp1bDVaK3NqbXh5NzNMbVluZGZr?=
 =?utf-8?B?WVJaWEhsaCtmWXBkZXA4aWg5R2N1aU4vRlNwN0JlSk5xNmRpTkhYZDNZUjd6?=
 =?utf-8?B?dGJxNjB1RkI4Z3RHejU4aHpaUlNYM3dCOVNtSS9zaFRFMTZ6aTNuUnpJeFNW?=
 =?utf-8?B?NmNha2ZDcEM4MWJRTkNiUGppaktpb3JidkNLZEhKSWkwQzM0NmhJOXJFTmRi?=
 =?utf-8?B?dkR2KzNwWENRY0NrejQvaVdQSmEzaXNMY3Z3MHM0QkIvUnM3UUFQQVdWSndv?=
 =?utf-8?B?TGFVWWxqK1dhV1JnSnlORmtqb1I5R0hhZVpONmxGSGpiNTU0eENkcWdyMk1a?=
 =?utf-8?B?d1paM1hva2NqWGVjNFVpNVA0ZmtZNVJPYlBUN1pWMVVNd3VsRXZwNnc3aVVl?=
 =?utf-8?B?U2YwNkk2eG1INDdXNEFGbW1zdS9pS0ZBN0xrUW80MXY1MXFHNmtUb290M3Iv?=
 =?utf-8?B?emlrYzJaVExHREpiY0xNcGk5eWYreTBXN2pZMDJTRFpxNjkyaDZoNCtYSXhj?=
 =?utf-8?B?YmZZLys3UXMvU0V6RVlCQWkvZlR0bFk3d3NlbHhlNnp0YVNsblI5TlVjYTBV?=
 =?utf-8?B?T0NwUkZ4UXdWcjhkQzV2eFZSZnd6b2lkV0lIdnplMXUrWURTZkNCdjhqNVNM?=
 =?utf-8?B?aXVUNEczL2VzcGdJMVBkWTdmMmRyTDdTWTJ0bWhXY1JBNUVIWHUyZ3BkN2hh?=
 =?utf-8?B?Ry80UGpXK2tJRnlFcjV1WlBPRVVXVlhvU0dJeS9QS2x0bDRvNkxxMXVhMWxZ?=
 =?utf-8?B?cUxMek5SWVFMaFdGN2JMNHZGbXhkb21Jd3RodU94WmUrZkd1STdFOHp5RTlS?=
 =?utf-8?B?dHNrVHhPYmU5NWJQbUx6ZmZRZDVmeWxyL0xtK29wUjFCU05xeDBJSEYzaHJz?=
 =?utf-8?B?N0R0SWpXSFhYYjRnNFo1SVhqeXVrVExHNWQ1emVSek1lbzd1aERUTUhsSUtq?=
 =?utf-8?B?SFpDa3Z2a0NTT1VLRE8rUGI5TG45RDZVaDc1MHl6eDZVblE5ZmZUZWNjV0NU?=
 =?utf-8?B?aUQyL3Z0L1hvSHEzVTFqT0x4dkM4MDBMZ0ZJcU1jT2hWemgrZTdTanZLdS9U?=
 =?utf-8?B?WWhzS0MyNHgwYVNUbEIybEJUNEYvVU1ITHA5VHFVY1htNG82V2xqYVVKWUx2?=
 =?utf-8?B?LzV4c0piME1nQlZseU1HWTRrd05rSGZCUWNuT2RCRGxXcXBNcTRzZHAxQy92?=
 =?utf-8?B?U1dUTWd1M1pkeHcxcUdrTldCZ2ZBSUZJN0JHMzQ1d21wcGNSdlBHT3g5RDFn?=
 =?utf-8?B?d3dNMXpOaEpLUC81Mk9VRzNPVVJqcGdRdFZuckphNTVob2hISDQyanJtdjBj?=
 =?utf-8?B?UENpa3AwVUQ1TE0zYmN1QUUwSjF3L2tLdTNQRzdaVmZBRHRPbERtbWRSTnVo?=
 =?utf-8?B?bG4rUm9KZm5TdGQ4Y1V0ZnIzYXcvcG1rRkkrT3gxSlRrSzlVdU50M0N3dVc2?=
 =?utf-8?B?cWFSbXNsVmxvb01jL1ZGeGVSWGUrZXFzZ2tKbm1jWUp5U2I5UkNrMW1SNHFR?=
 =?utf-8?B?SXRrYXhmV1JHSU9vQXRIWEk2V25DZ3RrVHRWNjczc2c2cEFlTkt2ZVAzQ3ZN?=
 =?utf-8?B?cEI3ZWxIVHYwUm1VcW00ZTVGQzRSaitPdEFINDdCZFlJTGRoUnZ4S0ZHOURl?=
 =?utf-8?B?V3N5T3oxTVlKNEI3cDRFVnBhVStnNHJKNHR3ODJMUjlBUTkwdUliVU5aWnY2?=
 =?utf-8?B?UGs2M01RUjhqbUxEWHZBSkpqR0lNcmNEV1ZUamVtRWdROUE4QTZKU0FCK1hv?=
 =?utf-8?B?cW9EdmhZalFPTGFpbnBNMUFjbEllRUM5aGxqT0xKZjYwcDFSZllPeUZCaXJl?=
 =?utf-8?B?YlN5ekRwaFcxQUlmOXRpb2ZsM2FGMWZvSnNlVWJUa3dlQnF2M2Z4RXRPT3F5?=
 =?utf-8?B?VGl0Z1FZakpMT2Y0cjhkMmNZVG5sTUVpRHNWRkNwdjJjQWRzMURyOWFHWHND?=
 =?utf-8?B?bDBRTjJhZUduTzQ3Nm1qR1EyTFhMSThlQzRIelZEZW5RZGxTOFIvR1VLKzQ3?=
 =?utf-8?B?dkQvc1M3QUFQQUV0clBUYXE5bDNrZ2gzNHRQWlcvUU5pVitoYm5odzk3ZDV6?=
 =?utf-8?B?cDYzNE5JeGljamRjN0txZE4zbkM5T1hNMXBaZTJDQkVBUkhRTHBESW51bUZj?=
 =?utf-8?B?aXRpWWl5bjBuNkJjMlA3UUMwN0lRQ1Q2YndZSS8xd0hoNEpuYUVSZkVIUW9a?=
 =?utf-8?B?eTg5cHpCSzRtempwTDVUdmZkbnFVTnhVSDJjc3dOZ0F4alRMWTVab0FWYk1T?=
 =?utf-8?B?Nk8wZ0k2VGp2K2h3eDBvZUo2eU5taCtyWWpJK2UxK3hzaGZHdEYwZUY2dTBr?=
 =?utf-8?Q?kAOouKeC7xkQ2wlE=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: bed74a47-a633-442a-76a5-08de5469bb0a
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 19:10:22.2101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBsfQex4DeAF3IslkjKXrEVL30eSWsZHI95DXYO9vRU0+BxLgo0DbXFvKKt5Cjnc4oCR4C8NlVfAQjb+LydQ4XDBMFeT8OMBUOww/yJ+cYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111031_273741_464AA5E0 
X-CRM114-Status: UNSURE (   8.18  )
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

On 15/01/2026 18:41, Andrew Lunn wrote:
> On Thu, Jan 15, 2026 at 02:18:37PM +0530, Sayantan Nandy wrote:
>> The Industry standard for jumbo frame MTU is 9216 bytes. When using DSA
>> sub-system, an extra 4 byte tag is added to each frame. To allow users
>> to set the standard 9216-byte MTU via ifconfig,increase AIROHA_MAX_MTU
>> to 9220 bytes (9216+4).
> What does the hardware actually support? Is 9220 the real limit? 10K?
> 16K?
>
> 	Andrew
>
Hi, datasheets say 16k and I have observed packet sizes close to that on 
the previous SoC generation EN7523 on the tx path.

MvH

Benjamin Larsson


