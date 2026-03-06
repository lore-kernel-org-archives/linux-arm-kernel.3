Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC0AFCC050
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMlq6KKSdA7fSbiyN4Oc9bi36Rn1hFRXqLJA5son7U0=; b=KWRRdlBt9x2K231ijH8fLyQNid
	4Ln1juo8IYJKOTDwru42ZvlET/IVtHrxWMtIlaeZ//BBnorwYf+UeofpqSLej61aydwKCOcmOPgra
	xVfiNLDW0KfOX5aGybztFJhik3AVtfqM/1AM+5DsPz4gTm+RkfyLTmoApx9m/ByvrwKQdi2XWRS3e
	BORa5dGuQHTvs3jOi1dOeRvZOVxu65ccIFgvKtzLlX+5Fj9TVECk1dms4VTwhCpSSfXe58HeFTBcZ
	H9oSYxVSDiiKF4Vwbi/lDnWhT4kSwjr24Jxl+tpRSsiWAXtgUiiqNXbHhT9AhLjeeoosGKCmQyXjH
	fU0/6Nvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZth-00000004K0c-1lgZ;
	Fri, 06 Mar 2026 18:27:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZtf-00000004Jz1-2eRx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 18:27:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544A9497;
	Fri,  6 Mar 2026 10:27:27 -0800 (PST)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 775AA3F7BD;
	Fri,  6 Mar 2026 10:27:32 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Ben Horgan <ben.horgan@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 1/3] arm_mpam: Fix null pointer dereference when restoring bandwidth counters
Date: Fri,  6 Mar 2026 18:27:16 +0000
Message-ID: <20260306182718.150569-2-james.morse@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306182718.150569-1-james.morse@arm.com>
References: <20260306182718.150569-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_102735_720475_DBCC9214 
X-CRM114-Status: GOOD (  11.11  )
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

From: Ben Horgan <ben.horgan@arm.com>

When an MSC supporting memory bandwidth monitoring is brought offline and
then online, mpam_restore_mbwu_state() calls __ris_msmon_read() via ipi to
restore the configuration of the bandwidth counters. It doesn't care about
the value read, mbwu_arg.val, and doesn't set it leading to a null pointer
dereference when __ris_msmon_read() adds to it. This results in a kernel
oops with a call trace such as:

Call trace:
__ris_msmon_read+0x19c/0x64c (P)
mpam_restore_mbwu_state+0xa0/0xe8
smp_call_on_cpu_callback+0x1c/0x38
process_one_work+0x154/0x4b4
worker_thread+0x188/0x310
kthread+0x11c/0x130
ret_from_fork+0x10/0x20

Provide a local variable for val to avoid __ris_msmon_read() dereferencing
a null pointer when adding to val.

Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 1eebc2602187..0666be6b0e88 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1428,6 +1428,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 static int mpam_restore_mbwu_state(void *_ris)
 {
 	int i;
+	u64 val;
 	struct mon_read mwbu_arg;
 	struct mpam_msc_ris *ris = _ris;
 	struct mpam_class *class = ris->vmsc->comp->class;
@@ -1437,6 +1438,7 @@ static int mpam_restore_mbwu_state(void *_ris)
 			mwbu_arg.ris = ris;
 			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
 			mwbu_arg.type = mpam_msmon_choose_counter(class);
+			mwbu_arg.val = &val;
 
 			__ris_msmon_read(&mwbu_arg);
 		}
-- 
2.51.0


