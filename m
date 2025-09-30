Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D806BCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 02:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJXIl0t0fJk0U6Copt18OPzvBzJ9Zn6LXXRLWBN3UcE=; b=IHifj0v4UQOvB8gzYnXz9V0ShK
	xq/qo49FIMWgYxIOUeEcEV9KSq264N9a6bRarnar2+rhrd48Z71abgS5F/+GID0PLMA0h8Fl7O6G/
	YaJ1zp7RmeQb+YNfWz5nshcDxv6KFbWxyN88iyKIQBzjVo/Wkv06FCnMAe+xP8h93JH8mqCrEUFOt
	lxyGBsf4NoiLEOgjvt/tYntT+QV+XwwxhPbnFKxYVMxFRfkFvzUoaxW/2FTYnyJCynb+yv+rfKcce
	drw0j81bH5NJm/fV0t+Zm+4oFw/IEs8krCiY4ntt+UaRe5Cc3MK6BnZX3SccZXL7lCIzGe7hAdF34
	UN8Jw4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q5a-00000003t3r-1eyI;
	Tue, 30 Sep 2025 02:27:38 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q5I-00000003stv-3u9u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 02:27:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Db4/8TFFJtS7q3N1RplTzUJGvSqYo/46yJVY8MFiCJRhppwnHak4QhVNjIo7fmxzv02SGRaVPoLIP1+OL37h8gwk6uliLaQP3K5AL8jXjC+gqpcq/uSR9B1Bz2vQvRZx0JHnzjlOnXkzRrCXzELiLyrcrcFqXHE32tK2t+Gazh1V7Bvlc9BTr7ZDMRGV/iWffZPcDIBv/gWvWRHTLwDEntCZGYFUlYhWP5XGLQ6rlRnlz68Dpl9jiH/WWWtQsXV+RDdtntPIFeKWGZjxAUk+/CpdARxU02/dNr5FKWkqN8jvk0Rh6Dn3MkbBqjv5tpHL3ltnGxsE2xwpvpTPMe46tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJXIl0t0fJk0U6Copt18OPzvBzJ9Zn6LXXRLWBN3UcE=;
 b=oVuN8O8wvlCNxdGpPUqPFv/BvmQ3ySeLfdwRThcpOxrXwpXiTb5UM47u2Uhrr5otZr99yWR20ioDVwoqGCNgqHJlK0+OEDkMJX3MX8EdWtr4aLdkDmhdXCP5s3y5pAx1P/ocD90KoVFDxiQwzweCWjm87pvj1r+RBSyCgUgYz3SVQT/gIxPOgYhgtaVv3bKuK5qqIHKetWhhViF4q6kRwo/+ybBGTNMXcAZkBikFc3xb4ufby0haNLgj9p1bXSBI8GAFZ9XLye4h0FYBL7RaeH9wDcv5UpdX6VHlU/0hLMOmeP8PEEvPhItpXTLFOIwQ5rZGMMsGmPZjRiAp0WygUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJXIl0t0fJk0U6Copt18OPzvBzJ9Zn6LXXRLWBN3UcE=;
 b=I3Ewb9Kkk43luJUYjEYkhNOo7qDvskBXxzoMHypCvv6pct/sUAAYUel7G8IZll0Uv1U+s3NXLKFMGzYpYSU6HOfRQHdZeAJ+JRyVPmfWWxzJfJJeiRhvR4F3ciI8ZtyyCqyAQ2iKigvquhYqgABJS6uwshqhxgFib4jOwZBQ6qRbmpRQvhOeVIlrCkHYK24vNRcw6e9bikitb8Yh5snYHbpc06edGWGTCTrOdTeGbzcxvFq0jDHyMYaTEbNrsvc2PS9W/KajMKjt98DyIvCPIvSbxh/cbbUhVPy3hi7NnSds34jI3RKT777JOBJiPTBughrsLLIZJYoGK8DlY+sKig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV2PR08MB7929.eurprd08.prod.outlook.com (2603:10a6:150:ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 02:27:09 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 02:27:09 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH RESEND v5 03/13] spi: airoha: add support of dual/quad wires spi modes to exec_op() handler
