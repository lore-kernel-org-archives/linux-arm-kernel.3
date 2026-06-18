Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2675CCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 20:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubCvwaEUgfi0AvZ9q1ilI0JbXEafXh235i6OwnGgZbA=; b=UROLkrMYTfmk9Bsbuo+axti+ry
	NZ38aBBgZY0bM7gTObATqKUZiXMJFV6rg3hHQFwWq0D9Y9+AKwy994gj+EnfWLfDZ++lZOLzonhy3
	mGY9ggjopLcjMoTWUZ3ygx3JqH1ZKlOuZVg13sEm2eHlO2BRmm3IXPIp8gS3XKu9E4E7i0cuscqK9
	l8OheFQpsfC1J51HetA4rqYaf+C2B6+vPh4qqy04E+szomZAhK9bIzl4Q0Bp5luJRS7OLhksPrCJk
	wYd33p6ha4TO7rgN8Mj4OZ/+m458C32yiw5cAsORItgg7HH3DbPhGOfyR5eIw41Jsdy1cV+ZbFTEV
	74v94AMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJkH-00000001mxg-3ZkY;
	Thu, 18 Jun 2026 20:53:53 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJkE-00000001mx8-0pVL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 20:53:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gbe/EJhRRVcJ3bfKijUMUCMs0k6Z2kZqGmqcbCxlSd/Ov7dfCfoe+XfWeIu+We4Z0/pdJNnzHiERbMjGSLH3URm/X6vqbmVn0ZICwGvC7jX6PonfNNmOUDRmI5sEJNT0u8sJcnJU/exU511S5HCCcaMfxa1yFjJRMX+AQyvm9lIxBjWh+L1h8lzrdHQk+S/mDY8z9TF5tjVygmYwfd2J+oXcTJ0VlBez0PgTousJs4dWXlsrVO/IpGkbIwrfGJcKMhZadd7vv4U/6WFPGl9DwuQPzABd6jrxDJhgfhb1zFtWdGjjtma1YIWztXOqKjjwIvJ/wLsoQK2Ed7M1mYdZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubCvwaEUgfi0AvZ9q1ilI0JbXEafXh235i6OwnGgZbA=;
 b=sGLKuMxNP1vdp8D2VEUUYxk/o/Tj0ZAtqCzNL0v0LSSXHQ0iNIsKSKDi37jZTIbttz6LkNkg1Xs5MoAMSoINwVilK4y97Dj6G/Ryrz/E/L83Zadvq/WGQF6/Oo5yU07kxNMRcLLZZbzOQbcpf97uph+c6uWQNEuOiCb64QsOO3+n84rjaiTZ3S46yOJxhRY310/+iWNRlKWwxBheMGXNJO6LDFznhtJryGOjFUVmQwdAZzAX6q62fd/i4C9s6YyGMTEMOzyHo+NgzMgUwCWNQYGnJMMRGQpvPCnE0jeW0dFj6gxqB03iLd9IqxarOCybjby6rRIiSgOulgN2oyV6Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=baidu.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubCvwaEUgfi0AvZ9q1ilI0JbXEafXh235i6OwnGgZbA=;
 b=jVXEfq1AVjDpBOw2y5wbkd3U/5bQilCkDrhAA+IwaYMTVdMiXsMM3WygK3Y3+gzTnqHjO86WD/dnX0Hq1l9gDEvkxGpG7jTF1QGMeM6RBUA1GGPICaS3VNWh2b8Ps3+NyJkoJTpgmxGBU5ZWdAcbWHzQUEPPZIHrMCt+yqlDSneHq3Fbz6IL6tz2gcS1SGWn9M7IS0rSaRGwYvuoH/9wZe88gqhV98EaeuMvafcRtWFIZltUd8bgxMtprGap6cWOkfvP/+0xXBkpPTZ0NfXmkRP5L5FVtDsw+Xz5v6ctCAYPsmhupKHwMrrBJUWbcB4sR7C0SprmhOMMCY3KhCiB+w==
