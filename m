Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB897606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1VPxN8u7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcfYS43j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J6rJ9m2a/zNKwWgYWDs9/d7TuGE7M+e5cj3hCcIOpvE=; b=1VPxN8u7Fg+KepKLYrJCFxqnfn
	hyY1gjlQZFnP/9KthnXZQzDj6EtHMC5vKhkW8pvsteB947S54MjLAYJf3BYUvTDWz/TONb8AAkQ1A
	pSaTcOuFsjXobsLXWGlMF6tfCT+n0yp980g2hGyaPm2mqa/4FhrXFSelNsPpq/oA6BeaBgdUPX8RT
	RqM4oVhyej+HM3lqjjEGp5dSfVC4d5dsms0BQaZ2zOMzv6D0LSwVbqaW2mGKXyuuwxzuI+xgCTzrA
	7yD3fL5Wz2i5P5hhoF0BVYA9RZSef72eYjnVJslIXyDcHeuGOCcnLE7sEskxf5nKLOTTDulUWPHNh
	NhWwvFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFz7-00000001wWZ-3l2H;
	Mon, 26 Oct 2026 08:23:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFz6-00000001wVc-020H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:23:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EB27600CB;
	Mon, 26 Oct 2026 08:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C704C1F01825;
	Mon, 26 Oct 2026 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793002990;
	bh=J6rJ9m2a/zNKwWgYWDs9/d7TuGE7M+e5cj3hCcIOpvE=;
	h=From:To:Cc:Subject:Date;
	b=kcfYS43jjCMlyXtqJTBicbh2hGtl+bZ9Ap2lxjk/tep9teZZSud0xSHpsY6BBiHfs
	 36BHwMnLYXpUMcgXiPBWVLNXy2HJU3cmUkWm/rPuj2sNGCZT8bj59YYQceR22Mq6dG
	 IuUqb0d6hMdQSFEvfiZcuLt/hfQpaDd6xdnpz22XoxVXLkiouf1qvmJXbR3vHQs6p+
	 f6V+pudR15EOn+2eM9lu40n/B09u6v4O/WoCQ6/64Gs4a1YztmlrlTZXfIkRlZY6fB
	 MdRE3Mg7x1rffHwUVkzdxDKUjSzponDs8BeGBJi3t5FNq6Mp7ifmHL5uzd9D4zkAk/
	 GeKEE6CY9K3bA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLFz2-00000007A40-3Z6o;
	Mon, 26 Oct 2026 08:23:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/2] KVM: arm64: Reenable MTE on VHE guest exit
Date: Mon, 26 Oct 2026 08:23:03 +0000
Message-ID: <20261026082305.2515705-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upton taking an exception, the CPU sets PSTATE.TCO to ensure that no
tag fault can be taken while handling the exception. It is SW's job to
eventually clear it when it is safe to do so.

It appears that when MTE is enabled and that the kernel is running
VHE, nothing eventually clears TCO when we come back from the guest,
so things such as KASAN_HW_TAGS will not work until the next exit to
userspace.

This series aims at fixing this. This is not a stable candidate, as
KASAN is only a debug option.

Marc Zyngier (2):
  arm64: Add return value to mte_disable_tco_entry()
  KVM: arm64: Reenable MTE tag checking on exit from guest when running
    VHE

 arch/arm64/include/asm/mte.h    | 10 +++++++---
 arch/arm64/kvm/hyp/vhe/switch.c |  7 +++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.47.3


