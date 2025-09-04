Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E651CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eljj6QXyHnOmG7ZNqB47DzZSX9+b04yG7hwCKUljHy0=; b=PUf7Y+Blzj9g53E86qXaDwIBcw
	OtGAVll8LPxQsF2JvKnMVIKtzZ7Cv9Z6mkXcaM6zmrnczEMifJ0Ac8QeumL5Jo07/SE6SF5q2GkrS
	wBSoo8u954dnoBKTJEzLuhMO0ksdYE1mmDPep415O92XqegVE3fhc/Js0VB+3uSFegax/OVBW1h91
	Zs7QpCX0joufQEndaiypWmwzrq2W88YvvVFN9IYCHLJVLfd6eIgDvQaauktuxaAP11sH4l+jkmEIy
	ZIR2AClC/qpFk+cvU6LW3FEnyiRwENuhlsXsP4m6EMpQaElK4/Z19f2JB/VXSr2rXrU02iq37yL1W
	6FvHnNBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzO-0000000E17T-34ip;
	Thu, 04 Sep 2025 19:51:22 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAsm-0000000CBi1-0SLv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:24:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijT05eO/iVVjKqi4KZ80hCU21GCtOyIFOHrMXHzdj6O5m1Jzb0L2NOjNgFs7K4qSR0hqMWFKBpKbPIFPjreY0ax3e6cgkO0Cq8OKUWZ84QOGLx+ueaXy6ed1/QjFjvGjI23H743nOQkMclEXHDbf70y9Fe7m5fszYF5RIKID4Wxkt4eqzICnBk9jR0TsNj9pv2BtzYMx8s0fL/MMR3krm6G3mKrMxrzmDHrhygmSbhMTBCfdFx2IkTyvcc7qMR0X6jqb8KMLDXomNeG6ymtxFYmWdUhO6ZfFgAO72vrz2s5efMYLO69O5f4bdEZTbPib4s5d6YG1iQ+e1WK2eYePZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eljj6QXyHnOmG7ZNqB47DzZSX9+b04yG7hwCKUljHy0=;
 b=C9984I238rSuHqIYyOY+Kdq1o6zQj0dDl61pJe6pF5GdE4xscBOuymqoq/2Qr4m250roiTdxY/5qUdEwQcoMgbhl1yyjGzioG4ZGYQxPfezoFmcFWJG5eaQ9Og7hMPBvxj6GNcjJihGu0n9QpggNh2fabhk+CbT/XpBBaHgGnTJmedg7ArXKSV3wIIpZ5WbxdsfdpIXuoEU/6Kyzdgg+3IKtUY/bJn1R5emuLSk50bA5n0w0DAVhv0AzVCgclwZwZuywcvcvKSnMx1hTGGgzg5qluXAbRCjGcQuCp5qEtXVzR+PXYeeiLKtLrJUuB56oLIjlp3LTJoVCl9wWiIQDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eljj6QXyHnOmG7ZNqB47DzZSX9+b04yG7hwCKUljHy0=;
 b=JvwvV5ydpG0lKUIWcSCOqST0JgjK6vy+Ai40jAzy7qQ9OE8n5uvQ3y4TNT5f9JnRxVi97HxXvVHFQAoyE9XFicmDtl9BFac0M6q02pSNyP2kVbT9Q7WE5UOcQxZjdWJkuGUZxSXUNR687+Gc3oT84rUFk3t8QpmhIsAJv+VIyAi7NpHLQ1pqLYAJONNK1mSXK5O4B91oAyyNvJzKH65PdoHeB2Y7E9CLgpxFIPycBU+5DNUnb2GXSZM9lSlJzAzPr4g90KdkEO5YC0dfb6qxX/cL9sTleq43GsSJ5g20OlYwOqMOlSRWsf7VMEYgOxkZ1FTWJDXj4Q0+SR4XpwNhig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM8PR08MB6436.eurprd08.prod.outlook.com (2603:10a6:20b:365::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 4 Sep
 2025 14:24:04 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 14:24:04 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v5 13/13] spi: airoha: buffer must be 0xff-ed before writing
