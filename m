Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500AEC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eJub+mGGiYdkbQXYfxsVVIMwMN7QR8SpPjqrcFwaE7g=; b=hT2ihEWtUt6YMVcJwJXLz7XaUm
	7gwbkT2sgCNP1yplc+HxA83xk2iuaX75EIAAvvQeUDuGTUmn2SemvQeH/BfGGATqiq3ctX6a2qBzE
	2wQ1/l9hV/csa2nFY3R0HM7a2MWntj/ak73wMGCGDepv1vr/ohsF94bQLjkcTzNDSGwwnTbGGNWc3
	p/nCUSSvP4fEGzDPvh/12IdhXOI5bMEFjWIGHzVOJztYhMd9QDrPl+F0zizDZ6Kxf9wejhqc+8nLD
	qB8SVuBRW600lcJgBIQzHY+Wr7EyyvzK/8EbUH8K+a+iFd62X0c8rLY2bN/JfE1rc90dmRLjS5nEH
	olQVf+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukkzJ-00000004aw3-3nBX;
	Sat, 09 Aug 2025 14:56:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukkrz-00000004aRN-2LQH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 14:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0208543440;
	Sat,  9 Aug 2025 14:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4289C4CEE7;
	Sat,  9 Aug 2025 14:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754750904;
	bh=ayYRoVh3IEbMODwTo+7JYB0k+fZAZLFDAILg4fANdeY=;
	h=From:To:Cc:Subject:Date:From;
	b=S7sBDTKWw38EAvtne+UzBTjTVX31Ov0UGyRLZR5w/dHd1NPJsBHtA/isfApAIQTFh
	 RgVSMe+bE554JP6Bv6+SDLXrxOMelS39b/mKnRLPiVUhueWvXywAkXQ7CtiJCv2RMs
	 XuJk8u14RbfNPkfmvR60gvRjRkB8y/f4O2mVZ8orRQqM2O7EmduLP8p+EMJVh1udwP
	 OGHdKtFPhoaPMrcp7c9U/jjHdQuPZ3b6R1+tbF2HSsZcnDxXjFwP9FHV2S7SVGDDxe
	 vyz2so7n4bvmIGyY+PScbckhuJYUfPyOmwY4Q02tKcij/ykZ56ocbAxzzXhrxVi3Br
	 XmjWPHD9wU/pw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ukkrm-005eZC-Nq;
	Sat, 09 Aug 2025 15:48:14 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/2] KVM: arm64: AT + SR accessor fixes
Date: Sat,  9 Aug 2025 15:48:09 +0100
Message-Id: <20250809144811.2314038-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, volodymyr_babchuk@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_074827_619879_C8283796 
X-CRM114-Status: GOOD (  10.76  )
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

Volodymyr having reported[1] a couple of rather interesting bugs while
running Xen under KVM, here's a couple of patches to plug these
issues:

- a fix for ATS12 stopping the walk at S1 under the wrong conditions

- a much larger fix for the vcpu_{read,write}_sys_reg() accessors,
  fixing the fate of TPIDR*_EL{0,1} and PAR_EL1, and overall becoming
  much easier to work with

The latter is a pretty large change, but is worth it IMO as it makes
everything much more straightforward.

Volodymyr, I'd very much welcome your feedback on those, as despite my
best effort, I didn't manage to even boot Debian's packaging of Xen
(Grub just refuses to run *anything* after Xen being installed -- I
guess it's not tested at all).

[1] https://lore.kernel.org/r/20250806141707.3479194-1-volodymyr_babchuk@epam.com

Marc Zyngier (2):
  KVM: arm64: nv: Fix ATS12 handling of single-stage translation
  KVM: arm64: Fix vcpu_{read,write}_sys_reg() accessors

 arch/arm64/include/asm/kvm_host.h |   4 +-
 arch/arm64/kvm/at.c               |   6 +-
 arch/arm64/kvm/sys_regs.c         | 243 +++++++++++++++---------------
 3 files changed, 130 insertions(+), 123 deletions(-)

-- 
2.39.2


