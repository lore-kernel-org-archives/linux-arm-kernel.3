Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2569FD5D69F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 01:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v+cGdrKKlcvWJB57IoT8vuVqy5I75FMKVJmf1j0adbg=; b=LeJYM0l5xj3I0t7tqCUwZQJkqm
	ILnhw0wPXmpS/GObO08UX1NLAbtmxUxwQEsLKSQ8rPUP7VCQn1NDLeBaOHxnqDJ36m6YbJ5f7KH4U
	SXXWYSWYb0VpONXlqOs067WS/NoJt9OHMwGtmm2g0uRJm9PQ0afj1tzY2mA7fjm1fjQzGlRZINI98
	aFmAG6YYprTkqLBlDajauy8d6XM4M5ZsgfV0HZaiVLJ7jEKaziCUCsU82s/v07URUNih0e8lT6C5+
	53Nwy6CSjA+IorORYjOj+OMKxy0CpKuQd5V6PCwAB03q395pq06iffRWRjXAB4mm04lfO7pEDoVnO
	/X5QJjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9DWB-00000008tw5-19tx;
	Fri, 08 Nov 2024 01:10:31 +0000
Received: from mail-westus2azlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c002::] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9DUQ-00000008tjW-1pMG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 01:08:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYBz929lceu5DBJ1SLEyXCtd+thKuIzIAGsJvi7PCFBFtHPkGlD6x5Xll9I1o54G/HmCapUvonGLNT3rBm4HrnZIyqi2P3KJWHyRVWO8rY0IeXwctuFSR1/1r396qj2dlsGvsyTdyN6pytz0Rs7YSou5SI0HG445v+0ZGB+pe8EVKpB9hYkN4zSllnvf2mREmbPlvj06PhruuSI4jGlEGPkj99BJYXHmb3XSoPco2Rk9+QZcB+sQ4UQma2bWLrPtAiDgEjayIdDdVFNO8g29ECGnUa/HA4vrX/bxy4mCVGWjIAJqYgfewy9Y6cpljURzsqNpD2RtfjJBg0YHeuT+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+cGdrKKlcvWJB57IoT8vuVqy5I75FMKVJmf1j0adbg=;
 b=w7pne5cFt+t/KwzwriOBVp2Z/5NAGXnpwvdRh87de1FMHr6lNHIheNy5NzLU+CM7a+WDF53b1ZEzZg6q8Vs2euZVydQl2UeLhDKCc9nRb7kBVGk3vsj34DKc5r/Er3C80QrOgwUIiqP+v/Z1YTouuS/3w/HdETJx8AcVd4ekMF9yLssfln/dZMqgjClMlBhH3Mp0Jgpf+p0wWtwXb9NExbTCq9nwhuDhijTMdqDcju2V6X13yVZyA0BCMeYbaVbD6GuI9cCja/J2m0T5n57eUx5x3enuHI1VqTzjdpFUpL4FxTdiUznR2+/rsu5OVGsuC6gS12QY+ErYCPGsbZfZRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+cGdrKKlcvWJB57IoT8vuVqy5I75FMKVJmf1j0adbg=;
 b=kV9lJwZIRdSdYTkYc2/4Bv+D+8KH0SM1WXwnReVy1LIhMama/XVl4iu7O64rMcEHOPY2Ay/nth+bhXDVap9miy9i5iR0IUZHABozp4aDPfSGJOa5+NPekHB0533CNMOmr7qFEOO5U9Emc51fpTnXneB/uXgL6ILrNkvXVs7bzTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 CO1PR01MB7385.prod.exchangelabs.com (2603:10b6:303:158::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.19; Fri, 8 Nov 2024 01:08:37 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%3]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 01:08:36 +0000
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Graham Woodward <graham.woodward@arm.com>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] perf arm-spe: Add support for SPE Data Source packet on AmpereOne
Date: Fri,  8 Nov 2024 01:09:09 +0000
Message-ID: <20241108010911.58412-1-ilkka@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0366.namprd03.prod.outlook.com
 (2603:10b6:610:119::12) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|CO1PR01MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: df3ab4b2-4f51-442c-e251-08dcff91df83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?owpzJ1nYr/b3oprihX5PKdYTwKUZpcpfm+IiqXHgIGioFFZordQ2V26srm09?=
 =?us-ascii?Q?ptal7sBUUy6BSkzBTDAhuQxs5MQqozpXkr4aB2bu3h8RgCII2XmT0c6hawaE?=
 =?us-ascii?Q?EEk/IwGt40PdthE83ow6mB+F0/Hqrza+RnR+Hy570IDhdQRmiwiZx6dcKIxf?=
 =?us-ascii?Q?mqDJqINuZkseT9xWXKPADxXPwsD73WtpQhw/6MpOKwXEeBYh2mtK71c4D4C9?=
 =?us-ascii?Q?nontfipBoqYCPvl5tZC1BsNL9OvSnjj+HP5wWemDiuCaTJDfAwAIxV83hecc?=
 =?us-ascii?Q?Jy9bcp7h4W0UVts/OoRZV4dBfRHWrTOGhgfHQiLQmaSDwdUY0yDqDL8BgFig?=
 =?us-ascii?Q?RCFMME0mxlyCwDXQEZgH0zi16p7RQEpiLz2lzZ1Yq+6ca3/0l3LI+reMj23N?=
 =?us-ascii?Q?pMP/HFKp0MFzv4qZsh7+TW670Q+27YZW3IyN7jl2p5h5By8H7q/Vhz7OCZbq?=
 =?us-ascii?Q?9EAYNXSoNbUUBrFibStLXYBK5Mt52Ztx1qbXTQyRv72Zan2ejMyjlY9Q1srR?=
 =?us-ascii?Q?OICJpLyRrh9kf1kcFkRwNLMnHlEpb4DxIIp/u6K+2hzekgsQy3/8ir+wGK9T?=
 =?us-ascii?Q?zzkAo2SueVja7ROMD6vic28uac3rQTfS/uAzYVwVcN9BiW5F0B7uNFy9Vu0e?=
 =?us-ascii?Q?N0inpH+2SWIeKu43V7Nq1DO/+zQFZfXy/S42xKu/FiNesj3jBn2S99z5nBSK?=
 =?us-ascii?Q?hkI20T5jvxLq1BG1QNjVKONRmkO925BGD9uz8QnCqD/AQZufV3r2nekoecba?=
 =?us-ascii?Q?J3QUAc6wqfYdOc0V678sWhgO09IJHKqu4ZlUniETHIFYU7EZDfnwOChenUJb?=
 =?us-ascii?Q?LTt3tXSNrfpRgHKVRulDzU2rPms+gZsA9dWP/VqQOOcEdjpJeTr7mjNptE85?=
 =?us-ascii?Q?3USJ3iCyIRyJBi9f3u5So8KyiFSmzg4omxf6sDkZq38rmjQ7gak+DWw7RIAb?=
 =?us-ascii?Q?sWMdcPdCSTeqa4HR78YTNvMnMQcnd+Hnlnua1B4bsH/brVn8MPAKY3dcWowS?=
 =?us-ascii?Q?c9It9f6Tt+BAIlcdra/NJNo5DvdrtCFJugFAUhjDcY4/vSgn/6i1xEQ2jomZ?=
 =?us-ascii?Q?/O+L3oCT+rflLdqFkL6fYOG4U0+LNYFQ/NvZezVQ8PdtDia1Hjb8cdLVAN4i?=
 =?us-ascii?Q?xMiLFu9XenCD19G5x7IZfixvmpuBA7dR7CJuKNOtZe7JPM2z1X9lii5LJkkn?=
 =?us-ascii?Q?duLwL9dyVkGVcIuQDjcPkKmP09k9/5CDm7KuoFHWXgsyi0ElZ4O+DJQJ1aTc?=
 =?us-ascii?Q?AUY9S2wU/6ufjUSijRGkgQXKzWagzYCxHu1wvDMtk4WDpVbpBcR22FvcDsxZ?=
 =?us-ascii?Q?5NH0q92lwjWvrbq7qsXHOpn4ir7aV1wvtfTYWXVtrgl2t+zahr/kQZgVa4Cb?=
 =?us-ascii?Q?wvwAIL2428V0JTx+MF4KHQGXaCZi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?omwzgCCmzzEBbOduu7k3oVz+jzXYPfYb5BA/9pH/M77pRu9y+9iG65wd+Ibj?=
 =?us-ascii?Q?Sbie8RepJxcCgt7j1iqFg6N7/ZXdG5HgZvByJskuPL5/NOYah/fTRhwPLTwW?=
 =?us-ascii?Q?WGM/JJnTiRVric9IYsLftY8mVF9c0aUoB1SXM/mJvReLiaTotZrL/WY5KP8H?=
 =?us-ascii?Q?eT0uQ9DxGl1qZ4ZomeHsS0vpwfwan2ur0AhieIHA5E4D7W19UYyUY3LpZnw+?=
 =?us-ascii?Q?Qn5Jbq6iFObo3DjANpbzkqLPeUuz7YUdU9NRoBzqBNRd+lcFSlEceSWPLG43?=
 =?us-ascii?Q?DODzxHeAmINeBxoqy7I7tHmtQu/1BUxPal+2PvTWmTVslbu+QCDwc34QoH1B?=
 =?us-ascii?Q?2lIgug7ymaWYnVvzzvU6S8D9U90aPoQyZ1uASSkjOCAMdtfquFH6TpXEp/cD?=
 =?us-ascii?Q?uN+gnRRIKHSl98x8jaxnvkakzV9o0K9FtM6BQ/I6ozap1fVGd9srTPSv8lZf?=
 =?us-ascii?Q?vuCBQBHbASDfjuj89DnEiUrVv4fBbtH8gHqW+sUBcd7fN/UQPygyoh+uaZy5?=
 =?us-ascii?Q?DrFHSIIfIkB5/YbSz+ihKSzcEdWEs5xKKo7CXEYT7a9bocbXjagy9vGtSJwI?=
 =?us-ascii?Q?TlxsnkjiN5xxFOU18YQzNhsN8JkazPl7v2JpZPF9iIJB/wQgUmDOB5C+eKfw?=
 =?us-ascii?Q?CXfLxzneaN47PkDDnpq64J3baANwJRCcNRRQRpbVCw/LuIpYpRvyHkVMoGWY?=
 =?us-ascii?Q?7YLyAPouoZ9HBgGe+7QM4IuCGSalyKy1g5tfBF+flBAoqgGnsr8/AM/uJYau?=
 =?us-ascii?Q?JSoCZTF1uVGV1F0+LO7333A2YNGo/HP6BP06TWRRlFNexF670wBD1OXk0Lkd?=
 =?us-ascii?Q?QFESUklrbIzR9qaIr3jmBiSAk3SO/PeznQGpwehQwzOBE9DxPv4ZBb0F7nb3?=
 =?us-ascii?Q?AhM+PSTM/cekj3hOQHollL6TZNLhmIuyyxhbViz6iCe6WFvNsokgAxQKqLxe?=
 =?us-ascii?Q?y5CZER2B8t6sLkzAbEuMyHNDN/nSBz2ryy1eBqQt4iEKb15alTJR5qxR4zsX?=
 =?us-ascii?Q?pywJeZeTgg3skp8OcfLcoTr5QOWMrd9FMnqWz40FZwu9DcsGJZ5r4aloLJn9?=
 =?us-ascii?Q?h8I93co7GvXSzFt1GCTMZF/V6PXYE++8o++p8IRq/GwZo6w5Dt928qRzPW0X?=
 =?us-ascii?Q?7qm4HSbM0faSYAV1z5JTKsPYsi/hKjexMhFihlnNM4NgDiJPrd/Z5LkVZkei?=
 =?us-ascii?Q?REdyUJm4zruXdh05WPixYy287WwUXJIrJ1PxeWBqYueHKXYz5gkuBbGv4CJn?=
 =?us-ascii?Q?m1grh4RrTgs5RKIVnyrwpmMhfxFgoOlE6ND2odLa9Ycpnu/pb6D5THEDfhO9?=
 =?us-ascii?Q?Y6m88HY/K5ET9B9euJdaXc67MhP2upL6GTKywmsR80Ni/k0Ii6nWRFoshzTl?=
 =?us-ascii?Q?9PZQQ6C/prRVk1AGNsGDNLmiiEwr8+MUT45Dk5njDTUN8aEn2CNI2qTK05ZR?=
 =?us-ascii?Q?fSqkUf1NfeZoCk2fGAOqk+Qzsk6vbM79L69f/Vmpv3q7eR8K6yt5y9JUz29i?=
 =?us-ascii?Q?HgWpnczo+mko9s2pDOQUGhB2meiaQC59/odwAwIldxSzh6q+NWDPGD2Hgyeh?=
 =?us-ascii?Q?8DxrkYkk86i30fItNVmLoXIHdhtENP6O+w8+s315kc9aMFUYOYd+bS8Q7Xsw?=
 =?us-ascii?Q?/FzdcP+4ZwsS9bZudcQ3d7E=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3ab4b2-4f51-442c-e251-08dcff91df83
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 01:08:36.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irShpgupydn01QypXDi3FkNWvD96d/iyxaysHwLfL42B6K58EKawVqMqfDJx+bPxwbNk0bxNn4BxDVZr39yjjtL/outgvwtzSn3WFbbKTSGGE11U+jCkUNYmdTvePq8Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB7385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_170842_513317_ACE658CC 
X-CRM114-Status: UNSURE (   8.58  )
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

v1:
	* https://lore.kernel.org/all/20241024233035.7979-1-ilkka@os.amperecomputing.com/

v2:
	* Doesn't use read_cpuid_implementor() anymore as that was broken and
	  unnecessary.
	* Convert AmpereOne source field to matching common source fields to
	  avoid duplicating the code.
	* Rebased on top of perf-tools-next/perf-tools-next (ba993e5ada1d)
	* https://lore.kernel.org/all/20241031213533.11148-1-ilkka@os.amperecomputing.com/

v3:
	* Changed source mapping to simple switch statement
	* Dropped is_xyz() stuff
	* Added table to map midr to data source decoding function
	* https://lore.kernel.org/all/20241106193740.6159-1-ilkka@os.amperecomputing.com/

v4:
	* Split midr/decoding function table
	* Made AmpereOne DS decoding function to ignore unknown sources

Ilkka Koskinen (2):
  perf arm-spe: Prepare for adding data source packet implementations
    for other cores
  perf arm-spe: Add support for SPE Data Source packet on AmpereOne

 .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 ++
 tools/perf/util/arm-spe.c                     | 86 ++++++++++++++++---
 2 files changed, 83 insertions(+), 12 deletions(-)

-- 
2.47.0


