Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34656CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvbMDgra2U1UoaGxz8XvkRbfg6cBMr5E7IJr0sspiBw=; b=rmQOKDOrfax4uXb72RLAAfkuHO
	3Yv00Gyt/bYfyB3gvt9PBCsqQkuiOhcua5XUZiD5FbebShywI8sLc4Wq3KP0GlnGJm0V8rhT0KZiX
	yRQjSMh6veerW8rW4XlLOPZXTYWgyXTTKiBazTBV8Fbix9rw/+Gyc7up9dmSGMwHO19uz1whYh+sV
	Ps3BcfwVNisDnKEfR2uC11blk5uRe6KeN8cmXajWGuyGBWdXQbD6plXM7fz/UEI4hTeJVLZaGXaOv
	6erpG5ziNdqsp0o9JueUO1v7VjM1yNSO8KKBGROVKmRBUHsBZaDMw8kPPYGdxRWqumKw8DX7TJUXF
	ZIqd6LmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpE7-000000044FE-166E;
	Fri, 16 Oct 2026 21:12:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDl-0000000446S-3uy9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 21:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZvbMDgra2U1UoaGxz8XvkRbfg6cBMr5E7IJr0sspiBw=; b=LxrH+qoSpD9LOojlIAjG7fvjNq
	3jkQxcnPMsM7ZxrkCWZdPccTfBY7wQBosfsncOeIc0vRD4Yv+PNjARbI/6TrWph/q4mGcwumYJiOR
	WHAUFJysh5H05ZatROU/ONR+NIefdgN6zFSZklrW6vC1wC3Iax6T2d0+aMwleLGJIUOiQldxof85t
	SaJI9pt3VCNbczG5fH3NKGtnfDkThwZ/u1Q0+3YKV8VxhwihgnbfupHfTVE6sIW18DByGuTJ37lRL
	XLy0yXjMa2xZnD9lrMPiJdhyHpcgtrLog8wG6GnLSM96vV2Q9ePyUXtQKxnjfjg6cvHaj0c6G7kVo
	6fovRkjw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHpDi-00000001xSa-2VJ7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:12:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDBC216F3;
	Fri, 16 Oct 2026 14:12:01 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB81A3F673;
	Fri, 16 Oct 2026 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185125; bh=vkTR0c01qLKuGP/MBGuCwxrpk2UfwNHK062KXd1/KcM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hhIWKh3Q/5nlf7aPdkufCLSSSYQsXy0I7e7u8E1G/pfqOtckLEsGHDxhF4etljP1R
	 X4tVUROFGlCJADnsDTukG5aN+oCXC0YCzTA0y91YKqDI/tMsswMQHIDuljoByuoxwi
	 I6Ntavo/42NzrFodRW1dvvvYHEuhlaIRmL+PcyTM=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:44 +0100
Subject: [PATCH v2 06/11] coresight: trbe: Save and restore trigger counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-6-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=1650;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=vkTR0c01qLKuGP/MBGuCwxrpk2UfwNHK062KXd1/KcM=;
 b=dyQNi+IMy9C/+FRYKYyUyMYuiCHOCCAEo7Pe5orDfqWdwxv96+k+GABYO4x0FxybQler+3Z71
 3F65qmjw9eXCaQ1qxJ1B4rDLsfsj4SWSxRLisqnweqHTDC0E2KBltrO
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_221206_868025_AE205057 
X-CRM114-Status: GOOD (  10.02  )
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

Add TRBTRG_EL1 to the saved TRBE state and restore it along with the other
TRBE registers.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8187e264ff3c86d445b96c4935a8dbdf5ad9e77c..391e5013647477ae145d777d406c63355bc38278 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -127,12 +127,14 @@ static int trbe_errata_cpucaps[] = {
  * @trbbaser		- Trace Buffer Base Register value
  * @trbptr		- Trace Buffer Write Pointer Register value
  * @trbsr		- Trace Buffer Status Register value
+ * @trbtrg		- Trace Buffer Trigger Counter Register
  */
 struct trbe_save_state {
 	u64 trblimitr;
 	u64 trbbaser;
 	u64 trbptr;
 	u64 trbsr;
+	u64 trbtrg;
 };
 
 /*
@@ -1537,6 +1539,7 @@ static int arm_trbe_save(struct coresight_device *csdev)
 	state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
 	state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
 	state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
+	state->trbtrg = read_sysreg_s(SYS_TRBTRG_EL1);
 	return 0;
 }
 
@@ -1548,6 +1551,7 @@ static void arm_trbe_restore(struct coresight_device *csdev)
 	write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
 	write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
 	write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
+	write_sysreg_s(state->trbtrg, SYS_TRBTRG_EL1);
 
 	if (!(state->trblimitr & TRBLIMITR_EL1_E)) {
 		write_sysreg_s(state->trblimitr, SYS_TRBLIMITR_EL1);

-- 
2.34.1


