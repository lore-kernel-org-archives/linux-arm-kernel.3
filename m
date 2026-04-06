Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F081DEF4EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QF3WvKyJzuR2UeQ2pteKdiOOyznY6z90PyrVch19Dc=; b=uTyc/jsXvb5UWa/E7ekC49hEuk
	U9TvfMjW3GRYF4k7CDK7PozKwL+58dEQY3JgSBRMvCY6LHrT4yeCpgRR6PsFzMdAi6gjPp1QzDbtm
	NX+7T5fHdmy6JgXGhicWT+UFviXUHxYuiqcEyTMrNi9/gM96E+eeTaiFKt5Y42fDBNV06gHg8Lu/n
	JQJQXs/dWgQwBRke4Gq6FTX8d9MCmiOAGNxZnbw5YF844uxjgXCYl3ADYctNM7Gb4HVh4o7FXqypX
	ffgpA3pmoP4shLjIidtsk7twC+L7j8PvLRmkJrKIYw+5TLpdWothtSRtub4gjzxPpVhYrBNN+D39z
	ka42qYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9ek6-00000004tkp-1HTj;
	Mon, 06 Apr 2026 07:51:30 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9ek3-00000004tk2-29so
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 07:51:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HE/dioKZZ6dii+tG272HxND0/+VxNBkEDK37/y7w2sA7ac+PKZ2RRohSCbXm4S/3biKcol8s6ugtO6f19xPFAkib7SUaWffSfJSvPIFqFHTxXnFB4Og6vOMNeKFG7YSc/nK58Dq4T3XB07U+xcwzAA3mhdrZScQ0AT4IzcA0YKD7VMdsVIKSlwVbhYJTtVWSs5uQudAmzb4RDlgsp29bPRHVkfNIx6ZUYR5qXSKfkeRwnVYjj6PEz2yDai/W7ro4iG57/Ezjdjz9c74uTIIyGhQ7phOj9sCfqcibH7nu0gn0yxE8TQLzVxi8u/anTwEFOjZWUyrqclji+FYkLC86lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QF3WvKyJzuR2UeQ2pteKdiOOyznY6z90PyrVch19Dc=;
 b=FjjNDWqexoLnpLe4HmYtsA5aRcPN93M4drzBam7XhQwbh2CpHZqkAjjQ66yOq3oBfzGSBU4ZIh2x80KUW/L/4tNom1jYO8061+m6C93AhLkvYSO4E3csYpSsWY54JPZlkXHBQoHMhNsrmUPBISWVIh6G14B0gzspU6ydlbDW0LMWLXVaLa77Me61+joOMZCstmWMLtzZbE//JGx/8ygp6eOZ8Nd0/nLhUnTI2ktVoZ8J7BJLxkzJZtZzujqyUt5pNMeNee2xUXiUgiLWHuenS1vJlM4Pyhkz0DK0XjAbEDBYztPEwPbCTJsb3Q/42Mw87F/NQGqcT0olGIcp2b17MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QF3WvKyJzuR2UeQ2pteKdiOOyznY6z90PyrVch19Dc=;
 b=jT8FJUiBja29m8IBa2jOxE8l+Sqd1lgebEffCHnRL6kiLbBvq7PkJK16re+Un1aavF/LBLz7P8deYqI29zg0co/yr+GqDxemsD9Hmoz1YiEHC2D9idspkvjQDoibgE5VAPDiU/QQSa5qCBPcxTmqZWZbqxCfcNosIRsTw+A8wdAAa6Y3H4zPVHw7g8Mx8/IRg6dS52GtvWbg0Dsym1BIZr1IxXye6N54taDYsyoV7HJR8/Q6+SPXJJzj1gmYf3PUU//aSd+IPdJTglbqKM1aEosR2hRjqGLRO1pIGyzWZdHDkRNyzcsDVQmQvwnO7USmmx2jRthU4blI0wkVZzZwaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 07:51:19 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 07:51:19 +0000
