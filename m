Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17555C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDA2ENloqLNY3KqgFemOieGU8xI2b4OTzIbmq9MvYUQ=; b=cB4UJNX00H8tfuBetDMXWOjXwC
	SLbEyISdxrzeojUZqwHA2Z7ckjs7usqBhCpuEDQ3rpPqujJIECQVxRTvfAg2zuYg7VXkfa7UFf5Y/
	kEn4Ep0wOXgYi5G0Ea9O4BaRiih7Ug+tZMkQO6j19KCnCBT9Ii1lE8xapp0BVZo1MgB8gLRV9miWG
	CgUe+YhFgh90kzHoCRxPSmcocZMIV9Pm2zvqZ8qf4C4wZYnNdquGEiJu1UipZCMbhVgo1ArXJBf61
	fVnH2fRku2H5XLG/yTifjurwLAe57aIqAEQdLNwN8qjcouLOdoETI151XxEKrvIJ8e4qdieeWB+FF
	9doUsJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fmM-000000026Qo-14bv;
	Sat, 26 Apr 2025 13:41:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeW-00000001z8q-0f4I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C465768490;
	Sat, 26 Apr 2025 12:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D11FC4CEE2;
	Sat, 26 Apr 2025 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670543;
	bh=x30AyqJd+6kV4qqEkdexdcfVsNcYCTucDK0MVL8lfUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UcWrAa/819EBBMpwX4cGSrHzk3VEYJq6zeK0NPQhOv/2Ih/FOdi0aukt07h1nZG1Q
	 i/JBo18OBPlZl+VOvOxUe2f9KzKNN1MmAC6fDGSGD9/nz2bel+1IGrkucX0cNGlUV5
	 WppDys9jIe1BOHW+cBXDgb5HxBr+9YM4J8aPbgdccdEWoRzS8fG4fmwXsw8BM6n8XB
	 k5tG3DIe0nJtOxd1VC+rFl0uG7HkVqBwun+sdQUK8ACu3MgpgAtE99nEbK5fWb0rhF
	 7Qj7JQoPWrIvVSQ8QSh2+/l7VpwwexIuVk3oVdcJi+CUc8Tz98+cObvNfdMWj0SlY2
	 ppYaET9/usgKA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeT-0092VH-BK;
	Sat, 26 Apr 2025 13:29:01 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 40/42] KVM: arm64: Allow sysreg ranges for FGT descriptors
Date: Sat, 26 Apr 2025 13:28:34 +0100
Message-Id: <20250426122836.3341523-41-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Just like we allow sysreg ranges for Coarse Grained Trap descriptors,
allow them for Fine Grain Traps as well.

This comes with a warning that not all ranges are suitable for this
particular definition of ranges.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 120 +++++++++++---------------------
 1 file changed, 39 insertions(+), 81 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index e2a843675da96..9c7ecfccbd6e9 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -622,6 +622,11 @@ struct encoding_to_trap_config {
 	const unsigned int		line;
 };
 
