Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16712C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 20:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yNO6lqS3sKk/dK81e/jgzyQrMot2vLvXAhIH3zdfwg=; b=CcQB+jAX/Rs2EnoVkrii8/XF3W
	SySTgmpmGhrBaPEzG+XchykSQ+I8KwM/WZfnBiwvEOps4KWlIsw/UsJTtvh4h3nU7NibJuo7hqL5g
	OKUDloqczT9TQ0pC2xNyfb5e94TUy1D8gOADdfILWc4w4aWeEFYBOH+1uVHUn7NuxV1kaOhnty17+
	bHoDVy0BSDFEcDoY/624Ro9+uXZE7yNLfdsK0z+5pF27b6r/YAYe4Z2QWKCp4i80UJTDOhnHt5zn7
	vTxF7F++oVD8QtT19+HQN6NngQ4/OUy5VUK+KUfEkOa9GrIYwnC+5yTuvlxmSTZZl9q+OqiGz4zGj
	dEs5VKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIzT-0000000FSle-3TE6;
	Mon, 29 Jun 2026 20:54:03 +0000
Received: from mail-eastus2azon11020075.outbound.protection.outlook.com ([52.101.56.75] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIzP-0000000FSit-0GQq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 20:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAqLYhX6wo/1+J5gSiaPymLz8273h3P/gMhI3xsjeApt4f0f8gwF7+hRXyXSiRm9eAthugm7aGOYlV545nzXrWhfsxHQdrS0Y9y/ppC0xWinbLb0KVeDo8bB6PI8Bd9kFX778Al8BrB5Tn/NwhtgW8OrPxoT9/ZRO0dpo/FRLsSRCbqdtKTm5nsde5bgcwIOxylkAf1hQED6mMl9xHkdqNRNOM18+fYp2BT1+ERt1QoilUBJbPmb1NZ8bfjnfp7ZC2XJB9F0CtoVtXH4RRZoDnnowGroDiz9H9EB/cvDdlL1Ih/CjBfN+9icGcyAPdRxQPIyw42uyDx5tivJjJ67Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yNO6lqS3sKk/dK81e/jgzyQrMot2vLvXAhIH3zdfwg=;
 b=xgpMLTKxJpku229l7Mgm3js4AluCIvt82RvtEBE6TIXFHKgVXJj7UwfCrnARxPEvraS3EEbPdUA/R+niA9uHVmvoly/79UxVWKybXOgy2AXbn5p67bR1NtsvnfLGLd1B3M9euvN19AFTSxNCb5n4WtgwZ90MFETA8gn3Bhmzn0dCt0RTq/TusoWOqlu58HLpII1Et+dR4qGw3cJomGEfQ37PfWf98ZLw/7tXHmMboJhGHQRxC0cH0HPQsMpzCxEtjAWcs+LMh/Xh/kE8cUJFbiBj7YkTdSFP7IpM9tX0ZknfR5fR2HzLxsu0aNwWqI/Oek7CvTfyhXLRfjtHLvt3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yNO6lqS3sKk/dK81e/jgzyQrMot2vLvXAhIH3zdfwg=;
 b=kNzcn3Dmu7bSZgy3ZxL2rIzdpq2wwsoKF30xhAmpc9cqbJQx5ruZtdusKD2OlV2OMAynCK5uvoqo4teX8+/govULvcZLAiXiKTxoIoNlDpDVrsi9ihOPs3lr/44PxV95aezFJc59worR5lrvHuOIXgaNGF1uzpTbEXSOyK+YCUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from CH0PR10MB5290.namprd10.prod.outlook.com (2603:10b6:610:dc::14)
 by SJ0PR10MB4749.namprd10.prod.outlook.com (2603:10b6:a03:2da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 20:53:54 +0000
Received: from CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5]) by CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 20:53:53 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Brian Masney <bmasney@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH_v2 2/3] clk: clocking-wizard: optimize clock search
Date: Mon, 29 Jun 2026 15:53:45 -0500
Message-ID: <20260629205346.3228886-3-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629205346.3228886-1-colin.foster@in-advantage.com>
References: <20260629205346.3228886-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::15) To CH0PR10MB5290.namprd10.prod.outlook.com
 (2603:10b6:610:dc::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5290:EE_|SJ0PR10MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: 922e1526-f16e-4680-058f-08ded62087b9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info: +XcqgDzpRmjh1N4Y7D36J/RBKe7BPcv7V69BiwmzOXj4/dNqRXeTNkXBjAUlRBIylXwLkqWlAltn8x3iVFG2lgO1EhewJn2npI+d3WIyPqV/yCMALMakhiruxqhv4zljQxXLruNZH19DfyvY88dmPClT053JVQ5KoJmOx+pZwj6cNk9NAnEJP0wLvxkE0b17WGxg6mq2sJMNLfWrN5o77gxdM3hjt9K5DsXqD+UqroFR0dJgT/8ZlJWTBeCEFTpiVyrRxxeSeTpZBdOodBRoYJbkaXIAEx80e8K1iOP9IWOjgb4C3QcyT1udLHqwgmeZa+BIi6VKP7Xvnjr+55bBCS20iGDpEzR43geLwl1dQ1MFl1lKfU8cYCeIVQ7Z6J5z3N/sO1w35UkJNZBHHa5kbKipDhJ6Jk6it5g8nNDfzbBifS2YMg/OyyVRzaNVDSQn+5klPBC60bvsxwVHzNwA4QjufPmBAJ0NsUsggsGIQl1h+Br3aMNd+aYdGHBWZrsCnWidAQ0KUH1KRKBWiT4Fff4lFTbFXvdwbQjC0jrD4kbiGSVjZyD8XONmIjclzemia85Yjg8A1H4KCblfnMCYK3L+m3emqcHkmmSse1BwsRSb9teiQQUpWQURakAfYXLZU3H4VcAn2Fu3rA9u9cBsc/OrVySBuLUszwIZrTzoxco=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKSJmZ2hsO7Ph2TLfX5hp08Dc2rDqLYd6+7aHtwTmjHI0Y2BoIdLFChe149C?=
 =?us-ascii?Q?Pkeka2q+no6TzAY4OqH9YiAY7wiXUMrTRwJCJjS0I3P7FzAygrr3oOdFBEjK?=
 =?us-ascii?Q?XGhHMbxUU9JStv2xhh3Kw5lFn1rnptd0/KkhvFe4DAH9dSZchI/38hZdYzlY?=
 =?us-ascii?Q?BgFpFhdv5Fym749tqOtm/fCQEJEjSlHF0gYvxCCdVbdsHSlcuSUOLTbeC3/9?=
 =?us-ascii?Q?gP1gg7pxMugf6Z3vivDRdAQv6GFiyo7OCRBa/tWfwxxBn4zDOuTbGSmIsw0H?=
 =?us-ascii?Q?2+UZGdPjGTXQgcR5lBj/4OQDQ3F42sGSdHXCjzZWoRx0H4XoktJe49Xlx5H+?=
 =?us-ascii?Q?YhlViLgP4lLkLb0jqRFcoZiT1IUpz7rNzHbQUSG0ZC670B/Ia1Gfh/f2/tEH?=
 =?us-ascii?Q?YUI/nrckFAOknnYT4TvfMur6XH0+IvMSPHeliZd/2iguKFsZzO4n/JwupRd8?=
 =?us-ascii?Q?5l3QR+1Cge9+c97DgQmhU2ie98RLleBqKBnfsvQX3ZMC0Nnjvf2v+TSpOavV?=
 =?us-ascii?Q?Fh8JNwLfmSWe53fKqmvxStGdUK/KGdrxLUYdV7oebCLwGOKaqRlqqpi54v9s?=
 =?us-ascii?Q?lmZX7nqU4sUfTo7QGemIEPsK9OHosgcbJPGDv0HqcDO0kxNpKX59VSoHRsMH?=
 =?us-ascii?Q?CEQw4Lah23r3trbGESJBvTuwmoN8Ntf6Xqkr5/QsIg/eBN73dx2wztdMaZZb?=
 =?us-ascii?Q?H2rzamENWOCT0EW4JZ0i8PC5/XsYKE30DwyctzjcX6vnH+Uw9aWxXzkoG08q?=
 =?us-ascii?Q?ysZ95ig+WdFNeuIpowiNDhY83MXlQn7EaQXvWbvNPsKIa5fKSMx1L7+eHYBY?=
 =?us-ascii?Q?ZwzWjUrBFlfVY0wYzJZS4F2oWevOeau4XNgIhBs9yA1dFueRgb5yUMxuMOB3?=
 =?us-ascii?Q?1lAeVKarB2WVPRC4JHvChBATR2iNNz8F5b/1XHHvsn7rfyVWb/+p75itKW7R?=
 =?us-ascii?Q?a9BEAjWFKUZyEHagIkzIIqT71rSzlus8UWCPj8MXEooh2wwUeL0xyMiITp6E?=
 =?us-ascii?Q?ymtg9pzkG0Mvd2hWRI3MB/gx907WP/nGvlkeNUHlOWxqdubdsMDWZ5sZ1B17?=
 =?us-ascii?Q?H0QB9hdbvQoY+vRHt8oDW3uEbuS5y5R6fCDUGWX7BZihm4+H2xL/X0xIYNbV?=
 =?us-ascii?Q?XedYkJ35aMAT9DSROqLpEFRpn1/u8Wd94z5CUea6uqTTGgMEbAU/Q4LvAD9X?=
 =?us-ascii?Q?xMihnXanioqQAtX9CbCTDehPlafALp5pHggz/Qa2IotxbOrrJlCvxfNjxhXc?=
 =?us-ascii?Q?1+oi80k8YA7xsJ5dEni1ok0tc6Ce/OGpMk0Nb51B+Mqn454x0C+js4Mg74jB?=
 =?us-ascii?Q?dPdkmvWYELPO8hh+ahPy5tL4/V2YrZjigmI883/RKyFIsI84NfD1v5o+jThS?=
 =?us-ascii?Q?yAJYvpSItWZH59uEcbvxqTQyOq3f+9lfJKk3k6bixY8gHpcRtfhwhmHpajLO?=
 =?us-ascii?Q?SBWP8nFf7YEVvruXDMIunf/lwseT5SsZP53NWR/HDGszzQIjrMNmlhqsAIrR?=
 =?us-ascii?Q?8a1YdiNLOuvnpkYfIvCGdmb6huS+LLkhpY77GO7T53ueLj6nNm2745DSDxXF?=
 =?us-ascii?Q?lTSx0DzaKDwVaEkxQtt7YamKv/z0WzphD+QJYOtivdQDbYdpFYHbWR1vub8Y?=
 =?us-ascii?Q?4+CZGZCxI7n596Vq6O3nCasAUmU3SJiWWqpPkbMWV6SJyfXjr/xWImI64enT?=
 =?us-ascii?Q?4yPVco7WQ5TXIlxMi+o+YVZNgB9fqsIN/ofYsTJfJVo+UDBB4Jy8wKfKg4J/?=
 =?us-ascii?Q?fkMvZ2LHrx+7CptRiF9zJuAS4tlH3yw=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922e1526-f16e-4680-058f-08ded62087b9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:53:53.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfrbvAdjkDYdEqSh6DfCzwPcvSwJd4WS7tLKqsEkphSQw+rN2X1baWa282aXp6SHIH4LdtI0U0scHXuMnhbYYnzomLZc/NCBAshqetUhMfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4749
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_135359_100497_12C18D4D 
X-CRM114-Status: GOOD (  10.64  )
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

When an exact clock match is found, there is no need to continue
searching. This process was optimized for versal as part of
'commit e0a94c6bb5b4 ("clk: xilinx: Optimize divisor search in
clk_wzrd_get_divisors_ver()")' but that logic wasn't applied to
the non-versal driver.

Apply this fast-exit logic to the non-versal driver.

Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 77c9d025ca8cf..c7e8010afae52 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -414,6 +414,9 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 				divider->d = d;
 				divider->o = o >> 3;
 				divider->o_frac = (o - (divider->o << 3)) * 125;
+
+				if (!diff)
+					return 0;
 			}
 		}
 	}
-- 
2.43.0


