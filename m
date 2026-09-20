Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82782C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5pufUz8KL5hcXE3IG0sGufufg11jZLTck/NL8QaP+Q=; b=HkY+EwRFDg4KA690g8nY0L9NNw
	qdaPPdYDaYfYGRWSCAlSsZ8pVUWmMf8482VZ9h/wMKBxys7gAcFc/u3daPvP21VFBee9VQ3T0mXAa
	br69KLciR830fucfIgC4PVefyFNvKgn59adjevPtWTaGpKVeXwqWbidxjyayCIIJ89v3NkELSv9WT
	7PpCr8o0nRpnaSoBSW8ya/ArLs1ItI6bYmZpAM3IhN/gyMatZg02aG3G1tddcuZZAoICK3YLlmDzh
	ogovY8KA7GHVFrSPx9wgfIhks6hP1wyYSLwd/jD5PQBH+IWV0A57dngN78kv0ou7TcsslQfthgd2x
	+bkBOGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY5-0000000HKJf-2i1A;
	Sun, 20 Sep 2026 11:17:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY1-0000000HKBj-2567
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 20 Sep 2026 11:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=y5pufUz8KL5hcXE3IG0sGufufg11jZLTck/NL8QaP+Q=; b=XRNNe9id/ayCRhV7LqWmRgBdZa
	D/P9XxPXt3OUb/AeUQUctN6Frewg1QDlgNYsjhIHtC/CUJpMjJ9YzE0g4yjJtPLDpSMBb2zbJNL8z
	D4BGFDLOlkWGZo2lv0mlT+dlZwqpnbBH/obUUuFmPBlG8vNi7O36u4OTD1QV/EZw+ber8CrNwmXUv
	rW+1bqCs5cnXFMl7BtQDDFHyYXvdWK/c+mY3C2bjgqnapw815hUp7f8vLjrOJDjS4FpCuepFD6Wvm
	wLlIHlRjFshYPvNY0TrMBBfp3hzQXzOaHg4U138EdeTR+vShwNuGjUOUfiGHThpvoy3xKNJx5b6Vm
	38bLwNXg==;
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8FXv-0000000BL3M-30AL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:17:28 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36S088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:10 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=y5pufUz8KL5hcXE3IG0sGufufg11jZLTck/NL8QaP+Q=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902970; v=1;
        b=dh6UycQSH3jQEGeCBbIxmEuSSseuoMtHkMcrYs8WZ9Uit1a4JeDZLqzUn2x2hhLg
         jVsxL53QR/x6CPuanzmV2Z2IU6rSFnTQKG7g3+quKEnX9RBhtNz8koXDUR1JSVp5
         lwt8PRpBLXOYv5TRLRHpVk/7l1oAoKx/h8jo4enMOsTaOg9I92CyzFGidQBP5Efe
         XB2VcmUYtUltw1Nnonu/2JcJkH6l6isVj21i1GV/DCGtj9bgq0bqoaBDMVwkdGmv
         PmA8OF0c022gWLlcabb703SRLQUtlvq+WDAT+DcNQgzCYEBrh3oPuWOAhijuE4Ax
         RKDCSyO20c87Dvmgt+OO/Q==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:15:46 +0900
Subject: [PATCH v11 05/21] KVM: arm64: PMU: Mask EL2-reserved bits on guest
 bitmap reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-5-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=qrWSZiXd3NGTtjPsYculaMGwRl4ZEKcQtXcXafdCzEE=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A2mzvy3l7FFbOK3uPIvZ5NgboX8TJF+0xXw6bfBi5
 bUG0y6RjlIWBjEuBlkxRZaUot3cGtG1nwoT4ltg5rAygQxh4OIUgIloVzD8T0kvrXlxb/ESN/1V
 6kbsy0umtcrf/Mv7Q+ez+arnrJ0pUxn+uxSz7Fm/62ta4SHWexOD/ovXNdfeZfWtqVhqlVuunPi
 bBQA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_121726_161556_F333F8F7 
X-CRM114-Status: GOOD (  10.87  )
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

MDCR_EL2.HPMN reserves event counters for EL2. Their bits in the PMU
counter-enable, interrupt-enable, and overflow-status registers must
read as zero at lower exception levels. The guest access handlers
already mask writes, but return the raw bitmap on reads, exposing
EL2-reserved state to the nested guest.

Apply the accessible counter mask to reads in all three handlers,
covering both SET and CLR aliases. Leave the stored state and userspace
migration accesses unchanged so EL2-reserved bits remain preserved.

Fixes: 9a1c58cfefb0 ("KVM: arm64: nv: Adjust range of accessible PMCs according to HPMN")
Closes: https://sashiko.dev/#/patchset/20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp?part=6
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/sys_regs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 40927a4d4409..68339eb8a2bb 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1362,7 +1362,7 @@ static bool access_pmcnten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 
 		kvm_pmu_reprogram_counter_mask(vcpu, val);
 	} else {
-		p->regval = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
+		p->regval = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & mask;
 	}
 
 	return true;
@@ -1386,7 +1386,7 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			/* accessing PMINTENCLR_EL1 */
 			__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, ~val);
 	} else {
-		p->regval = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+		p->regval = __vcpu_sys_reg(vcpu, PMINTENSET_EL1) & mask;
 	}
 
 	return true;
@@ -1466,7 +1466,7 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			/* accessing PMOVSCLR_EL0 */
 			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, ~(p->regval & mask));
 	} else {
-		p->regval = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+		p->regval = __vcpu_sys_reg(vcpu, PMOVSSET_EL0) & mask;
 	}
 
 	return true;

-- 
2.55.0


