Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7AFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 20:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cz2zQNsOy+D5gmR/qIxM7oOPKoJc4rW069ot7BPlceo=; b=IKGlcdxoivFZk94Vsaplf4dW+Y
	f5RuASyHZzdEjlzbQvWsQ0gAFG068oWonzJ9I2Vkayid9C0FTePhSrabSo/04PdTifoTL5X5tzI++
	D42+Z/UPov9QYzl489KfXpHW+TImoxYS+uTAmDuZ7k0vd3raYPKnONhYKU/peH5fzXDf56V8J3a4T
	+v+InmSgH5aG8jgIgzQKD+/7VoifmnHJmib220C7ws5JzReYqW3lL9+ADfiHDkoF+B7/C08ywojt1
	jE6m8VeSPvHQ8O323dQBU0PuvF0G6NFtWqlNoHYpCBDrd9tacNlbYJxaW332GwgtbGNOCDEhBRQHO
	IwVq4krA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzhTG-00000003xyh-1Cju;
	Fri, 19 Sep 2025 20:12:42 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzhTD-00000003xx5-3NVm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 20:12:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j58aOzx1tk6kolgu/0rHlwkXscDkfDyYOq8Z12pIrYUdOXM5eoUB4cvYbF8CKuNOl1ltxg77V9KYTHbq9zaZ+U1gGSV09m4p7dTyFB5Buc3+NoE9QFvLSop5lx5pOlfYdZs9YB3h3j2TvZ06UnJgSln4RmCX3VZmOlu7QPB+6ypn6sQAZtw9C2sdxNbkjyUC/mpAFYhOCvjMQUk/MzVUywlzgnD7Ea3MB/0PXPtJNcTC9rrWMURybIC6vB8KfyUZqN9khprKupF9DqfCWi2XWk8B684WL7FF1KVoS4n2tx+/ZAKUGf19a4oY3u602j1696wtIMs5rTuxqkB8U7WTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cz2zQNsOy+D5gmR/qIxM7oOPKoJc4rW069ot7BPlceo=;
 b=krOpbuk2fybpFEvM8iaEBxGfF1vyNg13jxgLI77FmysQJOAudWavsIqakLr7woS1u5HLS/lmJCgU6HzhNTqzwT4+Uy1QRD1L7tNtc9sLjUK8fasBbpqLNyQNgB2wX41HqnrcUK1nrsFYU2pYG5wQ/bsxKmburU6nddPHvAbUG3jIRqdW7v6mgLe1ZXcGUUvpXK8B+I2nv7IX9vM6se/s7/1UmIUBMYryoscIfOtxasP3+Gb+orI2BekdJTaOJnAXjBWq0xZBL7KEfZn+16EMF7emKbab4YkHwgAOa4XNCEZzeynP/wQnJ/rPiBkmxexECORadYlT9SW7qbq/MVcAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz2zQNsOy+D5gmR/qIxM7oOPKoJc4rW069ot7BPlceo=;
 b=O9u/hotGsFB0of31QNZ4JHngCZFqbtgDQGjqKMlUwUm6A+HjSaA1GDsX6yMHyY1YqO2bMKLT0ScEvPO1Egixg95tg/4VMo+UQGfyTsVZzPf4WpPKdX2mH9lvLuo+h38I8m44BqBvei1iTRKNai45IvC06BrM7weCwr6LH/Ud+yU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 BL1PR01MB7793.prod.exchangelabs.com (2603:10b6:208:398::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.13; Fri, 19 Sep 2025 20:12:24 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%2]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 20:12:24 +0000
From: Carl Worth <carl@os.amperecomputing.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Jie Gan
 <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>, James
 Clark <james.clark@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Sabrina Dubroca <sd@queasysnail.net>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: Fix data argument to coresight_enable_helpers
In-Reply-To: <9d8f3a84-8c89-48a8-9996-4602bbabd446@arm.com>
References: <20250916224441.3008824-1-carl@os.amperecomputing.com>
 <a331eceb-ec49-4396-a61d-78a75789b090@oss.qualcomm.com>
 <87frcj8kw7.fsf@rasp.cworth.amperemail.amperecomputing.com>
 <e1a2ee99-07bc-40f3-8742-a0cb1c273350@oss.qualcomm.com>
 <9d8f3a84-8c89-48a8-9996-4602bbabd446@arm.com>
