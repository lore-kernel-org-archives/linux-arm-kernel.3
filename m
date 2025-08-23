Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7125CCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eljj6QXyHnOmG7ZNqB47DzZSX9+b04yG7hwCKUljHy0=; b=Ek18lNLzRjbjbg6x0ER/Lmuqmw
	sWijG9BoHc/40Yw/Y1rEXp6TFMVjAmUJci9TbN/VnLGO2NAucNhUap7yBNTWXvs2nC3eq4r8BjqQZ
	12Svrrn6FQZRTwl1/LIWj+RFkgbfJV33o3wzLqYGMgoNEJFXqb11H2VUDg2usbEZVJxzj7S9iVZwS
	T9pi5f7txgtFI7mnmk/CVg8dLPzi4BhH5Ih//EwWaH8Xq9mGXdOIyhleKHXKAtW/0E6ErN7irzqNY
	AnwFJU2EHL/3Pp79cn6FA/DBy3uQrVQ/cYOSsJdqb0a201B3+Ls4gdBbDISsI9RhVYTd6b6bsIsFH
	G4HZjAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprgL-000000056U2-0vaD;
	Sat, 23 Aug 2025 17:05:33 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqge-00000004xm0-0gY5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:01:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqbVwxImau13FcWQ6QzVDzg5Mo5D2O0qRHsEpvvWbnVeMrlyRnUmLzGpy20ArK0A10ckzKVZSe//sMYKDGdjqmNEFjv/rRZrLsYZdOcEQSrqKdIqV1Dit/GybOyFvyBVqw2TCAzp52WGidsTWaRyEcUBJpCKfLFpgV7tMqNmBfRgdFUw4ankmWv+GSRmSvPCaB4U2XK9KFtErFpHfw2escMrpZOyjkpm8Ux71zl1xUPZB1EOoO8nDONBMuZkjU/v0zfXi7lJTGtkSYNGqRr1rfzvg4TuFLZDGlcm3RtTsIYsEh4yO+piKydc6UOk4mKDuZdc/Awf67gH08fb+9elZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eljj6QXyHnOmG7ZNqB47DzZSX9+b04yG7hwCKUljHy0=;
 b=bRNTQyU6RzKjhuqoYmbD3Mj/ZPlo4JTuP+Nmtd4Ht2hiYyGl3eW9X4B1wpFLzW3gFGLxqAbtgXRgUzKKKaIB3IQ9XY16BSB5jaxAmE7SzzFOb1+tjkgGbhPmzp1szVDisQS1gOqhO+/DAJ5p+VhOpwcyVhrsZLA5voNyEZSLOJ1Y1rOelIHiCIaUdsR6LchTZJAG3Q50j+WTTXQuiCTdtgIAYNLiL3+nVV+XGiziuBgB+P+bxi25mldNS87o1w3BriH0SJsnCVxrdK1f1+5g5SyP8RA8BoE+QZbPdqvc+/b2j7+/kQ1Fdi4BGZRKPh30aFwCpIZQOE+C/nWtjEkLRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eljj6QXyHnOmG7ZNqB47DzZSX9+b04yG7hwCKUljHy0=;
 b=CNIJOf25eqC019zNbwXfJdbZ/TRNk6CFtTFSAwQsCzN8tXgWcUj9cPcUvil6TOQLancA/cKWPIRd3XVyof4PFBRjABas/I2Rk/QFRSc3NFgdLRN8g9W16mJ6TzrsDcMpX3AmolmNaxcbuL3YPeaFk61fRIPgo8lWwy2hV3hOSfQyij7KeCmJk9nj47IQ2vnAIOcBJ6GJCE2dhVGNmhx/n1Xk7HiCeGgDG7bGjDSvf45u0Oa0tDEtQ59+1yr1L8iBuzMmDPyyftb/BB4wL8OriWH0tHpIPuuqvBwmtHB+aXUrqV82qPn98lI0xSOrbSrxqCSA/OVND1QXcNGDHEzgtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAXPR08MB6399.eurprd08.prod.outlook.com (2603:10a6:102:158::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 23 Aug
 2025 16:01:38 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Sat, 23 Aug 2025
 16:01:38 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v5 13/13] spi: airoha: buffer must be 0xff-ed before writing
