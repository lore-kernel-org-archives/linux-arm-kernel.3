Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7334AC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 03:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9MotQOSY0LVsCQPw+Q39CqMR5NnyIi9vRj90M2RfZw=; b=PRmir9IFngBsIIkJbuVdQ0TVDa
	9Q3Zw9WZPR4rnjNft+acag800uj84wkHrhW+Tpsdk92sCBzflGiBFllebfH+i/j/7AK2WsDG4GsKk
	Tbzo4V2b81ryynZ9GZSHK0c2l2KvgjFcX1CT0sDlOXtPq1vHDV7iR+7V55zE9J8cvZhan8XldRGQC
	DLkpdEGR+8Uk/jeoPm1OuJn622+mM7v3aDTAI/xSLhUm3ATH9sjpmH9HqOLO78v4EyGJeyeHXr1cs
	KkmA0GmiCTEEBCcde3uALQShBusxcFg44MLBgZvldss48MG3L4SlZjjekDljFLdeGeBODQtiE5i21
	lJGuzSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrS8-00000009f80-2BQt;
	Fri, 28 Feb 2025 03:54:20 +0000
Received: from mail-bn7nam10on20621.outbound.protection.outlook.com ([2a01:111:f403:2009::621] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnr6x-00000009avm-3vlK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 03:32:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTciidwqJU0jHr52dekYLPeelCAkzIDd8ceMh7RFDgsT2oYQCp1hH40IQ2z2lnVYJx71XtekseL+Z1FR+/9bZxhgtG1W5B6DJpbYbAMmThNwSJDelSWaf0KSkVRlamPVt08mRxn1vkFzXfGkl+JoXw2nCV9bVxWxZ8eBdBprKoWX01/043CtG+9slLW+SVKaclX6m32FcTMqC9TvN8/WRw+dl8aEaaOFQ3ne/LdftR2EolL87LffevwcVOFl6SdntQXHkntx4v3zP7TnoYKYdm5txd0i4oJVmU5SejLmoXbkaFv3AHkA3p8cGh0HuWIQK1shBhY+JfmeQBfcubjhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9MotQOSY0LVsCQPw+Q39CqMR5NnyIi9vRj90M2RfZw=;
 b=fwny091JVd0pdEyknQF0uIzlE58GJ61SLNlEa6wQcugzPXYFxoxmNCbrbbSD/QS75Xt0q56OEHUEliz31UGKEFoGgXtnAZzKUGv7LNoEzvg1MifC/zJAa3nCIFAQygrqy/TWEymMNAPex9HcgfPP5q+gfIzPiJCNOEx+MKqn05whll5wjzDv+bXArFWEvavuvhEkwj57pbQ0heBt0qVMyRsB7Abs9Di7VBUt8af5OihkMc+7GSSxN2mTdwlyR7UReFNPxgHj6mH3LV+Ivi0RGtCLf0P+DFlLzp11txF9qFYMCTwr3VzjZYfwC7S0or2OKcHTQd9Llgmhh3//uv+r0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9MotQOSY0LVsCQPw+Q39CqMR5NnyIi9vRj90M2RfZw=;
 b=mu+doOP7uN02urvArLCJ75oOSy+cI/AqZjlh7PvXqjwuxfCYQDkO3bj6oLQ49kF8Lt39U5m2D9GdrQm38/+DpbJpmVWCSiRKmukGF6mtL8UO4NVRK2Ek1fAvr03qAkdNaAA/7/LojPfl4HYYhQDCBOOjcMY8eK53WUo9WfQOzfipCx5f78yb/WiUtVsV/k3G1ZK6+UwnoN+CVMyRTKuJ0brYSoZuBtZqqm7skvMg3CIAHm7W6zHvyMkq4YGlgY9r4LZZbQAboUaWL8rdaPImuvfgAS0hzMmDHWwnY8Q5TuQVef29CUwjd5LCPe4Ti6O78T2FbByvdSTO47bTRTpqJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 03:32:25 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 03:32:25 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	Alison Schofield <alison.schofield@intel.com>,
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
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH v9 13/20] mm/memory: Add vmf_insert_page_mkwrite()
Date: Fri, 28 Feb 2025 14:31:08 +1100
Message-ID: <4ce3aa984c060f370105e0bfef1035869578be47.1740713401.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
References: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0051.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 883ee873-7778-4a3f-3954-08dd57a884ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/DsuOmG4D2FZhQtBclOH7l9I3CTZYOVupg8Hha01e7UGqkltXtsJslrmsR3E?=
 =?us-ascii?Q?/m0K26/NjGAcw6mALzRXmzIrT8/NHlBAXbKI+e25tn/gPyJI//qPqYtHKOOV?=
 =?us-ascii?Q?xqFdU63eRq98b4QHFOIWa/6mRDIa2xblN9w/aAMazNs2OCXjSp4XV7lVMscz?=
 =?us-ascii?Q?4oGDhHAQDSmxeoU6hfpcLT4lvdEYH8/fxXH6hEa3lKZDFjnEq3si7VcC+c7B?=
 =?us-ascii?Q?GSmZmPJXtIb1EfLKe+B3IsaM5kAxOPM52ZP8HqRVrBi7pdoCt9HIUy/JuA4H?=
 =?us-ascii?Q?lXSp3keKwj4ugKBNkAava3vgZjaxJeh41IFLWlh15cuZmaXQkOFKAM9bQTfS?=
 =?us-ascii?Q?x2LF7NXQt3StBBK4/xTn1O7XMgW9SdHuWSmj/UQelEALPS5Orbe07OVJ+MMr?=
 =?us-ascii?Q?dP+UWINQxqxfMSAraEc6X3tlQuvGZD+oThBsW2Qg6K4HCifHq7SAWvi61s9u?=
 =?us-ascii?Q?Xa4JKhG/3n417qs7eTxi6Jpsqsm0eBNnO/fUSDmE61sQ1/4YN8h3BylBFJwd?=
 =?us-ascii?Q?i40mXQ1K1+G2sBiGEDJUSE6xMmIYGIOAkzXjqOxmxGo/XIGlJ3eHjJZ+wOzL?=
 =?us-ascii?Q?WXQCwlDUgcrAqR+QuUg78R7mdBWW3wJ4YtQILmoep1CBYKncWeUrWucivayV?=
 =?us-ascii?Q?3iFmBjyfrhSVZYcN80+2WytU7RWrzFY8xz9Is4g+QBPsCd0zQxC9bPcZ2VBT?=
 =?us-ascii?Q?bBGfzj+oXte3UiHZR1KqMHbz6rzHEjNEvoO61DWUTwuLBzMCWxCr1jEx3stU?=
 =?us-ascii?Q?6JcJwOr07et1JVTxN40nxR+YXWovMVIA+91Ihs1XRy1tfh9B5ZylHb9KlqnI?=
 =?us-ascii?Q?cFFJTBO+Zg5VB5omgRriPWxeI/n+GswHWDXFAb7wEUJCVIU4rfcpDBvp+nNO?=
 =?us-ascii?Q?rX9XqGW905trUUhbIlTshsVObje2y38Mj+acSuUpeFUPtkwK4tKnRM+LdMeV?=
 =?us-ascii?Q?xm0FOeDiEVSzbtVb4jBeh+NVa1GZUH5/CFVVJkm1llEl8theEI3stsy8CH+V?=
 =?us-ascii?Q?+IHorsK1y6oPl7grHBTdM1HX8vScxbDd4o6gL774dBXiFoU0oqayq4Edj27b?=
 =?us-ascii?Q?sF4ShcfJqo2fDrQlJ0T0+e7AT4Ods75TGRg2HA+nnjRt/wBvl2k53UUkOR7k?=
 =?us-ascii?Q?eTXv5/RqlkV4x7P86cw1UuQnT/lW0lAR/AVrtEBACd4m1Il4D18S5aqb8tTb?=
 =?us-ascii?Q?GrC+YR2yTryHh6NK49+w/X7nckNkGtmMpOiT5KjP/0ys7akijIhVjLiM5few?=
 =?us-ascii?Q?w6v9lDNuEbMseObGA+Y92GAy5bDXHWvklJKY83s3PeEYxcCCNznbqC9u+sa9?=
 =?us-ascii?Q?1Q+gquDgNbfXu8vN/QsLm2Jd9MbYHMOZaMqh41ihLXpl1Reqbx+QCmwlPS7l?=
 =?us-ascii?Q?yHaYCNzoASPSKXxDguO748j7c0RA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HI9RyjoQRtff868b7y8ASyId4HgMAMe3BGnDouAnWzu/uYKM7wQ0EZZSNd/D?=
 =?us-ascii?Q?ZOShzghQqSOY2y9JIgBBlCmZ7X+Scn3IkYtuswlDhP+wplkaK6DpiSr3Rohp?=
 =?us-ascii?Q?lJszNdCVbEOz+g9Z82vry6PShFt6FW6692cEBhbTbHTINwOGJYWryKk5gR97?=
 =?us-ascii?Q?O9+tJKpSZxjGsZQiYaz13DyXTDv54uE7RlfI+IN7CnBmDMe/LVr/wDn16rt0?=
 =?us-ascii?Q?P/2rlBL0ig8TwNOW8OmtcpwazHtQA6Kawn7mlzV5zc5s1fOQQG/9wWOfxZTS?=
 =?us-ascii?Q?PL9Oz/UrpJJPFlQSX4FOjP5CTyoYH1A/9jNO7jMAu7V7b5fFjMdF5WNO0y8l?=
 =?us-ascii?Q?0Ua8xrYmjMnarU4EoJ5Alwgh3YS0dUj/V8kWHm2Wqtpc38SYgKqQVruvnpZW?=
 =?us-ascii?Q?kbpcO3TKXZPIIFVvBucjYj9/EgHJNW7dAqucF6vu1xEW5ZWksrlMaw7tv3iz?=
 =?us-ascii?Q?kJC8AJhYTqRXLLuDvtXTvOOmOaNCvJRscn3DnoMMWc1NGa8BS5GHbyQHl1rK?=
 =?us-ascii?Q?EpcVThmKN3zIMW2sLu3AuT8EjgszykpuS3jU0NkAGTH2yM3czyY5+z6Yji2Z?=
 =?us-ascii?Q?kZtTVRX+ZTCxB+o0hZNcozsF9JD+ELSMbbXV8K7UmG10n+eFTtFPts/xOueh?=
 =?us-ascii?Q?EgjR/sdSn/0jXUoA3VmjpDmfakJD+e2JNS3erci8ojYnPk7fTUs+FxO4UUJH?=
 =?us-ascii?Q?yqBw5piaimfvP4/RHDV8eqZZqDssRT2Od+QAc0JHVeh+Uhze/t8iwC5Lv75j?=
 =?us-ascii?Q?O/WQxVJ6xFs+flNcm8PaYLxih7+9+yhg3h31/K4E746dn+0nK81njrWbnL9+?=
 =?us-ascii?Q?YFY7t2+03h6NM+d/b8uK2piworovpnrAf4p8CBxN1ycgHKSUHA5Klx61HkWx?=
 =?us-ascii?Q?KoCcluYnqy3b/1OI3srr/2d2rfhX6v5fIGNekb1oZYio+9ng57bL0g5ACXr3?=
 =?us-ascii?Q?y0X02chzIBDJzpkkqA0b1LVm5MeKNen5ptKEOhqkVk2E/SfqGGzEaJzse+Zm?=
 =?us-ascii?Q?rCQ5P1WvdXlvz3Y88s1VQEkWyRUzG87Ghm2dppPqaKKjQZup4mtX4sxC6RrC?=
 =?us-ascii?Q?LZ7MJpSOlPDg1wLmrWRFVEhfr4IGervmwD0CKgkJEarTL3O3Oyh/EET+EXvi?=
 =?us-ascii?Q?47kD16Q29N3WSQ81u3cRSfMcgLIHuNYL4uyIBlkMc3pLgBOGlldVJkANAcme?=
 =?us-ascii?Q?B+tzSW1oub3P9Nid/d2XsT7xe7wJUpTWa2xRjiA4qWrY1clZr/m98l+n9uLM?=
 =?us-ascii?Q?+x+PHiFLSVnFFaIPYddUJb9+/o4Nvj8oMS32cgNqb8kwk0RrpJwjJc5aamZv?=
 =?us-ascii?Q?fNMzY5/0M6MWZkKAr94ZIq8GOImoDIxBhmOcc9Pg3Xa31CvyEd06KYRHFwQi?=
 =?us-ascii?Q?dDxLcog1064r4EdzmmTm6d4xeBEVd2Jqt42KM5lNCTpoGqQ6E83YDaIM9S28?=
 =?us-ascii?Q?2CwMEe6+MmKDHnwtpklqP+UhIgkI+Rwxyn6CA1u5gTnX+91Ho/tlLPcXptU/?=
 =?us-ascii?Q?iDLFKYXuM1NyRfwsWCj4rrnP2qeGsQH3ZsL9U5ub7+NVLi+nOZfASIsbFmv1?=
 =?us-ascii?Q?4pqOLGnKIaT+FiH0k96wXgfBVWAhCffZiF/gE7yi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883ee873-7778-4a3f-3954-08dd57a884ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:32:25.4061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jBjNko09tisvOWAzm3MedK7t9041xmxk6n9sPT4ks60612mt1ur4HnCCMpJQaRcBYcVejPDtiZGydRyrH3yWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_193227_982110_7B505A2C 
