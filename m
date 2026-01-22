Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDF4C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BgNLmJDbq0RNk9CkiJDVf6VhalMnHH8kRNGg/5Cp1do=; b=Oyy9+P9t+9cSDUqfmWjsIJ1Av2
	sNAk3ZO6oDbjUMWEkY/zrRh9bU1un7ErKnMYNSanG+Wl5nE+qNfSteSYogeVZv2jWOdY4WdSqNWlJ
	OGRMY07l+9gh6uDVF+sUC8SCgeUHIDwu0Kc2QaXlTMJDUB73/qOvfNqzhqTjm+bLw62saq9QMpklS
	A6T6gDNQm/H5XUAYqjwnk8qzBFHIMpVXseyp4B82RmL+6RYUgbLLNJ8kITgfji4rsDAhJez85H7s4
	29aZTa5FltSyAHxnM3tZHuCOIEB+F4c6MeQjigPWzls7bqO+uVImlI5MMHRjLNKD3U2k9iy/iNm6Y
	u7Dr391g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqQB-00000006gUZ-3TrA;
	Thu, 22 Jan 2026 08:52:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqQA-00000006gUF-3iCH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 08:52:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 032DE600CB;
	Thu, 22 Jan 2026 08:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CC6C116C6;
	Thu, 22 Jan 2026 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769071925;
	bh=7sUNNWOkM2GYuWXQM+354XXr/rWsRWU9V1EcCJXR7cU=;
	h=From:To:Cc:Subject:Date:From;
	b=gRLH/SRMvfeKTdiRyqiu7i2BQPRxYKkhBzru19BQhM9d+ZhBrCELKoPZlUk8v3SAC
	 CpMXo4lszJLE5FVzTJ07cJXfFcCzcxMZFFDm0u9EXVP38Exf0rk+8A4o58SeitwSDo
	 q/STKhbSNjgHXMhDZPf7fZ6E6/WnVWLugmg1AksiidqsP/jfnl8+rX/040OnzJY3VR
	 8EkVFTrJ+s/WJMsEwb9AELYdnmU1jW8xEqm4V+u1KjVR4zrR1LShBYPBECGE3j5Yrk
	 TFrX0lBp3+2oROkOnATDO3MM635/JjpAxjaEY8W4KR/43NhCX58L09sutp0HWd5kC0
	 UxRGDiR2N1K3A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1viqQ7-00000004byX-0v9c;
	Thu, 22 Jan 2026 08:52:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] KVM: arm64: Always populate FGT masks at boot time
Date: Thu, 22 Jan 2026 08:51:53 +0000
Message-ID: <20260122085153.535538-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, nathan@kernel.org
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

We currently only populate the FGT masks if the underlying HW does
support FEAT_FGT. However, with the addition of the RES1 support for
system registers, this results in a lot of noise at boot time, as
reported by Nathan.

That's because even if FGT isn't supported, we still check for the
attribution of the bits to particular features, and not keeping the
masks up-to-date leads to (fairly harmess) warnings.

Given that we want these checks to be enforced even if the HW doesn't
support FGT, enable the generation of FGT masks unconditionally (this
is rather cheap anyway). Only the storage of the FGT configuration is
avoided, which will save a tiny bit of memory on these machines.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Fixes: c259d763e6b0 ("KVM: arm64: Account for RES1 bits in DECLARE_FEAT_MAP() and co")
Link: https://lore.kernel.org/r/20260120211558.GA834868@ax162
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 75d49f83342a5..e5874effdf167 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2276,9 +2276,6 @@ int __init populate_nv_trap_config(void)
 	kvm_info("nv: %ld coarse grained trap handlers\n",
 		 ARRAY_SIZE(encoding_to_cgt));
 
-	if (!cpus_have_final_cap(ARM64_HAS_FGT))
-		goto check_mcb;
-
 	for (int i = 0; i < ARRAY_SIZE(encoding_to_fgt); i++) {
 		const struct encoding_to_trap_config *fgt = &encoding_to_fgt[i];
 		union trap_config tc;
@@ -2298,6 +2295,15 @@ int __init populate_nv_trap_config(void)
 			}
 
 			tc.val |= fgt->tc.val;
+
+			if (!aggregate_fgt(tc)) {
+				ret = -EINVAL;
+				print_nv_trap_error(fgt, "FGT bit is reserved", ret);
+			}
+
+			if (!cpus_have_final_cap(ARM64_HAS_FGT))
+				continue;
+
 			prev = xa_store(&sr_forward_xa, enc,
 					xa_mk_value(tc.val), GFP_KERNEL);
 
@@ -2305,11 +2311,6 @@ int __init populate_nv_trap_config(void)
 				ret = xa_err(prev);
 				print_nv_trap_error(fgt, "Failed FGT insertion", ret);
 			}
-
-			if (!aggregate_fgt(tc)) {
-				ret = -EINVAL;
-				print_nv_trap_error(fgt, "FGT bit is reserved", ret);
-			}
 		}
 	}
 
@@ -2325,7 +2326,6 @@ int __init populate_nv_trap_config(void)
 	kvm_info("nv: %ld fine grained trap handlers\n",
 		 ARRAY_SIZE(encoding_to_fgt));
 
-check_mcb:
 	for (int id = __MULTIPLE_CONTROL_BITS__; id < __COMPLEX_CONDITIONS__; id++) {
 		const enum cgt_group_id *cgids;
 
-- 
2.47.3


