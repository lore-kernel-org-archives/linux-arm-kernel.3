Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE69C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fS+kysPfHXDcXz2Ort4gSCuGkTssCfrd59UZH8DCmrk=; b=ZwTcY1Exre7aHHfG04udTXHm6o
	E4eSU5sXZ3bSGVIl5OVgyDI7fk/eSAoS4ytcbECRrjXXICMrGa7m2q6aGr+3KS7k2ZUTtwKIkQn0G
	NH8eyPtN1/q4f4qOXZzXo9EXcUO5pitirv02RYLpFwVlaeJH8tVV1CpqNGJWIRNa2kVy4Ju5RHrfx
	4EDKRftXgxb12W8uuBhFz2X0dKmk7H04eLWM7rAQKBejUEr9OzdQzhxajbUL6USzm/nU9IxMjdlk5
	Dppf0fE0/5lM0fXcFKKZZcHTXc7FYSQI0KwxxCgGAy4SuQ/LFL342SVOqs25Da1oDGkdEy4hTUFyI
	ryBxZZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjJZ-0000000CTa4-0FpG;
	Fri, 18 Jul 2025 11:31:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucj0k-0000000CPBm-2EGj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71C28A57082;
	Fri, 18 Jul 2025 11:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B86C4CEF8;
	Fri, 18 Jul 2025 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752837136;
	bh=7Ipn0X7vVw04ZDLhQLIqE9uJ4GWphQGneKdbxPUSTh8=;
	h=From:To:Cc:Subject:Date:From;
	b=HJUB4OwLxY/Pj1xU7RZuTtL+UEJ3qC13FcTRSoPsgA1sR6QmuufR0Ty40PqHpz/9c
	 LwpDUBDlwyvBmXntDmn+ZxdXZnt5j5LUXV14k9EKkYZahi5Y5wiUPy8JioJkKpeCyB
	 9Et9h9s/WsRdIFSqd1HSYsV0GCUPZi8F5Mfd+3NB5R3MZLgKzyFG2GPB0EOiJuwXU9
	 kPax9y7+Ckc757MlqEiUqtoLaSSZD39v6r6Tg05Wjz9llTCkyrghNk/mWwXghfSCKt
	 NAlQVftxIj54vkD0YUEM1rxuscIm+hHC0+mxS95rSMTQWhUeSSYAE3BQ7FbOhOZVL8
	 8kqYDibD2NLjQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ucj0g-00Gt2B-By;
	Fri, 18 Jul 2025 12:12:14 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 0/4] KVM: arm64: Userspace GICv3 sysreg access fixes and testing
Date: Fri, 18 Jul 2025 12:11:50 +0100
Message-Id: <20250718111154.104029-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_041218_635622_59B4BA66 
X-CRM114-Status: GOOD (  11.04  )
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

As a follow-up to my earlier series at [1], here's a small set of
fixes to address an annoying bug that made ICH_HCR_EL2 unreachable
from userspace -- not something you'd expect.

So the first patch fixes the ordering the the sysreg table, which had
ICH_HCR_EL2 at the wrong spot. The next two ensure that we now check
for the table to be sorted (just like all the other tables). Finally,
the last patch augments the vgic_init selftest to actually check that
we can access these registers

[1] https://lore.kernel.org/r/20250714122634.3334816-1-maz@kernel.org

Marc Zyngier (4):
  KVM: arm64: vgic-v3: Fix ordering of ICH_HCR_EL2
  KVM: arm64: Clarify the check for reset callback in
    check_sysreg_table()
  KVM: arm64: Enforce the sorting of the GICv3 system register table
  KVM: arm64: selftest: vgic-v3: Add basic GICv3 sysreg userspace access
    test

 arch/arm64/kvm/sys_regs.c                     |  20 +-
 arch/arm64/kvm/vgic-sys-reg-v3.c              |   8 +-
 arch/arm64/kvm/vgic/vgic.h                    |   1 +
 tools/testing/selftests/kvm/arm64/vgic_init.c | 219 +++++++++++++++++-
 4 files changed, 237 insertions(+), 11 deletions(-)

-- 
2.39.2