Date: Fri, 19 Sep 2025 15:12:20 -0500
Message-ID: <87cy7m8amz.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:303:8c::33) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|BL1PR01MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: edac6557-5609-498e-bb65-08ddf7b8d8c7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zdrVPLHFiT23rn48L6/971g1qzhZTooemQdLFx2nGKnXabPuc5AsEHgNbuMg?=
 =?us-ascii?Q?u5JZKBZpuM00wjVgOsbZP4Ei9VyhNZyaJfGe/1V6VRfYwlqBIm2tQ9sL4ik0?=
 =?us-ascii?Q?gbvwsDBdnA6MH4jvW2q9KPlts7iUgp7RdZAPq5Lxs2onQcMQNOFrIduQUEcJ?=
 =?us-ascii?Q?vr/MiX/6i2uupL+T8Pq9uQC/OKvPmL4FFiyZQL0Zsj+PHNdVgkNmnHDGu2m+?=
 =?us-ascii?Q?kvGNYJSKjLg0SmEW9E0dikKUl/2yR/hkhEyizf5ekg0WhFmjHw3kQfncvKY0?=
 =?us-ascii?Q?8FT5l+Z3t0MrSuFNkXJXjah5JwfENlKCClSSIgIoQqG81YFWsB030zGlbaFp?=
 =?us-ascii?Q?GChSRPHVDisG3lZUTU6V5JF7AKrDzB3ZnM/BFMzXjSWAzgeYGiiRI1i1LiPM?=
 =?us-ascii?Q?oSqtA/DJgj9xfby4rJsjSbzSfHg/Ndo2L25U/AnDHhbCBMKZaHHGbSxn05Jh?=
 =?us-ascii?Q?jJJz4xjTJpw3kc6OdIoR7iMcon8wZLKDHVuDOlI2HuyijajZK/FL6DjRWqi1?=
 =?us-ascii?Q?XT9FWKHtu+QBYf7ptN9NXXzZdaNggIGGZiGsB2l+3uojOOlqXoj+I0AAhG88?=
 =?us-ascii?Q?ssan1eapo1nffsqc7GczTDhNUpchYAeDlL71JQeK6x5WuhgH04e7zp4DP+zJ?=
 =?us-ascii?Q?awjvbAVU/9JlVhg55+UqoMUfMxuoI2bI+4Hzq0/LBIU2dAPDi2gOFPTSDpEo?=
 =?us-ascii?Q?lZa8zbmGx5oWHtkfXEUNHCQCJ6sF8nEduWgcOVKsEo88wWwCegYhAVViLVJ9?=
 =?us-ascii?Q?mF7KK3SIKqyZCdyrKGHcYhoA69cI8/C8ykxM7aRH7GwUXVBWEpCKD7G9Lsl4?=
 =?us-ascii?Q?i7+7wOfT/lkqvAIADo3wJvyqUuc953pLIbHvIWjzQZV1YC81dKVlJTvbI39s?=
 =?us-ascii?Q?rX3hEmwxun2H5mWFv25pC470nTC8oZQU5Rw82BOTbvs/s5IHN1SXTcW/k/fH?=
 =?us-ascii?Q?GIhGHKO2w6oRUN0SLqsPsba1Rf5m4DetJe4roVRYua6L2h0KZo5rbr17pilX?=
 =?us-ascii?Q?pEc2xcIu+xI9n8bKpGThJ8hZS2L96ydkP1gSBKhEw//3r2ZUUywORpdWwkVA?=
 =?us-ascii?Q?RnPOzKrsexpotw1ttOvYbTyWY652h+diLKGgYmw9D8WL75prF/GzL/UDhxBt?=
 =?us-ascii?Q?xM/JhGc0+VzOyQ6LBmx3xTFZ/tiWGm9FZ28u22AIcJkA7rl/GRF4icfjn3Hn?=
 =?us-ascii?Q?ocvYVefiNlJCyoqFQvk4Vz2YCdyW9WgvNcyOkkgNRqXJSRFojgOqANlBm833?=
 =?us-ascii?Q?TZszL71HUd6h4kI4U2Mgxhe9rhAyk9Uhxi5mlP/8Fnw34vzRe+cOyKJ8dHGy?=
 =?us-ascii?Q?VIiD9zDW5Onv69j1bODa2jdW5lfQgDBZOFovcsOWqIKRJh4AP4N0RoR6Ph13?=
 =?us-ascii?Q?MyAZ5PfW5q3eyyLpJ11iwHWL3aoiMBxEPPcLGTvp1H0RkacTlVPf8NNJKNFg?=
 =?us-ascii?Q?jw80wAAlYmp7AkCMKvqQWJH+QAatmPJG/5Jknu90bTqXuhsHs/vipg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vD05pHHuuJUw3r4K6Ig1mEQEmB4wxWs/ZxHPzYhdZpqXumndCoOt3VAVF3rM?=
 =?us-ascii?Q?884qraCx3Clz17nsTBtx3z95OWDGjPcIPw8/yih6oUd1hPsNKk1gTjgN42NX?=
 =?us-ascii?Q?mfa1xnPByVdZUKGkNVNci+z/gEBLcfLUlHq3rjeluTKBncKn8F2p7zq78Veo?=
 =?us-ascii?Q?ImfkHWPysKPJuxUBbXSPyFqz8eIQVnGC3zlawlostpDEa9+H/EFHaydWr30Y?=
 =?us-ascii?Q?ahJevCbLtHUyV7FJlEDJTsSEOmXNNzS96MGVrZPcBywym6ZBWVRD9uIOxPLR?=
 =?us-ascii?Q?BptRgTvEUabkTMGS5iB6IJ2kmp3tBrrktsLLXMj3wbmWwMXoK60Ye1fUcq9j?=
 =?us-ascii?Q?7dtRVtjid7yRLYng0oHf66ISDM8k0KKJQE/DhMoew6lN83FqGoTVUS0mAard?=
 =?us-ascii?Q?dsIPl6RjL0U+N3xu5SD7ZANdXfYlEYZLfHUIVBQOQP0E0xhKFXkIbPRMqom0?=
 =?us-ascii?Q?z2pg6JkP6+tMV0pJ2treyozBEXWDmCHvPlkOAZsFuE42+kruI9kzr1kzzCDm?=
 =?us-ascii?Q?ORWkjf4SIVKgxljMOLrb8mwhbTmhbjhMDuwp4cafBNDPkCnqnkUCFmr7A740?=
 =?us-ascii?Q?vjY1izGgWvfV3fQHt+GYhrzEffq75OqPbbVyka46Tg70CYO7ZAvAtbKZX2VK?=
 =?us-ascii?Q?WKr19huKPY/PGFLWFWmcEfH/Y2EValiWHjX/uIqFMDTNIukjzXg/C6Cn4abN?=
 =?us-ascii?Q?UHR4okzFCsi2DSM6Zfvz3Dtukii2rF6Uq6MW/+BRW8laNP/euIe2Pi0lljh8?=
 =?us-ascii?Q?m+PZ9DtOgemOlZFys5QbUrXqh/OTNV/Z1X5APF0FDJFs4Ca0gq2gQ7CJxgl1?=
 =?us-ascii?Q?G71k+KPaPSjFZcJjYBvsZQ/rOIzA9loFX8aY8zOpUvT4uuj+XT9Yo//Y/I+K?=
 =?us-ascii?Q?EL0UegXgsX7GQgGplOoknfFB/yz24AStgtLbdJvVOfUlbBJVWkyG2a2f4WeW?=
 =?us-ascii?Q?oQJHisj8A+9pYn/1STWXbinAjpkbo+oNx0yscAYJt37eqzENo/IeRUhDH7qO?=
 =?us-ascii?Q?/3FWv6I0AgMgqjBnhIBkvFxyB8cXWx1qAmbSidCO/LRIbCX+LER6cE+zJjQY?=
 =?us-ascii?Q?TJOVmujIogG8SvHs4Hd/RnUtc0bDjcuPdtteJPH7/K4vaG0w/xjar2vLVmaL?=
 =?us-ascii?Q?IxeXZ9hrrAIr2h2QYOY3EKx3tD94gkoZJPT6oG6C3oDevFPp9Q+sCeeYM3rY?=
 =?us-ascii?Q?V8HI11VptH2B0Fh3GquvSO/9dB60+Cinlib8uLWMJEYoJVgqn3Bb0WC7U4rg?=
 =?us-ascii?Q?ZA19zTbTH8JcPt+nd/WbKknUPviWAZV0UbgUpUHO+4ZpeGLDn+dc11p2brIM?=
 =?us-ascii?Q?WI9RoxgbDMbUiLfCaEMi420wAmQVTWHEQhReC8SF44sqc7WJ0ToWbM6DF/dF?=
 =?us-ascii?Q?hlxQV5bSfxUU//BkuC601zKMDTct8Cy8E7trgajIJkd5GNjQbI4STn25EqEM?=
 =?us-ascii?Q?aGqEXyRsYaCp4+Cz8RC7WSrUgVbx/qT/WcQzikKwKvDQaVh6Esk+39Q8tkgR?=
 =?us-ascii?Q?4hJh3DOzFtW7wAB3K0Y33zh9T+EuLmcihSgfX9teAIQJdp8fFyOkmJnM92Yj?=
 =?us-ascii?Q?ljN315veCcHmsGe3jGUuY3oETd90cOSf+9fi9xfJhptklp3f/yex9bjAYCdg?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edac6557-5609-498e-bb65-08ddf7b8d8c7
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 20:12:24.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hemF6mmcjwi61/XUqdYP7WbV9UPefN/9DAmI2lix46fxw9qcTPLi2HrcXWM6LGLeeLNJWRTAseJm9IHV3Or2NdVhGJjbiMr0U8/O9PtMLpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_131239_845529_97CD5CED 
X-CRM114-Status: GOOD (  16.57  )
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:
> Yes, please. I was going to suggest that. May be we could do that as
> a separate patch after fixing the problem here first (so that it
> can be back ported).

Hi, Suzuki,

I saw this suggestion after I had put together my v2 version of the
patch, where I split the path and handle into separate arguments and
also got rid of void* in a single patch. With that approach I think it
only makes sense to do them together.

But if we instead were to make everything work with a single path
argument, then I agree it would have made sense to change the type in a
separate patch.

> This was initially a perf_handle only used for the perf mode, and
> it didn't make sens to have a "perf" argument to "enable" which
> could be used for both sysfs and perf. Now that the path
> is a generic data structure, it makes sense to move everything
> to accept the path.

I'm fairly new to the entire coresight subsystem, so I might be getting
this wrong. It looks to me like the perf handle is really part of the
event so wouldn't logically make sense as part of the path? Am I
understanding that correctly?

-Carl

