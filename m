Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BE4CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJzXcZ41JVUmlZBhGsDGL0RcDuyeStiDy+X8sfQXlzU=; b=xXstbOiw5PHWsbnBEshEYL1GP+
	NwBPZwfEivwS6FihbNq0cYUIS9SwQBhbhVlFIjtk+5TzinZtxaLYfdQVvh+OnRGt9H8M0rV7Owi03
	VwPSfVdSKUlfy+g6XoTQFt8p+JG4oB1+OIYZktLqSFhvR5Oywxf249YwNN2Xz4uVH9VeX+5iIZ4S8
	bExsxHInNohpWCpgmLLNzBmjWc3tYqQkDV5Lse7gZXtg2qtUSL+9ixlFyJ9gRX3XdWxRnMrZu1jrV
	8blalaUwbjCZqx8+NHjaqZTuY3Z2KazTqW65MbMLRxo0qlAd6aGYIPfxyaNk7AjyGUZAQpBdB2dYV
	Ur+c63wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvYe-00000005BC4-0oTh;
	Fri, 29 Aug 2025 09:38:08 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruvb-000000053Kx-3Ycd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:57:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aX7qj3bS/7YV5fRfdmCoiPTUjXlp/8/qLnIrpr7JAnsz1uZBZMwt+yrE7+XTYecDG7TT5Iu0sE9d+vx1YuDDrQXtuY/lkT7qX66DmEy7dvRbaPWLJbS3/proUkQ8npenjnS7uLu/rqd04myz0DoVh9mUam+CSILglVVpuEavrmfwO+IqMfD2PEpQHkE85dA0p0apTVO852GZSdgPMIy+x0yp2zUcoxP9zM3VEBBoaOfENZX6zQTm5ziJfiR9bSEl+RA3yF9wLcC1SK5weOmxiF6gMHf/88mYMEfjkNobZvAJfnEX1wlhRIHAKn9ZQ6F3kk60EzTuHGYnEiJf1id8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJzXcZ41JVUmlZBhGsDGL0RcDuyeStiDy+X8sfQXlzU=;
 b=CGMjCCcEwb04Zk6kJ1aeTLIId3RT04p4ZHfwFTVHUbSshMYVdgxe1EbvA+z6rXVO2dkRfH3sN1dYiFR2roToixzPsyXMTiR041xLsWBKEPoW5a/jDs8fXiWC5B/q9DuVr3vFXwjR4VHdaLFfT6gu9CZGPoxa1p0iXr0hXAtOy37ZnzkF7Xv+JOGjniU2PcjY91eymPoGMFVUcza5WQMnsMGC5h5ZVqKVkU8ItFLWziwEZxNhCXruFp8d4HZ7fW8em2pLZfS4/WjLzDxNQkKHzH2PWSnAUK07vPF7/Oo7V8+JfFIvI+lzjMzCyhSZJQlyTmW6hXdUxBGBdtFRHOb4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJzXcZ41JVUmlZBhGsDGL0RcDuyeStiDy+X8sfQXlzU=;
 b=cIQ2dRtauQTRtYPLNPXRVufzv4DTiFw8WrtLNe7A3cuuN+KUmGCAfg5HacMXVM0Xrc0/a4K19awq6jYgUX36g9gbV45MF/1R3cq4QyUAUsWw/oNhYeaUGBjo5q4hSEeqj/jlRE3KpdJmglFFpMkFv2tY6ypDLUl+Z3X7QMBdyJJI2usQ7zsZTwiJxm1qMeit5D5gcUDuzOtsLTQ7d+awk3E6/n4e5edTOoMc8svA6zr59rQOLnXlDS6cT08eNUEmlQZkQM++2toIQrMVUumPWXM7z+s9Cy/hyqAPYl0GhJy1izXgpBR//cfcj7MBGq9urWMSQSX+wKyRWSV/4y5c0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7902.eurprd04.prod.outlook.com (2603:10a6:102:c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.9; Fri, 29 Aug
 2025 08:57:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 08:57:41 +0000
