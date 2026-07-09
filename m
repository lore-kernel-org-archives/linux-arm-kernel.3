Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD62C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 02:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a+j6nItH6BYD2cUBRLBasjZcuAYxxdRZVKNcCU4rHk=; b=v+NTmXS3pNVFRIbuY4LfmfI8vh
	p1+5gBGt0pxPyb/IH5w3MAr4T8zu8g2mwAOAN3Do63JEnQUiOlNePTlrtd0dJ1cJyJTm5XCQUIpAt
	bgD7rZ/cJ5fnEIDXpXIzUWp5/wCUEM/5r2RZb12+txyrZ8AdKnGR4nI9xx9vBBlu6UWWOXeue42AI
	V1FHXVxjspxeilYFqI7g3LEn1w574/xqR9k7O4uSirm5SZnLIWkmrRrznhWN1AhqVpWthCoJG9zdr
	Tv6UNUoLOx3vXS19FRnHvYQm/du0MUMiHf25FJTI4tX/gV6AmQ6Vido/0OuvCOOjw0irycNpDaVcW
	3wt32wOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whe6x-00000000n1X-4Azf;
	Thu, 09 Jul 2026 02:03:35 +0000
Received: from mail-centralusazon11010027.outbound.protection.outlook.com ([52.101.61.27] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whe6w-00000000n0C-0IZJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 02:03:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQ7lXrvTiX/vgTIRiB8u0zHKngZknS4Q9VIy2dae2xUOrytM1Nk/A6cqo/WRfVb5DZk8PJ0dAxldeOO3soueAT9MVXGso0REZrgPiVSDq0W7vuqtgBMV1RaF123hRC2ORw2Z3wiPc9UPiOl4Pm4Iz+HABm2soTGf/tKZyf6opClyYAt+R1ofhy+sR/iz4xa0muf1rymDt5IeDjnNQohJ2DI/DQSonifGDMtondgPNcIsV6abfiCHVeXA+iENnraUXh8BModBMYgLclalRFGrEgnWmN+4KUrjqmXu9NDiCqzzvsmiuhn2JFiMIxV2mVzAYKSmDUt5d6QLvJowy7vIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+a+j6nItH6BYD2cUBRLBasjZcuAYxxdRZVKNcCU4rHk=;
 b=C3+w5A83LVeZg6xTvbHq7u/k/ukAqhDUR6T4mou8d58XOO79VM1Hw84V5KKn3yjpIAQqKf8uLMwt4a8NSYzuXT5neu+BLnnujmQyOk3rvbpW0AXqtuIhaQy+Rz3S9W3nh0eQy9WXGNWIEFEh0SpwWngR4sqeM8LCTy7iOC/HeYU+fBWkTsHZHyd8HvZxhGeE0Ef859ZOj0P81HML8gzKauBnGNnVNLtERRuG+FVpR2Zu7BhoZ3ukHM6jLQ5O71G9yA1wec4+GRdbznsINJubgpkVo6uQfRvxZPaphgWIMl/uYBPHJ0LL3XBbbqLUGvqMhMTOWbhDMap4mjJuURBl9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a+j6nItH6BYD2cUBRLBasjZcuAYxxdRZVKNcCU4rHk=;
 b=n67YlvqIhVXnqEbEzSj3ZJeI1SGpLPw1O05av5Gpva4Bh/7eBGAZjH0akSJPnJO1cvbLw4mowtOjZB9kJhYKW9MrYKR8MYgOFOpQaMnNv+xmtJO9aoqc45PaCIecYTbWglYqBbm+jqr524dHMfdhD8FS5h/hYAxFF858o/ZgCKi4pI9BwDUOik3fyKP8l9lLMlyzh+ygEOo1yzB12JoKptGmcBkfuTKLGCpxMuvO4gmxxwbj4LzF9qEUdrJT+JMYxuat7MmKCpUrvbeasPN9yVMxChHuHLOz+QYgc0olJgiDhcsUxro9XQcTh8bbRsVaaQvnP5uzlCBB84vr9ogkew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS4PR12MB9818.namprd12.prod.outlook.com (2603:10b6:8:2a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 02:03:27 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:03:27 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 4/5] media: s5p-mfc: Treat bitmap size as allocation failure
Date: Wed,  8 Jul 2026 22:03:10 -0400
Message-ID: <20260709020312.133977-5-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709020312.133977-1-ynorov@nvidia.com>
References: <20260709020312.133977-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::32) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS4PR12MB9818:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5ac7ba-d87d-426b-969a-08dedd5e445e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: vIj69aY8ukdpfYh0lzLrdrI492eSCpQ+KbMqMH/zLRyNcqkBJsW2q9C8SSUTzcH9BRRmk0LwkdImSE2RPfrZSNu2GJ8rn3C9OJTHePcX8dqTQbbA9VYVfvDd1kHsFhio4q7M3jmPNX9NOK7nKecGf1ZAFZW3/CYBazheeXSm0DsOC4vD6lXwpsbkO2iTSzEYBFIr60HNQOcMhJJscBmnA49H8RWslDpz5FMvX2tHrg3SY4NdD4nsCKKDWFdxmQzBjY+4BwLq5e3gehCnR67TSczL/kLsc3q0ps+2eLAFyaMead4V1CfjqloaSC1qlm++Pzsw0jqnUXt6jNzMmFGIaY/zLFCRv+7OqoayL8lkL2r1WYPW3arx3V6EWiwQ4yJTscaS4Np4ZpiTZt75UYRtuNOUSo3qjSNIEKM6awoO0U9oxSGHFqva14Ljow3hlK2eBOyWbnU/BdUKTPRGhwFJC+sBYqeRqxnWPfs5v026G69VkwPltwl7YdK489MdFCuLJy4uLIXCz74mfuQTKe7T+o6yNe/28WrzTw7zkzJuNL+sOF6wqbZY4uRCdws/20Nmh9X1cGMGmIMHfgA/nBrHuskQsmXbAtSCBv1bi/MUG+JpHAoFjP2GiEwFwqNrGYgXSzZlI/X4JBojp9I8UnfxXIDOTBBdiLEjKhLZ4zN2fng=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oyb/CeHRBklt12VK8r7vCo9gWSS/K+DlAs7iQ1Cb4TVl9Dwem6uV5x75eHIa?=
 =?us-ascii?Q?OZ9xStx42hRViS9AFnYtVbUGDHc50sDNaxtQWojvy3SyGDJQk35IOPRaATxW?=
 =?us-ascii?Q?NrQHGihxu2xDmfnqE5cMLPWutRFMnBtx+aNU/W4wHja3CPE72WyPtFXcBshi?=
 =?us-ascii?Q?qQ8JyLFh4xSYhAIJNro4kUAxlSmmnCtKMvwmXvX9OerYYHnbnVe4mMcyp5EV?=
 =?us-ascii?Q?l3FL9gjK9+zMjnZTvy0Rb9BvmiqXwS0DSeyvfJBWO22ddjOzVOLNvUdpYC+h?=
 =?us-ascii?Q?NzMJ54mx1rR4p3LX8hYjWKvq/XOyjIlGvps+ts+VJxG4SsYTb7KCmZ6mfdel?=
 =?us-ascii?Q?qXN7sGP+Zeref58/kVuoOB654OGyRa0hOmKLEwkKm2E2ZPVjFupXOpkboxaI?=
 =?us-ascii?Q?V0CPlV11SCKf0+0fILP0+M3Av2y5W8QuQMgqDKzF7uo+cRyWduX3/y9DOTMj?=
 =?us-ascii?Q?xCzSqRlOFG9/PslLrYnuuBrYsDOWZgUvU7sGnmem5g0zjyQ0WnQnuyNzTzJG?=
 =?us-ascii?Q?c5O4NI9UvPKz61+2sGHTabjIbKcZIsBH2GyT5r82V4PoNnRMZECAyAwTTe5S?=
 =?us-ascii?Q?8AQtVqNjra9hCYCw+Gt7S1X0gqmVyXnDQ595pJRsTCfeW6k9ywkwu0pYRlpm?=
 =?us-ascii?Q?iUWLr2Y5G8kPeAvHKBFKegbFSx8XgK6k1LJsJ5ACgcvTqZE4e/41cPGudjK3?=
 =?us-ascii?Q?H6rEZVVVzBXRqM31un8h7jMjBFrqnFDhM9U3UPRIWXW94cqPRFc9dWyQGtiF?=
 =?us-ascii?Q?eqVdI+Bgyt7zybiwtXJnfeSlcvoj38nPx1Q5az+mtOLyIDLwTWchyDTL0YJO?=
 =?us-ascii?Q?rek3CwYQAOIGpt4mAqFJv3gsdNnZeijWcbOw/4gUMGCFBw1hOYZkTGCYD0IY?=
 =?us-ascii?Q?7Wpa5Shu9iTX7hVVtCcsIAmol5TH8sV43Twb5MAqIoKys6o4+JgqR4KdEOEs?=
 =?us-ascii?Q?xcg0AtjAic5wpkFrmqKHAhviRmFkG3FhV6+ZVw1B1UUaw/SL1nmvtY94NEhy?=
 =?us-ascii?Q?DtzvTJL/2+nS6DQgKOKv7M8ATuMGPCh4fV6P0ckXTLbSCbTP9CIkqPK2BLck?=
 =?us-ascii?Q?hHpu0QaSj3HWjOxhGmI65gLqGFPUOaKttQV4FNvMYdj3MZniJM1qW1RWHKD6?=
 =?us-ascii?Q?xauy6X/r7vGee2w714eia/4HBql5x1eNbBQtzfQKnB5odhuZcAz/vbEMDT9J?=
 =?us-ascii?Q?5jS0SlFrvoRfK/cVkz1BjPuvSpUSYvxgpO6scJL2PeoRpVehpOSwik3nFjpi?=
 =?us-ascii?Q?HE4mH9L/bimaKrplL45dVMxa773mWZanMEUNuo+2dPwjXuTzdF2sKeBLS/8+?=
 =?us-ascii?Q?8BS72uhemZzjWa5JhT0mBhtifzo+Up10GnB6hpvRf7Ki3Ndlue8bgf+jHVpH?=
 =?us-ascii?Q?fHG7CllDkutXBTBAhEklwc+dCg9DCGIgxkIkGGK45Rq+Td0X/y0jH6Tfnob6?=
 =?us-ascii?Q?40GLbF/WPGwNxEzIDSSN5b1RUcyziE06ivcXLR9UlgmUwcfXmrTttz59IngD?=
 =?us-ascii?Q?RCqlI6DqoqpStTaT3Dn6Yf3WYRgAd+qZ9zSEI/kr4JDBymH/znX9Qn0+yI6M?=
 =?us-ascii?Q?zhEUYexTxGdXevF/2lTPaV+t5Dl06FJPrJdb5GJMKiQGRvlCiiFX23U2941Z?=
 =?us-ascii?Q?zBHlZGrZG/NQ5sqaV9BCFEF/ru1VmJHslU3ROKTaetCo1E3vaxAm611AbeBE?=
 =?us-ascii?Q?4xZH4r7HCwWdG3y+4FfSQziBl3iUUlighM8Rc4DOiLpOLrjTfQcqmJ5dwUqA?=
 =?us-ascii?Q?yK7XFc2hQw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5ac7ba-d87d-426b-969a-08dedd5e445e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:03:27.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9FpgNM+BXfxtOc6ee6nkHQLrAhMn0I4MCCc0vJoF/amcS3R9Jc632qFNXC1ols0X/rrTAHET924v0bmeJdXVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_190334_127281_35C0CBEE 
X-CRM114-Status: GOOD (  12.28  )
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

bitmap_find_next_zero_area() uses an out-of-range return value to
indicate failure. Check for values greater than or equal to the bitmap
size so the caller does not depend on the exact failure sentinel.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c
index 5ba791fa3676..b25ad2a37196 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr.c
@@ -43,7 +43,7 @@ int s5p_mfc_alloc_priv_buf(struct s5p_mfc_dev *dev, unsigned int mem_ctx,
 
 	if (dev->mem_virt) {
 		start = bitmap_find_next_zero_area(dev->mem_bitmap, bits, 0, count, align);
-		if (start > bits)
+		if (start >= bits)
 			goto no_mem;
 
 		bitmap_set(dev->mem_bitmap, start, count);
-- 
2.53.0


