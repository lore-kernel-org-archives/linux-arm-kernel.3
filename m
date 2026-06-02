Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637CDCD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzl6t0t3qxJibjJvjA0dSccYkRiILP6ZySVO4tCSiAg=; b=fV7sYkTRobBIAk+icyeA1mQYyi
	61rsd+ykRCUczMQSDyuX7v9A8WAmsPB3ZwjVdrgRxmBxzL+zCP+UTLbJKajI00hTkjjP7sclwTHIf
	A5WJbiCGJkJ1fX6tP8+5ErdNtqXc1SdUSRxKNNdb7xroqbuCPw7KLvCGhjr0XZyX/hPlEnwhXCXCB
	WSHradg1jk17R4nxogcml+DAyjx7dyz9BJ1yWKswT6DWYNIICzkNjQ1yv8OXe3wlHPXMdCVNTKK/J
	8DqQHtkYjk4jYrH0VN8umUxXg7UXiPO7aTQmV/N95hH9SfkkT1vTJn6i58LE/FTkvUuqNMOppX/HV
	vwAEkKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURS2-0000000DNB4-1tW6;
	Tue, 02 Jun 2026 15:54:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURRy-0000000DN8k-3rVn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:54:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5716F42A50;
	Tue,  2 Jun 2026 15:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396F31F00899;
	Tue,  2 Jun 2026 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415682;
	bh=lzl6t0t3qxJibjJvjA0dSccYkRiILP6ZySVO4tCSiAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gUv8EgRwvEG6JaKaDfOvjN0ue2cl04+4oQ6798Nb6yLtUbBeeWtFrmdDiJaHP2wE8
	 csahU2BiCLpOhGUWbK7y4sTZtaOevOQCpsVOq4nX5IwriXwdCdxb3ia8rvsBRHBH4S
	 wyFxzF6bQu861yZpjOlt+nxuoj73zVlKc4M8WDp89jiJpM0LaOqvOAMuwGhxjde4t7
	 yLKZA9t4QfbaF8RpX0go5dPA9BS4xMWuQJmlPcF0TMACBfy6StwlXjkm5B8vE3ducZ
	 3JKSwmg9hHej8kz9Uuno16hAUggsZXz6R1KsDmla7wRNjzwz9jUVVj0AGkWkN6TDWL
	 ir8y5e8uwD9hw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wURRw-00000008fVv-213V;
	Tue, 02 Jun 2026 15:54:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 3/3] arm64: cpufeature: Expose ID_AA64ISAR2_EL1.ATS1A to KVM
Date: Tue,  2 Jun 2026 16:54:29 +0100
Message-ID: <20260602155430.2088142-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260602155430.2088142-1-maz@kernel.org>
References: <20260602155430.2088142-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_085442_982917_280EAFE6 
X-CRM114-Status: GOOD (  10.35  )
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

KVM needs to know if the HW implements FEAT_ATS1A in order to correctly
sanitise HFGITR_EL2.ATS1E1A, which otherwise defaults to RES0 and
AT S1E1A traps are handled as UNDEF.

Solves this by exposing ID_AA64ISAR2_EL1.ATS1A to the rest of the kernel.

Fixes: ff987ffc0c18c ("KVM: arm64: nv: Add support for FEAT_ATS1A")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6d53bb15cf7bb..62b0d77217eeb 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -266,6 +266,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_ATS1A_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_LUT_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_CSSC_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_EL1_RPRFM_SHIFT, 4, 0),
-- 
2.47.3


