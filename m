Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EEC606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2HaQ9TCg;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C+/Hw3I7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TEqumpFgdz+Eh/7mNnSZRkNd/JC86au+svrPRCsCsA=; b=2HaQ9TCgm+/sxbGpq2S04J5Fkj
	wnkajd4fwJ9Tcs4+gYZ2Kizau9NpI2VkSjp3S7wmVaNSDQZqwcV48D6yCpfylRrLnngj2L1lcIgKH
	KV2rFfy3GTowN7sgaS8k4PQLk1bWgDVwFiWYRt22xuOxtvilYQ4AIwsJTt4Il9NkNWBHg5OGfw/zZ
	xLqsdt+uDmb/30U6mAXuluAIEewFvQ0OKg2FX+GSM0jdQKNH5GwyXX29x4AHiFICvkuk/w5248iM1
	ZQ+15wuuDHdIyR05fXX0Xox3a7InuJ+it4Q0Pg9SiSGWeLIbclEsZNuro3gUvj3V4R92Cfz1Sv4Na
	LvLVoRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD2B-0000000AFAK-3LEi;
	Tue, 20 Oct 2026 16:49:55 +0000
Received: from mail-westusazon11010037.outbound.protection.outlook.com ([52.101.85.37] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD29-0000000AF9N-3uZv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:49:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4gSxtHRL945aBnYja4BYNBfIBHXr1z9ymkhjhn0kCUrU6w2HtnCdPldUqQHt1dDQNUWQ6JLAu0fk3mqfAeuhqnR1i35Inmg/MjQgSR703jD8Oi3XQIE9rLEYKX49btNX9gikueqYjFbtljHexGKFD6KJT5xXT/1tfJXqSI0cLbItCbEEQf6+9/n66D/eLNdS06VNLQEn6iTL4sidpeFAWmlZ2agwcaE1PjjFvMe7td+yXFUXIKwKo2GFr7RCtS8TKannAM6oJhoNTkr9cyN+S+CsOnRdcyqjt8HjhX0Xd+pKvntO0/Yev03+A9CkQauwD6W9iXaq2GjZi687shNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TEqumpFgdz+Eh/7mNnSZRkNd/JC86au+svrPRCsCsA=;
 b=EPffdbwFFPeaQqORe5jFlx3hC4voCWeOPUFynb+5nYe7DGjOlY32ch+2QKxiSAqVUr6v9jVJnCEECKudVWipvK2AwJ+6Vq2CgsxllxZtzzQ5eo8jGn/NOvpIreN2ThCYLY1aDFwOg0J0q3E360vcHd2dxKuzOGA0Q/tPBKR+EHKsep3ghgbsYKMXxG18/h/AhbrCtZ7TA85y+YMijJRek1mARehgrZ0EAblXxKc7It07QSWPuTY3Bv9ZHTA+0UyrTT5AZXOeGrUmhuqvBmrPrsOewHhEq/jW/MVi1UpUhbuJziceCwCUjUMgVYGMCBFWL4vaIp9u9ltneTEBX/Ul9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TEqumpFgdz+Eh/7mNnSZRkNd/JC86au+svrPRCsCsA=;
 b=C+/Hw3I7d5G6vjBhW5GMQhC4Z41ZBR3RJ9XyZHA84pa9k9XeLKZSMQU75rT+Xs38a73K5OvHGIP6ib4tssHMcqKdO5JehYktx5ea+QA9OPHTMLeEtIvDyPChrhJ25XTabP359ERq09vQBHD3HldCg08bCt3AYTuD2gc6rYPLhJocztXDl/5ThjYY1620Ii5v6Jt7dQ9sgAtFVYNR8wWUY9AcO85UJnM/GGQ2eGwjEm2qXwcqkt6WvNedQ8xxqUFN5npzX+WRvxkW6gFu8KOtwjkds4Woic+SUg08AuQAXqeTXigfnNYSCpnMkJll0BL6y05ewkiac4ZNMwNgJBQZqQ==
Received: from DS7P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::7) by
 DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.18; Tue, 20 Oct 2026 16:49:42 +0000
