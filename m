Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BFCCA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wsw8eNDVYHVHFv7cozFqwBsubbZ5VDxQAiDppSq3nl4=; b=rV3ALfr/D7IRqern9K309Vuebd
	Vw6AwK4pvNrZvY4waAAeiTZuYe4V6GlxhKT7/PxU5BqO8CHFtMnhdjIVucIlSEA2kSqsKyva1FmAq
	S2u1HgizTJr2vqtpErB3Q/VaX3BXi/J8c86E3lOXJb6mduTjck+nf1EJY5ANkO3XCzzHDY8LqCLPR
	rARwW4exYGOxHb2ZLm3vuwFinQyjy4696xPC7Sge/Qne/TbUwllrotLR17ZlI7fHml6EKGE7UNwvR
	wNO4+c3SIzEwSdymWCZeFa1HErBhBSAgPp/xQWYqhiBKfHWcc+kPpnTI4nvENmSpR9R6JXQcJSjFD
	37X8Cxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTv0-00000007oge-0pDB;
	Sat, 10 Oct 2026 10:03:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTuz-00000007ogN-08DP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:03:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 354DF60052;
	Sat, 10 Oct 2026 10:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BF81F000FF;
	Sat, 10 Oct 2026 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791626583;
	bh=Wsw8eNDVYHVHFv7cozFqwBsubbZ5VDxQAiDppSq3nl4=;
	h=From:To:Cc:Subject:Date;
	b=cDNRJnYMb+K7Tm7Lgs/QO2UwyNnakb2Uwo1y1s7L89oOEasE0B0pi+9pZpbGKATbg
	 GRIJ8mCCZioCFf9iy3mtwa2meXfOIuOAqKr5uuaKrmc0tNGxYyiBctSHnWfh5J/cfZ
	 Ke8/Uc9PtC0fetOyuIFGzaHLWuxDlOY+M228Aql6r9fJnzGOYGqd9UVk3Y7jsuXiJ2
	 kcxszRxp/AahGZTuTvLlrUglrvN+m8Ftp5ibuP7JzFWtyvXavbOB4X06lnPWSNx6XX
	 bQJbAegYvq6cmYBYJY0OHi4JNTfi0rv3xo68oPBR3KXBaZTb2znnLlpuLSdYxzSCBe
	 JArEysnLD8FtQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: smccc: Pass only the required device probe arguments
Date: Sat, 10 Oct 2026 15:32:49 +0530
Message-ID: <20261010100249.643327-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The device probe passes zeroes for all seven argument registers to
arm_smccc_1_1_invoke(). On ARM32 Thumb-2, this binds an input to r7 and
GCC 8.5 reports "r7 cannot be used in asm here".

The current smccc_devices entries need at most one argument after the
function ID: TRNG_VERSION has none and RSI_ABI_VERSION takes a requested
version. Pass zero for that argument and omit the unused arguments,
avoiding the r7 constraint. Check argument requirements when adding new
probe functions to smccc_devices.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Fixes: d8263a131bb0 ("firmware: hwrng: arm_smccc_trng: Register as an SMCCC device")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610070641.B8hxBJcf-lkp@intel.com/
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/smccc/smccc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 07b864ff079d..377d2cda2b6e 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -122,8 +122,7 @@ static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smcc
 	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
 		return false;
 
-	arm_smccc_1_1_invoke(smccc_dev->func_id,
-			     0, 0, 0, 0, 0, 0, 0, &res);
+	arm_smccc_1_1_invoke(smccc_dev->func_id, 0, &res);
 	ret = res.a0;
 
 	if (ret == SMCCC_RET_NOT_SUPPORTED)
-- 
2.43.0


