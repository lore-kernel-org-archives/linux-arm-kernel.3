Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE983CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ36ANYsV+3/RELMf9tXZH+F27z/ACyzhr8QYtfvPes=; b=dWK+sKR5qQBzuB5o+WwBjFVee4
	PNp3WGnIyYLgIB6EUk5ORsyetG8ms1jaHYnd84kTD2z0ayang8Qn/tFs+by/mysJW9LUutDycx04L
	sGaSWIYOVbboy8TFw7s8Rl5HsPd4CYAmJMsIBHHWALDQZAj+5m7bEGxnc6fMc974cpChVsnYiPKnp
	7T5UtJtRNIHnNfYlpNuxcGjxjV1fkRnKfanJK+tzr1JTXHtiG7tJUxdl6Uscsu2/JEkNblZwKxUH2
	TUzgAjEzQBPcxwXXEIOE1eKxsGrBM5/GyRVmrZTHdgAPTXt35oco9ardowUfEFVNilgzqSRo7zQO3
	3pBKYCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Jzz-00000009LQ2-0vkr;
	Fri, 10 Oct 2025 20:45:59 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Jzf-00000009KpL-0rBy;
	Fri, 10 Oct 2025 20:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5gObRy3PqYyQbhf3mW4LrPuPGnZ6aPSpks1558D87iQlWLIhXl4i9Da/IAgQMWZFgruepLq36ZhwXJMXE+a5XLrr4OzQpPr8Vo+/EGn1MPOxsrczGtya2PmFpYjpYMdOO8/WGM24R/xgkV9QBe3dxU4z/jsJOHMgo/XBBtGIGbSsjMG81k/b0IBX3nAFKsfb4lM9q7xbXZEnMeMRst8UJDQBvqFCDf+yQhGDqtJs+dr42R//ik5pJ6WNVpaOnL0W/3rbGkR/SjLP1wEVOiA2xIWVBi3Oe7vr1Mr1Rz2YNltD2UwQh0E9twLnGsjJT/KCaedN6lFNYRxXWnAFrERDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ36ANYsV+3/RELMf9tXZH+F27z/ACyzhr8QYtfvPes=;
 b=jSHX+q+uGoz+je1PydrFICGeO66npQash81cqRL7bF56vKb+rvGnV4RVcKKuncRGHtND4ltPh4slwIsricCrQvNM/Z1Hdye/QJuryLuCpQjau9OLRW/SXrjWxngPU4j/0MrH7H7BHM+PeREG9I7sxSIn9wHI8z1pUSDpKIDPzaiqwpczt9bDQEa1zYaKjCSsfew5hrwL3Ewxqm2Z/Hab/bzbM9Y7P1c3+l6txAcbk/mt+k9+bHrT8KmxX/uhXJakZBYzV6hxCs4etnBNP4L3D/+A0fipY6rKiJYmeFFpUCzORNlg63OvNZoOAjwjhuUjQ/3NlHAqLO8ECtweuir+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ36ANYsV+3/RELMf9tXZH+F27z/ACyzhr8QYtfvPes=;
 b=R1OHBf8Wgk50QNJ6NPa6Ze97LTnVzIclbr3t+QuUHbZoQjvbFVSDJJXu6bgmdgFoXW6m1MqtYaJpgo5PfnKPF4y7WEtb/9F4Le6mJN7WYG/pc2a/iud6FyMw8+9SbsPdMgN9xmi8aUi/JXgydTrca/Eh8stHgyAjP/FYTNHAaDrD2L8K8GFIF4aW25RTMuuHCmybrXYWaYFp3shl/1XqJsTwsTwQ/03COHBLT1GT5WtR5R649ZNf2xWhetvPpi/d33JicmBJAEN0styRf25gthqqXMTiuTr0DNXhum6t1aynu7BsZ9IcTRBBwJim2zb4KizgbF6YFega7hrfySRuiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV1PR08MB8619.eurprd08.prod.outlook.com (2603:10a6:150:83::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 20:45:29 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 20:45:29 +0000
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
Subject: [PATCH v9 14/15] spi: airoha-snfi: en7523: workaround flash damaging if UART_TXD was short to GND
Date: Fri, 10 Oct 2025 23:44:59 +0300
Message-ID: <20251010204500.1625215-15-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010204500.1625215-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251010204500.1625215-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B51.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:b) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV1PR08MB8619:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee6f8e9-ea17-490e-30aa-08de083df308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7iyQuxMhVBLu2tVUTb3OkPddOYuMk0j+gMNMV9wuo7uhct1tffGAHiL1iusI?=
 =?us-ascii?Q?rLK7TxyTwSZQpYcVb2wU5nZ8ncQ/Ln74Rubx3Zr5uostQ6+Xe4hbHkTTiU8Z?=
 =?us-ascii?Q?Bhs8q+mwi9zLaB+z76BAJ4OUmixLPWZjKNOZiT33MKNdCNMSQJXMR/OJO5q/?=
 =?us-ascii?Q?q+KCn3t0riXkXw6EGou1KoL4pd9zayLNs4COaTEFuyR1qGwVtrF3zoZu03/G?=
 =?us-ascii?Q?wHsymaXgOa+1RNER0oSKfurVdZpOlChHW5wFhq3MLtemM0wRp7hrOolO9hgJ?=
 =?us-ascii?Q?v7iRGNUmSeY0G79JmtnMIQU9fotCEET4e0HeSQlgINLCG74dHHTU1uAUXhgo?=
 =?us-ascii?Q?LeFZMnl/kmGDiRSjDKG3SVwnS9wV1LZXf8eQ7s5E+d1WerBWZPP0nqLmpeoG?=
 =?us-ascii?Q?NCuI1J6vRT/Ct8tC64dY6Q2gDZUiqczV8q/vXTKBiidk9vvBLlvNi61ODOR7?=
 =?us-ascii?Q?s7xJzmtbKzZefXwcBYOb47XcEbhZrScp0QeMDOJqHBqShl2xIi8iWwRlEGD9?=
 =?us-ascii?Q?OeNxDxE1tlgvIOmlO1n2Uma04cKYz15SB2l1zgWFwqJZ1klpegJYFORoWPag?=
 =?us-ascii?Q?1xUPS8l27vuy0kbSsUn7TUZRtD50s8s0h4g8qjoZOZ2R0Bff5gGwOLA0SAgG?=
 =?us-ascii?Q?MJYFJ0RqnYaKZL3dfl9m+t1k2muP7UX1hToAqwdVq0znBqA9fPDS4qgDwBwu?=
 =?us-ascii?Q?YBaLHbahWoXrevmIczBqXc9q6xKcQNfE5cZumITeWAmW0fReaqSD4hOX4QGY?=
 =?us-ascii?Q?C/yWxzphi18wjvnnFZDG5wOHYMiIRK+wbROHp4kKp6vfw9dKfKDjVPRY3TJW?=
 =?us-ascii?Q?UqUjHmCsY3PoyedJC3Z0e5UyROCbTi0HDkPWIUcqyf6wNcEt7B3mbCa6fWbd?=
 =?us-ascii?Q?5h1dS1B4lvwW7SsJBWNP67mmJ0hZexcZLQy7dwL1TpbisrJVNzhkmMV2SBCE?=
 =?us-ascii?Q?+Y1zPUPAvx6jw8uvE2o/IUWDLngZPkOh+vu/esRLHe3EIj4bbOWvE0SIsrm5?=
 =?us-ascii?Q?PjWaFLcCHISEViicQTfZNhPRlYh5mTFYoysnOhT6K7pyuy0vHRYLBvjhZ0pS?=
 =?us-ascii?Q?g3RHKSAUfFb2ct0JgssAR3hwQ7FJqW1h3hjo+iKZPGpo3RMPhNcTCs6ZM/HU?=
 =?us-ascii?Q?t9VvCbWHE7W8Do0z5AE1lJO2S/qAHuZLwv1wdM61RCI4WtQWd7vHx7sQnna+?=
 =?us-ascii?Q?fEm/IoGpEFvyZ+Y5FrYlIPAPW8uv6CQzE9sdvnEwhDX80ei8CcEwPHT/sbiR?=
 =?us-ascii?Q?R1JJ/S+V1jmUpWbALtub6ABLH6muJBpceboJRBE/yTEPCwXV2UAvvyLkagI5?=
 =?us-ascii?Q?Ofs3xutFoMGo/4ojfJhthFtQo0NBYry9lBnkFVZwxhIjvYc4OkyBg/RVz/Gl?=
 =?us-ascii?Q?dMy8xlzdtNXbl7EFy6ofdN2MT5rgO4vJQ/SFS/f6BgINpcFaBnBFlsOiK4Gs?=
 =?us-ascii?Q?4G+r/h9PxpY5VX6mK1IHjCAbslGoGS7APLW3K5/bIMEPOyrLKL1rBlCsYROK?=
 =?us-ascii?Q?YH0JBUgSORVmZVqNHzkB2h3JZAa1nFsj0T6T5ooW6WH3+Wi9TSdIb5vCKQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LYfG+BueIPdFGilA2ndiOkVfbT7VJ4kj3UR75oYqeyOwHhhJE3Mm3w/d3EB8?=
 =?us-ascii?Q?/0ziMye9auWXX+gfNLxmDDZvTBQxRo4qr+y52xxjAK23lRUSzsn/ZRiwsPbz?=
 =?us-ascii?Q?U+btke8ML5FJ99RR1EBqrqm7N2/S67IZLLVPGHDBgGg97BjxdvgwW56wcikY?=
 =?us-ascii?Q?qU+iCYJ/rs57wBCTM37Gqk6NFeEjG5eDy+CjrbnnpdTBCIa8RppaklrxOaSt?=
 =?us-ascii?Q?z27YU3QuqoJCziZtc1wUBKVbzcphRHmEwXYSDCMsW+pj1te4hW5lvD7Fgzuh?=
 =?us-ascii?Q?reU08UFpCM2R8sS5NkHXO21gYHvNdkJAHPf4JRS75prPb9EI77PtIioiu1JX?=
 =?us-ascii?Q?ecXdRP88g3yBgyTm8T+kl0edBxfXXprhSGNlLsNYvm4xWj1KtY99+vCbBLM7?=
 =?us-ascii?Q?2QdtU4bP2SJjMkivpPi7pAS/ktHMfwPHGZDOwa9c4OERJSXeziUJjs6r3BK2?=
 =?us-ascii?Q?ZthtkEElCFnQzhtbG+FVO+K/jqVaGIHksdzBRBWC894xoj72+EMWKAfeUFZZ?=
 =?us-ascii?Q?D8R2/B9TjtDesrr/wskhRID9VZMfJAjjz157hkPa5pIEQMkjgljvkR3OT8rt?=
 =?us-ascii?Q?lof3lqIUh/S2NhQ2P0UU0093mVBdwgz7v4liI1VkCVtCPmSOaiI0D2AFa0aM?=
 =?us-ascii?Q?c0r+XbGYRl1NL5iKfFexSmt8wElaZzaWyFFNX/FsOCF563PCzaONfpCQEx6E?=
 =?us-ascii?Q?/JtLUXbWwGwHsobak352h4C/tP39msSMmpEKvp3CKhih9p5Y6p/BHGIfl4IE?=
 =?us-ascii?Q?DrnAhLGhorz1yYCsa+vYdAIHeZ80WrP8To+NTKd+fD1ifcuVAC/o/bLkj0CO?=
 =?us-ascii?Q?EMq4zIAS2hs98yhn6f3hC2n9f3+/HomJB+mPe+C136iSTdl1c8c5zIHMHZSd?=
 =?us-ascii?Q?XPwx7Xo2BqvUmdTja52Be4pO1sf/rj93J/08CMzRrUxfk9MRehI4zA34I50j?=
 =?us-ascii?Q?vyF06nmDrLQ8UVlAr5RPrJZWRBkfoyjmlHGPV0RDOqX1PGmEWUSWqgAv1fIb?=
 =?us-ascii?Q?urcBU7+mePjAgZ0L6dZEmkq/2PRiudTYbI4DBDShiedJcf5jkTQMgxP/JFuI?=
 =?us-ascii?Q?Wc/ikqX8pR0NO/VqAmYLa0bTJ4qb1nSm6qtEXSpz/gVjOMteuEQ4SagaD4DN?=
 =?us-ascii?Q?PMve+6B5Nj4uYxUc1AhzPejFB7Lo9SKUfm6/xZx/thuMBLmfYUsFtYorRKN2?=
 =?us-ascii?Q?SCQtzXyseyUif5vVStBIlYD9r2btB4EJbDmmZtfjyUZnmGRKflmlNRUG64Wd?=
 =?us-ascii?Q?BauvPPGRPd3fEucGcLgaIdx6cK6/8XJFoC/tnmqbOWW8HJMKfDtXwpRRoJnp?=
 =?us-ascii?Q?MPY3IDIK3NNpPvtjc5vfIIsi6+2ZLhH8rNvRMydnOwpkk/3yX1rbLOzbUHrE?=
 =?us-ascii?Q?7boLwo6/cQ6uoAeu97JASnhWErLfBIEcseAqk4LCH4j5UjsWS5HtOFd7XuX3?=
 =?us-ascii?Q?JBxELQ1+DeH71oU90aw8WZQed0gWKwTRLhkS08s17p1LsyumRn/rUaGkhHNV?=
 =?us-ascii?Q?qmSfR9tUSE60q1GD9YVtfjyeXnoeLN/pYWjGuHEcNRGw+HOOmE+PdQcBTe9i?=
 =?us-ascii?Q?XPZxbZGxgpL37ZHSJfwqBAyhdQTQLpq1KxxpWepC/WinOxMsd5BT1T0bNEAS?=
 =?us-ascii?Q?sd3NS0Tj2SbwYJIZ99HLow8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee6f8e9-ea17-490e-30aa-08de083df308
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 20:45:29.8480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4uAjsLVE6IwIXD4Z7tR7jeqCda8f9CuGyzRrbieETQP5BD9KHU0XhHfwH9DUQWzPO1x8phTnH3r+bpxnijzjnqKQ7EqljG1si7phCjqgow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8619
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_134539_250635_B7042565 
X-CRM114-Status: GOOD (  16.96  )
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

