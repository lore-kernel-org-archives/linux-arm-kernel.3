Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BF4E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 06:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDlQUB0aqP2xs6wtosFzyl65rMLf5s6Je3RoskpfjSc=; b=vo2axVSmpB5y763gIFRMscgcgc
	cFvyf1Guds2n/xwPv4v6vRBUmgjQ+i4icBgu5bZMoA6rQhvu6aLmL0tjFn1m+vKiEHYs5aaV71QOy
	ykcYi05luGUumKjq+MpWSlMTzIFS7JgMcK0IqtlqPDuet5TL9Fxvi6NjzOSnvzhbTA8urhgml6X9q
	smU4/G+Yx2YpBeTSQcWJEJaCygy+MpCTEGZdAusjqiKzDdMNMlOOn3Kt19mgPqPcEHpycXj5kNnuo
	dHCcriQBojhA8sQb/DeAF6Incde9Ee323HK+D7v49jhEoXOBwXFx/o4Km6+7sulYvDC9qMD03Lyss
	8ZKMoIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8UL-0000000EFgv-1Owf;
	Fri, 10 Jan 2025 06:27:21 +0000
Received: from mail-co1nam11on20616.outbound.protection.outlook.com ([2a01:111:f403:2416::616] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW86d-0000000E9Dp-39QI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 06:02:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmxH2JMN1fECXK/UQWkGpBm4Zp2t2g8QV2Nlz7U9MrdKdCSj4Iq39rzTvL5/r1DQ3xj9qSErx2ppYpuNnGu3r8oAIJa6sk6MsFLrPMPooYRuG93aF/T5J86MaG+EfDJ9DOJBG3kuIunjdHnNA6GA9w9RimCuH00bcCnLhc5cOO2p3QszZocmXqEhEiWhDzak/B4QtKyEwVwmkxngNd2zgW8zNXdNBoAMrNKUDR9QxnsFVw6wXfttBzllDvALz34VLOiBnx25oQUbXuPoJFe8JV1jnolT4I2pZlB35KNHOWYw2ACjjYxe/3w78AwfnP+gotkuUPYr0MBfnVjZSPb/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDlQUB0aqP2xs6wtosFzyl65rMLf5s6Je3RoskpfjSc=;
 b=kBZFUnvb/BkS87rRzHyjfdx+AU3o9Lw3bX+3I7So4qNH5+odnTPKFwB+JNgxjMCEkJGy0vSwNgttN4hl/Pz71HZqcI5o4WxAaPsHTC+KbUuHad65JBsLx8+T/H5vYfWQeu3hTnWIokiMeR/E1/CIDFnJW5CH/GFOt4hgPfYEtfe/0Q7PDMrqORxB2hc+M1FWFGFDQOeVUGgbe50Q5y1SPhUX7PYEjm5Zkse6JZ0z6+yuELBVg1sLMDAd5NYUZZ6amhkOy33/ncvgxf3SNTmSoClSGPftf1EFEo2eTU7a5ofsTpp2MQiwFQzgV9GirejFa+CguEE+mqXAKaXNcCnsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDlQUB0aqP2xs6wtosFzyl65rMLf5s6Je3RoskpfjSc=;
 b=L1vXwFWjm7WZTNzLNJN0Wwh6i7Mo7n1obzO//hXblwqbYdAPPddwaUrq3JPaSeG2d/ouK602G3NtEv3C6PN94SCNOkZK9z8vNkE1e6CNUb7ZWtSW+CDoxaJFb0jGO3qh/i6yenZlvxE/NuTonFgO+NrKmW5yfeHMPwvV0ZSHXf+H1RMvbdQGDdINKCr9YfuYZAfCVHcb4qrfeDvBmudSoXyqVR0kgbNTTfrhITDQ1ORKcnKI6/7AFJ9RSzRu75ayOBctbbTuzmC2tosbK397+WhVcq1SoodP6OydvtNbFizYfOk8gLZxI29g1p5hCfKfXvgowfD4mpm8VBqC89WnVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:02:49 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:02:49 +0000
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
Subject: [PATCH v6 17/26] memremap: Add is_devdax_page() and is_fsdax_page() helpers
Date: Fri, 10 Jan 2025 17:00:45 +1100
Message-ID: <99041691148ed3ef92546aee0dc0cd78ff143ab1.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0070.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: c158d73d-f968-4f23-1952-08dd313c6967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qWz0Bk/2hGDOzGkglyAPRKjSCgEDEDk4wvbXrXT0CqKEC5ljjrnI/INSIDDX?=
 =?us-ascii?Q?4QHddbUP0gYZ2t5wz/c6j5jt+8oq5/Fm5f4gvOuTGJrPYlg0zD7s4QqUXpj/?=
 =?us-ascii?Q?E7prOpwJlzYm8OAZe0CjbneItz9bCzZ/zSmdGNCclAp3wkgt2PZIDqw3EDGi?=
 =?us-ascii?Q?LdmYl8K0h1POgN5+mrUvFSQ/5rzBHWpkOSfp3XdgRYz9PagEgQb0ZRKLFWEf?=
 =?us-ascii?Q?XxDGiWaOZg08Ql/vCkbO95vL7ZfL1vU8IJN5glFPr7CwnkJ2jbv/ln4ocKQk?=
 =?us-ascii?Q?+ppRfyvkxX2SASN2F5Kku+EvvtflioNwNNF5l5W5H2Expdt2b/2MyIX5zlk5?=
 =?us-ascii?Q?NiFDg1HY75TmlcN5uQ5uNGaMPB2UhzZZ7+UXPPgw0Y/7XC/GV5U8vgaanLWh?=
 =?us-ascii?Q?w569hrSXWwr1YLVk4foY92zz9Q2WOLDzzkkZOHCj7RyqG2LXjc0YKvD5X4oD?=
 =?us-ascii?Q?tdA6IA4/iQJ3qAP4g+zLmmmJvzmBHFRuzRnC5yghI39tNFgBoVrINztiEGj+?=
 =?us-ascii?Q?U1sye/kN3VsC2m5Mp2+wWU/vEPl0YinbGqNzuGhXt7UvZUbTM0U/4Bw73Kwt?=
 =?us-ascii?Q?HCLi46cZYXghjqqzthCDhGpH3VPoYfVJyURHYlk3qn2HUVM0GgPx7i6xzQkG?=
 =?us-ascii?Q?9COugG61ad0iKH/UEw8DOyfY1AhCPeon8mZWnEcLbF5aBU66U/2yPZXG+zd3?=
 =?us-ascii?Q?spNgEAuYwWSnlVS68aRV3ztM9P0BtmsICZRXLq3OBDeI2OaA4gJjMOkrCzuA?=
 =?us-ascii?Q?mPeVLapBez30o26Zhg8AZMD2dTfOh1/ZvDpFwNreMl7nFDUTKkoRZyCbsnPr?=
 =?us-ascii?Q?DLRLlxwEomYZWBH4P31Gmsh0FnBOVsUgmtt4zo5cHVF2+0hPQjoNDDTC39ci?=
 =?us-ascii?Q?R60TRy6WD+JRvFVYd/Ym1ayn87FyKDyrBvd/vm0Oto8vQrQVC486Jcli7BrA?=
 =?us-ascii?Q?l0C7Kuv3PRMC6VSmByRJVpmCrXE9G2LDFMWFTEChOTYvYsR3K2IGlADSXXwp?=
 =?us-ascii?Q?eSD+D+RRZq12/lAXgqg+nFI+EWiiDe393nXRxv138GtE1degNH88o0LIf1Ez?=
 =?us-ascii?Q?lBSsVt56Iyca0ksmhiP9M4yCJCzlxjxhomZqmlyeIuDZV/k3f8h6T6Wh1uRR?=
 =?us-ascii?Q?G4Oq1vdXeOjZFO/ml1dLQ0M4z+DReK6B++LvFO7l3nkD9wyy6IZgmpuFWQcl?=
 =?us-ascii?Q?BoQzoJn4vyMsvM6TAv43Ub9KJg5bHBTaDCTSgi+qtYZYbW/O0+W/sPLsS4nR?=
 =?us-ascii?Q?Gy2QvIv+rV8zL1JZlpuS+BVLlNA0Hzi+9NqrMkxOx7f/AoDqdkrpckOfKLtl?=
 =?us-ascii?Q?2BAyB8h/UAtVZ4ZYJQBeriJfKimZ1drd+OoBb5bi7Wh44DHDy4cUvquwCWGT?=
 =?us-ascii?Q?ARdQJo7anFZMAJ3y3xCTttM9mv2v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h8W3PVQqU5qS/0AuU7etOCdGBrZv8hPNMxKA2jAbTCXhoJdRYE6pikxjmcjc?=
 =?us-ascii?Q?ix9NtOGZoc65z0L4heDvRxFjlYUIdPsCjQY/1uFnkFsPaE789oPxtfD/QL7X?=
 =?us-ascii?Q?i89jEbH5RuQDp1xOM7vBZ0mp0tr35ZQLN1orhVXGMd97xetVZjlNLX2GRLff?=
 =?us-ascii?Q?CyYlISbj0cycNRX43Zblo4B1LqBEuKw5IMS97FcfJcs+QXCfHmR9Xw43X8GD?=
 =?us-ascii?Q?4Sme4PmzWF0fTQubeYUS84NzMfkXeAunKx5G0o0jIABxNJVoBwZveCPOi8Pa?=
 =?us-ascii?Q?k9fCMW3vGuAtonZbhGE7N+0Xi2BPpu81MPqcVEyiQ9d/ZtlasZfsEp6Klkzy?=
 =?us-ascii?Q?MxV3JGM8zgQGfhsXSs/m9oXF2ROhcPjtmxyUoE0cWTcVBtOR9llQONonCoEw?=
 =?us-ascii?Q?S7BygpJkTA/M42jBTSAb4d7b8TBtfqZ2GC+Oh6Xikn5LbwaYQu6BUn3PG5Bo?=
 =?us-ascii?Q?GxJiEUJMn7GXU5piFR70MLY2C3KTLw5Q7IevVRjI5PdUvVq6gfU8vbkzPq0h?=
 =?us-ascii?Q?dG5RB4uPrk5EI0wP/CpcK0fD8nK8cPfk0RCjrGyG8sQdWIPV9gzvEjNYbQ9Z?=
 =?us-ascii?Q?DVOrqSz/nL0TFoF6g5rkgzvl47YgaGj52xk4yNlQ7Kp23fzWWo8F+v4x1TnT?=
 =?us-ascii?Q?G1sX2EfL2PRWh5HCGZpGsSDRqJNUoVjryVofvvz5j91ivaggP4VM6lE4FiTe?=
 =?us-ascii?Q?asNDWwMcwDGrrqfCsYArziLbMYm5MGMXO8ETerTOM0wU/gDBvnOroqUMlcBK?=
 =?us-ascii?Q?7MOgzdg2HLE7HbkUoj2srdcJY5rWPDuiiiwZshxVxFUBUWFwgTsLstGq2bPX?=
 =?us-ascii?Q?bHDaXwGxXmHEujdCwqRhzAZuIHiRyXZ7fbGK/DTOm/H/HIqhCkwpE1vFptMe?=
 =?us-ascii?Q?LdAr518ofF96D40rk8bo3ppZ4H9GwVc7GyaUyIqdPhQJ8YSxPiJwa4hcY6FD?=
 =?us-ascii?Q?A002vaQxfgjFmzy5ldYcAgAXF/tQC3KKldcwdJdzhw9YSo00pYBEY/lEBS+h?=
 =?us-ascii?Q?zXwsHuYev3p5k/Qj/mm6uo/eW7Ml5xCd72wjHSIwFTHyA5MYTn8RbM2mzqQU?=
 =?us-ascii?Q?qMHaHuqTEq9Rmpqlz0F3wwBcekxZGj/khuoRcqUJZuCiNEd9YVeiI4KpUDJO?=
 =?us-ascii?Q?dKdtPODfixueOq0afoZS/ieBaPsCkeA2jgFXXliNBn9/r94Cm+rNfuYGi8mC?=
 =?us-ascii?Q?6b/+rkg9yijN2UwlO7NWaFxdUIo6jIBI3IHTuSH2W80gkYQz6mieY4BprfXB?=
 =?us-ascii?Q?7oRneaVim1VfHI5/uLLpsqlHGBojIricp8B4itnn89cwqd+BfYyfZzozazy+?=
 =?us-ascii?Q?UpywJ0K8JmeDQ0Lo8Vk1YCZfJjlKotrLMYFPXd7zTXjdz3iQV+3RQIYYZtFc?=
 =?us-ascii?Q?yHl9ESDD5lLx9nJRcdGLrlVVV+Vzs9TBlcWL3+jvltdI3IkRatdPgAfXTe/l?=
 =?us-ascii?Q?rhY2aECNw5CoiKs0xh6yTF0vuueYGrxpdNLGV/TcEhjy4u+UqoO9jFX83OuR?=
 =?us-ascii?Q?4pVEo7r9UA8SJCxGYCYoFdrX6ayAisEDvkWjKFOIL7Z7IHGn46NXFU51iYnQ?=
 =?us-ascii?Q?BO2JTUafvsPMsF97+ndrqj0f/ToydrqxrcwF29+E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c158d73d-f968-4f23-1952-08dd313c6967
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:02:49.3931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1TIMPwYjd6dD+quS327qa8/KGUQjK13ahTLWEWJgcndQvcwaj8xe77MaL5qDFbjcisN3t8/M8m1EusYO+h2dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_220251_799680_796D4BF5 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Add helpers to determine if a page or folio is a devdax or fsdax page
or folio.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>

---

Changes for v5:
 - Renamed is_device_dax_page() to is_devdax_page() for consistency.
---
 include/linux/memremap.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 0256a42..54e8b57 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -187,6 +187,28 @@ static inline bool folio_is_device_coherent(const struct folio *folio)
 	return is_device_coherent_page(&folio->page);
 }
 
+static inline bool is_fsdax_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page_pgmap(page)->type == MEMORY_DEVICE_FS_DAX;
+}
+
+static inline bool folio_is_fsdax(const struct folio *folio)
+{
+	return is_fsdax_page(&folio->page);
+}
+
+static inline bool is_devdax_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page_pgmap(page)->type == MEMORY_DEVICE_GENERIC;
+}
+
+static inline bool folio_is_devdax(const struct folio *folio)
+{
+	return is_devdax_page(&folio->page);
+}
+
 #ifdef CONFIG_ZONE_DEVICE
 void zone_device_page_init(struct page *page);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
-- 
git-series 0.9.1

