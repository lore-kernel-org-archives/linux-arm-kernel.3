Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A330AC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 01:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BruyVMdUKFURAgvZslJ7emwrXec2ZNY+Wjw4zYUwcw=; b=MUz+FnjuFEhkGK1ueVFguNhg3y
	gPmySJ+ZWwXmj4dbgrU5oQ04cyt7l3d55tPPKLe0MwkHoQhfi22q8gnyKloCqJUU9nAt4pTOd4JJ2
	kc61KGnC2qkTCiElQovB6onK0i+SLvjnxA3g4B2c3WV6+XSeOSiQISFLsmZoibutbyM1i6+yX6ISh
	7sR6OTnyxkIG9WTcv4UICpDqzsuC5RTFWhNnSKCcNOUN/tAui8aOJop3n5x1qXA3TRvo56dSkCI5C
	lIvuRkN+P7kYqUkmZBZYT9TYtlrHRzucE/v1SNSd1DhKG1Vew9zKxls/tLcb17dWla61rCWljlFMf
	gx4KOd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJjAm-00000009iDj-2PDx;
	Tue, 27 May 2025 01:32:08 +0000
Received: from mail-db5eur02on2060f.outbound.protection.outlook.com ([2a01:111:f403:2608::60f] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJj8f-00000009i2v-0Itp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 01:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3XgTiOhnOdGLwM84DS5h3+AJgVMm+n6XXVEjH713QxuI8mTfn66AQ624LFQmcsPBcZCFG2HhiBcsz5444V+1M9UGcpduARfNZwgEXiXelTy+Q5KIVJ3ciMmo1hCCHwFuGwt6tZ5sZmB0wUpt6KO6DPaqEwO2wRDLVjhWO0tFZVrAVI0OifWBMEfkWZpJsGT+xDS2xU3vXJcOC2RSS7ozzB8A+bq/jZLaloZdFxPV11ygFnJCHEzA50/FFjo0FNf3OdffEh4hNN/MHwrizLWiWga8qjLYF2WPO7HX9BOieyD5N+ihyFcmApgTi/xYqd3lPgdYdNEyoti9O2enHcOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BruyVMdUKFURAgvZslJ7emwrXec2ZNY+Wjw4zYUwcw=;
 b=IaGj/f3GjHICk1DlqXA2qXP3FO3iL9iaY7rO3r4LD+btRFXpNWczHono0o7QjsH8AjcllDH20RLyVegEyN7Ng18xUD1ukm3mBPtFOzQQPKaiFP/O8/2pYvLtwBgwhK3CEXVfF79zzi9si889sV9SoFdJr4Eus2LRi3XeKD9mbcMH+Z07AeSFnzmiOggVxxaBw1sVVCYKQ9Z5hVYmcfWk8xbIT2bow9bd0/IdFkQTzP2thKaNDcIF7zJwTR+GtgmnqLq1oW6Yl/M5nWQYKSfqkoy/BRJ9xrj8F+5Ts/U2r6wr2WmlYiK/50p5yRqJPo9BFFrSMZyO1M63qoQMB/1qFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BruyVMdUKFURAgvZslJ7emwrXec2ZNY+Wjw4zYUwcw=;
 b=m1LhhPFatYkTrrtyaqpLuexubvCy6Yz3ps7GckHtkLYsK4nuaVoXMRBu9SIoVXr1T/mGMWV2QbI/DxhO9nZYXva0jwraKX4MFO7ek6mAqtZKuszL1Kpin1ekht6ZIOG5Bu3MVB00Dmns85BWSOE9PhKJsCQAVjsvQjhBnGW2uB0Do4jbgx1funw8k4//zjFq7H0G1tT2ylvQ+krh7UgV/sV0qlAMfR3GUqhw26Lcu4pigv+Yj0h10+ILnZUx1RprxIIZv+FNPVJ1E8V0/DxwJhYfHhUEA3Fe+Op2PBXzGeFCKhS4CnlajsUnRhrGHEKQl4dWRCJYJJW1MK4iVUNpNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10077.eurprd04.prod.outlook.com (2603:10a6:150:1a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 01:29:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 01:29:41 +0000
Date: Tue, 27 May 2025 10:39:21 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250527023921.GA14252@nxa18884-linux>
References: <20250509191308.6i3ydftzork3sv5c@hiago-nb>
 <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb>
 <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux>
 <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
 <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
 <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
 <20250527000510.fofehmsdhifcwlys@hiago-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527000510.fofehmsdhifcwlys@hiago-nb>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10077:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c0e6dd-cf59-4a16-d973-08dd9cbdf3a8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xRzrAMHuY/UX+b3zZQvkMRuph4xWw462EJhTi9OiHXx5zvu6g4XJqoYDSBd5?=
 =?us-ascii?Q?IOsqGqoATMXrqQ8HjxHv0ncQ8zvj1A5p+TYdSAGvxKKtlWg1lPmz6peRy9L5?=
 =?us-ascii?Q?/Pgjmn3xmRsMeGWy73LRorQF1VJU944BQcOlVgwguSd9kInvpyn2dZbVkoJ+?=
 =?us-ascii?Q?iaVJDYzGe4duzaHrJWF1vTLCyY9TWBjI7ag3jtQ1rp5o+QRmY4zo2HHWlk6K?=
 =?us-ascii?Q?p8CdSXXuJUxjoOiKjLKBr9SJRvLZS6nlYyk0NTcGsU30G+mnqulk61C/p9r3?=
 =?us-ascii?Q?oO+MruzUgctuH2iNz71yd9If8TaInOuGs0JQdyAHeTTjkzD6V7Yx/R8tfjgH?=
 =?us-ascii?Q?ZowZ8KL1iBKaAGBXJupW3PCdiE6xI5Didaaxf3dkuxFua2ciByDGJBg4BHlF?=
 =?us-ascii?Q?vwFiN5xEU6EQsydlpLwrwJx3kTKASzdNnuCHJCAoVy2l9dzIS5r2W8TQB0eX?=
 =?us-ascii?Q?9H2og+8IL9OBw3CsvGTA8UCY21iPp+6LTQOG9GTXSa2spIbS+hxQAFgsIlNR?=
 =?us-ascii?Q?avlSJQYJiFrzHS0plLyiWPVTdfYgs6SZFqzksh9cEOXgpu1jk3AAoBSL+pJX?=
 =?us-ascii?Q?5M/94LFESZo5Ue/g54jFpWkMzz2Me/LPqLrBTGsqF2cuNE9WiBce1723yw/Z?=
 =?us-ascii?Q?dui14Zy46pkkET5IZrnRn87/7aEN67/sB181z7VjZBlZEMxehn2dd4uAfLYR?=
 =?us-ascii?Q?2s4YQh+sNmGybRvMiRlfapTRzHdxRxpxHzbfI+LcGYdgMDr+QCrM2JMhMC+u?=
 =?us-ascii?Q?+gmBAArElrV6/w0FuS02KPnHaxi5jJJKFtLGY0EgCY+Eoc2wI6zL8jeB421F?=
 =?us-ascii?Q?IuF65sn2n3y+lFtx/UrAXVJEZfKncQjAYo1sZ4sE0tAzQDR55bKP4szKn5gY?=
 =?us-ascii?Q?HKgJShoWjmbHnpV1ZvW2IX+tscsKp4/AHsmuzUy9i6OgMbuwcgI42RuKiKqf?=
 =?us-ascii?Q?+BSckrD/7i4Oj59SJZj3W1FkxS1gdmYa9s1AoOfjTZG28drlbuLVbmGAUyMU?=
 =?us-ascii?Q?jJvS1a7ZREPqAP6rnhewDPDm+D1jQcdQLlsSwhBh15gA4AQVs1CDrT1wWuwE?=
 =?us-ascii?Q?w0Z+poeTcR3EJ97n1NOSplSgvX5sgllWOlREHoCRqvja4Edu+vAlCAZJKq+5?=
 =?us-ascii?Q?zI9NSbZtlls2nxyayf7579uAXrU+Zngue6KCiEHNyYNT75UxTni1e4hYoFgt?=
 =?us-ascii?Q?Qyz4PySs6q6W/96i4MiQtr1YItsH+5ze458V/P/ZwrF7466q4+dlUO8AtUyf?=
 =?us-ascii?Q?FI5cTjc67ZInzX790Y96Oa3hLYi3rVMCV/W+dVbam3FSyJTZf1HiYOEPOgLj?=
 =?us-ascii?Q?rmoIioVf7F9oy7qu6UsJjZhizoflR3AAzC5Hl1hnOhy9KLWEOEYD8AxlDqTc?=
 =?us-ascii?Q?E0jfGbDe4k6VMmFHnEIXH1rsq3xjAvpEtr486HxuzAlazpJjqdaFXTk81P9B?=
 =?us-ascii?Q?aIU0lsEN/6O7XwoQFDifXh1Sawo+UFcv/npPNVNJQNflvjwJ5ZpKZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3GhyOU3fjoXTdhkY95kg63caiSLa3mihrWYlHn2JIdkyqSPzYMLk70DN+U9X?=
 =?us-ascii?Q?p3KWRMGoLfMaVhI3F6FhQw8V0vpNWBDMId5QQ8QIizAByLghYIAxrTMxhUby?=
 =?us-ascii?Q?+TqUUUGW/iiMsH7PGGKuMTga5S7wMzQnSzsul9vOzYMMt/lL2HLQuth96Xle?=
 =?us-ascii?Q?yR72jfH8sGqdKQjAPzye6bCd6S6sgn8S3+uC6DA80u2ppa/W8wc9mdsAa1AC?=
 =?us-ascii?Q?re/exsCFpUW5r9K14cPMR3hz/HRbU9OKqOn8aAY/jKBiJLXpNHMxRGCoM66P?=
 =?us-ascii?Q?vxsmAkqX9wcWOX/fya5YD676o1Cw0Mz743MT0J/Sv+JJYoDCDztXr+z8u4mp?=
 =?us-ascii?Q?FbvG0UTIeFfpD635RxIDztKqibj94tbLJqJr7dBS+5Q9tnBbYDgJ6acDTN5v?=
 =?us-ascii?Q?SHpBYt78e28ittdjZa0n6hv9e2d2uRCboCxS09iRzcpXJu/6zh3AI+c7nWd6?=
 =?us-ascii?Q?eAbT2EK16wZBr9Br0d1J0Np+ZV4m64+hXy9E7kp+/t7OUenAaMzvchX8fdFV?=
 =?us-ascii?Q?29Xac7Qp9Ys5Dml8rGr0UnXjT8orBNZDSroORPSupd1TV+RHXQbZYsmM5oze?=
 =?us-ascii?Q?CBiKy78GeWvWh+1kSRTP7Do3A41P14IQWUXGst8EYrPT2djEBGvFENyzQ1zG?=
 =?us-ascii?Q?xhO7qDDe3fdOPEgbInwzrR+sDOjPu7ziNFg0QoSruV2OupY42KfnTxjHW/cE?=
 =?us-ascii?Q?5+cS8obpgpdjAGkbq6i/1f1RL9n7gkeRaqVA/5pvL7Kuw3WQkQSt5waZH1ez?=
 =?us-ascii?Q?pDshS8jSRf+tUR1dpx36/rse5OJyi8FGuYR5oYgCn9jegCj4diaFSsfMtdxX?=
 =?us-ascii?Q?OJB2K9GLWoPrDZOxDwXSATMPTxXtMnOLavShyBGr8yGSDhyAlZj9ENvD7Z3i?=
 =?us-ascii?Q?B2g54WizlJE8XJGw3Uag335dDAxp6grplXF4ajac8Cb5HP2+UtVrVc2UEuDv?=
 =?us-ascii?Q?0x/j6N9JepFmipsj2BtVg3aJqEJS99RRQ+EiNvmOJXB/Ud2r2z1i6f+W8n5r?=
 =?us-ascii?Q?UavZHPh6JEsg8UcNc44DWrAGTOsT8m9J2/e/DVQ6zNAMjk0LPiu3uqRQlgM7?=
 =?us-ascii?Q?utortrw8vxYRvxy9V9pNqADdD+v/3NxMfB4e/pcFD+REQgC5w+iM1bj4qI1X?=
 =?us-ascii?Q?iu+e6Co8tjICqcrOpgJoKN+4yEBXREW3ceW2yDJEjWbR5TkrOwtUv5RR1b9w?=
 =?us-ascii?Q?3pKaSeqQ/V2X69RVk//XKb8jRy1qLHx0V1dGynDvmrF5Mk8mO3E5plUb4erB?=
 =?us-ascii?Q?AdO/LZkaYLOMkP9r3m8PmoqO2Zuq/A8VLgs1uHRQ9Wxmyla2Cn8BxXKBmSZS?=
 =?us-ascii?Q?hL2U3CZPe8DTdOUvh6nsemGToDJvvzuF5+nvnrBGxc619Whcq/Tmq/njBZGr?=
 =?us-ascii?Q?d2q6XpGJYuqXkyZqEuorf67zX8pk7SFK/zMld2LCWZ1dbc6SclpZo2sjRrJV?=
 =?us-ascii?Q?OcCO8yCvyRckK2cClJvIjTaDUZ80tSWMJhtijI5vuNXPoEY7Jd3VBpl215Zf?=
 =?us-ascii?Q?A1Zl1R0Iw/b/QpmFgb0FYk83OKjLsjv7e3YTDSsPi/rMSCt+713xjlHmtdZG?=
 =?us-ascii?Q?R3UWsrQ+t4r4rqW22t5E4nqhC3Hc23jcZCsi/1D7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c0e6dd-cf59-4a16-d973-08dd9cbdf3a8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 01:29:40.9574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mz7HUSttM7QuMbvTYUxNNUhCRx2vpGJddJ9VwMjPwQevA0llP4LQdJ9AMtbXE7fBus+zbzOZZCYp/elZfP3W7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_182957_273737_C61E8B8B 
X-CRM114-Status: GOOD (  50.54  )
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

On Mon, May 26, 2025 at 09:05:10PM -0300, Hiago De Franco wrote:
>On Mon, May 26, 2025 at 12:07:49PM +0200, Ulf Hansson wrote:
>> On Fri, 23 May 2025 at 21:17, Hiago De Franco <hiagofranco@gmail.com> wrote:
>> >
>> > Hi Ulf,
>> >
>> > On Wed, May 21, 2025 at 02:11:02PM +0200, Ulf Hansson wrote:
>> > > You should not provide any flag (or attach_data to
>> > > dev_pm_domain_attach_list()) at all. In other words just call
>> > > dev_pm_domain_attach_list(dev, NULL, &priv->pd_list), similar to how
>> > > drivers/remoteproc/imx_dsp_rproc.c does it.
>> > >
>> > > In this way, the device_link is created by making the platform->dev
>> > > the consumer and by keeping the supplier-devices (corresponding to the
>> > > genpds) in RPM_SUSPENDED state.
>> > >
>> > > The PM domains (genpds) are then left in their current state, which
>> > > should allow us to call dev_pm_genpd_is_on() for the corresponding
>> > > supplier-devices, to figure out whether the bootloader turned them on
>> > > or not, I think.
>> > >
>> > > Moreover, to make sure the genpds are turned on when needed, we also
>> > > need to call pm_runtime_enable(platform->dev) and
>> > > pm_runtime_get_sync(platform->dev). The easiest approach is probably
>> > > to do that during ->probe() - and then as an improvement on top you
>> > > may want to implement more fine-grained support for runtime PM.
>> > >
>> > > [...]
>> > >
>> > > Kind regards
>> > > Uffe
>> >
>> > I did some tests here and I might be missing something. I used the
>> > dev_pm_genpd_is_on() inside imx_rproc.c with the following changes:
>> >
>> > @@ -902,7 +902,12 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>> >         if (dev->pm_domain)
>> >                 return 0;
>> >
>> >         ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
>> > +       printk("hfranco: returned pd devs is %d", ret);
>> > +       for (int i = 0; i < ret; i++) {
>> > +               test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
>> > +               printk("hfranco: returned value is %d", test);
>> > +       }
>> >         return ret < 0 ? ret : 0;
>> >  }
>> >
>> > This was a quick test to check the returned value, and it always return
>> > 1 for both pds, even if I did not boot the remote core.
>> >
>> > So I was wondering if it was because of PD_FLAG_DEV_LINK_ON, I removed
>> > it and passed NULL to dev_pm_domain_attach_list().
>> 
>> Right, that's exactly what we should be doing.
>> 
>> > Booting the kernel
>> > now it correctly reports 0 for both pds, however when I start the
>> > remote core with a hello world firmware and boot the kernel, the CPU
>> > resets with a fault reset ("Reset cause: SCFW fault reset").
>> >
>> > I added both pm functions to probe, just to test:
>> >
>> > @@ -1152,6 +1158,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>> >                 goto err_put_clk;
>> >         }
>> >
>> > +       pm_runtime_enable(dev);
>> > +       pm_runtime_get_sync(dev);
>> > +
>> 
>> Indeed, calling pm_runtime_enable() and then pm_runtime_get_sync()
>> should turn on the PM domains for the device, which I assume is needed
>> at some point.
>> 
>> Although, I wonder if this may be a bit too late, I would expect that
>> you at least need to call these *before* the call to rproc_add(), as I
>> assume the rproc-core may start using the device/driver beyond that
>> point.
>> 
>> >         return 0
>> >
>> > Now the kernel boot with the remote core running, but it still returns
>> > 0 from dev_pm_genpd_is_on(). So basically now it always returns 0, with
>> > or without the remote core running.
>> 
>> dev_pm_genpd_is_on() is returning the current status of the PM domain
>> (genpd) for the device.
>> 
>> Could it be that the genpd provider doesn't register its PM domains
>> with the state that the HW is really in? pm_genpd_init() is the call
>> that allows the genpd provider to specify the initial state.
>> 
>> I think we need Peng's help here to understand what goes on.
>> 
>> >
>> > I tried to move pm_runtime_get_sync() to .prepare function but it make
>> > the kernel not boot anymore (with the SCU fault reset).
>> 
>> Try move pm_runtime_enable() before rproc_add().
>
>Thanks Ulf, that indeed made it work, at least now the kernel does not
>reset anymore with the SCU fault reset. However I am still only getting
>0 from dev_pm_genpd_is_on(), no matter what the state of the remote
>core. Maybe I am missing something in between?
>
>Peng, do you know what could be the issue here?

imx_rproc_attach_pd
 ->dev_pm_domain_attach_list
      ->genpd_dev_pm_attach_by_id
              ->genpd_queue_power_off_work
	         ->cm40_pid0 is powered off because the genpd is set with is_off=false

So dev_pm_genpd_is_on will return false after attach.

This means that with U-Boot kick M4, cm40 might be powered off when
attaching the pd even with LINK_ON set, because genpd is set with is_off=false.

The reason we set genpd to match real hardware status is to avoid RPC call
and to save power. But seems it could not work well with U-boot kicking M4.

I not have good idea on how to address this issue. The current driver
could work with linux kick M4, M4 packed in flash.bin and M4 in a standalone
partition.

Regards,
Peng

>
>> 
>> >
>> > Do you have any suggestions? Am I doing something wrong with these PDs?
>> >
>> > Best regards,
>> > Hiago.
>> 
>> Kind regards
>> Uffe
>
>Best regards,
>Hiago

