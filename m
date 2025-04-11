Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94593C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hsBtolHoi4uTylBp85qckgSJkfz+Pff34W8gN+FfoTM=; b=3y5xkLaZ1k0hcAFJlIG8tjVPZN
	9viIK6j2Omeg7mz//cjx+H3qxgz1rG3bQ5/afsealDEHpIe2Xcxja/myO6lZH+wXhaTzK9IkkQQY7
	VPsIAxb/C5S5x6MzpV7jcT1n0bXR4HMKl+/gTtCnmbj5t+37xAM6PkmthVuML8GnrMrAZfvoKuHC/
	P6G1wbFqFruejzPM/Xq+TV0vHV2F+a4auJe5a3ZD+CeKG6ngmiDtVQFnN6hXK4fmnrAHZyDouRVNd
	wuKkWKvtQ72tSkdKLK07OOlwDsgcETED2VcOq7nIxXGn7PzwcPoGSEl83nCrWMOsHiGwtScV47u5r
	6Y25RzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BWF-0000000DNKF-2vDW;
	Fri, 11 Apr 2025 10:21:55 +0000
Received: from mail-am6eur05on2060a.outbound.protection.outlook.com ([2a01:111:f403:2612::60a] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BRa-0000000DLXm-1oyG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 10:17:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7WcxcElag/GbZ1cUhwSh1S/Pdtg1eVIXv3lsOHtW39/2iuATBhO3pn8+OJvgNRnTPzSNwqF0zV4swrAwVjpmK0x53pKZUGMig1hLp7i4ZHpDnVlqcITSsKDGKTQ7R39ep1ABUJtN9RL9AvmtMBTsEYixqm/mZ1Y34n1QTiNXJOsxfEZpCDV7sKmxUZE23GniPU6ZnU5fH24gty2JMJZsSVWUEMvZufoEbIIGjrQNGEEc3IJoZ841DzuJg5RRyJZZAgZW+q1VVEM9ttFm23Val5ghY8U4y5l57M4Kqwsmi5b3kbECZT7P3i0l2hObE29GrkeoFlKVYEXDPuRMTJ2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsBtolHoi4uTylBp85qckgSJkfz+Pff34W8gN+FfoTM=;
 b=aLVwuD7/Rb+aHIOThwCyaHA9azZCvXKUrNT7r4PqdN8yxwnSe0t+ZQebHY9FdsXS60WgalkIrMT2aeEUTBiC0y9ki84jl6Ry0wqPMr3se5wDa5BrG41AjCupzoCV0XBXuZmq0Z3/8t4+B/BY8iYi8l4U4gm06BBLcZQIjqQ0OfJqNZkMja7wq9Hmn5QhgGwyBAUuMFveor/wEJBCaPPw/CXgDY5mRxB9l0NRezn/M4PiK/P2xx14x1VGOPXU1dQEfhy9qMDhcla5cU+IFy97F+zeMDkIocqJwTQ2ywYJCACK/J6TbQUuSRYGook+XIq+jQwtd9RVqhdLtAOgqPqHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsBtolHoi4uTylBp85qckgSJkfz+Pff34W8gN+FfoTM=;
 b=h6OahzGXemRrLSrw61C9sOxSdBmGjSukMXxoq3azOwzsOtB6N0yqSXck67ivASBfTgjU5oj13HZltH+PUCotCG21hFzYSJuxBU+cxSXIYqdIBfBfcQCuwFl2sXq0Ybw1MiiLOs926OupEOTJN0q8kF7wC1WOBF1Me15Ndiqyw0R/WModUP5vkXJ1WYG8NP+7fqMMn00OlHoaNXQk4Pi2fPVTO2a2gZYMsmYlRiO7YQKMsq/5V0Rb61s9y41KZBsgQkMlpbZl+0woWeBXHzqkcxQkHLqes+2FxZPOVuUv9uVaQHg2tbr9aGxrQqJLz/vATnjctuTHVkxtXMmxnowf2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by AM9PR04MB7603.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 10:16:58 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%3]) with mapi id 15.20.8606.028; Fri, 11 Apr 2025
 10:16:58 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 net-next 00/14] Add more features for ENETC v4 - round 2
