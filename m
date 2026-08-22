Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A4FC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 18:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLgSk6zYY4U3C73StybfwEUk6VHejR7+Qd2VKC53Emc=; b=z48aAHmLRX3vnbIHLx92Jq7iop
	QQ3fWBBH9HEx3GkrLVQ/NDhxtM4O1qCneVlvd5aqWqPR60LVyWH5hzP31iJpFLj5+NA7DskjL5vMX
	zDS7+aTxjpOZsyfbQ9e7gGp/dJmTI9a7vl55UyEyEq8epwj7Jft8PndVKrmETmtBslKDWECGg3z0C
	iXiciapBHpH0q24lo/FpCYZjYppa8SlOOwVTmlJIURhymnrOrhx/FYlKEM6iiKoxXcVU25YaHXctQ
	vj8BKv3P3vRDiRcc8/YYgc40SKmEvvpkoFHuBAgcxCBkB5qcgka4S4dPpgOtnbYj71m/dnUtJbstZ
	zn0C5A9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxqMM-0000000EiMk-2VZU;
	Sat, 22 Aug 2026 18:22:26 +0000
Received: from mail-westus3azon11011046.outbound.protection.outlook.com ([40.107.208.46] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxqMK-0000000EiMJ-2poD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 18:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wv6vGAO4XgrmRnRjmQgAtFYS1ZKwIFNTIiSuynZqj+EDusoXUFgigNyBlFPX8AcOFwIEQZiVUPWk8njyVMNUO6AwsMDwq4hfNSBQcFLPNlEiAzFzwK9lmsa5KYrXubcgud3mAntLLZn32W/4sr+KmWFyzDscOkfZDF9rvAzN8hHsqkzh/hrQTPeiJ0k6WTvLCw/vE7yjlBo90xQZ0m9pl4fdaoQ/TG1BBpYTLwZ5ENLBwWkTFJB8P/mCgiD+PDCENsl6/35cRHp0BYAi/CJY8/+IAdM4wezPbRlN1wZlgw/fYdZ2v3wajy9MO0pU+DxxYLDTBFhy3wQe95AQlDAGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLgSk6zYY4U3C73StybfwEUk6VHejR7+Qd2VKC53Emc=;
 b=gY6IzZ5fVxjdCCPyTwygM8J03lpGMj9lx0YJmCTfbXCHvybTLij1XSC0D4ZQaoPX3eYEWuQNFqUCISjsKy6VPbbA55C3lt2lquKDfcn6L9HvTMfzRY+kB7TSsFifXJ5+qARbEPSFo4IphuAU4DIDgqxcGN6Oyr0JVGIyiieAYMboNpkC0hj7sR+E+WntpK5FALjHuKAk+ARzv3YGazC276QzW9b9P2XEi0zKvvx1KKvGLfETnxdcQKovk9wd+Mh2uWjIqtfhptQX4XjdiQTgsLGC+RgCARFvZJ2cbVlIN6A3y5JSL0JtI65/TQ+8vNSQz/NxcbxKSnxA7b6MpvJldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLgSk6zYY4U3C73StybfwEUk6VHejR7+Qd2VKC53Emc=;
 b=CN+JOX2rhI0CCd13ipSsV+kGCNumNOPDTGroUmBgJt5HCxXcZHZjyQjFfmk3YJk2FA2aIn1+nKJ97OQrn333kFxRg1xIQQvBxj3GVNEK+xppiceQra+sd0y0tiaqzT9CASIGeimfBG4tylEkpw78GRws0xeWo1BwRhZXbcjW8/BTyXpm3ILUqi/OHDV/2YKhx8liegSOrZ0O1XsUbVWc7NlbPxFDYER4OvDzNS2BhUdTzlNUyxljhhIwGDWWUBK8a5cY5kAYLbaII1Hgsb5sPxDmzsKcsCkbywDLpxYUqVao8Q1jfqEv9cGJAvTrkczv7ebEEH8vBSnQH61d5nRouw==
Received: from BN9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::24)
 by BN7PPFB3F5C406F.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 18:22:17 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::3a) by BN9P223CA0019.outlook.office365.com
 (2603:10b6:408:10b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Sat,
 22 Aug 2026 18:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Sat, 22 Aug 2026 18:22:17 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 22 Aug
 2026 11:22:03 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 22 Aug 2026 11:22:03 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Sat, 22 Aug 2026 11:22:00 -0700
Date: Sat, 22 Aug 2026 11:22:00 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<praan@google.com>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH v9 02/12] iommu/arm-smmu-v3: Skip EVTQ/PRIQ setup in
 kdump kernel
Message-ID: <aonoyMpz4H56vi8M@nvidia.com>
References: <cover.1784663183.git.nicolinc@nvidia.com>
 <c59f44f2b6982e3e8bd4013395f895cccf9f4a53.1784663184.git.nicolinc@nvidia.com>
 <178735412597.18212.17006591038244815148.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178735412597.18212.17006591038244815148.b4-review@b4>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|BN7PPFB3F5C406F:EE_
