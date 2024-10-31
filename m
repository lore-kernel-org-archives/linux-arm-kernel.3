Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72446E67485
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 21:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gf7UYH2r7HgYPdh8pXRvrLKUXvJefeDhSPORnL50yJY=; b=ikPRWPnPCYZcv8aZltuPB6puGG
	4tWzDHVdOdvGPJN2/XwU7J0eOge9ZLUQ7g7lT9rpRMwdcLVBfiqXKG8fDqVtGclgSeRDM7mhqxoVY
	HopgKWPpJb3IYuOZGLY4l608Yj9APFxoK4VUfrjpYDmUp+o9X+t0QFDiKYsEQWs8IY04ydUPntv+V
	yn7+JRlch1FrhGCudJaC8oPQl5N2DOBsALN/39vA1FZnassTziQqu2FIPEDrin1SLugKgJ0pa30F2
	O9iNHA71Cv/OI1Aj4W8vXbKVCHwYVPv6kMpaO6eWOtmVdbU62CgYQatCmILPqZOLIEJBL6bkxM1JH
	5VWfZjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6cqn-00000004x7F-0C0O;
	Thu, 31 Oct 2024 21:37:05 +0000
Received: from mail-co1nam11on2070f.outbound.protection.outlook.com ([2a01:111:f403:2416::70f] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6cp4-00000004wls-0IUE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 21:35:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXINoLAaoOH8QRSGs6kFtLrh0sAWi6kMRO504T4YLD088om11gPfrUyv/kcGOj+Vj2Be30z2YG1YWyGuVhoSnLLG7kcbdrjJ0utjB/YuoLAcijzuge/YwzgEQgOkluhztRCjobQAOJsd5D3xVSl0HvPGyvdAhOLBNOHh9Gl4PHqeznSSrAY/UMFS6ecYyP0UBC9OYT4xRQX1D0pOKBR5h1d8k0JgX5WlX7s4Xz2uUojaX0yGmZePz01qf4qjZUwNQQ5QqL4li76fV8XDb+Wk0u1KmdBt6zecooVFxYt2eklluSZbyKNArsHjEmPXdBR4bm/wbg5JGkdQ/xgug3E9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf7UYH2r7HgYPdh8pXRvrLKUXvJefeDhSPORnL50yJY=;
 b=g+sQnQaqpO/GRjm6CIqrpTkz2cPyOLC1AT4fqcVAGrdgEI2rrIGAOMAJXFKgiSm1n5+CGKq7hRNMOizyfyWX4E86F//IQGUU66uFiQnXtNY/T5qC1ONtqp97QiJs8dm3in3Kp1jq8fx4B1E6VxLurUkJpwoIvnQr4yZcmX7RWLUD6BveRqD6oyuZ9lNy+tvIqz96yQX4fmoOshbQ1YvsnCIHWd4q9rJ7WQzWo/WB2UTBi0DkUnEiXD1yk8bT1nII2VmYz6cqbpJsVcY0FaWeiB8SJH1CGGRxc4kDfm3Dy18R8RJ7g/q0Gt2Wo7+fe9NXUHFRTleZsi18woATwvYRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf7UYH2r7HgYPdh8pXRvrLKUXvJefeDhSPORnL50yJY=;
 b=JMCuvusd90pBXVdU+NTagyjF/WelP6Fqi0j2wBSvcNIi5u2tgK1iCROrs5/7rL7D50lfhwKCObozqxBBmg3rlWkhrBeDAr8qvXrP0vxOwyfGyl9W+DyvKE6BVyoguAWdqiDHHvKHLKFMBatOxoBvnzSp8TFSWl9ZxfI6tr1/9K8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 DM4PR01MB7761.prod.exchangelabs.com (2603:10b6:8:68::13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.9; Thu, 31 Oct 2024 21:35:11 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%3]) with mapi id 15.20.8137.008; Thu, 31 Oct 2024
 21:35:11 +0000
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
Subject: [PATCH v2 0/2] perf arm-spe: Add support for SPE Data Source packet on AmpereOne
Date: Thu, 31 Oct 2024 21:35:31 +0000
Message-ID: <20241031213533.11148-1-ilkka@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::14) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|DM4PR01MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 8016c2eb-e2f1-49e0-4ea5-08dcf9f3e633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?14qWxNSIcZVvpXtFFm7cNPYv/3LC+o/ozO4MXz+vaqUwdaqzyt6KMKVWWUkL?=
 =?us-ascii?Q?yu/2gq1jS+tXhUXoLP8aFFaJtcgQ+ZL57ip5b6vb85+Mei5vFZvZ7ARR2gBx?=
 =?us-ascii?Q?wXZKiRj3k2wUEzYX9tlFuyNm/krsA02g8Ui4q6QhXx0EMX4jxY/EFEMq954k?=
 =?us-ascii?Q?34I7vbRgdNyL1Jo5iHQzGCEjSYYT8/kjPRKcBTSRDTsble0V0lMv7CQu1KFU?=
 =?us-ascii?Q?RyfRktgMUScsrQTH+RhMpJyu2IaeXh8jO2++Se48b6e5oHqPsF21F3gQj6a0?=
 =?us-ascii?Q?Vsnibb4pTqWEx5mt0UBbjjTOuHII0C8HdPxh03h3EOzO7PA09mVo+sPxlaft?=
 =?us-ascii?Q?/0P6BT/sda+q04AS+miU8whoXW0NAMBJxoxJ/lA4UztHkBQcejfYBNRTr7JV?=
 =?us-ascii?Q?g0+8QYZHY7YiwixgWhFbmebkl9dPevyJLUlxE63oqE9aD/AA5OK5VBQVIwxV?=
 =?us-ascii?Q?5a/x7NH0IC6DrhcunwK6/WHoSdtpEySmtO7dpF6l3c8EfxoIfvra4wUlwQVo?=
 =?us-ascii?Q?fLKR+X3svS7nU83HM1RXogYhaAMygk/0hPaBV0hC7Pn0yTa45SZTLWZdQYiS?=
 =?us-ascii?Q?buiXGVQ8HxRRaM8hf+9wTeJpxWuHl7Tg9poUjXfsM15dag0411Xhi3zQ5ZAb?=
 =?us-ascii?Q?pZuFbXcUWcv8qOgzrNV/ZP1px00k/q7f2yOkDLWF8gwxIGd9Eow3v9GU9Y8J?=
 =?us-ascii?Q?tFXbcd7wD7EQeT0T6CKowMuwZ7zYKuQEG7PGL/KG6esn89TzpGUJOkaLlLCn?=
 =?us-ascii?Q?0pk0hIuiZ3qkabfSkcmMjOftuU/JB/bfxyPL3pitbLrP7G/oFX1AWGT42zgU?=
 =?us-ascii?Q?vaZALdhZvXNjkZrM7xStDSDMgxPgDUoQCEfDGMT/KUhzQTxnWuhw8PVZg/zV?=
 =?us-ascii?Q?2vmFWmjjQf/MIQAmXQoYLn6WnvHoM1AbhJ2ZaRJT84o2FG/NwMezIwkPJoWd?=
 =?us-ascii?Q?FDjGxrfXXYg7OvgMn55claVm2/hp9KtWWA1WaVr/qeNpKQkfEY40zAm5fuD+?=
 =?us-ascii?Q?ve701Eoxk4z/uNXXjx/tUYHSDQFW3AkPRPG6ndQCEnWr5PDzcpHPzp8DRzgd?=
 =?us-ascii?Q?JGZxbKKzmn6tlA5sl6a3J6BuBBa6NlKKVmaPx7NdGAbfzE7NFlBQ8ZToBN4C?=
 =?us-ascii?Q?L8HNCgETLL3bWxEcAedHEs8htiOfGbvy77p5bzrLq1VcGINbeHQ5IMxPrR5R?=
 =?us-ascii?Q?aqxxStdzeHUEfCz5oAjyAlUh3xwXBkJLjP/k7BwCU/TZOHIaUso6EYFPy/0F?=
 =?us-ascii?Q?Dx3LGNxf95Fbz8AsFR4Dy4/I2c1hfObMJeFtC8DwqU0WhrdgWjKYwo1H8CjH?=
 =?us-ascii?Q?3zem/QXgJeo7u/XHN5dyJTJf6f7iHTT4TvA+znGdCwUCXBakFcatJ0ipnvGd?=
 =?us-ascii?Q?SgBZiJ3wIDJAzbecR7IlWgiSABu1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lO/w4l0bXwjT4UYW9jc/+eE5ohUyFolGk5lhzOFNB6RkA/nwr2yg/5iAg+FT?=
 =?us-ascii?Q?Pbe1tFJSKgl13K7mdSDUuyfFT9q/dJO1RJ6y8GzyHUMEzT41LMbEmo/j6EsG?=
 =?us-ascii?Q?CHivXY1+7Lp5cv6sXGH60u+ggFj0gIE1vmWSv7XEa8dxsWR/hFZZ1C7s3Fh8?=
 =?us-ascii?Q?Yvl70QkaLjsya0ERmBaplCT3cZC7krXebKbyjYyafMcLemH0AtrRsL1BEgy5?=
 =?us-ascii?Q?gycZUPYzzAEnDd4+jbGei7IBW5VeRCqWH3nbJxKiZniiKl9zMjb9PcfpuwrJ?=
 =?us-ascii?Q?FBuskrPGsJJjouNI6+eZqfj8H9EkqvzFyB2Wo3Q9BPDvW6zvtwJE3G5kGb6k?=
 =?us-ascii?Q?Dl4rt9XnQ6BcREkmxBrOU/3xQ669g7YY7v3ZOEXSRfowKidHW+kBcH7gIKnP?=
 =?us-ascii?Q?zf/xDv7nOMrpuD1u96Uxxs240bYReCJGR2jRUru3JywSP5xcUovIOtliynQY?=
 =?us-ascii?Q?A645VEYuwth5DIHsxecloAXA7/4haqIU8QT+k2DWj6bu9p0D5EuUVarz5yHR?=
 =?us-ascii?Q?BQN2UNzj4NK6k/Kf/2StvUjYMxcCfV1Y/7pRciZ1ysR1ZyevgU+F63MFVIrA?=
 =?us-ascii?Q?V8T4SAht6tnD+sZO5A4HlfRQPPqTvXUybNtuQcxC/J+Ewif7jSXmQUat5Ghl?=
 =?us-ascii?Q?AI5x8kLoyAm14X8cOtTTuiA1uokXv8HcC4F8gF70EzJDWwbo+bCWf/ySopey?=
 =?us-ascii?Q?JDqro50wOLVvM6eN0lmrac4zSiE9fKQ7XaDAUwL1WQHhYIbzIN7+tkaQNd0I?=
 =?us-ascii?Q?H3m8Bd2n9LJqvTg8kZ9R/u9/lWoZtWZ/76t7+3zt1BLCE9rxFpTtaKJBrOFE?=
 =?us-ascii?Q?1rDzNTLx6jqhaFF+L9A7s3qmtlKzrdJ5CVoqZbhSVkFMxi7cmferCaQ+YZDj?=
 =?us-ascii?Q?3c0dehBiIAUkri3hYHeVAJ+pIqJR4OyQdyVIyovm+JEdpuv/FEXZ+TxEJezC?=
 =?us-ascii?Q?0vTWZO3FhIUfXrY9NhHV0S1e6rGvGumYHJa9dh0BiVHZIYqfBWFDFCvofiFo?=
 =?us-ascii?Q?TiXBrsA4cS7z56u8BggIe6JSS2RQbC8XOyuqnunLIrrqqsBQhdoNYhkjU6O2?=
 =?us-ascii?Q?1YuuK9C0sWvyRzhdhAYG1ZWVEJqdKpMRfAH+x5gDTjXvfgca9kFZ1X0X2iSO?=
 =?us-ascii?Q?v0ieeSmgoobLpwVMaaQD2MJ78+z2VfSiyqvNjHVmbbF0jDA1WRzZCmh0OUXh?=
 =?us-ascii?Q?zTRzybVcSfTmfkKGO5fA5rkzGIyP6hFOAjoUK4cYXNYru2+u02/0iAXXWDSR?=
 =?us-ascii?Q?UDPi6z8tPOLMRKZUWZZZ/dvbT1QLxynCtHzgHfqm7L327slyoM0HRQQCoepa?=
 =?us-ascii?Q?c+TZznwwR7FJRqcVWAM9r9oZSRyRbe0lYVpAWj1hCuL0ymmi8viHXqWvfRSv?=
 =?us-ascii?Q?FAsw0+LDji/m1Kx56FNnl1qxtSX8DgJ4bjT0jqkLCkmWBhHjX9XsVme/j/y9?=
 =?us-ascii?Q?IoP6EZfryrTIKp/E3vnbN+JNpYahOPz+VwEeJFrgLTy9Zq7DfMg4NarmkcCm?=
 =?us-ascii?Q?jsVtWU+aLDcEkciuu5PZzhEszgAb34kz9qIh80oRiELDCk4C2l4+zOZMIBqp?=
 =?us-ascii?Q?vUVSanKv023hduPoVxOLK2q/X8kUbOEPPJahJPDqq/drnEaDSg47BYTT1XFi?=
 =?us-ascii?Q?qw4Fvnk4gTxd3fLq5YS5dnY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8016c2eb-e2f1-49e0-4ea5-08dcf9f3e633
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 21:35:11.6035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KH+6sGHdbcbFcJg9fHVHnvwZKEa67HRGG39U9uLT3CWnWvZzJGbjQqgx93eO9NWmRqUDXYdbICcPTopZ3NTSCZikgAj9ddvtAwluMc/PSBPe2SFdiRzBY0f/4/v0xlvU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR01MB7761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_143518_152784_6D99AC93 
X-CRM114-Status: UNSURE (   8.37  )
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

Changes from v1:

	* Doesn't use read_cpuid_implementor() anymore as that was broken and unnecessary.
	* Convert AmpereOne source field to matching common source fields to avoid duplicating
	  the code.
	* Rebased on top of perf-tools-next/perf-tools-next (ba993e5ada1d)

Ilkka Koskinen (2):
  perf arm-spe: Prepare for adding data source packet implementations
    for other cores
  perf arm-spe: Add support for SPE Data Source packet on AmpereOne

 .../util/arm-spe-decoder/arm-spe-decoder.h    |  9 +++
 tools/perf/util/arm-spe.c                     | 73 ++++++++++++++++++-
 2 files changed, 79 insertions(+), 3 deletions(-)

-- 
2.47.0


