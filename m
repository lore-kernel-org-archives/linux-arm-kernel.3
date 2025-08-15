Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A982CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nT7zm3rjx48FeM96GHJ8oPzftltbID1dAyW1VGtnD1A=; b=WzoFJOyQg0TsQfPM04xeq6l9k6
	/0oYTuk0VgW1wyZZi92Q+9n5ApUUGzaqOX5wgrkSsefn9Mmfd/FCmTdkaHAWOlqQWY1o4l1eDTzaX
	jLirlzd+Lv2eGbY0nhAoR98bUKtJ475IdzSthHgXrgsK79sL0FfBlgOCwKjMLwsYf7Ox4q823zLv9
	FjPr296DMSf4htDf/anNA0fBAhGP4WDKlNobf2lG2BZ0J8Fr0fFC117CEIgzl9s7i7CjGQpaauF3c
	5xm6vSN5Pq1Ux6VInLI5ZGbAyH6OX0+q1MQ6yiOgpjA9e/RlreZwIZWLRzo1q5h/oho9R8mYzO0eI
	m1JEjGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyul-00000003DVR-2TdU;
	Fri, 15 Aug 2025 18:12:31 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxIF-00000002yOt-0jjU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 16:28:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQ00GzuYrRopRdblhnBY6zzA0tYto7rq07DndUy2o2wNWYe0XKgFuj+Z7zqemnxiQAJTYMOuWRQsb04madaOdlpeNEOXwCrk2pMvavsxTqfhSlr/VKkkClyJRk/++ZEuDAnRj97YBB8QXmsVoxXHUaGu7g98fl37RHPgUUR+ItCNitAjKY11gtWV8I1SA2SC5C/nOX++rITZKb7l4JL8FG5aSk77krkf2cJQZc98mJJlGfTgday5xUCnzA+0egykrmbJK8nOjiUqtlFIsOMO1eAZfE6+uyEiL/JCmsMFJHT1FZkp41+rD9ZTVwFhAXIUvB6fSL5cKzhHeBvbeQcDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nT7zm3rjx48FeM96GHJ8oPzftltbID1dAyW1VGtnD1A=;
 b=EPsS1Y3A0OKtlW2jvFQSk7w6qCTRqEcGdlgf3JzZeT+Wc1iz8hnh/fdOZ6C/ICeSaUXdeajrVUZmcsNwyy9FcuAnDZtmT0aj3THIiw338msmQK9xtxeiCfgVa61UVEwFscEyb+o/Tlkbi4FGpkWbnr5o/LmQJdfHXNqDPnsvbFh/No/ceD0Fea4GXFtjdJIerO3+eQZ+bzGEixxjLGaKTfhMal1TNWcMS6Yzfs/fyhHduRC7XP/MbyRhaeOx8yAuyOxNbHCPlB7S0D/m8hS0QsgKT9AfW3MR9/WKcqnQXv6aFBNSNOrhBA1qm3/m3xKp+VLwW7hPbWG+ok9QWubvwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nT7zm3rjx48FeM96GHJ8oPzftltbID1dAyW1VGtnD1A=;
 b=b5qWukD4WeLo++5ktzKt2VayIpiC31XFjUQIklWC80CliTWdOeGnEJK46Jyak7QKPZZDAs5SdLSdDVZSp+dvAX6C1XbAue8VNJ1Z74ZTNBddWy29H3WQ5FSIU9RgjYR3tBpiZZjdNDFcKuDBkOOZmrRcQRY1xLy9SOA5F9btQ/gb2k6mozpdNfKerGD3hva7MwKHImOwcMf0DXczUySP/GsMAYfPd4jSglTrRBbXH6HDPLzccHuktaKFvefXVoAP3vezpnfAac0nZf+Ub0J9TbGYRch9IW7/Li/xM66U8I7a6jgCxa6PKbNN28gkPtAl3k5j1Boap+vWQUGG04c8bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9595.eurprd04.prod.outlook.com (2603:10a6:102:23d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 16:28:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.006; Fri, 15 Aug 2025
 16:28:34 +0000
Date: Fri, 15 Aug 2025 12:28:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	John Garry <john.g.garry@oracle.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/5] perf vendor events arm64:: Add i.MX94 DDR
 Performance Monitor metrics