Date: Fri, 29 Aug 2025 18:09:03 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: scmi: migrate round_rate() to determine_rate()
Message-ID: <20250829100903.GB16625@nxa18884-linux.ap.freescale.net>
References: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: d3de1493-8f61-4946-8fd2-08dde6da1c51
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0bEHdqJojeSXJopxzhKxaNddREPawDslQa0sSu0VWj9RXOgSF7BM7TH+9PQa?=
 =?us-ascii?Q?7j6uEHjeO880NLj+VgH+g1RTbzrAJgljFh0q6rFkErLM9CLU/udMSre96JTH?=
 =?us-ascii?Q?YLYXxpZtgV4iUNmoV1MBDUCn1f5KbZUvcLQLTDAZ3Onq3HfCtVBtJwMUpl3E?=
 =?us-ascii?Q?K2e45Qmetibz6de9d78WZmS9qbG60M+6XNao4inAzAJhRdx6l27/4AYpOYpW?=
 =?us-ascii?Q?1kQFchm4X16ZdQezHbphdi2JmxJ3AmyNGnf9B0Vdxh5wSMGhOJQY7anafUJj?=
 =?us-ascii?Q?6PoqkJxshhzASGAet2YT6WBgFFY78nCwA4HON+4d12Ce8RCDpaPKOeuBK2T1?=
 =?us-ascii?Q?vyCSAErw07nsLXPOM+vONgitxtb3CoUqLFQkSOGLYt287fV0eA36Ytb5knP0?=
 =?us-ascii?Q?NZhI+F7tIkTDVM96D32kaX2IqGJPXTJcUYzkbCISI74/83p/KvAeNA6DqfiC?=
 =?us-ascii?Q?cE2qdRFEvLvDwcURvPsoKWfIBvzIWWENTWz9T4URb6BVoeOj+vyMRURR+tiS?=
 =?us-ascii?Q?ihvvNGiBQgqti/jTEuEg/u2T69l9U5LGQhm0GLKJScCICpd6T7Vqdbg5Pjvc?=
 =?us-ascii?Q?E301LVgufrIrj8tVzhhxtgYgV7LBQflk2VNDSOFtbCwIFfQu28E76JFIlzN4?=
 =?us-ascii?Q?rmti8rchi9NQQBgmpD/sh5kPDeGNsX34d5qRTt84sg63d9C8fIuqRDMe50g6?=
 =?us-ascii?Q?bF+sokWT+gWHnYq+6E3wRKBO6z+zjbPuLfpXZIc28x9C/jkYdgeUnNVqYrKu?=
 =?us-ascii?Q?zJnKfwUjjLDNhmRlhUds1P3JI0F26QCeFPoHJX0fFo2DoEo3+JZFAvxF2jW/?=
 =?us-ascii?Q?3+4083/xQwfuZSIrTSxgoepD+2cpIodXvnxXJXh/BzXLrlXDgWouK7hqLkmW?=
 =?us-ascii?Q?PM0ejio0kgGYU/DQRU+WkZN5MJUFODwHArEHL9olciHwV+qXQSdxRd0uRIy6?=
 =?us-ascii?Q?8WnNeqQjXrqo6BhSN9EoyMjMTAHYRxO1nXiZfk1YAJCoaRgicikHFt1dzu1q?=
 =?us-ascii?Q?PXlv5jZ2/0FYFwjL0RtFvCmJL531ODcz6LHx66RsDzEcAK3ptI67Dpw6Suaq?=
 =?us-ascii?Q?96sZ0lWnZX2dNMgCKEQ3u/P9qZzdk6/FIvKTDXz6cHm2h67z/SaMEQUOcj5I?=
 =?us-ascii?Q?5Z/SqmIV3RVHra/j0NGw4FfRPtBx5ktGep/J8Xd0geDhQIUFz0ukb4JlHBL6?=
 =?us-ascii?Q?531PH4A5ztM7CquNQiEHYkrLPJAhMLuxX2dsHBH9k44XzYUjACn74YR39aNO?=
 =?us-ascii?Q?x9RChCXJCeQ7r0ysW5oGbnyosyHpQi7RNSkWn2VsGmgvJb2RuZ1lnp8FD+Bq?=
 =?us-ascii?Q?Vfn0y1+/ibHuuI50c8Hr51O11PgRPz/iYYLTB+KHWidjAVE4Ny+kzbcOVPgF?=
 =?us-ascii?Q?HxuZKP1nTqn+eGe19HpyUdgVSWkQfm70hwxEL3+bbL7IklACsdkzqGjRs0Xr?=
 =?us-ascii?Q?vk2HBarYE9O4dGQDgOXrW9+RVWjBKWYUFru7xjmqfTvQ5HcGe7K5MA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bD+mA5iHvAaj2rntEPpxlY93Y+Kvg6Hg4523ckusd5PAibZZ9kHKy3WXlirw?=
 =?us-ascii?Q?WqUMcYTwZMr2IVIlz27lBohg8YPTHUAYaknxQmBNpMMkeKOl4YxQjLkkfkEz?=
 =?us-ascii?Q?PeFzM2DHrmiFuk37P7mMRVcSjFMFfG6CJDh3CQD7XJjMKYo4x3DWxHJmdjCY?=
 =?us-ascii?Q?v8fTKEtE/bGsw7eTFWFAVaTul1FE4jtCtpDFZsVK2qWOoz9h0xi8gIz3FKrA?=
 =?us-ascii?Q?zlj1kwWpVmCpvy+q33v4X8aJ2Ntw1cRaOBhLP5/HhFiJTYD/NEDEjkCDFuSz?=
 =?us-ascii?Q?+rbvtmR6yvxeMFO5BW31ZKXSoOPS8HzX4P3Xkufkxi01jBSU+24LwLIcSXoM?=
 =?us-ascii?Q?MwtikDmzXYgRzZIPpRfkM0kl1c9DviHCRl3lws3xCtRjQT5917Y7oib3JBTL?=
 =?us-ascii?Q?9zcAQnd0aluiz38FryugicfrUnoouegav1G7N+qnvlCX1C/BHeHD4EEHnx8i?=
 =?us-ascii?Q?FL3RJm4DWE7xGu5iNq0hKK0YWJ0wh/tGbgUmXT1OrDCJ8iPoLN11Iie3hurh?=
 =?us-ascii?Q?iriEV2Y+VQ1yPdBBaxOh+1w2rbaj6uF9VkxhSSIlGdBYU07/EeQBSM3VBiAY?=
 =?us-ascii?Q?YkjsoSnMP8Tu8228sR4lsxsThTRYDFg8OWoARpADeQ2LFNxs62SMxiPazxyk?=
 =?us-ascii?Q?ofYCnSFzrzRd8w8pZCVewZH1Si0y6w8QefPz8ql4PYI3+RDh7brQlkwm2Gl2?=
 =?us-ascii?Q?5Dis27qPwgl3N2EKs/eU9I1ssC3xvQu9am4pU12WDsF03SZLnJ+9yjtS1tMl?=
 =?us-ascii?Q?gNQZ8K+KaSrjAsdddMnRyh2toMS3NR+VC7qCWLrfGgzx5Q2vrxZ5tBlcpERf?=
 =?us-ascii?Q?Ufg25bw5WL7bUlMZIiFzbgS1vyeqi2d7F5luk/ZNLNcM6ganI6cAS46x3O9t?=
 =?us-ascii?Q?arf63fyjsJ712kiDtpE4bpveSRwfVkakO9UeAOneWftFL9bFLA82tU7SInZp?=
 =?us-ascii?Q?SVWdsLSPocMSvW98rcDEMElwx5tUuDakR+FKMFt7M8ogN/YO6sK5Nrh1qBwj?=
 =?us-ascii?Q?aJif+TxsgqKxmznlWMRxfhJve1PyDwNG8QzeBAtYzuoBhR8envee6Hry/+Oj?=
 =?us-ascii?Q?O3ERqMy2mueszJxD1SKJas8dde49rw6omugX32f15v71mWOb3YmbbUA+miSk?=
 =?us-ascii?Q?k1I9i8ihlBRNM1JLixbNkozmVh3ACEY+J0lxWT44Ycvek2RMIi2H1FiNrqDx?=
 =?us-ascii?Q?r11p/XFf17fuCWzMdMNBm6MU/ZL91ebv6Qxm8tNKnnssWg4AL4AyQ83Z//f1?=
 =?us-ascii?Q?Vbx4KZxhlmWZ9Hox/m6YutO3nbljnH/S9Jm4VQ/ZD4/6CUALau6I8EmgH/uR?=
 =?us-ascii?Q?l+x/uLVMg1kCFfjZEjhEs8CfNrTju0H6IxIdUIC+mhzuyYwE4o3RUvnjeNIz?=
 =?us-ascii?Q?XoBhkntIPMktj6ekKTGeVrWDn/ZlRCj5rKd6wTrzvyM1UBn5KIXPEkgsZrqh?=
 =?us-ascii?Q?zjGHABgiK/aAgPbwgBOy9Ebn5kBOsUxt9n3DVqlh9BQHI0ISpq5oOitcK1S3?=
 =?us-ascii?Q?sreQKEgfo71YIQpYXUNtHQsBrEA56W46BqehaNa4nc85suIlUUMx3OvoFRxY?=
 =?us-ascii?Q?68LIKqSEKkmEnOVHvtTLdCt+WfAM4m1VIkgzsMzK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3de1493-8f61-4946-8fd2-08dde6da1c51
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:57:41.4311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgb7CWKGwXe27nYZGM2xQUP6WYiZJwXHHbScj11oRTlGCv/PXNJ+qKBGqpIuFqtnfGFQ9GXIQlFQMrR97WaQ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_015747_899365_E8B4CD2F 
X-CRM114-Status: UNSURE (   9.10  )
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

On Wed, Aug 27, 2025 at 01:12:07PM -0400, Brian Masney wrote:
>This driver implements both the determine_rate() and round_rate() clk
>ops, and the round_rate() clk ops is deprecated. When both are defined,
>clk_core_determine_round_nolock() from the clk core will only use the
>determine_rate() clk ops.
>
>The existing scmi_clk_determine_rate() is a noop implementation that
>lets the firmware round the rate as appropriate. Drop the existing
>determine_rate implementation and convert the existing round_rate()
>implementation over to determine_rate().
>
>scmi_clk_determine_rate() was added recently when the clock parent
>support was added, so it's not expected that this change will regress
>anything.
>
>Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

