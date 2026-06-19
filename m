Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2492CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl6jTIeHNS/6XZrqqOWL+U18ZJmM7ug70i6zVchYq4k=; b=Ro/73CEyNyO/f5TluLxgidOepb
	ZbbbIgebJqaIEHfaobvzaq71bIREfvwFuWItEZBETqTg0atc9r4f+iKuY3e2tdjAvvSiX+IA1BK8A
	vSxVH0guiM6dm47G5UJxZYLHs/TEVvASdEDJHqqGtJvu2gb3krbTkliV4h1pHqWiKXu+sA6KUlWxA
	QdJo8XhrjS7XsLcCAZ+T3FzS81K1wmtmxlEHIOYIflW1YnRXKMOvVU3eIUgZFcrx+taWXno+hGj4b
	VHe8gBP5oMhLRMhS32fCKgarCQG3RwLqskz9dCxdTok90uEHM/gcdE6RNnmzUV1CYBk5DfmloH4H+
	UTvtnWtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSqV-000000023Ir-2mti;
	Fri, 19 Jun 2026 06:36:55 +0000
Received: from mail-northeuropeazon11010009.outbound.protection.outlook.com ([52.101.84.9] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waSqT-000000023II-3DHc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 06:36:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwO5tNfg8Fo3TwWA0jYg3THVy5qNTAlgB6XatOSMtI7OkMty2Mx37L8KhXG/MN/jhaWUtCX9Qqv/yiHVOyW0rjaHSb/yR9YknktiheLOIAy5O95Nmmevb+XLk5WvUrTv6TzDbNPUDiOlVSv9EwINVyb/YXuYhH/SF32QSLRrYP7lSgTMe+2nCz5KtvEGZ5vYj3jDgeLutcro8fjH5h3xQHpooAjFfZRnlYr8NPPU+TDCHC4O4b8dls+KrNoG7Sk9J8Hl2g7VqNxGmimx0W5Zb1bj6dKRDDAwnocWoHDB4nzy/ogjLNqF8GfWuIjdKisSx4OqscZngmRdFV5XcPlv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sl6jTIeHNS/6XZrqqOWL+U18ZJmM7ug70i6zVchYq4k=;
 b=eMaA5fNFNQ1w/MlCFXYFnXZE+ClLIuggeW9ufQIr5V2sj7evOxSJ/XIV5B5RGS+p0cWvr5F8uaHd+7LA+YT+KCjWlZTufIIb3gXSy8uO7QOAD+EGoBKn7V8gDpcaYyAHexglvgAaelIB7FuXr6e9G180Cjh+KQGHmv4vrHZiDAm7kymfYNck4e/TzzA14eE4xFSk4bGikV5RPEko0M5hh9wZzTKY/T/5zvIUGqijV/igfzoMp1u2C/M2Ier548u8RUPUQvazsWTeQ8C5tFPfiNnuJJ5VmvK4YB2OaEsoXs71WlOrDYQCt0lfVwqKIcUWV7gNSufLZRbmqrbfa0HtHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sl6jTIeHNS/6XZrqqOWL+U18ZJmM7ug70i6zVchYq4k=;
 b=YpsKVH960BFZgpwAKQeQuji0WlqyOzAs5rHWspK805xhgrykHsOvxzL288Oomc/cF+ILQmzYc509h8Tq+Bsd/IYKB3QjQFb62qI+bPWaEKCxDh2gq6WoqdzFxNkkzgoxRi/JhwJ4kOjSTSRStzB5KwkasYCnq9z5HVZkbi6+AcFun9lef1kOwk9Fu32pGdQtSqJaJIemv5/bSqh8/g6mObiq0aAcMEnMYQUSix3jh/SNt1N7gyCjCHWkaM7MLfKtQzcmJDKlJuvWg7mSh5dOAWZEz2JC8bwWSLoRHcTSnIq5HfUxa/tmbp1NKM7FN77sEX4+gIXh85capOD7Ou5DKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 06:36:47 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 06:36:46 +0000
Date: Fri, 19 Jun 2026 14:39:59 +0800
From: Robby Cai <Robby.cai@oss.nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Robby Cai <robby.cai@nxp.com>, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, krzk+dt@kernel.org, andrew.smirnov@gmail.com,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com, guoniu.zhou@nxp.com
Subject: Re: [PATCH v2 1/1] reset: imx7: Correct polarity of MIPI CSI resets
 on i.MX8MQ
Message-ID: <ajTkP9Ta1HTW41MR@shlinux89>
References: <20260417080851.489303-1-robby.cai@nxp.com>
 <2605c4332e8a3e8950b0b15fc5377423cfed4a1f.camel@pengutronix.de>
 <20260417092809.GA582835@shlinux88>
 <922d581718c90c9ca603a35ece7c44da7c425e0a.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <922d581718c90c9ca603a35ece7c44da7c425e0a.camel@pengutronix.de>
X-ClientProxiedBy: SI3PR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:4:297::10) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|DB9PR04MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 34bae273-2d5b-4f92-a839-08decdcd22a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|19092799006|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: m+sDdYwAaKiEiW8QoQbORTnNnAvlQgd2i1ntRb8RBc5v2qSuWgfg2008WF9MzaQAuTBxHW2kGkkk1KYfSfnuHw1Ad0utG3dW350OGWBaHpXCRZUx07uuDsNjy6VJsL2HWEqUzEpQ+JcEhpcbDpRus9Ly4UbEavLbZo79tV1wt1e+byr5dUK+TdNC5Ip1j4GteVcRl+qwvBwlkqgJftMSGMJsf90oLdz5SNgeKcYK/RbEDIwY1TtDjuUeoAyF3KT5OAX7c5tQ7gChzQ1xdb1meSK0wIndQPkxZ+QOM0mAOAWdfxCJ3ba3uX1t+x24Q2YyqhjkS59Pq6NwIZfa5jqQ1qBmE+hed7q9kWSK/f1cZRzZpTUIQS2RHYMdcjIKeYoPzI29sdLJksDkom1FX0ye6FYiHddXsj0H/2h7VE3UqXGC24+azOg5qHjSYJPrrxdhOa/7hjWo7/MPOAEq1A9MIOWTs8pdRcyPR1ieIztGHcsASazNvPvbFMJ9Uy8lnc06DlB2nCWRyEpXyMfYXjoDvNtqBF5VQYe/xkd1BnZWizvttM4wWbpBACb4eu7mbn2KrQZC++KPOogGZsRl414OjGOpN9VZMpU9HHUbhcBbwl0dyznwPAceiDqA2LcakKo8OIUHICmbYVV0OcGEksrnFFfMz+IoVxwg/0D5LQ4TWkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DvJQlp282EcZ4XesYrmDemQNC9V/H77fK9wDfqhpuYUOyRjEA9MK/YjsLLAU?=
 =?us-ascii?Q?oGrS46ax/s54YXBIuJZc1B5w4ODYE3RrtCs3Gw8Mdratesr27b8UwRmeEUuY?=
 =?us-ascii?Q?oRkxHLDU6kUyQravAygTftXmt38qUCxQ82BV7KZ44khR6iSdzEwYY03vZqwB?=
 =?us-ascii?Q?ikB9WcjHoIPspV8XYv1wrOeOn4su7FDGgg4vz6NaD+v4XSKPJgl82VcO/9tb?=
 =?us-ascii?Q?D8jWyxV1OwSOkZPyHgFfgrVOIilcO9Z1u9EFAM/X+Nr2VJfwlbuu2QmhqbdN?=
 =?us-ascii?Q?nPnUvI/QGMqnPvfh+hUNOpu7hOawDyCHS9zTyrrMOWDgNgCytRLNxi5cfURz?=
 =?us-ascii?Q?Y+dSuJrUo5SEDas3BShtL+iEsxB2M/7cNHgL99XQkCjwgT+P+Zgo/Rp5aFIM?=
 =?us-ascii?Q?o1XTuo/7IWC234lIddPw9ZS9CBaHvNjvKY94E8r6WFtT12qZWHVFh4e2pt5D?=
 =?us-ascii?Q?1wQBSP19A1TDWj0yr1vUGhwPWQw04YtNXcyHUxtQrHBXDdVRzG/neXw9R0t7?=
 =?us-ascii?Q?tkKuRM/T7RAXxQj9plCsoO1OMYt0S9LMBlA5rxl7zRl9lUv5ZDX6oYWR/D4n?=
 =?us-ascii?Q?qq65FtuHbPBLQopoazVc4uRaN5sMt4vwEflqOBEiRS4aUodgtJiPC+RKhPR8?=
 =?us-ascii?Q?HNuJ84SHvbLElzz1TAOQiMZnH1sSVGR8ROGRHSVstOlAFqSVcDQFPiuSvrO2?=
 =?us-ascii?Q?MVZFp+BNx/CWRB84gOXHRdnzT3M5p8PQ40Fig766iKbSxxyTMXD/7PcwDLyh?=
 =?us-ascii?Q?S8ePgaIGHw03jjPQNJmkZyD2LR6VL2Bw6HdyD7EPBt6fz6RhSE2TcApdS9lI?=
 =?us-ascii?Q?dp5Cz8BuMZJbTCw1++DZ6CQgmMM/Yx4ojGk2KkgZkPyxMAiSBp9ICHLJ+GjX?=
 =?us-ascii?Q?+RM4wtx6jf4eDg5WlNppwr35hGxH7bKuyHyLE35YLm7NE/TdHxBcVlq7eN42?=
 =?us-ascii?Q?n9JymL4URPtIcCa/GG898MIaDqEvsnNDF9TS5JChAQ3D/PE8sSGIj7cWykfh?=
 =?us-ascii?Q?fvRn4b4v5fI8XXCpVYTuSu6QcoFpPIl3AVnPMINsG7c2g/CQPsStyoXGsyp2?=
 =?us-ascii?Q?CJz3ph6+zkwo022Ry72nI3LnHUfX1txOuj315eRyp5XCmMwc+zTnYjXbX57Q?=
 =?us-ascii?Q?Pk2xdhcsQMajL7oiGht4pvyAqLkxX6nijCFQ2unX8i4p3XSY1ONLRWMjcVAI?=
 =?us-ascii?Q?ViyiYCgqen19pwOXcNUtsySetbyiLPcVvRfPLlqfP2LseF1yl6Z6Tv0eXCET?=
 =?us-ascii?Q?lpCTPW1UtCHvV9UDtGe3ia/C2EjJkw88nDCGUyRUQ/Q+o1m+J/s3c+kyCmAc?=
 =?us-ascii?Q?bjPKIqXiPxyur8LA6b26p7pbNAOskKjB1hiZAYvqhdRR2bA4Z9tjvCzKiqwt?=
 =?us-ascii?Q?njH78hnOpjBeDbigkqIzNtyznl720ES9PpSJE6thFiY8mPVSY48WSh0gtspe?=
 =?us-ascii?Q?nGJxg/W+gzK8Xw4iWl2/iU0GGGfARmYI/MG65XnDywEvzSM7oYwNx0eUgseT?=
 =?us-ascii?Q?vScI31nNy37ubmlmzhlooL+ChfXKgsuQ32rRskvch6sH0e4cLVrXAaxGZzLk?=
 =?us-ascii?Q?5zAXb+lWRhX9M3OIFQQwl4G/FCZA+xGYqhoiPu7Lir/eT2vU21asrPEBupD2?=
 =?us-ascii?Q?GjjU7Pz0L2qjL+DmZqc05Ry+7uSoVuQE5i16QXC2aYWk3TKeLC31Udgcjwuz?=
 =?us-ascii?Q?0QEhc0Hz8HVBBiU9JfEpxlq/fdUIZsyCr780AtzGSUW+Jbh+Patn637qMqOt?=
 =?us-ascii?Q?fitwfGslfp+fxpmawoC1oVsIwKJVzH+bWfDbcwq8TPYbup2XOFU8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bae273-2d5b-4f92-a839-08decdcd22a5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 06:36:46.8238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di3/KUG30T962yZjorcxgcyPe/6PI7Dv0yjN4oCiuogwRHjmbQzjayy/WmSaek3R8Ymv2IUblbf+8SGFYFSmfRkuDxI3vnbO+WOfL+U1XwMN6OSZma7XUlntaFBc7wUo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_233653_816527_B2331AB8 
