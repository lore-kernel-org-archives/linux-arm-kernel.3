Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC67CA5FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 23:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjCGNeLQXl2vq8yC8j416JRmHxz/7E3O6J8stFHNdtQ=; b=xVX4mXMT+75QI67QZEkURRsKEO
	oPvx7t4NiJ3mAGYJfOYnAOAMqgaEyC0edKADDyScxl1ARsjweKolzkM1jUuiMjKWIJAVdwAkgiimP
	L9qCZOHh2NnepHWrRW1lou8C5YIp1MKVV3m3UsprzRvCHOEpWhOLONI35miyOfZc/LrdfNTokx3FT
	Wl9suJFqN08wxMGZ/c2TyBkI3BmddR0saC9NF1tPef/c8iCnfMCARAISdog2Fo71uIRFZM2SDNeJV
	JIYutf6O2tqY8XZOHUJkQNeyTG71oXl0Z1Uveaycbv6mte++WOGbWV/aM7CnXLtz/WPZu3RIJ27oB
	HVH9sDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmjo-0000000ChSH-3iSZ;
	Fri, 02 Oct 2026 23:32:24 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmjg-0000000Ch9L-0fib;
	Fri, 02 Oct 2026 23:32:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBH/ljxvrXQ986T3jsXmplEdo+iEY6dkc/zN3GM+y8EwORCX2bKrzQqAMOl2tq7akMF2ctdWgx3+FGnZSNtWTYQXoF7yB/JhUCFtXVPIBxoWMaQdk2zkXIOWeC8gIFXU2scOUfcmUt7dn4sAL4dzzaZpR7RTjh5ATj69D421uTXNs0Ba3WCIvWtFtmI3L8NgL0o5RClldHnGZf+sufhu3Mwa8ZBkmrUL0FYbQxjHdPG2zmsdDTuxOKkSypXk244AZGDkQVhxbaQNjZIDhIhf4dNrraBZvO8aB0neHTcl760N/5S8DAZwOsRIMAUPvFQR66Ni3mwrFOdyFdOwB+21aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjCGNeLQXl2vq8yC8j416JRmHxz/7E3O6J8stFHNdtQ=;
 b=NONanHVQUn6jP9uupztmN1G0d8YT4tbPPZRVqvomY39p35JTyErTCgX3c45xeLnSqkICQrwcT6wt9wEu8GTGaSsjT5i1QgmbVfnZVekUCm7fsSPrlHvoVDWserDnA1QHe746SBEFE6Uwa1SJeXId4aEqEA4VsKKuJyXyk+BK95eCZkNmQvoi1yVuYA09fWakBCkLMQyzjo2592N4Bw/f7itHvbK4eWpxCVP4atGXn8ZCfl8lpWYO0MCrpfZ/uyyuxvJtNYhtORGcBlzvuG7aguqRL/yMBWhTBUtYBxRfCFP+Eew4/7hxI5yIs9EzvAukdUOOIT9l1pU1/Q4AmfIsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjCGNeLQXl2vq8yC8j416JRmHxz/7E3O6J8stFHNdtQ=;
 b=CYg2fSkpf7SAWRHpYFrx+rlb5GwqUOV5DkBiORoARmc68rxCbmoBJoUE4nGL7KuZiiYWQ+k613zwT67G/UK/KhCX+aGo70Ny1CpzxPcxqz2996WesUQp4xg26bd9plYRJB7WsWRkUxKINd4XI86aEWDTs43F80bUkk+kN254pUh2DL3o4sVvuTezayv18goVXPEoUpL7VQ+kTiAzT7hpQlyOJ2fNrS61fES55AaFDb6QWYyNJM/6Hc9UEjcixC7psrXsRAFuynxNAMML8F6S2kNz5YTPoD0dhgJwoqYwglxJq5JpKt30J7+lCk7Hn4XmodK1nomPPjdQ95Ld4ouq5Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14) by PH7PR12MB5830.namprd12.prod.outlook.com
 (2603:10b6:510:1d5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 23:32:04 +0000
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5]) by LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5%5]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 23:32:04 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Sterba <dsterba@suse.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Glass <sjg@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nick Terrell <terrelln@fb.com>,
	Will Deacon <will@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-integrity@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	patches@lists.linux.dev,
	=?utf-8?q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH v2 14/15] arm64: drtm: Call UNPROTECT_MEMORY
