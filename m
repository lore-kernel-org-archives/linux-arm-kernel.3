Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A85D149F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 22:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjjCMEH326B4LIDtFwwuu6AngDXjHoyjb9Jg0/u5tag=; b=vex9+aVQuuRE5tuFCLN9GXz2Wi
	jocfLZF/mtO/ZyF/dtItM6z66JkFq+3cprxBzQA8TIqPaUL7LzQgRwU+rwBhiBHxicKXZ86kH/uoJ
	sAGOCD7buWgmpTtK1edNQBIiNYJfUyD9B7H/3JVjPMiKRNt7oApk7E/Gs8bCDa31qiIGmYkaqlJc9
	48d99n4O6CpjfFW0wQJBa5PT6rxASoPqu6Y13JYhEAaMprW0gIbW5IPh28i2laFX7sv6ohG4CUalF
	ThUWD3Ouwm0OGLLB3UamoyXszFQ3duBis6oqVpzY4zG+0Du6Z+H9WHLRDw0xaVtCN0384wSXWgl25
	h/YGa7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Sbd-00000005PpN-2M3N;
	Fri, 25 Oct 2024 22:16:29 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oz7-00000004msT-06Gu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WjjCMEH326B4LIDtFwwuu6AngDXjHoyjb9Jg0/u5tag=;
	b=jSZuZMk5cy4cNE8GXAQNT/7vHsZAh7Dm7WBue7XiC5Q1fMP5x9QZoGdUFmWvcnEJD1WfzC
	jPKx4TBmEhEr8J0ktcwf1DZM+rqXuj8j6sjWP9T29K8OJ7FqbZFWmR1RKfkiNOWgjhuYh7
	l1PGly1+mmLdAZrKdvlfVV5H8gDfuyU=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v4 09/18] KVM: arm64: nv: Honor MDCR_EL2.{TPM, TPMCR} in Host EL0
Date: Fri, 25 Oct 2024 18:23:44 +0000
Message-ID: <20241025182354.3364124-10-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112429_220434_533C0348 
X-CRM114-Status: UNSURE (   8.76  )
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

TPM and TPMCR trap bits also affect Host EL0. How fun.

Mark these two trap bits as such and take advantage of the new
infrastructure for dealing w/ EL0 traps.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/emulate-nested.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index db3149379a4d..f9594296d69c 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -304,13 +304,15 @@ static const struct trap_bits coarse_trap_bits[] = {
 		.index		= MDCR_EL2,
 		.value		= MDCR_EL2_TPMCR,
 		.mask		= MDCR_EL2_TPMCR,
-		.behaviour	= BEHAVE_FORWARD_RW,
+		.behaviour	= BEHAVE_FORWARD_RW |
+				  BEHAVE_IN_HOST_EL0,
 	},
 	[CGT_MDCR_TPM] = {
 		.index		= MDCR_EL2,
 		.value		= MDCR_EL2_TPM,
 		.mask		= MDCR_EL2_TPM,
-		.behaviour	= BEHAVE_FORWARD_RW,
+		.behaviour	= BEHAVE_FORWARD_RW |
+				  BEHAVE_IN_HOST_EL0,
 	},
 	[CGT_MDCR_TDE] = {
 		.index		= MDCR_EL2,
-- 
2.47.0.163.g1226f6d8fa-goog