X-MS-Office365-Filtering-Correlation-Id: 1485a9af-ab8f-446c-7f2d-08df007a4c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|22082099003|18002099003|4143699003|6133799003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: sgFbiQtB8vi/OSi5mJZedAhi4IfaSGwAbTynMghxj74vqHV8OjLaWQ4b7YU1qxhIK50mt/GLewZbQL3f+a9oUeNxyXu9xQZJp1tBzasfo9ZjVqo+YfxhKo8t/KkEWiAyDY57KcYpEEtltwy3QPBhaLTpzu1lb1pBORycP9tGzptj5dp/+wxzUN/xt/STBroBh1KWyDLUa2di2ksOcSW/YuWUVWaojHFZMYi331yx3A9rKZU1PK8c7eCfdlhktHZCwrOX+/5xVa9/ZjQ1RUXbTkRN8hprXcGIgLwANvci1MbM9gt+xE0mmP16P4firEfPWBF2Pgvlg+L26/0d8enOg2fyj5AjlaPsIYU5O2Wyucfnad3Famd2bCnynERdSxJZ8N5k2OjaCdQtI//j7+/Fds2cDySXZvFdnteuMF5WUR6CIcvJzUxDOExeE4EAdctS31FpGi96YVKFIxUHLcL/Y82HR8BKzBLMDabjcoEHSjCXKsg1dmqafAr/F4e2vBApRCjxkT0o4cWfYgz2rAMPpE124KICQlUwCLmRpH61M6DX4vBzvNxSKvOEjpg5R56aYStbID4VpfS3hpBIE+PocFLyhVyaVdBfbrTE+ClGr8rNOkZ2+Kf/yuxg6D0+gfo5MvpK6Snv/hQ9zCl/AUUEDaTWhEYLw/cXRYauBmvifR2s42M0Zhs+vjlmiqL8y7XDaxQyCPRi9QvB8sDYNb9umg==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(4143699003)(6133799003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jfrFjiXkAFEPQQxN0ZYBxlZ85AAs53sidKZ1siwTYzuJznmxvlfXdYf+4FmwpHr+YwmsPrI5f/4/o6tc8KkSXtIBuwzSiUK2k0KddtUasQ2i/HClslbasn3owJ4WaZcc36Gm0tbMp7Pjvhj8RlmsV2xHPYbnfMzzdEOiX9kW8lIEsh1YrnhVbVBAa9MaJ0o7y4k5rK0qZz0Jn3Vo+meJdbYpw/jrSHg4vGClT3WSSh59keRo5q0sr/1u2TKP45bqG+eIs9GzKIhYHuSub7KeWtA47xoYgnordogrd/KjZhB6ULfOHvJepJYUEPZ0lUeqhRGsjJ1UAXxW50gVdEhI6oiRb7brEoDXw41byVjUMaNiCrKZQGTRUAr4aZJAkY3bWEGFDMHc/BVTopwEAcGxfS3uMPaBtkBhCqG4gNDyu4M/fM4pGoqWDo2TYHg4Y22V
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 18:22:17.6333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1485a9af-ab8f-446c-7f2d-08df007a4c6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFB3F5C406F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_112224_722234_3449909C 
X-CRM114-Status: GOOD (  11.27  )
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

On Fri, Aug 21, 2026 at 08:15:25PM -0300, Jason Gunthorpe wrote:
> > @@ -4821,21 +4821,36 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > -	/* PRI queue */
> > -	if (smmu->features & ARM_SMMU_FEAT_PRI) {
> > +	/*
> > +	 * PRI queue
> > +	 *
> > +	 * Do not enable in a kdump case, as we cannot serve page requests.
> > +	 */
> > +	if (!is_kdump_kernel() && (smmu->features & ARM_SMMU_FEAT_PRI)) {
> >  		writeq_relaxed(smmu->priq.q.q_base,
> 
> I'm reading this again and wondering why not drop FEAT_PRI much earlier so we
> don't need this is_kdump_kernel() here?

Yes. I added this:

@@ -5371,6 +5351,15 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (arm_smmu_sva_supported(smmu))
 		smmu->features |= ARM_SMMU_FEAT_SVA;
 
+       /*
+	* A kdump kernel wants neither queue: the crashed kernel's CDs and page
+	* tables might be corrupted, spamming events, and page requests cannot
+	* be served. A disabled queue discards new records without raising any
+	* global error.
+	*/
+       if (is_kdump_kernel())
+	       smmu->features &= ~(ARM_SMMU_FEAT_EVTQ | ARM_SMMU_FEAT_PRI);
+
 	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
 		 smmu->oas, smmu->features);

Thanks
Nicolin

