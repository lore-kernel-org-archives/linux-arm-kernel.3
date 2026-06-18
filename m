Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8450CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HPT/qvsIlzbU0wG9iW7WVZY5cZKw1RR5KoJ88EMr3FM=; b=WKWkmNpx0xYmnODRE5/26n3g1G
	J8MuMepXrAHPfI2cvfd1PwA/Q1V7o+u7av0HAHlQw8vADjZM0vXJ/XEhckyj3kP+IGN9ZR9fDiJ85
	Q6S4xfXM/HW+poBCGJyAFadqZML4sBGoeiDziHlm87y9uIBe4vuQ752Vv1F8al/M0KNPrE93e49fU
	epk7fGz2Me31nmlCYOeuWhk9PWsR8SJp2fS/scLjWuyG1PiQDyqQRHFQuxXEiCl9BLocE9Mj4QVsa
	mPOxdAoa8MMTmEz0BPcfH2Oa/ePdxyqCnsFsD/Rci552NZDTVpHbknVUtXmkOWHNJMrHEvHp2rmtG
	a23aXMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8dr-00000000tSz-22m0;
	Thu, 18 Jun 2026 09:02:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8dp-00000000tS7-2REf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:02:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G1vA1157416
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HPT/qvsIlzbU0wG9iW7WVZ
	Y5cZKw1RR5KoJ88EMr3FM=; b=T6ACa/PNPg7RnPIfRkcN2JqoJyC824mvzD2p0E
	O2GMmqRILqZ9TvqrHCDDlluXal88jrHbcoBmAI61yJMOxq6ZkCV/7qPiOR2cFgmJ
	7j9ygM+CBGFzNxd6M7UrNu+lWo8OMokiWKYHk/AQ4XUsaC3xRwujW4DLo6oSdPG7
	Ubdfq1+dAkEgX1vdlyaN+bkp+kOzxdiMEqb9ngAs9idk9zxl2nYnuzA9lKKC3dyC
	G+QcIhOT5R/7GAxrSHkHBOKGLEMpRRnqlEJXEJ8CQmWAa2Nm8lNUgXkaodBg+4N1
	+RZe8O+JICckvmzfdmVV967sRbS6pK3Pb1FLBlShMORDEJHQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a2n7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:02:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845438fbd9cso284143b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773347; x=1782378147; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HPT/qvsIlzbU0wG9iW7WVZY5cZKw1RR5KoJ88EMr3FM=;
        b=B2iqR4NptC8EAKKhe5NBRkvobf641B5MyXihfloBztDx+46QunWh44b+tCPDY+6zQi
         DMBi+LB3HmODSsssqaN9kqac6VPGk/Rl3ho5sgjJDt/E1aTdCYtpP/QBDfdh78+d9eVm
         sIfn0iOwykdAtE5uaeR3eb/aRArKxqHMZb7dy2bYsXiSVWq+F5KII8Mu3Ue+jW7/Xoq3
         5w40Jzw/WX3/KYS2EiWiLvbu/BNcfKKi75rSN1lokQw1EMhYg7ucRhmCYQqFZB/HljqU
         IMiLGmFXSJClWM/Mv0oZ45PCGDWFnQgqrU5wAvL6ann+tnKTNtV1RAntWoCgEj1WxSTu
         Dvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773347; x=1782378147;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPT/qvsIlzbU0wG9iW7WVZY5cZKw1RR5KoJ88EMr3FM=;
        b=IwSfnVRdurkXnGngN8UjAefvSKsnf7qTyyk7su2dABpCEqQlxW9fukxkUBAyUNEYOA
         aTnGE+TCLypyG1v70rzLVpUq7zkJBFIO5JwO06L735ulKvr6APg2C2cxKzSsgN2a+shr
         pKlJxqSCFFmCg2wp6uI2X8VGV8pJQ/vJOc7J2OaPB0BDERDvAcy/6YeYvrOp4/DnqQi4
         07LghF5sxYUH+tZBxkgIVCwJX5wNb/3Lg6VBg/LmkAizEg1ZHi5n6tBj9qYTk1yXi0Xh
         AEOae6rYzj/Gp107P1xrCjVdp1y8XChnuyk46Adi8T7lxigZ5vpFGri3wJpjWW1hd0A+
         QYRg==
