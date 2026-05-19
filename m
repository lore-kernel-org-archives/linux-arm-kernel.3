Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0843CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lBHr+kluibzm8hBYk0cPesvKOKW0w5/7SfrYTTRUpoQ=; b=ofvg+/fBkQhurpGH1mZkZvYRXG
	vVGpg1IgHcS+xvNUUiNYxKbClrYDMwQ6mdTo1sb3NqzUyUMmW8fG7Er7eRm3YXHVZwDEG6JA9B2F4
	RsKfzBA64R53xgg7Gzw8Lpardz3+6FwxKp1VnbG9/e2JspXLasH92R9CN2sutWvGEo5YqxR6Cl7u7
	1DMcBvlnJIzF/nTgubSXBnzOop9LgmIkFVDmgIHnq+6s44iKFE9Gz9EANlzDqm+AZoqGkn1WccCCN
	IEBft8+7jiTXA+E2B8JIqvFadbl9uQBxWJQdvLmQAF1ymyKbPhATC/tk+pskx4yCf1/Wbr63ZRzVm
	lsPCfdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHRD-00000001377-0yK5;
	Tue, 19 May 2026 10:12:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHRC-0000000136t-2Kkb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 10:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lBHr+kluibzm8hBYk0cPesvKOKW0w5/7SfrYTTRUpoQ=; b=YV8MhUdxuCbcMDVVfQH3+ko5wX
	nw7VQ1Dn7WttXF1dMX71PRxCMfdr6YViqnbxP/yGEiLjY6VF5yk9+4hphocpQlvjf2zkfTZEIu0Vb
	JDn+vvO6pRey2JA0mWVu3dgCJOkPsa6X/Vldz/Nzcj+FUXMP4TRLe3MnILLXiGhbKVleTGzjTR3sL
	nqXC4dtzd4rKEVntQQ7Qt0Fur9g30iACw5zJDa4VEFkq5ThomEhZMrNmItDYf0k4C20OvRCiMiGSz
	BTsnLdsDVyM/M3AwRvyJTKmFwPu1Uj/gv+Os2+pTKgWT2lYIzeek7tA04YweLFG2sqduhtxl/GBkS
	75W2Dnsg==;
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHR7-0000000DpF2-47Ae
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779185550; x=1810721550;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XbXV/u59QlTB1yroWERolTZUVyTmPxGfLT6lIIG12OI=;
  b=J8UkN1evFehB3+KoIXllgXhiqWpTBhNYZMk+xZ5Ix+4ZJVB2S0LlznLx
   TOXO4YqgVnHJ96U28jhlIj79wBT4AluqNr3IBTX5LkPO21bzbQNk9SGvj
   gTmrIEIWVbpX29bYSPBEeiiOFbol5iUMX+N+G4i24rHbfL5C2PZWJFWpp
   WquLD+Qwu9MtO8tK3qgelu8O1s5MqEV3idtpKp0IxNl6EYBlPHEw+wtqo
   IQimWpo/nAdb+AhhUgO9Vq4ptlO4nlc3VADZKnyUmDc++yFToWkaKh1I0
   KWIAmqnjyAe7s+D0pxBeQeZ8z+S9/SudkF1MdwiJ7i1rodv4HDtJqF+sT
   A==;
X-CSE-ConnectionGUID: LAcAOFhnSDWeG8V3Yq9Oeg==
X-CSE-MsgGUID: pmNI5Jd5Q+OxwcbL5QlzNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="239225928"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="239225928"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 19:12:25 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5200A100036F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 10:12:25 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0795DC03841
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 10:12:25 +0000 (UTC)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E62508300B2;
	Tue, 19 May 2026 10:12:20 +0000 (UTC)
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
Subject: [PATCH v2] virt: arm-cca-guest: use raw variant of smp_processor_id() in arm_cca_report_new()
Date: Tue, 19 May 2026 19:12:08 +0900
Message-ID: <20260519101217.155740-1-enju.kohei@fujitsu.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_111231_003559_EE7425C8 
X-CRM114-Status: GOOD (  16.39  )
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

Note that while migrate_disable() would pin the task to the current CPU,
this path should not block CPU hotplug events. Therefore, we snapshot
the current CPU ID and accept that smp_call_function_single() may fail
if the CPU goes offline.

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

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 0c9ea24a200c..b463bf35bf30 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -107,8 +107,15 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 	 * instead of simply calling get_cpu() because of the need to
 	 * allocate outblob based on the returned value from the 'init'
 	 * call and that cannot be done in an atomic context.
+	 *
+	 * While migrate_disable() would pin the task to the current CPU,
+	 * this path should not block CPU hotplug events. Therefore, we
+	 * snapshot the current CPU ID and accept that
+	 * smp_call_function_single() may fail if the CPU goes offline.
+	 * Any resulting error is propagated to user-space, which is
+	 * expected to handle it.
 	 */
-	cpu = smp_processor_id();
+	cpu = raw_smp_processor_id();
 
 	info.challenge = desc->inblob;
 	info.challenge_size = desc->inblob_len;
-- 
2.47.3


