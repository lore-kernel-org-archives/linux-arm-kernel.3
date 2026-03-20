Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB701098782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtgB+JNWA2dYKC5mvJH/Jhlf15v+JjP/OoiHydeOTiw=; b=eyu1jBV3SvZwp98dUs/+6hCmBh
	mSRH306BdUu2AVSL8cBIRo0FPugIcJHXirHhYhLacgCEGu0ZQ8Py2pRY0ginmMciTZXIKRgw6w3IF
	tqhhrjcD+r9Q9T1kHJyYg+IU/bChnpILyVEwC4XN0eqAMWVvjHikrxz7z7yAiSIE4Uj5F7UUprC1z
	sdL0nDmCMT7G9g+uWo4xRdDSDdlLgBM9wgkkE83//el3jQP3fBcklvp3UximdoZqnSzD34AzycjG0
	/qEaUKU8npZWmOEhbTCAfkasyLPYAolbM7DL82oTUVi2vynkQ8moIOdlwTFptUZOF2h9py4ylZBNc
	YgcRRSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aJZ-0000000Ctb1-0xyj;
	Fri, 20 Mar 2026 13:55:01 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3aJW-0000000CtaZ-3ZnI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:54:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMMFTqwarkM1edrz3vMUlDKuNjG5skpSqKvQmeZlZ29b9HGxbxG2BYz3oAyIwDHRkDZ5dWwfzIR9iapIWaP7HukI9AIis4lZMiFccLhBt2cRNESIhe+ykQb9HKDSaVvjXhGsSDRZV6WCloiHMA/VdiE+nzsu7KW6WuGRUCQJnD1rKoU3N6sb5J+qfwuq62cRlDkld3hmJdnneoGXmZRlGcAJrnAP+l/KSHHYwcGf3JJnHkYLR07H3l42rAA/wZIsgdfFOB6677pQck5F8pQEl2VW/wJiXj5YHdUpniW6YBmUms8ZeJE63jwm6MlsBDYwCxT8xiSLEs79KMAHBM0eWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtgB+JNWA2dYKC5mvJH/Jhlf15v+JjP/OoiHydeOTiw=;
 b=lxqswM6Wg0RtfFVVQfvPElFphamMBSWvz4BwxOnSiiuxZj4sQY79QiTjWr/nxBF6y6jCiY5tQ/W6Om0GmBSPlJ1GLq/FGW8pVawzCOlmK7iSrDCkJvO5THRrK8cmodSEpa6qjdhOKfC5Ngqmbvuzisq2Fc2dGr35Mj6lkbQEfGLHwbADULbrUsXUOJK7k6VAtX/RsvuqmlsS7679IcESB1mvKxRo8eJcWVbjJNeTWHJGjpf2hryQh/H35V53v5dYhEjFfV0Hqt9RzfWlDkEZYrYPM/IdmaM6zan/q3Xx7DEAm2M31O1UFuXeHzYYuntzG+/eiOlgeDm8GLIPA3rVBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtgB+JNWA2dYKC5mvJH/Jhlf15v+JjP/OoiHydeOTiw=;
 b=l6u37aF2TOuRrWDf/WLf5/uQaktxTMkJNh8UXB+UZLeY42upytEgNwZBKHpaugF/RYJQOI/yWRJjrG3APH9SA7t/49iPRMq1TwWuvbDfwaRND0F0wM8v2q8VeNixSJ9HAY/C+0AqmPhVWKC2o3xoq6VuX0rCuoyJ7NDemdGGwoUA9vb2AgxtnDhlKaJ/Sl/sVzVG8TT8ag3om3Wq+yCeHOmg4Xm9lg0abfEoAR/x/ytPHA4UV542AX5P8Tn2XDQTgAjpfjTH/mKwy5W2V1ea0W7ckLLSiF+sc0pBW2jHPJspReNQh4Ezrd2EoSe1zHzE81sQ0MkNbc8kiYM9BfsaXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB9959.eurprd04.prod.outlook.com (2603:10a6:102:387::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Fri, 20 Mar
 2026 13:54:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 13:54:51 +0000
Date: Fri, 20 Mar 2026 09:54:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3 3/7] pinctrl: pinctrl-generic: add
 __pinctrl_generic_pins_function_dt_node_to_map()
