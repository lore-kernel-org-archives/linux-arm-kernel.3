Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8383B1067027
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=loKJPOAk8QUFaKVtEJbVxAtm4vDH/q2/3qY/Ovs1Y7I=; b=llm4C5b8zsU1X0dBEZ0gTFdvOo
	zQsqKFDp8gl7/OJ2pMnv2pHcIsYbTYrujSMsELx6E+LjZZZOWkdO8vhAqyYGY8Svkd9T7S/yN1F+x
	96lZF0aGBdeLK2WW7NdlSjwlga7xEFBXSFTs4qpPi8FOHx5xojaG9QnrZlydv7UKa2OIKG08sDYHk
	g02VYDEKlF0zYEWxNpaBXFuCEV6pKC58t6P9n0UJaEW/cGsW58OT59/7zyMy9F1dcAAk+39oY6Ttn
	Lf8/VJxSO0SOhLe8xGyMoPF/v9n0myrvOZf6nTGbMPJOVBPkyp/Rgc2+o4C/paqpUR7T0ecpUvz96
	iAOnCjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gim-0000000EBCv-0TD1;
	Thu, 12 Mar 2026 14:09:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gij-0000000EBCP-0cXC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D3E54429A;
	Thu, 12 Mar 2026 14:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1683C4CEF7;
	Thu, 12 Mar 2026 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773324540;
	bh=TNp+UfKq5Rem+lGqK4AbfI/yFPyPpDKvIcbn9WJmW0E=;
	h=From:To:Cc:Subject:Date:From;
	b=gE00GihLUHd66Ox+eiHldi/+eQrNGTfiqcDME4tNZmECD7RCHljT84lWQsaXGmjnv
	 wej4ieeCZ7Yf96LZp4V1vjwy0V6Izj8ypNgK5TDxNcj5m93zbeDNnQ3beMnL3uvC6T
	 67jDuYdq12Ex7Dc7n/meGgYmsa8qw2ARJWF3XnmQy1z9RQk8prZORzW/N3o5XKF4Mp
	 jK/ZrKhohbnfi+8aceLO28wZ55wBBxydsXhjY0C6RkeXfX9L3JeGlIVB8w6MKdC3m8
	 3gECc2pR3beIluYm2UBNMlQ9SqTC7jweH0Gz4z71lo0rIWW3fKYMH7MCbnvF7Tdztm
	 Sxd2NLGtv2CKA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w0gif-00000001I5r-2QP2;
	Thu, 12 Mar 2026 14:08:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Discard PC update state on vcpu reset
Date: Thu, 12 Mar 2026 14:08:50 +0000
Message-ID: <20260312140850.822968-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_070901_230706_ACD9AE14 
X-CRM114-Status: GOOD (  15.08  )
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

Our vcpu reset suffers from a particularly interesting flaw, as it
does not correctly deal with state that will have an effect on the
execution flow out of reset.

Take the following completely random example, never seen in the wild
and that never resulted in a couple of sleepless nights: /s

- vcpu-A issues a PSCI_CPU_OFF using the SMC conduit

- SMC being a trapped instruction (as opposed to HVC which is always
  normally executed), we annotate the vcpu as needing to skip the
  next instruction, which is the SMC itself

- vcpu-A is now safely off

- vcpu-B issues a PSCI_CPU_ON for vcpu-A, providing a starting PC

- vcpu-A gets reset, get the new PC, and is sent on its merry way

- right at the point of entering the guest, we notice that a PC
  increment is pending (remember the earlier SMC?)

- vcpu-A skips its first instruction...

What could possibly go wrong?

Well, I'm glad you asked. For pKVM as a NV guest, that first instruction
is extremely significant, as it indicates whether the CPU is booting
or resuming. Having skipped that instruction, nothing makes any sense
anymore, and CPU hotplugging fails.

This is all caused by the decoupling of PC update from the handling
of an exception that triggers such update, making it non-obvious
what affects what when.

Fix this train wreck by discarding all the PC-affecting state on
vcpu reset.

Fixes: f5e30680616ab ("KVM: arm64: Move __adjust_pc out of line")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/reset.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 959532422d3a3..b963fd975aaca 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -247,6 +247,20 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 			kvm_vcpu_set_be(vcpu);
 
 		*vcpu_pc(vcpu) = target_pc;
+
+		/*
+		 * We may come from a state where either a PC update was
+		 * pending (SMC call resulting in PC being increpented to
+		 * skip the SMC) or a pending exception. Make sure we get
+		 * rid of all that, as this cannot be valid out of reset.
+		 *
+		 * Note that clearing the exception mask also clears PC
+		 * updates, but that's an implementation detail, and we
+		 * really want to make it explicit.
+		 */
+		vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
+		vcpu_clear_flag(vcpu, EXCEPT_MASK);
+		vcpu_clear_flag(vcpu, INCREMENT_PC);
 		vcpu_set_reg(vcpu, 0, reset_state.r0);
 	}
 
-- 
2.47.3


