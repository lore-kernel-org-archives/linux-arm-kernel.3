Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FC7E7DF1F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlQZfWTeHMX8gj1XMb9TxUwZFToYOfyWwsxJHi2U7LA=; b=Bp7pDa7TcU7/UsVzQ51HfXhXj9
	rNmFLOzSasK5mGBCgLTx+La53i1y/A8Z/kQlhjJuTbMas0dbFKvXDQHSdUM/RSikQPy1A5p8rE6Yo
	NudUYilqGucjw6hafANzxorOBn4KRg7/q0HdfB0969PN6gjN5HlOfKdQ1eNO/n8HzvbOyvt4Q7NXR
	b2NZ4mh9RYqf/2aPo9BoLPwyqPXCpvX9hz+woU3wz5ZkFESUxFrMytEvamYr6wPeMK3c/2eeGgbhF
	Ji5CI7P7VSAE4EIV6At1QzrsksLnLaw2ss1CHtaKXA8NchXMe1NWpjqTc+z6GWr3ynATBY9cVgC/n
	/XBDpSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytx-00000005RGd-1adr;
	Mon, 02 Feb 2026 18:43:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytj-00000005Qzh-44u8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC8B9444A0;
	Mon,  2 Feb 2026 18:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0181C116C6;
	Mon,  2 Feb 2026 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057822;
	bh=trPuFvSUNip1Vqpex0mF17jqqh+TkzJfJK6QnHwmIbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IufLkw0J2bS/yOSDzssJUdl3Cl7IjeI86kpbZEJ3iq9PulRC/Hs64cti3oLl54+Wu
	 d2sBrz5myI1bxT7OSsYcFInFtxTFyzUts87VG/hUL5Zeqqy3j8dxk9+NT7qzwR6+0u
	 kUYYeL3F5uThCBfwoFgrSpl0RSkU9B6lgZJBW97beWafPZN92CqXF3vw9eAUi+dHbk
	 z+ubT8Gy8McjFIr9Cnl3EYyqkO9PwMZ4mZRnehID5uX2YjYbJn0aqecgn+x4voCE0w
	 NQ5btUhXDrEV1poU+qQIMVtm1orxOVKIIZmlhZnGV7i3gg6DI1+NKCdocZkQJocRpJ
	 XOncTEnvseBoQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmyth-00000007sAy-01rE;
	Mon, 02 Feb 2026 18:43:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 10/20] KVM: arm64: Simplify FIXED_VALUE handling
Date: Mon,  2 Feb 2026 18:43:19 +0000
Message-ID: <20260202184329.2724080-11-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104344_208884_D0A54AC5 
X-CRM114-Status: GOOD (  16.72  )
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

The FIXED_VALUE qualifier (mostly used for HCR_EL2) is pointlessly
complicated, as it tries to piggy-back on the previous RES0 handling
while being done in a different phase, on different data.

Instead, make it an integral part of the RESx computation, and allow
it to directly set RESx bits. This is much easier to understand.

It also paves the way for some additional changes to that will allow
the full removal of the FIXED_VALUE handling.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 66 ++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index eefd2e6a38a1f..e41c2b83bc945 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -37,7 +37,7 @@ struct reg_bits_to_feat_map {
 			s8	lo_lim;
 		};
 		bool	(*match)(struct kvm *);
-		bool	(*fval)(struct kvm *, u64 *);
+		bool	(*fval)(struct kvm *, struct resx *);
 	};
 };
 
@@ -389,14 +389,12 @@ static bool feat_vmid16(struct kvm *kvm)
 	return kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16);
 }
 
-static bool compute_hcr_e2h(struct kvm *kvm, u64 *bits)
+static bool compute_hcr_e2h(struct kvm *kvm, struct resx *bits)
 {
-	if (bits) {
-		if (kvm_has_feat(kvm, FEAT_E2H0))
-			*bits &= ~HCR_EL2_E2H;
-		else
-			*bits |= HCR_EL2_E2H;
-	}
+	if (kvm_has_feat(kvm, FEAT_E2H0))
+		bits->res0 |= HCR_EL2_E2H;
+	else
+		bits->res1 |= HCR_EL2_E2H;
 
 	return true;
 }
