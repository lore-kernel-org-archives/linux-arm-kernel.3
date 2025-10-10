Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DA1CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 19:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2snrpNrzRAzTOeqpJ8KPLiTOapJVIgdfhM9IUrv732o=; b=y/yJiHMKOs4QQfuSSZ0v7NTPAM
	rbCQ50elihBxO2fDYaZ8fR/POsLjrrgXLvCt2xe6LeiQLSaxD3uwTaamd/2QsZovdnzbIrBLz5W88
	AS1iBirEMW+5RB59nmiebUhLyxivm5ykV5KWUGiuvZUgXp/F8Rg+p67MVOCpCVdr+poCepPmdcmui
	IE5q0+6rRyg1+WyPTcPbvSH5VBdb0hdP9kuOcgs3Qkfofkkxb6xhZaHMQvHmHafhjWbFzLaNwBRBH
	UIuxBgR8covovbaY7dbzu71CQobyRXn41hROYrKags7XlUkK5HRtt8QcJSEXCpiW011SWZOolZQF4
	EfgCI/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ifp-00000009DLN-0TTh;
	Fri, 10 Oct 2025 19:21:05 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ifl-00000009DFF-1IKx;
	Fri, 10 Oct 2025 19:21:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0tbJEHfvqYwo3ZokOqKJseTS0+oQayb+ML0rzOMw+nXqcl2qY6BszlzwpHBPG4HsuN++qa9BtvgGhdQM0txnDFTekDmgCh+e8dcGv7kLP7oXiQo3r1V8ql5FLnJLLp5fCm7KV70UxBoMpNQISdmFMC1MXBKMwDgaSVIzlgqq9og22NKNAm0Yi4Z+Qcuqoym409V41XQCN6xBNYDTWGgwtEu/z+nxr+rklQGqbBV5mNmLOeJmEhI6kMeneuq+dqinjkSoYxvevO4qLx77hmRaGN+JybEINE40l6qJvid1fSDswlZl2R+9jRGs5NBbyPjzI1buedFeFu0dbya1BKQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2snrpNrzRAzTOeqpJ8KPLiTOapJVIgdfhM9IUrv732o=;
 b=ASJKMEBHrffPmmAg5pkc+qtH8xSdqer5DLdSrsV7wszTMgOnpZTghEaACsjQYvAF5XexsOln8mooFXJC+LUAqRVtZDvRvaHz7vkpWZX07vEw7bZ61clyQ5EBlumRaxObzRegnc6271jnUspvkV5C1EEiIDW+uJ2Rh4KhOFl+xRMdQYBvXXsL/MpvygJqVymqVsjjTFvsaIq0sx9KbPmQb0RjNnDfBirnB+SWuCpunPINM05+NImBwKa8ADD26uazSbLkg67dlUo46RXxuso1LhS789Tqym1zyaeWQ7cy+lsvUA83L3CcHNTGR7oRaiJ7kefVGTXR5xDBcUWKHOXEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2snrpNrzRAzTOeqpJ8KPLiTOapJVIgdfhM9IUrv732o=;
 b=l6YY75I00/wsKeVfrfKT4BMz3D/0Ql5wAP0MnjgbzGdoRx8Qc41JFhkqwuxN74s117nw1mk160diOtawuOm35mB8qM2M4XJeVhQ3/vUlaqw/b5U9u3UYHPiBpRRUdX48M8ncYijEPasj2KzED3rqwx+aByzvYQsLj6mSUZanxublKOHVKq1XwGgDKtjUQW84KTb8JGT/UjuY8OwnDIeosAw+1bndkyP/PljIM0FPNE5OyopBZTVw1qmJAYxwfWHuYM2BZx4FvNQh7qJXX4iNSPXuFE94LqAgTN8agOzb9anw+onJXl51iSG9JJhD3WvMMbwf1WFGQwQiSI0cp9NzXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBAPR08MB5784.eurprd08.prod.outlook.com (2603:10a6:10:1a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 19:20:53 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 19:20:53 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v8 05/15] spi: airoha: switch back to non-dma mode in the case of error
