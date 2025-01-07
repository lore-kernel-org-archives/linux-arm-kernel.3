Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D82E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 04:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQkRAdPnHKZfv9s6Z242sVDlB4+iGvGgI1xFM2utqs8=; b=Ck1fEMtY4K2+8MjU0c1tSmizBp
	ZvrWKb7cloQ0U29tkJHePOTZxQIMc35B87C8YxFw45+dRxy5Z05NVhGsNdH8JTYdRl/ulGk1/upDA
	MwnP//HppQ3P7+6L1TqOs8LIUzXULS56o77nekkngJTh0W74XfiVforuVqqHGrKoZc5TKL6e4GheL
	pye2/Qe8MP7UKass0nbYt/6lJ6KXyKKAQiccaovvdXUP5qVvijFxILWGhBqvK/KIVLlKqVgEevV9O
	196yuc2YBxti0+AVRuNMsGZjjJ3ImQcFst9dHmXIJP61qDRpJEv9j6cz9Q/9DYunRXB3blqj7BcEN
	q+g+G6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0p5-00000003QhN-1u9m;
	Tue, 07 Jan 2025 04:04:07 +0000
Received: from mail-dm6nam11on2060b.outbound.protection.outlook.com ([2a01:111:f403:2415::60b] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0WA-00000003LAa-2oqT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 03:44:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0pCVZDum/URSK8FOgFCfB9wXT3T8g3tP/pYDPHc0fSeJJv+GtvhKVw5v1XKV4/VHFeAtQrRwpF/wlOHqON7ZPqW3JCl9jgtaQ2sbPCpeS5Ds6L5jqRdP6X5JY9pF1CrQ3jho7yARGOPNL7jDdwE6l8dFhmTTquBkfo8Z2Q+fInKGUceqfsx3IP7STUGVc9NSo/U9v+NtZIcWOxzTd9+GuGGfNjEU1wuqoTbqVvctMTUTaTnrZlW/JhDOLQokc88Tu4mPEtI3owj8pZ9D3Qi7TcdrN7GlEhrqP9Uk3me4hVOn0t8dc9CxwL0RtYSY9LsHF6C7lnofQacwRJuh6LKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQkRAdPnHKZfv9s6Z242sVDlB4+iGvGgI1xFM2utqs8=;
 b=UtGBfk+GTNHAyeBgQAXoRr5IlnNLTod9SXqHrA41o57TJVkqD54MmTnMa5UGFjKhFM7/GC+bpWqeWBSFSZISt1rhoxJNyK5k9eBa3/h2okVyQADla6PS0tc8EYjqeNmNd63gq1DbXcQnYeZY8yFqaSpphPCu+eoD7epAvW/8MEb5ENiIld5ZXOJf3kuE/j0qATTNIaHPqMmt9MLjIGk8CYQTykGp4rM7RC7ksqHJ1yejsnkCztBsEAYnwhOGT8Le448rBC8xcc0yA97aa7ORKrtfRnBHUbzuNplNkSVNzaiDkqn2evjMwFe+RZcjFAZqdXikuMbSANehQ9XfEBX+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQkRAdPnHKZfv9s6Z242sVDlB4+iGvGgI1xFM2utqs8=;
 b=gdczuWLPdqDGJuGUEb4oObRDYZCBovFUjsbQGxrU7+ouYVw9xLRIkW3+ds7GC3AFb7gZ5d14/W3oTNdrYZqD4nLtBDoTgLkVT75ayLx9GbHKIyIooF1uLaTINyc421JQlvz48DXwBL+C/USPO402EjZGqOSoRPYh25v9n3xymRGU6hOSM8k/RR9gdDlh+rx5pxt95Rg1AVsu43NCEXVCNVyNWYXAj2DkQYNDGVt4lWytZ+FZBWRjlOjltwJCX+akej+NjZ8XnDUhweirGtcl5hCTj5h4aQMKMd6khYdJPJlLJA0QFyj5C3+qn5MbdWM1wVHNVDdby3wRr4W/KB3QoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY5PR12MB6129.namprd12.prod.outlook.com (2603:10b6:930:27::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.15; Tue, 7 Jan 2025 03:44:10 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 03:44:10 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com
Subject: [PATCH v5 16/25] huge_memory: Add vmf_insert_folio_pmd()
Date: Tue,  7 Jan 2025 14:42:32 +1100
Message-ID: <c18097d2e12146928ddf5cdc4eb8875063d00251.1736221254.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0002.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY5PR12MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ff21a9-208a-424d-fcdd-08dd2ecd8bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fJ8aTf7Q4hNdYV+S1MRDnQRS8aiBD3dd+sCvwa5Sm/jppRJcqbSGLiHKJfHa?=
 =?us-ascii?Q?TfPmsG8EK8GNuKqnvzh1PK+RjBPJog3abkxRDdzqRW1UHhyN2nRu4EfDrE01?=
 =?us-ascii?Q?Riem91bf+Jht1yzdjGFvUU2u7FkpMGottuMiNMdK3in1Ktu03spCW8xfeCxH?=
 =?us-ascii?Q?bR40JTvwdOSP67DenJ3MdMrEoBnDasnKkkANHbDqzWSOGOjI9mcRSRUkvGR4?=
 =?us-ascii?Q?bHNNF+WyuIl6WHEfIgN29rBW7NUTsXLUu71i1N2RmDvvd8xRGXALylP45iNM?=
 =?us-ascii?Q?X2JuvY+J1W1dNShyYmkL+H6za3bdDMxND8kiHuvbU39st6ouGz1PtPXgWfoz?=
 =?us-ascii?Q?tYew5Mm7UT5q9lYVVKUKXM7X6oRVIQHI4uRMuLAUqaREnhHbTs2V5iBgEic4?=
 =?us-ascii?Q?UngVUGWt2KUfAI6EFvxrdasvnv5ua6iMR4sAQvgKwvaJekkbqWoMLWNz2k/0?=
 =?us-ascii?Q?apBZkMrvp4JLDJ3/bPnKEK/UM2Pdasz8LSdWkg2nzWnkhm7QpeiUCZrnDO/+?=
 =?us-ascii?Q?I4QXl+BvOfa30ZAOoyYIi1a6Y0uL8+G22ecOFYpM7GWx/yMaNqBijyu7KNFb?=
 =?us-ascii?Q?g46pDqgpPI2qZMvkeXBHCvkTrgsbk07wmfm7fh9NOGtJ2Iu9zv4y/NMNjZYO?=
 =?us-ascii?Q?TRIbundQxlqRtbJ6bHkzXZiv+NEeXFJfz0FWZA7StjPCEMxrNRe519sqTgwq?=
 =?us-ascii?Q?Vmm2ZMCY1p5BE93di3RCNbT5TqAO3vuvkJF9U5VeYn3lgNZQNActZWzzS6vq?=
 =?us-ascii?Q?tJ/UAXfuaRVpbK8tCLFXCTQH2rkqKwqW7Fo/lHEBrJnrNZ6/Njwxrnh4Vvcv?=
 =?us-ascii?Q?VN1AKHHPeJRN5q+I0qxJQu6pBXINAsbwRW22AYLVii755zbFpP6AWWcQueIc?=
 =?us-ascii?Q?8S+BVQYxUF0CIktpMfo4SE1z+sOcI9+GWB6/K8IA2Atk+s7Niivu4o9xX26h?=
 =?us-ascii?Q?9ywsZJvxxZ8rMIqzFh7oSIHPC7Z0AL1FopfEAbdP/lNzit+x3+9QThXOgz5b?=
 =?us-ascii?Q?1eGrNmXvVU3YJiX1KUg2wx+LvX1ycsvy3WnVyXefdrwq6B7oFV7EtEFi2oWw?=
 =?us-ascii?Q?ge7byMR5OscgLMb5NY12y1AXGnjSoOpOcDY38NEL6Tc3ZyyfFcpKsjvmpWAD?=
 =?us-ascii?Q?XEJ/B232Gi+cuNnkVB5r4HYKBwJMfuIfsU9iC7ZMMevuN6RTOEOrDjweisoW?=
 =?us-ascii?Q?eqphKoYU22htzWZMzuEytQqKo+Xfqh3YlHFfEyi7C/nHO2pTYWsJAvYb0EN4?=
 =?us-ascii?Q?lpcoIFL0f/tl4OHRDaPxMc+KLEDWGgCCcNju7AWtinadScuBobNxYQyZpk9s?=
 =?us-ascii?Q?jvSun6XCsfWETWvgqQZXebVUqXG7MY2z/ACBdIinMvZeds3OuDMZ8JjMp5xH?=
 =?us-ascii?Q?MEc9/L5G0YSBuLL4Cfwe0VwLi4+E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tMFS9kcVnzn9WdfRrUFsXsGhixLcQIOugx8qPL4FazJreXlGFKskxKi/TJ9P?=
 =?us-ascii?Q?rDPqv2thvspX8kgnoHS9e4GZAinr/tK0lkBdM5Lnj+GsuXMaCuuwGpawWw0p?=
 =?us-ascii?Q?PQ75oHIDi34Js2WO+ewscbJiPiXZijVcWgUlmnPuF1PQVlC3BORUq+g1vitm?=
 =?us-ascii?Q?NMg4zbSFhZCr25T6mp5+8wdZ+SuaVX4hP4Wx63bl+1F4UDT9AZsNiGoR/Tbt?=
 =?us-ascii?Q?Sxn5MTlzOYdu0p2nrrRgoyL53iA0Sv2BkocQcr0fQuftiLos5R80Ea7drfqu?=
 =?us-ascii?Q?EbZejpofXEvihHthqqt03L/v2aqVlBfV2JjX56M4I9bgvINsI+7FWQxJ8Xov?=
 =?us-ascii?Q?NTLPRdIoWJ9v6cLcjiJcLk17Z2GVGm6Kx0EsFsoHER5PGxlXkyJI91toCGxZ?=
 =?us-ascii?Q?TRqMcCb3io7l1Vqs9ZsWAroJWCq3WlRe/C3VfdWrUoRyqJ+WGl5iVSS7LNcN?=
 =?us-ascii?Q?nhLRgxTYnIpbpKg5TpDjzLkkBE2FdwGeSbwSLTfZr/WHS/3trYeg4hzxmrBT?=
 =?us-ascii?Q?11DsP6kaC2XoCX1k+539XddINuV/wA22tZjpdAZLzcF7mVov4ZOyF6pGrkdF?=
 =?us-ascii?Q?Ost+SyUPJ5eplqPfREIGiKnHysYQfX2PH7pk5yz5twXZSoGRfon5VfHibwMp?=
 =?us-ascii?Q?4BLAwhijNbXC7WNh/RJKIWr8yi0z7tgcxZIx+ymmCslkY4QznFjoGFzMQsQu?=
 =?us-ascii?Q?d2NZP9ARhwmoJGpG6vkuJ6A0uSGDzWBKSVguaZJT6XWsntiPzLV5x6dKj2MA?=
 =?us-ascii?Q?gXHez3cZH5isNT7BUtk65rV7wK4wbScn41qFPNOFCGimnnNW97P4c2qVJKDZ?=
 =?us-ascii?Q?iLNi/Ow4PPsjwx4RGb9ASwHjtCtW07pTi8a40OWhKdXFhvuolhJmyu4HH6K8?=
 =?us-ascii?Q?LtDE+ylexCnuK4WmgJJ6Ri3NcziYEqzHzM6Boku77YIYvBKgu6U/t4k37TZj?=
 =?us-ascii?Q?vhZXjAirJgJDi+TGClp4d1JmBlzvi9i54t5L9Bg6uamyG6F8nhRf5CVsBmCb?=
 =?us-ascii?Q?bwk0Vd7j5sKp9H4GLIkn2HHRfLPQDsZaCAgmN1DNztfmbJHbcgtYA1APZsIR?=
 =?us-ascii?Q?bVny51ge8Ok+8KlssWNpedqahCMmOvCdtfDRlnaNMijg1nOH9+JEf/TzGuAn?=
 =?us-ascii?Q?PMiEbmiENtXSZA3pX8UuTNgAd6d8nn8Nf5vFpbyEcFoJXZ2rg3tXiudp+bZF?=
 =?us-ascii?Q?xk6VuQzlbX7SsxTcCgCuu7gO0KWpyrwyBHazrzjs7I9ltzBw7XEwZm150yYe?=
 =?us-ascii?Q?L+wO+KOIDW1/bceE+2KJcSgdrZO0bUaQKETtM+nyoYVyArSw2lyxtW0tlZfg?=
 =?us-ascii?Q?8LlLbD3XqMaABwp/VaQvmGshlPZYiWDNfBn5CkAkneyZ48TJBKgHRrtRQtsC?=
 =?us-ascii?Q?fS5A18qntvWOizHEJxQmS44mshcTKOzL95VMyNZEHh0CwSVsOB2yZxUif78M?=
 =?us-ascii?Q?z4NQg1WXWj4Jcy86n4VM47P02lLIK20oC5a7qqVZHxlGrmcUkvQXVB3NZNX0?=
 =?us-ascii?Q?9V1FxqPypRWcURDkJr0eMbMtWAd1+nClie4zfEWCFCqG1vf3rv/x5BMgX9X1?=
 =?us-ascii?Q?vn2TAJjUTVoG56YSMckGZHOs5HNNMhjr3VSV0VJ/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ff21a9-208a-424d-fcdd-08dd2ecd8bd9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 03:44:10.7676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P782a+BdGUIdl8LU00RlRVOMd+PAY3KRzF/mSSK9/b6idEn5JwLWHQgPKkoFISBa+bE/wOUj5+XwkI+n8BpqEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_194434_705213_41FE7101 
X-CRM114-Status: GOOD (  13.95  )
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

Currently DAX folio/page reference counts are managed differently to
normal pages. To allow these to be managed the same as normal pages
introduce vmf_insert_folio_pmd. This will map the entire PMD-sized folio
and take references as it would for a normally mapped page.

This is distinct from the current mechanism, vmf_insert_pfn_pmd, which
simply inserts a special devmap PMD entry into the page table without
holding a reference to the page for the mapping.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v5:
 - Minor code cleanup suggested by David
---
 include/linux/huge_mm.h |  1 +-
 mm/huge_memory.c        | 54 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 5bd1ff7..3633bd3 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -39,6 +39,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
 vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
+vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio, bool write);
 vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio, bool write);
 
 enum transparent_hugepage_flag {
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 60aa65a..d243c3f 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1381,14 +1381,12 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t entry;
-	spinlock_t *ptl;
 
-	ptl = pmd_lock(mm, pmd);
 	if (!pmd_none(*pmd)) {
 		if (write) {
 			if (pmd_pfn(*pmd) != pfn_t_to_pfn(pfn)) {
 				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
-				goto out_unlock;
+				return;
 			}
 			entry = pmd_mkyoung(*pmd);
 			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
@@ -1396,7 +1394,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 				update_mmu_cache_pmd(vma, addr, pmd);
 		}
 
-		goto out_unlock;
+		return;
 	}
 
 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
@@ -1417,11 +1415,6 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 	set_pmd_at(mm, addr, pmd, entry);
 	update_mmu_cache_pmd(vma, addr, pmd);
-
-out_unlock:
-	spin_unlock(ptl);
-	if (pgtable)
-		pte_free(mm, pgtable);
 }
 
 /**
@@ -1440,6 +1433,7 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t pgprot = vma->vm_page_prot;
 	pgtable_t pgtable = NULL;
+	spinlock_t *ptl;
 
 	/*
 	 * If we had pmd_special, we could avoid all these restrictions,
@@ -1462,12 +1456,52 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
 	}
 
 	track_pfn_insert(vma, &pgprot, pfn);
-
+	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
 	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
+	spin_unlock(ptl);
+	if (pgtable)
+		pte_free(vma->vm_mm, pgtable);
+
 	return VM_FAULT_NOPAGE;
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
 
+vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio, bool write)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long addr = vmf->address & PMD_MASK;
+	struct mm_struct *mm = vma->vm_mm;
+	spinlock_t *ptl;
+	pgtable_t pgtable = NULL;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	if (WARN_ON_ONCE(folio_order(folio) != PMD_ORDER))
+		return VM_FAULT_SIGBUS;
+
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (!pgtable)
+			return VM_FAULT_OOM;
+	}
+
+	ptl = pmd_lock(mm, vmf->pmd);
+	if (pmd_none(*vmf->pmd)) {
+		folio_get(folio);
+		folio_add_file_rmap_pmd(folio, &folio->page, vma);
+		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
+	}
+	insert_pfn_pmd(vma, addr, vmf->pmd, pfn_to_pfn_t(folio_pfn(folio)),
+		       vma->vm_page_prot, write, pgtable);
+	spin_unlock(ptl);
+	if (pgtable)
+		pte_free(mm, pgtable);
+
+	return VM_FAULT_NOPAGE;
+}
+EXPORT_SYMBOL_GPL(vmf_insert_folio_pmd);
+
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
 {
-- 
git-series 0.9.1

