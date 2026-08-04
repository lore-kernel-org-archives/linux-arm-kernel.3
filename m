Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0453AC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uSC1wKGbVZn8YTr06Z8RDTjg+gBDQVPkzTkEPyXg1+c=; b=ZYCkEpdr7Q7dnMplbJkbmYzLT8
	tKn6XohZaw42Piz2jzoL+1PCa2mM9wEi4wRVFLBghC5mowWzsZgFSCy7xh6ZFQxXF4c/eADY4hRed
	39r+Dl/xLAuLVHR4ZTIVQw0vRr272hBP2ZunKOiGjyihRD8RA7wKeCQo4oh85o68BPLcsNrL3qp3T
	AzRVLfWHW9LUYxunBQuqS0MpDLWM01vLCGvsdeNSYvwi/1oM0yeRaCiHjZi2E4PL3qKfX8aSpCq3w
	zizgi9tx1CEFbWsryoVsBZR0KYJ3uA+tSm4ioODXtRWD6l0I8DRaR95Cgxbdnv1v6wp8J9YEykaw0
	DmhIeAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8Qd-000000016MP-092X;
	Tue, 04 Aug 2026 06:15:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8QW-000000016Lb-3gaj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:15:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67418NjF2284993
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 06:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uSC1wKGbVZn8YTr06Z8RDT
	jg+gBDQVPkzTkEPyXg1+c=; b=WsPJFnO+byYWaRypuivTiJcUqyDU26Ziw8YrAl
	+HHeh0ILMikyZLPOwfduAcXNHYDyc7oDoBFxpmZ+KrSeGDlIvCrvYHo9HccUPCqP
	wrtYfmWC6VlJGxHHXUpE7dVY6IzDpou1flcIq5nkxkcxhKP/oeWD0OO14BM/wMPu
	UtpUNHG80Kl212DQVpGloC/p9jLUjWmwNY9c7Hc8Igu+QYXQirHZRE3mSCUhoFEn
	j/nWKwOcMUVBEjPFLyucBkR3OK91tIFR9h1URQr9dkiCrq45wAtP79oQyo2v+/rW
	ABgZECLIEQCU45dWHA1DF7t+GMzl+feavpGu05W5b9qq+rEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hqs4p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 06:14:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso75843505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 23:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785824097; x=1786428897; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uSC1wKGbVZn8YTr06Z8RDTjg+gBDQVPkzTkEPyXg1+c=;
        b=RfWTDqy5j5Q0lTtCNTV6S/cZiKS1B+zNBVdUEoeAQMIkiM+2ljpjW8B5Sbko5qqVRn
         n2bCDVqoJzzTgWbg1fsSr3zpphmSplzhZUDd7sHi3xGCklRAqzN5z6FEohcuiJ1vsSdl
         uuFjoTEWipvnOM20Q0ZVyZiinwWxaejqVUOA9+6f9Y/Tr98bNRsnBRB67zuWdCphmBvT
         cbFAjuafkg6oasD8AVY9+hicDFctC3WCdxqTLmj+t7eyqCvPezWZos+bYhRkBZG6YGqm
         2Y/8jzuTOKf9XHdUOwGTIFZtOcIb0Sa5gKln4zgnw39x4ongWJmiUVn8g5Hc/1cQ37Jr
         ze/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785824097; x=1786428897;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uSC1wKGbVZn8YTr06Z8RDTjg+gBDQVPkzTkEPyXg1+c=;
        b=X3ldnnaSgWBjFV+7spd+fmXs1VlfIPA0RLMz3VIGuB701nNOQaPSRHGVMyL3mDzYh3
         h2S2Iogpi5OJ+s7u8bqBE5Z7IQX66v2uM8qeypPfWVYOAzq8N+k4Ydh3zpuhzRPBbjm/
         1i/eDw6sB6bb9dtm2NkYGGST58UzLKiy2ZGy7AXPyfVigpKrSsFWDC009vredOii7SBd
         cKHfmeE4Id0N7LD2IaPAd8Qojs7FcftD6RjlAVQWqp1O+68tkFGO0PE7AyWM3BSyIbPv
         uUVPyMYb0c7pl1XtXIHf5amZUd5Eu6DAKPA1nY5ihDjfUNQHWhjwM9b/WIx0FQClovc8
         6yNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rot5oM/XdTkjJUyRGysVPTokbWj3VEWYPNg0rBrGJWmtLjVwHppAr/RAxGsbd/FjDuG+ETJvijISEd9L9dXFg11@lists.infradead.org
