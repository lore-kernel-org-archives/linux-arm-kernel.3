Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A08AC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SCuqMDpuQQzx9dcXw3N6jP0KkAKpom7E/b6/DDyvjNo=; b=jWEVczRa2ag0rEIiCDUoDOnar3
	enXnDzQ7wK0jrEy76panDJPXG0zHlkBT0oDZBV3aQIdKC/NPlzwo+AeMYFYPXBbU0Nr+WGk07VcJ8
	25e1nkLr84rFSf4tSXRjkYlpBE9O3LyQMPVw9zoQ5flIRWTkblsQREcpIcE/xe+kBuV2eoUvscygg
	x6vWxV2mM6FznulIGGMhRgDoV39TUVdd5L9hlx2xSHur2AgFlezT6P+2VTSd8mFGiKa/zudnobYtz
	TFGGb6FC9U87QymV83E72SPNOkDfViJPoaYF9Gq7YH1KKlTxy9QDRTH5vcULoW2PLZDJpRZ06by/n
	Bo+qjT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98u-0000000EfBt-16BT;
	Sat, 01 Aug 2026 12:48:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98s-0000000EfAa-3hRG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:48:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F50642A5C;
	Sat,  1 Aug 2026 12:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA9C1F00ACF;
	Sat,  1 Aug 2026 12:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785588521;
	bh=SCuqMDpuQQzx9dcXw3N6jP0KkAKpom7E/b6/DDyvjNo=;
	h=From:To:Cc:Subject:Date;
	b=UO8sRV1cyWGFm1QWOzzy2YPayy1cdlEtK1rfTtHB0LAp6tHuqDATDebldH2Bgvg14
	 8BfTrIoWuFOhs61EyoyB0h9DPaUNqFC+m6kpIlkari57vc3YdReKzLuHuJlo2sos38
	 qOQtDDapFh63mx2zKQbUfT29LExDqf1XJ/z26OoVw2RMoQRIh9o/mtXc8B0V4bG979
	 wy5pu2p8+j9KvAg/oL8jhxAGY5KXdd+o/FIFfhYm+P6uR8E1D7c3HEcOsDCfQaevAB
	 LDmYKsf6jJernlKYsGKySqG005OvIXZITpGd4aoURFL0xJFnlqqti2kv/FNGlwWPwc
	 6mzgdpK2St4sQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wq98p-0000000BGK2-0lGL;
	Sat, 01 Aug 2026 12:48:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: [PATCH 0/6] KVM: arm64: VNCR TLB invalidation fixes
Date: Sat,  1 Aug 2026 13:48:12 +0100
Message-ID: <20260801124818.366274-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, imv4bel@gmail.com
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

Prompted by a patch [0] from Hyunwoo Kim which was addressing a pretty
annoying corner case, I spent some time looking at what was wrong in
our VNCR TLBI code. And there was a few things to say about it...

- The TLB tracking to get into the slow path is wrong. It tracks what
  is mapped, but not the established TLBs. Kind of annoying.

- Handling IPA invalidation when the TLB was established with the S1
  MMU disabled is failing for a number of reasons. This is the bug
  that Hyunwoo Kim found, but I decided to address it at its root
  rather than just fixing the symptoms.

- Deciding to run with a VNCR TLB doesn't take the state of
  SCTLR_EL2.M into account. Yes, this is a special sort of sport to
  run a hypervisor with its MMU disabled...

- TLB invalidation by VA targeting the last page/block of TTBR1_EL2 is
  dropped on the floor, because I cannot count. This was amusing. Not.

I have fixes for each of these issues, all stable candidates. On top
of that, I have a couple of patches reintroducing the tracking that
the first patch removes, this time in a way that is actually
functional. Or at least I think it is...

I'd like to thank Hyunwoo Kim for their initial patch and for
providing a reproducer that helped me finding these issues by running
it at multiple levels of nesting. It is most probably too late for
7.2, so let's try to make this 7.3 material.

[0] https://lore.kernel.org/r/ameGoxbn2wzBq2kL@v4bel

Marc Zyngier (6):
  KVM: arm64: Remove VM-wide VNCR mapping counter
  KVM: arm64: Handle negative S1 walk levels in VNCR TLB size evaluation
  KVM: arm64: Consider SCTLR_EL2.M when mapping the L1 VNCR page
  KVM: arm64: Correctly handle end of VA space TLBI invalidation
  KVM: arm64: Couple VNCR fixmap clearing and CPU number invalidation
  KVM: arm64: Add VNCR TLB tracking again

 arch/arm64/include/asm/kvm_host.h   |   4 +-
 arch/arm64/include/asm/kvm_nested.h |   7 ++
 arch/arm64/kvm/at.c                 |   2 -
 arch/arm64/kvm/hyp/vhe/switch.c     |   4 +-
 arch/arm64/kvm/nested.c             | 109 +++++++++++++++++-----------
 5 files changed, 78 insertions(+), 48 deletions(-)

-- 
2.47.3


