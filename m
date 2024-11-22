Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811BEE65D10
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 01:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slSOif5ow0EtzQN1HVQyBi+KJnic5NqcIaNTXj2ctuU=; b=xLagVCIfXwn7jFVDKon0+LZzqC
	iD4RqylWJCbx5hLogm1Gn2Cvn3eB/URx05bJS8/R/S5Bis46BCgRd79vtJNtYZPM/NCc7zx6KDz/2
	HPV2xemV3vvN9QiaAfy3sQ/Z3jpssYv6SPSHXBvY3fxRkPToUYLabGyISHQIjn/Vj4Dnu2pTbAcK6
	alZFuVkI60g0AU9/ABFL+JXRFN3NIrsViSHALpuFtjT0p8BljRPRAlTVB7z5ez/3U5mmm+sHQRyN3
	KJCM8PH+YgKCW4t1ZRzUb4R55GIw7aX6IlcTy/VcCtrWKASNELnejT4xn44BaSVgBipQIcdGXkxRK
	GRlx2cDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEIsd-00000001Ocm-13W5;
	Fri, 22 Nov 2024 01:54:43 +0000
Received: from mail-dm6nam12on20616.outbound.protection.outlook.com ([2a01:111:f403:2417::616] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEIgW-00000001KOk-36nA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 01:42:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPPBevnEoNffsLybWW7CKruZ9NfXq99PLCYnIjt4hIrq0R67QDyBNwPglwYxNHvtFFna1EVA/VpoLRR+XPE9Uj6vMWvRs30t4h91TMkebhf2pL+wPOxSQcSvqZkEs59y+hNu2QSFOeU5gwg1YoKEO8ZR/h1P8NcpgzPEQ/SVd0Jmze09AxTtjWtoHRcXqkj39oxCu4I4b9/7cS/UYiv3dOBbb7emNKwv8J4MhYb6t910pha7zhy1qUfkt/uKI4npNgP3DDdqvp+cEgI1KA1F0kyD3E5OuFjLXBs4IuGFMN1JBLalaNjEK2Ez9lwhNrpECCgtU83o+egrZuabldHCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slSOif5ow0EtzQN1HVQyBi+KJnic5NqcIaNTXj2ctuU=;
 b=Uf48QFkqLnWEsrSaI4WskHjK4XQ1cs4P5CH8O8f4uD0YaEw1GWlbHmx6d8XyQVGr56IyFVg8D0YPNE2hZyQCwuMEat9AXfMCbClqObnYaJp/BBsPJrg9sRWR+Wna06lgG9Mm4hKHBMBaT2zpVARQ8uEfrXvrfy54z/kiLutnF6jR0mE1ZsOTAIEWfBKnj6tWvINSWqxOzoIee9S58yLElRdkAQsVBoR46vifBEXd6z46oKZnnnB0+OLKskp0Fk1vxkJrU2qfy0sbodiGhqavXrBkAMDt8+fAQ4oruM5fk7unL4fSe0ok1CDS4N1CLjd5tIA3tSywyO//4CevQCcYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slSOif5ow0EtzQN1HVQyBi+KJnic5NqcIaNTXj2ctuU=;
 b=sivYZ0cLEW0VJ65t8v22+a0VaN4zoHpkdw2BzxXr/sBqZsnsp8OPrwsa0//GtnSd1kJ2bFp9Op0AvqXmQfFen7ExDofSMF6Vz8dyrxwUrFYzE7FLG6Rrp3zOSD6rTqIC45jN2zsi+3a/TBTQ8tgua6kBK8fcnEeVIfSOG9ac4j3tKQ2rez//za/QLStTsOdzqd6FFhTyjqt90MWap6ptACQiIKQVdFTt066Qsyl804DvfGU7Ogy/XqYVcW1tmQTPJI3XctC+Kh/Zg46O7+UpoTS8NGgbaQ54wFAH70aN4ryXxGMlFxlpnbMjAsD2uMxKGWMOqXM0/O7BjUDu4q1jDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 01:42:09 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 01:42:09 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
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
Subject: [PATCH v3 13/25] mm/memory: Add vmf_insert_page_mkwrite()
Date: Fri, 22 Nov 2024 12:40:34 +1100
Message-ID: <cc2fc2971ab25e7e9f2207bb84e2ea0527174ff0.1732239628.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0019.ausprd01.prod.outlook.com
 (2603:10c6:10:31::31) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0766a4-26e7-49e1-37da-08dd0a96e0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UyDP3R7K2+Mjghd/Icg1HPhukIkuHAWp9VAWjuv7B9PHDzi1XptsxaHg00TK?=
 =?us-ascii?Q?XWjc96b4dyTHRLPOBMSXdl2BHyJfa9qPSYuy+D4reAI63y3KDZXNNEauPbSy?=
 =?us-ascii?Q?CMod1qpPnY44Ehe28RPTpmQOxivJfJmY05CRrE3jnKzOCq33saOQ1Ae2VIc3?=
 =?us-ascii?Q?JjxdQMspwkotoHgLz8Dyo/UmJK019ETYGoLzgszSUY6mCvW+LoHNCe1FzpnJ?=
 =?us-ascii?Q?UXg7SBH68NEB3U1vJvqyXgtJ0EIXuWqwI9xMDN7UyGGhoO+CwO3nn2PEKfVj?=
 =?us-ascii?Q?cgQ6c4tivMmzEc3dIXsMzdJeBjpB2v9lW6w1jiLUvfL/N/U3Gqo0T06aiEfM?=
 =?us-ascii?Q?LEattTHi8a8vVTkUUwJQzn7FMguLzlKCrec1AESRgA8OKGI8PIsp099AzMC4?=
 =?us-ascii?Q?fjZI7LgBZotWHe6vn2UAbFaOOy792QorK6wI7NUO+4h1bo4JEmYorQLPr/Nr?=
 =?us-ascii?Q?uE4nFcRoDmwEox8mRm2/A1IVpJv4qURRmkBWWU/gjFuTkqu5po0pJ7gsPh7k?=
 =?us-ascii?Q?HHa6gKru2Z2nyMtI6Bj7zbG6ZEdYmQ+JsuIpPUEQX7vlUvTG8dcMEq5KWW9S?=
 =?us-ascii?Q?V6CHxzlfLw0kNBXGc2s1rUpH90NxHOtP/kwlyQKnJvrF0V8ocupEoSgHXgFl?=
 =?us-ascii?Q?r9eoyzrdQJUiumoOltiP8mAfWJbxVnEPscSxVHlIPDwkBS3Cy54KXBId8Bpr?=
 =?us-ascii?Q?kfisxLxKpCWqlSub45lz4EwoqSWCiWd8rNl9vu3KjDRFJraSXHAkjeuuuY6W?=
 =?us-ascii?Q?fT5vB1L9QSYWeithBs82+snYBwK7sKDBzROuRrqMZeFMsROLHUwMf0qUHMn1?=
 =?us-ascii?Q?S54KQ+/pslrQprfsc+notiKTzEnJC1Ke+CP57BzKNzXoH669rkhaHRkSYBGA?=
 =?us-ascii?Q?1qyF3ftue/tmpnco4x14HPQr20ipg0WNzvnVeGu9ZseRBOqf2Z+z8jt/v3Zf?=
 =?us-ascii?Q?FMIlsyIW4UOPSVZG42i8R5PLDQD3aYwloQZX6JuFR9XSznOj8EGkz6YwSVqg?=
 =?us-ascii?Q?QlLqq2jeH5LnKMTA6b5wQIxUySTQYONLw5Wej3g3HvVIaFA4YqvpLFKV5Gmz?=
 =?us-ascii?Q?l9SGKmIXSbwDQmRqFq51wJW0i/Ik3xUCVYhqmS6+2LZSKiiuRM5CGtQfe4EO?=
 =?us-ascii?Q?o/TUcWNH7VP9HCIVpGetIT4WNVQOFiyZflEY6HwQ7wEKtfFSsk93rzgq6ue4?=
 =?us-ascii?Q?XrNUuGDY7g8wsB0UITrg0EAs4dj4V1QrN+6bkDB6EuAjsbL7jLKd76bJJgfl?=
 =?us-ascii?Q?G3eGqnpuF8cVHmjC2Q4e6e4yX9fnEz2aRlSqItAX2awyNGXH4JDB/qwC1cKF?=
 =?us-ascii?Q?WNqXxUzF+ZbXgG0yefJootXI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZi75HfXhdoh8UgqIGfYtGdj5yPVpxIPpOdrhf4mDVEgMou+3bXHlKL2vrTf?=
 =?us-ascii?Q?nbnmBtIZsQI4QYzZ0gGwrL/a7YWjL41vnxqtXviWtq5gJ8IYB/Ek/WkN9tPt?=
 =?us-ascii?Q?bAEK5ICChEResOPtE4R6JYz5KEhllmHvGgcKapLpA+4fPLqkOFP4P6Sn29Kl?=
 =?us-ascii?Q?dD+m/kz3RwxnOsINQCCUcT4a07tL1JhEPlZ/tb2vWFTmHOlwODvMkGBwxs0h?=
 =?us-ascii?Q?boT8YaCdawRdFCw2pQkQz+3QMyVB36H9Cv2OyrBKre3ineEDio4ZE/Ybkpvd?=
 =?us-ascii?Q?AI0MMyGgM6kBEsXF/4WzAZiM02DGb+1IBzj4gXh6V2plc9DvBAwGQHSAOBM6?=
 =?us-ascii?Q?LJs1gjGpHGw0yDhkzUN5UsFYreRWPWG7fPt62e/gEz2I2Ke5UivcwshVuT7t?=
 =?us-ascii?Q?LRv6ySYadx4MpmlLgvMS/I7MAaFOEizP/Z8MTAzElF1uyjQN8Dta21IQpzxW?=
 =?us-ascii?Q?xPNMEJL2R7RhHYURXaVcz/ALdYG4kkP3pYUliA6DV+hdrTVs5aoWBK1mDZdg?=
 =?us-ascii?Q?CYbmdFHzZH7dHZzg3VIcu4QmS8Tez9eHJY9gBR9OP2JWdLD6sGBMzczeNruP?=
 =?us-ascii?Q?RsBRljrDlcVEETMl5ys4s6kYON/sn9yJRY8rVwWKHIsjPnoJRhd6+mcSseba?=
 =?us-ascii?Q?CqJUgPbRbuQxdUIhesea0CXAwXPKx5FgrtU0TeGEAKFZAtAfXvcykjuFw35W?=
 =?us-ascii?Q?YC55lpr3Y8qt5fPOw3cTEm6yJpOZdLbRsXu44+70IRlFBmj8s+6wUkgucn/0?=
 =?us-ascii?Q?IrCqdqo+bP0KwKNd3YH7TQtphfUaAfhYsVYGMRRDnmPZI8LsGjOZBEIGW/cv?=
 =?us-ascii?Q?2wq2xY1eT180ZWMtPMpVFqEmjJDcXOWPqfxyMIawaqz8lfL4mClVJsPFqNmA?=
 =?us-ascii?Q?PGyrLPMB4S+l0XWJq7W77V3zM//qaNyDDdP+TR50tqCkjGatdW9NqA5YEmOy?=
 =?us-ascii?Q?T9GPQ5oQHpjN+U7BhYNoZv7iTxtwzvIC/bchWQbh0hYWQ32S4OUbWL2BDSAk?=
 =?us-ascii?Q?krhrvCig6blQbvkqQMgFzrHHaHRkSgd0W18YWrukkmg3YrGnhd4xQ8pXKDWT?=
 =?us-ascii?Q?Ac64hdQf0AygM/bsLMID313Okn7u8r9YeVHPAXxWPnN0SAjh7nHJSUOIlyQV?=
 =?us-ascii?Q?vm725xMsZ6JA/Ge8ty2cYS/M5yf8aeAQptURVKxrhWQ/ZZUMMO81vQOzJhjy?=
 =?us-ascii?Q?hPun/CApFf7iPYj7Zk3SaSMQnGNAh3VyRMdq/OdW6lSu1juhXs6d4fdxekmE?=
 =?us-ascii?Q?eKrh4H0qSkOAgYmqYa0eOLTREUUti0SCmFQZQrM74aUMAo24RY3gp/qAY3a5?=
 =?us-ascii?Q?drecasfRYApaR2yUG7KeHTUs8WJSEFTbdygYMIzjgeYuH5/2a0rt2vkgy6NC?=
 =?us-ascii?Q?wTZ9ChsQT98D95yKrUY9Ak0qbwGLCLH0d3kxUkUfcgzh1ttlycVFH3DQIb1a?=
 =?us-ascii?Q?3SAaGdjw4LJVv72PBXz6Q0YceUtEGzR+qdekIr5xWoZG8dzA8ridu58puqel?=
 =?us-ascii?Q?Yuy+e/q/4o+iyXPEunxIS/4PAGd3iTmFL55Qcp6cdv5uEmyb2rTb6vuAFcbk?=
 =?us-ascii?Q?5NMqo/UZikC4u7j1Ro6Ac8tLcr4FC5mwNrkr+Xr4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0766a4-26e7-49e1-37da-08dd0a96e0fc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 01:42:09.5494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGy1Oy/tOYPUgi9DpMSfSxDBfp8tIfWwlC6U0U/kjBg+24c6UFZPLZTc98WUkKI//FyzAFHsyYsRTVfTFY7khg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_174212_783157_BFEE160E 
X-CRM114-Status: GOOD (  14.37  )
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

---

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
 mm/memory.c        | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 61fff5d..22c651b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3531,6 +3531,8 @@ int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
 				unsigned long num);
 int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
 				unsigned long num);
+vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
+			bool write);
 vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn);
 vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
diff --git a/mm/memory.c b/mm/memory.c
index 323662c..5e04310 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2548,6 +2548,42 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 	return VM_FAULT_NOPAGE;
 }
 
+vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
+			bool write)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	pgprot_t pgprot = vma->vm_page_prot;
+	unsigned long pfn = page_to_pfn(page);
+	unsigned long addr = vmf->address;
+	int err;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	track_pfn_insert(vma, &pgprot, pfn_to_pfn_t(pfn));
+
+	if (!pfn_modify_allowed(pfn, pgprot))
+		return VM_FAULT_SIGBUS;
+
+	/*
+	 * We refcount the page normally so make sure pfn_valid is true.
+	 */
+	if (!pfn_valid(pfn))
+		return VM_FAULT_SIGBUS;
+
+	if (WARN_ON(is_zero_pfn(pfn) && write))
+		return VM_FAULT_SIGBUS;
+
+	err = insert_page(vma, addr, page, pgprot, write);
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

