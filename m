Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14008C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boTYW7Qr1uJ5byyTeX0m7pj1KJouCgd0KqzHjFu1rQE=; b=Sna7o3nQi7yTxtmBKWzu/rtBe3
	/gxTEZG+i9hWhvtp/RUEDdwsi+2r2FQFJfBgU+M4Bx+Rsh7lcg/3zy2zPw/Kj/ybOBKGVVFOc2ZeK
	0HjqBsGe3HJW9kEr5ebUNcxDfhLs+KP/2bEh+AjdFxUDAc9zL328qBXmWz6ukekhiFDNMpaxZiXUI
	eR0WK7+TvM7+E6n+2gr9gK3BAsHRR4hmfVwQ6Nyruk8zGyelrOT6pL2PgGjza7Me8rpJBN+9HxiJt
	4SHjtp3oOB0stAWI7VTjzEvSjjTcxU3mFTpCNxQ9E9Ir2VrJq7s7kUfOk+MsMNKWRwiRfK3bRl7CQ
	MxByT9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMLk-00000000X4C-1EWE;
	Sat, 15 Feb 2025 17:53:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7W-00000000Uro-0Hi1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85FB8A406C4;
	Sat, 15 Feb 2025 17:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B011C4CEDF;
	Sat, 15 Feb 2025 17:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641103;
	bh=QU3/C06IpfcUbhRM6dRoR9sRaAPsFdhqwZsnX766PyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BNux1FGStfkiy1bGuwKYEIlDbu+fzRlDSlEUIX6EUwY8XpFxxwV9ftNFmJzEygCUN
	 2G+x17ykJ0Vd0215ZpYsrOos5UVKBpg/BUd7ayQJyWGvGdiWr8QrS99c1z6Ky92iWl
	 kNDZK0DstoeS1DSO51dvhnRE1F983xiB+qtcnru+nde+2bUaSzqO14PL8myijGrCnv
	 oJz4cXzcgTLVmP578gYJPcqhc/ZZquca26R0AyRIIMYXsuqQAJQ7nQp8sPPtY8Zc4x
	 MWEKUycBndDWwZDCHKFP44oB84GvfqZaTtbt0OmZkgnw1GBdQjdcWNej/UGUEMiRHk
	 FzszHTWI0WA7A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7R-004Pqp-EP;
	Sat, 15 Feb 2025 17:38:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 06/14] KVM: arm64: Consolidate idreg reset method
Date: Sat, 15 Feb 2025 17:38:08 +0000
Message-Id: <20250215173816.3767330-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093826_245346_6E158583 
X-CRM114-Status: UNSURE (   9.90  )
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

Since all the ID_DESC() users are using kvm_read_sanitised_id_reg()
as the .reset method, consolidate all the uses into that particular
macro.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 9f10dbd26e348..b1bd1a47e7caa 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2270,14 +2270,14 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 #define ID_DESC(name)				\
 	SYS_DESC(SYS_##name),			\
 	.access	= access_id_reg,		\
-	.get_user = get_id_reg			\
+	.get_user = get_id_reg,			\
+	.reset = kvm_read_sanitised_id_reg
 
 /* sys_reg_desc initialiser for known cpufeature ID registers */
 #define ID_SANITISED(name) {			\
 	ID_DESC(name),				\
 	.set_user = set_id_reg,			\
 	.visibility = id_visibility,		\
-	.reset = kvm_read_sanitised_id_reg,	\
 	.val = 0,				\
 }
 
@@ -2286,7 +2286,6 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	ID_DESC(name),				\
 	.set_user = set_id_reg,			\
 	.visibility = aa32_id_visibility,	\
-	.reset = kvm_read_sanitised_id_reg,	\
 	.val = 0,				\
 }
 
@@ -2295,7 +2294,6 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	ID_DESC(name),				\
 	.set_user = set_id_reg,			\
 	.visibility = id_visibility,		\
-	.reset = kvm_read_sanitised_id_reg,	\
 	.val = mask,				\
 }
 
@@ -2304,7 +2302,6 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	ID_DESC(sysreg),				\
 	.set_user = set_##name,				\
 	.visibility = id_visibility,			\
-	.reset = kvm_read_sanitised_id_reg,		\
 	.val = (mask),					\
 }
 
@@ -2319,7 +2316,6 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	.get_user = get_id_reg,				\
 	.set_user = set_id_reg,				\
 	.visibility = raz_visibility,			\
-	.reset = kvm_read_sanitised_id_reg,		\
 	.val = 0,					\
 }
 
@@ -2332,7 +2328,6 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	ID_DESC(name),				\
 	.set_user = set_id_reg,			\
 	.visibility = raz_visibility,		\
-	.reset = kvm_read_sanitised_id_reg,	\
 	.val = 0,				\
 }
 
-- 
2.39.2