Date: Sat, 23 Aug 2025 19:01:16 +0300
Message-ID: <20250823160116.3762730-14-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823160116.3762730-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823160116.3762730-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00007568.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e6) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAXPR08MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e218f20-3790-45dd-e3a8-08dde25e5767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d2/71Bt+AuhM8iC3R1rHxQhZVH4VdEeD/pAP8LzHExpNjiaCTEOVgy16GUvU?=
 =?us-ascii?Q?EMoxPVEzclwXfl1Rf9mcL07q7Uh5Ii1KElzA1Juv5vYeQt5TbBpegQzIi0pl?=
 =?us-ascii?Q?MdMSv/ql/STks4N0KaBvG4TR/6UgCbsHrOa+YmDvQOAFcwj6UudWTVr94+Pw?=
 =?us-ascii?Q?WrhAHZhEOg29CZxe8Z5mg63FzOe87Iimglxju4eQxOCdcqRNJjQiMShiqBnJ?=
 =?us-ascii?Q?our0rEQaDv1joEf3NTQQCiYXtDclvCD0h3yqZxIoHCbU3XC9j9GFnxAFQ70F?=
 =?us-ascii?Q?1q7POAl44Qjc2DjK54JL/cdqmmZe1Rje40dl3S2H7nLtVoeXDrjVPeeAeFIc?=
 =?us-ascii?Q?uBE2l4tscv+GXuQFtJlqz6RjFK1RiTAOZTyYXGklTaQtxwylcpnFJ3xvIWtr?=
 =?us-ascii?Q?eLV3gQtuFQbtMGWolKQ4H/ygbDJeoBeIbzdMKeBufaqCRTVeGMazQHy1tb1T?=
 =?us-ascii?Q?66eBRWt7R9m0JI9LZw8laHw5hACcUZtywOOOPIUEYcj8ecrb/biiE4E8F/NW?=
 =?us-ascii?Q?5MZsJTbar2N8yUp7NIMymuVypwdG3qN9ZE679IkTGxITg/nKX62ycioxjvso?=
 =?us-ascii?Q?ZZ4+0DEgVBC1ILwQZXEaYP3Wi3jKkQGKSqSaxVMxapHJugZaisOxReH+b7oh?=
 =?us-ascii?Q?NrffGIO9ipo0HDTxNyQOPifQsJUuLw/+18AWEAIBuJwNKj/Zc0RKJZy/kWmt?=
 =?us-ascii?Q?+pGDjd20/S00K1dRBG5Zwrv8No7LTvvZ082Hn8yENUOfZZfe/bn/b4fhj+3N?=
 =?us-ascii?Q?+aehQnixIXnIr33R6qLMVUhZ2WwMyiinilIjN3SMTXfoc5Wq3v6iHH7lolyM?=
 =?us-ascii?Q?WbDfshA4TS1AgHLUFbV4/Gz/7q9HutwiKZujS5Nfwwa/nOG8TXfKWRl8a1Uz?=
 =?us-ascii?Q?5oM6z8nCvmwdPt4mRC9lp8KEfX6OgsNSTGI8sN1q8cFLdzB4b56Jj3qBQpF2?=
 =?us-ascii?Q?Yv/KSJJn7utHYTJcr2s2jxGyRz4denV08g+PWGqVGA2k7LCcztWbALX3MNft?=
 =?us-ascii?Q?bMWNn32Em7xeWaUhMb/v6Oj+HJE1ZmxEzWciJqi8/sEFLulqr9sIKZsLp4w1?=
 =?us-ascii?Q?TBG1UdWvWewKt9W4kzbp2V2pLfK4a8Scuf2//kLCxNm59Iyn//tE7oWZb4A8?=
 =?us-ascii?Q?sKGf8ANYFxMX6u74jAQ3yU84hRp4FTG63bpuZ2eQsqNhbaLJUrDvn29VbetV?=
 =?us-ascii?Q?kczPaWbS+VAJ+J2/2ZdEPMmZZvcowkEYZ0e7LxS3LMYTUUQj4WNU9H5aQAEw?=
 =?us-ascii?Q?6NKdcDactczXhiZ7DdBEgHvXL6MdOZSHp4HCZiBUR+raJiUSqY7TcVj+GxOq?=
 =?us-ascii?Q?LTVemNJQsWrtI30lJnStYZHKCE3EtaH1s73YzkzPhNC9tTgxTvTcMSfaTXYB?=
 =?us-ascii?Q?5oXVebrQyNojIEzgjQDI3QaaaowrSStigWe04cVZZykjhQx+Nw8/QWvWWqnH?=
 =?us-ascii?Q?oi9pgk/pNNMuvaX2b3xbh2dTw+nTxjiTDX49V+0i5y9tG+IeMlChQw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h6Zx4uK+yaRVzeOEya8QDM1kZZlF5uSrqSJaxssj/OyVEm9axRqBvV+TfrAr?=
 =?us-ascii?Q?ocbLvvuAE/HdadNH2WfTxcgDAmAPt6hr3xRT8Xj7eMDOjyPlsdYiLUbzc53q?=
 =?us-ascii?Q?ea6sJNBVuJ7cwS2O+OhgoNspA/NPJ8kpZ+5HijkMoXSmUPGd+/527MFmHx2e?=
 =?us-ascii?Q?egHJLJHZ3ZguetM1OtcM/HJvMuaZX1KYck6zNy0PygQfGdecfLlRxVlJ+tez?=
 =?us-ascii?Q?7HN13URM7sCRifdWRAGxuhcqjNI/FwAvczv7F/YpKLbbpNW3KR4ttbV0px1q?=
 =?us-ascii?Q?c7AD0u2eMUqL5Eoo2110W/bo/KfhfxYaKMjX5af3piByrKkFTP3TTah4RNa+?=
 =?us-ascii?Q?Y8AUn7uNjN3sw4/IbNbeC0xQ8Rqz/KN4UzHQaYOqhG00chLY0sIZr6ndW7zD?=
 =?us-ascii?Q?fyifvI1adakzXm4cNDVmXCeVruvct7o+jgyDixnoPgA3omjWA3cBRddfaUmU?=
 =?us-ascii?Q?DBdz4mgIbUqS9AcE6Se7Eve4XK3jY56mwBVRYjn8kfjURHaoaKH8TwXdfPDv?=
 =?us-ascii?Q?wMdZ0yyNpFIaGuF8/DH76RbtIKxZY0LoVmjBHN+dRXYwT+bbaVDQ1o3pZcOl?=
 =?us-ascii?Q?JKg7NLLQyAXNUhFd7rVWCuqPcW9iwTJQuNbChA8ObAPwdhXpJOpMzo9QSxKJ?=
 =?us-ascii?Q?1Tr34/RyOqzUU8W5GyViEcoc3NhkGAbh8etDOkbQ+SIIRcb5eOt+ANs29Y98?=
 =?us-ascii?Q?MYuF/PMzkKybsWiih/GgzRBcJ/NHpRGh+1vhGTAmxxrYsj0kDifDsBRf77gR?=
 =?us-ascii?Q?62B5Wik86riYsb7VNJDsAom3xdNABxQCrqi2+ZWOxOjBRW49uvA6u9Bd4coK?=
 =?us-ascii?Q?MjVpuh9jytfduG5HHeepba/7z/ATsx2c+tmdRdmlwI9DiX6UUdSvvoeDRjB2?=
 =?us-ascii?Q?7aGAvW4henTPtLLmzNu+GQw0Mkby5Jkmg0ZBYROfTunQoKsztyfMvhKw8lpw?=
 =?us-ascii?Q?ANoFAMvjAGboDyqlawuonY6/cfbEJC835ZibrxnqnH4WaFjZ/o3BUBEJQqkJ?=
 =?us-ascii?Q?IxVYJW2Jm2V/3Ie32tEApJEIyOElxf3kWJXUP9r7RAL+SxTQ/dArOM0qxzYH?=
 =?us-ascii?Q?9GWAW9wmSM33kEdNwQbCgtPPIS01lKhsOJ3zYtb7HzmfosqEKguK1m0lDzUv?=
 =?us-ascii?Q?xUvTbqLTXuPR7r7IZxbpjZYqTIg9byG17ZbG6+Apr5cdYKtcThgAizfT1CeX?=
 =?us-ascii?Q?d45zJKD+Cd8pn5GYo/EE98DO4jBLy9lDcokCgR5xNCOM17H4405HQQxYL7nm?=
 =?us-ascii?Q?NXsqRKdDy855oknuUH3/MoWXjbUG28rnJuVOu7LSWVRPqeSwd7xmkHZPnYiq?=
 =?us-ascii?Q?Wiv/kw7dGJ4fy6w9alxNSR5W5S/M0KIvXeufZslyfJkyoepaSx+eVRWKNF8Z?=
 =?us-ascii?Q?KzYgj9+qjY6V57lzk+QY41oNFhWI+MaQwNGX+/S6vWcWvNLQb7DXBKV1hF+C?=
 =?us-ascii?Q?nkL4SIyiChTQKR2iPDL/+IQhm5TZ5iFv9LspQiK2tG+Fj24g1lGCEai9UdR2?=
 =?us-ascii?Q?hiih+ggBf98Jhz9SDE5P7f4TRQrBgaU6KR8SmqS/3RA/xgWMsYQmABI7Fvmi?=
 =?us-ascii?Q?KE84+kVeUdBmXOErtJ1lIB4N8ur2kDU1O8EsgqrXnn7taH7L+n/aWJr0/gsg?=
 =?us-ascii?Q?kU+30nhXuXlUdY+rTz8ih0w=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e218f20-3790-45dd-e3a8-08dde25e5767
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 16:01:37.9597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eGxom4F1idfz0jZcyPJsrcNGEFEPIogCBAFOjnXZYuV1xlrGMGGFtvBhiOk3NayErqmxaBgjiJZX1wPaJuoGW436VlqlZU4t6csCf1G7gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090148_205125_EF49E9FC 
X-CRM114-Status: UNSURE (   8.20  )
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