X-Forwarded-Encrypted: i=1; AFNElJ9NqjhwOIqIHyzChLwknU7mnlYZSS2cbMUg1ONrOztNnC6p9KPBcGzFU+Y44bqcdFsE5Sbl/1fQ10iaH/ie7cMR@lists.infradead.org
X-Gm-Message-State: AOJu0YwPZL8v2OctxCNGrOSTFAYyv8ojIQ3KhQkxq8veQUQByaGlkaBm
	RYaB9mK5LIt5uRYeu8LRx8g3usHE3Fstlty4iKk4trVp6sB0pefcZcib5e++bSOuMuGW29X25Wo
	rcFmqzNccWkYwIA8BQH8sBcVPhYIZzQlaqnTVI4bNJaJyfyRTxsmaQ8gT06Y16b8fpItDMEejxK
	sa/A==
X-Gm-Gg: Acq92OGh3+PKKE2r/Uq9KVsXsxSjV6R9XC/eQWfqfZMpyo07okl47mlFtF7zW7ezx6Z
	dmRa/as8K6DFNfOrnf3PXVWSjchPhUC9noz+Ey/hC7Od/zzz4ZKDi5NujpMJHdOO3AuPSfIEbWK
	Vn8lKluop6Z9fEFyuSyUHsNFTJSzdKnoOFYG9X/7hZthBkUyCAc3ocljAWtfQ6MFGAlBIkdB9zD
	z4sEI85v+YaOmF/guWrSCGGvc5nBn9HP/Pehc39CLa9+l4HZKAHR3w4iiDsRCFURsjGfBrNkLjx
	ZMcRfSfl649Awlhu4YyGdfSPpm2BFFamAhBGmIDQsKAHUTiEh/TaFf26+kWvIAd00Pi5VXgYdQ5
	brZ4HN2OqpBkAHJSgQ4Nyiw8vXYdhVoF4W7sG1rklv26Z1g==
X-Received: by 2002:a05:6a00:760a:b0:845:286d:4675 with SMTP id d2e1a72fcca58-845286d4993mr5891045b3a.10.1781773346590;
        Thu, 18 Jun 2026 02:02:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:760a:b0:845:286d:4675 with SMTP id d2e1a72fcca58-845286d4993mr5890993b3a.10.1781773345898;
        Thu, 18 Jun 2026 02:02:25 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8453a8c9770sm2012769b3a.40.2026.06.18.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:02:25 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:32:09 +0530
Subject: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABC0M2oC/yXMTQqAIBBA4avErBNS+r9KRKRNNUEaahFEd89q+
 S3eu8ChJXRQRxdYPMiR0QE8jkDNvZ6Q0RAMIhF5kvOSkVnXvVNGe5q6mbRnBe8xrfgoZSYgdJv
 Fkc7v2bS/3S4XVP4dwX0/TJZ6HnUAAAA=
X-Change-ID: 20260618-iommu_contig_hint-71ae491fbb52
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781773342; l=13018;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=KqqlwykCZOolpKs5ikihTyrCjA8PeTCq94/xbXaFyZU=;
 b=KbyZoxjGDXs5AUE5GEivZvb5w5JJwxA9MviXPcwtkZdZFZBtO5oeJH53M2sceO48NHznVYCzy
 qfXRYJh3NbRA/prljT9BiArQ6eSf3DAAZWhigTlmcU2ola5YdvQW6ZW
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33b423 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ood6XOM2BuclmvQ8xa4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX5Rn9SkXHGDKS
 oS71TuToCbV97AyqdydiWwa5ZNvVBiydxXeTe0QU0Q1pqXNHraUU+cHPUHagTPH6Ls6wrfFWolK
 HlWUHwuMdjck4/WuGneKtqsqMJHD1qc=
