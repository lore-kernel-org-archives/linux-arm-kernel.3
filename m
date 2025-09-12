Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA05ACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoirEmRNwEUrLlbuDJkGBmTm8wLZlEha6GRxcibCtU0=; b=PU9deV8OJGsVajDt7qApS/Xnb8
	29IRpnY/U876tpGtukDKwYSyPYS2qhqh1a+roWgAa+zyJ+pAtA7gAViXKG+9tPsut/u/kioAmJzsL
	OvgArpJPLsA+0l0fjEWVTyBh/O6o8Ed6BN6WjsAr0zy3iBnkHtLGDv/XHPuNY/uiPAznyzRRfkB3i
	iwTtiDYCOHiuKq197shysd1K/7FD24vDt+tDbjfEvQs9FTOSjJBVFKBlooeaz2b991MigrqhUaivW
	5I9rNQRM/PiYz5Q8R/Z8cZtaCv2R9SeJAC2GBKnQkvLM0fZTZZsxLfZr6TNolJU5K5DqQ3p/o9nZU
	V7LADPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1rD-00000008qp2-1TCM;
	Fri, 12 Sep 2025 11:22:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1r8-00000008qjE-0pKg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9973460241;
	Fri, 12 Sep 2025 11:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356F2C4CEFD;
	Fri, 12 Sep 2025 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757676137;
	bh=IeBrm10npHswatwOwtRAuiaKWaoJBlDnxxV0/8Ycbl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h7U9Zx/6aHXAM+5tj6gtPPv0G2aF8WwSGMYHqWTwTkFcejHy6ZqvlTQeqkpGpMBkg
	 rEt+ZG2DqRiuxj/oVnUUkrTReuxciNyZqzHqDZHZSJmlnoahTTq3jI6kncqJpHwvLD
	 ZSrFteZwKViocvHRfODMN1DjklciUy/lO01cZfzCtCypTUxjHC4hJHSan4f2JftKW2
	 xsvUfTo9AdDmB1P5KSwFcYLXxWQMmqVxdXc3UfZp2VoNgsjs0VMcdNn9bRiRhEjfsT
	 czqAnnPYAhS4QN6gao5KI2h/fst2jI6POG0dAiR3MXU33wtNgktbyRymQbeGkvs04X
	 wwFUo0TzoNikw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 12 Sep 2025 10:25:31 +0100
Subject: [PATCH v16 5/6] KVM: arm64: Allow GCS to be enabled for guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-arm64-gcs-v16-5-6435e5ec37db@kernel.org>
References: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
In-Reply-To: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IeBrm10npHswatwOwtRAuiaKWaoJBlDnxxV0/8Ycbl8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoxAJYbjs1gu8XoeJOTzmWGxk48gJgJmlcEt1sN
 LwCLyb43WGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaMQCWAAKCRAk1otyXVSH
 0DPMB/9fvrbX2YUDNAXM4i/lFcz1NafZgkZpthkn7QrwZjcoEKj96jMloLwbl6pBdb3E5fIWVe1
 PqCU5ujWX3mUMkpgrumSskfoO7VKMqjfm5GwxEdgY9bRU35oDo2rirXZRyecfQUgqLq1DhObN+q
 ZAWp0lrURcA2PwCz0om5Plb1b9zv0b2TZZ/HkrjQaLQfXZajz+f+t1EeJcEzKqfgOHfR1zh9+dU
 fsVZNXsSdG78RUOtsHZfkDYf2iMXoIrYgHhVM977K6cZC7P/m4vpAUujBf1YnmHPZstLLKoTfZ5
 kbqadCyXSCm/NLJ8xibHuaCqiIwoi6otcOWdEwlmYk2BWidZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Now that required functionality for GCS is in place expose
ID_AA64PFR1_EL1.GCS, allowing guests to be given the feature.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/nested.c   | 7 ++++---
 arch/arm64/kvm/sys_regs.c | 2 --
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 153b3e11b115..d2d55e18c610 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1459,9 +1459,10 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 
 	case SYS_ID_AA64PFR1_EL1:
 		/* Only support BTI, SSBS, CSV2_frac */
-		val &= (ID_AA64PFR1_EL1_BT	|
-			ID_AA64PFR1_EL1_SSBS	|
-			ID_AA64PFR1_EL1_CSV2_frac);
+		val &= (ID_AA64PFR1_EL1_BT		|
+			ID_AA64PFR1_EL1_SSBS		|
+			ID_AA64PFR1_EL1_CSV2_frac	|
+			ID_AA64PFR1_EL1_GCS);
 		break;
 
 	case SYS_ID_AA64MMFR0_EL1:
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 03fb2dce0b80..60e234422064 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1616,7 +1616,6 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RNDR_trap);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_NMI);
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_GCS);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_THE);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTEX);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_PFAR);
@@ -2953,7 +2952,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				     ~(ID_AA64PFR1_EL1_PFAR |
 				       ID_AA64PFR1_EL1_MTEX |
 				       ID_AA64PFR1_EL1_THE |
-				       ID_AA64PFR1_EL1_GCS |
 				       ID_AA64PFR1_EL1_MTE_frac |
 				       ID_AA64PFR1_EL1_NMI |
 				       ID_AA64PFR1_EL1_RNDR_trap |

-- 
2.47.2