Received: from PH8PR02CA0030.namprd02.prod.outlook.com (2603:10b6:510:2da::34)
 by BN7PPF39B20C1D8.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6cc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 20:53:40 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:2da:cafe::88) by PH8PR02CA0030.outlook.office365.com
 (2603:10b6:510:2da::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Thu,
 18 Jun 2026 20:53:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 20:53:39 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Jun
 2026 13:53:38 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 18 Jun 2026 13:53:38 -0700
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Jun 2026 13:53:36 -0700
Date: Thu, 18 Jun 2026 13:53:33 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: lirongqing <lirongqing@baidu.com>
CC: Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy
	<vdumpa@nvidia.com>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Nate Watterson <nwatterson@nvidia.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, <linux-tegra@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix VCMDQ indexing in
 tegra241_vintf0_handle_error
Message-ID: <ajRazf/zNHRf0jAN@nvidia.com>
References: <20260618075945.2217-1-lirongqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260618075945.2217-1-lirongqing@baidu.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|BN7PPF39B20C1D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c4650b-fe6e-4a8b-42d3-08decd7bac9e
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|7416014|22082099003|11063799006|18002099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 5oMR6b/sMtTZjwyos4QznJIr4KKxZYDlQqdcybBMEjEsio0GlnhKMzJELd79PDO3E6OG2gSvEKmrxGqjShjxBI0JQ4J1/Z4On3wY9daB/F+PM5k1u3I6fy5rJwEb/kCZ2gyntnoV26KXBDahgVbj468/NNmLzgBD4ebrDkdpIMdmhC6XcJyUT2zRWLMJn6S5JiiJEbv73aJE8bDc/E+jSKvhaS727DZYXKnb5ba3iuef+kfv0L27WCe7rdP6ld6yP2xz37CN36MrF8h/pVwf7BmrFvHpK1J9zyTspoU+CwartGMGhawO4N4UGOuOfR6Sqz3EgqBH3DKSZN5K6ZUqYcNJq1zNDyj2iwSJ+XVb53y4EWSA3jKTvcVJCwY+bHhx6y8/Rnv8xM/ZLXLonrwAfQz05ximyUZWh8byCMI6dTMzeVaOtEf56KoMAmTjgdcjhVk8zIeiTmKYNRR40tgySQ6++gkXHTbD67rPMi8iQ19iBilWMCByeUHvgu6aThtw1RBvcMMdbj4lcTBAgBKpJgzUSE8sFWNdENodmzBDfl3QW2BozMcN/Jh4cGwd0eGM7RjPpceBc9U1HehTbea0MDe9gagEjLyzdJsdD7YiqLO32y8nGQRDwMpdKxEbPlL+YAIGGcquAgG5ifL+EbhcZqIaHjdVf153vH6XR1i+ww4/0G2HnfvsAd+WV0jdRjeDuyxSPLkck+MIDOrXkcPlng==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(7416014)(22082099003)(11063799006)(18002099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dyqrzZaGWJjB/2VxqNs9Ika6NcI1srvCOfZ4TyMBHPsvWgORo8df9/nWT4KKo2tmMCfUZXtA0sUM61bwiI5VHAakB3QKaqWAvSY/kOmMNDWRW1R++z13aFLZyLCW7Xj8Gok5Z/Zk29tokVJQC4jScrB4GNRpPyn6TpmcqaxjYKF0NiLcFl09jwjikUNafwdg0seSaXbspjXTZaNh6z54fzivcgHJx81c3tr4p2HrwULDAMTxi/0OHrvgDt2X8HMzw6N5ZiyL8CZhPske++eCXPK/QgZcVbevVPMK5FDSuxa6i3if3W1UWl3GrY0+9mZyg6WUwiYD6VHtzu2QqIaIv4BRHebGN8Xwtxe4e2ztjeEWXrWcS+AtsUauot5EIGS15K7HCsjjaQrB9N0a2XaoA1sqRwYsQa/yz/tDLIhNEcBgFBOszqk+pZUN1+HPWW3w
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:53:39.2404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c4650b-fe6e-4a8b-42d3-08decd7bac9e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF39B20C1D8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_135350_292691_E487F045 
X-CRM114-Status: GOOD (  17.58  )
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

On Thu, Jun 18, 2026 at 03:59:45PM +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> In tegra241_vintf0_handle_error(), the driver loops through the
> LVCMDQ_ERR_MAP_64(i) registers to detect and handle error flags for
> each virtual command queue (VCMDQ).
> 
> However, the code erroneously uses the register-local bit offset
> returned by __ffs64(map) directly as the global logical queue index

Hmm, what do you mean by "global"? It should be just the logical
index to a VINTF:

  		u64 map = readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i)));

So, nothing "global" here.

> (lidx) into the vintf->lvcmdqs[] array. When 'i' is greater than 0
> (i.e., handling queues 64 and above), this logic incorrectly targets
> the queues in the first block (0-63) instead of the intended queues
> (i * 64 + bit).

This should not be reachable: kernel limits num_lvcmdqs_per_vintf
to 2, covered by the first 64-bit map (i=0); in other words, that
"'i' is greater than 0" shouldn't happen.

> This leads to handling errors on the wrong VCMDQ
> structures and clearing the wrong hardware error status.

Neither should this.

So, I don't think this "bug" requires a separate patch to fix.

With that being said, I have prepared a series of VCMDQ patches,
which I plan to send on rc1. And it does cover this part for a
defensive enhancement:

@@ -352,13 +352,20 @@ static void tegra241_vintf0_handle_error(struct tegra241_vintf *vintf)
 		u64 map = readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i)));
 
 		while (map) {
-			unsigned long lidx = __ffs64(map);
-			struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
-			u32 gerror = readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR));
+			unsigned long map_bit = __ffs64(map);
+			unsigned long lidx = 64 * i + map_bit;
+			struct tegra241_vcmdq *vcmdq;
+			u32 gerror;
 
+			map &= ~BIT_ULL(map_bit);
+
+			vcmdq = vintf->lvcmdqs[lidx];
+			if (!vcmdq)
+				continue;
+
+			gerror = readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR));
 			__arm_smmu_cmdq_skip_err(&vintf->cmdqv->smmu, &vcmdq->cmdq);
 			writel(gerror, REG_VCMDQ_PAGE0(vcmdq, GERRORN));
-			map &= ~BIT_ULL(lidx);
 		}
 	}
 }

Nicolin