Message-ID: <0ee87f3d-64a8-48de-a213-e3ea604a85a9@oss.nxp.com>
Date: Mon, 6 Apr 2026 10:50:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] can: flexcan: Add NXP S32N79 SoC support
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
References: <20260326135825.3428856-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260326135825.3428856-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0336.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM9PR04MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 39910a20-0daf-41b0-0342-08de93b149f7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: a+xt4kXeQ6uatTWi7MFzpalQipY5GwH360Hd5gOhL35PENASyZBPguPaw72yZ/92g4Z6eSKgEE9+/P3H5aIWNteKMkoeIKQQ9lp7FomvcE3wzCDwZJ+VuP2ZwMXQdBJvY+FvA2OuMXZZzADRMoHrRbdhUUl7bTYMEYbMwItoqXLYbMh2C97t904TtfLgTKd2xlfcOcPhoRl2WQPax3JN4RgvT16eMSW+yUWcgElSFpr0CGX/xwibFUfWst3Ks0Y884BNKEy8wpee9+PYXl+4sgPNKcCIu10Tp6cJKS7HfrbnJn6cuQtN6S/g6YbQdGa+4LF3zLg5I1ruHo0hOgVYXWN5sUpQHdsgJh8527G97R6AqwihV5UXPuoZAeDJJ2jjCD2w/VcMXki9sNVU9EB9fI9/tp45orSbs5/1zlaTSqWJwAhcIz1SwDnD85/osZjXCYgd1YwGsVgSJPqCzvrK2Q2lE8l/47udX37Av2HqqZ7UbE9dWku28PDVmljqvTFBIG5KemmqTbKXez27Vmjxk38hRGbqRy2XwhudjiEh6N2mCZsH0d1KwnbqKwqGdP6HQKXdieQTGx1hjZXAR9UA6/2d73wvjSTkh/iEeu14EQr1I4S9V8iSp4cJd3Hfhpqjvmo00ZNPtZ84KDHTwiAJzgYK9ZCkjPj00d5cwWRZ7SKyVzypPLVeonUvKHCc4RuB8M1nwM1Zm5Dk1HXp6DRaECmaPDOfg8S009Ha1eMyFRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWdqWHJYbXFURnBZUkxWU1hxY2VYVm1Cc1AvU20xaHpUREhkaVpxcE5peitt?=
 =?utf-8?B?TS9DYklwZHhlVnMvdklXSnU4TUlHK3Q5bnlIMDdpTlM1Q0kvQ1VtOTNDWWZG?=
 =?utf-8?B?ZXI5aTJEZFRQRU5yWlpIVmd1cjVEU2IwSE9PNlFSQmJvMlNIcGtuQjFsSTIx?=
 =?utf-8?B?LzNySkJkaDdCemFnSGlENVhoT2lWZGxnbE1aRjBVUTdHclV3bzVrNTJMS0VD?=
 =?utf-8?B?Lzd0ZG5OSmFsZ2pGOXMyTjd1dVNmRXN5VjdKTC9HaEdDcnNFdWlIZzJQNmFt?=
 =?utf-8?B?bzZqMmFHMFQxYktYUklXZndhTjVpd0pOc0hXS254TWRsaFZac2RZTHpnRS92?=
 =?utf-8?B?cTA2QjBYWGkxVFZ2Wit1dHQ3aElnc1EzOEtOT0o4dFo2dkxqdFVQdkZwTHlT?=
 =?utf-8?B?QUpRejZKQVNMT1hTSkl5dnUrWDh3MHQ4MXdtcXRDSFllV1RvVVE5OUMveUp6?=
 =?utf-8?B?aXE5UFg5Yk10WXZpcVdwNWZFU3FMNEJnb1NmVitqQjdvOTFzOW9mNTUzemdm?=
 =?utf-8?B?L1dlTXpOd2w5b0plYzJ5djNDYm1DaGxzUDQ3Qm0yUXRCREZ3Y1ZPQmhsa1o5?=
 =?utf-8?B?R05ITnhtSnIxUitNTFkvc1Y3cUpYQlU5dmNHL0R3Q0p4djdtLzZ0WEtpSHdS?=
 =?utf-8?B?SVFHZFNxMVdwK09LTXk0ejVnc3BiNVF0NUtqa2Y0bXlaVmVlVHlSd0t4TERs?=
 =?utf-8?B?b2V1ZE8rdThiZk8wb2J1eUFaMjRLWVVQWCt4QzhFcnZoVDFPQ2hQVmlQMjNw?=
 =?utf-8?B?OHp2MW9XUXQvRWdBaUcrVTgrNEFpbitScUI2c1FobTRUT2dTWVRoQmxsM053?=
 =?utf-8?B?MFdMQWhCdkF1NVJzUWZtWkEwY3BWRDM5T0dUQ1ptcFMxTlp2MzNycVJON0JF?=
 =?utf-8?B?VXVwbC9sMDRaR1RXU1pCZE12YktpSW9IWTErL3R2SThVeE9IUTJrVFl3K3Fv?=
 =?utf-8?B?Q1RtTWkraG8vYUJ4RUlmem5Sak92YmNickFCUVAzRUluVFdxb2hHNk5OYTcx?=
 =?utf-8?B?NFVMeVplRjRJM1JZRHVMNHlqcm1GcWV5Y2JBcjRZZkhUMVp1WXpia2U2ekpN?=
 =?utf-8?B?anp0cG42SUh0Z08yTWlZWDJDa1BiYkt3SmdLT1k0akZyaHpYdUdxRmRsQlVS?=
 =?utf-8?B?SmVWeUVyb20yYmhtS25IQXMyV0F6SEpGbXV3S04waENmMmRBZjU1MjgxQ0ov?=
 =?utf-8?B?eklyb0Eybk9aQmRERXNGUC9nTURrTWhiaCsrQWg5M2ZFUXh0Y3hHTmFCc3ZS?=
 =?utf-8?B?c2hLcm1ya0F0dC9JdFcwdzBFSlJYMjdIM1l2S3ZVZDZLTGxDYXZvSDBqeDBs?=
 =?utf-8?B?ZUlxOUV3UHlZcXJnWEd5K3RSSFV0elkzanlRMitCcHBTeWdVUUVteEMxVjAr?=
 =?utf-8?B?Q0QrQ1FIZWNYS2VUU0lQd2FQL2ZlVThRdTlIVGQzSGhWT1JFM05pWTdlUm9j?=
 =?utf-8?B?OXIvN1RpZUowRWxOUXBhVjB5RThHeXhpOFRYVmxBdFA3SGQxL2pRejkxa1Ez?=
 =?utf-8?B?OFRPbGVRUHBodlRZZVo2ZW0zTDEzWWZKVFVHTzl4R1luR2JQbTJObHRtODZx?=
 =?utf-8?B?Q3RJRVFkcDVpbFNXdzA4RTMxR050WnQ0WjRPT3F6TUhvTjZIWVFXQThJVm5S?=
 =?utf-8?B?a3lRanhOUU41T014cmE5WlZ2Tm9xdGlpSW5xNlplSFlFRjlyQVZZMm14eWxF?=
 =?utf-8?B?MjEvS2tYUVRLZTNSNmhIY2pvNmVFZHhXSml2WmRPcmNTNTU0aFNZdlNoc1BL?=
 =?utf-8?B?Yk5iak8ycSsrRzZrUWJpSHp2NCtvUVhiTnlMaVlFY2VZNjBmQVkybHhYVkpD?=
 =?utf-8?B?eU5sT0dZclorRmpNb2Jud0J4bWNtUHQwekt6OEpCdzduMTduZWdkK0QvZFhQ?=
 =?utf-8?B?cDhWSTFDVzFTVVdydkdCbFRxRTA5c3JGWVo3cU43VHRjVTZSYldOeWg2eTln?=
 =?utf-8?B?S3doRGNvVUs5T01BTVlGUE9LMWJRNS9EdDkvT0RsTnNmOFFXT0VoLzFpbnVi?=
 =?utf-8?B?cGpOU0FWMEM0bkJ1YVEycVJiK3NXcVR5TEZnOFZzMlQ4cGZiWHdxeUZZOHVT?=
 =?utf-8?B?SXgxVmVHRW0xaCt2SEZyUVpXMGd5L0doSlJKaWU1dHRDYTBLdmJvR3gxYTNx?=
 =?utf-8?B?L2RYOTRpUUVkM2dqelc5aHhBWUxNSUYzb2xuZ0dRcDhoamlRMForNjlhc010?=
 =?utf-8?B?R01BNVN2LzR3TkdqWnRNanQzbXNEMnEyQUoxWFR3R1QrOW9LaGpYT0hrakVN?=
 =?utf-8?B?a2c1d2JKOVk3YVF4QmpWQXZYRE93Z2JPdWZ3ZTkwcFZDVXl0K0RFUENoRm11?=
 =?utf-8?B?ZC9FdnVSa0ovelBQT2FvUW5rU05mbEhjUExadHErUjV2T2Z0NXFvZ2tnUTVj?=
 =?utf-8?Q?svKkTASa/5eDCymM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39910a20-0daf-41b0-0342-08de93b149f7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 07:51:19.5878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHOj8JYlYqoz28UM6SHdiUtXX07UIEv7aHadCt/mLAe+A6JiDgUCDS7himhjjgGhs246hV6qhFHVMRZLccUCXCpOCPMI4bbET1E4XIp80yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8652
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_005127_730122_5355DDDF 
X-CRM114-Status: GOOD (  19.96  )
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

