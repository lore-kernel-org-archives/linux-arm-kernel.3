Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7E7CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 19:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6jTL77D0aWcEkQ3dZDh0f7V0bM2cTRv25+467Eqzb8=; b=UBFdz4E1MF6+N6NfH+a4WOwKsG
	slEpnOOelUukXvtrWg9fFtRxLC4TPorzgv1VVd/TInvc6b930cd9OZbpCTUKd+8ItkJcMN/qUjq62
	Nszcptf3rA2Dn0BVIesaMPGUZKC7DP9AEBPzMcbSlsXBJBrdR9H3lDa2TiTWGwYLPai3JYkP/SgLp
	Ekao0wg3bf9Fm7TuMBXL2si+XI/qefwfpDu7xGyIbR3xBKM5FyS5Fhd+19ALovuSWynGUBB0PwavI
	EQp2uShicgmAotXSuQVjxY4D6tAHrOfDzUIgAiLleibq0JEfPoQ7ee/TEvhq8OZ9i0AX1pMl691RG
	0CgMSKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEucd-00000006gjf-3Moq;
	Fri, 31 Oct 2025 19:17:15 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuca-00000006gj6-3BNl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 19:17:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8XMgUQ/4j12+79E094q+pbymaslGWdvPWOVQRqeDCWmC0R/FgtaRqSrYVEFFFoVULdsCoKudsIsgNOxp02N9d8hYpGnoq+X2RyMHoZqrbMqPT+paGxfA2Cvwh1GVttoOp/ePbeRKoV5yQHwpSwJU6K83Kzh+/sphEWrW5vTvgTA/0lRbbWR9s1+azWhpi0tR7iTiDi3Al7t+1GnQXXz1oud074h3aT9QpTkt9LAFTt25/huqm097uY7PPDmAz+XnYPOlGwF5qkEtwzG7qVTs6KGegMrY3+TcycVo7aPZ8gVREF04pFX+c5KD6oU22MX74CAw6RknaBeaIfPNRKKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6jTL77D0aWcEkQ3dZDh0f7V0bM2cTRv25+467Eqzb8=;
 b=mp28kUb8Agyq+wjUWO/k5o1fdvF64V1ELILK6e5vLwV07yT5AwzpYbLBunlnXoLxSmSFC/UgijHMBBUeSTG0hbB0ttxzIs6Tzs6I23Tvy1q9pYPArkn9NRChRRf1i8kS2cOWDE+xyjEQqnLDtB0WsiwdjrX+Y541/KzTUV4oBDE+YSdOao4IXZ1dcD0+oM1LYm6JFEuLAydC04nKzF296iySfaWd2IrXv2tVbUnE94TWEm4HkdByKMayADD6poKv71ahbAejmxfPL6Z9VEm5GgTfila5mWAz1ZnSd7FtEZO3aLY8V0Z/8W5SHxdPADtgM8C7xPJgNr/YHyb3vk9hfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6jTL77D0aWcEkQ3dZDh0f7V0bM2cTRv25+467Eqzb8=;
 b=KWzWhjOJVK13j+iF5t/yNPQMs7NHmMRFZRmFKbXOkQxEi9Tp34YnPp5oyhmA/R5XBUOm55Gd54O0HSakvG6oKLQE8eYuPZQCfLRZpuk4gY0Vy0losH3lJ7JZHQq5D1C12pKxlBfy0+1oOYHLh+djEs/tFDJA/wwobvksi+dLUwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 IA0PR01MB8349.prod.exchangelabs.com (2603:10b6:208:481::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Fri, 31 Oct 2025 19:17:06 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:17:06 +0000
Date: Fri, 31 Oct 2025 12:17:01 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Chu Guangqing <chuguangqing@inspur.com>
cc: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
    mike.leach@linaro.org, leo.yan@linux.dev, peterz@infradead.org, 
    mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
    mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
    irogers@google.com, adrian.hunter@intel.com, 
    linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/perf: Fix spelling typo in tools/perf
In-Reply-To: <20251031025810.1939-1-chuguangqing@inspur.com>
Message-ID: <0cc4d296-dd2f-5a07-59bd-d9cecc73d28c@os.amperecomputing.com>
References: <20251031025810.1939-1-chuguangqing@inspur.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:303:b7::29) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|IA0PR01MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: f7593300-c4de-4155-71f2-08de18b21473
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uYmLxPI1lHlivBx4qBCDrKdEt4iT60aNw8JGADjUYV/2m8GN6ezW0ZjsJ9Os?=
 =?us-ascii?Q?uiO96pD9nRrGNMqSGHNCEy+jGOyu1xuIDtN3UKRoiL4Erg3OoVmIAZwZ6vK5?=
 =?us-ascii?Q?TIfxskAaooJvBxTzvEnrqQ4lJyRZ2jUPL8w8KqHblstF4fuJN424yuUWjRcc?=
 =?us-ascii?Q?wnbSg43dBXPcrl9rqGHz4PPx7om2KZ+HdoS7qXVoZJJsuMPySvWQSVchZRCY?=
 =?us-ascii?Q?warX4e2KpKFifCnA5pJl6QiK50vzq1xAuG0mgbL5ddZjeDXKnjyyUX0oz81b?=
 =?us-ascii?Q?cPIYyreoGBy1GgWyCw0VNZ+vCJ2HgoVOlg2Vmd6PaeLf9oUP6tY0+1LgS4aR?=
 =?us-ascii?Q?v4U3OANvmgQIJF9loN9jd8n27/Qld+yYf60TNkQOYtVK3Ei3tLW8vqnI+YQg?=
 =?us-ascii?Q?nGz2uibxOmyWutkuJWvK7ZgVFg4Y7jINlVWQ7nwyY+4TvaXVXj5+01XxRjX7?=
 =?us-ascii?Q?8L8wl1lzrZEoASd5BUr+FtlhXVge0jwFYVu0OkBT3tojuSqGnHjNp1qaYXQw?=
 =?us-ascii?Q?bxdY+NktGgrL8/AetQTna034LmgRm2FS1GUWrEhdKrCdZt7SWo5iFfkS8CgD?=
 =?us-ascii?Q?jOAGbZSpqGRSOgq5qZVS7YaCXXShFS3rEjpHEvfBlgJ/Rj2TYXUwQlYF1jrO?=
 =?us-ascii?Q?AxFbv3kfkaBCMAfj8pTbp/JXAooIM8XRRdg3iRUuG8I36Q50RTVxpocBuhb4?=
 =?us-ascii?Q?mzfdqDDxeZEiWVyr0jBqb4PRyVkAXOkIp4lC82+fwLR1x82zQ8vEjrV78nCY?=
 =?us-ascii?Q?jfLONQFSfIdJiq70JSno/Aj4hZoKF6odS7Tq6WvKAqVx2WEDZzOBzkPzWTIr?=
 =?us-ascii?Q?eXqgujlBo8HtXmR6ZMRGLoRNSuPELAK8YxPjkMed1Hr/r5crdIhMMQPNmTQM?=
 =?us-ascii?Q?30PHafyb9YurZ1Tq21dgJ4THzswELA1/99IE+iN6Y4KDZ7zLcVy/2gn6Ox2g?=
 =?us-ascii?Q?EmhEcQ3H2vxt16ShCNVy3r+K+Bn06T2QLQWLlfpDViNabGjAFBjUkVKrtAPi?=
 =?us-ascii?Q?OzNlHwaTDCzdJvIQHbNePZVdDNxV7cSmBQehigW2UOhra6vpf76TLL/2Zugm?=
 =?us-ascii?Q?OdZQX38XfTDLpTy96N3d9kzIamesTdsS7opJMmiGppIlT78YF1U+Ya8KENuE?=
 =?us-ascii?Q?lppaaWYX0hXHRhzuTGMXQ1Hqe+I/FMRVLmif4I3NYo52WxAEzZM29m8h2RRU?=
 =?us-ascii?Q?pjcXd6e8T0HXW8MnMU4fwa2gTvENkSoHEcBTYJgSDnqidTJ4oHrWLey7iWXE?=
 =?us-ascii?Q?YF218568hhsySWIZykjHEsw6QHyqC6OCPyiQdVlau83MHSW6jlByqz95u60Y?=
 =?us-ascii?Q?MHdZSanhIxHznQ4SoGlFBnn52FZwUt+dw6xnY4l8y+xq/fZ6l5cOj5hMr0jx?=
 =?us-ascii?Q?f3rya0d5rOUj3RQS+eNhkXNoGNqfvXml4RYCOL5AJMCW/68MdspBZEUn3gOc?=
 =?us-ascii?Q?Jl8wsfVQ5NKBpqEXL4VoSw4UrJDlEcRSRWBMq/enn3S8sQ1Dn4nvgc0vMV7C?=
 =?us-ascii?Q?cj1gl5tG15/teekks1ukpcKvHgfIrU1OMVTP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AMOiGOkScm4QNtXONyZ2Ov2Ze0dLV9bnCqZaCLBTmdgVD4QInCbahJ/iVN+M?=
 =?us-ascii?Q?Y/6QJFbLCsfG5hRDGOcEl6/wlzhuvvVnKaP3LSk2iLC8c8EyQQgyxiE9ID+I?=
 =?us-ascii?Q?MS5t3TbpAhVJF23PJM5Ii2n3uati+DUjjDkWZ/Qv892dZkfUqDcB3utyp9hM?=
 =?us-ascii?Q?CVNyGCGg9x9jp31YaCgd+YVmkakLhl+tFUoeTaNVCT2/SX3fzpEO/lKCnKBJ?=
 =?us-ascii?Q?wl4icBqt/9nNF/tCUTH0Gf80T+pvWNHk5wd1LFmyxYuAEVa54Sh+AqRtCLjy?=
 =?us-ascii?Q?VJuXAmj5hwmCAFIFx5S4aqma5sFQkTT+mjjyca6ciYGEEmsGj5xW7x1Gbo/N?=
 =?us-ascii?Q?6aBtVg76pbNhod3b+ftC+EcUoJL7YzQeihUoy9xQV27gmBBBOSp42p6CCPId?=
 =?us-ascii?Q?MWFNEuqGf2i152Y/WnaLsLuwli/YwOy0SbvaHavAeVodgfE+UQqnfSGFx9gp?=
 =?us-ascii?Q?JzJtmlEoQlYRhs3ZxKvBNaVjirds7E5TvDFpHrYp8bS2sfgcF96K2Q0E+NdH?=
 =?us-ascii?Q?OhDx0GZMA7497tPG9E3ISRs7zG0d4FxPmoicxg7caBI4pSRP7zTUqMuSdaDK?=
 =?us-ascii?Q?aYRG6c1gOuVSYJnGGv+B7bSYBfJuCEwt5o665Tcvh0My3Bpq4K0jnakVwE4D?=
 =?us-ascii?Q?XwO3y4d2UrGrARaVz7rbsTUmi/Z2dS6JBvFkLGwvJfqFJlNZGUZqPKbLmCrw?=
 =?us-ascii?Q?UNCTypEstV20f0KIBHOo27wrsrV+kGuleAx9noME4i7PoGLKhzoTe2m9oRfA?=
 =?us-ascii?Q?taDQyaWsmZfOb35itQnmkb/H338wMZqvrMwW3VFQL7inL6Mvy8IWHSL7u5t5?=
 =?us-ascii?Q?OpUVIEdP0L9BlssBHUp2/DSPjeN+ixqDkZYI+Hrk0KDDfVCzr4pl3ug3VbHd?=
 =?us-ascii?Q?4SFXy91aw5koznFCGQxSoSug7d9na9kBbmequbdXhDiNKYnMMBIaMalgnrDl?=
 =?us-ascii?Q?pyORH6f2T20hTeaRnEEri+lm2BRL2hTM9TzOvfq4MMOLzk2HNOFOf/lcZxyr?=
 =?us-ascii?Q?ptAFfOaiEg5wHmLDYhUOkTyD5sap12CRV6JGQvk+Japj1uXT4uBZr3Mz6m2Y?=
 =?us-ascii?Q?qg0lZ0CZ2ZxDCWBjq+cZNRK7WCt1ubiQCj4XejaZ0W72YKKxN9UJTQ2/LDw7?=
 =?us-ascii?Q?rQP3nmRV95c/nEWrJ+hueY6gvbw0wZt39SNr2kqsoz7+eHu+2fbU3C38atG3?=
 =?us-ascii?Q?mYmlsCLo+u8FeB8dZuWIC83/AxymnFlUB39oqdM4f5P9SXs1yfClxptpTwHr?=
 =?us-ascii?Q?QDnwRc0pFliDJ4frqb+1icadVwhjxG8NOLODyk6NAKK6X89Dv/ciDG8Iiu+A?=
 =?us-ascii?Q?VsKMenGI3KsO9ihKIM1EpLVLRZIR6sdjmYSUdeC30El7C6ze1R/qgIuoecHh?=
 =?us-ascii?Q?eCYWJL5CpitJdmq0bHfSXsJq3SrulhQ+EwYCNuw+eJL0tj4l6voedXxz01bG?=
 =?us-ascii?Q?QvZmzps4Bf30h3+z2nnjjtnhTN/wLQVDU052s5RxshKBirZj4DHTyS1xnEer?=
 =?us-ascii?Q?4glQTL475KcUY/vE5uzpKyvCPLShcuKtr6smk1QvbsRfVs6ZArDCzsIdusCG?=
 =?us-ascii?Q?BGZLewui10PfDwoyebHMwtNA7WmPo4786bPc5WzjYrElU5sOaAHllKY/ZWyt?=
 =?us-ascii?Q?s/ISLJ8zEM7dWgqf7DL2OHQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7593300-c4de-4155-71f2-08de18b21473
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:17:06.1393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YP3bgO5pH3VdgWkSG3JWf44CfcVCqUgueWW/fnqG1BcExoFf7KfO3Wn+K8PIq42pbwHws8waX87W+8aVkqhpB1xBNOzagUkMLXTxo06gGm4tnioWdehlcDLLVQRwzPG1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_121712_809356_07FF1532 
X-CRM114-Status: GOOD (  14.90  )
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