We found that some serial console may pull TX line to GROUND during board
boot time. Airoha uses TX line as one of it's BOOT pins. This will lead
to booting in RESERVED boot mode.

It was found that some flashes operates incorrectly in RESERVED mode.
Micron and Skyhigh flashes are definitely affected by the issue,
Winbond flashes are NOT affected.

Details:
--------
DMA reading of odd pages on affected flashes operates incorrectly. Page
reading offset (start of the page) on hardware level is replaced by 0x10.
Thus results in incorrect data reading. Usage of UBI make things even
worse. Any attempt to access UBI leads to ubi damaging. As result OS loading
becomes impossible.

Non-DMA reading is OK.

This patch detects booting in reserved mode, turn off DMA and print big
fat warning.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 38 ++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 8408aee9c06e..945f31a81876 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -1013,6 +1013,11 @@ static const struct spi_controller_mem_ops airoha_snand_mem_ops = {
 	.dirmap_write = airoha_snand_dirmap_write,
 };
 
+static const struct spi_controller_mem_ops airoha_snand_nodma_mem_ops = {
+	.supports_op = airoha_snand_supports_op,
+	.exec_op = airoha_snand_exec_op,
+};
+
 static int airoha_snand_setup(struct spi_device *spi)
 {
 	struct airoha_snand_ctrl *as_ctrl;
@@ -1058,7 +1063,10 @@ static int airoha_snand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct spi_controller *ctrl;
 	void __iomem *base;
-	int err;
+	int err, dma_enabled;
+#if defined(CONFIG_ARM)
+	u32 sfc_strap;
+#endif
 
 	ctrl = devm_spi_alloc_host(dev, sizeof(*as_ctrl));
 	if (!ctrl)
@@ -1092,12 +1100,36 @@ static int airoha_snand_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(as_ctrl->spi_clk),
 				     "unable to get spi clk\n");
 