X-Gm-Message-State: AOJu0YxESHLLwnxLSp058FsCXtfIfG6G+QnCsaTUtEr6C8wxyMSBk8Jr
	+rR+Z7mf0hNmOJnoIEyr87B+Aov64YoYq50yFINPgUfuCYw1bWzh02w8MRxR3/iDBWMBgK/v8Yw
	5LR5svQJGmMS2FSfUZvOxGoJWpPCzap+uFz5sBIwH53uKGHfYXu+yTe4kGy6ssAMJLts5wmmEZC
	8K5w==
X-Gm-Gg: AR+sD10jfNXXp+zcqX09ENjWJv6u6PZ/haN+UC16WtDG8RTJNuplSJ2vuv6vx06C7mz
	YkubHi8FRIX/BU99kAKtyqTObycOVd0hnVpi/2BKlR4pOr4zQu5D7mRQAG2ZoT55ziXFBU0EMG1
	iDRnbUGbRv5mhbe+c8c6GEWcjV8trMr393AblYwDI+f9AX9K8BPv10NYIS3usxD5pq60alg5ZmF
	MVlWdiDjBLg1FdAdei0faINSBs3/8qxKMZyoCot4E0LW7xgx1fkp8g2OG7c7I5ZkPSxs513uoFq
	a7gHY3GW/NUEsFfZZGAIS6Om3MycxrxeUVRdhzi1yy1LtpqznuelhdC1JWbA9ViDBN0ImvRxFA1
	PwysgKpuM1nHFZlXPuWDZIPAh7vF2Ztjh15M=
X-Received: by 2002:a17:902:da81:b0:2c9:de53:f84f with SMTP id d9443c01a7336-2d0522517e6mr134439755ad.19.1785824097038;
        Mon, 03 Aug 2026 23:14:57 -0700 (PDT)
X-Received: by 2002:a17:902:da81:b0:2c9:de53:f84f with SMTP id d9443c01a7336-2d0522517e6mr134439455ad.19.1785824096506;
        Mon, 03 Aug 2026 23:14:56 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9fdd250sm536995ad.21.2026.08.03.23.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 23:14:56 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 11:44:25 +0530
Subject: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAECDcWoC/33NQQ6CMBAF0KuYri3pTEsBV97DGFNqlTFKlQLRE
 O5u0YUu0M0kP/nz/sCCa8gFtloMrHE9BfJ1DGq5YLYy9dFx2sfMUKAWGnJO/nLpdtbXLR13FdU
 tz8A4VcChLFNk8e/auAPdX+Zm+86hK0/OthM0NSoKrW8er9Eept4/vwcOXKUCTVo4LfN87UNIb
 p0529hN4mHTTI8fKEOYgzBChbCZBKMAtPwByW8I5yAZIRAFSqNzqRTMQOM4PgGIOCVUXQEAAA=
 =
X-Change-ID: 20260618-iommu_contig_hint-71ae491fbb52
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785824092; l=19649;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=FoenlU1frgTC4DS1yx6Fuj1EAmsl/3Bqt3G8pQfo4dI=;
 b=nPAbGzK2CxjPP9iBCwx5vQ/kXTdjJdvwRv02Qwm9uITaHCgveK36IbgMke8YopGSbFcefUSme
 ywKXEWkvHE2DBMqeAyUdrye96sjbz1c1sQ+Z7WofGjcQMHgeFWX81s7
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA0NyBTYWx0ZWRfX1bitmPj9fGhs
 EymbgCIwAsnO4RX7pR8Qsr64lb6AfQpAiaW1bjbZJAlrhzZFPz+5qCE1iFd9LKGmf6slsBtv51Q
 ZlkQDjgotIx52U6HZo0U2j+Eq8KwvXw=
