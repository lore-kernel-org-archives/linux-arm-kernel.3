Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1CDD5CCBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNs16zAa6aZ5lWLFjdAku0arlIroevdK2+3/3xkk19U=; b=wohxgKjltussq9LaMhcX57jcxq
	gMYhZKsMHzm4Lst1xLEVSdQ+B2oGCyxJS6DZrhXBcPZqjo7M2JpOTIMI7Z4b96LQ2H6C5i84UOYv8
	1b+SSFOKmYEfCzUYdtLAMctkz/wgWncMV6dFODgjm033zAvAGnzAfC1j9JQgh6izi3CfLn0Jy1rNq
	8GgBMGE0sHddVacmgeevFLI6Ri1ejlruImLTesDYKgmioEpReysUOXkhVQJiPY4lXVOaSEbynsClK
	TEQgG0CfA5UCrfGLvOAdxxTU1OLYyxoVkqi5e7l9aAnnYD4rSPrktwqCbYS5Q/ZxwAlej2fYHvbyf
	1P37UM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSL0-000000052Wu-48k1;
	Tue, 16 Dec 2025 10:31:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSKv-000000052TU-4BmA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 10:31:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16CAC153B;
	Tue, 16 Dec 2025 02:31:14 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B2B83F694;
	Tue, 16 Dec 2025 02:31:19 -0800 (PST)
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
Subject: [PATCH v3 2/4] KVM: arm64: Inject UNDEF for a register trap without accessor
Date: Tue, 16 Dec 2025 10:30:51 +0000
Message-ID: <20251216103053.47224-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216103053.47224-1-alexandru.elisei@arm.com>
References: <20251216103053.47224-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_023122_091505_A291D4C2 
X-CRM114-Status: GOOD (  10.77  )
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
abviously a bug. Instead of calling die() when that happens, let's be a
bit more helpful and print the register encoding. Also inject an
undefined instruction exception in the guest, similar to other unhandled
register accesses.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c8fd7c6a12a1..88a57ca36d96 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4668,7 +4668,10 @@ static void perform_access(struct kvm_vcpu *vcpu,
 	 * that we don't know how to handle. This certainly qualifies
 	 * as a gross bug that should be fixed right away.
 	 */
-	BUG_ON(!r->access);
+	if (!r->access) {
+		bad_trap(vcpu, params, r, "register access");
+		return;
+	}
 
 	/* Skip instruction if instructed so */
 	if (likely(r->access(vcpu, params, r)))
-- 
2.52.0


