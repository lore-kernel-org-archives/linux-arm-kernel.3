Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9263BC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZfzoNaZzV8Ub0kEv3l0z/fWtkxmS8OF+izAOHPgQKc=; b=dG1U3RTZHM7jLuckV/tpc+C01d
	2VT6G6UIsGoL4B0QrlgigHAaHTH7S2+8ikl8q3VDJ29dZpPnkL4OLy+jZBMGR5lp6UNdQ0xcoD3GJ
	WtA7zjEk/OyOwZfI2ABNRDsAyYJfehccT/NsF6UpCST9t2YYhvAlAtSmI/8B6e0rROznz30PjUozT
	NFbgph+owvKpTGy7BCUnQh6tcVo6TTCmftXxUv1I1mXoRlQroVM1rvaOKESpiu1dT8ZbWha3GGelv
	rrnCNc8ymvRnVyb+xt7rMtTSm7ZVAJnDBS0rZosCQG/GbNOGvd4uD2hIiUKPZhUCKiWK0nMoxLKTw
	S4F6iBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nrX-00000003jZR-0QoG;
	Mon, 21 Sep 2026 23:55:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nrS-00000003jVG-21Ag
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 23:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gZfzoNaZzV8Ub0kEv3l0z/fWtkxmS8OF+izAOHPgQKc=; b=fi2fE2PfcpYPmhFYNu9lLmNOrO
	JAs8tKasctMAsWcaR72Uk9fKAr3Aa5TCOOJTr1F/pm0R/0PnhK+zRkNyNEiH7dgoylrvp4ElJ2Y4V
	kYWaRjKmCgjn0bdlZncE12nzmJ2JPq0vs2EP+cfn2YvtPBty2cUOnYMvPzVFE52Btng9dXi1NnJdO
	o7ccQsQ3EYpcqU9DwYCW469H1kUu4JnzPf3u1kgVj6ucVe0X6qWNk75EJbUp8sHyvwX1QMLWJ/9jh
	1iwRj3p2HlopI/pAdHZgSMlU3OntBO7yaFKoX2wCm7eBNVRW7+K24NFTx5jxZCyvSSaJ2cyCQo4xf
	ep7qnreg==;
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8nrO-0000000Cvb5-21N7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 23:55:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSjJt1K7uIMVei2i8sFv5U3hDIBlTr0AQat+BsyKFWmgOfKMXCAMH2/ZwzpXUbXo8Txq+gPK85OvuFcHMItiKM3zZTyh25dXdqI/FrL9MnKg2I4t9YM8Jd4NdG+C+OJzfsNXnd6CX9WGlFwkwbKAtwCrTumOHqCrBhGgf579v2ThCCbqcg3RCqBnZLtbyQ5N+zVrzCrI5PlrvELK3VhnmZhBT0GI4mG1VK75hy5O1hO3Y15tRA4lhzXXQJLyWFegKzBc83flXJjbfMmKvNFRataNDoefUL5BJRLr1hZQlRbeaLzm6JNExktGmKI9kEv2+4+jAlh7lgL2f8paVtVatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZfzoNaZzV8Ub0kEv3l0z/fWtkxmS8OF+izAOHPgQKc=;
 b=vv1mmcCsr/Fi97p25UWtyqBCN/BlTHiiXkXczVt4rEPvRfw5z1b0oMf98aWfk8dMgfKgFuvLvFx5tNFnmqMoPNClBQIrrpQSBPFYN9yUZ4dcswaRNdFBxc8A6zjS5YU/Hm8CDr0JsWl7x72+uHNXINw97phnC0+VgcYREd87K2AKZCwW2yUSHOYTacXOV9Xoz+zqBLnjRXSagxSOvul9GR7eDLU559nVIHxY3rItI0H8A5zIW8Xpx9/CD+iSAOVwds2AUTNC52ioOhTxQI8Z81R6tN+SR7rtnvKQLCClqGPtf1wsSbso3PRZaDqZflLVer7enA/smMqbTLmOq05I5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZfzoNaZzV8Ub0kEv3l0z/fWtkxmS8OF+izAOHPgQKc=;
 b=r5HIAQwUtWVZZ0P7VQRip8asJIR4zcmNauK7jd1rJ61ieP1+4eavsJ7+TQliSKsB4M8i2I/HdA3trcuT/isagSiWiIgFJZV1l9TMW8hcXNJwOCqTWTOAfriaSLCoxrZzTyM5cmK6QVO4GhHikcmhs1UrvXIMEjf/clQdBvUNAhAR4okSIvzR2yJr+sFLhs4V4S1rB9FjXirNW+5FH7d6s+LFJC/aEZirm1HbCBPJ+7Mx50Mtl3x2BLf7b4ioRo4uqi87Mf7HFLsFZJ5rzSbS3/UpZFtVqVbsNN5Iz5B0zgbx9XFPTqDRal0FiQl1i41zLqmBX2n8CUu3Jj7U4/QUzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14) by CH0PR12MB8487.namprd12.prod.outlook.com
 (2603:10b6:610:18c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 23:55:24 +0000
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5]) by LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 23:55:24 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>
Cc: David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: [PATCH v7 9/9] iommu/arm-smmu-v3: Support the DS expansion of range invalidation SCALE
Date: Mon, 21 Sep 2026 20:55:17 -0300
Message-ID: <9-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
In-Reply-To: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::6) To LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB325698:EE_|CH0PR12MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 610d783e-7f3b-41d9-7a6b-08df183bcba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|366016|10067099003|56012099006|11063799006|5023799004|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: Tm2KbyYcnZVkPnC9nsHOZi+v+wwDzLIOVUB1kfIaDZqvkcMciaE+B7qYAF1jd2a3Uo40pk9OiuAMpOhy1OakDFu9DWtt4+VzHct/V+hCCywWYzYRIW+ad3drLrP9ny3rFr57ICaelgQxsTXpeGKwTngyig7T+E/F/JUHDPhHzoz9OEtFXKCScJTuhpuF32QCMZHhNFHyGfVrihoWmlUEnu4PBYf+GpeBvYt23CMvLsn1iqkiQNVyWbg2mvBzCrKvlpg0oE7eUX6RON8pUB/AG+U2Iq5A5HJ0Gk5An7kaNhda3yfxPrGuqsugd66qlWSHlfmeBOe+h8XkWfryolRQURgjxOE88624Xg2dSeGjUn6fscFfMnzbwqWT4rh8XXDqERvZiKZujTbsEpC/ODYX7DqJYbVTIbhIjdSI2JOIaHJkw1h4ZXLpNyPzEUHVTQjrHS3lCTLuGjJyLYAymBHl0F+KNEU+8CR0qgo3SoElyOMy/ElKdTgDLR+zkP1gQ9LnQEV1Iz5TbV5sO0p/hj63n1Mak++gyI+q+OLkLsAZCnOsj1ZvW43XStIphlrmqt4u/HLMGFs9AeYy/iHuicAdHULvYXU8INFum9fwjSLQQO+IgpKSrckwS5HExZFQL2lkkv/JyPZhhL234ruwyHvNfJcP2Kk1bvoQPXOU3qumqLBmvTAcgMg1tZG4nkfvgz4SJGSQGGyGre8TuSJgf+veVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB325698.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(366016)(10067099003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mp8L0Uo6DK+0N4ukvDKeEziypbJ3GwWVO7vZgAmweX7x/5WKtAISn/vtvvcX?=
 =?us-ascii?Q?MFGDPo0n7ZdVGC++qfnEr4qTwmk5FQc1juY7aYwbu6O8x8TmDoEvawAdE4wX?=
 =?us-ascii?Q?vqRzUfzYz4uJqlesLk8vnykdQhFTQFFtYB2cEj7Jv/i9SWGKd3rSEtKnU4RF?=
 =?us-ascii?Q?FI2O+gr/7kl4DyfFZGOhure+u8pUTROF23UNAj0XbA84sW+8xDZbOTEM88ZP?=
 =?us-ascii?Q?kSSmceAc9McG7t0YNOPyR+zOjTonqtedPBanz4eiDJVfCELHPbWKhMVvte7f?=
 =?us-ascii?Q?RfJH8LwSjxcCRRVBy00UFHJMZ6+CPj5WGC93F6hv6snljzAs/JbFA5HMRoA8?=
 =?us-ascii?Q?LuIlN1EZMzDNQVMwZbICLAYTi8Q3dowiRIusGQ3hb8RxMoMXP2QK4vGTyT/h?=
 =?us-ascii?Q?AuUh9EA7eaW96zmNoGVlOTbTezG9XuW+Gri2lbDBSOzOfVXuZqx/sMnj4WOm?=
 =?us-ascii?Q?RD/myv9Gw6qy5lyDonyFzoW1zD6AfdDN25vD+iEikR4+iKgq0nLkeHvge01x?=
 =?us-ascii?Q?t5seWh1s0mvQOcHH7lZzW4srlHp0KB4BrB1yF9rDN98LcWWVZmBQOEYLDy5L?=
 =?us-ascii?Q?FaG/YtJBQajps2+8ioEigHrGNxeVV5xNrqFrqKcdGdTbvsOAcjChoAVTa44e?=
 =?us-ascii?Q?rpKS2Rbi/JTH6V00zWpJSmn1Gc2amRayBggSRc82mI5XHPWMnRW6P5kh2SPV?=
 =?us-ascii?Q?LngwqQ1saTqZHbIKouDkKxdIBzwM6UaSPDbzI7o/pRJUY18JTZwELBPKxeYW?=
 =?us-ascii?Q?EbuLxgSkxIo3bfBhwpHS2S1znQh/Fp12FeyhL3FFocZp2FcKygxLIy7qTAZ6?=
 =?us-ascii?Q?kKRylUe9CV/Xd4nTsVEEK3Jt20dXSWRwAYGVILpVYrD9UVqqqVAhr3fxnKxF?=
 =?us-ascii?Q?F5XSzztd7XefMFb+RuMsK5U0aSUQsxBl2iwbT/8pGS4D2d/NetZtfLPB+Elh?=
 =?us-ascii?Q?zawlc+edGPiQZJpti3Tee+PcFcmqxkF7YRMy/+wGhhsUKBPGJJmcv6wc4AAT?=
 =?us-ascii?Q?o278un7lOav2NE+pONaFFnThdJOPay+rC4IxsbaGz464bVa8CFwOtciqPOIQ?=
 =?us-ascii?Q?W4b0MAHpTZT/2Jc2GCKeC6F550tSa0EHYs3jmE8aAxCFvZs8bMsn0ZOF1eP+?=
 =?us-ascii?Q?0PWXnsi0KGDt+oLojvz/QE95LZWIN8S+4hXitpGm6GfWqrnv8xJhH+fya+kx?=
 =?us-ascii?Q?zqNR63hya8g4aNUu4uVx6vYSQ3lgY0D9uXqhVe7BWPUMlPn9XpyVmfYc31cb?=
 =?us-ascii?Q?N6N+Emf7cODNYpnOmmkP002AsT2xl+XYEwsBaW4ordZtliQgXjktpo2s1YZ5?=
 =?us-ascii?Q?k2vXzYe4MB9LkztLNIbIGxk1TQ/NdG9Ssx8q4vO2L2XXOdPCwtuNh9uzjynu?=
 =?us-ascii?Q?dDafoDwFMFUk9nZJ4CSNeUPyUuxyhIwl0kAKcz9eplTlTJZJfjsyZIVvA9vx?=
 =?us-ascii?Q?w73xRIfzHHvkey+7MPHJiOV3T26zHE6y1GW5D1oP4lRiRStz9nSJ4SufQgZn?=
 =?us-ascii?Q?OVCaLMqjm6ryq8gFknI+XIsz1Lv1W98IGUdzdeW4jXSM7GlrvQWWace33IMS?=
 =?us-ascii?Q?58hDwJGj8VKTMWlkvGuEx+DiKGOg2y/0+VIkHmLyEYFtraVlWkUuLuFe9HXC?=
 =?us-ascii?Q?0KItW19YGG6NzqIcPcKLvTTDkM4Qml8WvZPs0p3f+NREfGnBP/P76kY+6Dli?=
 =?us-ascii?Q?O4sQZch/S0otO3Jwt/oZFnl1we4/M+pZKCyZK9IstgcHvUAm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610d783e-7f3b-41d9-7a6b-08df183bcba3
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB325698.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 23:55:20.9075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxBGzGf5HOzJWt1Jp3CMP/9S0l0nAzeKWhb8sCpPb0Y6KEkphdFj/du5C/c9L3/E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8487
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_005546_691030_5EDDE90C 
X-CRM114-Status: GOOD (  16.29  )
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

If DS is supported then SCALE can go up to 39. Compute a scale max that is
compatible for the entire invs list.

Replace the has_range_inv in the invs list with a 0 range_inv_scale_max
to mean range invalidation is unavailable.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c   |  4 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c    | 18 +++++++++++++-----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h    |  5 +++--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 81ceaf97b88c07..6f324ba0730bea 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -647,7 +647,7 @@ static void arm_smmu_v3_invs_test_verify(struct kunit *test,
 {
 	KUNIT_EXPECT_EQ(test, invs->num_invs, num_invs);
 	KUNIT_EXPECT_EQ(test, invs->num_trashes, num_trashes);
-	KUNIT_EXPECT_TRUE(test, invs->has_range_inv);
+	KUNIT_EXPECT_EQ(test, invs->range_inv_scale_max, 31);
 	KUNIT_EXPECT_TRUE(test, invs->has_full_cont_range_inv);
 	while (num_invs--) {
 		KUNIT_EXPECT_EQ(test, invs->inv[num_invs].id, ids[num_invs]);
@@ -709,7 +709,7 @@ static void arm_smmu_v3_invs_test(struct kunit *test)
 	/* New array */
 	test_a = arm_smmu_invs_alloc(0);
 	KUNIT_EXPECT_EQ(test, test_a->num_invs, 0);
-	KUNIT_EXPECT_FALSE(test, test_a->has_range_inv);
+	KUNIT_EXPECT_EQ(test, test_a->range_inv_scale_max, 0);
 	KUNIT_EXPECT_FALSE(test, test_a->has_full_cont_range_inv);
 
 	/* Test1: merge invs1 (new array) */
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index de9017eb93458d..3c5d9f875bfee1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1060,9 +1060,15 @@ static void arm_smmu_invs_update_caps(struct arm_smmu_invs *invs,
 		invs->has_ats = true;
 
 	if (inv->smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-		invs->has_range_inv = true;
+		unsigned int scale_max;
+
 		if (inv->smmu->options & ARM_SMMU_OPT_FULL_CONT_RANGE_INV)
 			invs->has_full_cont_range_inv = true;
+
+		scale_max = (inv->smmu->features & ARM_SMMU_FEAT_DS) ? 39 : 31;
+		if (!invs->range_inv_scale_max ||
+		    scale_max < invs->range_inv_scale_max)
+			invs->range_inv_scale_max = scale_max;
 	}
 }
 
@@ -2638,7 +2644,8 @@ static unsigned int arm_smmu_compute_ttl(u8 leaf_bitmap, u8 table_bitmap,
  * CONT is covered by one command.
  */
 static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
-				     bool single_range_inv)
+				     bool single_range_inv,
+				     unsigned int scale_max)
 {
 	u8 tgsz_lg2 = tlbi->tgsz_lg2;
 	unsigned int ttl = arm_smmu_compute_ttl(
@@ -2660,7 +2667,7 @@ static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
 	 * address beyond alignment to tg (so long as TTL=0).
 	 */
 	first.scale = arm_smmu_range_inv_calc_scale(num_tg);
-	if (first.scale > 31) {
+	if (first.scale > scale_max) {
 		/* Range too large for a single command do full invalidation */
 		tlbi->range.use_full_inv = true;
 		return;
@@ -2925,12 +2932,13 @@ void arm_smmu_domain_tlbi(struct arm_smmu_tlbi *tlbi,
 	 * The invs generation ensures this matches the instances being
 	 * invalidated.
 	 */
-	if (invs->has_range_inv) {
+	if (invs->range_inv_scale_max) {
 		if (!tlbi->range.use_full_inv) {
 			arm_smmu_tlbi_calc_range(
 				tlbi,
 				smmu_domain->stage == ARM_SMMU_DOMAIN_SVA &&
-					invs->has_full_cont_range_inv);
+					invs->has_full_cont_range_inv,
+				invs->range_inv_scale_max);
 		}
 	}
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 245db175386a9d..97ab8257925de7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -758,9 +758,10 @@ static inline bool arm_smmu_inv_is_ats(const struct arm_smmu_inv *inv)
  *               Must not be greater than @num_invs
  * @rwlock: optional rwlock to fence ATS operations
  * @has_ats: flag if the array contains an INV_TYPE_ATS or INV_TYPE_ATS_FULL
- * @has_range_inv: flag if any entry's SMMU supports range invalidation
  * @has_full_cont_range_inv: flag if any entry's SMMU requires the CONT range
  *                           invalidation workaround
+ * @range_inv_scale_max: max SCALE usable by all range-capable SMMUs, or 0 if
+ *                       no SMMU supports range invalidation
  * @rcu: rcu head for kfree_rcu()
  * @inv: flexible invalidation array
  *
@@ -790,8 +791,8 @@ struct arm_smmu_invs {
 	size_t num_trashes;
 	rwlock_t rwlock;
 	bool has_ats;
-	bool has_range_inv;
 	bool has_full_cont_range_inv;
+	u8 range_inv_scale_max;
 	struct rcu_head rcu;
 	struct arm_smmu_inv inv[] __counted_by(max_invs);
 };
-- 
2.43.0


