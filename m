Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D02CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZQIZSYOb0ApA+DpL2IrCuz9H/xu4JrLHq9yKRw2hX+E=; b=XSvAN5yAUekBcW
	i4qVAZMVX5CJlXpQRpM+8h207dpmLDZWXBsv7bVVLw6mtHOC71BTLN+mhH5wfzIFm6L4d/LepFgWq
	Hs4WQ9E1vNIyNMu3b4pM5dIWNmJcVdZc9BZa++561qZFmv00cJKkORHPPg7RBRc7KFPhF23m411XH
	CeDODvntQixTFRdl0K8peT5cO8HoYAzPelcC8tA0rpTMpDkG0vs756QfgAmmBWdQwiskkeWcpyoMG
	h3hYYpcCLvqv5ZMqCKhUxCgqDLtuIT98BAwACQiIqJzebyG8gjLnzlY+hdxXbghKermQyobPBOEAo
	QyQnuvH4kJuPj9rCElRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5E-00000003S42-3mPd;
	Fri, 16 Oct 2026 16:47:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5C-00000003S1r-24nE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:47:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 061251477;
	Fri, 16 Oct 2026 09:46:55 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.15.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 20A643F7B4;
	Fri, 16 Oct 2026 09:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169218; bh=jzfXyhgZWY/K8hOb4bp+mPrUJfuq1f+zFJZUEkvrbxA=;
	h=From:To:Cc:Subject:Date:From;
	b=I0UHDF3PVcrKkGDaysFdIopWdZow02gMy3UoPUhO8ybjCGDkdTjJ/Vx2Q4FCdadO9
	 2PS9eQB2O/no1f2Lyi0UlzOQJzJ7RWiDh9CYT+f8IE0BCFfoUkGVlbJlEgfa9EW0Aw
	 mItt2LlcWKSAdMZzuXOFisJ+zXEJ/lmzz9Yf9Lhs=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] arm64: insn: fix sysreg encodings, simplify dependent code
Date: Fri, 16 Oct 2026 17:46:44 +0100
Message-ID: <20261016164648.251258-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094702_572164_D0FE4310 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Lucas Wei <lucaswei@google.com>, Mark Brown <broonie@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

This is a follow-up to [0] which goes further than initially anticipated.
Indeed, after Vladimir's comment I checked what was going on
in more details and realized that the system register definitions had some
mistakes, were quite inconsistent and duplicated the sysreg definitions
in `arch/arm64/include/sysreg.h`.

Thus this series takes the approach of re-using the encodings we already
define and depend on, and making easier to re-use if needed.
That meant I could also clean up unecessary operations and distinctions.

This simplification _could_ be taken further by completely removing the
insn enum in favour of using the sysreg.h definitions directly,
but I figured it was useful to keep the enum for typing/argument hints.

I was unsure of how to split this series, so patch 2 and 3 could reasonably
be squashed into patch 4 if that does not make the commit too unscrutable.

Thank you in advance,
Ada

[0]: https://lore.kernel.org/r/20260928133034.243541-1-ada.coupriediaz@arm.com 

Ada Couprie Diaz (4):
  arm64: sysreg: generate TPIDR, SP and DAIF encodings
  arm64: insn: fix system register inconsistencies
  arm64: insn: operate on MSR/MRS sysreg field via defines
  arm64: insn: clean-up sysregs handling

 arch/arm64/include/asm/insn.h          | 41 ++++++++++----------------
 arch/arm64/include/asm/sysreg.h        |  8 -----
 arch/arm64/kernel/probes/decode-insn.c |  2 +-
 arch/arm64/lib/insn.c                  |  8 ++---
 arch/arm64/tools/sysreg                | 37 +++++++++++++++++++++++
 5 files changed, 57 insertions(+), 39 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.43.0