X-Proofpoint-GUID: aSHsacXWT9HfqWVHBinRGNpQ5HICVzaZ
X-Proofpoint-ORIG-GUID: aSHsacXWT9HfqWVHBinRGNpQ5HICVzaZ
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a718362 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8
 a=tA7aZXjiAAAA:8 a=JfrnYn6hAAAA:8 a=SEDbOn90BvG1UtWm3oIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=kIIFJ0VLUOy1gFZzwZHL:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA0NyBTYWx0ZWRfX2SQzxmM+Cm2R
 Ri7p7Ejw7m9dMx2ra8CHiNwJVWO7q1daEXYMSW2wyY4TFzl3i7xchPbJyf2K78KdgsAeC9FoZJP
 xC7C1WZxzDeZ5R3Dkv3B7+mONfYRnkGY9p1VX+GiusFB5Gdvi9zRI3TNcQN/hX+aN57JF04kqjU
 AqllqvC8A6bghIvD2mTSUe4Ov85uJEewgqeNbVIE5nrjujPu9PwTtT72I617gN76Q6R6JNnDd8j
 XTX6EUnorL1bXup4J3fQ8SAcM0uF82Q7Iy9KC70nvh4wZn3CcviTYy6kLE9lyCl4VglYZQlN9dT
 PF3zPDaOY/tfsHyQDChibN15pCe7mTVbitENEnTNtGcInTL77Ct4WygPuK60OJY3j6IkMEodFbf
 4m5/fF5Dn6Rd2AXQr78whVtcrxLmmsHZ9yhA6Ir+m/xBP8cFw4uNWRL1FUhPaqHXvbaE5FD/5jt
 4x3CYaIFxAQiHwL3u7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_231502_581990_E6A9C175 
X-CRM114-Status: GOOD (  26.96  )
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

  Page Size | CONT PTE |  Block  | CONT Block | L1 Block | CONT L1
  ----------+----------+---------+------------+----------+---------
      4K    |   64K    |   2M    |    32M     |    1G    |   16G
     16K    |    2M    |  32M    |     1G     |          |
     64K    |    2M    | 512M    |    16G     |          |

Contiguous hint sizes are advertised in pgsize_bitmap so that IOMMU API
users can align allocations to these sizes and benefit from the TLB
optimization automatically.

Partial unmaps of a contiguous group are rejected, ensuring the full
group is always invalidated as a unit. The
IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
contiguous hint support at runtime for hardware with
implementation-specific errata.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Co-developed-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
---
Changes in v4:
- Merge each run of consecutive aligned (or consecutive non-aligned)
  num_cont windows within arm_lpae_install_leaf() into a single
  arm_lpae_init_pte() call instead of one call per window. idx and
  paddr both advance by block_size per entry, so once a window
  qualifies (or fails to qualify) for the CONT hint, every later whole
  window in the same call does too - collapsing the common fully-
  aligned or fully-unaligned case back down to one call, matching v2's
  call count without reintroducing v2's alignment gaps.
- Fix min_t(int, pgcount, max_entries) truncating pgcount (size_t) to a
  signed int in both __arm_lpae_map() and __arm_lpae_unmap(), which
  could go negative and spin the caller's while (pgcount) loop forever
  for a large enough single request - especially reachable now that
  pgcount is scaled by num_cont (up to 128) for whole-CONT-group
  requests. Compare in size_t via min_t(size_t, ...) instead; the
  result remains bounded by max_entries before being stored back into
  the int num_entries. Reported by the Sashiko AI review bot on v3.
- Stop short of the offending entry instead of returning 0 outright
  when __arm_lpae_unmap() detects a misaligned CONT group mid-loop.
  Earlier entries in the same call may already have had non-leaf
  sub-tables torn down and freed, so returning 0 both under-reports
  the actual unmap progress to the caller and skips the bulk
  clear/gather for those already-freed entries. Breaking out of the
  loop at the current index lets the existing post-loop clear/gather
  path handle entries [0, i) correctly and report i * size unmapped.
  Reported by the Sashiko AI review bot on v3.
