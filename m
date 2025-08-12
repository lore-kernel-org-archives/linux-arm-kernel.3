Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E653CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 03:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ40wuj2bBaYDAR0EiDJz5OQv+uv3dY/o432rDJNkQ4=; b=wQu+zAqTY28F2oVdNuqthfiQNz
	J4n8VJ6wf/GijcWh66EAGn0ekgx6KwP8Eo/nhmHV/G7KDVmbq1NCR2f2eGpXBmcleAex15zUukNol
	nXYIOVBBOhiKhJuy6nZyegZ5wPosAg9a0RsZu/dq1F68jg0pAYTChSEuAMQDJ91DdoOdx6gXszOB/
	t4MVhJzRPQ4KlsEVIz4qun86UTowqJsxHlLUZOv6uH7/vzt48lbpzG6ClRmhwWgYGWGhs0xxPd+AH
	UidoVCrmbGaWiVyuvafH1R23Fa0QGoTlFyZvqWI2tGRAl+ytqAMHqwEHT5GETZ0uSQhGVtWPNd42N
	q1FRqgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfwD-00000009jUV-3Q8q;
	Tue, 12 Aug 2025 03:44:37 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfqs-00000009j5M-2Nke;
	Tue, 12 Aug 2025 03:39:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utUQuMTHy/nK1AkgdFBPHbRTYI9taQYB7C5VeIJ8inY4IqmbUC8/mcxv2ldYCYXtVFevo8A7nAGvyKuA+0FyGKICPVoyUpLvK862CsJpNLy0xvGsixsmV8+0AdfUyB7iIbEXVqk6DwSznbNOGtADgrqOhJXWcKQXJbTMXdDwCSoRel1Rp7eja7XrjlGOi8LTHVvzCxDy3jCQvtGNW65W6EC7QTmSGmTBzNJ0xF7HrykRyZgi1zhjfBoAbBApzvT1O/5NVS6EQj/s8N4vfesnlbBH1A+PCqT3JZ2D7RqPiqACOHdSccZK/9ZCUNiZ4zmVYiHqoRWjYMqYc9N5JEO9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ40wuj2bBaYDAR0EiDJz5OQv+uv3dY/o432rDJNkQ4=;
 b=yruPFzCbUvtNe7xYdg5/dmX+85uybjk09OboVWBy/BKHRsqLbDegZcDonuhWOeC4t+pmvmwhSWEEujmA1eL6wgyXtlhucUdCvgslsicpBbz2MoCgzaaMwj6RgFVMa9HFk2W3xYEkYMEaY7hwX5ng9x1aY2sQaQubhhVr3u300ctfT6pMtwZfcOP58qsK7ahHvbUzL7N87gwJFt1hV8U4CpsekZUfNrwrq1GQdPY9VgepYyNWAoeX2rCILaIasb2z1UL6vvkJEzb6Twn0bZnGJtLLnPpGv0en5W66lvt6q+byv32Fpj6/7JoNOJHJuuD/G/Nx6q3eVOY8YwTtbqxWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ40wuj2bBaYDAR0EiDJz5OQv+uv3dY/o432rDJNkQ4=;
 b=hFGxRbrFAyIxOezb3jE5bIMCvOyTvTWLpC5B3vkDtaZZma8Ja9RWQ7okAUlj3AJji0klgCrMsNCaBlwH9bcdRUhW4kuPiFnQjkVNPZzo2521hDLLpb7w+D/5BSxuUdMRksWwiF1Dv/Mg1fqQfmSn3nUUYZQf4bD9LeRWOPlocPoBo/axNv2zvD8K3FoXp/rNVdtZEqLr//i47TTUWBZc4diRkHf16UxFS+16eRU9iLNWA3JF6rLslpMsvtI4MbMyQEmAjEKt45YjxbYZxormgF0rh89/jAZ28ZjC8ZwlIWGMkpIoZyMitv/ueRu8B4GVLFDrzERdeHtD+QG1ob+4+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB6999.apcprd06.prod.outlook.com (2603:1096:101:1de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 03:38:46 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 03:38:46 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Martin Sperl <kernel@martin.sperl.org>,
	linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 1/2] spi: bcm2835: Remove redundant semicolons