X-CRM114-Status: GOOD (  12.73  )
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

Currently to map a DAX page the DAX driver calls vmf_insert_pfn. This
creates a special devmap PTE entry for the pfn but does not take a
reference on the underlying struct page for the mapping. This is
because DAX page refcounts are treated specially, as indicated by the
presence of a devmap entry.

To allow DAX page refcounts to be managed the same as normal page
refcounts introduce vmf_insert_page_mkwrite(). This will take a
reference on the underlying page much the same as vmf_insert_page,
except it also permits upgrading an existing mapping to be writable if
requested/possible.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>

---

Changes for v8:
 - Remove temp suggested by David.

Changes for v7:
 - Fix vmf_insert_page_mkwrite by removing pfn gunk as suggested by
   David.

Updates from v2:

 - Rename function to make not DAX specific

 - Split the insert_page_into_pte_locked() change into a separate
   patch.

Updates from v1:

 - Re-arrange code in insert_page_into_pte_locked() based on comments
   from Jan Kara.

 - Call mkdrity/mkyoung for the mkwrite case, also suggested by Jan.
---
 include/linux/mm.h |  2 ++
 mm/memory.c        | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fabd537..d1f260d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3638,6 +3638,8 @@ int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
 				unsigned long num);
 int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
 				unsigned long num);
+vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
+			bool write);
 vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn);
 vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
diff --git a/mm/memory.c b/mm/memory.c
index becfaf4..a978b77 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2624,6 +2624,26 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 	return VM_FAULT_NOPAGE;
 }
 
+vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
+			bool write)
+{
+	pgprot_t pgprot = vmf->vma->vm_page_prot;
+	unsigned long addr = vmf->address;
+	int err;
+
+	if (addr < vmf->vma->vm_start || addr >= vmf->vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	err = insert_page(vmf->vma, addr, page, pgprot, write);
+	if (err == -ENOMEM)
+		return VM_FAULT_OOM;
+	if (err < 0 && err != -EBUSY)
+		return VM_FAULT_SIGBUS;
+
+	return VM_FAULT_NOPAGE;
+}
+EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
+
 vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 		pfn_t pfn)
 {
-- 
git-series 0.9.1