Date: Fri,  2 Oct 2026 20:31:51 -0300
Message-ID: <14-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
In-Reply-To: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::12) To LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB325698:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2cf9d2-9d37-42d2-0279-08df20dd5926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|23010399003|376014|10067099003|11063799006|5023799004|6133799003|921020|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AXzd2++MbfxNQoix6p7XuJzMhyaMY6aHOLiqTnUExQcSha3aQu74ljzkzvsLKa19VjURami3fOVfklOK1U3CHkPLW0H/7kW9bQMGLMAJG6rMQuWBX3qnr7dfkS1ktG+/8oubz1l+Oua8vy0ba5ZnJYuREHdoczFTfIYhx2dB5NXGMqztEhnh6A3Za6fSA9LqGhbN0SbkBK9poz60hftQKs7DdfarwL8t1MDgX7mCsa1LrEaoUOagXg9wPfOLIOuClKijBNGAjA9Anj4xThlFbNYL/ALQ+xw3onNHcsv4s6fny5cxPU0lfBw1sc4nHfNG5ekRvwLoFt9tPeWbPsIoOaaeUNaUR7ZSUQ4y/VCYNiov9pkeW8+BPXr3Jr6aWiaCSqUNHdop/tGyVhH7Np7TKk2i6Tbmwa5mmQTJaxw/qt+LZ2bt+XtRwu/Queb788aED7Aaa+WG8qacLe51qyStgDJEI9uTEQ+3E70CzYD9is+YO8iE7quJUa5miKETfLK9TIsuf46NlrTJfWoGVBR2PFfRBD93zKsRFFEgK7ziS8+d8JWfEV2pyJftghVB2vFnxXZYPw6h3PKAkA8EBbJVd9ItesFiePPuD7fS68qVowAbPPtD7VvwAaIFsbcXV+Hvh5U8td2C4rG9aVfpd/U1VjOlrG79noyapVxlhF3POiJIuaHbfEioswcKO+0R6QWGYqyc7Xdn2Qzg67EWIsly6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB325698.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(23010399003)(376014)(10067099003)(11063799006)(5023799004)(6133799003)(921020)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m++nHcCUrw2urlvPOxZsc9KyBqHa5q0kcSUkuh5Q273TopY8XaZgYldgZWhT?=
 =?us-ascii?Q?0LCQXBRdOHyGDHwSTk1SvJz1+46yxyl3+1Hqr3W9UymYHiP0gu+hvoS4INv9?=
 =?us-ascii?Q?pqk3Z9ApDTKBOqD2fAxKTUNwoYfrM7r+iB6sHFkQ+++XscPb+QsD20nQ2eTU?=
 =?us-ascii?Q?BHqhjYyTpzp/LlI9h9uxHK2f0Wvol+yQyvEeR7tEje0VxyhhD/p0Dc+fQI6d?=
 =?us-ascii?Q?ma6UZDbqrav1JoJUEAE5xJkBFt0DKO1VuqXibrze+v2ro1Mw5aEu/KMteg6J?=
 =?us-ascii?Q?5qeySbQ6w83EguvBpNl3MLRsbmioE5NDaeMRTNlMc44i242VOSMrAiy2aLVJ?=
 =?us-ascii?Q?OiuGc9T61yoeMsovzBLyeDtMJ9L1RuEwVk1YE4yYTcmeNXworIadyQ0GKZkw?=
 =?us-ascii?Q?ZKfpvcISfeY+ApmBeO55Fz0SHXzkNw86BD7dPbSI3z2cpedyx0/Xg/My9RfF?=
 =?us-ascii?Q?q5l1T1i7eqdYkSjEDCKUto68HlWnnwtHgITTr7f60vQ903C9iT9CyPnTN4nZ?=
 =?us-ascii?Q?BmX+aKmVQCVzUeWc/m429IuoLBZ9qzb6UNS5xnzIpZ/xjjVaPSN+Irxv3JTo?=
 =?us-ascii?Q?wNMHV9zEggrFgFvAwQMYvImlbeIIHBOEmnIDeKZT4SMCvBFNVkCOtMkS+IzS?=
 =?us-ascii?Q?KELCXqJAvZAZWiYLM7hVsC/CCNRx4qv4FsVeBQAcMTraTCViqDl/0QMbJlOj?=
 =?us-ascii?Q?C6Dby+/FM7t2DclO52KAD7BACS99IX79Hnhwdr/Z8hEAKl4zgynaFtuv/TYD?=
 =?us-ascii?Q?x0pKDYaZWcqa/zROM7jcKJk0SM6SItFZwgWzV3TaB8EtyJBUurMNDGnLVSMP?=
 =?us-ascii?Q?i1KLJJYh1rrmbVJ+8y86Qfmx+WNCPX6P+9ZKGSAPMpAfOnLGvyrAsYfk3Jqo?=
 =?us-ascii?Q?dCreJuB0ilsCnoGdoyOvZ8vDosb9KARHONojleGB0nkMhp7p1L14V7l2zG+v?=
 =?us-ascii?Q?ENZjpyAAamiiUw6LiKqU51UWGTED66ttvG5hPhAQdknOWkaC3ZyKrCBlX/sn?=
 =?us-ascii?Q?zQZ9yXCU8MA4ohc7MhBcAxNj7P1NAMFjpM3bEcasZOPjSxVqxEXR0Yet2IUB?=
 =?us-ascii?Q?xD8DG6iSkV8LD5dYXbGUIqcdQy483Hujzr05/pUNnzHkFxglJHT48WnbBkOo?=
 =?us-ascii?Q?Lu76m84Vo/duOe6YAcjKT2eZZmkxN+LKifvRSTiDJElzt72c0g96VolGJaPG?=
 =?us-ascii?Q?vmLy37qJ6WUddad/2W0PjWhc/OGd+kE5ClVA2t9W3P0Prn8q9E1Ih73fc/fT?=
 =?us-ascii?Q?Lfz7lp0bGKaeuodimzT18LyNe58f/TDv8ikJVTag3r4RA85vbplpJnyl3w/g?=
 =?us-ascii?Q?BTaTTO97IOfjuLCF0Uh7ZuRHFqICNe1Urud5itNnZugqkYBgasrix1lcfvSD?=
 =?us-ascii?Q?6/6Ju0wRvWWegxk1J9YozIkZkXPKzjcRNaAVbptvmJHU4Hlx61/dxM/OfTG3?=
 =?us-ascii?Q?KiWgbJlGxdwPgRBQfUuK8W/EXoQF23exNb0S+Jt0qrXKzlK+SKiYJ33Q2/yo?=
 =?us-ascii?Q?aonjZ386UQc88mBMe+Ufigm3XPZSEJVe3dw0jc+vcWKVdWQaGeT60tdPdoZ4?=
 =?us-ascii?Q?yKJ+M0DK/2jY53FvuVBu+NRlmrKlxyRNoe4eqGEP4SMiSIDOn2md1Gu5FCsX?=
 =?us-ascii?Q?2rTQ0YR3G9wKzNMI+gDiATF+9kZVZOiyfiWMqIgyxx3LwOVOF+IxO1zz2aPM?=
 =?us-ascii?Q?cxSj6MEYiYH048yRBKBnhdduxh/vQXxLc3qLJ5ZXKwik6+Sw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2cf9d2-9d37-42d2-0279-08df20dd5926
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB325698.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 23:31:56.6163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wCnZ6zwewMg7ECUBlgUEV9i3TEFw7Y34hW5dFGECmU20LP6PeMTscxD6QLpUVBn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_163216_494320_80894558 
X-CRM114-Status: GOOD (  18.62  )
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