Message-ID: <aJ9gJ0wfYudk34AW@lizhi-Precision-Tower-5810>
References: <20250815-imx94-ddr-pmu-v1-0-edb22be0b997@nxp.com>
 <20250815-imx94-ddr-pmu-v1-3-edb22be0b997@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-imx94-ddr-pmu-v1-3-edb22be0b997@nxp.com>
X-ClientProxiedBy: BYAPR01CA0007.prod.exchangelabs.com (2603:10b6:a02:80::20)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cafe61d-7fd0-4833-12ec-08dddc18c776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qMTVzWFab5Sw1VeGXJeQ/+3gmeysejdzau/o+5tP8y2lrJKE/rh6Vi8YmyNj?=
 =?us-ascii?Q?SZ1hjVOOGbZTS5uSNsAl3cmjOJKYyP5rBud819Onvap6MIKAiRvz3v5tHTBb?=
 =?us-ascii?Q?CxlhjH0iRQY9WRIlT4h2Pso6eDFiA8uG+XYbGWbbVuPnU47qYZr8HjCN5Loi?=
 =?us-ascii?Q?FtSRx80PNTu/TpKxwsnxH71Y9joJD38prPoPPiPgVvNjnrdsSIF9m+pIVtAj?=
 =?us-ascii?Q?RAYnzmsLTg+3zPBCE0jY+3aR9YHv9Kr7AEHZ1duAr7l1BnXsuw6Ig4y+kFLc?=
 =?us-ascii?Q?MJoONB5lEaRjJNyHHxUN51iV4GaQk9+pt/aZPSkJYMfcnJ6g/sekQwdTy40b?=
 =?us-ascii?Q?ydGoQzS78ePnovWbkxZpw6xniHWxJsAXr/bX0j3nGxph2wE13QcfRiK9u/kd?=
 =?us-ascii?Q?CCw+I1PghYm5Kd4C9avO1YaUzsHd5vS1DSLz6t3cpJxFgc+o4hdpjskqT7gf?=
 =?us-ascii?Q?IBkqzoQ8EDFASKAGd4vz3PNewMuEBzJjNfdCCXJ8kLDciBmeylceT6Uc2cfs?=
 =?us-ascii?Q?S5q5s+IlB03+Oy2XySNron8RYy1Yl7gD1gBGb9XVRhOQCPqnFSYSufVal6d0?=
 =?us-ascii?Q?zTJAWHm+/ibaIPi3vg+WQndI8i12z2wLMT64YHkHP7TmXbvnZuE7f94AowLu?=
 =?us-ascii?Q?kCaXHTfRjI86zsYxTqDxJWgrC+MfnLhp2eZJrbSCkLqnUFvWZQJzt6M+RZ8s?=
 =?us-ascii?Q?yFohEni6tk69W+JKbcjsdsAQ2e8pA6sVlgVsLKatSehxIOWbXM4T5yjXdX8m?=
 =?us-ascii?Q?rJ0ay5WIj9jhiENdDzxTdRN2TcFyLSKdPSzfs46E76cDHZWYiCsRMI8nU1Ov?=
 =?us-ascii?Q?zqmaE+BwLLfInyklFmwPlCTQ6bS2zVjvD9WttuAQTeL8HsyjnRnrQ5wLbDAe?=
 =?us-ascii?Q?w51ScHAs7lS8LUh45mzJXDc7afszfSSW6WrikYpeeBhP8LT05qktvkSdiXDo?=
 =?us-ascii?Q?wtDdYYf7cu9u12KWZsEryLs9roPtUv78QKpZbfIqUDFSb2O9pzDC3ZBzWXEO?=
 =?us-ascii?Q?sTtpn/BHZjz/5g4Z7WjEOwsoHI5CKud/ujqr0CMIGk2PC1ch9GflAug5k/Jd?=
 =?us-ascii?Q?i3tWYpqYg+cPTSfpBZzHiX76iBZfO8kNZ18EH5y68vwOn0i95D24481EG1sW?=
 =?us-ascii?Q?y/HK8uGHPm4U9uKKd29iPGfhQ5YmzNHG+6OYUYR3oOw9mCwkH4/DyVV+EBH8?=
 =?us-ascii?Q?oJSoT0AUk9ODPY20Bj3b5vEpssHw6ALyuZao3/8KaWDVwmoFbay6OBl3LmJ3?=
 =?us-ascii?Q?E+TBSkZaP5PS8BP0YMATEgmZVD/RF+1OSXii35tsknNJE41lowKmfupgmLCl?=
 =?us-ascii?Q?QPYqd+8DL13PvzA/3q5b5TDbYCesXMcwEFFeti3eelZFHNU9I36uRPVWA1cb?=
 =?us-ascii?Q?pKmcuG5q6u+htZAcB2kOmq/t7jCdYq9mVdqd/aapNODRux/LbtQ+qI0WHvam?=
 =?us-ascii?Q?eeFsAGbtsXmrdcEHP8O4RV7xW49Hx7M8QBqdtbaoNBkWF2gz6FW3pg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GIFmwaFug1wVtJNPZYIUNhRGY18HKtDhamK9ravjMRN+Vwz9brx1RdiHlbfT?=
 =?us-ascii?Q?xQJF92X+bKnjkPI0TITvFfQbQUyH/WA+RpV5O9+PSkE9gyyIRlfFjwSJxD0q?=
 =?us-ascii?Q?CsQ31o9ICMDxPcEy1oN6DcziaktP1uTjmmYhCvFEL9uIkcvswB63Db3K9NrV?=
 =?us-ascii?Q?ERcyNBUcNDYCCPsDAf7tRliFZE9gZdwLDqD1j00N10p2o6i8WIwXM/Bt2xw8?=
 =?us-ascii?Q?ftutSIAUc4iDFLaPbm4PCjdR4R94jFJaruYgVTz+sR+8ww54mwfJJnJG+QAr?=
 =?us-ascii?Q?nt6ufjB4P991TkksIOWrPhLbCLkEWeAJJgwJQGc8h55NspJQIqjgHHzx2JgY?=
 =?us-ascii?Q?Q1PLRLjAlj1DSorYacPnNqkW3grtMgCX0109lNyfEg7aR38cQcv5LBwNQAXY?=
 =?us-ascii?Q?s6ZdMN1oIAVWjTVPjC9UvPoPrIWw0iL6A+IV1c59E0h6gnuvhjKk+Mbsmptz?=
 =?us-ascii?Q?nymG1amOc3bWz/E+tEqb1uA3p4boxksngbXlrFtYofaj0cwam+ThKrImwfJm?=
 =?us-ascii?Q?sAUKu7D2+vjNehHc2uZ4VbWE/TzBVYJbX5Ha8WaKWXdMt8FGe3f1gK76jakU?=
 =?us-ascii?Q?/tWKKhW+PKZAnkrg0Q0Q4oVwHBJMiJsbIEmrYYK9Mc1LEZzN+TpUgBdOlTyu?=
 =?us-ascii?Q?I+HYsktuVjH1LfNcx87/va+JO4jPjF3KpcLVX2okn/MhRLv20JGIAgbVAm0f?=
 =?us-ascii?Q?biR2BzYBFNRif0atEnXuc2ONHohdMhTAdQDg9EtejSmii0V+TRLtF4XQazWf?=
 =?us-ascii?Q?myfIA4h4rUXAfeQYpZFzf95qvovpX0Z5ucOAWElhuCv0EXO50RleoP2w7ZII?=
 =?us-ascii?Q?pcQ4KwlARatERQTExZNN3WekZMymZn5Mo3iAHkuVa3wmIFiq5jpg7xypKsY1?=
 =?us-ascii?Q?x2aNsURTR6OSDYc1+52KP+fc+b+YUmwz7LbrX2gLbh9yUoG8I9wWq3cWEVfD?=
 =?us-ascii?Q?t+VGLY9OtqbRpyKM9kfkwJVABQDfY4Mi3xdktf+gkFN58cQ3s3z7Zk6PGPzr?=
 =?us-ascii?Q?fs+rfPQkg0SiLkjNfpEUw8FOQwWJjMnJY5vwHWtGPlPjFUoHLC7DiTBBBvnU?=
 =?us-ascii?Q?0ZrqNuWUjb0EbfzxfSoUTX2a9MLLt9VqXJ6jFiR1r5WculBNiCTWW6F1xFIn?=
 =?us-ascii?Q?p8LVc6PgpVvXtxkBtqNXFGpNDanM/aKehwb338Pl76f1E1RDKcbAq/semWlt?=
 =?us-ascii?Q?LLazbyxlT2LPZPYrXhfYjPvfJAjsNJrDi2DdZdZggxZeNbRRs5np8K8a7lhI?=
 =?us-ascii?Q?SWvEjHQHERu1qedH5JSAS02d5bxRRzWkVjyImmKCvGrS93qXpVQmad/j5r9F?=
 =?us-ascii?Q?ISKzNdecpVmhYD7tRUboNg4p0kc0KT5tCIiMhA98BVW8dQuICSJHL559pWKE?=
 =?us-ascii?Q?+qiF3P3eXRcSvJT5hh1CruFoUGGuMXi6fDEabXZccUGqt6QCc3huqTnW+lsL?=
 =?us-ascii?Q?SfrxXiCNz3r/Wm1xqFdi5qWTxT8CbDjQJvHm0UhfbL/e/5jG28YSZ/qKBV9D?=
 =?us-ascii?Q?h/iNo0EpNuI9tB5+EKjiLxwqoIebzMlhfoXP7SkJD3nrv060YyaT5WTvqCvy?=
 =?us-ascii?Q?o9RmWfeAK4PkMHJQQWWnUKWvaCVPfXbfuV6HORwM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cafe61d-7fd0-4833-12ec-08dddc18c776
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 16:28:34.3387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dS4K5twi/d0iKXbQVVJR7vvVuvihz8rEt/JZUUHHef2pKtTg6+PZdOKmkVnnYLP8VQKdyI4xgQWNn3Q6+IrBeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_092839_386200_E16AA608 
X-CRM114-Status: GOOD (  15.94  )
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

