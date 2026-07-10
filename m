Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA11C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJjKbNakwtm0jMT04UBxbp6wN2PKOAbYt/K0ZhCrjUc=; b=NXbP+8KcwAB4oKlyP/rg5dEYsr
	cHhenGstkDQTKnIcvgB5PpaFM8G2yo0OJQOaubE0LHRaTfXLw0ezni3yMBZ4g/ctcMyUfM5cby/0N
	HdYJLwPnUhTDwP/Sr6puq5I2k/45q3LV4pz6dLYWWSGOkLtMQKwy0bzEk49ojDr3P5lekFiKuxrO8
	hhiohYWs88VX5dh+IiwA3ug34CsgqEn1A8JWtVSDqMgKBZZVi1dTlJHMMoG7B06u38bYwKdfwy2pw
	6gsJqNQUHmKxz19ExBWzeCOKNFpKa5yKA98V2X2779wq/4yLtbXzEentbcRYUu1Y+jSyTgdlhFDU1
	/jj7xykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9D2-00000004nWL-2Mpf;
	Fri, 10 Jul 2026 11:15:56 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9Cy-00000004nSx-1p1i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:15:56 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66ABEvsI024946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jul 2026 20:15:10 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=pJjKbNakwtm0jMT04UBxbp6wN2PKOAbYt/K0ZhCrjUc=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783682110; v=1;
        b=cypq5tmgi8sW1J1vY+7FX5yhIamwUYgJ8fnr/uY3GitaU8yixH4poE4ECyVNednC
         CpQJaOhbEVn4aCzaqk4zNVeEHkOmedKuH0fSuSDr184wCx92thrc4vMugRvyuFr/
         w8Pk/BRGggqeeSD6cdoTNEIVR4xONf3EhlvO2hr0lZ4x3AbbdZ3AR9Gpp5dVOsZn
         nx/HgECEJtwZ4tx3Y7tefssdGAB7Em5FNfC5H5YOeudZ0PnlWw8WZM2gW9dE1nx1
         mAlH8CoRhbOuyt7CpOxC2wkjp/tpBX8nHzJlWUiS0FJzoOX+9w9/lkgEEDrwjo4U
         U6Ky2Ar/ayLG5jEEZiGl4A==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 10 Jul 2026 20:14:58 +0900
Subject: [PATCH v8 04/11] arm64: errata: Require Apple IMPDEF PMUv3 traps
 on all CPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-hybrid-v8-4-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
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
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=hp0lEkOwUA4Gek6D7M1hRbpbu/V7WYaGYBv95FZV7oc=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bAFbMHm2WVY578mzc1ruRV9qK3tZ7tuz6LBAXcKpZ5c
 PX4uvJbHaUsDGJcDLJiiiwpRbu5NaJrPxUmxLfAzGFlAhnCwMUpABOJtmVk+DWtN10kdo3lwx0B
 f+4c3f7++GrhIzwq9ez/du/89cbvGzMjQ8OutReeTvjbPzeOpbnvdNtddZ9Em+enI33lObbyFwY
 bsgAA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_041552_738685_E867BA5B 
X-CRM114-Status: GOOD (  13.16  )
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
advertised if all early CPUs match, and late CPUs that miss it are
rejected once the capability is enabled.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kernel/cpu_errata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 476a37c82108..14ce49d693c4 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -964,7 +964,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
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


