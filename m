Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF00CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 04:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XvRbhAm/yfnFmldgaCcQBZ+NPrwKkILyesuk0P8fZn4=; b=yhWjBy/TfVuFaDSNaTC/Dqf/BU
	+4msPmfv2hkRAc13Jhghn4vnNGrLc0m42LfiXFyPjA4pGe+gLLUESSIEMYPDl1CmLCH4rGMUy6+6U
	RGKDfVg69Wzov+U4A3aSsyo9Avai6SjQs01/5S77r+1tgCw/7KBZTDjD+lQzfQH7tEfE7YZRly3ul
	Cb+kU0qX4nlEgBB2rPIvtTaLOPpware8czIltMHi+4T+VJq3KGvKc96Dcx3BBGDfBzmeOPH8vi0XM
	ZWsf8SIKYzUU3VasAVOx68GuHSrlHkepcn4LTs6Yd6p3isGCD99hikN7/w3cdjPuA/34pD6V4OxIz
	0xGKShJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZhap-0000000GakJ-3RRr;
	Wed, 17 Jun 2026 04:09:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZhao-0000000GajX-03rF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 04:09:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf30d530bdso52453555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 21:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781669373; x=1782274173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XvRbhAm/yfnFmldgaCcQBZ+NPrwKkILyesuk0P8fZn4=;
        b=PbZyPLMIGEHVftiBfvy7kgxnSNXBVMUDm39hxcBqLFodQPcz8cR4DfX6/2yNAQa1PT
         qyxf0oB9HGqsFhG9XQSEtNpNI2e12gLXIRe+c/Wm8j1qG8Y9EKvBZdT3QdDvToCpNfCr
         Fz4LhFSWgwYhsaeNpoITQtqKPt7LR/d5WIR7Y8IOjH04qJ3t+KN9bmit66TAepnpnGQB
         l09pwilBN+52e94iGPEgxV1knzXSSj9A4ZCE0L+qZctOrOhE0F4Ca/Lncz2npymdE7ii
         78Fqb/+4QSy6kypZuDqSZTiwrIZ5dqWXuEOAPsYsZrI9BbGuEo/WJmOx0PPffJoHG+ca
         Mbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781669373; x=1782274173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvRbhAm/yfnFmldgaCcQBZ+NPrwKkILyesuk0P8fZn4=;
        b=pJUcLq2qr7s3Z39JbqIjivthvtWZQlOBxVI6xqmTdjZCa8wgO+0gw/16u2wXzojsjg
         4ZNPlhBGTcK1AlJwA4tzSr1uQbdfLEoynVRVW5nCWIApYhp/AS6D5goWVQqJbivLDbwy
         m43IgTT+BAyd5M1UgA5xmu+abWPSBEiumTt0TJA8/KXnj48vLD/C3d2GCHDkhj+lBJP4
         pcjhpmCgSN/YmGcLwAJ4QuI7qpgpc88on0B8/JppZLaXHQ4YOFkxgjmks44jdPmAfzkO
         Kffk1iKKF7fFQ+ggOjjt9FL80uKRGjvoDIxm5KyuDGKBNCMRqis1rVV/kO4SqwfeAMaz
         hKLg==
X-Forwarded-Encrypted: i=1; AFNElJ+wXgBXFGAMuDnQ8q7LQs7n2p6K9tI3/OFFgX3S9ImTUm6+xGoV+dOU8m/mCCvb8RWWOQGL30SNGDasPBkObwFb@lists.infradead.org
X-Gm-Message-State: AOJu0YxXmtlr2oHQRdiq81V9eciFyiamscM3DQMfn74LmDPbO3K4MgAx
	cPZ0YfO5oO0eEZWIq9UnVpuSDq6KNEFENT+n5BGEYHhgtAXUFGzEFgnK