- Link to v3: https://lore.kernel.org/all/20260722-iommu_contig_hint-v3-1-10923a683441@oss.qualcomm.com/

Changes in v3:
- Collapse arm_lpae_cont_ptes()/arm_lpae_cont_blks()/
  arm_lpae_cont_pte_size()/arm_lpae_cont_blk_size()/
  arm_lpae_find_num_cont() into a single arm_lpae_num_cont(size_t size)
  helper, since leaf/block/L1-block sizes never overlap across granules.
- Fix arm_lpae_pte_is_contiguous_range() never checking that iova/paddr
  are aligned to the contiguous group size, by removing it entirely -
  __arm_lpae_map()'s new arm_lpae_install_leaf() helper scans for
  aligned sub-chunks and independently verifies paddr alignment for
  each one before applying the CONT hint.
- Fold the CONT case into __arm_lpae_map()'s existing size == block_size
  leaf path instead of duplicating arm_lpae_init_pte() in a separate
  branch. A request whose size exactly matches a whole CONT group is
  normalized down to block_size/scaled pgcount so it reaches that path;
  arm_lpae_install_leaf() then walks the resulting range in chunks,
  tagging only the sub-chunks that are both index-aligned and
  paddr-aligned to the group size, since a single map_pages() call at
  the plain block_size can still contain such an aligned group midway
  through a larger, otherwise ungrouped range.
- Replace the unmap-side WARN_ON_ONCE(!IS_ALIGNED(iova, size)) with a
  check on the actual ARM_LPAE_PTE_CONT bit of the PTEs being cleared.
  The previous check incorrectly warned on any unmap whose size
  happened to numerically match a CONT group size, even when the
  underlying PTEs were never CONT-tagged (e.g. because the original
  iommu_map() wasn't group-aligned), and even though iommu_unmap() can
  legitimately assemble such a size from multiple independent prior
  iommu_map() calls.
- Close a leak where ARM_MALI_LPAE would gain CONT-sized entries in its
  pgsize_bitmap despite the format having no CONT bit, by having
  arm_mali_lpae_alloc_pgtable() set IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
  internally rather than special-casing the format in the shared
  arm_lpae_restrict_pgsizes()/arm_lpae_get_cont_sizes() path.
- Gate each contiguous-hint size in arm_lpae_get_cont_sizes() on whether
  a single group actually fits within the configured IAS/OAS, so e.g. a
  16G level-1 CONT group is never advertised for an IAS too small to
  address it.
- Link to v2: https://patch.msgid.link/20260721-iommu_contig_hint-v2-1-90c731a41163@oss.qualcomm.com

Changes in v2:
- Extend contiguous hint support to level-1 (1G) blocks for the 4K granule,
  adding a CONT L1 (16G) grouping alongside the existing CONT PTE/CONT Block
  sizes.
- Replace the compile-time CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT Kconfig option
  with a runtime quirk, IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT, so SMMU drivers
  can opt out per page table instance instead of at build time.
- Simplify __arm_lpae_map() to program the CONT-sized block directly via
  arm_lpae_init_pte() instead of recursing into the next level with an
  adjusted pgcount.
- Reject unmaps that are not aligned to the contiguous group size with
  WARN_ON_ONCE(), instead of clearing the CONT bit on a partial group before
  invalidation.
- Link to v1: https://patch.msgid.link/20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com

To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 drivers/iommu/io-pgtable-arm.c | 242 +++++++++++++++++++++++++++++++++++++++--
 include/linux/io-pgtable.h     |   3 +
 2 files changed, 235 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 476c0e25631af..23a238de53ed5 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -86,6 +86,21 @@
 /* Software bit for solving coherency races */
 #define ARM_LPAE_PTE_SW_SYNC		(((arm_lpae_iopte)1) << 55)
 
+/* PTE Contiguous Bit */
+#define ARM_LPAE_PTE_CONT		(((arm_lpae_iopte)1) << 52)
+
+/*
+ * Contiguous hint group sizes per granule:
+ *
+ *------------------------------------------------------------------
+ *| Page Size | CONT PTE |  Block  | CONT Block | L1 Block | CONT L1 |
+ *------------------------------------------------------------------
+ *|     4K    |   64K    |   2M    |    32M     |    1G    |   16G   |
+ *|    16K    |    2M    |  32M    |     1G     |          |         |
+ *|    64K    |    2M    | 512M    |    16G     |          |         |
+ *------------------------------------------------------------------
+ */
+
 /* Stage-1 PTE */
 #define ARM_LPAE_PTE_AP_UNPRIV		(((arm_lpae_iopte)1) << 6)
 #define ARM_LPAE_PTE_AP_RDONLY_BIT	7
@@ -453,6 +468,137 @@ static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
 	return old;
 }
 