X-Proofpoint-GUID: tR_lHV_QQksugFFa9SvTybVnNM079JJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX/tp5cpDlwFXM
 LBq5xpopIOkGSWCoOMDebRVi1r10ueMBOaM3+35vZWSMB7wmfyYIZ7teDf5aVDK5Ly+XWk7yvzp
 +nrjvJdIvVD91//KTbIwgZ7FA7XwSTG2sqAxijt5vUWodtALHDklWTyn1Ef3zqUyfD44pxD6TvT
 31ib0XALFp7kOCYbLm2NkrLpAU7dogjJpMwEUi9KCUWVKXb01INSH1YrFslHdM3xwC0qJcR7kfc
 10T/rJ376CuOhf9Elzv9X+4LnShb5ApHQDWiDrqbX+yK+HMbtFuMZATNUnHqgoR7RqN7yOfwhEE
 VsUBoV4qs+Sv/TJHXI36Yl98UpLk2BIKU9swiSpBBEdzBq8ym33UW3L7kk1g+N1q+OMxLmVR7jw
 Yc7Ffrdq+MeNF/yIXhDKFgJ0XW9CVpjMCUkIRvdk8lmVfYNlVjCDT/u8NSie/O1gbnA/Sr6nPiL
 9gpOTse5MKz/8Nh/N2w==
X-Proofpoint-ORIG-GUID: tR_lHV_QQksugFFa9SvTybVnNM079JJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_020229_748731_966BF466 
X-CRM114-Status: GOOD (  24.94  )
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

From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>

Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
When a set of consecutive PTEs map a naturally-aligned contiguous block
of memory, the CONT bit can be set on all entries in the group to allow
the hardware to combine them into a single TLB entry, improving TLB
utilization.

The contiguous hint sizes per granule are:

  Page Size | CONT PTE |  PMD  | CONT PMD
  ----------+----------+-------+---------
      4K    |   64K    |   2M  |   32M
     16K    |    2M    |  32M  |    1G
     64K    |    2M    | 512M  |   16G

Contiguous hint sizes are advertised in pgsize_bitmap, analogous to
how the CPU MMU advertises them via hugetlb hstates, so that IOMMU API
users (e.g. __iommu_dma_alloc_pages()) can align allocations to these
sizes and benefit from the TLB optimization automatically.

Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
provides a compile-time opt-out for hardware affected by SMMU errata
related to the contiguous bit.

On the mapping side, __arm_lpae_map() detects when the requested size
matches a contiguous range at the next level, sets the CONT bit on all
PTEs in the group, then recurses with the base block size and an
adjusted pgcount.

On the unmapping side, the CONT bit is cleared from all PTEs in the
affected contiguous group before any individual entry is invalidated,
following the Break-Before-Make requirement of the architecture.

Tested on QEMU (arm64/SMMUv3) with iommu_map()/iommu_unmap() of
contiguous hint sizes; verified the CONT bit is correctly set on map
and cleared on unmap via page table walk.

Co-developed-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
---
 drivers/iommu/Kconfig          |  16 +++
 drivers/iommu/io-pgtable-arm.c | 216 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 226 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 6e07bd69467a3..1c514361c5c9e 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -50,6 +50,22 @@ config IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST
 
 	  If unsure, say N here.
 