Date: Tue, 30 Sep 2025 05:26:48 +0300
Message-ID: <20250930022658.1485767-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00006627.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3cd) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV2PR08MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 8adbe88e-0761-48db-3134-08ddffc8daf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZCV+aq6aUAurJ/2GKJMrrZwFiNutmFmMFJ6BN4nZBaEwOqbggYKS7hl7oOnA?=
 =?us-ascii?Q?DTNDwj1nSbJeR66+4ISKR9pp6PptioNo1C36kUCQGWTr0vi1d2VeASdkk07X?=
 =?us-ascii?Q?u6oqWs3y/al35Q0F/wfFyrkDlowaFtGHuD4LaZpfBersicI7WmARCuVukt9/?=
 =?us-ascii?Q?hmsBn/QULxt5qDxk4jIcyehh+ALwEdDHWzL22Irf9olkEBUFELKzq/gHcF6d?=
 =?us-ascii?Q?KjkINcaBe/quW85+6u3RyjniORdAUKE8F/5ootRYsBI92BDjH282ahBzE8KY?=
 =?us-ascii?Q?pz88kxVJ8RmFuKFw7TO4/nHIvUPRC5kdCkPxIX7Nhza9+d2zBxeNeQSZhdJQ?=
 =?us-ascii?Q?OlfpaFDse3D7D3YRn1k/Sw9UZVa+NNuJWzcWPtXwUszyf2GvRzQrs1kEdt2S?=
 =?us-ascii?Q?2KIQFpOV+bWqu/PrikN6dClxuCSMLfttF7eLFlWpfESRpUTYseHf2b/FsHSs?=
 =?us-ascii?Q?feMdagom5mlDWsJnSGQwZPzn9AWsy4m52PxCt/u1w6kLJCqHkXsLU1PwZlNJ?=
 =?us-ascii?Q?7QneCWldxABYCNUr8Ov+/ue6Be6vOxx58kZliQH3mB2CQgnhPwAs4wyKR0Vh?=
 =?us-ascii?Q?LSYosO6TvXnmWlqpDqnNE3UxPmITPNc5nEtdbf2yYb+W998t4AqeW0b5jVqK?=
 =?us-ascii?Q?3S9wS9eKOGM/3v++DcpSiOMxSJPzab+ICFdbM4NnYEmaY9EnfaFidRwe81S2?=
 =?us-ascii?Q?drZfysSQdQMrT0ZB30iD1uVLhmDqmS7FRfRluvYRhzY89nF9pTMqS6R2EkF1?=
 =?us-ascii?Q?SNcEVVuoBlQbiTKjNtMsygHDut9LNAGJ1EOw9KPONIHnZB7efWCb0Gqt6KSV?=
 =?us-ascii?Q?hK636fP2DeRefD+p0a97T8V/ELkR4sQzrn4TYjKYw9e+yNSeGW31KFiwi105?=
 =?us-ascii?Q?OI69EAfc1Qv/eTm/POwbX2VKUeZlTCifgy4O3fvBLWhikhqNEqsN9rPlHE8v?=
 =?us-ascii?Q?uAk1IlMT41M9zojLLkOrt9A+ItZKz2NWJfjpkyo1oodXH3eItcwWWMgz07zX?=
 =?us-ascii?Q?4Au2KFIzmG2hm1fr2zedcEIXvlHNNGKUXlUaRGNWHhAQ8FHU9tzcPB13a4P6?=
 =?us-ascii?Q?UVlhONfWaSL1/eNZD6MQ9aPLzNA6xSWqCOGTZ70Mr7ARSkFOlAdu+cjBCfMa?=
 =?us-ascii?Q?+m3W/qjnGu4h3p46pzWNJkCOTHg77wUEaN5F/tZZjSSwrWiasSG7ZTUx7n/5?=
 =?us-ascii?Q?06zhd0JVQyEG4sirQeZQKbEaeinqA1GgJE+JDtK4ApvKYNZK6mMiT+UIu/8G?=
 =?us-ascii?Q?YMbTZonXTng7d5maoaY75gN9L7GMKowtqs+tNdxbNuZcZJeoSk4j+U8gm9Ns?=
 =?us-ascii?Q?9KCxQxJQXk5GeiAKzuqRdZAAnXNlWntEual6ES8OZBqYGlJjI4MbxR09JY4J?=
 =?us-ascii?Q?WH2+/ywkRDafgLHyfIG2xZmLiNcn8jJlml6KkqcB563ODo7Ku51bUX47uOaG?=
 =?us-ascii?Q?ZYaCrAsLMchGbLMvpuXG6CEENhcTvWQTVumUnsdfSDSeW/8p1KDShHAcNkE5?=
 =?us-ascii?Q?lLdo7GEeQHPe1cn9vP76RtMphOCYu/lwYMni?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TFptb22/EgVS+82dP9tkFbQHnbngYnRJ4RDvBAYQNmUaeajalifEDGOgfOGL?=
 =?us-ascii?Q?T3/4mIx15ZqClnWmNUeU7w/GZiN8azEeCdsgidDhPxGtf9WN0FiglfrK0usw?=
 =?us-ascii?Q?KEcT7YX8JZaL6XYvGsrao9FJAIw13HFjtnYdfQrR3AYtJxmfsg4oQzkO0TbP?=
 =?us-ascii?Q?DsJwnP23j2y5Y7JDgsmdrb8xZlnC7WWMZlc/btezzc+mT3yGBbpiEPdXZeKv?=
 =?us-ascii?Q?smjI9CppLcD89mdWfNXOJgdYvKOnD6k8sJ304pp2TiZYjzCSHUncX5djPqRS?=
 =?us-ascii?Q?gU/eTURzjFFb7eOtDDKHFfaIyamNNdn+rGgAJw2NTVo0bg7Rzj1JjvSCvBjE?=
 =?us-ascii?Q?K4brd5A/bb55XYC95jQWiYCGFvf03gWhsmJBTgZnVzd06hbnYJ7UdpVmUFF6?=
 =?us-ascii?Q?meP+UpVvs5uHtwCg6h+2emxxq2443Oe0w977+srraBKO5clpbr+eqNBhN8bI?=
 =?us-ascii?Q?YI5Ntw9rT+fQeKlbTBlfD0n5AS85THuoAbny6mQhxLF08DSI/yT5QLM7V0ta?=
 =?us-ascii?Q?6/S97O1JOorwIBwT0DiFcA3gdMUWTEWBdnzf25F8lpjjLFBRmKlfrVl5ndLh?=
 =?us-ascii?Q?7YmMvfj9F2/DVSmczWe+BIHhvvft2397b7vXY9A/hZ2f4mIuhIDyevW8z5ro?=
 =?us-ascii?Q?nHIQCHQUb82Ziw3GSi5NcWnufXWqThz7y4ys3AbF0HMm+44a5izgxy3hcmW/?=
 =?us-ascii?Q?oK51SZA1/GYEEI5A/s/GDXj4oI22RbZr7NtUb23QSDY2D3ac78f5KhkOdhdO?=
 =?us-ascii?Q?pNu/fNybLgRlRFU32DSh9t8iEAnwS1cPfswvPn9FkKJcvpAfnmEttp22SrX3?=
 =?us-ascii?Q?7SuuQsHhKLt3Od3sSjhlJxXGXiPA35HkBkGgNJeY91BB6o86GtsAa4FpLdUe?=
 =?us-ascii?Q?w8HmMsuOCQDI8Ceg3S1EPaEEDaMQP7AWIn6KX2l/kSM4RL8OwDvmZHu5nViM?=
 =?us-ascii?Q?WFjLKZlvqr5BZsdhy9sIcIvd9f0LLvTqRzZuU47NBVFxSjWMyd9gm97pdz3+?=
 =?us-ascii?Q?GvGvMl6IWpgPtVT7fIDylexOOUDA7VlLT889ha2/w6yv/U8uOTKJ64JhOzoT?=
 =?us-ascii?Q?8J9RGHA/kVmr82zc6HV+h12xMGEmXmLLQH/mbb3TPGkDsIOumwnHcRO3FiVM?=
 =?us-ascii?Q?F9/QDwBVP82lMwxIQTa9P+IIK+JnhvCv2NdbB2lrSTVMiWN+AedRdhyJq3Vn?=
 =?us-ascii?Q?TjZquqOzJQcB4BVF2Sy3a+qHWqxLsiAJcRkF26IgkSETD9M/J80NbJUOfOJ+?=
 =?us-ascii?Q?d24SWUOfnmF5PHEDa/c3iDI6xyEb+MAyivFxrUXMqoZFbtX6R+HIvXP8Ta1I?=
 =?us-ascii?Q?03uaTKwzwZ2rgTPlJocyd9Ed1biL2EiI4yjJQ+Ln0GvdMRBi6ztkcosDKcp1?=
 =?us-ascii?Q?MbOCna4cSXcK/RXPH2CdQd9m7NyrRN+4qc6Ho6smOpSwx3m4KX2CupywkcSp?=
 =?us-ascii?Q?vg6RtMzW+5solgKvTkLvQfc0mqzJUusGrCtGM2LYWxxHg9srYE0+zAokX7vo?=
 =?us-ascii?Q?mJM6iZqS7cd9kdY0NmdOowPsMWlxS9Hbyu+iB4DckTujjtZsCMzv2dXj3B2R?=
 =?us-ascii?Q?UuAKaQ/pdA247MhojK8g6nFadk/a8KsMWfOmgFYygaGr7nnMqLvZxSTIyLIV?=
 =?us-ascii?Q?xRfG4m+dDP+glG1HnEEuyHs=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adbe88e-0761-48db-3134-08ddffc8daf8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 02:27:09.0299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: II9r/5yNGLHrHxbpzSiD6vERwhj4by+Ts8k+Fcn6F3K9r3gA1rvYKNQFStrbTtPHQe2As0dsLifyMCpNYwubM50ye585vhaPrBhK1BGJZDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_192720_972421_DD027CDF 