+static int arm_lpae_num_cont(size_t size)
+{
+	switch (size) {
+	case SZ_4K:
+	case SZ_2M:
+	case SZ_1G:
+		return 16;
+	case SZ_64K:
+	case SZ_32M:
+	case SZ_512M:
+		return 32;
+	case SZ_16K:
+		return 128;
+	default:
+		return 1;
+	}
+}
+
+/*
+ * A group is only usable if its span fits within both the configured
+ * ias and oas. Otherwise no aligned iova/paddr pair for a full group
+ * can exist, and advertising the size would let callers pick a
+ * mapping that unconditionally fails.
+ */
+static bool arm_lpae_cont_size_fits(struct io_pgtable_cfg *cfg, unsigned long size)
+{
+	int size_bits = ilog2(size);
+
+	return size_bits <= cfg->ias && size_bits <= cfg->oas;
+}
+
+static unsigned long arm_lpae_get_cont_sizes(struct io_pgtable_cfg *cfg)
+{
+	unsigned long pg_size, blk_size, l1_blk_size, cont_sizes = 0;
+	unsigned long cont_leaf_size, cont_blk_size, cont_l1_blk_size;
+	int pg_shift, bits_per_level;
+
+	if (!cfg->pgsize_bitmap || (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT))
+		return 0;
+
+	pg_shift = __ffs(cfg->pgsize_bitmap);
+	bits_per_level = pg_shift - ilog2(sizeof(arm_lpae_iopte));
+	pg_size = 1UL << pg_shift;
+	blk_size = pg_size << bits_per_level;
+	l1_blk_size = blk_size << bits_per_level;
+
+	cont_leaf_size = arm_lpae_num_cont(pg_size) * pg_size;
+	if ((cfg->pgsize_bitmap & pg_size) &&
+	    arm_lpae_cont_size_fits(cfg, cont_leaf_size))
+		cont_sizes |= cont_leaf_size;
+
+	if (cfg->pgsize_bitmap & blk_size) {
+		cont_blk_size = arm_lpae_num_cont(blk_size) * blk_size;
+		if (arm_lpae_cont_size_fits(cfg, cont_blk_size))
+			cont_sizes |= cont_blk_size;
+	}
+
+	/*
+	 * l1_blk_size is only set in pgsize_bitmap if level-1 blocks are
+	 * supported for this granule (not 16K/64K, per
+	 * arm_lpae_restrict_pgsizes()), so no extra gating is needed here.
+	 */
+	if (cfg->pgsize_bitmap & l1_blk_size) {
+		cont_l1_blk_size = arm_lpae_num_cont(l1_blk_size) * l1_blk_size;
+		if (arm_lpae_cont_size_fits(cfg, cont_l1_blk_size))
+			cont_sizes |= cont_l1_blk_size;
+	}
+
+	return cont_sizes;
+}
+
+/*
+ * Install num_entries leaf entries starting at ptep (index map_idx_start
+ * within the current table), tagging arm_lpae_num_cont()-sized groups with
+ * the contiguous hint where both idx and paddr are aligned to the group
+ * size. Entries in a misaligned group are installed without the hint.
+ *
+ * idx and paddr both advance by block_size per entry, so their alignment
+ * relative to the group size is invariant across a run of entries within
+ * this call: once a group qualifies (or fails to), every later whole group
+ * does too, up to num_entries. This merges each such run into a single
+ * arm_lpae_init_pte() call instead of one call per group.
+ */
+static int arm_lpae_install_leaf(struct arm_lpae_io_pgtable *data,
+				 unsigned long iova, phys_addr_t paddr,
+				 arm_lpae_iopte prot, int lvl,
+				 int map_idx_start, int num_entries, int num_cont,
+				 arm_lpae_iopte *ptep, size_t *mapped)
+{
+	size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+	size_t cont_size = num_cont * block_size;
+	int done = 0;
+
+	while (done < num_entries) {
+		int idx = map_idx_start + done;
+		int remaining = num_entries - done;
+		int off = idx % num_cont;
+		arm_lpae_iopte pte = prot;
+		int chunk, ret;
+
+		if (off) {
+			/* Misaligned prefix: advance to the next boundary */
+			chunk = min_t(int, num_cont - off, remaining);
+		} else if (remaining >= num_cont && IS_ALIGNED(paddr, cont_size)) {
+			/* Aligned: merge every full group in this run */
+			chunk = remaining - remaining % num_cont;
+			pte |= ARM_LPAE_PTE_CONT;
+		} else {
+			/*
+			 * Aligned idx but paddr doesn't line up with cont_size,
+			 * or too short for a full group. That holds for the
+			 * rest of this call too, so install the remainder
+			 * plain in one go.
+			 */
+			chunk = remaining;
+		}
+
+		ret = arm_lpae_init_pte(data, iova, paddr, pte, lvl, chunk, ptep);
+		if (ret)
+			return ret;
+
+		*mapped += chunk * block_size;
+		ptep += chunk;
+		iova += chunk * block_size;
+		paddr += chunk * block_size;
+		done += chunk;
+	}
+
+	return 0;
+}
+
 static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 			  phys_addr_t paddr, size_t size, size_t pgcount,
 			  arm_lpae_iopte prot, int lvl, arm_lpae_iopte *ptep,