Date: Thu,  4 Sep 2025 17:23:39 +0300
Message-ID: <20250904142339.656346-14-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904142339.656346-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250904142339.656346-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::15) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM8PR08MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 420d1742-4ccb-4793-615c-08ddebbeb31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HOIosRuQuKhK9hMSbtg8MCgKVtH7R6DcGDB0DUsz7onzjVa8PDyH3lEptNvm?=
 =?us-ascii?Q?9IbcsQYYKfEB2BqTKxlxGVk5JvVn5un8c/7M21cj3V6eoGhmx9lsrQN+acGv?=
 =?us-ascii?Q?lpaZDh2lcLHPBy9gpySLdHkK+0WLYFT1QiRzrIXgs6Fo0xMEZ0oz1zTwIOxQ?=
 =?us-ascii?Q?k0cT5oS/eoy7Ol2oFgjMQy8i9k/AQfzRoKlIuJgU/b+6NSSx6tXMmteudmkP?=
 =?us-ascii?Q?KIoIBuKxrlIJ45DRW4iyEs9yLzOOkPPXoVLQb2UfD9zzgzczuZItKIZJv9kX?=
 =?us-ascii?Q?G917cU2g4Ze4GanOVEp/ifbuP+oxg6B+iO6rwRZPuwgjSgPihSKarbTtyKsV?=
 =?us-ascii?Q?nsnzTw704X32o5guILJ6sAsVyDHP8nBQHC1aZJ935T1xkQsBmSFewIbh+nEq?=
 =?us-ascii?Q?6VV3Z4V4l0UFoJLkYSo1+fLnU/GIzC0PIvuZh/wAccS0Sh3CwcLRbxF1lT1U?=
 =?us-ascii?Q?NMPj1U6qRDCGk7OW5DYIT7GPNP+6xWtTAlkBy9vS73gRZEXAuZFdNT879BQx?=
 =?us-ascii?Q?OL+MBB1Eggn8e4aQlun7L9o6zfK6Sq62PAK6LOX+D0Wx6sAgV9TBdAoMTDLq?=
 =?us-ascii?Q?Mz/mRYKUdKFtQkq8r4NcAq5lZQs6A3SYXGfR2v4KZhOp0atATXzzYPzMMiJl?=
 =?us-ascii?Q?cZwVu11W0tTjNSn9F3WV7g9V0ITBcz11NUm/2nX1gz2tdmg1UJvP0ZuVogWs?=
 =?us-ascii?Q?s8HiUTbm/TN2iT+O5/MHSIfKJSaBr3XabiFiiBbAWIShzRUyjfILrUgLlQQ+?=
 =?us-ascii?Q?Pf7jyLmuO/YlEfRuoQEJ8YLTsu/RrK9tDSBomlR3dBW2j1J+clN9vr5eC5x+?=
 =?us-ascii?Q?WB3+h8wbftCAfvzxzYovQhXBG/hfZByj5aN6TcXIVbYeito9TTljfxbWVBwt?=
 =?us-ascii?Q?S6Stv2RjiPFHrqukBaKBmwA5DsMlrMs/0Ze92Vb7PIZVy7SKkfpKr0ePoNsI?=
 =?us-ascii?Q?ZZyr6eN+PPs2XhNe0gb8WSnmNlGcEnX9bD4ZnRc+lqBm0R1/WhZITLRV/6p6?=
 =?us-ascii?Q?WBriPXLPgujCmGdZjwLe2K7HmVYyk8YQmafwUxo/bNNfvnnJHoOfdkuv74sE?=
 =?us-ascii?Q?W1G6O4OpuV9vXtvK6bxN+vw7+kMpFT8nt6X58jA8ciJ8w5S+ZgrVip2lAq5z?=
 =?us-ascii?Q?XLiEDYNiCbCiLtDe3qXemjSW25GoG1nw0Qd7mXrSm/T8z9hRdDU9ny5VI0lS?=
 =?us-ascii?Q?i38oAd/EFve41l+hyJAwKZCB53COur0XDpMC8hk7D88SU/tLjP1oKVx/MZob?=
 =?us-ascii?Q?BpvSLbHDGhNQ6/eAYNJNpfJjSuS+bE3kfdZkYh86c+2XrFaBI493DwHTGKK7?=
 =?us-ascii?Q?c86HPsIPCpRBN0WubYll/T8NiLvbZI7cbyZTI+Awir5Oj63gf1jmz9IUa9ES?=
 =?us-ascii?Q?30ZjTfZ5CkXHMpGU96lZjLBuRantvQweHF7Pr09+ee5vdPL0fOW/UwTwEYBs?=
 =?us-ascii?Q?GheLW4x2QJ6MTVODsA9zkYqeCX7AgXfv21tuN8wV0i8G84fsaK/6hA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cT9RTEA33rrBl8U0fIzwCn0KNSd8XmUr7t331XowBMs2WPos92o6CJAb6vBi?=
 =?us-ascii?Q?KjEQRv8uUYUkxo0IfND6zvYOEfX96CQBJXxvBe/v+/PgvveSwicbCR9lH+kx?=
 =?us-ascii?Q?P+n3ApBv2U/RkOrDUzqIzvSlBozfL4K6V6eUsRldGf6tjlDzFwUi8KfH0jAi?=
 =?us-ascii?Q?0lgbvIDpGMNgkaR98YcJh6UMpbJ5e14RBg/iDNfyJQYgI3YzbnyEDP6S1BVA?=
 =?us-ascii?Q?Fp3s6DJXk2K3T0t7Q81Sm4iVbODRXHrdkXrt6HwWZ8SgrDzcQI50eUp93q7h?=
 =?us-ascii?Q?vZ5gM8HLjx5tGGlBdHFjhWZikAGJ+nk2UQu/MJkunMzTvWo/NK6UHxpcvLKG?=
 =?us-ascii?Q?t/tJ9gYErYpm/LqUt2aKSw5b+SOL5TG1BbgaQra0XFye2eshIHOTVOSZ6akk?=
 =?us-ascii?Q?+PMn6L0bz/tK820T2FBgwlcUw+PxjebxbYPUosho7DIRrXe0DstuCxACQX9u?=
 =?us-ascii?Q?GPloQ4tiGOG9phqVMIxh+GGDU8+0dL1e8ecWoJNM9fzg5FuRTO2Sai1hDYiQ?=
 =?us-ascii?Q?C6wrQ/0nN66aNu8OxF2JKAIsyL9XaeIq6AeXGies6LMEnizVlWUDvF9MgZi6?=
 =?us-ascii?Q?0jap2BzR5Dl1n/iSNjDAd3vapzA/EQPR3UJdHa/SfuioKvbwGe/74Xc+Twdz?=
 =?us-ascii?Q?OBj0LathXwpO3KHWFbvTYNOW1BwSh/lF7jjYwTsX5o5qYu7+XIgDw0si8R3X?=
 =?us-ascii?Q?pUwrGg+DieQgGWMsJ6jdxNEnsfiwGlW1GpPoJ/ePoCOkL2QfF0jD2M+y3LLj?=
 =?us-ascii?Q?XZToTQJeCuiyDyzcRQSqsE0YHHTF0A8wDHyb/vveQO6m5ARN3PnruVFSbKqa?=
 =?us-ascii?Q?qmikibhFU/1jmt7LoQznmRkmMjeKQogk1Jgt3eyeG6qiaiSH0hqv1/+P/ghC?=
 =?us-ascii?Q?lV2v9mvduAOWf3mZvvgAljZyTzfXwe4NPDHheXIQKImK15ocGnmLXHnWJu25?=
 =?us-ascii?Q?vtoxue7l0BQAfDT+6Rfax7rmNWnFGyMX6kivm0UjKWbGz7umsnxpvHkki42/?=
 =?us-ascii?Q?k22WN73MjJTwiazkNJMYeZQW7KISxwBdjwfWGMRx84r5Fo8XHZ21JgkeoX3k?=
 =?us-ascii?Q?T96Qvm+79EZ+ptBoW/VZPtpuHow//hvYYwXENMl5MJcoOorKsohDeUoKWpRX?=
 =?us-ascii?Q?WAdMPVpTcZOjulGcnms7DQxWjzJBuwAvBNqgJNgcY7ryucTCdI2BT1MnX2GE?=
 =?us-ascii?Q?JkrAoziUK+CdIKhQhauE9oMxFaQE0PDoz014Eyx3guKa3JykobNxD4yqSPZi?=
 =?us-ascii?Q?m1p6cnCku4cENqt2tXjrQmDUle1I0d5hCkSfp86ZzvGts02xlcbaj+ToiCFJ?=
 =?us-ascii?Q?/wQBirhI3EI6I3+Sr1bsiRNevbuvbhz81eE+9lSQ2WmmN7N1Pl+yVB0bI1Iu?=
 =?us-ascii?Q?I5OIAIsJzsV5/OAouW6ldWDsttiy2kyt1bNduRbtT1xEreXlDSMCtCcxNgfa?=
 =?us-ascii?Q?Eicy3cxAVxEWDX5dE+e1C2qYYdI1VDicb//HbI8yHhpqQ50qZMqAjUc8rsb5?=
 =?us-ascii?Q?UT7SYg8H7Cx+bEBrnuSkpyrG0WfEzTW6YpZIOG147Clehf5CliL0kNEaX0C2?=
 =?us-ascii?Q?OyRJ1YdjxKkG21veSlb2jpCxjOX+pcw5BMvnjGZQyZIoPDyCdxeYjBl/H/l3?=
 =?us-ascii?Q?3areat+Wc8gKWzehH8Bfhmg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 420d1742-4ccb-4793-615c-08ddebbeb31d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:24:04.1119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zhd2PXZoPYzssZrRFbEWUfUn7Z3dteDed9pLiwc21qUtQ3cFJ6G+z+K9DMzrNURgZ595O6bLIXJK+LIp6hA/StAyXwTGwVEppLN1gZcVMhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6436
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_072412_145392_05F932CA 
X-CRM114-Status: UNSURE (   9.22  )
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

During writing, the entire flash page (including OOB) will be updated
with the values from the temporary buffer, so we need to fill the
untouched areas of the buffer with 0xff value to prevent accidental
data overwriting.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 437ab6745b1a..57b1950e853f 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -776,6 +776,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 		return -EOPNOTSUPP;
 	}
 
+	memset(txrx_buf, 0xff, bytes);
 	memcpy(txrx_buf + offs, buf, len);
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
-- 
2.50.1