+config IOMMU_IO_PGTABLE_CONTIG_HINT
+	bool "Enable contiguous hint"
+	depends on IOMMU_IO_PGTABLE_LPAE
+	default y
+	help
+	  Enable contiguous hint (CONT bit) support for the ARM LPAE page
+	  table allocator. Contiguous hint sizes are advertised in the
+	  pgsize_bitmap so that IOMMU API users can align allocations to
+	  these sizes and benefit from improved TLB utilization, analogous
+	  to how the CPU MMU advertises contiguous sizes via hugetlb.
+
+	  Disabling this option provides a compile-time opt-out for
+	  hardware affected by SMMU errata related to the contiguous bit.
+
+	  If unsure, say Y here.
+
 config IOMMU_IO_PGTABLE_ARMV7S
 	bool "ARMv7/v8 Short Descriptor Format"
 	select IOMMU_IO_PGTABLE
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 476c0e25631af..9fc60520177f1 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -86,6 +86,21 @@
 /* Software bit for solving coherency races */
 #define ARM_LPAE_PTE_SW_SYNC		(((arm_lpae_iopte)1) << 55)
 
+/* PTE Contiguous Bit */
+#define ARM_LPAE_PTE_CONT		(((arm_lpae_iopte)1) << 52)
+
+/*
+ * CONTIG HINT SUPPORT TABLE
+ *
+ *---------------------------------------------------
+ *| Page Size | CONT PTE |  PMD  | CONT PMD |  PUD  |
+ *---------------------------------------------------
+ *|     4K    |   64K    |   2M  |    32M   |   1G  |
+ *|    16K    |    2M    |  32M  |     1G   |       |
+ *|    64K    |    2M    | 512M  |    16G   |       |
+ *---------------------------------------------------
+ */
+
 /* Stage-1 PTE */
 #define ARM_LPAE_PTE_AP_UNPRIV		(((arm_lpae_iopte)1) << 6)
 #define ARM_LPAE_PTE_AP_RDONLY_BIT	7
@@ -453,6 +468,111 @@ static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
 	return old;
 }
 
+#ifdef CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT
+static inline int arm_lpae_cont_ptes(unsigned long size)
+{
+	if (size == SZ_4K)
+		return 16;
+	if (size == SZ_16K)
+		return 128;
+	if (size == SZ_64K)
+		return 32;
+	return 1;
+}
+
+static inline unsigned long arm_lpae_cont_pte_size(unsigned long size)
+{
+	return arm_lpae_cont_ptes(size) * size;
+}
+
+static inline int arm_lpae_cont_pmds(unsigned long size)
+{
+	if (size == SZ_2M)
+		return 16;
+	if (size == SZ_32M)
+		return 32;
+	if (size == SZ_512M)
+		return 32;
+	return 1;
+}
+
+static inline unsigned long arm_lpae_cont_pmd_size(unsigned long size)
+{
+	return arm_lpae_cont_pmds(size) * size;
+}
+
+static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
+{
+	unsigned long pg_size, pmd_size;
+	int pg_shift, bits_per_level;
+
+	if (!cfg->pgsize_bitmap)
+		return 0;
+
+	pg_shift = __ffs(cfg->pgsize_bitmap);
+	bits_per_level = pg_shift - ilog2(sizeof(arm_lpae_iopte));
+	pg_size = (1UL << pg_shift);
+	pmd_size = (pg_size << bits_per_level);
+
+	return (arm_lpae_cont_pte_size(pg_size) | arm_lpae_cont_pmd_size(pmd_size));
+}
+
+static u32 arm_lpae_find_num_cont(struct arm_lpae_io_pgtable *data, int lvl)
+{
+	if (lvl == ARM_LPAE_MAX_LEVELS - 2)
+		return arm_lpae_cont_pmds(ARM_LPAE_BLOCK_SIZE(lvl, data));
+	else if (lvl == ARM_LPAE_MAX_LEVELS - 1)
+		return arm_lpae_cont_ptes(ARM_LPAE_BLOCK_SIZE(lvl, data));
+	else
+		return 1;
+}
+
+static u32 arm_lpae_check_num_cont(struct arm_lpae_io_pgtable *data, size_t size, int lvl)
+{
+	int num_cont;
+
+	num_cont = arm_lpae_find_num_cont(data, lvl);
+	if (size == num_cont * ARM_LPAE_BLOCK_SIZE(lvl, data))
+		return num_cont;
+	else
+		return 1;
+}
+
+static bool arm_lpae_pte_is_contiguous_range(struct arm_lpae_io_pgtable *data,
+					     unsigned long size,
+					     int lvl, u32 *num_cont)
+{
+	unsigned long block_size;
+
+	*num_cont = arm_lpae_find_num_cont(data, lvl);
+	block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+
+	return (size == ((*num_cont) * block_size));
+}
+#else
+static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
+{
+	return 0;
+}
+
+static u32 arm_lpae_find_num_cont(struct arm_lpae_io_pgtable *data, int lvl)
+{
+	return 1;
+}
+
+static u32 arm_lpae_check_num_cont(struct arm_lpae_io_pgtable *data, size_t size, int lvl)
+{
+	return 1;
+}
+
+static bool arm_lpae_pte_is_contiguous_range(struct arm_lpae_io_pgtable *data,
+					     unsigned long size,
+					     int lvl, u32 *num_cont)
+{
+	return false;
+}
+#endif
+
 static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 			  phys_addr_t paddr, size_t size, size_t pgcount,
 			  arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
