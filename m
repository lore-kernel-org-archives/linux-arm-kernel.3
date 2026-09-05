Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC6C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 05:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSTL3G8Okrk5MjJZPA99K85GO7GEcUfdLMk5e7059iI=; b=GK07jMAXJZb2Cy494lFcpy21mp
	YLpYWdue4NYTuBG5326z93KaESjSfCAmjyA/X61NWwWYoG3/HoMp1dBngiC+wpkaj7SxOmToq2ATx
	uJKLs3bvN/RwVEsovBeRzcrsIgyqVB1NBAOzFgw/Qh9hif8dRcH1CVNlMUudwtNchJxvX+SAV5hIN
	pSjGvRaaVr+q2qRqs1vXmatxEnCYSAeX4UUsFDdtFNqCNNqdGcS38lQagL/984cgf4uGCpZiKVm+K
	ZGcpqky0D51nSY5QCeco0UXLMswPEbmhNvaRHcNvwS/d+h7T32JM8Q/bKygKGjAraQQYA2FAeX/Iz
	cDqfcw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ie9-00000003geW-2UOn;
	Sat, 05 Sep 2026 05:08:57 +0000
Received: from mail-southcentralusazon11011059.outbound.protection.outlook.com ([40.93.194.59] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ie6-00000003ge2-2VGN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 05:08:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+pST/5GgdhHvWykJK/BtyYK1hnxAvzYo4wWivdA0oGOQg54buyiSgwQZFTa0wWPevzi+1QnN5CiJPevJ7+AWbLjzeQcBpr2SDcKtNElVKOQcwduRbPgvZby4LezxoHUXJ6FMwv42oQqlmHdWDOWuahFPdMbNlTk6tQRzaJOlnlJIjz4QOVp6amnUVk/ixLfRnpEgfrcmh1pjdeONFgLK8XLem7theGLoNEEyfaF9Xz12eYWh5WtO10a52tZpSEHUfnfIJp8Nn1NScd7pA+V7u2uPo9FGvC2WYKyJpW/1yiUddykXlbr/ov4iXSzecQIUkpilsRHLDafPLf+Jd4A8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSTL3G8Okrk5MjJZPA99K85GO7GEcUfdLMk5e7059iI=;
 b=cVr2Gtks6OZINui3s0Rw67HEWjl7gWS4GXbwrDI6YO1iSsNWgh97IfRbDeocggIpJoCNs5l0Nht8KUUUEItQuglK0ncStTqbpuUexghbL0qNyFKXWl51NNoUquLyvSgPDnFsxBGwDMqSxOTStNCW9gqeGEwM3S58eQABXF4aX9LFr/0LJm4mjlQME6HQ23TcMn6JLmL6ohYnDWsN097bZBpzw4LPj8TYc+9A3/W73bJAOYfq514hNIpidwO8Mr6dg42+dITQbgq8QVmRl2cwGAEaEzUoQ3lJpUwQrKCl9zBAo1knRGULcWZkFYq6bicG1XaXNtDMri4zBpUUSWs22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSTL3G8Okrk5MjJZPA99K85GO7GEcUfdLMk5e7059iI=;
 b=FI1Rquu+zhSztAjrJzOCAmmpdjCt6eVPSMd6nllVpMNguTA5FYjDKY2sZZT1jF4Pz7tqCjEDzIDnhqw/v3R37SK0WaEDdIajA2cwQ1Qo00iFKg7MBf6LVjSM7pW2nYeFl3KaAqv+TzULjxv8gQh/f/iO7Y6WwAYDpqhfXhJCLKUcVAj3ghLAxsQeB0fWUyMFoBzSRe4PB6YdCD62jNZO4mT32qO68PNxOhfBi8LF/5oHnkc93suGIj85Foeq+ixvYse0wLEld9kEg1O28YNCZS8eP79ojeKySSFUYQkXD49rAyyvjS/OTZCanuvM+mi998nY6tQmJWHNbuIkUjruAQ==
Received: from CH5P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::12)
 by DS0PR12MB8341.namprd12.prod.outlook.com (2603:10b6:8:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 05:08:46 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::8a) by CH5P223CA0022.outlook.office365.com
 (2603:10b6:610:1f3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.14 via Frontend Transport; Sat, 5
 Sep 2026 05:08:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 05:08:46 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 22:08:31 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 22:08:31 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Fri, 4 Sep 2026 22:08:25 -0700
Date: Fri, 4 Sep 2026 22:08:24 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/13] iommu/arm-smmu-v3: Support PRI Page Request in
 arm_smmu_handle_ppr()