Message-ID: <ab1Rpf2zS8Bn1-HV@lizhi-Precision-Tower-5810>
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
 <20260311-pinctrl-mux-v3-3-236b1c17bf9b@nxp.com>
 <CAD++jL=U2xNMMHk_LyH8CX+YpC5EGPVRasM11yesXSH4XLhqYw@mail.gmail.com>
 <absvZ5wzAwpbjHf1@lizhi-Precision-Tower-5810>
 <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkp1CFcLccmLP0BWQSBKkruGCPT71dMeuyu3JY1N4T50g@mail.gmail.com>
X-ClientProxiedBy: PH8PR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:510:2da::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB9959:EE_
X-MS-Office365-Filtering-Correlation-Id: cec7b314-b89f-4a36-1da1-08de86884187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: +lYvZtxn76RtROywd0ZJs+PZ3cfrySdRTNjrpZMCijmgmdPqxxMYJ1/2qs9NyuFIPNMvhyfICbm4ezN5gqHTXuwrUsJL7X9ZX4ZhB1f5eZ814qAGsXU0ll75G03pQPasyT05zJL1NXAYSacPH//K+8CHUuAzSUTUXCEZXTKTFiG1kUbIvCb6vhjyOwQA8D4aZGUvkbmB8XWRQQRZpDOEgsUVUa4ACpxOWL6egt4AcQSuYRfQLDNim9qcHvk8UC0584Fdc2WgVeLmtFJBZk5TXpwuGFvVIWiBr6hNnws7Ksn0ndlUZUKnzGQK4M3+2Ux9rDUU/E60nw8EqmndoRjKaDTFaQZlh6biZvPS4Li7CNq7X25qPNK1G0Z9gNO6+ivLS1b6YiXNPfZ2gJCro40pPnPsE8u5i4N/NTx4T50rMibhU2hmyzg/fWfJEYbRK9pHnsrTZV2H5WKdVFxLZ5fUlP/ipggKsp69iWcyEsr4N2MejT0tog8ChU42thILKoOVGoUDY3DmyLyPY+wSCKDYAp81gVgs78+oaTi488ijfeOtf0SsOLK8WAGz6rfbFhveeapBSDBRL0t+/ZKiy5eS40fyRrj5udlKRTinQYGSsCcXjEaea+3VhWuKAQHbErNl0PRzH2eKZ8HyZMWfoM9xF+VIS7DA9UuQgW0ca11PthgSPRQ24YVjnxiwUpgNhTAbDc7Va3XhxJ+UDaWAwgaOjQxSynLQpKvDb24erInAykEC1bRFZysYuTvR54c3lQCmNKm7WrhYTAdXF1ZpWz5I3lGGxXBrNy7IG2KMD/yfFSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWxKWm5ZQXBmUDVNcHdXY1B3U0kzRHdISDMyREtta1BZdldUZ0tFUkwrb2Zy?=
 =?utf-8?B?RXFKdDdrUHBLSEgwZ0dWVXFETDgwanB2TEQwQUExY0R6NmdvNWJwZUc1ak1B?=
 =?utf-8?B?L0IxZUUyYjFjZ1poYU1QNTYxblFsUmErdnlVL1ZjWDBNQkczSW5yRHhLMlc4?=
 =?utf-8?B?Tk1jNzNSTVlDTFJROHFaZEVONnprTlArZE5XTXU2V2ZaTGVtSmJjbitxVzJm?=
 =?utf-8?B?ZkYwTEcwd21RMVRIeVZqM29LUnVvblc3L1ZBcXk4TE8yVTlFVGY2aVVaRkhR?=
 =?utf-8?B?QTBJYUs5NWQ4a2xkVVdwUDZoQnErNTRnK2hJNEorU1NocnFRa3h4b2dHblds?=
 =?utf-8?B?LzY1aWlGK2p1SkJEd0ZqSFBXM2hJVlhqUCtKRFNwMkxNSWcvaFlNR0Z0V1NB?=
 =?utf-8?B?RktoRVltUzBQRVEwK3dqclFNb3Bra3VaWXc5eFNXdnZ0SlVoQlFRNnlhb1B5?=
 =?utf-8?B?OG1jd3YySEQra1hhazhPYzJhdDAwd29kKzZ3VVd0MGdNRStRM01Obm90MVJ6?=
 =?utf-8?B?VkpuTjBuNVlDRWZITmFKTDlKdnVHdkRBVzluWVFwYnNYdWhFbktzeWRyczFw?=
 =?utf-8?B?SWtrUG41ZDBIbmlXRlZPTEpPS3kvRFA3M0FiUVM0VGVtRElpK3NXUlNhcWcw?=
 =?utf-8?B?aC9VVlBwSmFzVklEMzRNUW5leExpb294Q0ZDYU9tWkxoWW1uL0J5RmpMNWtQ?=
 =?utf-8?B?Zjg4a0xjNS9tS0tYaVlaR05YcEVYUURpYldRT1ROZGorbkQ1eHoySlNzcUFi?=
 =?utf-8?B?QzkwVDBlM1VoYndZQ0pXVkMrQkFCa2oyblBHejZNMTBseUZUUDBzT3cwdFpm?=
 =?utf-8?B?bXdXQVIweGZ4dmlvc05xYUMrdVBRdUZJOEVCSFZDdFYvelg2eHVSaHdlaFFs?=
 =?utf-8?B?N1NVZmhucTNIMnNUSDBWWFY5bnVwNStSWnBGYXpnditoS3ovSXJsU2J1OVpC?=
 =?utf-8?B?ZUdVUHQ0dytpVGFoVFlxU0tqNUFRTDV5RlpYc0xZWisxaERFanhFWWVpN2JT?=
 =?utf-8?B?cG4vR2xmRDJGMVZlajhGeHVhdkNUM3VTQmVuRUJGS3hrYndNSFlabnBOWkJN?=
 =?utf-8?B?ekRXK0JHT0lzK3Z3b2JHV1FoMVBINzVrckovNTZNTkZCM1E0VUh4YnFjRXF4?=
 =?utf-8?B?RkNscDhxRmhtMlBsR1ZrakRnT1g2UnNGQlNRRWhTMnEvT2JMaU1kRUVMVDRR?=
 =?utf-8?B?cDAzT3A1TFlzV2M2NTd0elB5dHM4NzRXVkVyTXlUSWhIWThqUTl4aUdMMWpz?=
 =?utf-8?B?U1VmWHVlTERWV3ozVnNZQmVrNG4xMTBhdk9HTUdFSFBzbHdlMWFjQmxRMDd2?=
 =?utf-8?B?Q0d6M2pqY1NuVE1ub285VUo5eis0dU1QMzNnUVFqT3BPMC9JZXh0amN5dGZ4?=
 =?utf-8?B?dlNXRWptUzVEUEk5cTJZRlVpM3RNRjk1czZOdWN6c3pMT1R1VlU2QTVCdi9B?=
 =?utf-8?B?ZGJaTjMrcER0NzBwM254TjdUTFJkQ0llZWhhUlBhLzlVOXQ3YkovdnZFQW1S?=
 =?utf-8?B?cHM0MUpWazhBYTlEdG9hOTd3Vkx0TjZqNVVvUVhsUzRtakg4akNWVkVVQStl?=
 =?utf-8?B?NEcveUNYc0NXUFpLTGt2czJMYURYWk1PVkppamlPc1BRcGVvY2dRKzFFZHJS?=
 =?utf-8?B?OG1JSDdhV0dhWmw2NEpxL2JkNlRwMEdOU1lWZ0srYi9XWnM5VzJMVDVpamtF?=
 =?utf-8?B?YXJaTEEyZlJpdWlwU0QvbUdwTTcrWnN0SkdDeWVIcE1NYzVTR2l5c0JyUUw2?=
 =?utf-8?B?UmoxMk85cUJVcmx4R1lxMlc4ZTlPNHdMWjI5V2swcm5Oa3N0UjZqVTVMWitS?=
 =?utf-8?B?VS96TlUwdHBLT01JNzRHUjhlNTNpZ29VWFZJUW9yMmo2cWhHNU83MlVMNFpR?=
 =?utf-8?B?d3FISVQ3bW41NU1jMlhnRWlod2ZEcFQ2bG9iUmVuZnZEZXRFMkVZYk1xdi8x?=
 =?utf-8?B?VTBpNTV6TCtQTDNlc1cwMUNBRWV2SnJzdUZMV0o4NDlCQ3JBRk9CWmtKcVNs?=
 =?utf-8?B?MGNlbHljOTY4c1pkUWtMajg4M0RuY1ByQi80RytjcWYvSVVocUdGQ0plUDNn?=
 =?utf-8?B?WXBneG0zekQrT2dUcFZ1bHRIK3g4KzNxTDdCMDc2Y05zZ1N3TS92eEl5WjJa?=
 =?utf-8?B?S2prV3I0ZXIxMmg2RTdJeU9HdzQ0NWFZdm9UZTVObHBjTm1BY0o0dXo3TjlI?=
 =?utf-8?B?bHV3QVhNanRWMTBIalAzTzZ4YUF3ekV0S05XT2FWYmpFNy9kYXZIK0o0ODdv?=
 =?utf-8?B?SUU1NnB4NGxiUkJUTi9reU5zT0x4UG4wVXVlU2lQR28yeHBONnVMZjZqdExq?=
 =?utf-8?Q?tP9VPGi25lqr67K6Gx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec7b314-b89f-4a36-1da1-08de86884187
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 13:54:50.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odbC+Vwb1fV+oNy3UNRyjBYOiEoLhkVvenA52Rkd5a1PK/5ToI2godGD3TRaQw13M8UKb4u4T4KeY3nbrKX5jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_065458_895023_A3A433DD 
X-CRM114-Status: GOOD (  13.45  )
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

