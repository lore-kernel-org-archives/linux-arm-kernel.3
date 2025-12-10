Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87F4D3C54B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 13:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sun4yHyP8hhyCA7P4OgJCzgZT7UtQDU/s6K2a3mZU08=; b=4SeY5bzqoI2PZt5zmwKfJGLu5B
	x5s/c0W7tR1nHrZ+kpFL45ET2l69e8SL46ID5s1AWM4j3+zSit4682xxbeSJnPJubFlVvDE1rxsmB
	wscI7JSmQ2fMI2NIe80fxL9dWwXMELRkUjceUfb+trjpQZY+0ZI/mfkTLdD5+xErzAWHcxM+H7Ow4
	74joW2DVjfeIMuhnvuL+qWGEVoosIFjYGEch1jqsp/FEqRWT0Iog7kHzmdXX6sZbQx1VMha6tH3r3
	+LnoSLeR7Ysksz4BBfbVxMIBZpreeAvPqUmTr+JjwuCNcO+edRvs5OZ2O3rJxisB6h6YglZJbTcir
	MoyCSwSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTK8C-0000000FThk-3Sky;
	Wed, 10 Dec 2025 13:21:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTK86-0000000FTgD-1KRp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 13:21:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35CCC1762;
	Wed, 10 Dec 2025 05:21:10 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF36D3F762;
	Wed, 10 Dec 2025 05:21:15 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 2/2] KVM: arm64: Remove extra argument for __pvkm_host_{share,unshare}_hyp()
Date: Wed, 10 Dec 2025 13:21:02 +0000
Message-ID: <20251210132102.137631-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210132102.137631-1-alexandru.elisei@arm.com>
References: <20251210132102.137631-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_052119_679340_CB4EA5CC 
X-CRM114-Status: UNSURE (   9.46  )
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

__pvkm_host_share_hyp() and __pkvm_host_unshare_hyp() both have one
parameter, the pfn, not two. Even though correctness isn't impacted because
the SMCCC handlers pass the first argument and ignore the second one, let's
call the functions with the proper number of arguments.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7cc964af8d30..6c6abcd8e89e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -497,7 +497,7 @@ static int share_pfn_hyp(u64 pfn)
 	this->count = 1;
 	rb_link_node(&this->node, parent, node);
 	rb_insert_color(&this->node, &hyp_shared_pfns);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn, 1);
+	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
 unlock:
 	mutex_unlock(&hyp_shared_pfns_lock);
 
-- 
2.52.0


