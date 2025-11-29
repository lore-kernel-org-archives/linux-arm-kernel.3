Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1521ED116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXMBF53yK9YSDBZlyROsPetW9PLbrdJy4Myx8015LX0=; b=TgvV1Kgz9gg53lpirm7aVz+GjQ
	wMU7eP01EN8vCz79DlRM9yoEfnTMvVOpQfUh/rpngndJ8jZu6Xe01ogDEVaFyrETESHtFwLWB9aKl
	9JWmfQq8u7bw8vxkgb4IXOFnGlZUFb68ZjOF2w3V1cdczI+uBTVLt5kdBqJem+KMC0pQPBKUULTmz
	3C0LaJAGyZeMSXyibrR0jz71EMIV7FYf/HR/ZmILjde02UUnbJmYEU3sTtDhJYF3Eom8NDwXNh/IW
	z7Mu/NrAGH/b/CCDPDLhd22LT86Yey1czYbSXUXr4pKcvOv2tpyaO3KDENMuqgwlOG5witnl3HsZy
	LSG+rHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPMCc-00000001bfd-2i5e;
	Sat, 29 Nov 2025 14:45:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPMCa-00000001beU-0Uxj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 14:45:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 536C760138;
	Sat, 29 Nov 2025 14:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82BDC19422;
	Sat, 29 Nov 2025 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764427531;
	bh=7wd18g8k60VD+IMvKxA7F/pIhCbSzp+S9rWe6qyOByY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EXIHmsquwt5d5+fJ2KJCvKr0zaoPxINpzcVGW1uUA7jVuW0L+R+60h2geY23lmnkK
	 0kEms4IN+Y1trvJhO9USqjQ5oCsUbOoxzWUaxmX6sJus3JB7r6jzxBbU7SmxpZx1oT
	 orgm1NDDOdf09DUq1m0UJpmpkrePhwxN0ncEgv0pNK8mlfw+pqSUcecSZ4k3Vu6l3i
	 HdobJ+WiDkUyZJB+XkzpSDtgmymsCTlthdegZ/eC8SAjaI90wUFvhuHre3JN7fKPdK
	 5wksH3chKLhqOe74lgKcW6o90vOq0eAWU9Tnr9vkc96/zGCd/EUfgrhQkgTSXBT2kX
	 7XRpQNlfQEJCw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vPMCW-00000009HnQ-42nj;
	Sat, 29 Nov 2025 14:45:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH 3/4] KVM: arm64: Account for RES1 bits in DECLARE_FEAT_MAP()
Date: Sat, 29 Nov 2025 14:45:24 +0000
Message-ID: <20251129144525.2609207-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251129144525.2609207-1-maz@kernel.org>
References: <20251129144525.2609207-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

None of the registers we manage in the feature dependency infrastructure
so far has any RES1 bit. This is about to change, as VTCR_EL2 has
its bit 31 being RES1.

In order to not fail the consistency checks by not describing a bit,
add RES1 bits to the set of immutable bits.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 24bb3f36e9d59..a02c28d6a61c9 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -109,7 +109,8 @@ struct reg_feat_map_desc {
 #define DECLARE_FEAT_MAP(n, r, m, f)					\
 	struct reg_feat_map_desc n = {					\
 		.name			= #r,				\
-		.feat_map		= NEEDS_FEAT(~r##_RES0, f), 	\
+		.feat_map		= NEEDS_FEAT(~(r##_RES0 |	\
+						       r##_RES1), f),	\
 		.bit_feat_map		= m,				\
 		.bit_feat_map_sz	= ARRAY_SIZE(m),		\
 	}
-- 
2.47.3