Date: Fri, 10 Oct 2025 22:20:28 +0300
Message-ID: <20251010192038.1592889-6-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010192038.1592889-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251010185940.GA715991-robh@kernel.org>
 <20251010192038.1592889-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::32) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DBAPR08MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 5edaa4d6-427b-4159-fe22-08de0832214e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W2iSJpv3Jf7cDkMrwKbDMB5luVAxNaF2p0/KzImfCbjnIWxi6vS6J7/OMOIr?=
 =?us-ascii?Q?UfSPzPRiGIqvJGA5l5j2yckrPj/UNT1M4cc1UMUAetMB1KokX5CnUTytOU//?=
 =?us-ascii?Q?YVuDo8ueg8HEXwkJBvB5QEbDP44bSnBiv7SzQSEnq5EktzuZqjHhT90hAvwv?=
 =?us-ascii?Q?ZtlFEbcTuOKU9x2yiLJ6zhky1bT4fnQPKyNtkmDofKaqy/aoaeRsHfA47AeF?=
 =?us-ascii?Q?U/I3E5vM3195feQokWWwY6Runo5R9oV+/ta9+vhYTIoZBxYM64RhkN866FnY?=
 =?us-ascii?Q?5lo2gu3pEHrc64DF0D6ZeasvNmWxNtf3q9Bo3E95FndSlZ1wKoDnghwJGcik?=
 =?us-ascii?Q?tVRjIXOCZaTmY24vBFnxfECafvax0hi9UNyQJzZ2FmPfRx+4Lo0sBAx/F+Cu?=
 =?us-ascii?Q?WhN/qWhdzL5Xp8EUp87UqN8dYdMpnaK0ZhIMj68AyoEoPJg1/C2Ocg5giQi6?=
 =?us-ascii?Q?3VKtWn3bLNxSgHMbvo5EHiROEOh4/2xcKN5XOImZUHK/NSAqL/uJ5B/F2eaf?=
 =?us-ascii?Q?cLsAO4aOuLZpBRO3CBkOkyUjWkic9eePIIf/NEWtEBjPmbJFglNooMlIPPlT?=
 =?us-ascii?Q?E/72LnAbkXa+Qxc2UA4jeqsNWwyij2jrTgSmbM0Jq128QGknyzCiuOSgeRQc?=
 =?us-ascii?Q?r0P7kAl+Qd4iGSvTc4Z4fFEa9nFE1OWhHl7LX7uBx8AsfJKHBxvRej8KJJNv?=
 =?us-ascii?Q?yFRdsWR53hZq2YI4BzxW5VCBZQCS2sf8LoyYgErtt6mFw/2r9wpsW/ZCjgx3?=
 =?us-ascii?Q?o0MDRNen3RLq7EdSzQ6jIapXKX3HeRlVXB1f7PQoPrc7sUGrAv+yGAkMHBKf?=
 =?us-ascii?Q?XBPKep57QsiKThCDcfL8q7CwKrdhueJ1RQQaSSOl4QnO31bvKJXXcG2FrOPz?=
 =?us-ascii?Q?iMxfgMni6kkX9t9r8mQhUdx3meLn4NQBlMYuefFCJO/AR+pi1e1uV84Af37G?=
 =?us-ascii?Q?xry1/7dLnTLVXUFHvOEbfCbB9jgF3+8d9Bqa6kzDh8zBQHeYHcLTJzvTHw3m?=
 =?us-ascii?Q?RjBWylOb/uUU1g7KEjD/uGvON0pUQB3dU8zKOYlvL5DE1RxciMkqUNe2ecm8?=
 =?us-ascii?Q?2iJ4+g83sMtFDA8l1/7i1j/JN4HQB0hVRqyCDJu2SA9sHUr1WqOZihJ8o88n?=
 =?us-ascii?Q?dIfXL7yrKixtvsZ5KVABNk3vYswzipdyMYyqpApIFBWJZ8DosUCLm4tI/lwA?=
 =?us-ascii?Q?VnN+2AlTOFiFM+AjPTRrw28v1gb4oo5H1JCvbreWkpKQjAxQ++1+MqFJkGbR?=
 =?us-ascii?Q?7Te1RF6N46wSjCBXQJQJbQdJtOtGgkTlnjI5mgnHm0JxAhmCtVr5Jh9lnRMB?=
 =?us-ascii?Q?Vv8DI3ZZVPrIq8OLkiGlfiWwPzOxVDfnYLbmeSo7c5Bd05I7dZg/dpQTSym3?=
 =?us-ascii?Q?fets5CopWPlkKLs6FLcMS4ELXzFFJ89pBgHR/6AkJwhMLj1UCMXkX0C0cbBw?=
 =?us-ascii?Q?Sp63vvfIeFm1nRM0uYrcSYSsYQs9sonEH3kwYmEykceTJLG/SQj3y2yJ6VEX?=
 =?us-ascii?Q?QwloQ4SuZoSWSoVKNObqirn3OOg2syEJWHmtUJOtMS/xh7JpT4oTmhuFIA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RaBAO+Vky6g3U+TdUI8wSVpa8mI3yDT80/DJVaEqm2FgvHKXPg8DLPX6fRhK?=
 =?us-ascii?Q?H2A+0tzRqKRlZ4odzF/A13Mosg4Cl/hexxiRQv3noS6ld1/hs56KLluU2cPu?=
 =?us-ascii?Q?TQGXbtArX10ggXA44sUk9ByMjKvDcWNalx4wattBZ5HsBlUT2nfScblKWEAB?=
 =?us-ascii?Q?V/4T1R0rbTn9tiCy1ksG2zb42bSTf+P+QtAqaLeYVxRCOIOUXObv9lnFllPf?=
 =?us-ascii?Q?RkGL5sEXY5Et20kDYe5/8nsWKzgV9NXtcGcHKHkLiq0HScmiN+mwQffeqq7D?=
 =?us-ascii?Q?UC9Jyuh5DrIw2+wQb839B0Na/p7DpdPVXEGQ2uFceQA6sfePN1lK+fV+pGIP?=
 =?us-ascii?Q?S5TxOjT8eZyTavUJNoox7mhoG/xY3OJXbkfkh+07WXrfo5kEfuSIoQYgxcdU?=
 =?us-ascii?Q?XhF7/eSTIT8B8jBM3pcIuE7l2jGjy28ZwafF61HEFoYSTCxoNDbA9HTDUwKy?=
 =?us-ascii?Q?gEK53kDgxTmr/iTSOtaMapiOvsdZZCIjJDsbvf2w4bCT2V3innrpQmaxsxDk?=
 =?us-ascii?Q?90h/g+UIDdp8ovTfX7M4KyHh8KCt1Ed8QDxcqQ0h8IiPkzlVrZxNnElxI+cd?=
 =?us-ascii?Q?qmb/ey75h5LVi9UmRYgO6YMajiqS3twJhuJoA7aqLUNV0IiENg2hz75EGVBc?=
 =?us-ascii?Q?i2bQWysOPVR5WiAjwN8dvFutX2HHPZGDKySpxtzod7lF0UJgwSYvlf0jhRz3?=
 =?us-ascii?Q?9xf46SedVmVZ0p3oyoF5R4Y17RgouYJ8D32ju8IuzJK2JRLvypctxNvlRupt?=
 =?us-ascii?Q?MAaDWF66TXwFjrdNTN49yi15ovtcJs4CbAbReckRjji/4aJqGKMR8J1I9UJH?=
 =?us-ascii?Q?zxDyO0s0TmhciZ2/7Q/z7Hge0CX+x61/+DOeQFbj4wYuZn2LB6a9BbtSP5zX?=
 =?us-ascii?Q?77t+0AjpAp/Is9Qmz/z67OHDEoaGuailSMIdEIWR4zkxkY3tgKFs5zXiMjx7?=
 =?us-ascii?Q?I+kHSG/H/o1tmoai58Kf7RQIVRrJKVFaARAKNv5XdvlHefQp+WX/i25AnoGd?=
 =?us-ascii?Q?MsHcaYnk8OzQtro6Wr3eaqrUtZg0VwFXy4xnV2+B7KrYWTW3YGBfyFDeDty+?=
 =?us-ascii?Q?UffP7l7dWrbIxodiYpvBUx81gTIQuj3WviUhbZDQSdsqR0S9HxY0V2YvnfJs?=
 =?us-ascii?Q?jtqO6ImXlizkeYAVmo6t6bsLBqNEa0v4sP6cE3tKpSm6iMiGV69WO0w9YnDo?=
 =?us-ascii?Q?jXMQrI+IxkiyLuMxiO3QS/bwfJs+X0qx+L3ejn0IoE3A+oUVmwxy60EJ6rCN?=
 =?us-ascii?Q?Sq4lfzNQyRfT32mJ5ANDHmhgJCIlduNlyIvjTGSp/QZXH1LAqe0AE2M17s9/?=
 =?us-ascii?Q?bz9uQ+reDtibvb8d7NE4sHYoigzp3KmgxwCyoYL2PiF/SZliz2D/j4oclmPj?=
 =?us-ascii?Q?J5wLnBf4ONJ+tZRryjR0suR1p/v3TS3pni3fNAzTjc8U+1nUbqz/Hrqq2g0O?=
 =?us-ascii?Q?dUIPJxShDX5Uw/9Lojpjx96X59E3hXCf0D4a3iwokUkjF5RGkDF9/f7nhZsL?=
 =?us-ascii?Q?5A+S9afN8Eu//HuYy1Xgf0LJHh1itc7M9VfMJsO4plrfZi+WOx4yue3PNny2?=
 =?us-ascii?Q?n95ZipVeZzMejtH4TWDOVL6WEFrcdu7H0ViyQtlRO3HPaHKu5Sjywi0INZIn?=
 =?us-ascii?Q?nTydmgHAJPFyHtKz4COJg6Y=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edaa4d6-427b-4159-fe22-08de0832214e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:20:53.5317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaypKDutP/83JHqKA75Q+dMv/l9dtUZwOmY9H1Nu+PsKv7R197C324Ti1kMgBVFOmicbZFfzvW4EO5gR8DTpplgoi+If3XiNqVNe1KVDp5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_122101_346572_88ECD7EC 
X-CRM114-Status: GOOD (  10.21  )
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

Current dirmap code does not switch back to non-dma mode in the case of
error. This is wrong.

This patch fixes dirmap read/write error path.

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 2d86dc62dbde..a39c3ab4af5c 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -691,13 +691,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
 				  DMA_FROM_DEVICE);
 	err = dma_mapping_error(as_ctrl->dev, dma_addr);
 	if (err)
-		return err;
+		goto error_dma_mode_off;
 
 	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
@@ -797,6 +797,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_FROM_DEVICE);
+error_dma_mode_off:
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
@@ -926,6 +928,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
 
-- 
2.51.0


