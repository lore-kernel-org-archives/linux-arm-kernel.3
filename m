Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103A5D6392C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yQNaHXn3qCwlh8Qw2ggqUiYIkbYpQ8F4Fxqa41fVjls=; b=5EM/Bkqrm99bcrYhoK4laTaE6I
	3YBXYP1JN4dsFmpKQiFwf7iN2WHtSu45MC2DPrwUe6EdlssImilEHvV4+7lJ28qyMrTgDLnTlD0Cv
	64lQ+fuiNhYiPtg+ISuLCreKXRVRa5shrKFmZg/Dkzy5krgjQb9EQp83zCCUdktxO+VZYf10gx/im
	oVDpiH1rDLZQ4qwqafDHqB4ABJtOZQA5XoOFJtC4LSFEb4znhoMqrVlUq1dUSgbcGXGzIbk/Jbj+v
	7hdFRvpPTo6z7tpCPGi7GpRfHMNptC89NT/g6F8L4gnQ9T/BYS0uWeF/v76nuE+VkfIl+aLHAZHXD
	JyVcZpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDihV-0000000FAo0-47xf;
	Wed, 20 Nov 2024 11:16:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDigZ-0000000FAlp-46DB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 11:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46800A42FA7;
	Wed, 20 Nov 2024 11:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECD2C4CECD;
	Wed, 20 Nov 2024 11:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732101350;
	bh=y91D5lNm6Hn+KYnuzFx7xHJP7wTqgmllPYaNjCLOtWQ=;
	h=From:To:Cc:Subject:Date:From;
	b=pdgnMg/rm5GOHulqQkgg7EWKGzUG0G3SImGxkHV7Z7p1+LasS9rmM+rDBXrw4vIYC
	 5V41yRvcjk7k0rGDdaEDnmUc0lGmBcqNuPRNHWZ82WToo2+E9RxxOa6Y+OHuJzyunH
	 pgJaLgEkb14OWxndLR8OXc8UhQkqXjVQXtmCRwo3e5Q7i+DsVWRge2BmMnmtO4sl/r
	 HdamNxnYfVm7BeFyQbd/aLOqcMTs8TR3ALz4DS/BJEBZDoRVBsRiQoq80nZ0h9pn9u
	 NEs6L6oO1asFsmSg83E+wevVT6fF7HHnXb9wueb15L94Oj9xzKzrkUskwpinn/f1P2
	 71wUqcuCPQfRg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tDigW-00ES7R-2F;
	Wed, 20 Nov 2024 11:15:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] KVM: arm64: Mark set_sysreg_masks() as inline to avoid build failure
Date: Wed, 20 Nov 2024 11:15:16 +0000
Message-Id: <20241120111516.304250-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, lkp@intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_031552_076167_C0F3E553 
X-CRM114-Status: GOOD (  11.75  )
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

When compiling with CONFIG_CC_OPTIMIZE_FOR_SIZE=y, set_sysreg_masks()
fails to compile thanks to:

	BUILD_BUG_ON(!__builtin_constant_p(sr));

as the compiler doesn't identify sr as a constant, despite all the
callers passing constants.

Fix the issue by always inlining this function, which allows GCC to
do the right thing.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411201857.ZNudtGJl-lkp@intel.com/
Fixes: a0162020095e2 ("KVM: arm64: Extend masking facility to arbitrary registers")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index aeaa6017ffd89..9b36218b48def 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -951,7 +951,7 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *vcpu,
 	return v;
 }
 
-static void set_sysreg_masks(struct kvm *kvm, int sr, u64 res0, u64 res1)
+static __always_inline void set_sysreg_masks(struct kvm *kvm, int sr, u64 res0, u64 res1)
 {
 	int i = sr - __SANITISED_REG_START__;
 
-- 
2.39.2