Message-ID: <apujyBWK+COCa3Ts@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
 <0fe5f381aae307045e4cab97f8000c575f34a9ee.1788222486.git.nicolinc@nvidia.com>
 <178846311318.1308030.15663048615954357081.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178846311318.1308030.15663048615954357081.b4-review@b4>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|DS0PR12MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 3560613f-abf9-44ca-696d-08df0b0bc380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|1800799024|82310400026|4143699003|5023799004|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: RbEhO5iXZdjDWM5N22uhUZx7XUrlzMpAiJA52r76Mbq00e/Jv8khDj227aXMtsHG0ZeGmjBD+D2pxVOfAOz/L8LzlWqmNAe5VFC/Ungw4H8I7n9E5JR2yhKzhw6TcwNiUyhI5KPnKDylXWLH+Oo3UmCBjwnvJJAseqVf/u0YHIuiKllCjgVUNNPTai5RWDoVIgsaCAsFHqwsR64pPcmWoiKDE/VAySAGJkH2i8mrAfiqCauo8pzC0m31Z7T6Peup1ZjLQMTwidwoTGtiswbiY5mY9Ed7BFeqb+L2SMg7LLyeVEsU66gFXl4eRBy454tdwjvhADa6bp8Sy1C0IzXqIr1vk+pmkJzVdhjugf9v/cGUa4g6KDCEzjh1zsArA5wqlpfYd/18UMKOWMDr/iqEjg1xqjOlB2pO/4pDKmSavE8VyiCNKcVbCjG4yHZtHnEon3l/g5AkcbIVAPHt6mH6zMNyVivYO20/WpowqLHd/IAxb1+gthzWQlwvms2id2+Nd+9ww8w/fJ7vkwBhLwl/M7N2gxnSs4E7xfIF5KtWxy0MHjrDR1htPEMFcE5B4ahMY3xsGz/qKWungpwjKRkarsewqQ/2WmXm5lh44BAPMBg1VIHZZMF+BpbiCMa2/zOqlTZLPbH64EGGTmAhZT3Rs9YfBHNv3el9OnxCAfAl2rQkLWfIlDiHYlzIDFIqP3R4P0f3d2Jmzz/sEwAnDTH1VQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(4143699003)(5023799004)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4jv8fMZx9tmjaXWq5kZp9FPPrJg4h4FLAbzDrNhTIE05E12l5UykOCzE2C/TDCBABR07gnvR2Yr/HRbKnDwx0WeRLJ8P/YYH8z2BmG/fNyz6y0U5Y/RLO3IsAxQFCmPHleXuiz/XzDZlK6f7+cZHGyRgB2GIetufokI8ieNp2OhEmt9bJBpCrfhx3J+JrB6CgLlWCG4E2HMsvxfw0F7WJqGY/v6HLSTOfuSNPTq3bpj/2+214aMUaJMD/e6mJ7JNW0BIS69OXbSHCKv3rjH1mVryQcNmQLeKG5A1mUCflaCCFZrGbabFXHeaSNT5yNeten8izOjthhLCKAqGLxE9wePYcJhl8/HE72ltj9JadJFdMD3FEZARUtNM4peU1vrxnCAm+63NKLEVKGxlSdgiQc+HNfRTWDOUr0EStueVUDRyziaF/o3diKSylTiO5Ba9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 05:08:46.0971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3560613f-abf9-44ca-696d-08df0b0bc380
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_220854_650658_822929D0 
X-CRM114-Status: GOOD (  18.14  )
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

On Thu, Sep 03, 2026 at 12:18:33PM -0700, Jonathan Cameron wrote:
> > For an unrecognised StreamID or a master without master->pri_enabled, fall
> > through to the existing "unexpected PRI request" log + LAST-page DENY path
> > to release the credit per the PCIe PRI spec. Merge its two info prints in
> 
> Either don't bother mentioning pcie spec explicitly or expand that
> to a useful reference - so section number, section title.

Dropped:

For an unrecognised StreamID or a master without master->pri_enabled, fall
through to the existing "unexpected PRI request" log + LAST-page DENY path.
Merge its two info prints in the path into one single ratelimited line, as
a malfunctioning device can spam unrecognised requests that will flood the
kernel log.

> > On PRIQ overflow, partial requests stored via report_partial_fault() whose
> > LAST-page entry was lost stay in iopf_param->partial. Drop them by calling
> > iopf_queue_discard_partial(), matching intel-iommu's handling. Do it after
> > the queue is fully drained, since the visible entries all precede the loss
> > point: a group whose LAST-page entry is still in the queue gets assembled
> > before the discard, rather than losing its stored partials to it. Nor can
> > a new arrival race against the discard, since an active overflow inhibits
> > new entries from being written to the PRI queue (IHI0070 8.1), up until a
> > final CONS write acknowledges it.
> 
> Kind of a general comment.  I'm guessing AI assisted heavily in these.
> Whilst I haven't found much that definitely doesn't belong in a patch
> description, they do end up rather more verbose than ideal.  Maybe
> poke it to be more terse in English language choices at least?

Well, some of the paragraphs in the commit messages turned out to be
indeed verbose, compared to my original writings. One of the reasons
was to justify against Sashiko that often nitpicks on a corner case,
(which surprisingly works well).

I broke it into parts; hope this might ease a bit:

On PRIQ overflow, partial requests stored via report_partial_fault() whose
LAST-page entry was lost stay in iopf_param->partial. Drop them by calling
iopf_queue_discard_partial(), matching intel-iommu's handling.

Do it only after the queue is fully drained, since the visible entries all
precede the loss point: a group whose LAST-page entry is still in the queue
gets assembled before the discard, rather than losing its stored partials
to it.

Nothing can arrive in between, as an active overflow inhibits new entries
from being written to the PRI queue until a final CONS write acknowledges
it (IHI0070 8.1).

Thanks
Nicolin

