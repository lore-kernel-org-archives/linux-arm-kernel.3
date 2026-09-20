Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAA4C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xY3f7CW2k+sxURpCWyIEkta47r/Ail7h0q2vhhuON5Y=; b=xRnlLRy/KDfbhHKDE0mIRKzOj7
	UfRIIO9uKoA3mTIylxwXYmiDdfHxUhdwxXhn2LJXzlubEsmYNBIOBCLVpYYEw55nlj5ZMaRNmr9E2
	9c7Og3GmtyrZWI4w1BRq/BahbBwC+6QCKDyKX9OMXr8mXztAYnyErru25aUCzZxs0e4M29wUHiNiU
	84UkjH50pBFaND1xfeQXX23nhfEai5vbUmLI0ZzpOcO6EE7IR85fgsbRaiezSujv63mUZ21NxHHxr
	v4+8mu30OmkD8vQJLTHh70U82NKX2xnWkffN7evaMsxWHgUyD2iKVu5ClQssY7MoEaoE4iA+8VswM
	c6czykRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FcW-0000000HLr6-10Re;
	Sun, 20 Sep 2026 11:22:08 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FcP-0000000HLpF-2ucl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:22:03 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36b088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:14 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=xY3f7CW2k+sxURpCWyIEkta47r/Ail7h0q2vhhuON5Y=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902975; v=1;
        b=mInm2XTuQIO9C+YXeqfebcOFmmo0frr1Zm8g8p5z6Jq7UKBcwKjgVAAMFAfVJiUd
         xBenMftkF3iNMlA9lfJY3+/fWwDb25KsqHMCkpJxfIgzhWjYEBbHTAvPC4LvdadC
         HvvXchwGjR19oAIws8ZLHbg0Oi6lIWRSVuFi7nXBPkFJ3LuA9Ug+B8Rup7Sia7o+
         D0wcK8iqvjULQE2aTFv9oRsuQT/wCajOsPxekCfr6Hz6kwxXBQIM1SXQNu/1Abt3
         Mty7ERJ9aLaBleu2qmxKWuIyf/Lc0dLr8W57cIzhjjc5Eq71ClnHRD4nzz5BCieM
         xBbespM5NLD2jRJLBXhs9g==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:15:55 +0900
Subject: [PATCH v11 14/21] arm64: errata: Require Apple IMPDEF PMUv3 traps
 on all CPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-14-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=3wHsuhm1EOsX6FnaaZCz7S9AObKXD0J2nrSu7LVseb8=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A7lnUxVOBxxlDNxw5oBdoJXrzRyT78vT9ioa8B0NP
 PU2+VpCRykLgxgXg6yYIktK0W5ujejaT4UJ8S0wc1iZQIYwcHEKwEQ+xDP896rZWnpzyrw5Iu9n
 6q4y753/ZV/N7VDRi8oTLF7G1P8xfMXwT50rRNB9npSOKMParUeWf9G515Jh7jF7GafQ9MRvXSd
 3cAAA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_042201_958629_A1CBE9EC 
X-CRM114-Status: GOOD (  14.68  )
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

KVM relies on ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS as a system-wide
precondition for PMUv3 emulation on affected Apple CPUs. A local CPU
erratum is too weak for that: once the workaround is enabled, a late CPU
that misses it may still be onlined.

Make the workaround an all-early-CPU capability instead. The matcher is
still local because it depends on MIDR_EL1, but the capability is only
advertised if all early CPUs match. A late CPU that misses an advertised
capability is therefore rejected.

Although kept in the errata capability table, this capability describes
optional trap support, not a workaround required for safe CPU operation.
Therefore, a late CPU can safely match the capability even when the
system does not advertise it.

On these CPUs, ID_AA64DFR0_EL1.PMUVer == 0xf means the
Arm-architected PMUv3 is not implemented. Without the system
capability, KVM does not advertise PMUv3, and direct accesses to
architected PMUv3 registers remain UNDEFINED. HACR_EL2[56] only makes
those accesses trap to EL2 so KVM can emulate PMUv3; leaving it clear
does not make them access Apple's native PMU.

The native Apple PMU uses separate implementation-defined system
register encodings, which KVM independently traps with
HCR_EL2.TIDCP. Allowing a late CPU with extra HACR_EL2 trap support
therefore does not expose host PMU state to a guest.

Fixes: bed9b8ec8c71 ("KVM: arm64: Advertise PMUv3 if IMPDEF traps are present")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kernel/cpu_errata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index b33dccfafaf8..3dc598a9fdd2 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -1020,7 +1020,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 	{
 		.desc = "Apple IMPDEF PMUv3 Traps",
 		.capability = ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS,
-		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
+		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
 		.matches = has_impdef_pmuv3,
 		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
 	},

-- 
2.55.0


