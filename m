Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C12DE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 05:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoOuGryreVKXelZflkuUcYowBxVEssrOVCkLycDDwBg=; b=pPMQ1+uapAhbNmPMRbXKItAgj1
	p6dPyUDGGjYRcRhVr3Gcb7Q9xlnAoRcnVaXY7EsJ31SbZx16/FQ86fhW1J4JrpzpRWG3WC6S2VPVO
	os5Ti/TFWJPjmTHyXVbI/qcGb8FYIyM6rFVZDCMB188EpzbbWLFMK+5cdijF4IHWLGCBeUV16TFgd
	VTTqNGehTRP8L9EQU4h/biNK/yjWORf6N89xDPhP0+BT/cGQrDw67d2BZPgHWa8wCy918do2RWgsR
	IIudFdO+f6Z1PsfI9a31vn4CAon4oErkBwhhv0BukwXtfVIq1uVI8e0zF19diuw+bRiyDrp2R9/Bd
	S6xFBE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQCq-0000000CIn0-2H0w;
	Tue, 17 Dec 2024 05:33:16 +0000
Received: from mail-co1nam11on2060e.outbound.protection.outlook.com ([2a01:111:f403:2416::60e] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPvH-0000000CDe2-3pEa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 05:15:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyBt4H1EbMkN6tmc1aSmFYU6s5T4vuIv0JWRJyrSfBeULW4Cv5RFEDxLsb96eIUYhFzDmUQ2cXG+fzy1LCtEOLLLjaoQY+Hpb1xji/7FODDEvR8YBnZDfzO+VrM/EyrpoXpppScgL1jy7bu7ZB4NmUBtJ4p3CZ9ilLxMXgSoz1nXGJ8RGpg33+GhkvTKxdBUtuyvdm8EEyNYrUBIn0X7Bh6BDlIxeb5JWR3/+lDVwCCffO3/2dDbUno5zfC1hWyyfNjl//tciQ9VlKRl1HrVKRczejwlSQPuqYWhMCo2w3mT9b3143JXoNZHb4J8HIK7i9RzGPUbATHmXutHKfT6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoOuGryreVKXelZflkuUcYowBxVEssrOVCkLycDDwBg=;
 b=qpEclK2KlRy5qA7Qy/Tp9sieA/txU4nNx58yWRIls7qBksrUm/JtDPXeGQ77HuBn1kBV3mZRXJFnDfWzS14gGWUqcuW0fRs4dRu/yco3x7ZgyyVCp44BlupjN2fKNsdZKVXl8kF2c8ECvWVD5Q2pbQlIuiYpOItSx3fPVwGwJ1kYjMen3vDAtL2G+JgtSOcRshTjvoidKO5xmXRfIQPSGBa8g2wUq8ItL1HAr0z9cIznIPdA3P2YnkRnJlVtrJW+EwOiAThwAZSP0F3OiisSoU5DI/IJ+LSKOH+wdvojg9/whLyjSrW4u+ytcET/WHz5J/Axzssr+biM2gmiUBv70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoOuGryreVKXelZflkuUcYowBxVEssrOVCkLycDDwBg=;
 b=uiyRjShg8mnPaxUicN4JYeACro5ACR4GDHbFTGpzhLGlh+l0ylSEy1KQcUZGss++ul/WIcL/y4ft9Hh2KrCNJquBft7HlaD3848IBiSu8JQi0b5cJtrirbLMgXKvn1HgyUzF5n8yda3HYh1zG4JG1fP36o33sZ98jj1RZu254gE1c4ZVUUjrAMOrMz080ifVnw73KgaIuyn5dp1Dytm8R0oD+FMfqgEmA7axT7AD2x98sKId1BJx+X4V7UDnptPwUr0RQ/CxLMJ+P7YSW4Ne0wbTvfdQMhZArNKzRmm2rEVWNmj+Yo+GCX/5c3WSKQMRnqmjN9vLxBYH9I/8srD0Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 05:15:06 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 05:15:06 +0000
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
Subject: [PATCH v4 17/25] memremap: Add is_device_dax_page() and is_fsdax_page() helpers
Date: Tue, 17 Dec 2024 16:13:00 +1100
Message-ID: <58ea909bd178d97bcc73997d6499880137d5e4ed.1734407924.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0115.ausprd01.prod.outlook.com
 (2603:10c6:10:1::31) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 4855ad2a-00fb-4dfc-6a5c-08dd1e59c4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Nu1IFQpacWCV1wkl0/VYFQ76QZEOD4g++H57TJzo7l9Fd40vi+lf+7iG5Ul?=
 =?us-ascii?Q?I+sRqqFptDvfsKgebTSLesAlSQWpapsgQJVPsgOhndwFThady9PlBOjil8jp?=
 =?us-ascii?Q?PaZ0JmtZmpZT8cnpq2DADsK2CJJnfhiAEgLZ95ORXNhX90c2OY70yvlqqUyW?=
 =?us-ascii?Q?4pxA/o/JLiAR+KGZ71vYHgkYgIKcrulNZJUjGpUqbPBUyqnIdffyihv+xZ+n?=
 =?us-ascii?Q?88/JDL7Qf23TJrl9qGMysULNakEZWIC91u4mX3x7zVW0eouZ2eevdc/TnTDi?=
 =?us-ascii?Q?TdL4PcvH190O/OPEysxRd/QIsRUfRWp3vF2NQgp8CafkHUbjcALNcxs79JLL?=
 =?us-ascii?Q?ccLd2gmUVJW2f7SAmseheFZ6jbo8qb34WnfPmMo4kVUIgUmHNGh8CkCWSdKK?=
 =?us-ascii?Q?BaQ1izTj0L7+TdywLADj6N5QZ0luRIFCL/OTGC3+CyhLy4xwDbgY2U0/Hqjy?=
 =?us-ascii?Q?sEi6aOk2x7VHg2vWa8OcFhxLdLJdbQMGIqlaIoobMnbAfwCMs3v6XCAceT97?=
 =?us-ascii?Q?K+/v511PL9iK9tPDMPnX3MZNpXPWol7tM7BdYhTAe4kt21p73iJsb6/epDDq?=
 =?us-ascii?Q?0zF/32fOaUir2xKkCEvWfDEfjFJa6vUa+0t6gDtMzh2jNMOmjm1P7iSfrMFF?=
 =?us-ascii?Q?3CYt0DRW7bbN9dp3UCP9l9bx2KSXRuasWoT2q2TlzUTSSmkmL1H54uD9yl5A?=
 =?us-ascii?Q?yP0T3GFGkpbdNxdUb0VmWVDudGt89IUmrBLZvYVImLfCi0SnKXgqKvMYaNq8?=
 =?us-ascii?Q?gLtm1zppgBSyrADiVhgG5g6GBGUcWS4MHJSiSLf124qw+WGGrkGfbMc5IQV3?=
 =?us-ascii?Q?g/uQvlVmdQQYpevzLfL5cCzNijx2HApQ6BLs3VOqwY9DRFy4gXdcJibmD0hV?=
 =?us-ascii?Q?rRcZKYTXPjKbwS9IRBSYp9KoJEAtCfNejb7kES4+SXjcl6EJaFypyjA0T1z4?=
 =?us-ascii?Q?+F4430Ihlq9cbarI6GX66Ja1J2r+nTbcplK4g2X++IqaMDIH/8Q/aSDBdu5H?=
 =?us-ascii?Q?jeZs4Iwo70/iWOBfHA6eYvEkook4CwqhdqY85QJIDl6JPWr2r7ogM6fS8KeD?=
 =?us-ascii?Q?Jenvrj8O89qF6WQbTqPQw+TROhRpDdaV8yQ7rQB3F2eFPlwh5V5ofxXR7W7u?=
 =?us-ascii?Q?CY2l7zyhkw6ZaMye0T896qiwyTOdmvBbxYLMSVDMX/xDAI8gH3otlS68cqoA?=
 =?us-ascii?Q?yoohtzvvqX/hTlsuI0y/Hj6yMKzX6AU0w+xTvUJmUWWCf8v/ij84bb9LnbNO?=
 =?us-ascii?Q?PdDkFVFEq9RV/QzUMhEAp1LMv1sBjINQ8VGlZFNzMZuL9rxes9LpnbNpPcOQ?=
 =?us-ascii?Q?qswMPlQmoQ9n8Q8W9YfF4HngdSIoJ2ewlYzcUKgw20TsnClQMjG9soVpIPKA?=
 =?us-ascii?Q?qS6dwLLdMAOs3hC5hPWlQlhSUurz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RQ4eOaAKwbL3OvTr2BbJLa1CVgmYgxjcwO0drdyxGL+Y+qLkMo/3iVPBh0pU?=
 =?us-ascii?Q?OturfELmAWg+sQEjslkaJ7NB9T6sIjfu594C/EVGAhaXur/HqVLMumWjLebH?=
 =?us-ascii?Q?BSUA22k37FcGEC/lFXDsRo2DUtITrErYFgFviEi/9oORkWKBGAWLI74+KSRX?=
 =?us-ascii?Q?hxN5zETb5aP6Xhr3rpgwYirc1OoOjlpS7Epc+HmJgR4zTUzqwiXZ8uWiIH/l?=
 =?us-ascii?Q?s+hKUXJav0ghq7y+By8Pa9+rSnrhikMTRdpVelJTwNBv/g7ld9GyZixNamx9?=
 =?us-ascii?Q?hEcdpSEiXJqLRgBiLX3Q/843Ww38wXcHG7j351Cb4e0kD6TAJUp+LawYSd6K?=
 =?us-ascii?Q?b0ShYexFUD0KRyZtvx7nfDxTjXZL+SZ/esT7RqzedJ+x+Gfe6j8camCN0J2U?=
 =?us-ascii?Q?h05tryHIlfwbHjyTs/fbZeJWuYGUTpNMvorrL80Gw7K8dtzo9VP6wupEN764?=
 =?us-ascii?Q?2buHIvBQNWP6Oaz64ciaLKQOiwQeWp4Itq9ezJPC5PEUAduWGVjl61QlXnfM?=
 =?us-ascii?Q?JoX6z56TfD4C0vIELtbiEQy3A0c521/YrNZxY0yPYJuj8tB+b9kdqL7tHiCX?=
 =?us-ascii?Q?8XycEqpWJKYgwl+5PaQkfCflRdNq+XA5mL99ZsRP+NCTQxZGrt/WjskeRIsp?=
 =?us-ascii?Q?KkZI6sxQoy+gaIcdtfSP+NoLQfNhA/e2f9iCHH7zSfjAeVco7Zzyu7RLvbWI?=
 =?us-ascii?Q?W8EpQstlfhokho31I8V167vChtAWdQoAxCiO66T39V9Cr8KK0ktqhgeV+vHu?=
 =?us-ascii?Q?vwt4oF1Lz0Po2Q7oRuPqCMgy+VBIGCeIj8Zc5R0y3pvX9mWCoWFLzrRHnQ2h?=
 =?us-ascii?Q?wWZ2obVQ6JPTThveD5zW4xhqxlFk2+cgThtiDxF2ocyHqRIZz5tSGssF9Em2?=
 =?us-ascii?Q?oVJBaG1Bi1/zM/jXh522EWi6HH80QmOg/7BA3c/GoApjPcohCthnBt0v9mgS?=
 =?us-ascii?Q?5KBYQWV5775mIfueuZ+435Oqs/LMP5d6AjAX6KU+ZRwNjTRhBHlY41godAPv?=
 =?us-ascii?Q?36WnXhbYUeama6p9WB54mCwbFbAOJWdWowBnY/cjKSQ3ckXyISZwERSoYGy2?=
 =?us-ascii?Q?DZQyDQZUG8UXeE+OT2Y/yAu6seE9KNYdcANx4wciJqk3+8MAeCugFHWK2t2Z?=
 =?us-ascii?Q?FFlKLSyEzMbqqtBQQQmILLA7mVwEaxSiuvsykcTuVeSQ1hZQ80KXG9gajYDE?=
 =?us-ascii?Q?5SGc8MYo+p09DkNzFz+hoWy45y5iB0hf/iYsFpYS1hoSvN0s9VZr6NQBlzZ9?=
 =?us-ascii?Q?2cPDxD7bxwOemxopUiJ+jX93VpsBso7OKx8HtSHSnXNG9bl26g61qPbrAHXA?=
 =?us-ascii?Q?0vywCQySgJSYkstD+iBwWbYN9dYxTcMhjlDhgCzh8Td6SaJHXjQbSdjAiUct?=
 =?us-ascii?Q?h3wt587xtk+xk9aJ1sCQ8nM3xAyHrGPX6THvLxF+KdWc/TdfoXMjAY0Atzf+?=
 =?us-ascii?Q?tqglwKjN7FoOetRI3aVX9Gj27JrxA4tIjdkJNd+07THeTmKYhFXeR8uupYww?=
 =?us-ascii?Q?CAkeMrWZIYtAxEaMgrJiz38kWdavEXpt+F2tMuTETPAsjElSTmNyAZOZObLI?=
 =?us-ascii?Q?mnJaHhUrghDbI2dgz/Me7mvW+sxHRo58o88GfMn0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4855ad2a-00fb-4dfc-6a5c-08dd1e59c4cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 05:15:06.0200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9JjkO1l8zGrRvsr88jV0aXkaKpAI1WUVXKQs9Uzjq3gIs3oXFpox/Dl91VQ5TYyoEYdSnnT3aZcw+p6PT8VlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_211507_950626_A1072894 
X-CRM114-Status: UNSURE (   8.13  )
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

Add helpers to determine if a page or folio is a device dax or fs dax
page or folio.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/memremap.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 0256a42..f2a8d13 100644
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
+static inline bool is_device_dax_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page_pgmap(page)->type == MEMORY_DEVICE_GENERIC;
+}
+
+static inline bool folio_is_device_dax(const struct folio *folio)
+{
+	return is_device_dax_page(&folio->page);
+}
+
 #ifdef CONFIG_ZONE_DEVICE
 void zone_device_page_init(struct page *page);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
-- 
git-series 0.9.1

