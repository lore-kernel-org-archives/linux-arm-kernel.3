Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FEBC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j7tVt21CSx5QSIIkqDXrtKBI1pjibIHH+jLB5l0NBgY=; b=Nzsik6iDewUs61c9+WVTEljF2o
	8NXluV/cS7x//rkHs60zS1FBNxLdbRADpRyjL0ip7Cl7aewJQ5nlbLKujCf34v2AjUp8zhQsRjn49
	XMIm55FeliaPImgTt+1QHDSBqRcldapF95S32EC9mJ4bCskhXN4FiOWb426s1KXJMpLq7wldOV/tl
	b+yoVGROweYwmEeAc6lfP07lnK+5EeMvy350w2NrFge5ACUBsWKB0L63Sq/GRXE0yHfpZAn++R/OJ
	jkRnDeoVMPJQuHLQd370GMCN0lSn7q0BO/sMQAkvOPtpK8qA20PjQZKgc1Tso4HeqtHb4RclWEpJ9
	0AsTTPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyjv-0000000En8M-47Rm;
	Wed, 15 Jul 2026 12:29:27 +0000
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyjo-0000000En5m-0RDl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784118560; x=1815654560;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4PF6FaFm2QcNQMO/yI0kHsZGO/hGSpJhHMKgXsqDL8c=;
  b=ObqW4MCaEclrMgXm8jiRgknpJJvLsc6lsWF37bLonyj3Il175g+mS0NE
   hXY5Ppyz4M6i+rwSzA2O4hFCZtW4lVo9O7DXA9dqJeijhGM2x4efiBlC7
   tO5SzqUnmuEyDL+oTNMcwVT73qMwDDHSI+fFk+o/mOMcPhKkiYuSUvi37
   jDbyyFXzjJ1kGTouFnzWh88Nt7WfF4IL1TmhTxFqAtXnDGdiUnCGggoEe
   UnR9yDuHChuFRX+0RkDXp+oI4k5vLWgRVNIj34CosUz8IDForbh077gYw
   TXJYPaZ1HLXPoYVF8A5trmczc3ysAKf7oWVxPZQEML2oEykP00Pj7pesQ
   g==;
X-CSE-ConnectionGUID: dAu7unZoQRmANjI3wjuNcA==
X-CSE-MsgGUID: U2hL6GAwQ8yh3FWtuxXQAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="245668866"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="245668866"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 21:29:14 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9801D100281A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:29:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4264382A4BE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:29:14 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.26.78])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BF57C829EDC;
	Wed, 15 Jul 2026 12:29:10 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Gavin Shan <gshan@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Kohei Enju <enju.kohei@fujitsu.com>
Subject: [PATCH v1] arm64: RSI: fix field-spanning write warning in attestation token init
Date: Wed, 15 Jul 2026 21:28:50 +0900
Message-ID: <20260715122907.8061-1-enju.kohei@fujitsu.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_052920_433689_F952FD73 
X-CRM114-Status: GOOD (  15.72  )
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

The challenge is passed in registers a1 through a8. However, copying to
&regs.a1 makes FORTIFY treat the destination as the single a1 field,
resulting in a field-spanning write warning. [1]

Overlay the SMCCC register structure with an RSI-specific argument
layout and copy the challenge into an explicit 64-byte array. This keeps
the existing a1-a8 argument encoding while giving the copy a correctly
sized destination object.

[1]
memcpy: detected field-spanning write (size 64) of single field "&regs.a1" at ./arch/arm64/include/asm/rsi_cmds.h:119 (size 8)
WARNING: ./arch/arm64/include/asm/rsi_cmds.h:119 at rsi_attestation_token_init+0xdc/0xf8 [arm_cca_guest], CPU#0: cat/3314

Fixes: b880a80011f5 ("arm64: rsi: Add RSI definitions")
Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 arch/arm64/include/asm/rsi_cmds.h | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
index 2c8763876dfb..c1fab41f671e 100644
--- a/arch/arm64/include/asm/rsi_cmds.h
+++ b/arch/arm64/include/asm/rsi_cmds.h
@@ -88,6 +88,14 @@ static inline long rsi_set_addr_range_state(phys_addr_t start,
 	return res.a0;
 }
 
+#define RSI_ATTEST_CHALLENGE_MIN_SIZE	32
+#define RSI_ATTEST_CHALLENGE_MAX_SIZE	64
+
+struct rsi_attestation_token_init_args {
+	unsigned long fid;
+	u8 challenge[RSI_ATTEST_CHALLENGE_MAX_SIZE];
+};
+
 /**
  * rsi_attestation_token_init - Initialise the operation to retrieve an
  * attestation token.
@@ -109,18 +117,21 @@ static inline long rsi_set_addr_range_state(phys_addr_t start,
 static inline long
 rsi_attestation_token_init(const u8 *challenge, unsigned long size)
 {
-	struct arm_smccc_1_2_regs regs = { 0 };
+	union {
+		struct arm_smccc_1_2_regs regs;
+		struct rsi_attestation_token_init_args init;
+	} args = { 0 };
 
-	/* The challenge must be at least 32bytes and at most 64bytes */
-	if (!challenge || size < 32 || size > 64)
+	if (!challenge || size < RSI_ATTEST_CHALLENGE_MIN_SIZE ||
+	    size > RSI_ATTEST_CHALLENGE_MAX_SIZE)
 		return -EINVAL;
 
-	regs.a0 = SMC_RSI_ATTESTATION_TOKEN_INIT;
-	memcpy(&regs.a1, challenge, size);
-	arm_smccc_1_2_smc(&regs, &regs);
+	args.init.fid = SMC_RSI_ATTESTATION_TOKEN_INIT;
+	memcpy(args.init.challenge, challenge, size);
+	arm_smccc_1_2_smc(&args.regs, &args.regs);
 
-	if (regs.a0 == RSI_SUCCESS)
-		return regs.a1;
+	if (args.regs.a0 == RSI_SUCCESS)
+		return args.regs.a1;
 
 	return -EINVAL;
 }
-- 
2.43.0