+/*
+ * WARNING: using ranges is a treacherous endeavour, as sysregs that
+ * are part of an architectural range are not necessarily contiguous
+ * in the [Op0,Op1,CRn,CRm,Ops] space. Tread carefully.
+ */
 #define SR_RANGE_TRAP(sr_start, sr_end, trap_id)			\
 	{								\
 		.encoding	= sr_start,				\
@@ -1289,15 +1294,19 @@ enum fg_filter_id {
 
 #define FGT(g, b, p)		__FGT(g, b, p, __NO_FGF__)
 
-#define SR_FGF(sr, g, b, p, f)					\
+/* Same warning applies: use carefully */
+#define SR_FGF_RANGE(sr, e, g, b, p, f)				\
 	{							\
 		.encoding	= sr,				\
-		.end		= sr,				\
+		.end		= e,				\
 		.tc		= __FGT(g, b, p, f),		\
 		.line = __LINE__,				\
 	}
 
-#define SR_FGT(sr, g, b, p)	SR_FGF(sr, g, b, p, __NO_FGF__)
+#define SR_FGF(sr, g, b, p, f) 	SR_FGF_RANGE(sr, sr, g, b, p, f)
+#define SR_FGT(sr, g, b, p)	SR_FGF_RANGE(sr, sr, g, b, p, __NO_FGF__)
+#define SR_FGT_RANGE(sr, end, g, b, p)	\
+				SR_FGF_RANGE(sr, end, g, b, p, __NO_FGF__)
 
 static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	/* HFGRTR_EL2, HFGWTR_EL2 */
@@ -1794,68 +1803,12 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 	SR_FGT(SYS_PMCNTENSET_EL0, 	HDFGRTR, PMCNTEN, 1),
 	SR_FGT(SYS_PMCCNTR_EL0, 	HDFGRTR, PMCCNTR_EL0, 1),
 	SR_FGT(SYS_PMCCFILTR_EL0, 	HDFGRTR, PMCCFILTR_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(0), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(1), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(2), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(3), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(4), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(5), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(6), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(7), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(8), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(9), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(10), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(11), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(12), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(13), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(14), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(15), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(16), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(17), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(18), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(19), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(20), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(21), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(22), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(23), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(24), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(25), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(26), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(27), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(28), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(29), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVTYPERn_EL0(30), 	HDFGRTR, PMEVTYPERn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(0), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(1), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(2), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(3), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(4), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(5), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(6), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(7), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(8), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(9), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(10), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(11), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(12), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(13), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(14), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(15), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(16), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(17), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(18), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(19), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(20), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(21), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(22), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(23), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(24), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(25), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(26), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(27), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(28), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(29), 	HDFGRTR, PMEVCNTRn_EL0, 1),
-	SR_FGT(SYS_PMEVCNTRn_EL0(30), 	HDFGRTR, PMEVCNTRn_EL0, 1),
+	SR_FGT_RANGE(SYS_PMEVTYPERn_EL0(0),
+		     SYS_PMEVTYPERn_EL0(30),
+		     HDFGRTR, PMEVTYPERn_EL0, 1),
+	SR_FGT_RANGE(SYS_PMEVCNTRn_EL0(0),
+		     SYS_PMEVCNTRn_EL0(30),
+		     HDFGRTR, PMEVCNTRn_EL0, 1),
 	SR_FGT(SYS_OSDLR_EL1, 		HDFGRTR, OSDLR_EL1, 1),
 	SR_FGT(SYS_OSECCR_EL1, 		HDFGRTR, OSECCR_EL1, 1),
 	SR_FGT(SYS_OSLSR_EL1, 		HDFGRTR, OSLSR_EL1, 1),
@@ -2172,6 +2125,9 @@ static __init int check_all_fgt_masks(int ret)
 	return ret ?: err;
 }
 
+#define for_each_encoding_in(__x, __s, __e)	\
+	for (u32 __x = __s; __x <= __e; __x = encoding_next(__x))
+
 int __init populate_nv_trap_config(void)
 {
 	int ret = 0;
@@ -2191,7 +2147,7 @@ int __init populate_nv_trap_config(void)
 			ret = -EINVAL;
 		}
 
-		for (u32 enc = cgt->encoding; enc <= cgt->end; enc = encoding_next(enc)) {
+		for_each_encoding_in(enc, cgt->encoding, cgt->end) {
 			prev = xa_store(&sr_forward_xa, enc,
 					xa_mk_value(cgt->tc.val), GFP_KERNEL);
 			if (prev && !xa_is_err(prev)) {
@@ -2226,25 +2182,27 @@ int __init populate_nv_trap_config(void)
 			print_nv_trap_error(fgt, "Invalid FGT", ret);
 		}
 
-		tc = get_trap_config(fgt->encoding);
+		for_each_encoding_in(enc, fgt->encoding, fgt->end) {
+			tc = get_trap_config(enc);
 
-		if (tc.fgt) {
-			ret = -EINVAL;
-			print_nv_trap_error(fgt, "Duplicate FGT", ret);
-		}
+			if (tc.fgt) {
+				ret = -EINVAL;
+				print_nv_trap_error(fgt, "Duplicate FGT", ret);
+			}
 
-		tc.val |= fgt->tc.val;
-		prev = xa_store(&sr_forward_xa, fgt->encoding,
-				xa_mk_value(tc.val), GFP_KERNEL);
+			tc.val |= fgt->tc.val;
+			prev = xa_store(&sr_forward_xa, enc,
+					xa_mk_value(tc.val), GFP_KERNEL);
 
-		if (xa_is_err(prev)) {
-			ret = xa_err(prev);
-			print_nv_trap_error(fgt, "Failed FGT insertion", ret);
-		}
+			if (xa_is_err(prev)) {
+				ret = xa_err(prev);
+				print_nv_trap_error(fgt, "Failed FGT insertion", ret);
+			}
 
-		if (!aggregate_fgt(tc)) {
-			ret = -EINVAL;
-			print_nv_trap_error(fgt, "FGT bit is reserved", ret);
+			if (!aggregate_fgt(tc)) {
+				ret = -EINVAL;
+				print_nv_trap_error(fgt, "FGT bit is reserved", ret);
+			}
 		}
 	}
 
-- 
2.39.2