On 3/26/2026 3:58 PM, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 

Hello Marc,

I was wondering if you had a chance to look at v4 of this series.
I've integrated all your suggestions from v3. Please let me know if you
see any further issues.

Best Regards,
Ciprian

> This patch series adds FlexCAN support for the NXP S32N79 SoC.
> 
> The S32N79 is an automotive-grade processor from NXP with multiple
> FlexCAN instances. The FlexCAN IP integration on S32N79 differs from
> other SoCs in the interrupt routing - it uses two separate interrupt
> lines:
>    - one interrupt for mailboxes 0-127
>    - one interrupt for bus error detection and device state changes
> 
> The CAN controllers are connected through an irqsteer interrupt
> controller in the RCU (Resource Control Unit) domain.
> 
> This series:
>    1. Splits flexcan_irq() into dedicated handlers for multi-IRQ platforms
>    2. Adds dt-bindings documentation for S32N79 FlexCAN
>    3. Introduces FLEXCAN_QUIRK_IRQ_BERR to handle the two-interrupt
>       configuration
>    4. Adds S32N79 device data and compatible string to the driver
>    5. Adds FlexCAN device tree nodes for S32N79 SoC
>    6. Enables FlexCAN devices on the S32N79-RDB board
> 
> Tested on S32N79-RDB board with CAN and CAN FD communication.
> 
> v4 -> v3
> - flexcan_chip_interrupts_enable(): disable/enable all IRQ lines
>    (not just dev->irq) during IMASK register writes
> - Split rx/tx masks per mailbox IRQ line (struct flexcan_mb_irq) so
>    each handler on S32G2 only processes its own MB range
> - Added received Acked-by tag on DT bindings patch
> 
> v3 -> v2
> - Split flexcan_irq() into dedicated handlers (flexcan_irq_mb,
>    flexcan_irq_boff, flexcan_irq_berr) to fix duplicate event
>    processing when multiple IRQ lines run concurrently (new patch).
> - Added flexcan_irq_esr() handler composing state + berr for S32N79
> - Ordered quirks used by s32n devtype data by value.
> 
> v2 -> v1
> - Renamed FLEXCAN_QUIRK_NR_IRQ_2 to FLEXCAN_QUIRK_IRQ_BERR to better
> describe the actual hardware feature
> - Appended new quirk at the end
> - Switched from platform_get_irq to platform_get_irq_byname usage
> - Updated interrupt description in dt-bindings
> 
> Ciprian Marian Costea (8):
>    can: flexcan: use dedicated IRQ handlers for multi-IRQ platforms
>    can: flexcan: disable all IRQ lines in
>      flexcan_chip_interrupts_enable()
>    can: flexcan: split rx/tx masks per mailbox IRQ line
>    dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support
>    can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk
>    can: flexcan: add NXP S32N79 SoC support
>    arm64: dts: s32n79: add FlexCAN nodes
>    arm64: dts: s32n79: enable FlexCAN devices
> 
>   .../bindings/net/can/fsl,flexcan.yaml         |  30 ++-
>   arch/arm64/boot/dts/freescale/s32n79-rdb.dts  |  12 +
>   arch/arm64/boot/dts/freescale/s32n79.dtsi     |  50 ++++
>   drivers/net/can/flexcan/flexcan-core.c        | 249 +++++++++++++++---
>   drivers/net/can/flexcan/flexcan.h             |  12 +-
>   5 files changed, 316 insertions(+), 37 deletions(-)
> 


