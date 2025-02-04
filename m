Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F305C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5+bIA5D/ZXBMmnESNZ5YW8DsaUjooc64ARwvTry73M=; b=Rszmw0phwkzf3AFNaquuw2JLAR
	/kkmnO5xu+44GDs5yshDW0G2ka4c6d+tNpbsMoVsnfJt42RJy3VCG9MU5zRkyWaqvFBlNfBWwWpyt
	mPZkITTj4QNWlUcua+C8cVha9vKzu0tGz1xhno+64fOYfsJeamdpJwYUvPHCMV09Xj0hbo2wfVb91
	gE/64v3oln1EvKkgKe2ayrTFk/rmHCA5eQKnQCsmHrnhRaa8U91/EmAikfEsamfb5YEhis0hLJWq9
	SBG/JNcX0PqSXQ/KyfqodQrMkd8P+RLughBRDKKcXhAbesmGDs+i38+XKV8kaz627C8Iny/0vE/Vj
	v+fMtIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfRo5-00000001l26-3TEk;
	Tue, 04 Feb 2025 22:54:13 +0000
Received: from mail-mw2nam12on2060b.outbound.protection.outlook.com ([2a01:111:f403:200a::60b] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfRiv-00000001inb-2RT8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 22:48:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nacRSvhxL0v22puaxYbY6jkkjIyVmkY/W5fw2QL4wEkn/E73Xca0RMb82ZPwGpsDaIKrcTjNkSnm0XvR8ht2FHJfQtFGBImzpT3mg/V9RqQdCwAg7tMWe5pT/7uZkM5LNxNMPDotT5OcqRLZgWyc/QgmD7yYSXHyBgDBCUa5gHKr+4fdSp1ich4MC5xegipw0F2leh24RRkZ3NNutY2w0wPef2Rk2dS0qSbL9TmLF9EEnFm9EhZv12KKdHYSU7Sbu36UTQm6a8ZG6MC3y/3hK7XGEX2YsPmmi5sCMJJAfBn63w7aElHX/xwzXuyVdXasZyLIOIoWabvQ23jGQhyzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5+bIA5D/ZXBMmnESNZ5YW8DsaUjooc64ARwvTry73M=;
 b=wJ/EtV1DSeVQE2hFXBDePm3XJYLU8Qip5FuP7ByJWf/Jl+YrNSoXKWL2zt7rmqoGoAte/XSG97MiIRFPMceVy4gOavY/EmV7Si4PzKKTkszIA0aChG/+hjSL3j7uT66/kVVs55jUrE6MWaEACXAMlQu7rk/xtznRYW+CbhBxHPPWTfzOWxv8E9ixSCxcQPM7GdOiosBWuj6uxNEbp9M2MQm48G9F2jVmfpX616+Vs40NruJ5HOmPwVVyHjqi7ZPLRgcODnIXIzgB29S4+sAbYUds+2plRYUxjY3LsMlN9DqwZ/P5ZRDkpkgjkeZsNXfdyZrdbgif299RX12HJfsnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5+bIA5D/ZXBMmnESNZ5YW8DsaUjooc64ARwvTry73M=;
 b=cuoz0FlNwyjH+m6HUoXGCUn04/BVLNEI23YFUBU33lkWMmD6s5HFk+njaPIe90NJZ98jkBqq0yfhem3H0kwtI8odFGfyYx3XSN+/bjQjwW0GmS/Se3qFQbIf9adhoZTmN05Yug3UVk9oKglpmQ5ZgR7+Q9WAeZ3zdNwIBhiaNicyRlIr6oAKcMLo3AvhPEbr8vg+LX/4ZM8Bvz7jlTsnruDFBqIQOdTyDLMR6gZ9zpMJ4o2QdpzhfnDCEo7UftXPKHgeZ+DUjjz5g+G/ao1fGFN6n2riM8fR9HSobS5fFMBpvagWUMbRbNMrxJ2mB2fKEc/qlhlqCtRuFGzqQST7+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB8537.namprd12.prod.outlook.com (2603:10b6:208:453::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Tue, 4 Feb
 2025 22:48:51 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 22:48:51 +0000
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
Subject: [PATCH v7 03/20] fs/dax: Don't skip locked entries when scanning entries
Date: Wed,  5 Feb 2025 09:48:00 +1100
Message-ID: <1cabe0ce0ca3b19ac9b23c4e6a492775293488ff.1738709036.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY2PR01CA0029.ausprd01.prod.outlook.com
 (2603:10c6:1:15::17) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee3f2aa-ecf2-4c99-c4fc-08dd456e1813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W0yXZ+QKG7RMmqXKUUvYr6cM3tfMIA3pFeQRP9GFzMh07mamuso5YAalEej5?=
 =?us-ascii?Q?IqxP4/rzwmiddPnCm91fq4EI/KyZUhU7+G0a1GB9CTY8G+TmYbPbZe3btVim?=
 =?us-ascii?Q?HRB5icOAiRzKep/c6Ng8RyKpuziyZMSL9ulLf6degt5nmkgGKCMzLzOB7XsV?=
 =?us-ascii?Q?bLkQRLuf2SM/2jpphkWVi4bemj/6+UFTwY7J8INzuyXUNZfu9jWsM/9c7Pry?=
 =?us-ascii?Q?8ezMG6vodmD9Vrgo8VkBp807ZUoat7KHy0QJFvmBqZiziacUFKtmNryACvu8?=
 =?us-ascii?Q?mpRLLjl6eVBLtyYjTiO97ywwTYV7hgVVNLSP9Xj8S5F6plE7bTHZX4BW41rB?=
 =?us-ascii?Q?826uYxuAEbGkW3KqmK1YKbcFVkpResgDtEvgUHD77EQWdDw3R8GjKmrCrYSB?=
 =?us-ascii?Q?wWFlhhncirboeelgLO8ZZqS6zXQxqn3bCQMfAPcLmeLpm1X9L78lV5BRAUqU?=
 =?us-ascii?Q?k2q/o/tNRi84n+CopG7sAGNpDxRn5LMfxXsuTr0jQ2hFxyA9lmFrmEaTXUjy?=
 =?us-ascii?Q?z3iyArqZy0ZTNWdpMpJ7Y9wYz8KY852PsF9TB1jIXwGx7OgObbDuqfVcku+G?=
 =?us-ascii?Q?xej3rQic2X6M8Hh/HNGViYcRvs6oCARVB6OIjSTMmeDatGQuVQikWaVhO2Hm?=
 =?us-ascii?Q?Fr28eB6MQ3pj4au9pUz6wfoZ0I6MJ3oTg4aOauSkw5lqKWvhhbuWcihEK32c?=
 =?us-ascii?Q?a3A7/PcYCDSFc1hksXWGFdZjaB6iqnZ/hjhb0jAM6w8ynkgZpZWvA0TA9zZF?=
 =?us-ascii?Q?8YutDsRxqzAvmqVnhURVgGwf9Nuxcfrjn4n0sNMPo9MEs5yyPEUjRKSgdTe1?=
 =?us-ascii?Q?OP7J8qVAXMXNrG0LBfItdUO2BMGe88xI/QPE7inm73LsCjccI9Jiboma2UJG?=
 =?us-ascii?Q?Nkl5OEk5jrL7F9Vq/NcXx/HhCOqyi6Hj4Z2p9h8JpGKZ9e9BMGbZsnixtS5K?=
 =?us-ascii?Q?GoGju3G8ATAdBgaU0a4gUr7bN11N0HqDGIvi7iFR9lDwe9JkurlCwa0OvfHf?=
 =?us-ascii?Q?K3+k+cjBdZofuMFE+Ixi2fGbI/SVwWWjd4habQWi+eBWmxmOg4IuOLO8hCMk?=
 =?us-ascii?Q?sadmJIyOwjCXEUMB7CU0fFdQmcmzuw9WVOMFNBbIltBWx7PhxKm7EORf7Aoz?=
 =?us-ascii?Q?0YnYSCeML+7DvXnfjx39NOEqs3WQP355PolMi7fw+bMxuZwVkoQX1vaxJcp4?=
 =?us-ascii?Q?//UUeyNRaNHs1IoFbBHnitjAyilmRFmuT1w2HNgmRrcia7hwO3pYcEqHD6et?=
 =?us-ascii?Q?YlJ0MqqymsDfn9QlPPGQUURoPrGkgYjdwPwtJ+aaB8f5FbdXnm6QsbCps75w?=
 =?us-ascii?Q?qHjqx9dmendHxDoKLGktJNr6TcfK/8pAvzPlPYlJl62+zBgvYAorcXbgrEO9?=
 =?us-ascii?Q?0vD2oHrmOOl+xB62V5VlgCDtMVuN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D1mP7YG+gWOtadd0cYKGSUFX+h+lqqIkAoE//zPk/V71hWMhlhGLSCPsFa5R?=
 =?us-ascii?Q?Np5ByOqANl8c7KZJ8j5AfS0t6FIMFcaTGvEn9Gzjo8e/UEk8tkiP5X310yFd?=
 =?us-ascii?Q?sStBxKC7Ly2/IXef6KwmPgGzseMbGnfSWynaMZSpPLmPxpQOyh8BQi3Z+VlV?=
 =?us-ascii?Q?aqhGprA1UCyAKOp4PXub8mcRzqfDY0gtPxaj2VwI0jtmghtr9AlZrqLleLVg?=
 =?us-ascii?Q?LeyCPsZDPhN9aTgXSBZuAYfo87x2bNjGVuJ2StR4sSpZo4TKAZpmNwDs9XTT?=
 =?us-ascii?Q?4SiwFlgUR/DB0wCn0jRtpTAvEKVPEhwOZq2QfBU8VWyT/dZSzKId3rYgpMoT?=
 =?us-ascii?Q?xlwfcd/UIQQLfRuATxCvQZcQFqksL9H3KYbhhhMGa8nmpOhf5duo1JqragaC?=
 =?us-ascii?Q?M+o7iqVC+VQXBf2QRlupCPoyszsjdhV96J55+YrHxXT5tOmQPshZkBJHVhTy?=
 =?us-ascii?Q?VmHfB+QEtU3PlKSz/ajCyQmNCp+mosAuXFnr9063E5PIN8Rqi7wp4/z/2iHl?=
 =?us-ascii?Q?NXf5noWRa3iLRBspLbd4Hcjc9Ak0iZ7i28aoifpAnIS8ydtM6YJNWH3D6k4n?=
 =?us-ascii?Q?O44pczVd5fdBrVVPnQRRpNJhYffOjdq9l3xqktrzar//CaXF87TZbuwn5oUE?=
 =?us-ascii?Q?IgxxoKk/TQh0+8PCxvtyKTBIE4Su3iAA6Y2JJ/jxM51Mb9CfphJEjYj2hk0Q?=
 =?us-ascii?Q?uRHSqRAGz0N1KXnoq/1NgHFZK527gktGqiEpKpdYu3Qu4adgD0joqVMXiMOh?=
 =?us-ascii?Q?d9HYeVu23dKVIsVIqMMZm011oOXD9Z8DsbIcq1oSuusTmQA0RFllRbqU5lUQ?=
 =?us-ascii?Q?VxD1+Kjz9fSQ89EV6hE2EK0Wu2mez5XdzJCEiaxOErmNDF2HkGRNNtYX0ZdS?=
 =?us-ascii?Q?YLGF7UPTA3aQLi8q9BZYpAo8oQpzx3ck8DfzaKJr3lkLRa6H55v3Bf0SVq58?=
 =?us-ascii?Q?RapUYsHFh2m3DDxFEGQfPeCAJXjpvUOxT2K5O0MNhEbnYkId/S8jBHzOW1AI?=
 =?us-ascii?Q?y+DNR10EsgWF3GSHFj8VQArrVX6DDiDJP4/OnRQqWzjgwe/i3xuUhOTAbw3h?=
 =?us-ascii?Q?uSPFRvbzwwOREfcn+2JvmGdXNeeKD05pvBPV8KmUUTbawEz0GX+vq1PGF2Be?=
 =?us-ascii?Q?2+cQgOWcWSgdAp/igSkLFKq+n1Vh9BeEwQ4HPZy/At1FyUKEh1iE8DHA59Ev?=
 =?us-ascii?Q?iV8rdN7T9hGhbfIqABJ5nkb6o5FzfTsUkWqFvdo1jXJOOP1G7DiEUDYrbuyg?=
 =?us-ascii?Q?P76RIs4a7Zvp3B4tXixDKNQMXqM4ipJZmwtMdB56nVbGIKPQtFKgwJ3Vh6qB?=
 =?us-ascii?Q?IbotVyxdBNTujj1BcAh6ItpoSaU2ixMFc5pt7I4JSZdE5ozHAu2SW2vFiMuz?=
 =?us-ascii?Q?9YMJ8aie5ST692oBlqG3/CFMyDA/xkh7IzNbd5o3g8blnfEbSJIST9PXO8AZ?=
 =?us-ascii?Q?X7/fwvHVLnklZ4rtpc9usAkgIGTmzIc/uMAgdI5bVn9rzPi/yL014QZYSGN8?=
 =?us-ascii?Q?vldsxKqwFza2cxhHvK0TK+83Dss410D36ZnAtTTlwl8u44LG1dMeSnb4cxKj?=
 =?us-ascii?Q?30W/M/XfWcyq/nf6pMQRnl2mXHMARw8bVLlp85wz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee3f2aa-ecf2-4c99-c4fc-08dd456e1813
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 22:48:51.2347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWHmi52ubKkE1tuE6WEt79rHPYVFfau33jJZHg8yu5WaAjWsBVTjA1+GP+JcrH6lliva11usTJkWwjwhhzV52g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_144853_666831_750E3130 
X-CRM114-Status: GOOD (  16.47  )
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

Several functions internal to FS DAX use the following pattern when
trying to obtain an unlocked entry:

    xas_for_each(&xas, entry, end_idx) {
	if (dax_is_locked(entry))
	    entry = get_unlocked_entry(&xas, 0);

This is problematic because get_unlocked_entry() will get the next
present entry in the range, and the next entry may not be
locked. Therefore any processing of the original locked entry will be
skipped. This can cause dax_layout_busy_page_range() to miss DMA-busy
pages in the range, leading file systems to free blocks whilst DMA
operations are ongoing which can lead to file system corruption.

Instead callers from within a xas_for_each() loop should be waiting
for the current entry to be unlocked without advancing the XArray
state so a new function is introduced to wait.

Also while we are here rename get_unlocked_entry() to
get_next_unlocked_entry() to make it clear that it may advance the
iterator state.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 5133568..d010c10 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -206,7 +206,7 @@ static void dax_wake_entry(struct xa_state *xas, void *entry,
  *
  * Must be called with the i_pages lock held.
  */
-static void *get_unlocked_entry(struct xa_state *xas, unsigned int order)
+static void *get_next_unlocked_entry(struct xa_state *xas, unsigned int order)
 {
 	void *entry;
 	struct wait_exceptional_entry_queue ewait;
@@ -236,6 +236,37 @@ static void *get_unlocked_entry(struct xa_state *xas, unsigned int order)
 }
 
 /*
+ * Wait for the given entry to become unlocked. Caller must hold the i_pages
+ * lock and call either put_unlocked_entry() if it did not lock the entry or
+ * dax_unlock_entry() if it did. Returns an unlocked entry if still present.
+ */
+static void *wait_entry_unlocked_exclusive(struct xa_state *xas, void *entry)
+{
+	struct wait_exceptional_entry_queue ewait;
+	wait_queue_head_t *wq;
+
+	init_wait(&ewait.wait);
+	ewait.wait.func = wake_exceptional_entry_func;
+
+	while (unlikely(dax_is_locked(entry))) {
+		wq = dax_entry_waitqueue(xas, entry, &ewait.key);
+		prepare_to_wait_exclusive(wq, &ewait.wait,
+					TASK_UNINTERRUPTIBLE);
+		xas_pause(xas);
+		xas_unlock_irq(xas);
+		schedule();
+		finish_wait(wq, &ewait.wait);
+		xas_lock_irq(xas);
+		entry = xas_load(xas);
+	}
+
+	if (xa_is_internal(entry))
+		return NULL;
+
+	return entry;
+}
+
+/*
  * The only thing keeping the address space around is the i_pages lock
  * (it's cycled in clear_inode() after removing the entries from i_pages)
  * After we call xas_unlock_irq(), we cannot touch xas->xa.
@@ -250,7 +281,7 @@ static void wait_entry_unlocked(struct xa_state *xas, void *entry)
 
 	wq = dax_entry_waitqueue(xas, entry, &ewait.key);
 	/*
-	 * Unlike get_unlocked_entry() there is no guarantee that this
+	 * Unlike get_next_unlocked_entry() there is no guarantee that this
 	 * path ever successfully retrieves an unlocked entry before an
 	 * inode dies. Perform a non-exclusive wait in case this path
 	 * never successfully performs its own wake up.
@@ -580,7 +611,7 @@ static void *grab_mapping_entry(struct xa_state *xas,
 retry:
 	pmd_downgrade = false;
 	xas_lock_irq(xas);
-	entry = get_unlocked_entry(xas, order);
+	entry = get_next_unlocked_entry(xas, order);
 
 	if (entry) {
 		if (dax_is_conflict(entry))
@@ -716,8 +747,7 @@ struct page *dax_layout_busy_page_range(struct address_space *mapping,
 	xas_for_each(&xas, entry, end_idx) {
 		if (WARN_ON_ONCE(!xa_is_value(entry)))
 			continue;
-		if (unlikely(dax_is_locked(entry)))
-			entry = get_unlocked_entry(&xas, 0);
+		entry = wait_entry_unlocked_exclusive(&xas, entry);
 		if (entry)
 			page = dax_busy_page(entry);
 		put_unlocked_entry(&xas, entry, WAKE_NEXT);
@@ -750,7 +780,7 @@ static int __dax_invalidate_entry(struct address_space *mapping,
 	void *entry;
 
 	xas_lock_irq(&xas);
-	entry = get_unlocked_entry(&xas, 0);
+	entry = get_next_unlocked_entry(&xas, 0);
 	if (!entry || WARN_ON_ONCE(!xa_is_value(entry)))
 		goto out;
 	if (!trunc &&
@@ -776,7 +806,9 @@ static int __dax_clear_dirty_range(struct address_space *mapping,
 
 	xas_lock_irq(&xas);
 	xas_for_each(&xas, entry, end) {
-		entry = get_unlocked_entry(&xas, 0);
+		entry = wait_entry_unlocked_exclusive(&xas, entry);
+		if (!entry)
+			continue;
 		xas_clear_mark(&xas, PAGECACHE_TAG_DIRTY);
 		xas_clear_mark(&xas, PAGECACHE_TAG_TOWRITE);
 		put_unlocked_entry(&xas, entry, WAKE_NEXT);
@@ -940,7 +972,7 @@ static int dax_writeback_one(struct xa_state *xas, struct dax_device *dax_dev,
 	if (unlikely(dax_is_locked(entry))) {
 		void *old_entry = entry;
 
-		entry = get_unlocked_entry(xas, 0);
+		entry = get_next_unlocked_entry(xas, 0);
 
 		/* Entry got punched out / reallocated? */
 		if (!entry || WARN_ON_ONCE(!xa_is_value(entry)))
@@ -1949,7 +1981,7 @@ dax_insert_pfn_mkwrite(struct vm_fault *vmf, pfn_t pfn, unsigned int order)
 	vm_fault_t ret;
 
 	xas_lock_irq(&xas);
-	entry = get_unlocked_entry(&xas, order);
+	entry = get_next_unlocked_entry(&xas, order);
 	/* Did we race with someone splitting entry or so? */
 	if (!entry || dax_is_conflict(entry) ||
 	    (order == 0 && !dax_is_pte_entry(entry))) {
-- 
git-series 0.9.1

