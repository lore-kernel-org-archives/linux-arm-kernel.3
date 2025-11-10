Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B7BCD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 03:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEe/rFsc/ulwiEf9Z7qBqvcRJdBZ6R2LCWV8pLNzBmg=; b=3V8Ty367ngR9OqNMPC+DV/jh3N
	8pz0Hvl6HPkzX942uPedqZnI6NvCR1kuFHq8BaWL8xOipAX4hk1zzLxax5RROdN+Zduj4OwaPJ125
	D5R4lblzS4Lsd939ptuWn95BrUxZp77MBlAtkG1Ll9fSEufirlsMtp2NMvfL3+EG9CY/fkCEhQR6l
	b6HTgarCbDnR8q1hjssaMf8KW8hj1TZHvuBvpmbh892i8ncRq+WAvDQvaxQj9aFBSFED5doJGMcRc
	i/HssLGDHi6aayJudiRvhO3yL6iX7uWrJiFuauVhOkjsumlGxs/88l7t1tX8XNP5pcN+uPlGjfMmQ
	lF0kyAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJ1i-00000004fvu-0X3y;
	Mon, 10 Nov 2025 03:57:10 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJ1e-00000004frT-0ESU;
	Mon, 10 Nov 2025 03:57:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bT3wMSzEyEkiVHP8OhS1xyaZLHwzYvMlj+mtVkPeW7asL26rF4vWsMgyi+lccD/7P6NdaQ/LEOFb35486YHH1O5qycPALE2dPHpB24AQIvc8rQrQxxCdcRtn5jb+OzgRzyDRKBdUx+7Oipj7Vcgnj+VXsOZp3JxOTciDeq397XTbJdzyFqQDjCLS6t8JW+Z/FCXZkv4Gteqx0MBJ2t080T08H+jSp8Q9gQdZ/qxxbd3vYUbxmFeD9LTNdvPG4G44NWEfygeBv1oMkCzxACBbRZL+fNlKokDN4PO6jTNP/74GZPl4At9G82VoN/p3nvmDnxw9grqbnKs3sTE57Nm7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEe/rFsc/ulwiEf9Z7qBqvcRJdBZ6R2LCWV8pLNzBmg=;
 b=WFfXFwaszC5LNkJP2bF8eqdBM2jz4YKKkLUGwtsA1oFLoC25sBKeckyWu7Mey1s9tWgGSFBYWFy0YXTq2WzuwRJnnuQNVkHZVXPR69hO9fMTCfsDGOZrijNFzCWhPjk+D7EnnUokgHWNPKb5wfqBcHmcZF9Do9qxMpUZ0PmISdokOuCXTdLA3DP4ZEb4Zw7td2ACFug7i9yCnoIIQWdDNuu+nyShVNhqDRZad7N/4zz9fxkjfpKNbh9nMOwNveEpxJ6u/z8ITQ0W/9hV9ypMYBAk8jOaMZ2cUTToEw52AURr/lAt80BGdZ9cojkT5H93X1vaiuzrI3dqRLiCim13jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEe/rFsc/ulwiEf9Z7qBqvcRJdBZ6R2LCWV8pLNzBmg=;
 b=Ily92FE0mQvlqiQE1xg6RZsoiRNuzTvZCSrsKCjJKqb1VTgU6ocLXJJkkQRnwaRPaVfh7INxU77jGWPnqolyxAF1JT0j5Qy1QAV7QR7UMyt2BPb8CYIx6XfKkGZPQOrKWV0d+VmoenBAWyL8J83d1V7spf226ctG1OjsrBsS+/n9+tZtFQr1ysp80qwkVXtUogwN0KFg1gw1fECZMbWgvATYYww7ntfMKhNGhJhnyaxLzV4RbDgWuIPiwTw7KYoGeCAIFWqnQpTL2BRUnKPAwu5MPwpJrlGiW519R+8T0DkM6FEmQuow3ku6MYFQKEXt+FeYziw4mQ3uSpj6T7aopQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAWPR08MB10946.eurprd08.prod.outlook.com (2603:10a6:102:46d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 03:56:59 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 03:56:59 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH RESEND v3 2/3] clk: en7523: Add reset-controller support for EN7523 SoC
