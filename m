Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37E1CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vxy7PyT01yTHtRopz8wtpkXTFr/2qg3hF3A5T13CZM=; b=kT5PZ6JEQAMA9OZJR22wF7pwow
	ccc2a2jnCANqR4CzOOCIMJ1rBNRQCMaQ+h5bDnH5DdjCJAS2eH45Z7AWIFOq0Wjz/2/sPVA3vZQY7
	bLeyUrxCDEU4rlBUpxB+T24ZwBzkbJTSKZZRV9t1g9wPstH3o8ceZ7sj1dDCNXhMIQwgLut6SYcmh
	oCYys40IGXjRY6MnMseLuiWj6DV5fPP81qpzSgJtwWA2ZVeyDH1AqVmwvgARZa8AAGyy+V7ekZkm6
	302RYzhfgmvZCewxy/5i20c9tpNYzneY3HrMzOmA3npOvy2jiH/bDfu0D0mKILdSkJj5xa59IIVYb
	/wc3wObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURS1-0000000DN9s-02xM;
	Tue, 02 Jun 2026 15:54:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURRz-0000000DN8l-0MZI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:54:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 69F8B601FD;
	Tue,  2 Jun 2026 15:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA6F1F0089A;
	Tue,  2 Jun 2026 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415682;
	bh=1vxy7PyT01yTHtRopz8wtpkXTFr/2qg3hF3A5T13CZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lJnKKqIde6NubJQGVaroidOoyR7QsbRcRKFwI4xIr/td6Q4nWRFW1mEVopRx9swJg
	 6pdIVyvbCw8l1SsJnD92GI/pLynjsjV2di5bRHemooHUuyhUmxxsHvOr2qYzriC066
	 oeKD2ZgaqLySGuSJUcYynokZQixUhDhc5VLOJfS4QNhu6C9BOfXirnGYgLrFpB7ygR
	 69TOsXqX43B2ZNlWST8qrFVlNmDe9WdPPGrEgmryxI0YFbyBqAsVq0M5hhj2EczQkJ
	 3Xm+Czm/gceiN0vRphSE0iJ099hH7ffnz9sA1RIPng6XNmIjmtzYzV+PhcsEZvvwjE
	 uW3z1/y0Zuh2g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wURRw-00000008fVv-19WD;
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
Subject: [PATCH 2/3] KVM: arm64: Wire AT S1E1A in the system instruction handling table
Date: Tue,  2 Jun 2026 16:54:28 +0100
Message-ID: <20260602155430.2088142-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260602155430.2088142-1-maz@kernel.org>
References: <20260602155430.2088142-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

Despite having handling code for AT S1E1A, the instruction was
never plugged into the system instruction table, leading to an
exception being injected in the guest.

If the guest is Linux and using the __kvm_at() helper, the exception
is actually handled in the helper, and KVM continues more or less
silently by reentering the guest. Not exactly what you'd expect.

Fix this by plugging the emulation code where required.

Fixes: ff987ffc0c18c ("KVM: arm64: nv: Add support for FEAT_ATS1A")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 148fc3400ea81..753fe30d322c3 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4217,6 +4217,7 @@ static struct sys_reg_desc sys_insn_descs[] = {
 	SYS_INSN(AT_S1E0W, handle_at_s1e01),
 	SYS_INSN(AT_S1E1RP, handle_at_s1e01),
 	SYS_INSN(AT_S1E1WP, handle_at_s1e01),
+	SYS_INSN(AT_S1E1A, handle_at_s1e01),
 
 	{ SYS_DESC(SYS_DC_CSW), access_dcsw },
 	{ SYS_DESC(SYS_DC_CGSW), access_dcgsw },
-- 
2.47.3


