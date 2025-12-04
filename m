Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEFBD1D89F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73LQXRexns6qFwaoPcD4bDG2MWMt2e16tCwRaKo1ZGk=; b=ykHDWUa5+ZX2w5LLwbVmn3EowH
	N+W3zA8+pbMkaDeYRuP7zYtds24K3Uei3dJ2lAiRIQxXmaGQ4sXWVXeCJnsP/NiiT3bgJZ5gRgYod
	Y6+T4gmNBDYFvaDB+b8kq3drBQaU75y953HhdQopMXXI6KJB4LJa6dg0tRQMcxNIsFuJnw+Rtdvxe
	Hi4JDNldr/bB/dpFKvREl8XSB2XK98n8I5LDhdcMYUOjtHNRpqkpKkNqZggqUttGN0FBJc1pXfNJ5
	oM8jOaMzGYnLzef58xCwPjkiyHE02SasUAHJ3KGbVLO4FT3+hdkY1ESq+5ZNFbzqXG87oPbSIC43d
	faAOBWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5x3-00000007mtD-2Xxu;
	Thu, 04 Dec 2025 09:48:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5wz-00000007moz-2aGz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:48:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46F7743D7C;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A57FC4CEFB;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841717;
	bh=jke8sLY83eQqm9PthdlrVbBxAMjnY6wssHXk/JP7Z9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vx3gfLtQR+WCHsQb+uksfJOcJFVHj6hhgrdUz8qrkty0aWlkYOItaI0c2Wr/dYgn0
	 vpyS3QAAlKQ0ekc3ELWeCxZzC8wdhCGCD4+GhgFHpOb+gRZ2dHBK+KpAFXsovuDxPm
	 0KvUIzllBm1oMzvko2lxdn/mmOqr4pKBppEOMDUeD7WhUt/Bgz52Uf5Utlw8M82mic
	 D1j2zdfZqomV/nDzisn9pweTjetcGTbfAEdeI/PK0REefFP+7qP0PzL432n5V/r9KQ
	 Ja3Ax1zpxQaIINObhojE6sYbgYd2FUSuxygWd7IrbFt2WVePthryIqH8Ijy2cEI1JO
	 yY5BDJaWz3zFw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vR5wx-0000000AP90-1Dzo;
	Thu, 04 Dec 2025 09:48:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v3 5/9] KVM: arm64: Handle CSSIDR2_EL1 and SMIDR_EL1 in a generic way
Date: Thu,  4 Dec 2025 09:48:02 +0000
Message-ID: <20251204094806.3846619-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204094806.3846619-1-maz@kernel.org>
References: <20251204094806.3846619-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_014837_993227_0DF02015 
X-CRM114-Status: GOOD (  10.59  )
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

Now that we can handle ID registers using the FEAT_IDST infrastrcuture,
get rid of the handling of CSSIDR2_EL1 and SMIDR_EL1.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ec3fbe0b8d525..ae1e72df1ed45 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3399,8 +3399,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
 	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
-	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
-	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
 	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	ID_FILTERED(CTR_EL0, ctr_el0,
-- 
2.47.3


