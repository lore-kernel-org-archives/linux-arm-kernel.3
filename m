Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0EFCF65EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpm8xauIvJKhgtNsCZEQW3c/YTg1JA1HrmV7d3qd0ZQ=; b=c5qp7S24Y6mUyJ2keS9lqQAf5+
	0uTjHVW0/69iNQGYZ3g7llfGMWescbtAsiJgd+dIHXizUE6NjpqWeeswcO4OQuWZBDEo2Buj37+dN
	/262A6ZYqwPmy6LxwgcGtyVOSMQtg3jb464WzKqeYDX3bnNwZwh5ZEes6qTzV03Uz6X92TQGzpL8K
	OOrE4GJtUxZSHuQE8EAkPxVoXH2QAWzgeUbRn5X7DAE0p1q/FOQ0PfS71LQtynpRH+cr3002lgu9k
	dh44cOT3zBcpxodwl42qX4BgnUbw/IarE9utYmQB4892WbryQlSQF1AWyOXjtXesbTxLgAIUETV1Q
	OXxqz4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXX-0000000CVB8-0Fz6;
	Mon, 26 Jan 2026 12:17:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXF-0000000CUuG-3ns4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BA9A444B9;
	Mon, 26 Jan 2026 12:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1E5C116C6;
	Mon, 26 Jan 2026 12:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429857;
	bh=T/aXPl0EJXP+3NGbLsvmVd6rADMrOniMqL+ixtsc2Yw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ire3hi/hUEgNatqj4helxMy+UiaMU0SN6TVGNlD/hy6TN9OPIsTAK8FLg65ALE+s0
	 9Wupdn7YI4VkdaVRehdoR1g/zqj7K0I63M7q0UOrvWSFfoPAZNXE406g/yVgTrF1tD
	 Jmc6cYuFU+i7XD6jhPaB1SZKiCstZ8ICTGyKJkN/xHVtHQHa6J4NicE2d00IRRi70H
	 Kn+yClVeJN15PZHufT60Kl6+c7AUUPB4hvVJ1BIsNN0QSz8mKZ8EBXUm+4I00USXhx
	 FCXC9uHRCs7evfhYaW5wqvhAoRj8wy6Qy0krpFj6MUU4ZStvucH7KxpVmxXSwuGABb
	 YqfAdxPYP62jA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXD-00000005hx6-1YtQ;
	Mon, 26 Jan 2026 12:17:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 16/20] KVM: arm64: Simplify handling of full register invalid constraint
Date: Mon, 26 Jan 2026 12:16:50 +0000
Message-ID: <20260126121655.1641736-17-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041738_052148_9E9D7301 
X-CRM114-Status: GOOD (  12.79  )
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

Now that we embed the RESx bits in the register description, it becomes
easier to deal with registers that are simply not valid, as their
existence is not satisfied by the configuration (SCTLR2_ELx without
FEAT_SCTLR2, for example). Such registers essentially become RES0 for
any bit that wasn't already advertised as RESx.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 28e534f2850ea..0c037742215ac 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1332,7 +1332,7 @@ struct resx compute_reg_resx_bits(struct kvm *kvm,
 				 const struct reg_feat_map_desc *r,
 				 unsigned long require, unsigned long exclude)
 {
-	struct resx resx, tmp;
+	struct resx resx;
 
 	resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
 				 require, exclude);
@@ -1342,11 +1342,14 @@ struct resx compute_reg_resx_bits(struct kvm *kvm,
 		resx.res1 |= r->feat_map.masks->res1;
 	}
 
-	tmp = compute_resx_bits(kvm, &r->feat_map, 1, require, exclude);
-
-	resx.res0 |= tmp.res0;
-	resx.res0 |= ~reg_feat_map_bits(&r->feat_map);
-	resx.res1 |= tmp.res1;
+	/*
+	 * If the register itself was not valid, all the non-RESx bits are
+	 * now considered RES0 (this matches the behaviour of registers such
+	 * as SCTLR2 and TCR2). Weed out any potential (though unlikely)
+	 * overlap with RES1 bits coming from the previous computation.
+	 */
+	resx.res0 |= compute_resx_bits(kvm, &r->feat_map, 1, require, exclude).res0;
+	resx.res1 &= ~resx.res0;
 
 	return resx;
 }
-- 
2.47.3


