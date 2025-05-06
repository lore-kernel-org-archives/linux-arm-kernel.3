Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A3FC3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnIdEjWLp5zfx2mnOtVWfisvQ/W3Lh5kZvsLnHeSQ5o=; b=mhm9RtaVYMk/hM4BiEsZHNO005
	CQknu4MV8Z1Ziyml2atNvTe3wqGDIfkKdI+PPl/HqY8+GV/nj/9dibu3UFRN56u2ftWAaz26/l9cN
	BEJEXuL99P/bcaPtjns0mdwGNQu94VwrudMEIedkODDP+/AlLvzgNTqfyoVo5jT+ecJScZmslMALh
	FsvH9GZFRKC2wDaTPpgyQciGMmZLPdp/iGwXZ5Gak1G7Abp3ld7RD16F9J4IcAsODbIeUkh1qsxkQ
	Rdb0ZmHbAlz7l8aAofQglcMEd+cw8y6yJ06NTE+0fv4DXjxXjWxmZAUL3yUKQuT+AogIn7DiwpKnN
	Wh8AnUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgm-0000000DWTr-3i9i;
	Tue, 06 May 2025 22:23:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOv-0000000CiM1-0fP4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F6F75C58F1;
	Tue,  6 May 2025 16:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65002C4CEF1;
	Tue,  6 May 2025 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549852;
	bh=4gVu6PuCEYwqR8T4hiE7L+z2SsXJBvzsxceLEkn+bGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbT1vkHtonjtWVfetsIP4h+6PJL1Sq3gBgSZ+jvaGg5Mwt64UTix2hgBNLe7dp82A
	 L+F2md7wbd8NqONehEXmUlG2qcBZjHHCK3fk6f4wpSDRc3TPXNp6Bi/vYX0OUa+sJr
	 bgKV6t6NT2WKjEvpQB2a8XT0dXZVMSI8Nwnl24c+MOFmG6Bd63YSp7YukHqtRwKqbn
	 qXbF/42PJQsP8EdDf9gM+MFYazU2k2fBQV9vDn+ZR+RZZjchYRnxGIOYCMtZsBcotf
	 K1o3xfYnjT/AvKdREhNjXIaj9Dg8wuoUwlVYaBb04Olj73o+5nJBN9wTML4AFj5Mma
	 of9hmY6BCb4/Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOs-00CJkN-Kl;
	Tue, 06 May 2025 17:44:10 +0100
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 20/43] KVM: arm64: Don't treat HCRX_EL2 as a FGT register
Date: Tue,  6 May 2025 17:43:25 +0100
Message-Id: <20250506164348.346001-21-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094413_248589_2BDE6310 
X-CRM114-Status: GOOD (  11.61  )
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

Treating HCRX_EL2 as yet another FGT register seems excessive, and
gets in a way of further improvements. It is actually simpler to
just be explicit about the masking, so just to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 3150e42d79341..027d05f308f75 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -261,12 +261,9 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
 		u64 hcrx = vcpu->arch.hcrx_el2;
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
-			u64 clr = 0, set = 0;
-
-			compute_clr_set(vcpu, HCRX_EL2, clr, set);
-
-			hcrx |= set;
-			hcrx &= ~clr;
+			u64 val = __vcpu_sys_reg(vcpu, HCRX_EL2);
+			hcrx |= val & __HCRX_EL2_MASK;
+			hcrx &= ~(~val & __HCRX_EL2_nMASK);
 		}
 
 		write_sysreg_s(hcrx, SYS_HCRX_EL2);
-- 
2.39.2