On Fri, 31 Oct 2025, Chu Guangqing wrote:
> The json file incorrectly used "acceses" instead of "accesses".
>
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>

Thanks for the patch! I have just one comment, would you mind changing the 
subject line to match to the patches touching those event json files? 
Something like this

"perf vendor events arm64 AmpereOneX: Fix spelling typo in the metrics 
file"


With that change

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Cheers, Ilkka


> ---
> .../arch/arm64/ampere/ampereonex/metrics.json    | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> index 6817cac149e0..a29aadc9b2e3 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> @@ -388,55 +388,55 @@
>         "MetricExpr": "L1D_CACHE_RW / L1D_CACHE",
>         "BriefDescription": "L1D cache access - demand",
>         "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>     },
>     {
>         "MetricName": "l1d_cache_access_prefetches",
>         "MetricExpr": "L1D_CACHE_PRFM / L1D_CACHE",
>         "BriefDescription": "L1D cache access - prefetch",
>         "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>     },
>     {
>         "MetricName": "l1d_cache_demand_misses",
>         "MetricExpr": "L1D_CACHE_REFILL_RW / L1D_CACHE",
>         "BriefDescription": "L1D cache demand misses",
>         "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>     },
>     {
>         "MetricName": "l1d_cache_demand_misses_read",
>         "MetricExpr": "L1D_CACHE_REFILL_RD / L1D_CACHE",
>         "BriefDescription": "L1D cache demand misses - read",
>         "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>     },
>     {
>         "MetricName": "l1d_cache_demand_misses_write",
>         "MetricExpr": "L1D_CACHE_REFILL_WR / L1D_CACHE",
>         "BriefDescription": "L1D cache demand misses - write",
>         "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>     },
>     {
>         "MetricName": "l1d_cache_prefetch_misses",
>         "MetricExpr": "L1D_CACHE_REFILL_PRFM / L1D_CACHE",
>         "BriefDescription": "L1D cache prefetch misses",
>         "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>     },
>     {
>         "MetricName": "ase_scalar_mix",
>         "MetricExpr": "ASE_SCALAR_SPEC / OP_SPEC",
>         "BriefDescription": "Proportion of advanced SIMD data processing operations (excluding DP_SPEC/LD_SPEC) scalar operations",
>         "MetricGroup": "Instructions",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>     },
>     {
>         "MetricName": "ase_vector_mix",
>         "MetricExpr": "ASE_VECTOR_SPEC / OP_SPEC",
>         "BriefDescription": "Proportion of advanced SIMD data processing operations (excluding DP_SPEC/LD_SPEC) vector operations",
>         "MetricGroup": "Instructions",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>     }
> ]
> -- 
> 2.43.7
>
>
>

