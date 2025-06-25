Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D22C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+gx5ZNCMsuG+9EZ8S5YZHwkusVOhHhpz+xIEdXsfkY=; b=pEhMP4ZmnHPMIP9PlZCB8pCw/7
	bj1+0MHCvDXM/+mQSS9czHeIRfR7wn+FteCRI2QEIJIaSdZJfGu3iWmotvqG5Ww4qhfQVF/LSPchb
	0+FgjjLIwRFZRlXG2pDmkyMcbkg934ltu/cmDLcJj4JVriiX2Y9VWG6nTrm0rAiat8vsk6KRZowHn
	C3VzIVY4yhiQSZy78PGZa8XW0l/GsuzdwOQ8oj0k1b1MTVjjmOFbUA26ojTySwTxIadiH2PX95eHF
	Yg5e3Czn/f9B0sdwC8teES3eU3mz3DTI3F+tROcs8kawf9gjDMr6P8puRi0vk4085OdATEgJMekbm
	BehvmugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURqp-000000095Lz-3NZN;
	Wed, 25 Jun 2025 15:15:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOFa-00000008Sjk-0ka3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82764A52324;
	Wed, 25 Jun 2025 11:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED19CC4CEEA;
	Wed, 25 Jun 2025 11:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850709;
	bh=LDt1xNEXDV4dCIkz7nCmkUUILCzxDoXGLDJ0dFTAhvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QKAHdKb4lwsD0O70a4egcSiV4BSR70bAZ1fMAnStK5BsAbHKKBcGls+5GRFKHiSRs
	 33dZQqORAWAwNRDIDf5sa4m2zzvZQxLPXZBS9x0r04PjOXWOVyZjtF6WzAYn8oFlDr
	 9kJnhOz+qXYScqI071Zobwl1Y+Ima4y6ljJMhaM91j9mybJv5tXU2VRvCkDyVqDTco
	 uQQ+8KULaryX0DXElY4fbQ18B5+QRA+QcwvPn9wVwNAi5+Nn3HjOMzWRQpwdxuZU2O
	 Vn5/o+l4QA6SuALYFLa7+2+vXYCDBgk7HeueIAWxZyITvQ4C5GMLkw9yn7Yqg19mS6
	 TbndP0QNu38Kg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:47:57 +0100
Subject: [PATCH v6 06/28] KVM: arm64: Pay attention to FFR parameter in SVE
 save and load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-6-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LDt1xNEXDV4dCIkz7nCmkUUILCzxDoXGLDJ0dFTAhvY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9xpVM7A4Y5s7BNvaF1svD8tgLscwneMGhduz
 ayXN4iIJ26JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvcaQAKCRAk1otyXVSH
 0L56B/4lzdpMHqj4p9rkFkdVzwpE8vA4ZOrgAnR75BmaWi1o48gAT1nUy5z5W4uHFEWOlbhNIlV
 JoW/ULkTBRwXLTkWbdDsFWMxoR4ClBkkVAWnP9HXkjtY2QnAuL7SoQy6apSPhUf3dAesZswe5Fj
 d/CqU0yV9+OscSaXgIbIiV2unlFKM1KsziwzeghFoFzsVCkXB1d52EOaUjLkNkKnQcZbVVZKBUv
 LEvMJj5KjF69ItunSj4Ba5sa9+TmdOiMIDhwgPwwycUHp17nh7gx359qwJFL0sWwWSvvDtLF4Hb
 /+JSxij7xp2XibayPmVXSWwUS5bFaVwthv45NXkCAZ564aQ5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_042510_287622_523DD3FD 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

The hypervisor copies of the SVE save and load functions are prototyped
with third arguments specifying FFR should be accessed but the assembly
functions overwrite whatever is supplied to unconditionally access FFR.
Remove this and use the supplied parameter.

This has no effect currently since FFR is always present for SVE but will
be important for SME.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/fpsimd.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
index e950875e31ce..6e16cbfc5df2 100644
--- a/arch/arm64/kvm/hyp/fpsimd.S
+++ b/arch/arm64/kvm/hyp/fpsimd.S
@@ -21,13 +21,11 @@ SYM_FUNC_START(__fpsimd_restore_state)
 SYM_FUNC_END(__fpsimd_restore_state)
 
 SYM_FUNC_START(__sve_restore_state)
-	mov	x2, #1
 	sve_load 0, x1, x2, 3
 	ret
 SYM_FUNC_END(__sve_restore_state)
 
 SYM_FUNC_START(__sve_save_state)
-	mov	x2, #1
 	sve_save 0, x1, x2, 3
 	ret
 SYM_FUNC_END(__sve_save_state)

-- 
2.39.5


