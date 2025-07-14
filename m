Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8241BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HioU1j0pcATHhxvHbzO0nco8eJLGemwPnCQ7w9KnCl0=; b=1S+U5SmrQFY9F8heMVeJiF0zXX
	9EsYO6BvmPz+Ukkoncolv8k6FEbO6ccudYOhqjalQoFS5Qy77yTzNb1WZ/cP+aXdseA9XFLFG3a78
	IKReYzWJFiZi2oyCS+hEjqRehVGuAmc3gkCnXmo/nyVjvfE7pht1w8OK088flt8Hf0PYRuMWMHHn1
	pXfO4gUjOOaCyU/+J4I0DnLrNN4k6CFfsnD5QgwWXmTvbQTTjgWk8BUjL3FXP1znp4VDoEeymPUPJ
	YfmVa7Fmd2C3Zqg8ac/g+Lct2xAN/X03HdGvbuLs8TqGURGGdI0ZWPSxg7BsGEzLploI4Slir6Otk
	CJwLOcPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMGF-00000002rWB-2ceX;
	Mon, 14 Jul 2025 16:42:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKS3-00000002W79-0uvr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 14:46:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74AD161457;
	Mon, 14 Jul 2025 14:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2895EC4CEED;
	Mon, 14 Jul 2025 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752504402;
	bh=46x8HtFBUnGgwM/Z0aa5GTGEbN7erQRVBDxKEEPldCA=;
	h=From:To:Cc:Subject:Date:From;
	b=Svq06I1LRxtov0m0O9l5uudGQQs1fchCE9hDZXIvsqIhBpM94YPNTeplYJvFJ5jw6
	 plh//FX/P7g+ue6U0yXupde0hnxHl9jOquJqhUGKkjy7jez7eynrVq60bNE2wlJLEj
	 /GY4y8f3jKgqsQ/GuONpeRM9tgGzF1sEYY7qyeUfl+IcZjvWbEMyY+z5GXP8HXFAGu
	 K7Zrjki8Ox+ieXkvfT7F32qqaMqYjt4Q0fKiqloW86UMdLJLiPUsUNQDBrzdRAarKx
	 LtJxrOvq5lpRZ1GbYbfabZB++pg5TlFKVq+1KgXVNqwu6i626ZpF5PjO5ILEyu0CFT
	 Bth9arRE6b2ag==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubKRz-00FYqi-Sk;
	Mon, 14 Jul 2025 15:46:39 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com
Subject: [PATCH] KVM: arm64: Clear pending exception state before injecting a new one
Date: Mon, 14 Jul 2025 15:46:36 +0100
Message-Id: <20250714144636.3569479-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com
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

Repeatedly injecting an exception from userspace without running
the vcpu between calls results in a nasty warning, as we're not
really keen on losing already pending exceptions.

But this precaution doesn't really apply to userspace, who can
do whatever it wants (within reason). So let's simply clear any
previous exception state before injecting a new one.

Note that this is done unconditionally, even if the injection
ultimately fails.

Reported-by: syzbot+4e09b1432de3774b86ae@syzkaller.appspotmail.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/guest.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index e2702718d56d2..ac6b26e25e191 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -843,6 +843,8 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 	u64 esr = events->exception.serror_esr;
 	int ret = 0;
 
+	vcpu_clear_flag(vcpu, EXCEPT_MASK);
+
 	if (ext_dabt_pending)
 		ret = kvm_inject_sea_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
 
-- 
2.39.2


