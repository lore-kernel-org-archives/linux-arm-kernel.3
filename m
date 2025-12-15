Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2258D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDnxcAlz9zKKX053n4NDdFkEoIhjBHZ6bT3iXMJ82cc=; b=iKhOCmDovq69FbtRWOw/g/LeSV
	Mw63+2eXaubdMrbujJledRO99EVtpJkTYQ1xDLlzYxOUGumizpTfQBLTjd1jcE+Q/URaY1Csx4nGY
	gvFgOyP/+WiRL83DVqZhLHb0dXdK05QU7cvulqy9sXYF/u8fSVOKBhL3LLLIwpJ881kqG7pOr2wl9
	wBAw0jRujw6l6vED4SvqI/L0+/iaVSqHzT7j+SHjT22iGmNsgOd1AV9sfq9XqUjg6TIARFWZX5ibi
	Afl2iqzFcy0oe+/UsWHS5RvOzJ0Sgqq6lc8GkvEsy2LayFxaaqbjPE+/l3ygUPhjhUwosK+gm97gU
	1HIaqrAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV70D-00000003XzC-1yX6;
	Mon, 15 Dec 2025 11:44:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV709-00000003XxM-0pUC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 11:44:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9803B1655;
	Mon, 15 Dec 2025 03:44:21 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E60133F73B;
	Mon, 15 Dec 2025 03:44:26 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	will@kernel.org,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v2 2/4] KVM: arm64: Print register encoding if there's no accessor
Date: Mon, 15 Dec 2025 11:44:07 +0000
Message-ID: <20251215114409.212512-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215114409.212512-1-alexandru.elisei@arm.com>
References: <20251215114409.212512-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034429_280056_5D6A4268 
X-CRM114-Status: GOOD (  10.99  )
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

Configuring a register trap without specifying an accessor function is
abviously a bug. Instead of calling die() when that happens, let's be a bit
more helpful and print the register encoding and kill the virtual machine
instead.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c8fd7c6a12a1..d669f6fef177 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4668,7 +4668,13 @@ static void perform_access(struct kvm_vcpu *vcpu,
 	 * that we don't know how to handle. This certainly qualifies
 	 * as a gross bug that should be fixed right away.
 	 */
-	BUG_ON(!r->access);
+	if (!r->access) {
+		KVM_BUG(1, vcpu->kvm,
+			"Unexpected access to register: { Op0(%2u), Op1(%2u), CRn(%2u), CRm(%2u), Op2(%2u) } (%s)",
+			params->Op0, params->Op1, params->CRn, params->CRm, params->Op2,
+			str_write_read(params->is_write));
+		return;
+	}
 
 	/* Skip instruction if instructed so */
 	if (likely(r->access(vcpu, params, r)))
-- 
2.52.0