Date: Fri, 11 Apr 2025 17:57:38 +0800
Message-Id: <20250411095752.3072696-1-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AM9PR04MB8505.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8505:EE_|AM9PR04MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: ed80aea0-5ad3-4f61-ab40-08dd78e1fdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S2j999SJ6ZA9hsG0xchrtguVU5szQkAb/heo7vPrGifYWIWOxs6GOh3i2YD6?=
 =?us-ascii?Q?P46NqHr4U3S6SeUyirYP/QfmaGodJzaMYIF9qwteP37btBF4D4Bp7Phzh+6a?=
 =?us-ascii?Q?yUQtGxF5RSMzhwU9oM+6wKgrCZJA/DbuLWWHbJ99FtxAwj3qPuQGDyObz6YC?=
 =?us-ascii?Q?IdiUAO58rNAcn+u8ehVE3nar69yttGr5b95ycHeYObXwF+Qq2HpTgNSwqt2T?=
 =?us-ascii?Q?zRbf5BtrLUKt8WXYl7HWlgK7ZMmxirNkwfYseZbPUZIHVHpZeG238QqwC6wi?=
 =?us-ascii?Q?h2aPY8K2iEfdt/R9ZBdjfFDE3ZCLejQRYaqu+KTipPUcw/o9lrgLGMKiqeG6?=
 =?us-ascii?Q?KyQHWyyahCvqRLPa28GN/Vr5OPPP+7bdTtOr78hkIs7UCbEiGzE5F9ODTUGP?=
 =?us-ascii?Q?LBGpxMHI9iqcRcjIoMnQ4kElar8Oc+wgYlB56B6QJpJu1k5NKIczqgf/ljFP?=
 =?us-ascii?Q?7AUa0KW5+x31eZht32UT8vNGQJmwrapIy2F0eMibr8i2rS4KPY+swptogLju?=
 =?us-ascii?Q?n8HRqhjnDca5RWVOGGEIXP8uOBylMjUDI0r8aQO4lqDQzYXvWV76/504S/zD?=
 =?us-ascii?Q?NPzi4Sk2MwxRSfjpF7L2kZwO8WGSM5Oa+AKNuYsDfhCdjTRNH6+yiLjHLocO?=
 =?us-ascii?Q?puHmoXfqK33LUXH137O4bdWBw9mIY3+3JnWwf8FHuwp6Zfazj/unAOxcQzyZ?=
 =?us-ascii?Q?X80ALC/Eklgp3zmSTLv5o4i9ngnybWcWtaJrp/IdW3P06XEnRiHz15ZqSblA?=
 =?us-ascii?Q?hBlnzRz7B+nJQr5jZhDyBkF3XEeLJnfuvUvGK7TXGDWYWp9NG31MmNmlWCdU?=
 =?us-ascii?Q?cGFZcbiUwkmdr+OEU9QC+F5pb8G9rcFr/CliZLC1UicFbO7Wts8S0Tq5NQp+?=
 =?us-ascii?Q?qBBTGSKuY5CB4rb+nRTvwkcbIaW00II53RXMlwcSs9kv7SFqqmT9UEPnMipa?=
 =?us-ascii?Q?PPRkasr0ZWAI6Dj+/QOxkdKxJUVyk5os5dCtBal0hkVNGLAX97BULAUcGLjx?=
 =?us-ascii?Q?jwKO2tBWDo5y4SHjBp1uKZfUe3EFN08Bamzftt8uj+FJHTCVFt7g968UVqrX?=
 =?us-ascii?Q?qR6fNv0qMYrQ+5UBG/Yp+Ynk7A1j8ptYPGTLiB+a+fu3uLySkfrvG2wjI6Sy?=
 =?us-ascii?Q?Bi/x3vHKDOQFzwZ47YUQw/Ga4TR5PM0dtZ6ziFpz0FJVR7iqmx9GaEPtvbgv?=
 =?us-ascii?Q?hO9jTkNITe+2zKOuuwH9dkIQ5Wzzo1o02LyScWW54SbEvqmXfxnpcHtElvlg?=
 =?us-ascii?Q?OxbYw+fhOfUu6aKx6hBWwgKmDvsn6xY4ctINpyo9Lh4/i5BZuRydxh1KaDaF?=
 =?us-ascii?Q?uN6iIFkSLz5kpsqwjot75hia/g4Ftjeh8jU5smFhEZeSx5mLpTQy71kNg1b/?=
 =?us-ascii?Q?icSQ7Wy7JJyoyjWilmcTvMkISd2XHciATbQTPxwkOFso/C/Xz1PwXqRGxcHa?=
 =?us-ascii?Q?E8KIseTS3jIGO8pYUxy+UXedIALvN6f8QDa4M7K0eVeMs0L8kgXpejj3QTaY?=
 =?us-ascii?Q?RCnDs3OGpRvzWeE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a761XrOusptVq8kRxn9gOvS6PgYLH3fTdP7JFN/QWM+6ua8zMx0i9VvLJuB5?=
 =?us-ascii?Q?4B6qvB/ZRe4KBOvfPQ3gPSmqLXywvf39vW4fOY2//mhZHRilCXHSjOWPNLwx?=
 =?us-ascii?Q?00/gsuwatHlNMAC3Pn85imQ2cZ0lo2a/t/t60FuvSAJAQX4hkxP7BHK9jkrJ?=
 =?us-ascii?Q?qdWquWi5/v2WCcPeqgaWrEy00WyUBtELx8qmPZ6st0H+3wV6qfL+2d1cEJFZ?=
 =?us-ascii?Q?WfMApahc0rYtPLlKiC4L8UPEb/GVmQ44TQQUuE00M1GTUMDleOMH3y/LM3yq?=
 =?us-ascii?Q?HEV60OKZkDbRE9JOZoUwP5SZ4Qe7YGWc7a43dnSWX32pWEEps7hjVy/h8L4O?=
 =?us-ascii?Q?QClO0/zOPZgPHEl8LrMmTxq9A8uxSAI3cvweMeLZJWjaZAF3SLGY3yS1sFJb?=
 =?us-ascii?Q?HVsltI9Dp7eQhODJXkvbqXU8lvtP75AOyXYO8p4bzIP3onGJsi06cqTlqRRH?=
 =?us-ascii?Q?PlDHN6kW48ee5XaA3ZbeS7VcHuDA+zw8anH/ATVPH1qKxr2g7xV2yNitu+hz?=
 =?us-ascii?Q?TFCjC8HQidjY2LmZqhCIGcOB94MF4G91Axz+GOqujPRetcNePxRVqamDaRNK?=
 =?us-ascii?Q?QFSQwLdQVjhF9TtjIe2MHyQQPKeD5tvqfjUDbfJHcoEXLTI13uhJK8zrsCfS?=
 =?us-ascii?Q?xUXf0W20Av7T3l199ya5FpOetACxcKFT8qcIhXL5vvvPuBCnJRDXba8/dJ6I?=
 =?us-ascii?Q?lHBhgwb/T1wNfzx9pOw7L+uoAbGTfmTyBREDfDRpDcwJIK6CG/NewOC9gqW1?=
 =?us-ascii?Q?VpK8CI3D1oY7tEvQsikGma4kgKyCMbghbjHmBe96Irt54YL0Gd3/+8EfBmcW?=
 =?us-ascii?Q?4xpPkmIrXLe7m4/MMZGgybaLQ2nTOwwOPSPMN7C0JSi2IBCNuzahbqXs+haN?=
 =?us-ascii?Q?W6fwPibVlcWhaWsoMGv5G2C1P8eyInCpMFWRjSDKFyeDF+eVsem3ySLsj2Nn?=
 =?us-ascii?Q?rP9kVqK7YZ6wIjRBhhmCQWAK+8ZIb5UTi14ZGKf5sEi5KwIfrFKrUGA2ITEo?=
 =?us-ascii?Q?xZo94s0m7mDiL122KHFrdoWu8KZT4jk1ROyQS+A1uQZkqG6dZKm/ocscW/L9?=
 =?us-ascii?Q?DIZQxmu0veOZA+ZOF5/UB13bJkul2VjGFvT2ZAvABNxXYunwDfSxxWeSxigY?=
 =?us-ascii?Q?y8ETxme5tS+iRxVatOyvLKpx75hbIenyCivw8YWts5nsrpp9rORqqBnqqyON?=
 =?us-ascii?Q?/+tkRCaGN1qcuCcNiBOhem6L9MSIZy63qJR6G3YOtivX5kezDeW4Oj/bofZ2?=
 =?us-ascii?Q?Aps4ahd7CNfa50iu62pzcungAMtG40JpuI6pgu+Ay1XP8dma04OOlRemPMK6?=
 =?us-ascii?Q?Cr3T4Ah7NDnyUuAJLPpvBxV9hb5KhKEmxatQtflitN7pbCIQ/2NEtoW1V7/X?=
 =?us-ascii?Q?FtDcID74iJJLwC31hJUlt0+AvD13PuTMxX8uu4eRzDupLTzmyIZ7KwxYoEG/?=
 =?us-ascii?Q?4NmYlbD9I9XNJs4QRXr5oKVPxLO6ZXyFti6yxu9dlNieiwi+E7cPbYKy2au5?=
 =?us-ascii?Q?C5WmGnNTCIPKDovufVPI8ErQAO8DNwy+6lRYjOLd97G9vnv1jXCf039KZueI?=
 =?us-ascii?Q?0WM+euo8ptb+df6ipsQcCs2SI5TBA9cwNv0VJe+U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed80aea0-5ad3-4f61-ab40-08dd78e1fdad
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:16:57.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+uENWypOlwqwx7ILEMAVx0iqJevwk21bClIWgn/M4DaRQokFWrZ6o+OyCZEBkgX2U37zzrdmAC+Jow/N5wd7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7603
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_031706_496415_80C4C9D6 
X-CRM114-Status: GOOD (  13.14  )
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

