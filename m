Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFECC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 03:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNPEvAsPe8G2yTsS4zF2Ou6m25axDDKUOssAOYWV7/4=; b=WL3u5yBpn+/Eh/upG+PR5JF4es
	uZmx1cf6pmyMRc2nBN8BOT66cLFZCpDragYJ12cP37LYRRdTVmiQNVpZTldGjVEnEuzBMNldXAhRa
	eJXAU4pVhDQ0ybjcvnzLBMa0896cyWuXeNFilAOUEjDVaSVItZicTJO0AiSWDHTY47MyiRnN9kGI0
	4gLcof4gHK0Rub75ZDDUiu8qEU/8JSr7w4ZbjEVKhZ1LOhBb2YnpUY5BZZ9an4ULnWLlBu/WD0crO
	2V/O3yC7jZCsM6C6Smr4+PN9sB0bcjpoHTtAUCu/fVfxm618VZ4MnxqFVpvesXQ/WkUp3Z70uEPRN
	x20WpWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrQb-00000009f0v-3iCi;
	Fri, 28 Feb 2025 03:52:45 +0000
Received: from mail-bn7nam10on2061d.outbound.protection.outlook.com ([2a01:111:f403:2009::61d] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnr6t-00000009aso-3fGS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 03:32:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBB+97phwKzRvIZZyzhTDI8NhAo/aQhokC9bsOgShYQe/vSqiPrx6hOJ9W/SzrBu8ZkfHZyUoI3ivj6WUEus6j9UvY9K1tDaZDB8vNWmHgBSJg+/K+JrAaefkidv9APUQnyMSUbbtwjIq5rayje+uE5pRHisAnpfeRFn8KVL7EEiT5/RqtIInSh1HorKzmev8ykLtZXotGn5T0TGYjTx6rN40MHx2VzVqpZTgUOHKTRFm27HGPDb5OB5EBmrrIuQFsAhUJvvqGmSMv/dUe7xlMrVQVpXLQBY0/I40Y0jLk4vfRcPIhzuW9pBzfRgpU8Yo+LuNud8Jr1Th8ZIIVuEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNPEvAsPe8G2yTsS4zF2Ou6m25axDDKUOssAOYWV7/4=;
 b=hoD309mzoTJNaNwIVVjus9IQez8Mx7T3cy/otkBlaqOSgPsKRiQB+4yyT3Ia8ch/oeGvpsgVwqeHMFu5EtqFLr++8XwdGuZNXkyHjL02LOwLFHR9iMaLG/i1Cu5VPkzsZ89Y+u+nZiXG7B92I9ueYzhw3krlOcZ67kvtJ3xLvPA+rmluNOLopiHhuiIroXbZN8tOB36hjnq9PSzJLeXVqqzXycRlfgTU9+IWSWN57BqtSx2JaIoPMiJJqwpyY664YI0/TFq41HoWtlDFNZTHRXCmJmXmsvhuGYeaLFIQbEwBbjXxhugrJGZ6loPrl4lCnSsWiiBnRjF0efJckNTi7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNPEvAsPe8G2yTsS4zF2Ou6m25axDDKUOssAOYWV7/4=;
 b=L9u/dcB6w8plRd9kbTR8spcNO5FMuRTFP9+YahZeMdtlXwmQF8IEGbHlqKb9LTLU2pc5L/Djd7CeHmT/MQIAhm6T9+NG4V3+o1rPfPqzkvxCLPcwwFExEItNDlVCVRLuKigVCDWX5E8F1PT/hvoRJ7E5GDnlXQagZALXAVgDDbiaqEjnFDaJH9kvGNlXExaWlB1ofGNc1GoabrJBq5ec9fuWvc+gpNOAj8X8j9VfpYQPwOBOTSJP485F9Xg2bAhsRa53bz13+fQ50P7XNFApLdHd1bq2WXiiTIxZ/IOOiV5a7L8ZeMNXgvnepXlyMDYAq44oHdek5uulBv9eie/FaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 03:32:21 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 03:32:21 +0000
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
Subject: [PATCH v9 12/20] mm/memory: Enhance insert_page_into_pte_locked() to create writable mappings
Date: Fri, 28 Feb 2025 14:31:07 +1100
Message-ID: <f7354fd9c2f5d0c2fa321733039f9f87e791023e.1740713401.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
References: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0146.ausprd01.prod.outlook.com
 (2603:10c6:10:d::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd29e86-fef4-46ca-0908-08dd57a8822d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CxtFFC9aCUAnMKS9Hz4xjpv8X/FLsEMac8vKJL8HQTEJAXBWlp3FyW5HWjSH?=
 =?us-ascii?Q?gk0r6NOlho3C3nCLWFQSYIKfmbc4ByMzKlh7dkIu/1N9Zi7OPxmQGZ8I5sRA?=
 =?us-ascii?Q?enX4+ZgzZo+soIPPp4Li+8L/JrgfIoN8yM1KYQocnKFm4gMb72XWizxUoyqR?=
 =?us-ascii?Q?SiueyA0F5zVvA5UW/czYVJc+rO0W8zbUPRla9iv8f21D8hiB8Ygi9uXiq7Em?=
 =?us-ascii?Q?cs0nAF0SEaJrK8agBvxGzz+7m9dWKfNj9homcF/b50hdD/FUkbpfBQYp4KhJ?=
 =?us-ascii?Q?uNMRaQV54XE86cGVufJ3VjxIhja7Buxj+wymPbOCDwxR2yoQ+skUvB6jdf42?=
 =?us-ascii?Q?JQH3i1EoafI7zenJ0R037gKGjq2CrqFYNR6wgCKdODyO63Gfap+wG5x7puU/?=
 =?us-ascii?Q?FpeIgx23KZ1qJQE5xdR0luJvVEo8IM/WD0tGbp7r+yUndg4QrNBLTOXwkbh9?=
 =?us-ascii?Q?FBeAZNAZP0tVbVLMU6bmU89q6qqiCEGjL9YWSp7jol9VyFZLHBtHiL3boqRX?=
 =?us-ascii?Q?geekouRnqFCukdFTQmsU/kVOgOwN2P1pTriuhlSMJbF0veIXFYG/ngO93HzP?=
 =?us-ascii?Q?f0cRA6gi9X84w0NrZpx9UN1MopxeO/UTcGTzBn4/XWHWV2BywLFJ+HaIyVcu?=
 =?us-ascii?Q?qt0Q8g9LOdoPKkIp9zEwtzJRW5QjynG5GwVDMtgLk98OskcMSfLr/wBSkIiL?=
 =?us-ascii?Q?ljlYE3pTIC7VxpiY3v164PiWOdRg/XJVwM2gGLGXtyEXL9kKZGRX6gfII9hi?=
 =?us-ascii?Q?9RBXXQe6Ag8F43lVbbSk/3uKJLR93hp/HyW0X/NK0N6J+BZHI0c7IMiRTc2w?=
 =?us-ascii?Q?5FQkgVDiByG1RsvsjlfjVD/rvnXl5KgTt33M7R1zRkfhP+BIaqduCkuduFra?=
 =?us-ascii?Q?xHlsRrdtQADSOMChARQuqE7iX27l/VDzTYP5P8cgJg0/Dozz07tMPPWmBDlu?=
 =?us-ascii?Q?PXZ1eEkier/KXX+OsZvd+zgvHXHQxsN5/Z4NyaRzuSfXIO4DnBBXvm+Yz/NE?=
 =?us-ascii?Q?hEFTSzH6SazrJm9HWYSKOOTjVMtbVFSt2fusL2EcqvFZRXT1lyL3LVQw6y+Z?=
 =?us-ascii?Q?RJAbbdo1nyJjcQJLal2HEWpkiELCPAYBR8VatqPEmavWCdVzi5lh8tcIlhTJ?=
 =?us-ascii?Q?b+f3eMg3BIlJ4lSxuxulsdJeeNzHiuMYW9/Cz7dxaWwz2S4yXjApYLn5TwCT?=
 =?us-ascii?Q?Df//NTTVqZPimZxR+mzu3HBkEPm08i2FBm8pJZxRyF/s1IsRaiyFhUeJmzE1?=
 =?us-ascii?Q?94DGulnvx/51fCK5fApHw1+Uhrl2IohKB8yfgZCDk1oVb2AjLVJN48OpPzXh?=
 =?us-ascii?Q?hZbtD9rJFMJD4sTOyuIMygIFzIWX1g1aN4ax8R9hoazd/iy775ktEmqqHa6v?=
 =?us-ascii?Q?WjNPLvOU5gedgU0WaPuKDNImcbdE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xLFgM3yWNTSzfS1255VgCfHHTHATH8X1NRvueVWfhfmvc0Fs/xlWOFUYIiqX?=
 =?us-ascii?Q?MeJOO87zXX54eUaqpJHiJCxVNnas2NyZxfYOa//B+T/+xxggngecONO9OiFv?=
 =?us-ascii?Q?xQ5rN6TQG7aZ2R8HdSdeQRpb7m81Ja3+hLGfBXD/59oxiBFekfkEl+Nk4+gn?=
 =?us-ascii?Q?l+PMx4VvHdoeUjyHLrK25l1iM1cppoVm1aLBXw+eM8+WrTCa4AvxRIDghRBH?=
 =?us-ascii?Q?Z8xDaQ+DD83ZcHJ6WdGbQXsCQp47lz4F8trfhWTxACQ4OY2ohjUclGU4rKSX?=
 =?us-ascii?Q?Jx3Ny0eGMfggN4pelDYGW9JOka5fH4FL/C3in4ysRgjmkbeiqlypuzRv81ZY?=
 =?us-ascii?Q?2iHVL/hB+TF2B78NlAq0mqNAHoSJ5E853rEcRup0cPDuql2Gb7w5zwWb8UFg?=
 =?us-ascii?Q?VIKetWXLOo1ZL3jdrmoXOY19yugiw1wGKl/zPlrP/UJJoYB/WqQDJ2zgOC/M?=
 =?us-ascii?Q?RXbgpvK7whBScvlywfHllOpEmA0Mu+OBpcK42WpBFoT1e7pebQWBZ0xpi9Gu?=
 =?us-ascii?Q?V6irO7g+ggo9ffQt7+tOanc+CCPhycQ+erPRcbu/YWFUdiKyqp5HChL6SqDA?=
 =?us-ascii?Q?Z5U3hqOJsjjRmnAG+4dGc9O9anmT58yxay1AL/RGaSW6HciNSfa+umVeG4V7?=
 =?us-ascii?Q?e/NWpszwqV07uvponzPl2iDD7vXBNMpKe3bDY4fE4KbFPZZ9tYHz9a2dx0oG?=
 =?us-ascii?Q?WtilJWU09XKVT/Q4ALUO1ku5A2hpDquoZz7XayxBIcusDk8vJExhfxN2VQG7?=
 =?us-ascii?Q?bmCoULIF35A76VCd1/Sn+aat7gDn23bk6tKGYGnzrrYv8lw31nwIUwD4jcxN?=
 =?us-ascii?Q?Ty33O2HM3/0HeLEBadcXX4TCYVHJTYtNO/rMlthHhYXcXz/xtjgm/5wmWWE0?=
 =?us-ascii?Q?l7V+qTr6CeIgT3TmmidUeyBwK8LDxFaO3a9RLwzDOxD3DeV29S0QIq5JakiA?=
 =?us-ascii?Q?Ou3Ny/a30y94RH/hHsU0DylVhEm2MSSEGFqJXT9SBfQOW2y37BJIc9n5ZIOe?=
 =?us-ascii?Q?yk2HuiIh/3tsp/anuFS1x+YV++lXegGSvkEewjd7r7KXicpwmz/IfNrj1c3T?=
 =?us-ascii?Q?9Alo7PK49xSJSV8fnmoM6ecGQ5sLYXwl7TScDI0VhbYcnnEeCb2v12c2B2Op?=
 =?us-ascii?Q?vdZeDH3IoHbCElTn9Nrqzwc0WheY95MHCXEne43E2i7VVLEPQKhlKKhXI/C1?=
 =?us-ascii?Q?GN9ITlk4Sa8oIcuBLC5bzz7diOqYcdpViRJT5IoZMBw0R8jUwaFKgiKx2qVl?=
 =?us-ascii?Q?X7Zv7A2esDRsUiAq/TKcvczMlRB1iYfItdCx6KnZu1vfbYOLM6UMtkjYdVFh?=
 =?us-ascii?Q?t+I16MVrDCp+59ar0rXy7cK1PMP7unVWIAKQrPbhahUIGvedIdY/nw9Vjo78?=
 =?us-ascii?Q?ge4rfDgmsRA7UHXDowg+u8/agWV3nyF3e1P0yBI0CqpnJcHgwWd3TCtFi1/A?=
 =?us-ascii?Q?Eih0EOQ3kGnCOYveTm1WJcU+g5II7Phbzxli9Z1SVIbKnt3jkzEcm6F7TsBV?=
 =?us-ascii?Q?ILm4IpR9vniWak6k1dnX8lS235aeATOWcH04ExCGwj4g2azJ+v8DqWSbwpxn?=
 =?us-ascii?Q?KLI0aF90uluuNCawA0/g01aHDhq63QbTm5rVxxtZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd29e86-fef4-46ca-0908-08dd57a8822d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:32:20.8961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr6H7zMdW/ylEQS4aKCpEL6HkQxzqxLuP8a4ebLDsSxQ086EphR/kCyg4jvAE1icg4I79nrnJzWodrHhdiM0LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_193223_908096_8D847469 
X-CRM114-Status: GOOD (  14.12  )
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

In preparation for using insert_page() for DAX, enhance
insert_page_into_pte_locked() to handle establishing writable
mappings.  Recall that DAX returns VM_FAULT_NOPAGE after installing a
PTE which bypasses the typical set_pte_range() in finish_fault.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>

---

Changes for v7:
 - Drop entry and reuse pteval as suggested by David.

Changes for v5:
 - Minor comment/formatting fixes suggested by David Hildenbrand

Changes since v2:
 - New patch split out from "mm/memory: Add dax_insert_pfn"
---
 mm/memory.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 905ed2f..becfaf4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2126,19 +2126,39 @@ static int validate_page_before_insert(struct vm_area_struct *vma,
 }
 
 static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
-			unsigned long addr, struct page *page, pgprot_t prot)
+				unsigned long addr, struct page *page,
+				pgprot_t prot, bool mkwrite)
 {
 	struct folio *folio = page_folio(page);
-	pte_t pteval;
+	pte_t pteval = ptep_get(pte);
+
+	if (!pte_none(pteval)) {
+		if (!mkwrite)
+			return -EBUSY;
+
+		/* see insert_pfn(). */
+		if (pte_pfn(pteval) != page_to_pfn(page)) {
+			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(pteval)));
+			return -EFAULT;
+		}
+		pteval = maybe_mkwrite(pteval, vma);
+		pteval = pte_mkyoung(pteval);
+		if (ptep_set_access_flags(vma, addr, pte, pteval, 1))
+			update_mmu_cache(vma, addr, pte);
+		return 0;
+	}
 