@@ -462,21 +608,44 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 	size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
 	size_t tblsz = ARM_LPAE_GRANULE(data);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
-	int ret = 0, num_entries, max_entries, map_idx_start;
+	bool cont_hint_enabled = !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT);
+	int num_entries, max_entries, map_idx_start;
+	int num_cont = cont_hint_enabled ? arm_lpae_num_cont(block_size) : 1;
+	bool use_cont = cont_hint_enabled && num_cont > 1;
 
 	/* Find our entry at the current level */
 	map_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
 	ptep += map_idx_start;
 
+	/*
+	 * Normalize an exact whole-CONT-group request down to the
+	 * equivalent block_size/pgcount so it funnels through the same
+	 * leaf path below. arm_lpae_install_leaf() independently decides,
+	 * per sub-chunk, whether the CONT hint actually applies.
+	 */
+	if (use_cont && size == block_size * num_cont) {
+		pgcount *= num_cont;
+		size = block_size;
+	}
+
 	/* If we can install a leaf entry at this level, then do so */
 	if (size == block_size) {
+		int ret;
+
 		max_entries = arm_lpae_max_entries(map_idx_start, data);
-		num_entries = min_t(int, pgcount, max_entries);
-		ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl, num_entries, ptep);
-		if (!ret)
-			*mapped += num_entries * size;
+		num_entries = min_t(size_t, pgcount, max_entries);
 
-		return ret;
+		if (!use_cont) {
+			ret = arm_lpae_init_pte(data, iova, paddr, prot, lvl,
+						num_entries, ptep);
+			if (!ret)
+				*mapped += num_entries * size;
+			return ret;
+		}
+
+		return arm_lpae_install_leaf(data, iova, paddr, prot, lvl,
+					     map_idx_start, num_entries,
+					     num_cont, ptep, mapped);
 	}
 
 	/* We can't allocate tables at the final level */
@@ -660,6 +829,8 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 {
 	arm_lpae_iopte pte;
 	struct io_pgtable *iop = &data->iop;
+	size_t block_size = ARM_LPAE_BLOCK_SIZE(lvl, data);
+	int num_cont = arm_lpae_num_cont(block_size);
 	int i = 0, num_entries, max_entries, unmap_idx_start;
 
 	/* Something went horribly wrong and we ran out of page table */
@@ -674,10 +845,22 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 		return 0;
 	}
 
