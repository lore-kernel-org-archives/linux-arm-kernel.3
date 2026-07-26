Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8369C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF3WLDnzhawv1E63jb1eZQJNVi9jAWSGddOpTswPwi8=; b=PAnW36TzgbGTK12xQRcrjjyCm8
	mP5hNd5No7MNX8NK2nFdB6egaRNcu8YC78uzjYus9pplbz080KnBJo0uTMkSkA/ZbPin7thozjuTc
	0KS5pVUupryPvXEfxYGzy6u0nhlXBZcrbdvX4xD+gFZIIZXwl7/RjpEjm/lWE8xZEaWQzEOBR23uh
	OtwLsTtPnES/QaSut2r9SJ4oxKnMRK853IzSlYrOzpZJddfYiRj0kUAbs/gbRvORm0ChJaKKAsZvA
	Q5RlyZSJFmym1D/a08wTnxDJeQ08JbbwrAKSN31whgsF+R2bHKmTuKhhh1XUX8sETTqs0HTvCLlYK
	9hZymQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0MA-00000001Gt6-2PwY;
	Sun, 26 Jul 2026 15:01:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0Lt-00000001Goz-0Nkl;
	Sun, 26 Jul 2026 15:01:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 600836001D;
	Sun, 26 Jul 2026 15:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B267C1F00A3D;
	Sun, 26 Jul 2026 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785078076;
	bh=KF3WLDnzhawv1E63jb1eZQJNVi9jAWSGddOpTswPwi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k8ADJwIM/9K4aDbthIc6E0Kkyy/oEv6J9w5YEtQwANBLNeCvAdtfmcvcKBClC7kgS
	 Vu4oxdUR9yQ9vPt0xvaXnpDtb/pLbjmJ39fp9kFIozkvK45h8UiK7QV0Gwfck02YMQ
	 3s88yuKoxxEgdEoY2v6/gk2rt2+mORJE8CcVZwhObDIWMsdIxJBvZqvjW9MITAl+q+
	 2Zje31YvYIGq+fQqg00uLmyEqb95ZlKqG93iprGDDNSCeqqJQaLAUiYDkMdyUQE2Fh
	 ql+wTAFv5Udl1ZNbbrbSTUno603bDlMWXmeWUjbEkUnEK13zCEjloPgCr9R7+Mz5nX
	 mz0TuyBRixPNg==
From: Will Deacon <will@kernel.org>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	chaoyi.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/8] accel/rocket: RK3576 NPU (RKNN) enablement
Date: Sun, 26 Jul 2026 16:00:53 +0100
Message-ID: <178507139795.2055528.4355657426833307310.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718031146.3368811-1-gahing@gahingwoo.com>
References: <20260718031146.3368811-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 18 Jul 2026 15:11:38 +1200, Jiaxing Hu wrote:
> This adds RK3576 NPU support to accel/rocket.  RFC: the NPU brings up and
> runs, but full inference is not correct yet, and I would rather get
> feedback now than sit on it.
> 
> Tested on a Radxa ROCK 4D.  The NPU probes, powers on, brings up its
> IOMMUs, and runs jobs to completion (rocket + Mesa Teflon).  Getting there
> took a few fixes outside the driver too: a power-domain settle delay and
> reset cycling (else a cold power-on throws an async SError), the full
> clock set on the MMU nodes, clearing a stale firmware page fault, and both
> NPU power domains on the core.
> 
> [...]

Applied driver changes to iommu (rockchip), thanks!

[4/8] iommu/rockchip: take all DT clocks
      https://git.kernel.org/iommu/c/841363ebb508
[5/8] iommu/rockchip: clear stale page faults before enabling stall
      https://git.kernel.org/iommu/c/b10d5920cafa

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