The stub always requests ARM_DRTM_LAUNCH_DMA_COMPLETE. On a system
with an SMMU the COMPLETE option is sanely implemented using the SMMU
global abort register. DMA_COMPLETE should be mostly a no-op. It
seems to be designed for the region protection mode that Linux does
not use.

However, the FW can still do something interesting under it and we
should call it. Choose late_initcall as we know the SMMU drivers are
loaded by then. If some platform does actually block DMA beyond the
SMMU, then this would result in a noisy failure of built-in driver
DMA, not a silent security gap.

The platforms I'm aware of are OK with this placement, and it is a
reasonable place to start.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/arm64/kernel/drtm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/kernel/drtm.c b/arch/arm64/kernel/drtm.c
index 14493948a27f0d..6062980a5d9e53 100644
--- a/arch/arm64/kernel/drtm.c
+++ b/arch/arm64/kernel/drtm.c
@@ -3,8 +3,47 @@
  *
  * Support functions for ARM DEN 0113 "DRTM Architecture for Arm"
  */
+#include <linux/bug.h>
 #include <linux/efi.h>
+#include <linux/init.h>
+#include <linux/printk.h>
 
 #include <asm/drtm.h>
 
 struct arm64_drtm_handoff arm64_drtm_handoff __efi_data_handoff;
+
+static int __init arm64_drtm_unprotect_memory(void)
+{
+	s64 status;
+
+	if (!arm64_drtm_handoff.drtm_enabled)
+		return 0;
+
+	/*
+	 * Currently Linux can only fully support a DRTM implementation that
+	 * relies only the SMMU. This should be called directly after attaching
+	 * a driver to every SMMU but before binding any drivers that want to
+	 * use devices attached to the SMMU. Our boot flow does not have a way
+	 * to do that, so for now call it here.
+	 *
+	 * For SMMU based implementations their UNPROTECT_MEMORY is probably a
+	 * NOP since touching the SMMU here is forbidden, but they may still do
+	 * something interesting so be sure to call it at least.
+	 *
+	 * The stub excludes the most likely case of non-SMMU by only using
+	 * ARM_DRTM_DMA_PROTECTION_COMPLETE, which is defined as:
+	 *    Complete DMA protection is hardware-based enforcement at the SMMU
+	 *    that blocks all DMA from Non- secure devices."
+	 *
+	 * For now if people have such systems they cannot include built-in
+	 * drivers for any DMA devices, those have to be modules to be ordered
+	 * after this.
+	 */
+	status = arm_drtm_unprotect_memory();
+	WARN(status != ARM_DRTM_SUCCESS,
+	     "DRTM: failed to unprotect memory (x0=%lld)", status);
+	if (status == ARM_DRTM_SUCCESS)
+		pr_info("DRTM: launch completed\n");
+	return 0;
+}
+late_initcall_sync(arm64_drtm_unprotect_memory);
-- 
2.43.0


