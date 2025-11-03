Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D17CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 19:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aOYDvsI41xHFgsJwNZo0IDAXCX78+2HDdLLsXZRHzBU=; b=n6xllQkZPd4GujlxlSD3ozwITQ
	1qeKxMscO6e0QpgHe8Pz+C2cacSxy8soDk5LxeL41UWndFVovNZMqmb4c8YKgLAUeESKqcE7Pg4r+
	oIJK8vwsFVpewwv9ikRnFLn1QajWW9vCQBA6s5SeKI/thaoWytnwJ7aH907QfEYCSvs0xmQPafNQN
	1Wr6WTOus7MnZsteGPzviKyOmzuDfZRC3ByN+H5MhMu8ZhIafSHm3q8xDHJLgpJ9sefKTlkvZafN6
	L5M3bbstCLsqoZUs/LOpQP6M3x+3dXA0CiolZ94JYc/ZbtuyNtGqydTwICLePC/bh/sxciqQkouW9
	rrSsNmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG0UZ-0000000AYfM-202k;
	Mon, 03 Nov 2025 19:45:27 +0000
Received: from mail-westus3azon11020089.outbound.protection.outlook.com ([52.101.201.89] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG0UX-0000000AYew-1jXZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 19:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsm0W+p2oZxS6Tv947BMh1qOQCxtuvC6pn4G4i6isOUZI8HKVHTmLUjOT11a2XLHocZkpVd43R0AtByYMUgvkXDJF6QywrMAQeTG88Q2YQlGh6PgqDayye0IB5jJYXeI85c1jOk0/PJ1Nmzq9zmcPjJfqH8x/kUa9bTo5llYapM0HtD+ks/VufzrVAVM3ZhvaONHJ/t24yhPoS1kKVxjkfPdKiygdsqogTE1aDX87DHker2ePPvhjHjbo9JBroJH0/GsC+aQT2uTWpy20wKcoMUdQNTQG8UhxTAEex0nQUErZ7wrUINCwMUWESlEP99tqzK7URc1gOtniqvuVo8yMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOYDvsI41xHFgsJwNZo0IDAXCX78+2HDdLLsXZRHzBU=;
 b=UNvgvsXPPgokmzDmyocza9HhGNhL8VE9k4ikIKfLXtB1jb57fA/pjBZWpvgTDiCJvSeZgJFF7/8ELzLCnAjgLIiCIxLe4gY1CIhoA6tHAgW+TvlwuibHQyu6WRkPrm7y5Qmua0D2TvNzgloE5oSmBlfX64M7jZMd6T4dj7HcbU+VnxXEovxVMmAJs97Kpojxa1+cBiKWdQHyY3TNLdQwd9jN0H5vQn+YgCGON3fl0QII/ZeMc1PutiozEemM0KjuAqq/dtXGIt7UIJV8w+PkTs+e182yFt05I1moHKuRL2W5zuVbkvr86e/oB996rPcMKTEJyDJ1kdM3d258LeqWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOYDvsI41xHFgsJwNZo0IDAXCX78+2HDdLLsXZRHzBU=;
 b=Ft55MuUkTOgZL/kCPFQu2Ak3u02Safp7qanBy5WgZCIiSyhjW5ZMixC85rR2mPfkb75v12hQ0jSCy4CcBqheU2B1HiKIOPxAHpTjl1OwNgR3kJexWFDBu5tTwFZ1pxywhndWG9u5mVr4VO+AgKl11Ywmsw+pfT8jPPu5lb1fCcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CH5PR01MB9053.prod.exchangelabs.com (2603:10b6:610:20f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 3 Nov 2025 19:45:19 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 19:45:19 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: kprobes: check the return value of set_memory_rox()
Date: Mon,  3 Nov 2025 11:45:05 -0800
Message-ID: <20251103194505.4077265-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0036.namprd22.prod.outlook.com
 (2603:10b6:930:1d::8) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CH5PR01MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: db125793-f9d9-48ab-47eb-08de1b1184d7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Kb7AP9Pt8A6aqgpmTHqub0vz+i36Eo3szl0R5OHhUKtUk4OBxJvt6BD2iSD?=
 =?us-ascii?Q?0YzT1LUEUBD5Alp8Y2JYqxf3PNhnKf5ZDbky6et4J4vMd3A/E0ogyJlU0c02?=
 =?us-ascii?Q?9i+k4RSZWqCPOsaZ176QGzl/8x+M5gZnk3k5gsvGIYVrstM0p+KPqWE95rrP?=
 =?us-ascii?Q?WaWsNlobOv+EJr807jmj/tgXVQ6HVLenGM9q583cmaUrVcXOwTcCbCewByCU?=
 =?us-ascii?Q?kldo8Bz5SsfntnUwYKkml6JIBpIK9mO8ce9a6bw11QQyVpS4BxNeCYBAgtPE?=
 =?us-ascii?Q?hPiTj6Wev5T+i88NdYhq3U+y6ow8A0e1P9sg2MP4mnHCk4hQokQmFBKGPyE3?=
 =?us-ascii?Q?eguJKuu6nneE90NksOQwZi9XDPhTsfZAgtI4ntWHygfA3x31sL/lwqgf/dgO?=
 =?us-ascii?Q?lo7Xyp4cQhrjhZp9p4N1CBCeWFiDEuMKE9M4JbI6dfINn6AmRmkpq5HjfjQ2?=
 =?us-ascii?Q?IbBIrDjOgll/qachGv5jydJEQn57HkBIKY9TzjxlfVXBe/m0T+juEhqQCd5a?=
 =?us-ascii?Q?JZldU4rTPhJdXlZGzFLDpZbAZtUcBTvZEowAebsorg4n23CaqKfTktYu528c?=
 =?us-ascii?Q?ehYd1V29EEDK5hOYXnM6o5ud4J5btffESVX+Q6qwMaBpLGvN2xj0oDSWKLK1?=
 =?us-ascii?Q?WQpI8xf/XCpL+U47sDYD6PVSlQZyuzDzqJieyfFng4m7EnuyghWzqQsCgIqp?=
 =?us-ascii?Q?sUmuYEZqUX9x1xq1PNGZT1wXlY3tNh9pwXjdPpqkU/bNj6AK6nMkthYXVn8N?=
 =?us-ascii?Q?LVo62fkhENrGWhRVQzM72LGoSttPps2xC0LkkBd3/9oJsflT3Hj6gHeoa/mo?=
 =?us-ascii?Q?oBykpym6KO6ak4VnjvrntezEFU3C2WNOK3Vc5HnIogMgwipNEGfIaEciBytz?=
 =?us-ascii?Q?kThynWMqgmOcvhUG8ConepaeUl9bOyAtBB5fnK4CR047Tr+rLXWp6CuIhfhP?=
 =?us-ascii?Q?FkVVekYdj/LGsY+rkqbz7Ox/5ekTi3Xayb96TQKZ90A7QQwizxK1vkqLzS6q?=
 =?us-ascii?Q?+DBOOPGoPdI7kXIhmxKoP67G7Q5IQ9uQwea7vzBRrIGK0gdhtwhEMyd9B2O3?=
 =?us-ascii?Q?cbbeXKXaqL5s5SFmKZg+97GRiD49JxfDnXlny2NDlJox53I/hYr5ml2ihQ0Z?=
 =?us-ascii?Q?QnjBNQELWQRYTlaEyUZ3G0iDMcwIJxFvEpL0g7pfhj8a2Rok+sXKspjyi9QB?=
 =?us-ascii?Q?xgiJAO9Sp5hUbN1OU+GkQOxirim7mZi70QaCpkLRviCtvufBXTIEmsWlhOt6?=
 =?us-ascii?Q?GbXvSlMjTcgt0b6wx3FdUnl77bCL99Fdk2HedF/ziXP8lzvneyK2BJ6bhXn2?=
 =?us-ascii?Q?HRwV+k8ZkCTdLya/P3PQN7wdta7SvkKBvq1BntPbbEelFOFCIpjP5o7i1Tff?=
 =?us-ascii?Q?ZdeAL53ydm2eQdNXtnoDXH7z+1dy4XLbX3gkW06KxCu38uiRYTlvOlhB2OXR?=
 =?us-ascii?Q?sbKdAUF+xPZQKvUp6RDXcB7piQWCfVZaDRyh37NjAJHj98I6T6IWHVmTYLt6?=
 =?us-ascii?Q?8/pdzOaUf+oQbd/yXS4f1xM+zuqp/R8mftax?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iip7lBgPIQdCsLlMgTDCcwUMorLaPqLD0EEr/YGT7E/WHuVbk3g4cz94Ph/n?=
 =?us-ascii?Q?hIjHAUx6XS//IqZ+TlI9+VuOImEOoJnRtfdqrM70p0B1SckFxsvB9ZX8zQzl?=
 =?us-ascii?Q?V8sBhhoIl9EmHSOv1yRIue+YunpYJA2hppN5Phr6UiC3UocV9KprX/BFTaWE?=
 =?us-ascii?Q?kx9RiMwRKwad+0TLEI5THhvQbbMkieU13pKvda4F3VGR4SgbsH5uKpb/4d8e?=
 =?us-ascii?Q?Zu0ZBhNUoOIKgicevs+UPbw3W8R5CiTyFxt0Sn9gk0I3PMRqDlS515K2pdBn?=
 =?us-ascii?Q?PZPtu5tlHVrfn+Gfz2TNKCHDO+e9QT08JeAd8Yd7c/8qDoFfV4zNKckDqTX+?=
 =?us-ascii?Q?s9UOBMXYy/tfa6wIwG8Zg2WZgSPjsflW8QqLd7QVkW/ucD+qSng4ix2erL+l?=
 =?us-ascii?Q?qq5XRW4Bi/NL+mmYzkGF7gB+yS6f6lsKvabaNZIBf7NzE06xlk0YR26kJXou?=
 =?us-ascii?Q?NO88FE0uSNb3IoUrQ+dc7WM6cHavY4nN5TcZVZwZcYJPymAR0Ph/EpR/DARm?=
 =?us-ascii?Q?Adkf0itSUPHpfBiRXJQHyxu/iyp4hpHL3dfp2AT2ZUNjjMu2i943z/ehG/Bk?=
 =?us-ascii?Q?mtQoY6tkpPSsdbXEMFqfGcbZHGy7TSeraX6bjXQqoRL0iTP2SwgYlVkC3Xsr?=
 =?us-ascii?Q?YRh2eroOAyyAIocT1lHRMLe7aD5Xpu5Y71Xa52VN94kSfupwtkgp3nKnoM3F?=
 =?us-ascii?Q?gQx3HmJjmxd1KeSfGibWQFauH4HDc8jTq7mSx0h1TIe5HtcY8f9jkOP+YSes?=
 =?us-ascii?Q?xT3lb4Xomkz0VAcq6SG4OHlrOvV9IjdypIy1N82AvrAQdb3CtT6RED/K3+IL?=
 =?us-ascii?Q?oK+7AufmxRC/OLz/bDOFf2b5DHatFO9yi2PdYO5YnsU0+J0OSL9BQ1/cMWdm?=
 =?us-ascii?Q?r8qls1r9nkWHwKGT6hf/0fgUoslVRDnB7UC+ODcJfGR5eXCT3BsvQg12KO3b?=
 =?us-ascii?Q?8U4+eJMP9yXbHk67s6+YAcICg8YvjlA9nHP3FolXmEi6VOYsdelE6ZI/qk9a?=
 =?us-ascii?Q?dGKU695AAiRt0k9CJamk0uVJp7olGYnjnIwSiOKr2QbJzo2B1ArtZNBBcNmE?=
 =?us-ascii?Q?5T4V8cY7H9EkBgcqH5lliicfazRU55F17Ad4QjER/JMY4HNXWBQsi/pRypko?=
 =?us-ascii?Q?J6RZgY76XoSE/KTnd+iq10X/YPkhHI1JOttB63vxien6hMJL3154ems8vQLG?=
 =?us-ascii?Q?Gl/r3cmjKkUOhQOozbX+SU4VCgLv4Z1n5FUD0aYBNvV0H9wWl/rlA6WTVTZG?=
 =?us-ascii?Q?TAydvmpL5sK99RXyaFZ7IAADTTjUMrkNfQIe9ka7qeKRXSd+dKSst7uWsnGC?=
 =?us-ascii?Q?4DPDlLb/vPn+iEhsOBRAjAECA9FWF8jdY6JYgDvhoO+5iS/Thv/TqBDAORhQ?=
 =?us-ascii?Q?TnkfvX3CrQ5SOJtQCqFawhDLoY1yqNM/Y+w04OdyX/GewYxOrILephKgp8Oq?=
 =?us-ascii?Q?JAqO0KigXXgFCoLhiNgd4KiMHs+gM8Aof0EaicflO7PDgTNuaBfACXHn6/G3?=
 =?us-ascii?Q?tP8H4kDwSv15ZQhIpB4XAean3puDhoNjYZPka942jHgGKRlzCFf2moz6Q8If?=
 =?us-ascii?Q?hvec+9TwEG1v63SctObZ/Tm6OnNEFM9aADOIGUD3jjFmcH3216llu2I6Sp+g?=
 =?us-ascii?Q?NOBNS8JIsiQ5/Ypufent7QY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db125793-f9d9-48ab-47eb-08de1b1184d7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 19:45:19.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHgxyyA9WsXKABsVhGM9LXh0XKo8acFF/wOF/qjzopFsnhRQCj4ivKgMuCIcfDz0L0PgQq8gc9AZlboOdDbSntQrZMrnfOfYM3YrMx8651Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR01MB9053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_114525_467421_A58F6FF6 
X-CRM114-Status: GOOD (  13.79  )
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

Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
rodata=full"), __change_memory_common has more chance to fail due to
memory allocation fialure when splitting page table. So check the return
value of set_memory_rox(), then bail out if it fails otherwise we may have
RW memory mapping for kprobes insn page.

Fixes: 195a1b7d8388 ("arm64: kprobes: call set_memory_rox() for kprobe page")
Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
I actually epxected 195a1b7d8388 ("arm64: kprobes: call set_memory_rox()
for kprobe page") can be merged in 6.17-rcX, so I just restored it to
before commit 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in
alloc_insn_page"), however it turned out to be merged in 6.18-rc1 and it
is after commit a166563e7ec3 ("arm64: mm: support large block mapping when
rodata=full"). So I made the fix tag point to it.
And I don't think we need to backport this patch to pre-6.18.

 arch/arm64/kernel/probes/kprobes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 8ab6104a4883..43a0361a8bf0 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -49,7 +49,10 @@ void *alloc_insn_page(void)
 	addr = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
 	if (!addr)
 		return NULL;
-	set_memory_rox((unsigned long)addr, 1);
+	if (set_memory_rox((unsigned long)addr, 1)) {
+		execmem_free(addr);
+		return NULL;
+	}
 	return addr;
 }
 
-- 
2.47.0


