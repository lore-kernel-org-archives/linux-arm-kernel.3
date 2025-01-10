Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4772CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 06:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xy8qh7i3mZHDo6zytroBAIKc7I21BKCOmZX9uuIf+jc=; b=HcIzW9P3N2J3TuK7vQAcdyctcu
	eTfUQZGMVmNZ7CxZz2nHXHSPB9nSidHa3q/kmFAOxXiLxMhysUKzQUZdvxlEZryTB8l+Dy9Uh8zBZ
	owB3UTCWSUkOi0ADGLTXGbyJHjVomSQIvsAsJVTe8bLyRUybx21zdXoF1xWC8ydu4ueb2R3Bc1LYm
	ohTSHE2W1qUGNJUWU6AbcvpT8gx3q/MW7aonV6WBKw92IP/9V/8zv4QmVdolfnDG77+Ng9gF5FS65
	V3sVs+daLymLJHk7l++XiuFf0qX2qTxRDzdLFe4/UHey0jLe+h3lVaDBdyIETWmkWy+SG993X7LGN
	Kk23JG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8Az-0000000EBGO-3rmw;
	Fri, 10 Jan 2025 06:07:21 +0000
Received: from mail-dm6nam04on20620.outbound.protection.outlook.com ([2a01:111:f403:2409::620] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW85K-0000000E8OA-3F2J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 06:01:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThqA6vPA6B6yab0m/OQmJY1GQTRWuDvu40566Gun3+pVOLLp16PMdpot1sN2vBgUV+qvYCpil7jNk5/rnZHdDP3MVPRznaJvRl88KA4hRHDzbqAVgX6/OZhBxKIHmrcGC58F5lM+1WT/fb9Tmk/GUg2+2GpuN6yID3nqfHcith8lg1CJOX10wUPj6RXwoZiQxlJYLkntQt4k8H0OnNn6ZESHknLR4e6iKO10Sbv9ibA3m52XLuPhJrSDpcIPQReFD3/l1nynZWyIqaEq9jfas35Sl/cDYr4iMLgE4apbFehd07GnMphDFeOnnjmP9SAE1z97wTloHPCqO2VTXbWyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy8qh7i3mZHDo6zytroBAIKc7I21BKCOmZX9uuIf+jc=;
 b=aOxwuuEB8vqlEiZM8EVK/+s43sZL1JD8wLMCjPzcMqPgMVqtn+qFAEQj2gQOGEZjqCj5dBej4xCM2lUARGiwL5rRtK0rL2cfXgYNr7TJcZKW64lq6vqiyTHINdupY7HjLqcEsZRB1U1Jh59TaFC/ARF/fqFyEM32H7Uu5ERj5TaoMcUqokIiPZyghalsJo1Cbl67dS8Bpgqkt7QmmlqNgGqeDiAdc+cxx6V8dhJWTXujNgU+dXTqTUEk5zz7vi5hPNGLQmPZxRr/9AliUUJiQ819zz16on0N4uGATpZFxb7MvJwXsc9yC6W9hvww2PjjkByT07qVGhxI5sN3lRzp1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy8qh7i3mZHDo6zytroBAIKc7I21BKCOmZX9uuIf+jc=;
 b=JQXERpPAXK4ChSltsGHf6j2c3YwENDXtk6KvvJPMgb+Cy4zGeOToiNb9FTlbNQHXDamLuSDv2Kb1dqe7ridyb/niWMmatS7I5g9a5gFE1culM1AxbXNJm4uIxzpmbtvEjyIMBdXORAH1Y30RzBSmoxXcY5JC068V3G4caQT85ULCyb7fpEyAHDj5R6W97XurLBrI/cTgsDNcrz8PQYWkNejwB0x1oUVark1VIbGGabiu6mCRTK2p3X5tpzObvctGDUoLKjUmL2apy9L5Am63Svj3jwxgtBgRyd9DcwnNMvuiEkbkSYiHA6igh2P4GzMDtILOI042coPNjExLpOqOTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:01:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:01:27 +0000
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
Subject: [PATCH v6 02/26] fs/dax: Return unmapped busy pages from dax_layout_busy_page_range()
Date: Fri, 10 Jan 2025 17:00:30 +1100
Message-ID: <ad4e6ac759e66855d5a9015746a45112f93a082c.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0034.ausprd01.prod.outlook.com
 (2603:10c6:10:e::22) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: b730bb22-f970-4dea-bba5-08dd313c38c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?99ptmx6MPnO+tYG0kMqoHjaBMczHQPL0r4N48qSlfiK/aedflf3Gqbsix0WP?=
 =?us-ascii?Q?S5IPB55kq9H88a3gwix/vBX1Q58XUUCFVkVYOC8vb0GIDZr++sRfoBqhE8lP?=
 =?us-ascii?Q?USW5U+Cmb8AJ7OFwRGVFp4LH3Atd3fb0jDVOuYMiqlhebI9cjCvl1TCDgIKI?=
 =?us-ascii?Q?pUmza0i/uPmyZYycykHj9NmZHuBMGMsZv5DveIMAW5Oi14A/G0aBlpTrV3tM?=
 =?us-ascii?Q?osVQOuVpo7kaEu7hUavHngydxn8bZusXAqJ3Llvg16Jfc8B5Thk/gpLmt4uX?=
 =?us-ascii?Q?eNbr3CriuVa9FQlEwwiHd0Rd3Oj3LnS4fVVNwtuvwKUMYnWF24VJchPvbZ2n?=
 =?us-ascii?Q?i463gf3hAu7lJgMeB9iNbb0hBQAMOddQH8tIGKO7y2GFKj3O8TVsIapj6Z1d?=
 =?us-ascii?Q?+AHI40ONkZ5hERUc3QIOWwceQ0CwCezACmZL4Gy+H7SbB5O0uehwxyzTzEAN?=
 =?us-ascii?Q?P+YLJWxhAmcwvxq6UZMD40npsm7q5KzdA1senMMjKJFUT1+/Tt1Ph6fjS3Ba?=
 =?us-ascii?Q?9PbUnWlFvk7rkvDCqDNmAUiS53FMi1PGBySfzrQiY9zgmYWn/NQF2z3kENDU?=
 =?us-ascii?Q?jOLcKBdtbszooJDDfM7lFShykU4cxNHNFP7R2PVGGqwiYTzTHc4mCQ5esd37?=
 =?us-ascii?Q?FKVgulVl96wREAO5IlLz34fL03TAhmvX0whMhfKnJjzrm0AMcNv+rkR9rxAy?=
 =?us-ascii?Q?cYq+eYnmzWQDR7sVlwyLntG7UUgebNE2FsOUK3vE4KILlG6BcWFUXxSxZtYH?=
 =?us-ascii?Q?0tnOk8yhFYZVTJsKDsAFXxeLcfZyaa2PCsHiEG8M6nwJDCNehI3JNSMxYwzk?=
 =?us-ascii?Q?RWL/GOyySKfw7hbiZldejp3vifU82yUIK8NHf4Qo/lz8xaOEmYF+ZpfOJn/n?=
 =?us-ascii?Q?lt50Apz0vbiASogX7jt6A7KhtM2l1/o2UbcA0GHFb0TaJLNPDTzufLObRdRj?=
 =?us-ascii?Q?PuEK7mhJliHkb/DCTL9TYd59U6UY+6EO8FQg32qivbuR+RGRuiNBfsxAnLQJ?=
 =?us-ascii?Q?Tk0CM9HVHzeem9uErc+mKn1gNah09lk0yMctpEBuGiaQzVVtmASuj7H8PbA6?=
 =?us-ascii?Q?ZmvzWrCdqvwC3LY2QIQJPtaPCAOy8U8H0CvulDNBSh0D7QtW4uQucx0RPHTR?=
 =?us-ascii?Q?SmRWelqgRFbEnbFwQhN4s6HnvqquxqdlxA17krOQUltpZyl38U8WwoL56FFC?=
 =?us-ascii?Q?rYTsGuLdLybposfxZrIC/NzCc0Ifzi47CXBjm0CAXtDo93+mD+Hcqgn559R0?=
 =?us-ascii?Q?M9ZS9eJqaVIjiDec5HqT5AIfJaKZFB+yrlxwBM374n81GJh6TOg/BPFRVByZ?=
 =?us-ascii?Q?l1u218PzD67xfCPrPl9K9PI9hTfaV6AZDFwC2XaW3y9cSAJEgTqPpM6+Lww5?=
 =?us-ascii?Q?uo5NVxDYIyFN2OE2NlepVgSGbi7X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NSiBEpEDosraW7y2C/vfg6C+QiD9PSZL5bNxmJTy8kRA7CZrTx9izf/0pLxf?=
 =?us-ascii?Q?vluYH6claKDVrf1LwEQ2qgtsHgX9y7DsIGMIbnTevWgKDLgXOQKMcQZcXACL?=
 =?us-ascii?Q?2CmjYLQwLaUUTgsRSl9CwQNjBzwaFrmIwfuKHwIwKHXhWHxt+JF+hrRMav2f?=
 =?us-ascii?Q?VhFBaS4bYcMKHpcvZyXvLr9K+DEkwFm3j1fNWLsCjVj/apQBdx9U8by1H3AT?=
 =?us-ascii?Q?iUgkYSLC3Xchf8q1IJNaFH3xAdgsTooGTMSiXI71BtIuSfJYfUnncxkgHft6?=
 =?us-ascii?Q?2an6QIJWPeS65txQyACzu8YKz1cT/pt2Yx6wc9sByKTcsW8rXQIAZ1ZBLonF?=
 =?us-ascii?Q?p1AF0152uJsk8hn7z44pYOBf55hXitCrUEDXk7N9gdeoYBYJFagyN4EXQYLL?=
 =?us-ascii?Q?90cpixA3oUvw+eZuobQv1p7KUHvK8mfaAwwdNVzFiHJU4ztDd84PnZ8esu8I?=
 =?us-ascii?Q?0z6B32hNbjrqAEALIZZSMXmdVbVlXT+FvoFH9hBIOgJyXIrdIwBNGd5skaMq?=
 =?us-ascii?Q?/i+UC2nGlucY0JeveRM1FN+QDS7xOXc4FGqQQYrqvZgOuq526Ee13TqQxI9W?=
 =?us-ascii?Q?5wRC5/cEl215DOJt9J1VR32CzuWTWV0Nybis0nBRt3ZMRYJvIzmRIBKUtZsF?=
 =?us-ascii?Q?1dUkvijrKKHWxtZxlEePXoC4fVhAUf7KlDyr2AzH3LyEvxkDMoiBQ10LN5ky?=
 =?us-ascii?Q?Md9QJlVzgXpO/vCqgOJxKBXDy8+JjHVuGuvSL8qyyptJJw1/J2NuIJxsIJDq?=
 =?us-ascii?Q?gPcv/IDUHHZ8hW2pYjuUtfZe7VQCgERpvTeDqlnXC9TRl4DmalYYe8LOiOAV?=
 =?us-ascii?Q?+M+Y3FuRwDgbysY6E5qxS3qE7E4MCi9XYesOyehDnV+LBj/W5wumojGAgU/z?=
 =?us-ascii?Q?l2JEUeVlZdaIEzNNS/HBS8F+C/cyFYQTXXKkji9+hXjoQrZiukCXLCL7h/+8?=
 =?us-ascii?Q?3IcfJXqM7qeLqlmxdzvL2DZB4bsT75MDPfFd+/Caxo/+JCOga2/FrulollNt?=
 =?us-ascii?Q?iGcTiot5908rxrw1bDT0YubS946fOPPxTaSqVhzx5Pso2+4cDOSuPrzDaomz?=
 =?us-ascii?Q?pgPCuZN9QIw2M5WzmRrJQodWnnHgnM7K15bzIwuMNcTVhOpqs0+7QEezq8hX?=
 =?us-ascii?Q?EY0H1az2Pac2CxzhDRKdNNxDivgxGngCs4vFjrFJjp1BH19DwtZ4Mz3VMv0H?=
 =?us-ascii?Q?tik6Dt5ZrBk5ts6PW5EpubLPMQps8yJn5vB8lSoRYCRLimup9bJS9uYYKbzw?=
 =?us-ascii?Q?Mq5AO2rtWOptQN/GSNaoZGowblMn+xI7pdM/WigmFRqiLeXKutPjCPBissT0?=
 =?us-ascii?Q?DmTBHwwrn8qpmbpPaN86aV0eee8XvQ90GZy3zp8aRYFzLxfHPIPJ9Y4BIs0i?=
 =?us-ascii?Q?c/5DZ4D53eEq6NYfw9hCXoZLG7r5z58fw/a1C6UQfAaG1j6nNWgClFi811/R?=
 =?us-ascii?Q?2vJ7nh9JPGrMN/8OI/rYGvpKdh8PSVYJA5+0dn6+Qxb0Saq0/kJ50p9JyO0i?=
 =?us-ascii?Q?V9Yor6obUVU0pgOGrrrglaOPLunBSRC49qzC4ecZuSgOkDCvYeCa7cUXWBsL?=
 =?us-ascii?Q?76UDCLhmBlC4CPmNlp3afObebCLwbrbttznOxwF9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b730bb22-f970-4dea-bba5-08dd313c38c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:01:27.7468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sUoIQha1/KGDRArrOpqXPrptxemMSj4zkHh9rVrKbHcCLA7H4Qh2MG8jDKW1L/C/2310BEn6e3/oDB3wa7Nbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_220130_824690_D59B33BC 
X-CRM114-Status: GOOD (  13.98  )
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

dax_layout_busy_page_range() is used by file systems to scan the DAX
page-cache to unmap mapping pages from user-space and to determine if
any pages in the given range are busy, either due to ongoing DMA or
other get_user_pages() usage.

Currently it checks to see the file mapping is mapped into user-space
with mapping_mapped() and returns early if not, skipping the check for
DMA busy pages. This is wrong as pages may still be undergoing DMA
access even if they have subsequently been unmapped from
user-space. Fix this by dropping the check for mapping_mapped().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dax.c b/fs/dax.c
index 21b4740..5133568 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -690,7 +690,7 @@ struct page *dax_layout_busy_page_range(struct address_space *mapping,
 	if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
 		return NULL;
 
-	if (!dax_mapping(mapping) || !mapping_mapped(mapping))
+	if (!dax_mapping(mapping))
 		return NULL;
 
 	/* If end == LLONG_MAX, all pages from start to till end of file */
-- 
git-series 0.9.1