+	/*
+	 * Normalize an exact whole-CONT-group request down to the
+	 * equivalent block_size/pgcount, mirroring __arm_lpae_map().
+	 */
+	if (!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT) &&
+	    num_cont > 1 && size == block_size * num_cont) {
+		pgcount *= num_cont;
+		size = block_size;
+	}
+
 	/* If the size matches this level, we're in the right place */
-	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
+	if (size == block_size) {
+		size_t cont_size = num_cont * block_size;
+
 		max_entries = arm_lpae_max_entries(unmap_idx_start, data);
-		num_entries = min_t(int, pgcount, max_entries);
+		num_entries = min_t(size_t, pgcount, max_entries);
 
 		/* Find and handle non-leaf entries */
 		for (i = 0; i < num_entries; i++) {
@@ -687,6 +870,40 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 				break;
 			}
 
+			/*
+			 * A real CONT group must always be invalidated as a
+			 * unit, so reject an unmap that splits one. Check the
+			 * PTE's own CONT bit rather than the caller's size,
+			 * since a legitimate unmap can span multiple prior
+			 * iommu_map() calls and its size alone doesn't say how
+			 * the underlying PTEs were grouped. Only the first and
+			 * last entries can straddle a group boundary; an
+			 * interior CONT-tagged entry's group is necessarily
+			 * fully covered by this unmap, since groups can't
+			 * overlap without also covering everything between
+			 * them.
+			 */
+			if (pte & ARM_LPAE_PTE_CONT) {
+				bool ok = true;
+
+				if (i == 0)
+					ok = ok && IS_ALIGNED(iova, cont_size);
+				if (i == num_entries - 1)
+					ok = ok && IS_ALIGNED(iova + (i + 1) * block_size,
+							      cont_size);
+
+				/*
+				 * Stop short of this entry instead of returning
+				 * 0: entries before i may already have had
+				 * non-leaf sub-tables torn down above, so the
+				 * caller needs the real unmapped count, and the
+				 * loop exit below still clears/gathers entries
+				 * [0, i) correctly.
+				 */
+				if (WARN_ON_ONCE(!ok))
+					break;
+			}
+
 			if (!iopte_leaf(pte, lvl, iop->fmt)) {
 				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
 
@@ -943,6 +1160,7 @@ static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
 	}
 
 	cfg->pgsize_bitmap &= page_sizes;
+	cfg->pgsize_bitmap |= arm_lpae_get_cont_sizes(cfg);
 	cfg->ias = min(cfg->ias, max_addr_bits);
 	cfg->oas = min(cfg->oas, max_addr_bits);
 }
@@ -1001,7 +1219,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
 			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
 			    IO_PGTABLE_QUIRK_ARM_HD |
-			    IO_PGTABLE_QUIRK_NO_WARN))
+			    IO_PGTABLE_QUIRK_NO_WARN |
+			    IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1103,7 +1322,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
 
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
-			    IO_PGTABLE_QUIRK_NO_WARN))
+			    IO_PGTABLE_QUIRK_NO_WARN |
+			    IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1224,6 +1444,8 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 		return NULL;
 
 	cfg->pgsize_bitmap &= (SZ_4K | SZ_2M | SZ_1G);
+	/* Mali LPAE has no CONT bit - never advertise CONT page sizes */
+	cfg->quirks |= IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT;
 
 	data = arm_lpae_alloc_pgtable(cfg);
 	if (!data)
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index e19872e37e067..7b2097aaffb09 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -86,6 +86,8 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
 	 * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
+	 * IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT: Disable use of the contiguous
+	 *	hint for hardware affected by implementation-specific errata.
 	 *
 	 * IO_PGTABLE_QUIRK_NO_WARN: Do not WARN_ON() on conflicting
 	 *	mappings, but silently return -EEXISTS.  Normally an attempt
@@ -103,6 +105,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
 	#define IO_PGTABLE_QUIRK_ARM_S2FWB		BIT(8)
 	#define IO_PGTABLE_QUIRK_NO_WARN		BIT(9)
+	#define IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT	BIT(10)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;

---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260618-iommu_contig_hint-71ae491fbb52

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