X-Gm-Gg: Acq92OHsHUztm5j9ngk2QSdHF6ho0ng7jwbp8i9znXw3o6PfUw0xpLJbcaEkzgeqcqr
	511YzaZM0KoxYODXjojRxVYYq7vfK0vryqod0D+A3ASeXZH4rvO08KycbfNYz1CvKnybesNr8rS
	5lE1t8mPpzMUVopU59PiN58WDYWPlbfN6u1ejOu1xMHswDMCVWpiGY/hhpmiLM+0MIllZyOxlXs
	ljxh3NnJSjLy8495hbWzG/qxmcwjKVTEdUM/q7WZRDBAZ66RMQL9AsQcKk2LtLRcbOnkMeEP4D5
	M0HrY1QIl9ZiVvr04VJ3Pkn5aIp3yiXC3gL/nemPZCb0eo7T3oOxeygSuduK1L53bvMwtZApYeh
	VxyDySCh/l/37MsQcLT2QBzImuMpCdGiMUIwXS6YsZrLYjcNiYuNUP28YNuk3IVCnK8yrzVxTjn
	OxR1NRgksUpRtytW2z296LJCeELH85pAqJailaG87d0xQ7xtO9on7SmQhz4K7VITsNFHkpCS4Uo
	Q==
X-Received: by 2002:a05:6a20:a111:b0:3b4:85db:1bed with SMTP id adf61e73a8af0-3b8b7fee5e5mr2481246637.45.1781669373125;
        Tue, 16 Jun 2026 21:09:33 -0700 (PDT)
Received: from SLSGDTSWING002.tail0ac356.ts.net ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm13181161b3a.45.2026.06.16.21.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:09:32 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Zhong Wang <wangzhong.c0ss4ck@bytedance.com>,
	Xuanqing Shi <shixuanqing.11@bytedance.com>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: nv: Fix SPSR_EL2 restore in kvm_hyp_handle_mops()
Date: Wed, 17 Jun 2026 12:08:21 +0800
Message-ID: <20260617040820.2194831-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_210934_052268_D396CCBD 
X-CRM114-Status: GOOD (  11.82  )
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

kvm_hyp_handle_mops() resets the single-step state machine as part of
rewinding state for a MOPS exception by modifying vcpu_cpsr() and
writing the result directly into hardware.

In the case of nested virtualization, vcpu_cpsr() is a synthetic value
such that the rest of KVM can deal with vEL2 cleanly. That means the
value requires translation before being written into hardware, which is
unfortunately missing from the MOPS handler.

Fix it by directly modifying SPSR_EL2 and avoiding the synthetic state
altogether, which will be resynchronized on the next 'full' exit back
to KVM.

Fixes: 2de451a329cf ("KVM: arm64: Add handler for MOPS exceptions")
Reported-by: Zhong Wang <wangzhong.c0ss4ck@bytedance.com>
Reported-by: Xuanqing Shi <shixuanqing.11@bytedance.com>
Link: https://lore.kernel.org/all/ajE4lHQevXNHpl1M@Air.local/
Cc: stable@vger.kernel.org
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
v2:
- Reword the changelog (Oliver Upton).
- Modify the hardware SPSR_EL2 directly instead of translating the
  synthetic vcpu_cpsr(), per review (Oliver Upton).

 arch/arm64/kvm/hyp/include/hyp/switch.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index e9b36a3b27bbc..0995e34aa3c54 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -448,16 +448,19 @@ static inline bool __populate_fault_info(struct kvm_vcpu *vcpu)
 
 static inline bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
+	u64 spsr;
+
 	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
 	arm64_mops_reset_regs(vcpu_gp_regs(vcpu), vcpu->arch.fault.esr_el2);
 	write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
 
 	/*
 	 * Finish potential single step before executing the prologue
-	 * instruction.
+	 * instruction. Modify the hardware SPSR_EL2 directly, as vcpu_cpsr()
+	 * may hold a synthetic (vEL2) value for a guest hypervisor.
 	 */
-	*vcpu_cpsr(vcpu) &= ~DBG_SPSR_SS;
-	write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
+	spsr = read_sysreg_el2(SYS_SPSR);
+	write_sysreg_el2(spsr & ~DBG_SPSR_SS, SYS_SPSR);
 
 	return true;
 }
-- 
2.43.0


