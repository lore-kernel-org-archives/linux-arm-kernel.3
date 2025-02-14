Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80D1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 03:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yy5Bx8Bm0Zrc0809orWlPE/ml6oNgbIIIVaiCr79EzE=; b=vVy5GHD/roWWieS8JUHiLWQozG
	+L3NDdkHoAjfMgHJW2XvjFLrlUFFuPgGDGMSV21l4LSBcEPmEai+8PJiG40kOGVeR9/rLMB9ZXKT3
	1/AGbnXsEYJ7O5ACjVO915iKxAEumI/UR1VNea+OV6g/f9QAOMAZgEWeiwUcTXmIXUcB2WX5US4t+
	0vkV3fKGZbbajkF971aF1dvePGO+oVXDbu4vUUGLll4IKaqeCw2GJ8VsdbZmlaNXFZReE7O1BPfOP
	zRoI5tWF2hB61D4jVESomzUAhUgz5nZVoYbAgFi5NN1mSD0Q7JvbOWpiQgAYfPNijCAYkR7sjBW6l
	e6AhRLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tim0o-0000000DRM9-1N8w;
	Fri, 14 Feb 2025 03:05:06 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tillE-0000000DOvA-025f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSgKxNVVrafZN16/e25afxY6ZSGsefBEVGXw6LfmyB8LwW30H9gSVu4C/IzWbp1SnRnj2NC4Wvr7vCDT28+foajW1thqD3yUmv76zadSBWmBxMt5fULFwqu+McncJJ5IxMO162Wo3se3scBhLAtv8oxO8C+BfxBFLy5d9yvq8qODwYceLaAQIa/X1EFwVOay+p6Q3YlSNS5ld0VKe+PEPQd2NqD1OhPgj4VO2ixdgK8TqVR3cXGpJxUmuhuI6bWGjIFm8yERfEjoyg7TqAMM5XI+QXqYTUERowT82QHilub5t8k1u7dvILMqyrcIrLqsVMaMOTy0qfkD3l9RWVDFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy5Bx8Bm0Zrc0809orWlPE/ml6oNgbIIIVaiCr79EzE=;
 b=YQHWUqHQUB6LtxtjHvFUhwt+wrtEWf0kjitRJr67M2fJ+52+x++69aoeGDWOXfYZQFjVpyahJK0PV/S1wWU5wLP7lqyXX8A1JdDcJ6Eo7cB8dPbgeme6/khFqz988J+i9ClUuyQrV/feiv9tntuRfZ2IvhEf35qQpzI4p4TBM18cVvELpjueacGySKf/yA/v3K1y7V6w3fvhWUl7SuY8N0Ej2QV/JVHtGsLsEt7TElQGxGDsbiFswW8cneVgv3SIHsnHWTtFfj44py9l/kp/hSMnq1s+8UffGgvg4hMs3ftWJkHX7rHsIj1R86YrY2b4idHMkcjsJt6XL3eQXlSIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yy5Bx8Bm0Zrc0809orWlPE/ml6oNgbIIIVaiCr79EzE=;
 b=ESBUzxJuNqf6YUgdlhXsN8JVD23IAWgOxu0vcrztLEmTZnMih4d4SheiuxF0irRhn7GwgItjmVZOXflGDVm0wVQKC/YdY9Mg4JL1Uj/c1+M88XgEjHLcyLGMLdmJGRcjy5DBzsnU7MTBvvkdBKvSeoknGmApYzACNwMItpxC5bHLxpyEwnzP8VWcLxfuP1m5r/tCJGYOXB3yGAe2MS+VmJingBegRP9/9uFqlaUOzlmScZgX2+Jui847empTXx7BPdKP8IiCbxHcFljiYbyCjgoet0sY3z4REnL2nZoHqlP2c5U9BwFz/q41NDOBxKJagtD/AVU5MPQBjLCkGKWwaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 02:48:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 02:48:55 +0000