X-CRM114-Status: GOOD (  22.46  )
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

Booting without this patch and disabled dirmap support results in

[    2.980719] spi-nand spi0.0: Micron SPI NAND was found.
[    2.986040] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
[    2.994709] 2 fixed-partitions partitions found on MTD device spi0.0
[    3.001075] Creating 2 MTD partitions on "spi0.0":
[    3.005862] 0x000000000000-0x000000020000 : "bl2"
[    3.011272] 0x000000020000-0x000010000000 : "ubi"
...
[    6.195594] ubi0: attaching mtd1
[   13.338398] ubi0: scanning is finished
[   13.342188] ubi0 error: ubi_read_volume_table: the layout volume was not found
[   13.349784] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22
[   13.356897] UBI error: cannot attach mtd1

If dirmap is disabled or not supported in the spi driver, the dirmap requests
will be executed via exec_op() handler. Thus, if the hardware supports
dual/quad spi modes, then corresponding requests will be sent to exec_op()
handler. Current driver does not support such requests, so error is arrised.
As result the flash can't be read/write.

This patch adds support of dual and quad wires spi modes to exec_op() handler.

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 108 ++++++++++++++++++++++++++--------
 1 file changed, 82 insertions(+), 26 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index bcc464ec9c61..fffed26ff990 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -192,6 +192,14 @@
 #define SPI_NAND_OP_RESET			0xff
 #define SPI_NAND_OP_DIE_SELECT			0xc2
 