On Fri, Aug 15, 2025 at 05:36:29PM +0800, Xu Yang wrote:
> Add JSON metrics for i.MX94 DDR Performance Monitor.
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../arch/arm64/freescale/imx94/sys/ddrc.json       |   9 +
>  .../arch/arm64/freescale/imx94/sys/metrics.json    | 450 +++++++++++++++++++++
>  2 files changed, 459 insertions(+)
>
> diff --git a/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/ddrc.json b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/ddrc.json
> new file mode 100644
> index 0000000000000000000000000000000000000000..aa7b58721dc7e23dc9d9905a79e0c1778b7bbf11
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/ddrc.json
> @@ -0,0 +1,9 @@
> +[
> +   {
> +           "BriefDescription": "ddr cycles event",
> +           "EventCode": "0x00",
> +           "EventName": "imx94_ddr.cycles",
> +           "Unit": "imx9_ddr",
> +           "Compat": "imx94"
> +   }
> +]
> diff --git a/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/metrics.json b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/metrics.json
> new file mode 100644
> index 0000000000000000000000000000000000000000..629f1f52761e2210ef43a9cbba175871817e1230
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/metrics.json
> @@ -0,0 +1,450 @@
> +[
> +	{
> +		"BriefDescription": "bandwidth usage for lpddr5 evk board",
> +		"MetricName": "imx94_bandwidth_usage.lpddr5",
> +		"MetricExpr": "(( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x000\\,axi_id\\=0x000@ + imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x000\\,axi_id\\=0x000@ ) * 32 / duration_time) / (4266 * 1000000 * 4)",
> +		"ScaleUnit": "1e2%",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bandwidth usage for lpddr4 evk board",
> +		"MetricName": "imx94_bandwidth_usage.lpddr4",
> +		"MetricExpr": "(( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x000\\,axi_id\\=0x000@ + imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x000\\,axi_id\\=0x000@ ) * 32 / duration_time) / (4266 * 1000000 * 4)",
> +		"ScaleUnit": "1e2%",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of all masters read from ddr",
> +		"MetricName": "imx94_ddr_read.all",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x000\\,axi_id\\=0x000@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of all masters write to ddr",
> +		"MetricName": "imx94_ddr_write.all",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x000\\,axi_id\\=0x000@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of all a55 read from ddr",
> +		"MetricName": "imx94_ddr_read.a55_all",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x3fc\\,axi_id\\=0x000@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of all a55 write from ddr",
> +		"MetricName": "imx94_ddr_write.a55_all",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3fc\\,axi_id\\=0x000@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of a55 core 0 read from ddr",
> +		"MetricName": "imx94_ddr_read.a55_0",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x3ff\\,axi_id\\=0x000@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of a55 core 0 write to ddr",
> +		"MetricName": "imx94_ddr_write.a55_0",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3ff\\,axi_id\\=0x000@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of a55 core 1 read from ddr",
> +		"MetricName": "imx94_ddr_read.a55_1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x001@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of a55 core 1 write to ddr",
> +		"MetricName": "imx94_ddr_write.a55_1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x001@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of a55 core 2 read from ddr",
> +		"MetricName": "imx94_ddr_read.a55_2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x00f\\,axi_id\\=0x002@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of a55 core 2 write to ddr",
> +		"MetricName": "imx94_ddr_write.a55_2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x002@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of a55 core 3 read from ddr",
> +		"MetricName": "imx94_ddr_read.a55_3",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x003@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of a55 core 3 write to ddr",
> +		"MetricName": "imx94_ddr_write.a55_3",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x003@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of m7 core1 read from ddr",
> +		"MetricName": "imx94_ddr_read.m7_1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x004@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of m7 core1 write to ddr",
> +		"MetricName": "imx94_ddr_write.m7_1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x004@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of m33 core1 (in netc) read from ddr",
> +		"MetricName": "imx94_ddr_read.m33_1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x00f\\,axi_id\\=0x005@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of m33 core1 (in netc) write to ddr",
> +		"MetricName": "imx94_ddr_write.m33_1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x005@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of pcie2 read from ddr",
> +		"MetricName": "imx94_ddr_read.pcie2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x006@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of pcie2 write to ddr",
> +		"MetricName": "imx94_ddr_write.pcie2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x006@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of Cortex-A DSU L3 evicted/ACP transactions read from ddr",
> +		"MetricName": "imx94_ddr_read.cortex_a_dsu",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x007@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of Cortex-A DSU L3 evicted/ACP transactions write to ddr",
> +		"MetricName": "imx94_ddr_write.cortex_a_dsu",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x007@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of m33 core0 read from ddr",
> +		"MetricName": "imx94_ddr_read.m33_0",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x00f\\,axi_id\\=0x008@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of m33 core0 write to ddr",
> +		"MetricName": "imx94_ddr_write.m33_0",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x008@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of m7 core0 read from ddr",
> +		"MetricName": "imx94_ddr_read.m7_0",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x009@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of m7 core0 write to ddr",
> +		"MetricName": "imx94_ddr_write.m7_0",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x009@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of sentinel read from ddr",
> +		"MetricName": "imx94_ddr_read.sentinel",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x00a@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of sentinel write to ddr",
> +		"MetricName": "imx94_ddr_write.sentinel",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00a@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of edma1 read from ddr",
> +		"MetricName": "imx94_ddr_read.edma1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x00f\\,axi_id\\=0x00b@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of edma1 write to ddr",
> +		"MetricName": "imx94_ddr_write.edma1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00b@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of edma2 read from ddr",
> +		"MetricName": "imx94_ddr_read.edma2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x00c@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of edma2 write to ddr",
> +		"MetricName": "imx94_ddr_write.edma2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00c@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of netc read from ddr",
> +		"MetricName": "imx94_ddr_read.netc",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x00d@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of netc write to ddr",
> +		"MetricName": "imx94_ddr_write.netc",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00d@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of aonmix read from ddr",
> +		"MetricName": "imx94_ddr_read.aonmix",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x00f@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of aonmix write to ddr",
> +		"MetricName": "imx94_ddr_write.aonmix",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00f@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of npumix read from ddr",
> +		"MetricName": "imx94_ddr_read.npumix",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x3f0\\,axi_id\\=0x010@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of npumix write to ddr",
> +		"MetricName": "imx94_ddr_write.npumix",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x010@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usdhc1 read from ddr",
> +		"MetricName": "imx94_ddr_read.usdhc1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x3f0\\,axi_id\\=0x0b0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usdhc1 write to ddr",
> +		"MetricName": "imx94_ddr_write.usdhc1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x0b0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usdhc2 read from ddr",
> +		"MetricName": "imx94_ddr_read.usdhc2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x3f0\\,axi_id\\=0x0c0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usdhc2 write to ddr",
> +		"MetricName": "imx94_ddr_write.usdhc2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x0c0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usdhc3 read from ddr",
> +		"MetricName": "imx94_ddr_read.usdhc3",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x3f0\\,axi_id\\=0x0d0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usdhc3 write to ddr",
> +		"MetricName": "imx94_ddr_write.usdhc3",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x0d0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of xspi read from ddr",
> +		"MetricName": "imx94_ddr_read.xspi",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x3f0\\,axi_id\\=0x0f0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of xspi write to ddr",
> +		"MetricName": "imx94_ddr_write.xspi",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x0f0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of pcie1 read from ddr",
> +		"MetricName": "imx94_ddr_read.pcie1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x3f0\\,axi_id\\=0x100@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of pcie1 write to ddr",
> +		"MetricName": "imx94_ddr_write.pcie1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x100@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usb1 read from ddr",
> +		"MetricName": "imx94_ddr_read.usb1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x3f0\\,axi_id\\=0x140@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usb1 write to ddr",
> +		"MetricName": "imx94_ddr_write.usb1",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x140@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usb2 read from ddr",
> +		"MetricName": "imx94_ddr_read.usb2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x3f0\\,axi_id\\=0x150@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of usb2 write to ddr",
> +		"MetricName": "imx94_ddr_write.usb2",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x150@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of pxp read from ddr",
> +		"MetricName": "imx94_ddr_read.pxp",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x3f0\\,axi_id\\=0x2a0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of pxp write to ddr",
> +		"MetricName": "imx94_ddr_write.pxp",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x2a0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of dcif read from ddr",
> +		"MetricName": "imx94_ddr_read.dcif",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x3f0\\,axi_id\\=0x2b0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	},
> +	{
> +		"BriefDescription": "bytes of dcif write to ddr",
> +		"MetricName": "imx94_ddr_write.dcif",
> +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x2b0@ ) * 32",
> +		"ScaleUnit": "9.765625e-4KB",
> +		"Unit": "imx9_ddr",
> +		"Compat": "imx94"
> +	}
> +]
>
> --
> 2.34.1
>

