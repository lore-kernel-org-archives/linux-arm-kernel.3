Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4F8C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5E3S5wzjQZPQcPZwG9WQNUEJeT1MUbUa+eHNNdRQlk=; b=BDgpxqAgEW0G4zN3lxWy5/Banf
	Kck2+G2eqh8HCjIyDJtNsKEZEAbipzSbSleEpuL2YPM6zHLhttWiBFoMi6M9l2yi914JMXDeNYTjn
	vR3pEU+XYnKPTYeFX3c9yb/wrhZoziDvEz22EjIQKb1smRRWXhHHtfPjVur+tfqWmUyJu+GjF95l3
	Bmo1kMmggySQS+mKw4YP2Fe0zIzFqqExib/+eOhRoQYB5pJbbMnbFu4t156ygDeyQaRFX/UXgQBQZ
	5vDNWXwZsSR7MXVa1nNXLSeGIqJKh+y3jVExxDkPC5sbgdnKqz18fsZXa9BTNfGWdseymaaInaKpQ
	8mteN79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655Q-00000003Lcx-36r2;
	Mon, 14 Sep 2026 11:43:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x655D-00000003LME-18yv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 11:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=J5E3S5wzjQZPQcPZwG9WQNUEJeT1MUbUa+eHNNdRQlk=; b=Kl2sxPy39dM0Ed7wnc0yhCPUAF
	Pu/gOa8/O3ie5u0kXN4Ld6dSlnrJBlFwMv0gGVIl0YOZuCL9+G97bW0ikUxY573VNvwTcziSCS+XV
	Ix9DP72Jsy7Pji/hOPKob/XmhbnFfEO4X78V+yCgxR8UyViiuEu4SmCzDcUlklxVnF4RP6uuUf+KI
	IIpdhZY8M+bC+GhVk5WiASFBR0rpG3YUC6WGAWBQvhYzFTwThuxFZkINAYlxqoBAE6q0dj9krUPyi
	9FnuODdUydZAiTSbWHfho4OUGPdeMJqcxk3fYdcHnV2noU7+TbugFrymHXBr+sg6XLCtzs3eev/3a
	VIBgStOA==;
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x655A-00000005YDm-0Ihr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:42:46 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68EBfjsF084060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 14 Sep 2026 20:41:55 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=J5E3S5wzjQZPQcPZwG9WQNUEJeT1MUbUa+eHNNdRQlk=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789386116; v=1;
        b=PtsKHTN2V8NNuAw1rIdDWFKG1yL60G85AzkD8xemEJNKjTCgC0SzMizShw637gyC
         LbPT0NTxe9cEPNCymx2P33Ctt44ItTTQB2Do4Zt3UBhK1EoH1fqk0eyEEK4FNhVL
         M8jfrO9E/eFPOHXit5OKS7GK2PB2B2596pC8bYTCntdS3vwEfFjZlbUnwX9+cskL
         dl2FOrk+LVDzoPcLH7rWCdcrWaNlUpKlc0vGOWU/vwxsLWgBa0+dPhHEWwiCt5rz
         4RkAUeGnLKXwqDRpr8ZH4vBbD0lH1ZYdEFL81oQjmrQ5Lr9FnwQSRSROxv6sf9bQ
         lebBnv8JQkgAd0Vre1Us6w==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 14 Sep 2026 20:40:52 +0900
Subject: [PATCH v10 13/20] arm64: errata: Require Apple IMPDEF PMUv3 traps
 on all CPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-hybrid-v10-13-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
References: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914-hybrid-v10-0-92788053a691@rsg.ci.i.u-tokyo.ac.jp>
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
        Steffen Eiden <seiden@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Andrew Jones <drjones@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
        Fuad Tabba <fuad.tabba@linux.dev>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=GZptWV53eKd3XykurHHePIoGgjkvW4Yf7ho1CKj455U=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9byu8Wb2xZ8eOb+7Ifg+UniJiwr41V6Ptiuf+hszFL2i
 N1M8tTcjlIWBjEuBlkxRZaUot3cGtG1nwoT4ltg5rAygQxh4OIUgIn8yGH4768n+P3q+aZYVc9q
 s/fz53bx9sfmHLqr9WOmT8/K4uI9hxn+CtUeY+C+zFb57K5kKRfro6Sndc27bi2bXiJi8GLR2UV
 xnAA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_124244_736386_723BE173 
X-CRM114-Status: GOOD (  14.44  )
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
index 78e4e105f6ab..9b2d9d0f1738 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -1012,7 +1012,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
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