Date: Mon, 10 Nov 2025 06:56:44 +0300
Message-ID: <20251110035645.892431-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110035645.892431-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251110035645.892431-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAWPR08MB10946:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce80284-aa53-4617-ab8a-08de200d32dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6VvR3hn8MlbwdBKaYFJtHTx6NsKXBF73dp6g4tZGwORY/KQs1QxpalBaUPof?=
 =?us-ascii?Q?n/tf92Rxg1fN4KThKN4REjQ+oCq40FgTpLZZAYU4wP8RLcg+uaa0UGxQqArG?=
 =?us-ascii?Q?6LrVjfH+fLi7JCJmg5SzAi8jsMqIeJKMmuVhTMinA+KLNb4U7bbiFWQgulJy?=
 =?us-ascii?Q?Gte0hGJlX6CNhFDAEP290dsZlnE8RIJsB9ZmRKZtgFrtdb+aFTt/g3c5xr0+?=
 =?us-ascii?Q?qC52ln1R5hPAOT6nZwLYWQpcY9N5YrHBBJZyOre69Yd/Fg2Cv3YWR7sDaxfH?=
 =?us-ascii?Q?WA1Xo+ekJn1GB1Oy5BPT43So4o/s3JQymayoPXSRK2AaI1dLB84TPN7R9KTP?=
 =?us-ascii?Q?YQQuCFXIbSp/w9/yEVHrbwtLedEhOPxoMMDScoUQ4UPFIJ8S7kOSg668XMMO?=
 =?us-ascii?Q?RdDBK9S37GW3fj4yQoUI66j5+la6SFp59tcWMMeubmf99FhpkkLEhYRicilm?=
 =?us-ascii?Q?nBOFI8ar8Ybk0ZfpkaqCaFpBW811+xoG3cyWpbp02Zhv7ZN99D9VAi4iBTZV?=
 =?us-ascii?Q?CvA1Abgw9EM9GWaHTkPyUqXlKiCy2wbwdfr2hZHpwCKuiZhO7XVIlBM0fnmf?=
 =?us-ascii?Q?RO7n5AydB4RYJwRvrMA2a1NodRhbNnqezXusn0ZkqF6cYUUDv5hhcdSCBzSR?=
 =?us-ascii?Q?5fHgT7CKKMdwz/iMseavVnP8HAhg9jhiCYINwZuUafP+kxFThC+dEBLYJQ1A?=
 =?us-ascii?Q?bkyBDVWQLhlPxlu1z85DZJSNufYr/jdUNO2t+PmqUUuPB9zKw2INIh5PUySd?=
 =?us-ascii?Q?FtJUJIeZONjGa7aPkUrez/gNrZZ8Wks//BZOML+7aZBsV4O8gaF3IEfQl5ku?=
 =?us-ascii?Q?byfPJsylyVKAg+rR56C6BHHPG6mhWOXVi0tVohAb5eNoyzOVusn42fXNxf6v?=
 =?us-ascii?Q?KGAt6O0xJ9skTHbxYonPcW8HL0cnJ4XUZOAnwayA9C7kfAHz6L8yx4hBsf2i?=
 =?us-ascii?Q?uu9tGFAoRQpuRlh+r4I1YUu+9WIS7/6iFUym3k0B0jVvkguDtNGApfgi1d7S?=
 =?us-ascii?Q?mcQSb89K7dL7eq5pINB9DpZ536bA2wsxtva4U0OSTtDXvMfMrlg5SVju5r/N?=
 =?us-ascii?Q?fkJ4GYf5n1jYCSAztU795AJLywCJncHtGAkqQaj+JfLsO8D8rCaeyZdrCcDA?=
 =?us-ascii?Q?zUNqedGeDfdrUAkpo0Sgcxk9E8eFXZPiqOoHTJbJugr7PUAwAnTeDkXhwU+q?=
 =?us-ascii?Q?hN97sgvwkmFQAvRYaqFxKvVpRcczxXdNvlUSAyDbYgO7RPUH2VW4OejXBQw+?=
 =?us-ascii?Q?TY1Qkkm5WfLiM7Xei8vWEpOGFaypIiqAYNpbLJFlrtx21MJv/G5s0LpSqzr2?=
 =?us-ascii?Q?4QhaJtuLfCv2S4FE97d0j+Wp0qzErUJZOnnkyjfTuLh/qd4pGhPMRrReuhQ5?=
 =?us-ascii?Q?OT9Qfc8pNWskO0DuDNvQtlGq4mPPo8bV9d3cGS0cQYF4MgOVXzlj9csSynuY?=
 =?us-ascii?Q?oe9YWLHoyQ8QWuitbtmrb9gv8XuurevU3hgeTc0t53zdRQ9qv/LtaMb4nYLi?=
 =?us-ascii?Q?yBMXDh9QYa3a0eMn2nG99bZQDTEDIBslDhbQCc12um4ewES9GX/+FjWnNw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yTZkjybULZ9IHiLv0z01WIEMBao+X8HCXBmxkQ2FBLHCilkIY11MYL/qYNtb?=
 =?us-ascii?Q?ck2Kw/Y05tUYd5ZaLPYY1v4OI6DQ7fzrLoxYLXpkibSVq7OXbXdySFwjt/uU?=
 =?us-ascii?Q?4V5tU248cJ+hS7W4jlG5LuazZZACdWqd4uk2ZNZr6nILDD/pi1trb6LN2p+W?=
 =?us-ascii?Q?s5uGApXdyFe1PgmvFBq7gRStk3OmW2M3G50kAixdcZm3OypWvkherCkCss0t?=
 =?us-ascii?Q?ihDVf+wZ65FOCj4aR3oIc7o+ZQH6j9VdweOtAmmOz124DpfMA27npmP8aE4X?=
 =?us-ascii?Q?PLzvqB5rg/cbealIFw8Rb0/utGembcra5Tf70Wp2m1/3oczNWE9BPsLlb94+?=
 =?us-ascii?Q?NjmqamfcBV7MgTbGVEFZh7mn2PclrQSeyTQzEIS/+qU6NBGS10EmAmFfxGVa?=
 =?us-ascii?Q?kEaZWCJ6FKAHYBFcFvTh5rd8q5gXYlwxmD9XZSkVjqO9AEKrZ3fA8fqZVBtN?=
 =?us-ascii?Q?eKo+3oMinHjgXqLgY6sTXd7ggBg5iaAO1rooVau+2A6a4mQlDWkGGiQip4/J?=
 =?us-ascii?Q?F3HntxQ1Vqurr1zKtCbo745VwKJ5R9BUXEp56eOSNFR5UHsrxJEnDDIuwmHq?=
 =?us-ascii?Q?dNru6KpSmMeQxwfTXTW/zfRS1rqSX5hmBLb28lD2kRbIBzIZZ5Kze9ujWvzY?=
 =?us-ascii?Q?a7EDj4yMJDIDFvDnWGTH+BPNG3b89S8DNyQlvyilASm/ZUR0BFvnANjKdEOZ?=
 =?us-ascii?Q?Ug2onGCE2DQJ1l6aT9anEub5xqaOifFQ7caMljfjUUTB1t26gsjP/+2zRMkn?=
 =?us-ascii?Q?DSek8DLkbOjJkkq11e+DhsgRtYsSkOCg+ydc4td25L5fJGGgA6UcDt0dxBbN?=
 =?us-ascii?Q?jWrTTjlyZ+/imoxsv6ILNrRgk9V5IqvO1sajDfK7Sy8eQLxXstIbdf1cfsZ9?=
 =?us-ascii?Q?Rj8IIHV9hTxztd5gwYZtf3K87p2THLGcAbaWBnuOnislkKB+wTS7X1lj2rdW?=
 =?us-ascii?Q?svw8bMoObSypVWXBvQEYiLvX6zLZPu9vhhTs4caFrJp7N9eGgk9WhSUWsQSY?=
 =?us-ascii?Q?DqMHpsjEZqS46qPRBFwtK3cLyJh0+moEXyXmgK5bm1k+4rgMw4EMDlkXht5N?=
 =?us-ascii?Q?59svnfmyb0aS3KiniesipJrpEfzM4vEZrpk+rh9nIA0zIcRNFpIbSrlP6008?=
 =?us-ascii?Q?5Ba1+Vd6Rz8Gn0EHkpOj4lReRikiegI56qZ9q4YILP8OjfGRxVlF8CJUBYmY?=
 =?us-ascii?Q?BENgY1VQVViqom9gPmyk67TUWRItnlIuA56ZTDcm+SpuGeMlAtOLqAox1w/R?=
 =?us-ascii?Q?tFrSvudNj+nJlZGNsjLfRgRA62c6aT/l7/OCNetdZyMDpWgAu9GgIX+rDqvH?=
 =?us-ascii?Q?wKLCrghYU6uQWJjaaYGeqLV8/lrNRWb5otEfia+1eCp/RdTL33MPSdJ6tjAw?=
 =?us-ascii?Q?ziLQmojRKbANNfXga5FD/+nKwl12CGg0MVX2fuXHLSyxkeY9N3QOXAWpYmBG?=
 =?us-ascii?Q?TvtHl/js9HlV8PcQ9AIBqxhQ7w7PtNdl82T/9bIAsHRrwX98uZ4aBI9/L92a?=
 =?us-ascii?Q?3mliTltdiFrEWJMgluFEH+1Fx+0EF0jfW19vyAoGkSFtcfGflQqSE4IbdPV/?=
 =?us-ascii?Q?HFFaireiro8fA6jdcfdivjo+dMMOWWIJxPLy2J5YduFOtVZg8foFoHhzXmXB?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce80284-aa53-4617-ab8a-08de200d32dc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 03:56:59.5273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9vjoVvcpqRmfOAPN99NtaQRUqk9QMF5O0fgRZuVTwmn0kLE9IURIK4dXU5///mIHzRZ0oVIcsoV50GdNBh+DEiYkPOzLVVCgN0V3AdnvCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_195706_135752_AED016D4 