@@ -463,6 +583,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 	size_t tblsz = ARM_LPAE_GRANULE(data);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	int ret = 0, num_entries, max_entries, map_idx_start;
+	u32 num_cont = 1;
 
 	/* Find our entry at the current level */
 	map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
@@ -505,6 +626,24 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		return -EEXIST;
 	}
 
+	if (arm_lpae_pte_is_contiguous_range(data, size, lvl + 1, &num_cont)) {
+		size_t ct_size = ARM_LPAE_BLOCK_SIZE(lvl + 1, data);
+
+		/* Set cont bit */
+		prot |= ARM_LPAE_PTE_CONT;
+
+		/*
+		 * Since size here would be of CONT_PTE or CONT_PMD (e.g. SZ_64K/SZ_32M
+		 * in case of 4K PAGE_SIZE), but actual mappings are in multiples of
+		 * SZ_4K/SZ_2M, call __arm_lpae_map with ct_size and update pgcount
+		 * accordingly by num_cont * pgcount.
+		 */
+		ret = __arm_lpae_map(data, iova, paddr, ct_size,
+				     num_cont * pgcount,
+				     prot, lvl + 1, cptep, gfp, mapped);
+		return ret;
+	}
+
 	/* Rinse, repeat */
 	return __arm_lpae_map(data, iova, paddr, size, pgcount, prot, lvl + 1,
 			      cptep, gfp, mapped);
@@ -653,6 +792,48 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
 	kfree(data);
 }
 
+#ifdef CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT
+static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
+				unsigned long iova, int lvl,
+				arm_lpae_iopte *ptep, size_t num_entries)
+{
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+	u32 num_cont = arm_lpae_find_num_cont(data, lvl);
+	arm_lpae_iopte *cont_ptep;
+	arm_lpae_iopte *cont_ptep_start;
+	unsigned long cont_iova;
+	int offset, itr;
+
+	cont_ptep = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
+	cont_iova = round_down(iova,
+			       ARM_LPAE_BLOCK_SIZE(lvl, data) * num_cont);
+	cont_ptep += ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
+	cont_ptep_start = cont_ptep;
+
+	/*
+	 * iova may not be aligned to the contiguous group boundary; include
+	 * any leading entries so round_up() covers all overlapping groups.
+	 */
+	offset = ARM_LPAE_LVL_IDX(iova, lvl, data) -
+		 ARM_LPAE_LVL_IDX(cont_iova, lvl, data);
+	num_entries = round_up(offset + num_entries, num_cont);
+
+	for (itr = 0; itr < num_entries; itr++) {
+		WRITE_ONCE(*cont_ptep, READ_ONCE(*cont_ptep) & ~ARM_LPAE_PTE_CONT);
+		cont_ptep++;
+	}
+
+	if (!cfg->coherent_walk)
+		__arm_lpae_sync_pte(cont_ptep_start, num_entries, cfg);
+}
+#else
+static void arm_lpae_cont_clear(struct arm_lpae_io_pgtable *data,
+				unsigned long iova, int lvl,
+				arm_lpae_iopte *ptep, size_t num_entries)
+{
+}
+#endif
+
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 			       struct iommu_iotlb_gather *gather,
 			       unsigned long iova, size_t size, size_t pgcount,
