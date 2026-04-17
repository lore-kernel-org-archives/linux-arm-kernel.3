Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FFCF436BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 18:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yO75ubrudtPr9DnNOTwe9S/UAQ8T4cAy84+gi+KCi0=; b=Sttf7iYWQB7r3hTUpEgi9PoYLW
	NrN8uHPalVgZ7bfMKVSsokPIr3/hzC2EZtd0ncU2ZLD+9uGVc6vchVU2afpHuxYw4EW3P5BEnPbA4
	cC/Pq6FSFIda3eU8p3FaCOkOh5MtuOyXkjwknbq38rV6AzSI4onQ8DisXomzrfG47MzMj7ssPn+KI
	0xkJ/BJvsL+suxkY+vodIZBX3RhT4ypMVlYkYjGX3WUZcGpxLCx2lFmiFGQ9D5qbWbJFIwj7zOhnO
	iNbIDr42QJ7oLIO+D6HlFvIViQ+c3bhbhPB3flNWrtQRAGvktQQe9HQYDppll0C8WJLN6TvmDF6e2
	1Zikn2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnUB-00000004LrQ-2N8Y;
	Fri, 17 Apr 2026 18:00:11 +0000
Received: from mail-westus2azon11010001.outbound.protection.outlook.com ([52.101.46.1] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnU8-00000004Lqf-07DT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 18:00:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjATjUQGXjLUhj0M8LcZ+7yjGnedPrtXBWX9qiMPbdhZwfZHVZGIPbLMwVhU4nfySCFoi7OkHZdwEeHkLLu8R4l+lrWhFS/oTgg1HHfRhhPKbSDTV32likJPuipG9q8Vj3Z+39bVf0Jx4zNz7YBRTxl5ZU155fSv1Inr4K0fIOFk19QoqKNd6cwxZQTFpAP6UYGN69Cu3/m3qFQXnfahVDPBDkSe5eXG3VdZXlCFTVgq1kTnAgmoc3BIY7Nk4lnFVMbGjXQuDZeIX4tyqUVTqtY2MefeyWyAdPIl29mg+fvYiXLDT4Cp9DXgCqkggyORCX/g5EykgXut2b25/4T2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yO75ubrudtPr9DnNOTwe9S/UAQ8T4cAy84+gi+KCi0=;
 b=DKG2cUfuPF+zYYkMmI7B2EKM0CLFpvZWeiZqGPUrVncF/tG1D/T+Wp9cZomYaTBfxnUHyMmS4UyrVULJtnGTr7ZV8Sozstdhuu/4XJ7nH10+ppcH4/dGM4QfOyZzUk1thKv+qHzHzCNcdcHWHFUyi2TKL6poek4miskPxqh5lEK2DRh58a3R0OylBDRELay7SOetCfwEztk66JjdwUbf8/3qiY+5iN4KcFFqc4p3LkL0jPvTmkJ+4XLtgToH3e+wauAYDId7hGvYRwHTHJ1qoQPrX/s3SaG90SBRdfqU5pzcny4gOyw3x7D6xsXZei71JjjUeVMmNeA7MJib50bPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yO75ubrudtPr9DnNOTwe9S/UAQ8T4cAy84+gi+KCi0=;
 b=d40N19+NOGH/68x7dFfsdu8MIUkSfD2Jd6EXnI510Jw1c7dufHIVpHKEj6x7EwUw1Iwlcfz3mo4kWboyb7SuR88g/34Lckv8hGvHtjKa5pbWVSdB7bL1Z06HBLAH9se6IOf8CVwkOG1UH05pyinkX/6gmeW8rkWewFoi3VwcLa3FdcVfH5hMECUKkP/ET/YImhsVeycGf60UQmLi08dXn2MJDdZfbupY2yrLQaFj9t2ZYupyaCNaSdUI+uDpwCVMK0WAC6AbSERNpYX4y//5srtLhocCOIrsAVORVbefXoT9CRU2KXK5xu3kVtFaqOkbFQzOjNCO8XQW2qjTM6Kw5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by IA0PPF0A63E7557.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 18:00:00 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 18:00:00 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH v2 1/2] gpio: pca953x: drop bitmap_complement() where feasible
Date: Fri, 17 Apr 2026 13:59:53 -0400
Message-ID: <20260417175955.375275-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417175955.375275-1-ynorov@nvidia.com>
References: <20260417175955.375275-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:408:e7::16) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|IA0PPF0A63E7557:EE_
X-MS-Office365-Filtering-Correlation-Id: c0bb62b3-0a72-4cc4-09ea-08de9cab24ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: kvufyD/Mni1d2WatGzhdJzGJP3BpyguI0Zce3ahDBTAkrBxvs+eylElPZs53GTBW861XGPk1pAOADHGd0+VML5xcFK4CthI8hPvreSJnU7tfB/BXRS5ZPz65FkmCXPWDJQtIy1f5SJIVjBZIK6Y7CqzAD7WjGclpy0xE0Wc2x12sq50x/QK2QECzxyhgLlBkMcFlKNb8DhgXyE2baaYNCsypiYIAPk9hFEof4JYt9RrnKgGhN2KumjrbNSOZg+wS0Jl9FFGegZ6QdCzWCfAdZ0FnoOj/4jk1+nD4cctTTm0Lm1CNMp0t7IV2tYAUZc2YxpfJLk6iPf00za6qKdjSJVgM0AbuNkeVDWyFKnLvPgyQKa1v7hNuaUq4pmoFcmwQj6hP+RBXT1ZmcBaAMH+Lq/9qupNevDjGjBHhxMR+Ft9AzSeQsJcuvEGaHbXOShsS8o5ktnvCz73nyJecZBtc+9GPBXB9lpSwku4qx+af5P4iY6GTC0UyRpVhHaGUVe3l/6cCxhXTg4hnRohdR1jc0PmxRq2OXn/lro8yPkhEqZu89QI5hbOFjC75PYI7u1neUFp7vud1fWiUVq/ocGbRQdPyiD5BfsLLohWJiDQQsma4SsoV+4ek+QnbOR3m3XkJ7tLKg/LCK/CudrRsl0C7uedIQ7bJYlkzDTNYylUXQvQ3I5BMywvnLpP7BJUHHdVAbGXAaEbcu38qbNUU2x6ag7ZO74I4fmlCU9X8Jw1Y5B6E/5ksijbUr3VuN+v2vwJU7MRFFXYx7DQp1VIEtZPURQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UyHIUwSu0W58zZwmt7viHsrkTUbaieTDM3emSSIHiwDlL9f4SfwBiXPX21iN?=
 =?us-ascii?Q?+dfZCbK6Sej2apWnlV/5d/mfKIFUkVItXtsio3LhETi0YmX//DpPLnSTb07x?=
 =?us-ascii?Q?moho5DPlz9D4h2NF84mbYsL+gmrCk9FDQPvhJSDgNs8Uit7hcgf8ycIt7a5D?=
 =?us-ascii?Q?m9xQEDOLRiSaXww220D4IWVdgel976ZdhU2oW8f/KifpQs361caRxA+be0Gm?=
 =?us-ascii?Q?moPqH6ltV35Rie4VJWIsngtAt7tRWDwQUUfcxDWgadSKVASChoxZlBYmv0k+?=
 =?us-ascii?Q?QF5PbMu3b2Sa078l0C0cVOqcg9T+/SqdtcPMCw0Ts9FdBdxLqHNdBNSup9Z2?=
 =?us-ascii?Q?cq+0k/bTYFvP9tin7nmh1rOfAXi6T5ip4mMMreT0QsnxMCJIoxoeeNaSFE4h?=
 =?us-ascii?Q?EXAfVBjq3USNTJldlreqCwKZGle5AeRPxY8P0ikuBWPfiJqShZ4oe/LoQPUO?=
 =?us-ascii?Q?CnfzGIX+/JAgiHXObBx/5qOubmYFa6i9Tm04kxaeVzh0gL4ubh/hvlPOMPkR?=
 =?us-ascii?Q?AqWg45lwNlHxhcO7m8XViLEFZq/DlEVWYhR0R83WPNG5XDot+bNOu2EAy446?=
 =?us-ascii?Q?g862L4rn8WygyfHrl+R0qMbro9bMIFfIJvvYkKScDfNnPVUstt+p/cALJ+QP?=
 =?us-ascii?Q?6NqtXgu4A2+GyiSTSy6CMqD4ASmsrGisQK4lFtoucYb2fUblOKkoVhtQNVGK?=
 =?us-ascii?Q?7LBzYSun0WbxPt6EU1jz4Ul+snj7mj+caQAAVW5EqFrfKOeF77NhoYEdaspj?=
 =?us-ascii?Q?vHrtJnUSLowf5/H6aTDlkDn7p4vPUcFXaNbklcefkflYPQ6dEZBUwnOnqcJv?=
 =?us-ascii?Q?N76YFID8R3ufxRYfIPx4v0BZMFA70eZOzX4T9r78LU67CvOo3xf4WiD310d9?=
 =?us-ascii?Q?n6PaCSRREaNXLPa7nIEw5g5PGi84fBMZ/ttFnoLCuVgs3TLle4vr7cegFvNo?=
 =?us-ascii?Q?aJDtI0UKdmSYnyjUcAZ+hcgHys8Ck0gQTvcHMj0ucKQirqCnxMnlC6FCniF5?=
 =?us-ascii?Q?662GaRDc8hglhlw2yVlW18yJXiIBDGPwFhAREvR1KpInsLbbS5o80LtgkdgO?=
 =?us-ascii?Q?7ZCBYrBZVwSohWiSmWtLQFmA4bJLSYaP6/Ftyz3poCZ5UffEhEA7mzMqjvZD?=
 =?us-ascii?Q?wqJxt+7u+ZJREWoEPdMfF7YnHJTsBP+wA+4ClizB/fwGGshIF+0esHAYrJi5?=
 =?us-ascii?Q?XR0cWTd7QToowhNi6i9LjpAfpM6RVEKh9QQ1fGuNv4/Vmdh9QYZuReT0FNEt?=
 =?us-ascii?Q?PkkQckZonq0mmuZfbH4U3wwaujQBVkmVEIfcoTzt7FaZqiP299V4GHqHqSOi?=
 =?us-ascii?Q?Hv22bXh6c1JF1LVFUg8hHSD39dzDUK1a1mO189BE7wBod2b21qkjBQQd92ED?=
 =?us-ascii?Q?syi0K9vxjgVe8z8/jpFIkkkHbgS8Zw/JRLbzNEUDYDyjq/jvbvGbkZ/lpCLZ?=
 =?us-ascii?Q?PQ7wtSgum5RLUUsauKfA+peR7zVoTHBLyqqXuqLyDcOn+f9dhuCg+7gBusWI?=
 =?us-ascii?Q?NH/KwfOOCWGBwHU/xFP88yf3i0HZuX34SXDEeubN4iwxKhRG81b6OL8+1o1G?=
 =?us-ascii?Q?12UgTEk+GhdGYR8tKZpnABLQKp7nS39lKvyCOkxuEMEFB6zkRaW/YjrqUq5S?=
 =?us-ascii?Q?O80gS1BMAcwMM+E881D6zBP8E0yP8qdhS3YUdTa6sHFAOg4c96xWgAqLmBNf?=
 =?us-ascii?Q?bs0qo0BFGoFoPRyc6chDVJB/AiEaIUOJ7rKYR9RONHUUcj68v+8kJ9eVdaHi?=
 =?us-ascii?Q?nPkdxBGy3+6Okvnn1+Ykqi/kMmGDB0DZzmIm30VqqLB4TBPzvg0P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bb62b3-0a72-4cc4-09ea-08de9cab24ef
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 18:00:00.7313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhewajTZmqkH1qOKvgBH9258lJ9LUXyDmQcpUxjqiHHWtRZu5gO/loM79r0Nydv56xyqWvPmLCPIdjhi5E7Xpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A63E7557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_110008_090262_933A07DC 
X-CRM114-Status: UNSURE (   8.96  )
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

