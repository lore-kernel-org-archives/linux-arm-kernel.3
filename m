Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FA3CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzf4xkQBqoJB7MfypbSvNbr7G86Q/So9U+6UxcUqwH4=; b=M8FYZ1olXryHX9FjXSdqVBXE2v
	KB1FCNkIkovl0jAAt6SRi2B+X5O4K96XOYTPW7y/aabTyJsbdkHmCDNN+qPBR225MnH9gJ3jx5LJh
	21jc/HWBA+W8SDTfsMqxRk3K0h7N6yLIU5G8C5cgkA3KomWMRgZoqCCyJaCCVbl6Ja7bgisCxVVot
	ln8+iTrvsWLFCE9SmooAElf5MR3sZD8qI6xCtYIGarEJVd5qWnHHGcZZZ4w+9sE/fPFamerq7022Q
	T9SLx/WvA78ZdgocpFCTO0zuV2Wm5xKj939CJY7sqnK6mxNqUoBGN7Kc/L5XW1bzNGcX4+Gt0uOSG
	hFRLrlzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PU-00000003wE5-2BKi;
	Wed, 29 Apr 2026 17:09:16 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8PK-00000003w7G-29bE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kr3HYB6I0ED4cyUmLacU31oKmHi7QJcc2GAK2dWVnCTamx4jyoMt3qQv9Eutq78LITjWEaEz8iKKoWedQwLKtyZC4TE1wVO0xQUrZ+PvEXwz+L4m4couKDn7VpAxR7GNRK5kEXfh4MRphvhzpfDnfIljAvmqmmhS8Pmomw3IUjh6qEacNi1sgAM/UNTFyRLGE3I65GQoAzsZ8uOi9LyBZGtCi2MwqLctaXboZxReKMO/9q3p0tnQHc9qP5RE7Dhzxnf0Bu1b+ILTAexUo401rBhpMv2u56LwtPDPig5SU3Siisbj9STzS/PjZ1NnTcUwmmj4PvC/pm305AeZD7BBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzf4xkQBqoJB7MfypbSvNbr7G86Q/So9U+6UxcUqwH4=;
 b=vSlkNinNrJnY6jMJpJm3aoRrQrMQDdQ4Wc6My4CmUgjIVZtr3QiQ0mdiqV8vOW0sdEWH4eSU2fkDjVFeZwPWvDXb7L47Oul2HzXWd52zCUiUpzKE8s+/LI4aIspm5Kbzki4bi3VcatetfNwPLj2ZsEyJGVyAhfCWq+98scrZ6MuXZtjKmUk3cwQtmKIn1yvv2Z+zHm0idUw8IrnBPTM+cALROa6LLscyccTw/NXepXR3SKuPrseCmSPB7t60SFznk6ugDO/OcDftrBWK1S2rGKS+XWx4eVNoy/gLY9PrZFl1mf3c3VPj0nKSmAFRRj47Jvigb2lunlXzaYQ+sA/xxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzf4xkQBqoJB7MfypbSvNbr7G86Q/So9U+6UxcUqwH4=;
 b=ADESk6Wk2Hu0PfBzgthd6fDYiih1X5h7H5f5WOP2ldH8zL+VW4txMO2KZisL7WxlcwvgaV3D56w4GL4oUmQga0XvjOptQEns4LDDVItSt0cjFn5JzqUOpyJsPTsCpzDXphHi7ZPthrITkR0v0cYvKWShEKEIeWMYq0hzc67sBKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB6671.prod.exchangelabs.com (2603:10b6:806:18b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.26; Wed, 29 Apr 2026 17:09:00 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 17:09:00 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: cl@gentwo.org,
	dennis@kernel.org,
	tj@kernel.org,
	urezki@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	david@kernel.org,
	akpm@linux-foundation.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com
Cc: yang@os.amperecomputing.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] mm: percpu: prepare to use dedicated percpu area
Date: Wed, 29 Apr 2026 10:04:32 -0700
Message-ID: <20260429170758.3018959-5-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260429170758.3018959-1-yang@os.amperecomputing.com>
References: <20260429170758.3018959-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:130::13) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA1PR01MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f46388-51ac-4858-a26c-08dea61200ff
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003|55112099003|921020;
X-Microsoft-Antispam-Message-Info: DtFWfVYH5KhXnGAhHh8qUO8hotpDcU6rD6qfq3sjxYgntnvOz3FnjqPvJzpFsntwKXzVG3yBwqpLXwJmbSugasVuKd09lCrlB80t1wexAadBqSGg4Cz3EcY9lMrZfMkQ9Ail21r5hanUlaS8x0yYlxQBdsVuFEQMv+Rcgwt6TqVTqdK9uxHUuEbDX3gzxYENoWiL8x1y64ljy3l3Ut62H01piEctwzCXD5boANci+BDdy9AowCCzYCdEmYaYcIH6TMTJ1j5NGoBtu+f1te9YK0FNcbKBVvGD5Qgk+2iOuYB3Yu0pqxJTe4Udy9XagOJrOFLHLVBGZZfjM0rHb/NqAFkDxW1v21mDaxm9SxAyrPg2JioOPQmqgRr/rz71YlLf0XtViXx0TNr8eWfd5Dov5ovQjmkdI/YMd/RMzE4F3LM6/6kWZUwY3pGkqeKqOsfPV8cQHGlMdxlrX5qw+r1VMTOroVfAjCAIY3hXPBqmBezSs4hmveUp6kZV226UzS3OczDCAxAzCbywwYyox8PFxdvDyn7kbBfNnaR0sfkFdpPRIFH+3a9icvTTb2JkE6W5eXbgo+6y4AH+7Iod7I/cxkakrgi+SrvnLhwRl+y9Pkc5CHDupyPi6JSuStvpEZq/h56A3HMn0uPsRQdKwez7aHo6QBwOuazsRgEUo2lfoSSyoJ2J2CrRr9nDm11Tw7L/yM0Je/fZxuAiNO50d3riXk70Rp19r9x92sUtPq2LBRCCwH12zIGLSHxa1HmLgAeoljQ43mfBtsiLkZ/+EkaDGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003)(55112099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ICCb7TNNxsUQGTgOHZSG/Ugyuf2DMji0U0RJLgAQ3TwPA8AvzXUimLxWFC7M?=
 =?us-ascii?Q?yhZ9lGDMbO4ptzTpU+jQsXzfTYimWQ3tZUQRRahL2Pwtb+Tyq7AxaOl4hIo8?=
 =?us-ascii?Q?hN3BwzJW8cQoLKTG7r5FcyUFMWhCk0scj6to9GMvKQ1Shi2571fTen0gp5KQ?=
 =?us-ascii?Q?4UT2wAibJxaoNe+vKJZmB+Bplv6wWKlOM+0Qru4QIS2Fq3IEhTPWiDpITDij?=
 =?us-ascii?Q?ycEPyD4eyEUzwSjkzk9KEVJFYzvk+/70Y1PX3LNaQDMcVY7vqHtZYp/eD9D9?=
 =?us-ascii?Q?gEhzFGwcE9lcHJR4vsc/FblClQ8YWqf7hW1fm/Jonk771xkdjQqMOTn/IhpT?=
 =?us-ascii?Q?nJd20ud2MpfSbKLp7mZWwn13Yn0Glk4jUZ2H5/1Tazm5oM9aroVJHE8FK79w?=
 =?us-ascii?Q?4FEbtkyaW+IPl0QPGewQpveVhKqMByQkgmU8L1nrmHCvqanTIU2RZBIOnY5x?=
 =?us-ascii?Q?GLW5HjI8SOv0/f25FPMfUAWUYUxkeR2AACPU8GUSmE28i0Gux7ctoiAP/jcd?=
 =?us-ascii?Q?TYdWzsSUt+YK8gBcxos274CZ2ZhKFi3thPkem9+ktnJUsMCmiGUg4NpR46t4?=
 =?us-ascii?Q?bbBKPNRa+BDSIiw9zCkJo84lCde+D+2zQitJhMvncMXe0mdGpcHMZJaxl+yS?=
 =?us-ascii?Q?3G5sJl4/t5VYWgVf9JfI+eRVCOCdJhcrik8c8QIPjdQrubIC5ePXPLbRHOeC?=
 =?us-ascii?Q?Jnl1E8dLGLe4GdXw87LjCI+FPHDykiv10E1BGyjO8AG2oZ1qMrL2fnssml+t?=
 =?us-ascii?Q?RT77ku1oIOeqS+bi5kFyZlfEuM7CcyYoI6Sy7dxZGFK147aR64qtvjY05qRa?=
 =?us-ascii?Q?//n3td6aNLWW9D2B6aUTXfTqrRh6KSGTFpiKir81Y6tRRyX2nn0xH5z8Ln1a?=
 =?us-ascii?Q?Ylx4AWbkpewCRmeP+tCPGDpJY9e67eC7UYx/fnBVN6E+jM9/EEZmBhG3HKiZ?=
 =?us-ascii?Q?xJ24bynSl7thtFp5pnr8nKcEASIxfZxfJLYgkOPLizY9IyxWnIOdLq7BFSIX?=
 =?us-ascii?Q?Peku+d8CHmVO1NIJHIxnMlPRs8MKEmz4unTay0Ut/MTNWeBGIPE7WBbHxSOx?=
 =?us-ascii?Q?eaxPkNvUGaZSditRkvG6LkHVJ2e66dq28R+Gzg1u3r45huumhgSJUE/P4+lE?=
 =?us-ascii?Q?qp3mB6kNk0plubyfds3mah1TVtuTXB2hF+t62azrtb7w5VPT8EJNn0pG7GiL?=
 =?us-ascii?Q?spiC52a2wiMJKqqgFKgfHynRdT1HP+Qv9phUOWoATt3jbkpH3S/d7Bktp/7H?=
 =?us-ascii?Q?3V0B+Cs7MjV7lCBrKRDAzAtWBPnXaz8Jes4nZGus5pLsvJ8ATU8fM63Jw67l?=
 =?us-ascii?Q?Tv8bzjDKlBLYoMttvnNoBkbtYvY9l5Kn5RS3LA3cqemJlc8Al8W1URX8p8kF?=
 =?us-ascii?Q?bQ4XEuPzboOzbsZDCwEe34nf11DLzAUlC4+eb21Wn/Sj/k2lEpmY0NCcsMKI?=
 =?us-ascii?Q?oCDD8mU3ooJNq25KDzM11Yxpixe9/QrBgoA6Dmw5VpRsNsueAPUs6k77srcw?=
 =?us-ascii?Q?fjemnXJ7+IMhNeubWTgzLuCqhySqbBCejpp1+7jZq1CcGtgxmyi/fNIMwY4c?=
 =?us-ascii?Q?wCwHmQ3UqgoiMchATar0ucIIQn033h+ZG9UsWRWHxtYHw4K3KdDLCepT5GR+?=
 =?us-ascii?Q?uNkqaeofoZXhgxm0PjTPoK8OSEx1AwHPH48Cs3o2w7PX6r2+HJmIuQPXV8qC?=
 =?us-ascii?Q?JIwyE9SPqFGBvzlU/wjcT+N8AhJnDz1QPNlHeFZAcImChJjAkf+Rl13elVUB?=
 =?us-ascii?Q?HLvXY5fHoFIVO6DSa2UEcBor3aK85S0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f46388-51ac-4858-a26c-08dea61200ff
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:08:59.1715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDZvS75XiO0j0JqsNVJ6xgRmMzJoDC2mBP2naU1gbT1gwQR/EdHPUw+rBln7dMDV6JSjDCudm2FhJEmq7VYJia8Tvmaabb/a5fi7MgdDQqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_100906_553987_CE6D8220 
X-CRM114-Status: GOOD (  13.67  )
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

The percpu variables are allocated from vmalloc area by default.  The
architectures which support local percpu map will allocate percpu
variables from dedicated percpu area, for example, ARM64.

Introduce a new kernel config, CONFIG_HAVE_LOCAL_PER_CPU_MAP.  The
architectures which support local percpu map will need to select it.  If
it is enabled, allocate percpu variables from the dedicated percpu area.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 mm/Kconfig   |  3 +++
 mm/percpu.c  |  6 ++++++
 mm/vmalloc.c | 20 +++++++++++++++++---
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index e8bf1e9e6ad9..ccdf58b63fb8 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1022,6 +1022,9 @@ config NEED_PER_CPU_PAGE_FIRST_CHUNK
 config USE_PERCPU_NUMA_NODE_ID
 	bool
 
+config HAVE_LOCAL_PER_CPU_MAP
+	bool
+
 config HAVE_SETUP_PER_CPU_AREA
 	bool
 
diff --git a/mm/percpu.c b/mm/percpu.c
index b0676b8054ed..daa2c88e6971 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3243,9 +3243,15 @@ int __init pcpu_page_first_chunk(size_t reserved_size, pcpu_fc_cpu_to_node_fn_t
 	}
 
 	/* allocate vm area, map the pages and copy static data */
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+	vm.addr = (void *)ALIGN(PERCPU_START, PAGE_SIZE);
+	vm.size = num_possible_cpus() * ai->unit_size;
+	vm_area_add_early(&vm);
+#else
 	vm.flags = VM_ALLOC;
 	vm.size = num_possible_cpus() * ai->unit_size;
 	vm_area_register_early(&vm, PAGE_SIZE);
+#endif
 
 	for (unit = 0; unit < num_possible_cpus(); unit++) {
 		unsigned long unit_addr =
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index aa08651ec0df..068a6709062d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4841,9 +4841,15 @@ pvm_find_va_enclose_addr(unsigned long addr)
 static unsigned long
 pvm_determine_end_from_reverse(struct vmap_area **va, unsigned long align)
 {
-	unsigned long vmalloc_end = VMALLOC_END & ~(align - 1);
+	unsigned long vmalloc_end;
 	unsigned long addr;
 
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+	vmalloc_end = PERCPU_END & ~(align - 1);
+#else
+	vmalloc_end = VMALLOC_END & ~(align - 1);
+#endif
+
 	if (likely(*va)) {
 		list_for_each_entry_from_reverse((*va),
 				&free_vmap_area_list, list) {
@@ -4884,14 +4890,22 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 				     const size_t *sizes, int nr_vms,
 				     size_t align)
 {
-	const unsigned long vmalloc_start = ALIGN(VMALLOC_START, align);
-	const unsigned long vmalloc_end = VMALLOC_END & ~(align - 1);
+	unsigned long vmalloc_start;
+	unsigned long vmalloc_end;
 	struct vmap_area **vas, *va;
 	struct vm_struct **vms;
 	int area, area2, last_area, term_area;
 	unsigned long base, start, size, end, last_end, orig_start, orig_end;
 	bool purged = false;
 
+#ifdef CONFIG_HAVE_LOCAL_PER_CPU_MAP
+	vmalloc_start = ALIGN(PERCPU_START, align);
+	vmalloc_end = PERCPU_END & ~(align - 1);
+#else
+	vmalloc_start = ALIGN(VMALLOC_START, align);
+	vmalloc_end = VMALLOC_END & ~(align - 1);
+#endif
+
 	/* verify parameters and allocate data structures */
 	BUG_ON(offset_in_page(align) || !is_power_of_2(align));
 	for (last_area = 0, area = 0; area < nr_vms; area++) {
-- 
2.47.0


