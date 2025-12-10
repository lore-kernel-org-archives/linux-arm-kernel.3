Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E16D3C935
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SN8WAVIJ9+JZq91+7NrodIO2GSGcVK6uRVgvRA21kdI=; b=3L87+nJZBcBo0lMXlkzfBo2/88
	RL2MOzdimpg+3q8Q4M4SQ93wbAQUCzYJtQZKTzXpVfC6F5BQhWlySu1AghVxCSkfThBYBbCELszPe
	EmfIxKamys5FMYbPKfYOziypWIRxxxuc7kS6U2gUB0BjD0N0Ucbpomy3UW9PdeWL/SQn96QIbItUv
	zRzwOF6EkmCVgBjq5yIhUbcJnJANvJgJNVSA8JCgx/SwAKf0U8asRlYcWWGx2Hq1pLhzCxIM6yWe9
	nmXR6Cr7H5NqdI1QwaSNh2Im+5sCZcmtdHq/SL+2RXufk7kuO1+8/RnoviKIiVD24XUKn2dA65MRW
	o41F8DmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1P-0000000FhHX-23rn;
	Wed, 10 Dec 2025 17:30:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1J-0000000FhDt-2ajw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 17:30:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B52C644160;
	Wed, 10 Dec 2025 17:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7ACC116B1;
	Wed, 10 Dec 2025 17:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765387832;
	bh=UGleA0Eh9dB/KG2M5WoVKVgU7WdtqKRJeeAMH4jDpRQ=;
	h=From:To:Cc:Subject:Date:From;
	b=bDsnPyx9MXq/CMaCUHJYcIVElnM0cJf+0nKcKPQmA5bUBHAVq46sOiH4JvLi5ky1r
	 LOkM+n+M9f6dIgWAt0MPYAiZbuAc2ZUDogaSlhKzlJSrZFy3LxBM+Wc80Lhy+k/pMY
	 K/j+fDn8YtqianGX8Fmk0N/zeGkdcfLpLoqmNn4+hyEULex7ipZe4npMK2g3PBvq2X
	 pFwlFbktX1w9jQQRKUWj6TiPbe/V+/4l4ZHzRIiMwTNerBaPTZfCG8qSxBrlDzugwP
	 0QQVwmQaOzHHrb4tFetffghi6IsxI874YqI0nBHoYR1QjLJVdMnoVslNLLs4S0+pU9
	 htReOUHt36N7g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTO1G-0000000BnnB-0uzE;
	Wed, 10 Dec 2025 17:30:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: [PATCH v2 0/6] KVM: arm64: VTCR_EL2 conversion to feature dependency framework
Date: Wed, 10 Dec 2025 17:30:18 +0000
Message-ID: <20251210173024.561160-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, alexandru.elisei@arm.com, Sascha.Bischoff@arm.com, qperret@google.com, tabba@google.com, sebastianene@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_093033_685006_EA33EACF 
X-CRM114-Status: UNSURE (   8.00  )
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

This is a follow-up on my VTCR_EL2 sanitisation series, with extra
goodies, mostly as a consequence of Alexandru's patches and review.

* From [1]:

  - Added two patches fixing some FEAT_XNX issues: one dating back
    from the hVHE introduction, and the other related to the newer
    stuff in 6.19.

  - Expanded the scope of the RES1 handling in DECLARE_FEAT_MAP() to
    deal with FGTs, as we're about to get quality stuff thanks to
    GICv5.

  - Simplified the S2TGRANx detection slightly.

  - Collected RBs, with thanks

[1] https://lore.kernel.org/r/20251129144525.2609207-1-maz@kernel.org

Marc Zyngier (6):
  KVM: arm64: Fix EL2 S1 XN handling for hVHE setups
  arm64: Convert ID_AA64MMFR0_EL1.TGRAN{4,16,64}_2 to UnsignedEnum
  arm64: Convert VTCR_EL2 to sysreg infratructure
  KVM: arm64: Account for RES1 bits in DECLARE_FEAT_MAP() and co
  KVM: arm64: Convert VTCR_EL2 to config-driven sanitisation
  KVM: arm64: Honor UX/PX attributes for EL2 S1 mappings

 arch/arm64/include/asm/kvm_arm.h     | 52 ++++-----------
 arch/arm64/include/asm/kvm_host.h    |  1 +
 arch/arm64/include/asm/kvm_pgtable.h |  2 +
 arch/arm64/include/asm/sysreg.h      |  1 -
 arch/arm64/kvm/config.c              | 94 ++++++++++++++++++++++++----
 arch/arm64/kvm/emulate-nested.c      | 55 +++++++++-------
 arch/arm64/kvm/hyp/pgtable.c         | 32 +++++++---
 arch/arm64/kvm/nested.c              | 11 ++--
 arch/arm64/tools/sysreg              | 63 ++++++++++++++++++-
 9 files changed, 217 insertions(+), 94 deletions(-)

-- 
2.47.3