-	if (!pte_none(ptep_get(pte)))
-		return -EBUSY;
 	/* Ok, finally just insert the thing.. */
 	pteval = mk_pte(page, prot);
 	if (unlikely(is_zero_folio(folio))) {
 		pteval = pte_mkspecial(pteval);
 	} else {
 		folio_get(folio);
+		pteval = mk_pte(page, prot);
+		if (mkwrite) {
+			pteval = pte_mkyoung(pteval);
+			pteval = maybe_mkwrite(pte_mkdirty(pteval), vma);
+		}
 		inc_mm_counter(vma->vm_mm, mm_counter_file(folio));
 		folio_add_file_rmap_pte(folio, page, vma);
 	}
@@ -2147,7 +2167,7 @@ static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
 }
 
 static int insert_page(struct vm_area_struct *vma, unsigned long addr,
-			struct page *page, pgprot_t prot)
+			struct page *page, pgprot_t prot, bool mkwrite)
 {
 	int retval;
 	pte_t *pte;
@@ -2160,7 +2180,8 @@ static int insert_page(struct vm_area_struct *vma, unsigned long addr,
 	pte = get_locked_pte(vma->vm_mm, addr, &ptl);
 	if (!pte)
 		goto out;
-	retval = insert_page_into_pte_locked(vma, pte, addr, page, prot);
+	retval = insert_page_into_pte_locked(vma, pte, addr, page, prot,
+					mkwrite);
 	pte_unmap_unlock(pte, ptl);
 out:
 	return retval;
@@ -2174,7 +2195,7 @@ static int insert_page_in_batch_locked(struct vm_area_struct *vma, pte_t *pte,
 	err = validate_page_before_insert(vma, page);
 	if (err)
 		return err;
-	return insert_page_into_pte_locked(vma, pte, addr, page, prot);
+	return insert_page_into_pte_locked(vma, pte, addr, page, prot, false);
 }
 
 /* insert_pages() amortizes the cost of spinlock operations
@@ -2310,7 +2331,7 @@ int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
 		BUG_ON(vma->vm_flags & VM_PFNMAP);
 		vm_flags_set(vma, VM_MIXEDMAP);
 	}
-	return insert_page(vma, addr, page, vma->vm_page_prot);
+	return insert_page(vma, addr, page, vma->vm_page_prot, false);
 }
 EXPORT_SYMBOL(vm_insert_page);
 
@@ -2590,7 +2611,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 		 * result in pfn_t_has_page() == false.
 		 */
 		page = pfn_to_page(pfn_t_to_pfn(pfn));
-		err = insert_page(vma, addr, page, pgprot);
+		err = insert_page(vma, addr, page, pgprot, mkwrite);
 	} else {
 		return insert_pfn(vma, addr, pfn, pgprot, mkwrite);
 	}
-- 
git-series 0.9.1