-	err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
+	dma_enabled = 1;
+#if defined(CONFIG_ARM)
+	err = regmap_read(as_ctrl->regmap_ctrl,
+			  REG_SPI_CTRL_SFC_STRAP, &sfc_strap);
 	if (err)
 		return err;
 
+	if (!(sfc_strap & 0x04)) {
+		dma_enabled = 0;
+		printk(KERN_WARNING "\n"
+			"=== WARNING ======================================================\n"
+			"Detected booting in RESERVED mode (UART_TXD was short to GND).\n"
+			"This mode is known for incorrect DMA reading of some flashes.\n"
+			"Usage of DMA for flash operations will be disabled to prevent data\n"
+			"damage. Unplug your serial console and power cycle the board\n"
+			"to boot with full performance.\n"
+			"==================================================================\n\n");
+	}
+#endif
+
+	if (dma_enabled) {
+		err = dma_set_mask(as_ctrl->dev, DMA_BIT_MASK(32));
+		if (err)
+			return err;
+	}
+
 	ctrl->num_chipselect = 2;
-	ctrl->mem_ops = &airoha_snand_mem_ops;
+	ctrl->mem_ops = dma_enabled ?
+				&airoha_snand_mem_ops :
+				&airoha_snand_nodma_mem_ops;
 	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctrl->mode_bits = SPI_RX_DUAL;
 	ctrl->setup = airoha_snand_setup;
-- 
2.51.0


