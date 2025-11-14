Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D889CCE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jVViWZOYkQTqik11p3ALgrgUf3A4ENZCpUSwXTin5E=; b=qham68hwV8u3KBagts4YdFPGpe
	G4Xr3akmglrmoe+nEDh0dnXphKhC57DdFeyKJn5VvXVvbK9ann7t88Xr0LNF2ig99l3F7paR+GcIM
	zGA2XfWT1yEoSRvngBYLRYBbAP0+OOkYgP5aw9yjT2vGd9KGIjgJv2Q0vTCMdH9NGzWpyynWdevqf
	uakjg87zi7eCtysidoOLdjQg6rzvhG+ZLlFRf5qReLtWxCueW1i1GFNSkOSegnLgiM8sTRSzG31zQ
	JRtnzN2KLBpZgHQfA5Xce5B3Y/6iRsHpv/UnzFnBxYBEZFOH8En+H4cBwrtJNrv7l16vjsx20VUZU
	m3kqGOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwL9-0000000Cf9t-3pwS;
	Fri, 14 Nov 2025 16:07:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwL2-0000000Cf3l-1ajB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:07:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A0E61BC0;
	Fri, 14 Nov 2025 08:07:44 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B02873F5A1;
	Fri, 14 Nov 2025 08:07:49 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 07/35] HACK! KVM: arm64: Disable SPE virtualization if protected KVM is enabled
Date: Fri, 14 Nov 2025 16:06:48 +0000
Message-ID: <20251114160717.163230-8-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080752_467079_CBD6F920 
X-CRM114-Status: UNSURE (   7.93  )
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

For RFC only.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/spe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index cf902853750f..7e38f7d9075b 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -24,6 +24,10 @@ void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
 {
 	struct arm_spu_entry *entry;
 
+	/* TODO: pKVM support */
+	if (is_protected_kvm_enabled())
+		return;
+
 	guard(mutex)(&arm_spus_lock);
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
-- 
2.51.2