This patch set adds the following features.
1. Compared with ENETC v1, the formats of tables and command BD of ENETC
v4 have changed significantly, and the two are not compatible. Therefore,
in order to support the NETC Table Management Protocol (NTMP) v2.0, we
introduced the netc-lib driver and added support for MAC address filter
table and RSS table.
2. Add MAC filter and VLAN filter support for i.MX95 ENETC PF.
3. Add RSS support for i.MX95 ENETC PF.
4. Add loopback support for i.MX95 ENETC PF.

---
v1 Link: https://lore.kernel.org/imx/20250103060610.2233908-1-wei.fang@nxp.com/
v2 Link: https://lore.kernel.org/imx/20250113082245.2332775-1-wei.fang@nxp.com/
v3 Link: https://lore.kernel.org/imx/20250304072201.1332603-1-wei.fang@nxp.com/
v4 Link: https://lore.kernel.org/imx/20250311053830.1516523-1-wei.fang@nxp.com/
---

Wei Fang (14):
  net: enetc: add initial netc-lib driver to support NTMP
  net: enetc: add command BD ring support for i.MX95 ENETC
  net: enetc: move generic MAC filtering interfaces to enetc-core
  net: enetc: add MAC filtering for i.MX95 ENETC PF
  net: enetc: add debugfs interface to dump MAC filter
  net: enetc: add set/get_rss_table() hooks to enetc_si_ops
  net: enetc: make enetc_set_rss_key() reusable
  net: enetc: add RSS support for i.MX95 ENETC PF
  net: enetc: change enetc_set_rss() to void type
  net: enetc: enable RSS feature by default
  net: enetc: extract enetc_refresh_vlan_ht_filter()
  net: enetc: move generic VLAN hash filter functions to
    enetc_pf_common.c
  net: enetc: add VLAN filtering support for i.MX95 ENETC PF
  net: enetc: add loopback support for i.MX95 ENETC PF

 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/freescale/enetc/Kconfig  |   8 +
 drivers/net/ethernet/freescale/enetc/Makefile |   4 +
 drivers/net/ethernet/freescale/enetc/enetc.c  |  76 ++-
 drivers/net/ethernet/freescale/enetc/enetc.h  |  45 +-
 .../ethernet/freescale/enetc/enetc4_debugfs.c |  90 ++++
 .../ethernet/freescale/enetc/enetc4_debugfs.h |  20 +
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  12 +
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 359 +++++++++++++-
 .../net/ethernet/freescale/enetc/enetc_cbdr.c |  51 ++
 .../ethernet/freescale/enetc/enetc_ethtool.c  |  74 ++-
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 105 +----
 .../net/ethernet/freescale/enetc/enetc_pf.h   |  14 +-
 .../freescale/enetc/enetc_pf_common.c         |  93 +++-
 .../freescale/enetc/enetc_pf_common.h         |   3 +
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  10 +-
 drivers/net/ethernet/freescale/enetc/ntmp.c   | 442 ++++++++++++++++++
 .../ethernet/freescale/enetc/ntmp_private.h   | 106 +++++
 include/linux/fsl/ntmp.h                      | 126 +++++
 19 files changed, 1464 insertions(+), 175 deletions(-)
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.h
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp.c
 create mode 100644 drivers/net/ethernet/freescale/enetc/ntmp_private.h
 create mode 100644 include/linux/fsl/ntmp.h

-- 
2.34.1


