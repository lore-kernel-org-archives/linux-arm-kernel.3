Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC091CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//P9pgF8y7rrUmXmWErWHNcS969udW7Ut7v9/W0bSNE=; b=V17QYeK26OvViT4fkO5ZqFnH79
	kJSi3yvJJkvFrsd3hTbnqTLNdq5gVsFgsdQyiYiwjGR3DjzEwMKhjjt/aaczvxVvfPt6T764dSz11
	ARpewW6cNCqmub5YCM5/viKEDM3LVDtCjUuyQgyGqQYd2f2G54zJ9fEulbilmFqkgVndi2W088iMM
	dGQiimH4VA4R8Uo/gIshnP4FlXuz/zBrrn7W7DrAsRcYvCqClIUVT5C3AdcR3TiFTfXN8vDBjlC1J
	V3PrOkjENrR7F9dl1TZpYHKQS3CuMQMsIeY1C3MhiF2IFDjpaQJyTLBDFYVuSU+oJAoM5LOoCXbcN
	A42AmEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJGj-00000001QiL-13aQ;
	Tue, 19 May 2026 12:09:53 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJGg-00000001Qhj-3z06
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:09:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SS7cSu+ydQsgzKj9vUfYy/8c4hOx5mY02JDdIuSb8ffPszvfme2mv66JFTgnmSBUAXBBqJp2aGGDX8crTG3d1Mtv7zINULl7sR/zWUdcNQwn6gceN18t2Cl4dlizVHh7q6lmsqg2XMWng7uEygUgb1XJR6LkFG5KQUyYNi2f5KpEN7UPUOPivRU0lpjN07Idf1cCJZXhVu6+Lr40GiCf+CSG63AMgUWXlRWWzMwYRBFoj1uVhm32Ei0JJ1ML8xC3zzHqEx6U/B7E0rtvvuQgaIF646XZAqPXUplG70MhoBQEoP2N+lzGnJtomKlzm+eRgXn1c3l0fjX+HdsgsP0gFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//P9pgF8y7rrUmXmWErWHNcS969udW7Ut7v9/W0bSNE=;
 b=dWr5uhWZNAeDm3TnW8EhWuh9HZBD0+88/SxmV8vyOn0DapxJmt+5/vT5i9fa9JEOcC//2xaHBHJxO3+u7I4o6oOaTZZ9BafDrSgZ2NZ+7ju/IB+hlpZ+eyKMz7aWAAOY9V5HVslaJf2AYsYYSHz/EfEu/9Pjnun3e0dNS3paOnDn/+wnp8GxPYcZVT/KpddNwW8ZDhkOJEtIQAOWPEPWDb2NE+WxyYUXTICiP78Ohxgk+vhvhC+lNAIMxCHv6/MwIpUgcZ1iMCTAkmTHNkrLw/E5vDwUF3BgCNauuKvAlVhOse1m9AvOPLxe99ICzB286v0rcydPjaEkYEV1jGl+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//P9pgF8y7rrUmXmWErWHNcS969udW7Ut7v9/W0bSNE=;
 b=jmQQ+nbDvY60lIRshX1jy0ttUuzo9B4/AeWNGbY0In8zRaxVxuOTalvGEMd+pqdNOAs4JHo64jcXHqhXjPcoBR/d98FPdyg4chwreKhnigMfhQyxjq1377FsB7KQ4Lu64efR+s6mn1V8Na0bmQ5epV8aC47/JmSPI5gGaqe8xbt8pt94YMWyCdzgmcq1pO630SOFL/cDP7lBy8wIGGc+tdWCZI9M3ZvQRB4tYuOESJ1wCLfavUxgk0/3kdK1yM7MoLT+p/Usso+ehL453JB1UUx1SstlR2Pn/6T6v+e75UkTJH+i03Hq/MIck9mzhCzEoZ2z1i1AbBIgIGfm5zwbMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB9431.namprd12.prod.outlook.com (2603:10b6:610:1c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Tue, 19 May
 2026 12:09:40 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 12:09:40 +0000
Date: Tue, 19 May 2026 09:09:38 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com,
	Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v4 19/24] iommu/arm-smmu-v3: Add invs and has_ats to
 struct arm_smmu_cmdq_batch
