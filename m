Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F9BEA852F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 23:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YeUR/TE5nHfHH2ms8hQ6BeHFDY8d+HSLe+DaKjNPLRY=; b=Z1X034/LYa/krCTPyGTAIl/d93
	HLNV/YCBff8aotn8YZTDaKtc155xI+9Xh05qTHRGyn/9RKjr7yAi5y9WYFv1jSutABV41wKlnb/uu
	4DiEw8wgUGFYlIy1NR0LY76cav3OoJM7mt+wj9WYdEPC8xq89yye+KwFMaL/0EMwL/JknwkTcG/0f
	504aZqriTE/KgBb/SpyBv9QmrivUIeFF6VASHjlBdDvTIF027KyQB7S/upQ9sOMw3clH4Xs5i342N
	Py/JOCU+5eyBNiamyE5FLi3gTAyaGcxHXB+rGdWrzNyoog2YPWTiLOow+G1FhykcQUEBGQo1OUtHn
	KpD0O44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNPG-00000006QiR-2V8E;
	Sun, 08 Mar 2026 23:19:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNPD-00000006Qi7-3XoW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 23:19:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84B9D1D13;
	Sun,  8 Mar 2026 16:19:19 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 211A13F5CA;
	Sun,  8 Mar 2026 16:19:24 -0700 (PDT)
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH RESEND 0/2] KVM: arm64: nv: Expose shadow page tables in debugfs
Date: Sun,  8 Mar 2026 23:18:27 +0000
Message-ID: <20260308231829.864983-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_161927_969638_EA89ADDF 
X-CRM114-Status: UNSURE (   8.44  )
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

[sorry for the resend, I generated the cover letter with the wrong
commits previously, I should automate this :P]

Hi,

This series exposes shadow page tables in debugfs to improve the
debugability and testability of NV. First we teach the KVM ptdump code
to handle different s2 mmus, then shadow page tables are exposed. This
is gated also behind CONFIG_PTDUMP_STAGE2_DEBUGFS, like the canonical
stage-2 page table.

The file names for the shadow page tables are formatted
0x<vttbr>-0x<vtcr>-s2-{en,dis}abled, which is the most intuitive way of
identifying the s2 mmus but not terribly clear. For now I don't think of
other options that are meaningfully better, any suggestion welcome.

I realized I tend to write long variable and function names, happy to
change if anyone finds it too verbose.

Thanks!


Wei-Lin Chang (2):
  KVM: arm64: ptdump: Make KVM ptdump code s2 mmu aware
  KVM: arm64: nv: Expose shadow page tables in debugfs

 arch/arm64/include/asm/kvm_host.h |  7 ++++
 arch/arm64/include/asm/kvm_mmu.h  |  4 +++
 arch/arm64/kvm/nested.c           |  6 +++-
 arch/arm64/kvm/ptdump.c           | 60 ++++++++++++++++++++++---------
 4 files changed, 60 insertions(+), 17 deletions(-)

-- 
2.43.0