X-CRM114-Status: GOOD (  17.45  )
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

On Thu, Jun 18, 2026 at 12:24:57PM +0200, Philipp Zabel wrote:
> On Fr, 2026-04-17 at 17:28 +0800, Robby Cai wrote:
> > On Fri, Apr 17, 2026 at 10:47:48AM +0200, Philipp Zabel wrote:
> > > On Fr, 2026-04-17 at 16:08 +0800, Robby Cai wrote:
> > > > On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clearing.
> > > > Writing '0' asserts reset and it remains asserted until explicitly
> > > > deasserted by software.
> > > > 
> > > > This driver previously treated the MIPI CSI reset signals as active-high,
> > > > which led to incorrect reset assert/deassert sequencing. This issue was
> > > > exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
> > > > release reset").
> > > 
> > > If this patch is backported without 6d79bb8fd2aa, or the other way
> > > around, will that break MIPI CSI-2 on older kernels? That would warrant
> > > a Cc: stable tag.
> > > 
> > 
> > Yes, will break.
> > These two patches should be backported as a pair to ensure correct behavior.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Can you please resend with
> 
> Cc: <stable@vger.kernel.org> # 6d79bb8fd2aa: media: imx8mq-mipi-csi2: Explicitly release reset

Sure, will do. Thanks.

Regards,
Robby
> 
> regards
> Philipp

