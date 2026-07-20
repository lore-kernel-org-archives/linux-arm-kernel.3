Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6642AC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 05:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJV0BGKbynLh6AlkNF+I9wFJA5WzrqYIibCC+crWIrc=; b=wE8los3b1upbV2ALUbMkK9I/qh
	XGJ6oaJXkYx7IaTB++WO/Gdyduun+9KWG4HAXzH5jdK60hj987/v5fnlQmk3DOTouXOaCo0J6cPCg
	bcHttZRh+2PNMIEV/xVh00CbeKGo03zUTuFIqRyfcUKfsu5XH2s8Crb1mNxL/hLQ3X4F8enqaukPK
	1cV6sxiunvmehKtib8KLIui8ChCJjlui42t3bRMAnm4Z3umWOl1Up/l8r0vzfx3O3Q9j95Dp2NSQw
	f2SvyjWkuGim0J9YjdEuf/TWlLihHy2tnKY1CRvUev8PaRKQTieCL0Tgw8xsJX2rZqtrkik6Zg6nf
	e/b90LpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgik-00000005s1O-09Fd;
	Mon, 20 Jul 2026 05:39:18 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlgiW-00000005ruO-02NY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 05:39:07 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66K5c7or075973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Jul 2026 14:38:27 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=rJV0BGKbynLh6AlkNF+I9wFJA5WzrqYIibCC+crWIrc=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1784525908; v=1;
        b=aaJWz8Z2r8aKeqevDWxaOX1DzDQ1yUXHDWGsKzE8AMyuugf7Y+IHXQdO26GtKzXF
         nAzfzv5UgNJjPbmrzkbyfa9BgEjcCJNoA2MkCYpq9iUMlkJT/6kUZ8j7PbbYZQTl
         VJKcuD0ukMiAL9+rilKtoM85pbmwPiLbO08c4/KfKqItRIXywInZZRcOpIRiX8VU
         Ap3VR9l1jaRfG8oNq79s/OtbMdZ04tEWXVaxIApm/F+ZxzeN+TEDTkqLXJJnogus
         WVpzNszhj/VINT9zJH5QiXm90Yj5wOusRFQR9dEzHcMtmsolYQfXwHv8IfHTDoRL
         KlfIIpTNoRabJtm84xd3/Q==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 20 Jul 2026 14:38:03 +0900
Subject: [PATCH v9 09/16] arm64: errata: Require Apple IMPDEF PMUv3 traps
 on all CPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-hybrid-v9-9-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
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
        Steffen Eiden <seiden@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=0/AxsHDzqRNEUmxs91LVTqutnKtgRFxtYi0EdojCRKc=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bsFs9HDkrl4hJbU4X+CDQdKat2Y5O9JXD2MstJ9YDXD
 +qL66w7SlkYxLgYZMUUWVKKdnNrRNd+KkyIb4GZw8oEMoSBi1MAJmL3hJHhsU/xsQdRJWaiRx/v
 D9Teb7Ryn8j0m8WRjc+eFuQlG4Y8ZvhncrN889szTuo+tuLmt3cJvWisEq+T9drU0DJZxCL8hzk
 rAA==
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_223904_445962_08309FDC 
X-CRM114-Status: GOOD (  13.39  )
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
optional trap support rather than a workaround required for safe CPU
operation. A late CPU may therefore match it when the system does not.
KVM treats an IMPDEF PMU as unimplemented unless the capability was
finalized system-wide, so the additional trap support remains unused.

Fixes: bed9b8ec8c71 ("KVM: arm64: Advertise PMUv3 if IMPDEF traps are present")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kernel/cpu_errata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 1995e1198648..a5ae628204a1 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -1005,7 +1005,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
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