Date: Fri, 14 Feb 2025 11:55:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <20250214035551.GB20275@localhost.localdomain>
References: <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
 <20250212170147ee6863dc@mail.local>
 <20250213033033.GA21937@localhost.localdomain>
 <20250213082032315c4327@mail.local>
 <20250213105257.GA29804@localhost.localdomain>
 <202502131126057bac6f7a@mail.local>
 <20250213133550.GA1208@localhost.localdomain>
 <2025021312544202e175b4@mail.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021312544202e175b4@mail.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:3:18::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 95bfb8c9-6434-4b53-149a-08dd4ca21fb7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2ikXhb8J0WoWDiUHp+ZkVK8X8fDxH6XfUbvZoQ51ybRloJwJJhvK7CbsamEe?=
 =?us-ascii?Q?qk0hUc/cfCSkhFke8IRS79rxEMb7aD+bMgjBeBQu8VI5gn4u7XaePPpSekfp?=
 =?us-ascii?Q?++1QIrUNbHRfiydjAD5GQC51PXKKiGAUc0emrdm5SwrQ8tkFTmOTxXBgY8Bj?=
 =?us-ascii?Q?TTvw7pQNkLpchy17+CNAXxLdoqIYGC5U5DUXFLc/N6dMpv/ZcuvO1m67y7la?=
 =?us-ascii?Q?CyOY/TsW2XUfoQcU/+sro1N8Ic8pQn7UQ5YRtYwYetqcFg/J+J0srxdhWgku?=
 =?us-ascii?Q?z8LQYDYfofJAAUyGf8qJNzg5SfEwGCJqQUV59HaI0I+PWTcYgwZwZwP2AXvz?=
 =?us-ascii?Q?r9i/3N0+86FieH3QVBskion2LnDEFd1GeF1InikMw2KnpV3Liq7ho4S6y6T9?=
 =?us-ascii?Q?hw1hZKK2iJJrOgCgFKJVC0kTXY0NSv/4467UQmV6ilAZ6SfVeAvdIaLC+nEf?=
 =?us-ascii?Q?dfXjyS8BFiM+H+S/1kjeNJwYp8PhYsSuU/dBaRL3P4yuJicoOgFj/Zgl3i1a?=
 =?us-ascii?Q?Hu4mESe32DW/Vt2bbv4ftyCg2MQ+3IbGX+e3tTToLH5IYZJgstzTA08gABhB?=
 =?us-ascii?Q?RFCFWhiQTQjKOWs7kixCcif/JZ6hX079zGaAZBr7mqDh6yCBFg078pkrjUmB?=
 =?us-ascii?Q?kXWpOiTRTs1sgxSLor6NX/zkcsyP3iiKPtSed48Kv+/hLgbvDW5co62g9Bs0?=
 =?us-ascii?Q?TIS/wRNqogF8c/2iInoOtaEMVd0zjNX326jAbXGzcXg2uYvdqDyG3v+AGayd?=
 =?us-ascii?Q?Uy8wmLcBwQ0l/srGdxLBvb9SkRLMmIBIQJrK0QFrjs8YDkXU9mHqfuvwzflC?=
 =?us-ascii?Q?QvFCBIFXfXsgmNvhtGf02ZsxYbV23+BS6k/792fh94X4R2C4lSfB8VsriGJA?=
 =?us-ascii?Q?R7v09fHDSVnABJe9i7LY8AO4GBCSHnCzZ5peFO2kuXOhIpuzR55DKLwQBC+Q?=
 =?us-ascii?Q?ygxj/r8Cv08tOCxEBy5Y7RAAAFS8C0Ls7CGkT939Src6WWjapia4/KUUhwsO?=
 =?us-ascii?Q?lYDKkKBVLgJj5hlqPVy4GXAkW8WEthFzFSQ2XjGLqb06/kJxYVJrEntgugb1?=
 =?us-ascii?Q?PMzifoQ0xqeto+wJV18v5VWHxkpQt5Vu+YOIsRwljoB1GociLspu2idBXytk?=
 =?us-ascii?Q?fAYEUnFDhw3guVO+I9Nsq5sRQR6wRO030fHZGx2ennUrA0rgl3fYHA870YCR?=
 =?us-ascii?Q?+rdRNJQ49h/Wge2CM86y6xw7gdMz4EXSBM7WWb7CwyQQAvHTqpy1X69Av6hh?=
 =?us-ascii?Q?VB7+cdiIz97Y7Ph3G6Pvc57SDByFEUcQQZ7OnsB/Muxs+sECmU5dZztvy76a?=
 =?us-ascii?Q?b5koBq6eV+s3vENb6kgjsN8GMdoIxJ3aOC38UKfF4lwDIGfWdbLmqvZ/um6Q?=
 =?us-ascii?Q?MGi8rpJsWG/kU/wqw6LH3DzaSdDA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qCTg5/WA3If4xZbCf3S93xE6kY2HfaptvhZwtJBA2CCYI9fjnv5IVoyRRFhf?=
 =?us-ascii?Q?bdDRdGpKWSURywcdBNHkcIYGvwEJEHFEcLFieRUt1A8D2QaP0sopKNFBcUHD?=
 =?us-ascii?Q?E7lbLBAN9AYUI8Z9pb1LIKrmYLREME5hKmpDNJvat0QMqwOTuIK4jBU2Fwg0?=
 =?us-ascii?Q?1Xob8WYgJOyDnCPH5GaAfTEugQouwa1KOMF0NROxc+E1+Cp9ZU9qsz5GN8GN?=
 =?us-ascii?Q?jk3MGhIQ83lbApuhf5+15o+hM1BPr172tAQEcKGi3yKAx/tUToElpMGLlBrh?=
 =?us-ascii?Q?noKJEs2JsGiZKqK3OU8z+lorUavzaoNUNERBQfYifVy8zT3xd6MFcmh0Gx0Z?=
 =?us-ascii?Q?fKbKStzOlsVDolBL81CEQN78THPrS9J/VfQfAOH1zmKduLqEuXTUpA7iJ3a/?=
 =?us-ascii?Q?E5o8akCAasQ4b/x59ANTA9LRasG/t0K7jBU7YZSTmVoU+uJftTkGTQueb+eg?=
 =?us-ascii?Q?ph5IGsL1xv3qwfQ5n47p1TqSgG/qTI9+RMmgbj14Dm1jBQ/P3S8Kfami6fNo?=
 =?us-ascii?Q?oW5/S136rn9KvYYa9MRur5BcwCvvwAqeOLB2ubPs9xklIWVhk1iyfYIC2Ex1?=
 =?us-ascii?Q?cBQlLvpHAcwkUhNXehf0LJFQDyZvzwYahxGGJLuDcWwoV8LJdP0IDyrU8HXB?=
 =?us-ascii?Q?QRsqUPIrL6M8RzsgPYNY4EOuV9Skej3MZ7jNi7QH9cPJDKysLKi3YJd6GODD?=
 =?us-ascii?Q?ThOa41ASHiffs4uJLcikSB046LicRPFOcsuU/kW2B+M6IlNWyODtlwPKLi3h?=
 =?us-ascii?Q?ih+iu/C+Q4xZ/RtKJd65MVK+354zlS+mniuGB2247JNcZLCHIy2nW+VuSPt4?=
 =?us-ascii?Q?sJoi40QfZjy+fOfbSmWkgbMK6H7FtvrAoce3f4XqOvOKwszJafymuk4AaZD9?=
 =?us-ascii?Q?iWliuO/q6g78xGf474Hh+UzC5rDrTUWy7f96jye3GMFWfWDhbCR5m8ugy7fj?=
 =?us-ascii?Q?eQszPmaGFW86H0ZzKJHxYGvhf85mNa9YCDiKwLqLBIP/cOqUBt0qGnmpKzd3?=
 =?us-ascii?Q?oE9PrFQ9e/bwDC+aUJ1OZwhHNz45yDBHOFBHvBZHJSqoi75MV3KeIDAk82Z5?=
 =?us-ascii?Q?HVARHAVfOEJzNMkLOZrwTg1oGCWFVU7N1SfsdGCqxsG5cvcIcwACdLXPSx+M?=
 =?us-ascii?Q?h6Njj9qh0bqGCyrFUMQsmX+14YtpTW6BuPdBIB7xptO99rZ1F9O1Mxbs2o/5?=
 =?us-ascii?Q?1KbVIlrTbj2Scilo5dtap4YHJkq9efvW+iXE05oOEIlWhjUcIsw1NoXwWMIs?=
 =?us-ascii?Q?P3FGmejblVh7UMlzd4QqLtGyFAADYpij6NLCXLroJmnFOU2nbf2LjLV6mIOI?=
 =?us-ascii?Q?Sa05RHUfLsr9qA0Sj3yg1ezCXxa+E2AfV041TgEPaz//ECu95b/S5Wy6huXz?=
 =?us-ascii?Q?BoqqCFwudFQ9belNJe2+6s/gPqggZUuL5o9AIi4gfXTD0nR8b5uSPtxiXmR6?=
 =?us-ascii?Q?VLNA3SY+n6xWssWGujvfHN8541fDT4hf+P0Z4nsxaQmE8e603j/Tu2hcvW1s?=
 =?us-ascii?Q?a8CIbL5jU27E+Vm1IxVZKn1g8i3lCiML1gOO07oa9VvN07I8althCjj5OW8Z?=
 =?us-ascii?Q?CeTIINH9fWAiwqLr4tKlXr9z6naL/+N9NaWuaayp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bfb8c9-6434-4b53-149a-08dd4ca21fb7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 02:48:55.9303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iFro3wasCt/Nv0J/doj0BNCPobjjacN98zIGrylPATsEGpSHL3GJUonp3g8m2bDguhXXq1G6AVdle7GxwfMNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10242
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_184900_059357_93A77E03 
X-CRM114-Status: GOOD (  12.88  )
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

