Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0605ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 03:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/c4eqMudSj0GkkZVgzTXnytSbVNcNITl+hrIWAi2mE8=; b=Ym/Hl4DY7KJ+11lj0IViyWnok6
	gFePGm9pAvUfCfxXXg3glVNlVCGZaX0YCvxeuT/JbwN/rtSm9qD8qIrH5+NrAs4LEhn/dub8g1dmB
	/xsSy8WQUdL3OBMZ9Eb2MWUNNlP55G5k9Akk2LIhjinsGUIydlzxg1btxpVTGFn7Piwpee5s+DnAx
	ZkRtCumCHi6tKQJeJCmdFbKuZOR+YCk2eT0pmoIa4T84xF+ax1tT5V615PxoyynKTbmtRD6pXjYjr
	HYcfGKYQmV8NyeFBcDEk1fYI+XJ81czg4eCBF6keT21FEnIz3IkSeYivD8DiBUccI9yAp3/YaZ2Ep
	RuaszM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoiD-0000000E3kV-1Ht5;
	Mon, 18 May 2026 03:32:13 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoiA-0000000E3il-0XXB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 03:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779075130; x=1810611130;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7DRxMKyUDjg6Y5vlH9EXZ8MiPPZtTDDCvYyYivKrGak=;
  b=bwH9vlN3EvZhrmbyUe+JPVfmNVx/uAqWEglX1IAZrpd/SdgiYu4pHoe5
   rCz7hqBZDuiY2hG4FzCsSiFljuB9zJ8TEFEk00JF9tw+fqUw+ilh56qd7
   W0xAlqrQdkxvGjQGjd4Lww5kTCaAbSUNnmcQgimG2eKcLGv8J+RjsejxE
   fRbBwft6naU5Wa1todPhDJmHUp6tdUiZzyU0Usra3Z1ax14fBRBAbtFRp
   qBDlc+789on2OkeyFi/8NWVanIundpsBT2RDN7xJCIsRG4R01kRxxKfHO
   tlbDWVkvt0H5Go/wnnbcxUD3C5xrfsxxOgoZGMv/MHmXtSBkJht+rtRkk
   w==;
X-CSE-ConnectionGUID: mlGFCLFNS3Kw7jiG83rfZQ==
X-CSE-MsgGUID: O2cHD6ZDTg6XqlVXOpWJtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="218604398"
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="218604398"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 12:32:05 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F0C00C015BC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 03:32:05 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AA477140060B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 03:32:05 +0000 (UTC)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 7190D2000237;
	Mon, 18 May 2026 03:32:01 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Sami Mujawar <sami.mujawar@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kohei Enju <enju.kohei@fujitsu.com>
Subject: [PATCH v1] virt: arm-cca-guest: use raw variant of smp_processor_id() in arm_cca_report_new()
Date: Mon, 18 May 2026 12:31:31 +0900
Message-ID: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_203210_800465_800C9DFD 
X-CRM114-Status: GOOD (  15.99  )
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

With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
debug_smp_processor_id(). This debug function complains when certain
conditions that ensure CPU ID stability are not met, specifically when
it's called from a preemptible context.

In arm_cca_report_new(), which runs in a preemptible context,
smp_processor_id() triggers a splat [0] due to this.

However, the CPU ID obtained here is used as the target CPU for
smp_call_function_single() to designate a specific CPU for subsequent
operations, not to assert that the current thread will continue to
execute on the same CPU. Therefore, snapshotting the CPU ID itself is
correct, and thus there's no actual harm except for the splat.

Use raw_smp_processor_id() instead, to directly retrieve the current CPU
ID without the debug checks, avoiding the unnecessary warning message
while preserving the correct functional behavior.

[0]
 BUG: using smp_processor_id() in preemptible [00000000] code: cca-workload-at/134
 caller is debug_smp_processor_id+0x20/0x2c
 CPU: 0 UID: 0 PID: 134 Comm: cca-workload-at Not tainted 7.0.0-rc1-gc74a64d12073 #1 PREEMPT
 Hardware name: linux,dummy-virt (DT)
 Call trace:
  [...]
  check_preemption_disabled+0xf8/0x100
  debug_smp_processor_id+0x20/0x2c
  arm_cca_report_new+0x54/0x230
  tsm_report_read+0x184/0x260
  tsm_report_outblob_read+0x18/0x38
  configfs_bin_read_iter+0xf4/0x1dc
  vfs_read+0x230/0x31c
  [...]

Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 0c9ea24a200c..2d450caee3e4 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -108,7 +108,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 	 * allocate outblob based on the returned value from the 'init'
 	 * call and that cannot be done in an atomic context.
 	 */
-	cpu = smp_processor_id();
+	cpu = raw_smp_processor_id();
 
 	info.challenge = desc->inblob;
 	info.challenge_size = desc->inblob_len;
-- 
2.47.3


