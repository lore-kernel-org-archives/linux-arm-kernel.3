Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E598D3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 19:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoT9W3yY3u8JhBP9Qr/bBtpWkUWC4aSPZ/enu2XD5SQ=; b=4+Vi6iwwthMcj/Tb7+ywdThvcq
	2tDtQGVeNpJ+qc3+Uqo90Rq6xitXLmoDTfDB5zatLd+cwcVIrD5lopqHU91S9Z4F1+M72v2GY31mD
	1F9qgMlPukh1/QrybRSwUNE08YOxyk1djt68YzSxFCHEa56V4T4I44AvXPeDd4rDI/9y3hCTVdCvi
	vqW/KZk/9D574B5apPoZcZXn0sPU/1ry0GNHb/740WAa+YvLSIu0loEI3IV6gsNjlohJEipmpylp0
	dk5CT0gQnQbCeFDRoKjyO7M1ZVewW+xh7uDRIGUCMSZLPGyAOo1SEotOzghVTgZxaxIoZupA5gav6
	1Piju3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSKXg-0000000CBrt-0YGA;
	Sun, 07 Dec 2025 19:35:36 +0000
Received: from mail-eastusazon11011064.outbound.protection.outlook.com ([52.101.52.64] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSKXV-0000000CBrG-2BZY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 19:35:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAwZbdJUCVWjSfkQWmtg97CzLQiWpsTjOtS5m5zGjwXHG7bnPGLMWVGbFNwoq/2+ahfhkUSpNAbfalmtRUZrsa/vS8qy9i/yCu6QmQhKa5l4W8JNuQjZsNPNic+LRd6sLfilemP8hxSjbb/llQffggMEWjNpHxP61jyxsUo6Z5adP3HyhKVIeVUMJdNzDDQ1BFj0NvdnX41cyVXOBVV+qaGOR+RpkMbCOCslb7a6KmLvOkbUV3FXZ8IkdLPb5JJO5+jONnFSbK6wsraolU1G8QdnqQJO9Go09G5zhZH4pFBgg51B42qImyLZ3Xg1TFgS6HpdyIitt1MRpWicPZqtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoT9W3yY3u8JhBP9Qr/bBtpWkUWC4aSPZ/enu2XD5SQ=;
 b=McNwZgD2bCwphhVseMod1EIfF1FDxqJXHyztWAuR7ikX7wU1VpGDOQQxehXbvEMo1QHv6FEyvTmCNNa8bwZw5LMnnxDWUAL+JqZCF6Qpc7iklAdLiNg0/f3cNoNOzObUUK7O4iXAItz0zorHXSIhm9zaU/Zi4ugeGebgU6Q6yjD7/cp5+Vym26hwWV6BX8hc93TmqbE2JXO2XAGuQxwVMKP+TFoDKnVcVE4HpJw4EF/+tFej7lNJJnnGyP/ZYZ9W91MdPxeDL12ylVl3Z13IIVDtGAcfj+SdOlokpSnMchnw+k3rHUBXH296hLk43Q1/t2nHGY3KjiwXtbpQ9aLQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoT9W3yY3u8JhBP9Qr/bBtpWkUWC4aSPZ/enu2XD5SQ=;
 b=ZlZyzuhvIcmRSE2RQ5Vj/iV20aqhQAwbV8yI88z3PiZXTsonNyC/UTUBaB+6ACZ2pBCvUFyCHd/zQt+50f/jwS43XuN57HsvaIPkV4SKNKs3hnng785w++ddMP/lqgMq/rMtZp++3SpyGxd/lVNPrh0kKJXm0UeEvcGqiCLViUFo7WOnAWEgT1k+MAG5XiOdRKTnzcwas9tKCOyIyejdnx7Bw82Mc4Qb6cg0fnh490iiC4kNkTEfqAz/qw6POmH8QkBYxLtYQj852YWGJ+vlHQVrP6mrre0+SzkiFO1cMouG8wejNeIbk4abIdhiy1U/O21qk+nBMlC4xHpDFx2maQ==
Received: from BL1P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::18)
 by SJ2PR12MB8805.namprd12.prod.outlook.com (2603:10b6:a03:4d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Sun, 7 Dec
 2025 19:35:17 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::18) by BL1P222CA0013.outlook.office365.com
 (2603:10b6:208:2c7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Sun,
 7 Dec 2025 19:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Sun, 7 Dec 2025 19:35:16 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 7 Dec
 2025 11:35:06 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sun, 7 Dec 2025 11:35:05 -0800
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 7 Dec 2025 11:35:03 -0800
Date: Sun, 7 Dec 2025 11:35:01 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>, <praan@google.com>
Subject: Re: [PATCH rc v1 1/4] iommu/arm-smmu-v3: Add ignored bits to fix STE
 update sequence
Message-ID: <aTXW5X4fAiEHAy6V@nvidia.com>
References: <cover.1764982046.git.nicolinc@nvidia.com>
 <6ec73bb7cd03d90a0764f12c4b14071158163818.1764982046.git.nicolinc@nvidia.com>
 <20251206193408.GD1219718@nvidia.com>
 <aTSH5Eap7leYQtPl@nvidia.com>
 <20251206195752.GI1219718@nvidia.com>
 <aTUEikcWXWwKAS/1@nvidia.com>
 <aTWmpijaV75aixNb@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aTWmpijaV75aixNb@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|SJ2PR12MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: bd446f83-3fe2-4068-276d-08de35c7bfc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?71UqWaQs6kyFTTrBURkrTBp1TFEQNsrVz5cmoDAdukDW6zHhO5j/4D541kfP?=
 =?us-ascii?Q?XJY0mMqyJbxI7Zo6CcdO4v/jhlD28kKFQdOjO2XTTFicoOzIDHKUQY9vQFSx?=
 =?us-ascii?Q?S2WT3a07VC5UWSS6ctmwvC/d5Rw9xzgD24KSEr46G/jkLq31V4vXLkkixiDs?=
 =?us-ascii?Q?86kR5bH+bIakuRpbrB2AOAnmcVaU1DbfUNjkZIRhBgB/cAK2Hq6HH+KAluVG?=
 =?us-ascii?Q?Hxh7SI7rjA+puKd2F9neGydm0GkPJKkjhHNUt0B457SAKIIE6fEHdfl1YTXC?=
 =?us-ascii?Q?AllWx6hdUpPPY/1Duh9Rz7qcLwbHdvZNQycKrkpclTAOfoWonn3vE7JbkiB5?=
 =?us-ascii?Q?APJ4btcJFdlXh4xnV0eyGgHjCHqz538Oc6RLxhq82qeEoQsoR0456J6J3swK?=
 =?us-ascii?Q?8ZItjHMchblgSdULO3l7oqGn79Lb2KLm9XtnaFKLcolXV7gt1jSip4BcFvOK?=
 =?us-ascii?Q?dIvcHc7trvSVewec1ve7hSDdDZplRaSEeWZ1LGm/S0Kp9P5oihPRLds8NHQS?=
 =?us-ascii?Q?0Le+5BlHDBXEP9CKA0V66zDxfh4kM7LIXv6aLqB2i3EH9+m7Sk0nNvPhy7aJ?=
 =?us-ascii?Q?SA4R8uAY2xkoRF0cdQP+Mqh9UTCphDCpHq9vsTDKrIJ66duvUUASeivcZx3Q?=
 =?us-ascii?Q?5Vqbo1BxLJgUcVklC0tQytX7BlqN65Mv0wbiZG7Opoq2IIxYsThU6FwijTbx?=
 =?us-ascii?Q?GUCalV/SdJA4JKaKB2oitxJ6kLkDHtmqHjq4ut19l4Hjbdyzs+xdp343jYG6?=
 =?us-ascii?Q?xCcLpOm9ZG5lnn+dIWByjjlz0QsT5jbdifZ1kGBKSpjIWsQOR7fiGXTFZI6w?=
 =?us-ascii?Q?OWdT0Ysv1sExEbvJ5oZvPXXSAKTD3rWTyNPgLlAbYuM2eNPsZjt0fOYmKa6v?=
 =?us-ascii?Q?fMrY9L6f03+Kp4I/SAZAslWfNZRQNWfmfSM30qc/sGigjTu9Nn0jb65Xabit?=
 =?us-ascii?Q?J0Cz/op+KlPokmPjU/TXKX59nHTogd0nqqr0nKb9VOJZrG0cvc29odF4XSst?=
 =?us-ascii?Q?AoTml5ZLkPFoEZlXS00WZN06m4T4B/RBoHcF5FLSrMNiC9y06NQuo6Z5Stzf?=
 =?us-ascii?Q?6PB/7F+PFeqbRujvWYNISAJ8b4WM59f3F3q82lqoCHLWGSPUernbyEVqH1Q9?=
 =?us-ascii?Q?wH6FxRV7R4YUkEJC/m9PUNr+SEIQomEs6qt5f75uYrqQGDX++xmdFaFOin45?=
 =?us-ascii?Q?1LmGTeM5RxHzy15VIb86hLuIexd0xAJdFs5EWD0I3YoHMO8qpNdkJ9WuKrhr?=
 =?us-ascii?Q?tCtvOwjJKV8/tazQZ67TmVaL9zVrYmFCKBRv36RWutUr8Eee2WW5/wzvEM/C?=
 =?us-ascii?Q?nFEtK+t8ffW3/FL9ElInrJkCNN935oFE3Yxs7WAa5K88jH0znOJptQc3naoi?=
 =?us-ascii?Q?M8lJ06yXbyHG7HpKvp3P/mkPgCQ+g/7uKuf5679NIpuEa8mJgNt+E3y2RM/I?=
 =?us-ascii?Q?N2YNBBooq+sA5p4Gn+6fxbd1dnWGSepIOoD2ItBr16/NC0xEha2Khf5diJbO?=
 =?us-ascii?Q?l5Df/bqVgs4KjijnynezkKzlFJDyaKMahRN+UqWbwLnAPS8V8z5+tpilKrun?=
 =?us-ascii?Q?kgZ0Q/Otr0zhWHIEt5c=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2025 19:35:16.3643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd446f83-3fe2-4068-276d-08de35c7bfc7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_113529_802705_09B24BD2 
X-CRM114-Status: GOOD (  28.40  )
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

On Sun, Dec 07, 2025 at 12:09:10PM -0400, Jason Gunthorpe wrote:
> On Sat, Dec 06, 2025 at 08:37:30PM -0800, Nicolin Chen wrote:
> > > Then ignored should be adjusted by the used: Only if both used are 1
> > > should the bit become ignored. Otherwise we can rely on which ever
> > > used is 0 to generate the hitless update.
> > 
> > Hmm, not sure why it has to be both used.
> 
> Thats the only case that causes an issue, if only one is used then
> there is no need to perform a breaking update.
> 
> If cur_used is 0 then the bit will be set in the first update, if
> target_used is 0 then the bit will be set during the last update.

Ah, I see.

> > >                 /* Bits can change because they are not currently being used */
> > > +               cur_used[i] &= ~ignored[i];
> > >                 unused_update[i] = (entry[i] & cur_used[i]) |
> > >                                    (target[i] & ~cur_used[i]);
> > 
> > If one of ignored bits is set in entry[i] but unset in target[i],
> > the unused_update will first mask it away, resulting in an extra
> > unnecessary update (though it's still hitless).
> 
> Yes, this is how it has always worked. The point is to leave the
> existing the same not try to optimize it using ignored.

OK. Let's leave it and ask the test case to expect 3 v.s. 2.

> > One more change that we need is at the last equation:
> > -		if ((unused_update[i] & target_used[i]) != target[i])
> > +		if ((unused_update[i] & target_used[i] & ~ignored[i]) !=
> > +		    (target[i] & ~ignored[i]))
> > 
> > Either side might have the ignored bits, so we have to suppress
> > ignored on both sides, which is required in the similar routine
> > in arm_smmu_entry_differs_in_used_bits() of the kunit code.
> 
> The only way ignored is set is if both sides have it set and then we
> update the bit in the firsy cycle meaning unused_update must have the
> final value. There is no need to mask target since it will match. Not
> changing this line is a big part of what makes this appealing because
> it keeps the logic straightforward, in case ignored is used we shift
> the update always to the first cycle then everything else is the same.

The reason that I changed this is because the kunit tests failed
in arm_smmu_entry_differs_in_used_bits() when running the nested
cases:

STE initial value: 
    f800f0f0f0f0f0ef 00001000180800d5
    0449b6c400000000 000dbeefdeadbee0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
STE used bits: 
    f80fffffffffffff 00003000fa0800ff
    065fffff0000ffff 000ffffffffffff0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
STE target value: 
    000000000000000d 0000100000000000
    0449b6c400000000 000dbeefdeadbee0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
STE used bits: 
    000000000000000f 0000300032080000
    065fffff0000ffff 000ffffffffffff0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
STE value is now set to: 
    f800f0f0f0f0f0ef 00001000080000d5
    0449b6c400000000 000dbeefdeadbee0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
    # arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass: EXPECTATION FAILED at drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:92
                   Expected arm_smmu_entry_differs_in_used_bits( test_writer->entry, entry_used_bits, test_writer->init_entry, ignored, 8) && arm_smmu_entry_differs_in_used_bits( test_writer->entry, entry_used_bits, test_writer->target_entry, ignored, 8) to be false, but is true
STE value is now set to: 
    000000000000000d 00001000080000d5
    0449b6c400000000 000dbeefdeadbee0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
STE value is now set to: 
    000000000000000d 0000100000000000
    0449b6c400000000 000dbeefdeadbee0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
    not ok 21 arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass

STE initial value: 
    000000000000000d 0000100000000000
    0449b6c400000000 000dbeefdeadbee0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
STE used bits: 
    000000000000000f 0000300032080000
    065fffff0000ffff 000ffffffffffff0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
STE target value: 
    f800f0f0f0f0f0ef 00001000180800d5
    0449b6c400000000 000dbeefdeadbee0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
STE used bits: 
    f80fffffffffffff 00003000fa0800ff
    065fffff0000ffff 000ffffffffffff0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
STE value is now set to: 
    000000000000000d 00001000180800d5
    0449b6c400000000 000dbeefdeadbee0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
    # arm_smmu_v3_write_ste_test_nested_s1bypass_to_s1dssbypass: EXPECTATION FAILED at drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:92
                   Expected arm_smmu_entry_differs_in_used_bits( test_writer->entry, entry_used_bits, test_writer->init_entry, ignored, 8) && arm_smmu_entry_differs_in_used_bits( test_writer->entry, entry_used_bits, test_writer->target_entry, ignored, 8) to be false, but is true
STE value is now set to: 
    f800f0f0f0f0f0ef 00001000180800d5
    0449b6c400000000 000dbeefdeadbee0
    0000000000000000 0000000000000000
    0000000000000000 0000000000000000
    not ok 22 arm_smmu_v3_write_ste_test_nested_s1bypass_to_s1dssbypass

Any thought?

Thanks
Nicolin