On Thu, Feb 13, 2025 at 01:54:42PM +0100, Alexandre Belloni wrote:
>On 13/02/2025 21:35:50+0800, Peng Fan wrote:
>> >Well, yes, you have your answer here, if the firmware knows RTC1 is more
>> >accurate and will be your source of truth, then simply use this one.
>> 
>> But issue is RTC1 is only readable to Linux non-safety, Linux not able
>> to set alarm. Linux could only use RTC0 for alarm with current i.MX95 EVK
>> firmware.
>> 
>> If RTC1 could be exported to linux for control, we could for sure
>> switch to using RTC1 without caring about RTC0. But this is not true.
>> 
>> RTC0 is free for linux to control, RTC1 not. Switching to RTC1 will make
>> us lose RTC alarm to wake up linux feature.
>> 
>
>This doesn't make any sense, this limitation is on your firmware side,
>either RTC1 has alarm support and the firmware can set the alarm for
>linux or it doesn't and then, the firmware must set the time and alarm
>on RTC0.

ok. I thought to export both RTCs to Linux if both are configured for linux
usage. From the discussion, I suppose you prefer linux only use one RTC.

Let me try to update the rtc bbm driver to use RTC1 when RTC1 is exposed
to Linux for usage. If RTC1 is not exposed for Linux, use RTC0.

Regards
Peng.

>
>-- 
>Alexandre Belloni, co-owner and COO, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com

