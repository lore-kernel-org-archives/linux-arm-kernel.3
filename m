Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9AFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 18:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvgiNDxM5LSgNF0oGIA5GwjktEJExGSujVCalEsX10k=; b=XWqpJn3dwtyEMW12tx9fVgUvSl
	y+AQq1hVklaUCz5chSOGAEjnUaSnwzwEsBLTjoh9/kEoNfWhM9RZN0uO6Y6g+ul2UzObGJg5YbXIh
	mBgFhMBkVE801pli1LV0TrExQZsIeo2TVDdzfLe7cu9XwGCkUfeON9L57nNcbGSjWQB33cG0lZRPT
	KlVgO18VQqY5smmG+JEAIXQUSTJZaVQZBTGxONo4SvQuBFOV5bU26tXpxuiaN+1+xdpAFSz8prsG7
	CFrAfhgt1pbeik92zqLQndgPQVDCd/DahSSxd43/byfAEUUzEfoGss31LS/oOLpvq8XaJ9wG+kTeo
	uJu0x09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOoA-000000069b8-48CX;
	Mon, 13 Jan 2025 18:05:02 +0000
Received: from mail-am6eur05on20606.outbound.protection.outlook.com ([2a01:111:f403:2612::606] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOll-0000000694X-24Ut
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 18:02:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4GBLbugApWirKNTMqSdr/GmHJVt2HU9psw6T1Ve2X96Na3DdPBXtjNnrUibElRc9btFf8n8CYupOWJVKnAqU1h/GmNFy+eOHhM95sjSceKqZsqsUEsx0yDWEJUlbpkJWv3Frzu3zV8mD5TinZYfvdJzN2KdELnymWH2j2lg97MKIjnzDmhKG6lx0h/5+jbwx8VmCDN0/gAOuBTe0qTa+v+kV8sC0MOFyuxsoaDVa5YkT98NgXFSJv8PqxEyeesnEL4R9o/916/qs+iD+UTbnbPXVZ5N55+THqGm97zT9sGyyyMzn4yzPEGeAzIVDckEidXiCYq6fA7wGKyZmmgvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvgiNDxM5LSgNF0oGIA5GwjktEJExGSujVCalEsX10k=;
 b=JiBD/0QG4VfyI6/xALhREGkZAgL67DeehyB6sGIwEZml7X4ztAm3YhK6n5al0S8/DUT5aInixpCwEnvT40J3I1x6cJNIwnaeEI7QKqYhltEiGCaZ1fLJgdkYW4wkQSKxUxFES9uNL6qyfM7wDiuoX7PAnGEvq8LqeDjLHZxNLO70ulLvkMzMJ1MozSoWOZOZf0oprcWnuk8xzzQxhjGpMisr4R9Lw/LzZ3D5/aLzOOu21o2UKBsOyHNngzlNAWANkx6sOrOQVh1tHO0qZhIaRpg5ZLRrU+dwB/bsT8FBLbowLe4B7JXg3ytYjXcLCcY6uQ4b3ZchDBhpoFAF7hdnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvgiNDxM5LSgNF0oGIA5GwjktEJExGSujVCalEsX10k=;
 b=c+PqtQh1aLS4UQr45jzGGAaYEz9XPAUh1aFIlLnQkvHCEPKKnxHvY7JmZZ8FJzMVETrPiJDzrwtDd87b4PrdYuUD6uiAf3doz3svGqcKKYPBbXQ9e20lMgcRHmEXu2p2dXQhpLEAlaCUx7wCtTd8hpSGUNbHnBkskmTz/aAjBUsIXmACM1DAc/DCPCcq6y22E+zWUqoXj4IBMBrE7yLQbcYDPlAz3ntFMXOEs6NHpwc29n2d8rRch/KY25Z0fwIcBe09Se4F3sdqZJQsSXNRYiMGgVGl7r8ZAlM++gZVWRzcl19Ei28yXP8M2Z/CYsvWIy0ZSnY8A3H0Zund4+HGOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10774.eurprd04.prod.outlook.com (2603:10a6:150:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 18:02:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 18:02:27 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 13 Jan 2025 13:01:59 -0500
Subject: [PATCH 1/4] dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-imx95_15x15-v1-1-8c20cbaab9ed@nxp.com>
References: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
In-Reply-To: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736791340; l=762;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6Nh2gW0N6SPGWple58ETuG0QHXLY8qvxJe0wOfpPR68=;
 b=zeBfS4Y5XkTlh30yydO3LqPCffrMinc7WVCgPvqu0wUcBwOcSyVGljOiVIC+vv6A3RxcoY1Fy
 +mwbw1vy2TkBVM31KO6u8NV3+vs0GNpd5oNCuGTuMnduh3F3n42G3s+
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 021feb5b-c700-40cd-9106-08dd33fc70bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUVZMjhDaUlTcEkrVFNqWVl2c0dERi9kMzdIS0hHdE0rVzlsYnF6NVZocUYr?=
 =?utf-8?B?bEJ4VGxBZUtoVkY2NGJwdmpUdlNHKzdienB3KzIzNFU3L0RPc1E5NHgyNWdY?=
 =?utf-8?B?QnV2QVE1K0twZ2EyTDJTenYveU1PbGE4WXlBbktOMGJJQlZSYmk2Tjc5bVBa?=
 =?utf-8?B?SExSL3U1YUlLZHNkVVpidUxVYzJkMmlvRWVSQmRSU2dSdmZQZEdaMWNMdXNS?=
 =?utf-8?B?bXppQ1BRVzBKUVRlYnhxaGF5YlhzSVVPbVo5WktkMmxtQ2tIRks0OVVFamZV?=
 =?utf-8?B?M1N6Q01vSDk0MUFyaUIwbnVJOTdrN29DWlFqemI1cEQ1Q1ZodTdZYWlldXAx?=
 =?utf-8?B?RUpDSEIvSkZaUnlJdjVPbjFqaTkwSG1YdUJSMld1RzJua0JlTDdMaU9NOHZ5?=
 =?utf-8?B?a2JDdWlRM05WYUdTampINmFOZFZOSVI5Uk1ncCtodjJwZ3hPVGN5eWkzQk9D?=
 =?utf-8?B?MCthbzE1MUlXbzJuMGE0MjhGWGlDdS9PeGVBYXg3dXhNZmRhVmZPMWxVMEtO?=
 =?utf-8?B?L2d5MEt5Mnd2U2kySituSHBqSENra1VVSldUNFZyK0h4STZ2eWdSZWlPNmFo?=
 =?utf-8?B?NkV3aGpQR1NxSVk1R2lNZm40eXl2VkNsQlNPNm81VjQraGhrUk1paS9qa3pR?=
 =?utf-8?B?NFJpRXFxZUJaaUdES1lLYzN5WVE0dUN4Q3hYYitIWGlSMFN1WEtBZ21TRlBG?=
 =?utf-8?B?THFMQk50dmtYL25ISW9vQyszZUQ5ZXAzS3R5QzdpeWRWOTVsRzF1WENpckRR?=
 =?utf-8?B?cnNIMDlkVHpYWXBWem1PczdSeDUyeTBiZWpZZkt2Nk5FbjQrQ1I5ejNjclVO?=
 =?utf-8?B?bzFnV3Q4cEp0cWcxU2VYaDRZS1I5M2tGbXBJbDVKNm93aU5ySUxtSkxPZ1A2?=
 =?utf-8?B?MDQ1eTFnTTVHR0YwT21CT3hiZmdMQiszM2ZlYjhsZGRyUVRGUzlNZG1ESmJV?=
 =?utf-8?B?ekUxcjJqNzBRN0FzR1RhRWY2NmN5Nlp5aHk1SVNJYUpFZzZhNTU2akVCTnkx?=
 =?utf-8?B?UVoybWVuaEdwNllzZFJSQW02Ky84Q2J5MUt3cStSdFdGOWg3L2hjcC9zMXRj?=
 =?utf-8?B?OEtBdy9COUNjU0k5N0l1ZW1VcHMwQ3JSbG5KMXRENVhheFR1K0RVUmRpNU9v?=
 =?utf-8?B?ZXY0U3V5dnNyaGtHMFpDdy82YTBWQmtDVktRVDdpNmVHVnMvL1dIWnVFL2lD?=
 =?utf-8?B?dTNVamFzMUpXdkhhQzBpSXQxcnJVNVhEM1VIT29VbXpDZWJVYkc0VkJQT254?=
 =?utf-8?B?R3p1STN5eVdKUnRmNzh2N1JMZnh5alUwY3p4OGMvUVVaazNNQXRtTGNuNUdl?=
 =?utf-8?B?TlZOdDk2MzJIMHFuTE4zcTViNlAwY0F1RXFpNUdRcEl3eGtTb1BoL0IwU2JU?=
 =?utf-8?B?WFdlSm94UTBtekxGallvY0Y1RXlCcG92Z3VaTzk3aG5mYmV1TEdEKzBzbjNF?=
 =?utf-8?B?eCtaN1Jkd0o1TkRZZ3YveHdwK05xOHlJZGxnMCtEWWR2RjV2emQwNnMrWGI0?=
 =?utf-8?B?SkRrU0lJM09LRm4xYnpPZUJzUkZVMHBHNWc1YWFrenFwVENKWFdYb1hBSEVv?=
 =?utf-8?B?eG5pdXc4cVl3NkpmbnZJSmxwQTY0N1NYU1RUeVF4Q2JzWVl5Z2pFa1VzN2Fm?=
 =?utf-8?B?RUxSK1ptZzhCaXZqclQ5Wk1Pdmx3ekJ6b3lXQjFGYWpuSkVkSVU4V2dXVVkr?=
 =?utf-8?B?dWxXN2VPOEk1VHZPOTllNEx5NXJaZk03ai9Sd1ZUNGZERzJjUllrd2wrUTkz?=
 =?utf-8?B?Z2c1RkUyT2YzN3JramRLd2l2TGpkY3NOQUtMbFNpdFBpd21wa3MrMVU1dThR?=
 =?utf-8?B?LzIzc0IvS1lYSkZhUVlqMlh3ZWJmcFVVZXQ1UzhiajJ6djZzZGdJYW9SNVNz?=
 =?utf-8?B?TWdub2grWHlrOTI5U1NwU1VLdFJUQ0QxeGR4aGFTUDlCUHhhY3BxWnBzZ2ly?=
 =?utf-8?Q?IRHp8YbwSNJZy52XOsFbrGV+BJ2mjMAd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEQ0NzUrREZ1cnFJQXJMMW02ZGxsa1d5Zm9MUHBkRGJvWFBIRHpEKzVwQUph?=
 =?utf-8?B?TWQ5aWtLU3UzbFRtQzFqOTYrbVZ1N1o4NGU3dHZpMXJKZE0xM3lITDRtbWFw?=
 =?utf-8?B?TmFkY0JhOFZWcUxMTjVheWZUMWxtbmZWUzE5Uzd2RGUxMGsrbkFaUzU0ajkz?=
 =?utf-8?B?ZWZPQVNhNEZqbGJySnNudmF5ZExwVjR3WkR2M0Y2MWkyblN4Y1JGR3lLVjRl?=
 =?utf-8?B?bk8zZUlvZC9wOUlmcm8vMDYwTGtwT2VZc1hpUHE0VFZZVCtlZmdpMVdhMUhY?=
 =?utf-8?B?andyUndFemp4TE9HaFJoU3NqUG5tMzBTWWtNZjdPUnVnclU1YWdqM2VyWWxs?=
 =?utf-8?B?dVB3ZExIU0pPMEFCb3NhWGVjbTYwajExNTRTS3VCdjFLNFZrNEZIbi85ZzJK?=
 =?utf-8?B?MStyQzBDdkN2U0ltR29WVjI2Z1ExQkpMZzdwWmRJR2tXVDdCZCtkVXVjYU9D?=
 =?utf-8?B?aWVHdzI1VjFQNllUdXBRUUhRejVOQjFxMXNIKzFDc3hWSVZTaHVQaS91MS91?=
 =?utf-8?B?ZVhjd2ZHZnJHZjV3dXZSZFh1L0VNc1V5K0g5b1pBM3J6L0VndXJLcUdlbGVR?=
 =?utf-8?B?Y0dHeW1BMkI3cGhoQ0VMa1QxUEk2UFBQWm13ZVAveVAyNXJRRUZOQitCM0kx?=
 =?utf-8?B?VnJib3Mxam50ZVpSKzgwWmdwZkl4b0RBYXorWHdoRmJPL1FsY2VSUU9ZdFZK?=
 =?utf-8?B?QXVPY1FMaWRmR2tlYW1yUXpEZi85QW5tWHhONHh6NlhoVXorNCtwUytjSVVO?=
 =?utf-8?B?MUlvM2NTdHNCMnBNV1FRV1picUdjUndydEdPZUIrbzFsZ294aitDQXQvUXlv?=
 =?utf-8?B?Z0lLOGpWNXUzd1NIWExzMHpNekJoY0hoNzQ4TFpnTTJ3c0xxTGZuNE55YllM?=
 =?utf-8?B?SnFvYlRVOHB2VkhUa3RZTmdGLzZNcUpTakN4aFJOaThjSlB2SXRTYktSQ3Jq?=
 =?utf-8?B?UXIxZFVQVFF5bjNPVzNxbmV3R1ZxTDJiZi9WcFNnMFJlaWMzRnBPcG1mTmlQ?=
 =?utf-8?B?a1J4Zlp3R3cxYWhPWTVyWDhXWmErNGxQTWdNbk5rMFVTcnZwd1BEVkYxNUNy?=
 =?utf-8?B?NnRGVWpjRWlMUTlMRzUxS1NLYTZhY2JJeVVqdk01allrWlNDSzhuVnBNYS82?=
 =?utf-8?B?dUZSWHBBWDlTNk1OeWl2ZTJCZkoxNTdVWGlFVUJsTjZrRXpPSHhmSFU0WWkz?=
 =?utf-8?B?SytsMTZEMWlPR25NQkhvRTljUGJRTytTcUpQUzJPeXJVV2NxVEV0SXRyYXo2?=
 =?utf-8?B?V09jSiswUW15Sjk3aDlzTVNZTjRJK3M1TC90VVIwTjM5M2ZTY2cxV0VDVFRZ?=
 =?utf-8?B?dWdUUVNuWmwwbU9ua2d0UXhrVlZ3SkxtRkFwUGFvTmw1dEhuSU5ZOXljbFp2?=
 =?utf-8?B?bnBVRHlBSTZUQWNYWEY3bVh0dmxySTRKNkZGWGJnRVRaTGR4b0dMWGRXbDhv?=
 =?utf-8?B?YVFxVTZES0VBdmRXVlRTS09DanN0cFZQU0puQXQ1R0ZranMzeWpPbTh6c05m?=
 =?utf-8?B?dGxxTmlpU3pXajNIeU5rS1FDUUlKSUhOcStCYnBjM2VUdUdQNGt1L2xxUVlE?=
 =?utf-8?B?TW5BUUVidzNnbEx2dTdhU1I2K3FycW9BVVowUzZlNFh5MkRCRVB4N0gyRExm?=
 =?utf-8?B?SmtCK2dmV2RaeFVhaWJwRDVsQkVhNzVyUWVmY0ZCZlFvRmRuR2ZDSFNHVHdB?=
 =?utf-8?B?NnhiNTR3ZjB6cGcrcW10c0hMa3JNVmtoVHNCSDZJZmNYNTBhUEN6MmZlNVVB?=
 =?utf-8?B?QUFwZE81cEdRbGFqbmdxWVg3K0p5di9WS1VIUXM5Y0ZMN0ZTVlVXVVd2T0Rq?=
 =?utf-8?B?K0M3NmxlSkI3VElrN3pSZDc3c0w2NkpZWjljRFdEb3JaZlhTSWptdEJNRE4z?=
 =?utf-8?B?VFdERE9KYjBtR3NUaTRRQ0dEM3NEbWU5RVo5clF4SWRWYlpvaXFqMStXSjdU?=
 =?utf-8?B?cVg3Sm1XNXVmNzZwVit0YzJWUW5KWXlQUFgraDdRVHJTejdENEUwM2R4NHpX?=
 =?utf-8?B?N1V4NnJZUkdqcjlGdm9UZmpBMzFqbnBXMkUvTy9wRVhxeWk1M1FDSkMwYTAw?=
 =?utf-8?B?UmFDWmtxWTZZeW9IWkpZQVpORTRNTG44MUlCLzhvRlE1MnZuVmZma1JuaHlG?=
 =?utf-8?Q?F9Kweg0mKXhcWi06c6yvGlRAh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021feb5b-c700-40cd-9106-08dd33fc70bc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 18:02:27.3590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFw16Iaaa0KlUCYzXtUF3HJWcQdsizv++D8RB9XIjt1xlTeusdU0zDF6odG8jnfoH5OfK0THuXgif0VzSTF4Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_100233_535993_FB30FA06 
X-CRM114-Status: UNSURE (   9.07  )
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

Add DT compatible string for NXP i.MX95 15x15 EVK board.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 3713175548637..4d2edc8f1d1ab 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1352,6 +1352,7 @@ properties:
       - description: i.MX95 based Boards
         items:
           - enum:
+              - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
           - const: fsl,imx95
 

-- 
2.34.1