Received: from DM3PEPF000265BD.namprd04.prod.outlook.com
 (2603:10b6:8:25c:cafe::89) by DS7P221CA0017.outlook.office365.com
 (2603:10b6:8:25c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 16:49:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM3PEPF000265BD.mail.protection.outlook.com (10.167.23.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 16:49:42 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 20 Oct
 2026 09:49:29 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 09:49:28 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 20 Oct 2026 09:49:27 -0700
Date: Tue, 20 Oct 2026 09:49:25 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <praan@google.com>, <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 04/11] iommu/arm-smmu-v3: Add ARM_SMMU_FEAT_EVTQ for
 the event queue
Message-ID: <ateblZuS2lI5t1R1@nvidia.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <250a57bbdd232bbb1e3511b7768a1c9ae3d204e6.1791226953.git.nicolinc@nvidia.com>
 <atdNpl732M7D4dXz@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atdNpl732M7D4dXz@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BD:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 603f99af-1a52-4c4f-2e4d-08df2eca235f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|23010399003|82310400026|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mXVEzkYZM+LU974MB/d34dUIerFaMkPY5m8iVIDcPm/pCu/xV/WBVlPkZvhHEdS1BJ2+crnfJzWPAoxX4iVSAYKYUgfOWEkpjjGnLEEewPljBa/kkE9I2fcslf9I2DJx/2WYa+GvzhOMaa9XYiwfSHP8SlQernliqmlWK1xr3HYzvOpiTYwGHFVb7351W4xfXtMiuV090cpqtNiIg7XElTmS0O9IsnIwItdQGRiwi/+lNBhELgqkOCsJ1KJOhDIJK09x0bdXBdrtBllgzJLBQVXXqcbCuw6TkqrphrkPA1N+o2GHL/pduAM8KktI2IS/fA9ED52xy0dK+KYpt0+ie1aM/qOlbshNO+PnoBhisKQHkO9QuIP7A8bxQUA5Ww1WCf3cGku/LOynGOblvsVXz+wRpynJQ/35PqbrCEMLXjwdx8SC2Uumcuqbvj2mvWKn3rBtWQfShWMb30u8i/y9zBeotIPZ3qk9gLsnhufSF5Psmdr3BCEa6LwkyPRKJrNRcQ3dRGBCyh5q4lFLtZDJj/BzXNj3m+MxBS+OAKerLF6vgeB1YKiZ4nzY1GZKqRHQEHsFLPgyBmDOLxz4g/uMK6k0t//qAXzZPTeP2xiCAxcYOL6mmDyYh0NNJIAhANWMSYlXAJtXo26+jL7k9NLHPsgcDaonb8A+O/KtX1/zdJ9eUH0nZsFh4u+ApqlV5LF5hb43BaFpkZ0j79Q26j5GQw==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(23010399003)(82310400026)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aJ2WhnSAdtVr/hqhpCymd03KN21NWpkB+0cYj2aTnSI4zO7X13DAeka/EEhfqvtXSleovpcn7eWYMUIItDL/f4fUPgyLXorpkwjuOtBAxZl4e5xiRDGgNnjqHHPr7JAxVrcX319QqK0WqRKrjcHb8oL7g5peXQ9MlN9vLGu+11Og6SXSTCMB5PVKdQ9j9MTY4y745sq1Ob2r38/wunNC+VbFBOh05sxib9l7RU5GMjnAIt910T6c/SWyE9xg0MzbyaAYrOzBb3GCUPG95szKSxelwvVRPhwqQgt9UAd5ST+jf8COUQUakCSuZei5GuuO2zE2QFy5KnzPia+xDNncmEUtO+11VJ+AeGYqocHPlQEtdZQiGp2+4ndBLXlyc/jYk7/RC/ICg9a2Mx6TLGy1smRluxNZP1X2m+92tx4WgsKEGToGZL+P8/foBDCcKctL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 16:49:42.0224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 603f99af-1a52-4c4f-2e4d-08df2eca235f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3PEPF000265BD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_094953_981907_12743A99 
X-CRM114-Status: GOOD (  12.91  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 11:16:54AM +0000, Mostafa Saleh wrote:
> On Mon, Oct 05, 2026 at 12:30:47PM -0700, Nicolin Chen wrote:
> > @@ -4950,7 +4959,15 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
> >  
> >  	/* Clear the MSI address regs */
> >  	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
> > -	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
> > +
> > +	/* PRIQ's vector needs EVTQ's to be kept */
> > +	WARN_ON_ONCE(!(smmu->features & ARM_SMMU_FEAT_EVTQ) &&
> > +		     (smmu->features & ARM_SMMU_FEAT_PRI));
> > +
> 
> I can't see how we can end up in this case, I’d suggest dropping it
> if I am not missing something.

This will be gone, as the prior patch is reworked following Jason's
suggestion.

Thanks
Nicolin