On Fri, Mar 20, 2026 at 02:27:21PM +0100, Linus Walleij wrote:
> On Thu, Mar 19, 2026 at 12:04 AM Frank Li <Frank.li@nxp.com> wrote:
> > On Mon, Mar 16, 2026 at 10:37:28AM +0100, Linus Walleij wrote:
>
> > > That said: in this case you're just adding a parameter, just add
> > > the parameter and change all of the in-tree users to pass false
> > > or whatever you need, these is just one (1) in-tree user anyway.
> >
> > pinctrl_generic_pins_function_dt_node_to_map() directly feed to
> > .dt_node_to_map() callback, add parameter will impact too much.
>
> Why do you say that. It already has many parameters, one more
> or less doesn't matter. It's not like this call is performance-critical.
> Just change the users.

In only user drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c,
	.dt_node_to_map = pinctrl_generic_pins_function_dt_node_to_map;

pinctrl_generic_pins_function_dt_node_to_map() need match .dt_node_to_map()'s
declear.

So it can't direct add two parameters in pinctrl_generic_pins_function_dt_node_to_map()
Need simple wrap function, which other in pinctrl-mpfs-mssio.c or in
pinconf.h.

If add two parameter in .dt_node_to_map(), need change all functions, which
.dt_node_to_map = xxx_to_map(). and OF core part.

Frank

>
> Yours,
> Linus Walleij