Date: Tue, 12 Aug 2025 11:38:16 +0800
Message-Id: <20250812033817.487565-2-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812033817.487565-1-liaoyuanhong@vivo.com>
References: <20250812033817.487565-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5d094a-653c-4d1d-cd75-08ddd951be4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RFSbN9ERPh9+3z1ypuiSIkHi0RsGbII1ofXYzoMKZyC+9ZoswsMvPaGNiRKF?=
 =?us-ascii?Q?JYwSV0lC6bF+yCrRxHOSvWMTW4uc1EmqE2YB3KA2OIAyLm8umJy6lrZ/rd0j?=
 =?us-ascii?Q?DtFeK62zqEL/e8XtxBNcfLX6+gosxI+E39uewff9ijmZfjR/9Iwmx2E6qspm?=
 =?us-ascii?Q?g2Zh61QLE2zc07n9cnjGxdyR4Phkb+1OzL6uZGcWY3azyIMLHngKlZGNdY39?=
 =?us-ascii?Q?bzPbZTQdOKxkIiUtP+YLim7wsHdOn2Cc74qqCZTSgKDOTTlZE0kh3lDtnCAE?=
 =?us-ascii?Q?qm3bhTJ4dylt9FQXcWW2Hv3RFKgALVpxwAKCo47YoNSuW6KFDml3iX1Elu38?=
 =?us-ascii?Q?NzddqN5AlZ2J6+8naqqxGVRYsWqWPKaBL7Q//DcQUPsnGSwv9bXZrI6K8pR9?=
 =?us-ascii?Q?I3ZUQ6IX3VPvZFjXBTrx6tmrSA/Ftqyu49WpGqEXiT/eYN8DyO/+866eeBFH?=
 =?us-ascii?Q?RZ1r1YISL9SX38TMI7tQBcy492Q6Bevx0IWR/ny6K/uwgLnQE8gHF6xqL52A?=
 =?us-ascii?Q?AD+42TDUx7Buii71n0d8ntY4ZUdC1QEsnU39ekSzBJjaWicYiph5rCwH8nRj?=
 =?us-ascii?Q?5QnpkCKNARHvBnbfdu6ncDt+7dthDGi03sud9i+nwx7OHfKjtExRTsLkppES?=
 =?us-ascii?Q?9kxftRBfWKoS+ytoUn7h/MOwv4yJzemKYtURdbHSSwk0aVvpyGU+HN0tuQac?=
 =?us-ascii?Q?jjyN9bflB7BYLdoye53K2TeO09VUp223+Eh6UdLp+EOJQrMZ6WLev0TZ3uK3?=
 =?us-ascii?Q?CiMHmczb2Uyn6kUeFwjH+cak6pQ5JJOZMtGt8TUrjuGKiXFGR10D7qrMBmw2?=
 =?us-ascii?Q?ULwebdVPsTy5TW0/DSC7bA+N3lK00zxSTx8Ag5A1Ntdi2+q40ksoJU9jN1LX?=
 =?us-ascii?Q?zCH63QD64mnIWgAkVYvOhMErjaC+Y8Ce6ig/aoTyfpzJS8a1M08lFQulBokB?=
 =?us-ascii?Q?PuptNzbODb4+uUXWuLKgToNGhPihyI6NWQ0TGfm9vhslxRpi6UOzZ5hsYu+3?=
 =?us-ascii?Q?DhNxFIwZefhKWWo6JWgeZIbSxaLCZ65AS9XZVuU6zh8jqNT0SgYX9CT3uK7u?=
 =?us-ascii?Q?xm+xymfUQROigEWn36cyy5JxxYFcnIKEcI01xb5g/SjQNmYPJUMssw9rlinc?=
 =?us-ascii?Q?hsK9ylquYc+/QauXvsfFSELODhQYbmh7RpLZL+9vBtu35+2pKvLOai076iYj?=
 =?us-ascii?Q?yKurAfSUec8KTZVJs4bR2lUiGPfYxW8uNjxLnzdXWTIfcuBz28pwKjh1rOZJ?=
 =?us-ascii?Q?+l62+s9lU6ek/kS0/eTmwOXMoezmkTYjiOxFBrnyYYXjLo6EudREnU/CaOrm?=
 =?us-ascii?Q?06jr4pT4ruII8YunBoUQvFjgurAdDrQWpyALa8or9/1U5B9zT28KSKLQ129h?=
 =?us-ascii?Q?HWzdP6+gb/GZnnbzFP2Lyul89KfiI1E5qaSl6ekHbWsf9PNR94LvUbrLUwuu?=
 =?us-ascii?Q?kV30OwwkCrVW6PLt1XFXZQBOAG443/mtb+/pdOqOISezOkKQ23PotQ7RTjRg?=
 =?us-ascii?Q?d9BNefdR6t7dfvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qw0gQDZcPq6KffE65a2zu5V1+RdeUG7pf/FnSqcplCUMjmCv2R3jo4cs4Ph6?=
 =?us-ascii?Q?JP0M/i8rsAZmyEs4vaQ7DOt/Em4t1vMnPJU2pB0S+PxcnxMUwxELaKlgHQ7Z?=
 =?us-ascii?Q?blb2hWp22vLoOdJZ8ygHScxHMj5aBZ/eNKtAU/NV1kqym80oGBJngEflyZn3?=
 =?us-ascii?Q?ky+fUSiRkUF9BL2e28C6JufUBxwnGWGrNJO/OlODuTpzbZfvBQVuS5Is4hiN?=
 =?us-ascii?Q?/gj8hzTRZ9kD2SooXldxtkHVAWrO8u3G2YnuD4tCQkYCOUI2yc2okXDTzqkk?=
 =?us-ascii?Q?7F1GdCeL1EvYReEbZOC5gtwrZikAuEGtVQBBjey2y29wBbhp3P0pGBgCKJZ7?=
 =?us-ascii?Q?rhMpGhlZVJvAtLbcddOvAr7cSq4FXnzcxOqH6LZENzotDI9cr4oiFJjtzQ0T?=
 =?us-ascii?Q?JnaRDaaeN8kBA8eAjycHE95Opfj5YWTGpkRcI4brUsa5L4sVM0qsegVLiseE?=
 =?us-ascii?Q?HMQ8ewi+PNFCQnbsUsQbf07j7opTf5bKcT7mzhmdQ8/ZSv1u4gyBK/xjPcsj?=
 =?us-ascii?Q?DU+YEECWEBK9lV5GhVvyPhzpaapb3I4WwNOza1XB2za1YaplB1Q1gWYi9GOA?=
 =?us-ascii?Q?dnrTVUqb385uznpJwFJxiBBCSrJOCO5+W2PQtMhud69UoZ+vDkxDmUdX4FfO?=
 =?us-ascii?Q?eqdXrn2vAVjTiVzfw+rh0VOMBOCRAR1tW2G0GzcL4HpUgk7ZnFqXtqup4apo?=
 =?us-ascii?Q?Mr+/48AhEW+yY130V2+dfmbnisbR7ak4ZHN2Dp+b7Xk63LRe35eedWAmIy5C?=
 =?us-ascii?Q?Ozu8SlxFRQwsxlIE9GKuiQBGoGfusxpDmpVf+0nwpbMXqZjxwIp4Fb0xiwBO?=
 =?us-ascii?Q?rMgux+kCfZ2IXmaGa7SRNraYJgfZEPXWapezddMQByM4ETK0sGmnB//Hclwm?=
 =?us-ascii?Q?b+IJaw9XguEYlO2L4kPy2f0+gWmY5n7BwR/YkFuqLzMNfg84yzZ+zBhSVI/x?=
 =?us-ascii?Q?2KdR9TuA/ON52kPpJqXewWvNqhNxi26A1PVzy/in2JbD00NXRgDGEC13jN22?=
 =?us-ascii?Q?876bjAhjQbLvLSTve+xNySsw3DrFdy+/+vrTp/7AMoNSPr8+ZsHiyUDwDJQy?=
 =?us-ascii?Q?HPjBWNmjOR7HFH2/N2Nnr3eUFijVA3V6hIruaYdu1SnWlrsYaTtisDD4im0l?=
 =?us-ascii?Q?vc5EzVfiW0crAwCFpBDkwNYuXAKT4ihV3p0sr+2n02FI01LFWoArBYVD5xcJ?=
 =?us-ascii?Q?LNjypAV7wWqXC2Ppb3ABTT2puizOZduFrrelLdK3VledM2NHsgTMRAJMN1Kl?=
 =?us-ascii?Q?doZt6WQTIOD9wdClANC/8xrRnctMi6WBGTa6c3oDS6bHarhLsjIH9nAmEBJy?=
 =?us-ascii?Q?M7Azk5imbMRAENZyrUnCaWBAJyf9F9YanwmeVEXDugeN9+rVfxGYZKZl2SN1?=
 =?us-ascii?Q?SMAj/XNtDfC3UyOFoEJ5RpCwmF66qTWszyG6U5ZACIRIV3ggPWKRsywzAv4M?=
 =?us-ascii?Q?vYkcv5M4OX+cmPXFag4Gj5yQrkF9B88nQsI4V+nuk1RABn2b/uWXU4QisZpa?=
 =?us-ascii?Q?HJIgHF8WiP4skwlMA2l9qIkhBmAciH3xrGHThGUKBu6fZYWy2LxXttDX4p2R?=
 =?us-ascii?Q?HSDE3eLHLUu9JWYvoXsP3Ut0dKCImlJ8CJS3pW0l?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5d094a-653c-4d1d-cd75-08ddd951be4d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 03:38:46.7050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swv+/t9vvQwReRYURe11jVhctLM+aBO8VgCAHXxVlyjTb9all+cZQ7uzW4PntcAk9RYMeyQwWRSvvvhrLCr0gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6999
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_203906_610006_8592A27B 
X-CRM114-Status: GOOD (  10.19  )
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

Remove unnecessary semicolons after comments.

Fixes: 3ecd37edaa2a6 ("spi: bcm2835: enable dma modes for transfers meeting certain conditions")
Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/spi/spi-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index 77de5a07639a..192cc5ef65fb 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -622,7 +622,7 @@ static void bcm2835_spi_dma_rx_done(void *data)
 	/* reset fifo and HW */
 	bcm2835_spi_reset_hw(bs);
 
-	/* and mark as completed */;
+	/* and mark as completed */
 	spi_finalize_current_transfer(ctlr);
 }
 
-- 
2.34.1