@@ -1280,12 +1278,11 @@ static bool idreg_feat_match(struct kvm *kvm, const struct reg_bits_to_feat_map
 	}
 }
 
-static struct resx __compute_fixed_bits(struct kvm *kvm,
-					const struct reg_bits_to_feat_map *map,
-					int map_size,
-					u64 *fixed_bits,
-					unsigned long require,
-					unsigned long exclude)
+static struct resx compute_resx_bits(struct kvm *kvm,
+				     const struct reg_bits_to_feat_map *map,
+				     int map_size,
+				     unsigned long require,
+				     unsigned long exclude)
 {
 	struct resx resx = {};
 
@@ -1298,14 +1295,18 @@ static struct resx __compute_fixed_bits(struct kvm *kvm,
 		if (map[i].flags & exclude)
 			continue;
 
-		if (map[i].flags & CALL_FUNC)
-			match = (map[i].flags & FIXED_VALUE) ?
-				map[i].fval(kvm, fixed_bits) :
-				map[i].match(kvm);
-		else
+		switch (map[i].flags & (CALL_FUNC | FIXED_VALUE)) {
+		case CALL_FUNC | FIXED_VALUE:
+			map[i].fval(kvm, &resx);
+			continue;
+		case CALL_FUNC:
+			match = map[i].match(kvm);
+			break;
+		default:
 			match = idreg_feat_match(kvm, &map[i]);
+		}
 
-		if (!match || (map[i].flags & FIXED_VALUE)) {
+		if (!match) {
 			if (map[i].flags & AS_RES1)
  				resx.res1 |= reg_feat_map_bits(&map[i]);
 			else
@@ -1316,16 +1317,6 @@ static struct resx __compute_fixed_bits(struct kvm *kvm,
 	return resx;
 }
 
-static struct resx compute_resx_bits(struct kvm *kvm,
-				     const struct reg_bits_to_feat_map *map,
-				     int map_size,
-				     unsigned long require,
-				     unsigned long exclude)
-{
-	return __compute_fixed_bits(kvm, map, map_size, NULL,
-				    require, exclude | FIXED_VALUE);
-}
-
 static struct resx compute_reg_resx_bits(struct kvm *kvm,
 					 const struct reg_feat_map_desc *r,
 					 unsigned long require,
@@ -1366,16 +1357,6 @@ static u64 compute_fgu_bits(struct kvm *kvm, const struct reg_feat_map_desc *r)
 	return resx.res0 | resx.res1;
 }
 
-static struct resx compute_reg_fixed_bits(struct kvm *kvm,
-					  const struct reg_feat_map_desc *r,
-					  u64 *fixed_bits,
-					  unsigned long require,
-					  unsigned long exclude)
-{
-	return __compute_fixed_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
-				    fixed_bits, require | FIXED_VALUE, exclude);
-}
-
 void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 {
 	u64 val = 0;
@@ -1415,7 +1396,6 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
 
 struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 {
-	u64 fixed = 0, mask;
 	struct resx resx;
 
 	switch (reg) {
@@ -1457,10 +1437,8 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 		resx.res1 |= __HCRX_EL2_RES1;
 		break;
 	case HCR_EL2:
-		mask = compute_reg_fixed_bits(kvm, &hcr_desc, &fixed, 0, 0).res0;
 		resx = compute_reg_resx_bits(kvm, &hcr_desc, 0, 0);
-		resx.res0 |= (mask & ~fixed);
-		resx.res1 |= HCR_EL2_RES1 | (mask & fixed);
+		resx.res1 |= HCR_EL2_RES1;
 		break;
 	case SCTLR2_EL1:
 	case SCTLR2_EL2:
-- 
2.47.3


