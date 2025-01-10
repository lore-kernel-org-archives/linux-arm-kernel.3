Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1199EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 06:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvasEvPAGqJVTP+K8N7EJhMBB0n176CNkNnXIKkArIk=; b=RxJnKnYe/1ZGK7PL0Ek82rwsa1
	GdeIpwDmogpY9aLVfPSlDPwygWYJ2qBAM90OAOQNkV9QHTsFpwyuZRPfCfUEaMMO+WfYd8vtdN2dr
	g4EafbFHDXIN3OTZbU0k8AniHuRRiNTnhWs8Qthem6FPwW6Ug7ulMDS74JHuuQPodyMa3M4qa9TH5
	MiqXV4Er66wxcbsE51rjF52weUCBjilZP4DxVGVGDLMgXC1kHqjOXv60f1Saj9gnSS86QpRVOwxRY
	vs+bRgwn3V77Tde4raUNMlAr/47sdat43KiVwQxi4v15AHmq+WwIIx7zMebesZwbCGwOXQ4ZcUQLZ
	F/Z7ccOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8Eb-0000000ECcn-1B9n;
	Fri, 10 Jan 2025 06:11:05 +0000
Received: from mail-bn8nam11on2062b.outbound.protection.outlook.com ([2a01:111:f403:2414::62b] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW85b-0000000E8Yg-2US8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 06:01:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qh9tp4/0YbZn2nWeTLXHyrTNOaLsGZMofCYl6ceaUO8Nua+qvE+5+IfYzPJ/9JryvQifl2Y4Gt53cgx+HxdFpVctWnMalfcCy8rs+1djtw+cLsHX0JE1op55Pf43SrWc1E97AsDwb5QEAkLs1Go8OB2NF1dDKqmsIqSHjpsyLqUzg40DKSucmqSDwzB6hLNy80F/1RI1IHDMERmxo9WurJxahGBOj25g8/PACYga8Alw6tOwuFJZygqUG3yuCbqIcuC0Cig3I8n1ByvExyyVor/xjiQrAJGvkq/WJgDrt6tyg4G5+881A+JwUZLzrpu41CaGsZJf6K3gJNkzZS90oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvasEvPAGqJVTP+K8N7EJhMBB0n176CNkNnXIKkArIk=;
 b=P6xhkPFHUfVq0IkXfjFojZw9jo/q+XLv/ONYNxFzXcd4Mh93NV27oHVvR5TxvLJc56ypW6+wmMuttFLTWiAmW49FnIIqp+0A6Z1Sh0YeX/YPVqf+uzQnKDOuyAsJHqbzmijH6BLJE+m0kRFT5nPO+0Hpj2q2fVgN34/zj8GjWWOd8RXBoF00jjZRlErb06JbQ0eQlC1DDH2I/N9YdtGPs+RhfE6P4VPKMLKDrDhXiaPrjJ7B2tBerC5cft7e7O4p5Y6WFrC4l+gD13C0As+rG+99PkpWFa4CMRxo0LC00Q0vh6FmE9qU7DGDGgl4AUosaKKQGuDtwbuDH4yl+7hukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvasEvPAGqJVTP+K8N7EJhMBB0n176CNkNnXIKkArIk=;
 b=Yk+eJDRXZgSscbRqcEqbPoZlFRsC4DaIWgZURApVdJzENdpBOYemD5oTtk7Bv3M7miQcoVWKhxQ+0zOGLa6notZnQqS4lAN825up14i0mQJhFKWj0pzFjDGYPsPJUxHlm6hEOjxjY8lAKNZpfi3i7qC4cehHD49JCQeKYGRH31wm7ae27IYlfdcmOKDa/LUim6lUIC1fBB76ejuDly0FedNv2bRd5PeHvT6Rsgc9KnSsvlwkTduupFYdIKdZUOjdD1JRbH0VdhrXgeXCk4aGRepBpT6eiKL3TVSNgkhQuD70xVX1KkBgTMTsc7q1UlLiI06q1A6cDKrl+5u429mKkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:01:44 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:01:44 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: alison.schofield@intel.com,
	Alistair Popple <apopple@nvidia.com>,
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
Subject: [PATCH v6 04/26] fs/dax: Refactor wait for dax idle page
Date: Fri, 10 Jan 2025 17:00:32 +1100
Message-ID: <55b287f58e47f27e171308494295a169a9a9001b.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0094.ausprd01.prod.outlook.com
 (2603:10c6:10:111::9) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 471635bf-7752-46a4-8f55-08dd313c4252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SJBiFmmmwOAXH7sUQb1zVj4/9eXHOdFPUQg6GYVtU5LeRYLdMmON9/wOvLye?=
 =?us-ascii?Q?dtVwzjVuaHqTNTy+e8VGp1VuFrYVTsn1PR0yw2K/7crhvGFnenov3I6TwGw4?=
 =?us-ascii?Q?ptLmK8y4FpC84L0aZmee42E9bl909tQAxLb+lzBxTh9F5tLu7e9QPOpwPmKM?=
 =?us-ascii?Q?2iNy3t4qsC0cjvNl0Mm19H/BbaF9x2Jacap4rQiXyqulryaagcqmDu3NlX2/?=
 =?us-ascii?Q?77DTWJdDNz2Xztprsu1OeAcnb6fuOAPkajWogGUBcwhcA6Iv1TEpRnnjx0WC?=
 =?us-ascii?Q?Qnf1c+MFdPX9AXsMLHEqhVVvwd2uiWhxynaek5OAk8bGzcYR9HouM8dNe0Et?=
 =?us-ascii?Q?kkqeHfFJQxcefwI/FoBiHpDp01qT2H/P8lZWYBWPE2QIBFwnJdu4gLWQxRaO?=
 =?us-ascii?Q?U8pOIR6c90a+3Bfah0vz6lu4dvIza1mqjEOvqtID7CpiP3TLXfr5Oc3bt5DQ?=
 =?us-ascii?Q?6utmFlWiOLfaAN7fmu08V6l1JX7KYtLGd1JRm6MhRbUHNfujlpMoff0FGtui?=
 =?us-ascii?Q?7EI2cEgFzeYSpDZcszj2xyexrn/HNRAsryn/P2EpSQP3X6y/dDS/adCMaQ4W?=
 =?us-ascii?Q?7G3aS9K8OlHARbCN4+ORb4to2FXRzuy3+vuHNJQtkhq1d/pRuDJdXIocNRN7?=
 =?us-ascii?Q?ZNJB87CTr96JmIuKGCNzxxr4g0UTSqBDZ17IVHrJPMXwfidXPTLcRSYudvLD?=
 =?us-ascii?Q?afqmRqnMGJJbS+gg+SpYSSFfxjylPlDyUBvrCUfMhUILzqNnmfsSyahiY7Jv?=
 =?us-ascii?Q?pTRl4C0AE0LvDPTHNy+kkFUztkfWitF5IFgQEa2nly5Hcu3oh7p616xQWrci?=
 =?us-ascii?Q?fJ4dVHH+t5OqtLx+axN1FptzLGezRckRVFWi5EG4WXV8iCYeP+OZyqIFpi+b?=
 =?us-ascii?Q?b829XQoUPmdotsmbgJEoUvg7s5C3M6Fe0ExxB6SMCWObq6q1KlVCrOq2Kc1r?=
 =?us-ascii?Q?WM98muSO9P/SrLwFPlmQFaVMUc1imGl41rY7CUsK/PNbOhdsUFfjh28FiuNx?=
 =?us-ascii?Q?wjCHCCSGlpsmeGvr6e2Nef+pyguXp8yCWUnXLU8nMfBEa+uKJJ/ZUZxpfZV+?=
 =?us-ascii?Q?jpcD2Ut6NMbFZ8oJiuq/l7/roYF5CLNO+iGWVhHCRucZS0L7hFEeMwhV0Vxj?=
 =?us-ascii?Q?medW8e9c5OXXzJdGXG6IZI2k+gPlssY8crBNIoBdBsq+xIL6mO7cBoAK9qyJ?=
 =?us-ascii?Q?aBMckCc/hwRAGMOkprLqaIAzHtGfFFD2tc0/gchGEJWM+dBfVqNBcaVVtsj8?=
 =?us-ascii?Q?wakE7+nJH5Tb9IQ6TIA5jelPJJm4yz4xPA1mwUiDsmxaTcPrbZ4RjcUjQ4A3?=
 =?us-ascii?Q?XEREm29LsodfbPd/TmR9s3FuCxN8cn36qLYZjO2CC5TjPRwnp+TfXxjgs0D1?=
 =?us-ascii?Q?1eISN2C7OQGrnk7zrtf0tSYVN44o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?11e2SI5VM20SEn+FQ7HnP/QRQ2wpQ6iEJiET4C0ab/4UdpvxxO+VJmxJPwO8?=
 =?us-ascii?Q?iHF1Xts0O/clnRez8lrYwfVOOIBxbDGOofkZWwvSK6zFqsH2TR+IY/xQd3og?=
 =?us-ascii?Q?UBcxZaLUEVqrWeMBRXowimNVA8K12SCs/3XryxVORdwOl2kiZBbZ4Ph/Wymw?=
 =?us-ascii?Q?VAKX8otHpNqcV8p57JZah8f5oN1YbrZv/s7eyWySa8bbTR2T+NLErxMHlwM5?=
 =?us-ascii?Q?IW57OPe0mTuW89+Vv+yE7/ZMBcQpKX6oBiJi8nEG3GCnJv8nSufEhlgX8glr?=
 =?us-ascii?Q?+YEZx48EUJceSiR+tfCe3T/N8PPtRlKOcBXP+4wltTiEjNIpDwgdwJatu8Tr?=
 =?us-ascii?Q?dqJNFn509Z05mgKs2QcoBRSi48d74/GBdQYLVqFrlsYd76WHVJ/HPAAnwDrK?=
 =?us-ascii?Q?S1gksLRCr3ae/t8juhyO6ILMniq1xf/vrwx7akoqEZi/uc1sjcTDniwCMjRX?=
 =?us-ascii?Q?jxhNmREPOj8zPVilLaZIMDlt81KVuNkRQXcOFtDi3JYLlJ6QDskD2+sklfrm?=
 =?us-ascii?Q?9HBLuTQZgXHq7l5ybHUGgFSzIBDvjfLHCnEyl+478kXWCzrdv61oUWzl42qG?=
 =?us-ascii?Q?ywV3uQ3CGFRVIUp1msLjSet7o1lXUftljJwhuj4lUXDgxHGz2fCr98VWEXIA?=
 =?us-ascii?Q?DVv6VLS5NnD2V4X8cHk8oca7vm7pDSwG3wgquLgRpuYMW+67Wynx4GdpFVo8?=
 =?us-ascii?Q?0K2K0HO0puR8y72saY5DFOm8YhW2G5U4RD9zTn3S/6xRENsUsiL6nmC3scff?=
 =?us-ascii?Q?qASyP7IUkcvGibdKL3ik0h0t//wkisZkqCtTf/fpwyycVD9jOs5txd4NXRuG?=
 =?us-ascii?Q?5AekI3d9KcsRwEN9P/Sx/360ca1RQvzVqsxmKdvAPyFQKRE81rOE3YrkDBiM?=
 =?us-ascii?Q?RSbCePApLo+3zNTrMjK17935uKae3yv6T3i1eMLxmBN32eIB9QhecubksAhc?=
 =?us-ascii?Q?OmKsW0qGZ3UsmDMASGDgu59DSm4PgX7S/5BxrJRWSJyrZPW2iYPXvxWWX7wQ?=
 =?us-ascii?Q?7kVOoFfIU93JAOXs5KtnRxK8XtwMmWobEW5rNV3ylRDC2/6WC74IK6VAAUd5?=
 =?us-ascii?Q?yXvWNphdPSXa58DqpG9GPYOrYbdJFj9tv7qQb2P8ufHz9XM8KzyZDL9uRZOt?=
 =?us-ascii?Q?FXdrmygLsgBA0zXiyZ6tL/+pfTMN34NNDkC0Y8LM51kKYYavT4pTJYiHT9j9?=
 =?us-ascii?Q?UGU+EYMba76iXy05XsKlE0PPdeFwZlfe8g/EVqxM0K4MM3EL8SuS32CxqdKh?=
 =?us-ascii?Q?G1Af3zJoy5hIE9TVVDPg+x/AeFNHQHIQCYU27qH7jgo6mKV7pXxYdlC0fUY7?=
 =?us-ascii?Q?ioJvKJChghMdyHnoYmbTXcJgNXJb6XWMeV1XKnUCw6D3QgD5pYI/ySzE5fFF?=
 =?us-ascii?Q?LvQBJgR8B2jZjeeI8zHt8NHnIwAEnfyO9o1SCm0N2yXOWuVnYte5WOou+NkU?=
 =?us-ascii?Q?Su+R+r6MejwCUGrglsvy295rE+hs+Lg9l7yExwdqEjYCOBJWeHHoUJV/MBBk?=
 =?us-ascii?Q?AsdLiTcYyhIVoQygW5wjXChkxiwv1VbO+y71e+wYlEbBVxaAhNPr/qxN4MmM?=
 =?us-ascii?Q?B4PWhkMPB1lzf0GG95nN1rMzQ6nPCm8CfzSUu9O8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471635bf-7752-46a4-8f55-08dd313c4252
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:01:44.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+s3S6WFCfVxFIKPT1mPpHjB/ajx8zj/Y9j3Ln04d0fSMYiQlcbIAwDkqwe9r1N3CA/tXLzsC8H5+ejWgjevUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_220147_649515_41D65B33 
X-CRM114-Status: GOOD (  12.35  )
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

A FS DAX page is considered idle when its refcount drops to one. This
is currently open-coded in all file systems supporting FS DAX. Move
the idle detection to a common function to make future changes easier.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/ext4/inode.c     | 5 +----
 fs/fuse/dax.c       | 4 +---
 fs/xfs/xfs_inode.c  | 4 +---
 include/linux/dax.h | 8 ++++++++
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 7c54ae5..cc1acb1 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3922,10 +3922,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(inode));
+		error = dax_wait_page_idle(page, ext4_wait_dax_page, inode);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 455c4a1..d2ff482 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -676,9 +676,7 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, fuse_wait_dax_page(inode));
+	return dax_wait_page_idle(page, fuse_wait_dax_page, inode);
 }
 
 int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start,
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index c8ad260..42ea203 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -3000,9 +3000,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page_idle(page, xfs_wait_dax_page, inode);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index df41a00..9b1ce98 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -207,6 +207,14 @@ int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
 int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
 		const struct iomap_ops *ops);
 
+static inline int dax_wait_page_idle(struct page *page,
+				void (cb)(struct inode *),
+				struct inode *inode)
+{
+	return ___wait_var_event(page, page_ref_count(page) == 1,
+				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
+}
+
 #if IS_ENABLED(CONFIG_DAX)
 int dax_read_lock(void);
 void dax_read_unlock(int id);
-- 
git-series 0.9.1