X-CRM114-Status: GOOD (  14.68  )
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

Introduce reset API support to EN7523 clock driver. EN7523 uses the
same reset logic as EN7581, so just reuse existing code.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/clk-en7523.c | 64 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 15bbdeb60b8e..08cc8e5acf43 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -9,6 +9,7 @@
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 
 #define RST_NR_PER_BANK			32
@@ -299,6 +300,53 @@ static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL1,
 };
 
+static const u16 en7523_rst_map[] = {
+	/* RST_CTRL2 */
+	[EN7523_XPON_PHY_RST]		= 0,
+	[EN7523_XSI_MAC_RST]		= 7,
+	[EN7523_XSI_PHY_RST]		= 8,
+	[EN7523_NPU_RST]		= 9,
+	[EN7523_I2S_RST]		= 10,
+	[EN7523_TRNG_RST]		= 11,
+	[EN7523_TRNG_MSTART_RST]	= 12,
+	[EN7523_DUAL_HSI0_RST]		= 13,
+	[EN7523_DUAL_HSI1_RST]		= 14,
+	[EN7523_HSI_RST]		= 15,
+	[EN7523_DUAL_HSI0_MAC_RST]	= 16,
+	[EN7523_DUAL_HSI1_MAC_RST]	= 17,
+	[EN7523_HSI_MAC_RST]		= 18,
+	[EN7523_WDMA_RST]		= 19,
+	[EN7523_WOE0_RST]		= 20,
+	[EN7523_WOE1_RST]		= 21,
+	[EN7523_HSDMA_RST]		= 22,
+	[EN7523_I2C2RBUS_RST]		= 23,
+	[EN7523_TDMA_RST]		= 24,
+	/* RST_CTRL1 */
+	[EN7523_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
+	[EN7523_FE_PDMA_RST]		= RST_NR_PER_BANK + 1,
+	[EN7523_FE_QDMA_RST]		= RST_NR_PER_BANK + 2,
+	[EN7523_PCM_SPIWP_RST]		= RST_NR_PER_BANK + 4,
+	[EN7523_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
+	[EN7523_TIMER_RST]		= RST_NR_PER_BANK + 8,
+	[EN7523_PCM1_RST]		= RST_NR_PER_BANK + 11,
+	[EN7523_UART_RST]		= RST_NR_PER_BANK + 12,
+	[EN7523_GPIO_RST]		= RST_NR_PER_BANK + 13,
+	[EN7523_GDMA_RST]		= RST_NR_PER_BANK + 14,
+	[EN7523_I2C_MASTER_RST]		= RST_NR_PER_BANK + 16,
+	[EN7523_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
+	[EN7523_SFC_RST]		= RST_NR_PER_BANK + 18,
+	[EN7523_UART2_RST]		= RST_NR_PER_BANK + 19,
+	[EN7523_GDMP_RST]		= RST_NR_PER_BANK + 20,
+	[EN7523_FE_RST]			= RST_NR_PER_BANK + 21,
+	[EN7523_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
+	[EN7523_GSW_RST]		= RST_NR_PER_BANK + 23,
+	[EN7523_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
+	[EN7523_PCIE0_RST]		= RST_NR_PER_BANK + 26,
+	[EN7523_PCIE1_RST]		= RST_NR_PER_BANK + 27,
+	[EN7523_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
+	[EN7523_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+};
+
 static const u16 en7581_rst_map[] = {
 	/* RST_CTRL2 */
 	[EN7581_XPON_PHY_RST]		= 0,
@@ -357,6 +405,9 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
 };
 
+static int en7581_reset_register(struct device *dev, void __iomem *base,
+				 const u16 *rst_map, int nr_resets);
+
 static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
 {
 	if (!desc->base_bits)
@@ -552,7 +603,8 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 
 	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
 
-	return 0;
+	return en7581_reset_register(&pdev->dev, np_base, en7523_rst_map,
+				     ARRAY_SIZE(en7523_rst_map));
 }
 
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
@@ -652,7 +704,8 @@ static const struct reset_control_ops en7581_reset_ops = {
 	.status = en7523_reset_status,
 };
 
-static int en7581_reset_register(struct device *dev, void __iomem *base)
+static int en7581_reset_register(struct device *dev, void __iomem *base,
+				 const u16 *rst_map, int nr_resets)
 {
 	struct en_rst_data *rst_data;
 
@@ -661,10 +714,10 @@ static int en7581_reset_register(struct device *dev, void __iomem *base)
 		return -ENOMEM;
 
 	rst_data->bank_ofs = en7581_rst_ofs;
-	rst_data->idx_map = en7581_rst_map;
+	rst_data->idx_map = rst_map;
 	rst_data->base = base;
 
-	rst_data->rcdev.nr_resets = ARRAY_SIZE(en7581_rst_map);
+	rst_data->rcdev.nr_resets = nr_resets;
 	rst_data->rcdev.of_xlate = en7523_reset_xlate;
 	rst_data->rcdev.ops = &en7581_reset_ops;
 	rst_data->rcdev.of_node = dev->of_node;
@@ -698,7 +751,8 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	val = readl(base + REG_NP_SCU_PCIC);
 	writel(val | 3, base + REG_NP_SCU_PCIC);
 
-	return en7581_reset_register(&pdev->dev, base);
+	return en7581_reset_register(&pdev->dev, base, en7581_rst_map,
+				     ARRAY_SIZE(en7581_rst_map));
 }
 
 static int en7523_clk_probe(struct platform_device *pdev)
-- 
2.51.0