Message-ID: <20260519120938.GR787748@nvidia.com>
References: <cover.1779161849.git.nicolinc@nvidia.com>
 <713ce34e90e836e32f484e214cb6941a6973a962.1779161849.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <713ce34e90e836e32f484e214cb6941a6973a962.1779161849.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YT4P288CA0074.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7598e4-b40d-4afb-1ae1-08deb59f80c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|4143699003|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: E9BaPjHl+0SyQSWm088OFI0Jb8zcLq4ntempZZFYJ63RO8lh4niKBJFvL4g1HwdRahiNVk8HLZ3rK0Mkfpizz4BkKrcs+lwJ35SoltrvbK22bzB541RgJ8EaQDQZABURU63Zl+94P6IWtIMlkqqcohnIbs8wjzLhSADqDFdsDp2XJ7iuD2g9zAPtzCG8seTmFhDffZOPPeKI5RuY0AFHUSiYExySYtAPSTaWDLQhkVR3Eikl/FeLQ9tzCIwC6B41amJfNCFA5TGqEMqEBbF/BLxlMsIMwMsxxaQwtEUpI1hbyQ9ahLbziOoyObLSIX26mnpY7gbkSYQvId7N0AnB6kukNgBcyEvPfMSQVSP4zA8fgjaDtDmSRys3B0pzvWJXUETiDWzGfOUcgG/R8OYDYi7Zd1TIb7F70gSMOdGu2idu9d2Kx5TNeKFq5t0bzSFPO+3iaQ6r0BpeIxGL8lHZAlU0hbq2CBPdSzRMibGuShnTa0nxnV5sZQIPyCa0Uqi/G4+cole4/fiqfXT/jFsX9hjzjyWqERSJ+2r88F5aLNzSAniaPuDkwsEmjMw5t2i5+bCvkRnORYa26cuKxfgPI48xpW2YHKaZbFL/kZ6KR+kdtPOKdAmw2A8pQdCJlvrmrgZu6CydilPQQEC3tt+Gcek0B/4kthe/upSS/iJRfAVLpn5agLOmbyzGjhXXgj4j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(4143699003)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oPITC4SnEYBAMozDbJf45NFeDowps+zSA6TGqHBve1TMx4CDIRWTjQnmEtNO?=
 =?us-ascii?Q?N7gAmSQRQvURN6nuRAC8AP7AGzwdYTcOKHlA0X2Y+bMwx4S3dInZ7lHueQOP?=
 =?us-ascii?Q?vopJctcR0JVZsW0cDLaQlnMC2rwMDFyGwTZ4AZH192bDMck0jCHn8MUdsVLi?=
 =?us-ascii?Q?KMBWdAo6PJ9Vk7mEvCkjUek3Wi24jHCaWBWesedZ2WzIhkrG1hlOJGkXw9Fq?=
 =?us-ascii?Q?+77THpAQM1nJ6jEY6zZWjS0uvcmztIcsyqQLVqgyjXy4W/d1fVtpZtq+ExuL?=
 =?us-ascii?Q?dB+7H2YFKt9WuX06Nr096+6INPvWX794KipLxsqe//CucfOTapVvXjQg0op4?=
 =?us-ascii?Q?uwWiYHqzCub523hGKh4Ah3X5ZPNi4s4z2GO6UbcRmbsJ6PxppXsy+jpOHTFu?=
 =?us-ascii?Q?Rm9HwkFSs2WGpqq6W160i5AnsUCt0g+vuc565OfR/c834/Gj79g04RC8OqbX?=
 =?us-ascii?Q?chej9svpSUvkymclnllyvhNpYXYQQa2mSJ219Qh6ocFehz2HTUNe6zq+5hqM?=
 =?us-ascii?Q?9AgGFxNiLj8h+tBFBob6A60BScaVhUxafqGS/B4rZ7L/tlP8RcLnJM4MLdHq?=
 =?us-ascii?Q?smDGOnq6FC3dljKVgLkU2ZeesNPP6y/u1Xlzw2pRneB5Sq6kQ8KcSKWLf27D?=
 =?us-ascii?Q?GoY38KcL1Fa1R58OqduZACX6vYorCGK11Tt5orQIYx3jWvU2aC0Zum27tunA?=
 =?us-ascii?Q?/B3JYl8jlmAAZDjfb/vjEtY559uLbguOnrmtyF8CZf7Jv0bSuaYmHyLeCLBy?=
 =?us-ascii?Q?cY/12s9H3BU7IHLBXN3Qhw4aZFzMHW5+psQb0z6K1VcBhgm31ro9oRv+9iHN?=
 =?us-ascii?Q?Vl+jjFwF7+kTygMTrescBObkvn2fxyR4Fy1IuoiJNe/v7LTmr/5G5Lx85V2t?=
 =?us-ascii?Q?huRSyBLFGmP8td3ObfP2f9b9F7lCamRDxJntm3dH+0vWLnW67fkYX3Whu8yN?=
 =?us-ascii?Q?59pcYJFesvgE+5kXD3r1ceb51Me+fUhMr8NphTkQvFT7fduhFHsjtiUve1Yj?=
 =?us-ascii?Q?YONEYPA8W1Xvzk4f+RmWK94md2TLTv0FaR5JJDnw9u+dTNsx9/WhH70HKjuY?=
 =?us-ascii?Q?FKbwaMZZVljMMz4uvWUELmTRP7pX9AqU9JH8ns/SBW8z/GuW7GKvvGmce5ws?=
 =?us-ascii?Q?W/Ld2GhfvKencGOw4odAwl3j9u5izn3R1x7LFcr4PkDcJ6+o0XSOqC7nfBtN?=
 =?us-ascii?Q?wK5rap6vmipyLHvPhgYBLGtixossOw/kx9uZ4jxCq/8v7RwSyVc9vB0pHdyD?=
 =?us-ascii?Q?V6tiPUFpLnfxSmPp1rtwUGIxlTpZbtPaj8OftN2rCJh7hwlUod5CVnHU8g3p?=
 =?us-ascii?Q?HbEsy5CE3KrVxuDtwxiTpEIKsADmXengwIJxG7Qxs9kr5tauYdJLWjcKYv5V?=
 =?us-ascii?Q?pt+IbCtQBvZd+dSgAUgVYmuXD6Qr+fbDOxZzChyr+Mtj3sMYdkGuzE39vXVU?=
 =?us-ascii?Q?ib21jdzZWuRsAaUjxdLXXiWemMz5U2I2bfXgduO8/JkMiKKhe7cijsgebyXM?=
 =?us-ascii?Q?yaofJKbGVcQ3IirbPlXnCBEzmyc+d7J5IWkD2w64PIp3lFpAzoPdHCf/PIGh?=
 =?us-ascii?Q?LbS1WijdqYds1ORATJssrK4KSr9e3J5DG89PXrI9J2+xdeqkm7owIhn/jLIS?=
 =?us-ascii?Q?fVkgCMyCdX7beYzpIrDXkn3Ord2pWElR/Cex1On8y9EQdBv4nkmCCwiwJ0bw?=
 =?us-ascii?Q?gnz1XVD4T5Qlwv56EUY1efTc700Gd3tegV4rfnqqWOZrNElB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7598e4-b40d-4afb-1ae1-08deb59f80c6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 12:09:39.9669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjxSudKAn5r12IKzIuaHZrKKCsjtazLNvyMnGuxbBfq25OwqNExgHbUEToPXj9Jg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9431
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_050950_985773_CC325055 
X-CRM114-Status: GOOD (  10.71  )
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

On Mon, May 18, 2026 at 08:39:02PM -0700, Nicolin Chen wrote:
> The arm_smmu_cmdq_batch_add_cmd_p() might flush a sub-batch mid-way, when
> the ARM_SMMU_OPT_CMDQ_FORCE_SYNC is set or when a batch is full. To allow
> a future change to retry these sub-batch flushes on a timeout and identify
> the broken master, the batch needs to carry both the per-domain invs and
> a per-batch indicator of whether the batch contains an ATC_INV.

This seems like too much to tackle in one series. Let's just assume
all the ATCs in the batch have failed and blow up everything for this
point.

I think retrying will be a lot easier by removing the batch..

This series has become way too big now anyhow..

Jason

