Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653ADCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPD9vjA0nP5FBJHwtDiCWGoBl3NxhSu48tigs18r/Yo=; b=TO/XEVfJV/5zNhip/btkpt6Htw
	TeM9ACAmTkkJdapFWB2FyJnc5TRhnuByuUphRHIYdQBiFYbI44DJkJ4DCouLc5p1M4xs1nZwWin+D
	WDjnclpYQAXfeLibaMGzeXAIDWv4w/gShEWCtDpC3zqsqfdRyWyEZkPBBSqZdVDcgANdHPK2c0ex3
	xH5F8C4Vn64yxxTzny7ioVHwxdU6sLv9aDskRzrhxRIZTkmM0WJcZo7inbF3IkKXxXLinSReoK2ZI
	Gxc+DU0zU3Jo2/tSgrptWyIJOPsvH4yOnHzCyE3KoAR0SZwG/EEl4GbGnDyUsNnyb5LXk3KopUOoP
	4psJDsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBThx-00000002uYQ-24YT;
	Tue, 29 Sep 2026 09:01:05 +0000
Received: from out-136.mta1.migadu.com ([95.215.58.136] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBThu-00000002uWV-1wI0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:01:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Xy7APjAm9vxgY3BoNnyG8EPgyVpnG+Ucz22DNIrqlo4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790672460; v=1; x=1791277260;
 b=eYW4OymuypD3EfH8n9Dph3mgF4IIc7BivWckm2/I2/tNTJND7/3WL8lBuXXr4LTsGLg32ZXE
 RQCEFzV40GJX3Z/vCyo2NMvjV/4dgVAjSHrFacvNapV+W+860mQMhYvg2CaJFqlH/7AtjfuuyEj
 kUtvNA2aT1K0o5mFlgaxxwVQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 939f88d67d5e6d8b;
	Tue, 29 Sep 2026 09:00:59 +0000
X-Mizu-Trace-ID: 939f88d67d5e6d8b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
Date: Tue, 29 Sep 2026 10:00:28 +0100
Message-Id: <20260929090031.3829185-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260929090031.3829185-1-fuad.tabba@linux.dev>
References: <20260929090031.3829185-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_020102_804698_2735E065 
X-CRM114-Status: GOOD (  10.41  )
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

triage_sysreg_trap() applies the FGU bits through the encoding's FGT
entry in the trap xarray, and populate_nv_trap_config() only adds those
entries on a CPU with FEAT_FGT. Without it, a hidden feature that still
traps reaches its handler instead: a TLBI OS trapped through
HCR_EL2.TTLBOS lands in handle_tlbi_el1(), which expects an EL1 TLBI
only from vEL2 and WARNs before the guest gets its UNDEF. A VMM can
trigger the WARN by hiding TLBI OS and having the guest execute one.

kvm_calculate_traps() computes the FGU bits with or without FEAT_FGT,
and the entries map an encoding to its FGT bit whatever the CPU
implements. Add them unconditionally, so that a hidden feature that
traps is UNDEFINED on any CPU.

Fixes: f5a5a406b4b8b ("KVM: arm64: Propagate and handle Fine-Grained UNDEF bits")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    For a nested guest on a CPU without FGT, check_fgt_bit() now runs too,
    but it forwards nothing: a guest without FEAT_FGT has its FGT registers
    RES0.
    
    f5a5a406b4b8b added the FGU check to triage_sysreg_trap() behind an
    ARM64_HAS_FGT gate that populate_nv_trap_config() already had, so the
    check never fired without FGT.

 arch/arm64/kvm/emulate-nested.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 625604019fb32..b8529532b6e78 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2386,9 +2386,6 @@ int __init populate_nv_trap_config(void)
 				print_nv_trap_error(fgt, "FGT bit is reserved", ret);
 			}
 
-			if (!cpus_have_final_cap(ARM64_HAS_FGT))
-				continue;
-
 			prev = xa_store(&sr_forward_xa, enc,
 					xa_mk_value(tc.val), GFP_KERNEL);
 
-- 
2.39.5