+/* SNAND FIFO commands */
+#define SNAND_FIFO_TX_BUSWIDTH_SINGLE		0x08
+#define SNAND_FIFO_TX_BUSWIDTH_DUAL		0x09
+#define SNAND_FIFO_TX_BUSWIDTH_QUAD		0x0a
+#define SNAND_FIFO_RX_BUSWIDTH_SINGLE		0x0c
+#define SNAND_FIFO_RX_BUSWIDTH_DUAL		0x0e
+#define SNAND_FIFO_RX_BUSWIDTH_QUAD		0x0f
+
 #define SPI_NAND_CACHE_SIZE			(SZ_4K + SZ_256)
 #define SPI_MAX_TRANSFER_SIZE			511
 
@@ -387,10 +395,26 @@ static int airoha_snand_set_mode(struct airoha_snand_ctrl *as_ctrl,
 	return regmap_write(as_ctrl->regmap_ctrl, REG_SPI_CTRL_DUMMY, 0);
 }
 
-static int airoha_snand_write_data(struct airoha_snand_ctrl *as_ctrl, u8 cmd,
-				   const u8 *data, int len)
+static int airoha_snand_write_data(struct airoha_snand_ctrl *as_ctrl,
+				   const u8 *data, int len, int buswidth)
 {
 	int i, data_len;
+	u8 cmd;
+
+	switch (buswidth) {
+	case 0:
+	case 1:
+		cmd = SNAND_FIFO_TX_BUSWIDTH_SINGLE;
+		break;
+	case 2:
+		cmd = SNAND_FIFO_TX_BUSWIDTH_DUAL;
+		break;
+	case 4:
+		cmd = SNAND_FIFO_TX_BUSWIDTH_QUAD;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	for (i = 0; i < len; i += data_len) {
 		int err;
@@ -409,16 +433,32 @@ static int airoha_snand_write_data(struct airoha_snand_ctrl *as_ctrl, u8 cmd,
 	return 0;
 }
 
-static int airoha_snand_read_data(struct airoha_snand_ctrl *as_ctrl, u8 *data,
-				  int len)
+static int airoha_snand_read_data(struct airoha_snand_ctrl *as_ctrl,
+				  u8 *data, int len, int buswidth)
 {
 	int i, data_len;
+	u8 cmd;
+
+	switch (buswidth) {
+	case 0:
+	case 1:
+		cmd = SNAND_FIFO_RX_BUSWIDTH_SINGLE;
+		break;
+	case 2:
+		cmd = SNAND_FIFO_RX_BUSWIDTH_DUAL;
+		break;
+	case 4:
+		cmd = SNAND_FIFO_RX_BUSWIDTH_QUAD;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	for (i = 0; i < len; i += data_len) {
 		int err;
 
 		data_len = min(len - i, SPI_MAX_TRANSFER_SIZE);
-		err = airoha_snand_set_fifo_op(as_ctrl, 0xc, data_len);
+		err = airoha_snand_set_fifo_op(as_ctrl, cmd, data_len);
 		if (err)
 			return err;
 
@@ -895,12 +935,28 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 static int airoha_snand_exec_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
-	u8 data[8], cmd, opcode = op->cmd.opcode;
 	struct airoha_snand_ctrl *as_ctrl;
+	int op_len, addr_len, dummy_len;
+	u8 buf[20], *data;
 	int i, err;
 
 	as_ctrl = spi_controller_get_devdata(mem->spi->controller);
 
+	op_len = op->cmd.nbytes;
+	addr_len = op->addr.nbytes;
+	dummy_len = op->dummy.nbytes;
+
+	if (op_len + dummy_len + addr_len > sizeof(buf))
+		return -EIO;
+
+	data = buf;
+	for (i = 0; i < op_len; i++)
+		*data++ = op->cmd.opcode >> (8 * (op_len - i - 1));
+	for (i = 0; i < addr_len; i++)
+		*data++ = op->addr.val >> (8 * (addr_len - i - 1));
+	for (i = 0; i < dummy_len; i++)
+		*data++ = 0xff;
+
 	/* switch to manual mode */
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	if (err < 0)
@@ -911,40 +967,40 @@ static int airoha_snand_exec_op(struct spi_mem *mem,
 		return err;
 
 	/* opcode */
-	err = airoha_snand_write_data(as_ctrl, 0x8, &opcode, sizeof(opcode));
+	data = buf;
+	err = airoha_snand_write_data(as_ctrl, data, op_len,
+				      op->cmd.buswidth);
 	if (err)
 		return err;
 
 	/* addr part */
-	cmd = opcode == SPI_NAND_OP_GET_FEATURE ? 0x11 : 0x8;
-	put_unaligned_be64(op->addr.val, data);
-
-	for (i = ARRAY_SIZE(data) - op->addr.nbytes;
-	     i < ARRAY_SIZE(data); i++) {
-		err = airoha_snand_write_data(as_ctrl, cmd, &data[i],
-					      sizeof(data[0]));
+	data += op_len;
+	if (addr_len) {
+		err = airoha_snand_write_data(as_ctrl, data, addr_len,
+					      op->addr.buswidth);
 		if (err)
 			return err;
 	}
 
 	/* dummy */
-	data[0] = 0xff;
-	for (i = 0; i < op->dummy.nbytes; i++) {
-		err = airoha_snand_write_data(as_ctrl, 0x8, &data[0],
-					      sizeof(data[0]));
+	data += addr_len;
+	if (dummy_len) {
+		err = airoha_snand_write_data(as_ctrl, data, dummy_len,
+					      op->dummy.buswidth);
 		if (err)
 			return err;
 	}
 
 	/* data */
-	if (op->data.dir == SPI_MEM_DATA_IN) {
-		err = airoha_snand_read_data(as_ctrl, op->data.buf.in,
-					     op->data.nbytes);
-		if (err)
-			return err;
-	} else {
-		err = airoha_snand_write_data(as_ctrl, 0x8, op->data.buf.out,
-					      op->data.nbytes);
+	if (op->data.nbytes) {
+		if (op->data.dir == SPI_MEM_DATA_IN)
+			err = airoha_snand_read_data(as_ctrl, op->data.buf.in,
+						     op->data.nbytes,
+						     op->data.buswidth);
+		else
+			err = airoha_snand_write_data(as_ctrl, op->data.buf.out,
+						      op->data.nbytes,
+						      op->data.buswidth);
 		if (err)
 			return err;
 	}
-- 
2.51.0