@@ -660,7 +841,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 {
 	arm_lpae_iopte pte;
 	struct io_pgtable *iop = &data->iop;
-	int i = 0, num_entries, max_entries, unmap_idx_start;
+	int i = 0, num_cont = 1, num_entries, max_entries, unmap_idx_start;
 
 	/* Something went horribly wrong and we ran out of page table */
 	if (WARN_ON(lvl == ARM_LPAE_MAX_LEVELS))
@@ -675,9 +856,15 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 	}
 
 	/* If the size matches this level, we're in the right place */
-	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
+	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data) ||
+	    (size == arm_lpae_find_num_cont(data, lvl) *
+		     ARM_LPAE_BLOCK_SIZE(lvl, data))) {
+		size_t pte_size;
+
 		max_entries = arm_lpae_max_entries(unmap_idx_start, data);
-		num_entries = min_t(int, pgcount, max_entries);
+		num_cont = arm_lpae_check_num_cont(data, size, lvl);
+		num_entries = min_t(int, num_cont * pgcount, max_entries);
+		pte_size = size / num_cont;
 
 		/* Find and handle non-leaf entries */
 		for (i = 0; i < num_entries; i++) {
@@ -687,11 +874,27 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 				break;
 			}
 
+			/*
+			 * Break-Before-Make: before invalidating any leaf
+			 * entry, clear the CONT bit from every entry in the
+			 * contiguous group(s) and flush the TLB, as required
+			 * by the architecture.  arm_lpae_cont_clear() covers
+			 * the full [iova, iova + num_entries * pte_size) range
+			 * via round_up(), so subsequent entries read back
+			 * CONT=0 and skip this block.
+			 */
+			if (pte & ARM_LPAE_PTE_CONT) {
+				arm_lpae_cont_clear(data, iova, lvl, ptep, num_entries);
+				io_pgtable_tlb_flush_walk(iop, iova,
+							  num_entries * pte_size,
+							  ARM_LPAE_GRANULE(data));
+			}
+
 			if (!iopte_leaf(pte, lvl, iop->fmt)) {
 				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
 
 				/* Also flush any partial walks */
-				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
+				io_pgtable_tlb_flush_walk(iop, iova + i * pte_size, pte_size,
 							  ARM_LPAE_GRANULE(data));
 				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
 			}
@@ -702,9 +905,9 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 
 		if (gather && !iommu_iotlb_gather_queued(gather))
 			for (int j = 0; j < i; j++)
-				io_pgtable_tlb_add_page(iop, gather, iova + j * size, size);
+				io_pgtable_tlb_add_page(iop, gather, iova + j * pte_size, pte_size);
 
-		return i * size;
+		return i * pte_size;
 	} else if (iopte_leaf(pte, lvl, iop->fmt)) {
 		WARN_ONCE(true, "Unmap of a partial large IOPTE is not allowed");
 		return 0;
@@ -943,6 +1146,7 @@ static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
 	}
 
 	cfg->pgsize_bitmap &= page_sizes;
+	cfg->pgsize_bitmap |= arm_lpae_get_cont_sizes(cfg);
 	cfg->ias = min(cfg->ias, max_addr_bits);
 	cfg->oas = min(cfg->oas, max_addr_bits);
 }

---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260618-iommu_contig_hint-71ae491fbb52

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