The driver reproduces the following pattern:

	bitmap_complement(tmp, data1, nbits);
	bitmap_and(dst, data2, tmp, nbits);

This can be done in a single pass:

	bitmap_andnot(dst, data2, data1, nbits);

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/gpio/gpio-pca953x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 52e96cc5f67b..1fef733fe1f0 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -877,11 +877,9 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
 	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_high, gc->ngpio);
 	bitmap_or(irq_mask, irq_mask, chip->irq_trig_level_low, gc->ngpio);
-	bitmap_complement(reg_direction, reg_direction, gc->ngpio);
-	bitmap_and(irq_mask, irq_mask, reg_direction, gc->ngpio);
 
 	/* Look for any newly setup interrupt */
-	for_each_set_bit(level, irq_mask, gc->ngpio)
+	for_each_andnot_bit(level, irq_mask, reg_direction, gc->ngpio)
 		pca953x_gpio_direction_input(&chip->gpio_chip, level);
 
 	mutex_unlock(&chip->irq_lock);
@@ -1005,8 +1003,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	bitmap_and(cur_stat, cur_stat, chip->irq_mask, gc->ngpio);
 	bitmap_or(pending, pending, cur_stat, gc->ngpio);
 
-	bitmap_complement(cur_stat, new_stat, gc->ngpio);
-	bitmap_and(cur_stat, cur_stat, reg_direction, gc->ngpio);
+	bitmap_andnot(cur_stat, reg_direction, new_stat, gc->ngpio);
 	bitmap_and(old_stat, cur_stat, chip->irq_trig_level_low, gc->ngpio);
 	bitmap_and(old_stat, old_stat, chip->irq_mask, gc->ngpio);
 	bitmap_or(pending, pending, old_stat, gc->ngpio);
-- 
2.51.0


