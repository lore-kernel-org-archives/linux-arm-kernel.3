Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247FFC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XNrRt3K/e2GN4rK6G5yz+bVayP/H1MToKI/zMgC5rs=; b=gIms3X/1RagqjgYhqv0QcP4s2T
	1OD8vr8Khb70d0A1H5i0zRD7iKDKdB9wbSRWfq0DVwy9uUUZZB9EzdW+GAeYtCkMPvBnAR660DX8i
	aXkDXNoksa+7ttztx0uTFRGPJznnyfcF1W3dFFQSTXMXpU94YVR4+qDnSgjSgECTKkCkcA/e2GyWR
	0q/+/myaEctwvytTGDYaFlh/r7Ci+qpn07O0zRoEXJp4CC8o2Ef49Mbl9dChTn0gS+KS8nruDfYST
	cja22FAsYTBIRl9NFmAaPC6jgFw2mRvuAMXpmIAKW3vozIBtgKAxTg+XLMs6QraFMK6unJ23GNpbB
	IMBYZx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bbW-000000080NY-0MdZ;
	Tue, 15 Sep 2026 22:26:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bb1-000000080JV-1Aiv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:25:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F21C141848;
	Tue, 15 Sep 2026 22:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F621F0089E;
	Tue, 15 Sep 2026 22:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789511146;
	bh=2XNrRt3K/e2GN4rK6G5yz+bVayP/H1MToKI/zMgC5rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DftyfJ36qL02JUOy+8wuqysxT1e9/AP0552ZtGpwRIpOR6WpMwHzcA6ui2ExrjajS
	 P3AbRebswUS++Q5A0hfjZ9mYPNE0vv+y3eg6HJQNIKZTL9cIWQnmM3TR2A9guKEQXG
	 OMZSMenlgeu//48gCujufkwkUMD+ODHKeeRl2Hy+JS4oSsuMZyFGfr8bX3SjWnallO
	 tMzyAZVJnLtfAJlnbwMDkPTZhEyaqQP2HiWIke7aXl6mW6VULXU0myuUriDgyOwr4Y
	 JOCH3tN+DaPIZynJ2hwpsJZ1PpYlc6AnZHVN3oE0msG8ToEC1cLg9IDU8CbQ6QXuea
	 i93ZcH2Jy/Efw==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] KVM: arm64: vgic-its: Make the ITS table save reliable
Date: Tue, 15 Sep 2026 15:25:36 -0700
Message-ID: <178951103704.10790.6467022902884466773.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821064445.615838-1-fuad.tabba@linux.dev>
References: <20260821064445.615838-1-fuad.tabba@linux.dev>
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

On Fri, 21 Aug 2026 07:44:41 +0100, Fuad Tabba wrote:
> Changes since v1 [1]:
>   - Free the LPI translation cache in vgic_mmio_write_its_baser() too,
>     inside the its_lock section. (Eric)
>   - Reworded patch 1 to name the register the write is to. (Eric)
>   - Rebased onto kvmarm/next.
> 
> Marc pointed out on the v2 ITS series [2] that patch 3 fixed the wrong
> end of the problem: KVM should drop the collections when the guest
> changes the table that described them, rather than validating them at
> save time. He also called that patch's -EINVAL a mistake, since it
> aborts a save userspace has to be able to issue. This series does both,
> following his answers [3] to the two open questions: purge the whole
> list, and skip the offending device rather than fail.
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: vgic-its: Free the caches when GITS_BASER changes
      https://git.kernel.org/kvmarm/kvmarm/c/8cd92f77ae4f
[2/4] Revert "KVM: arm64: vgic-its: Don't save collections the table cannot hold"
      https://git.kernel.org/kvmarm/kvmarm/c/30908e727247
[3/4] KVM: arm64: vgic-its: Skip unreachable devices instead of failing the save
      https://git.kernel.org/kvmarm/kvmarm/c/cc5d96036e01
[4/4] KVM: arm64: selftests: Add ITS table save tests
      https://git.kernel.org/kvmarm/kvmarm/c/6f182db39fb0

--
Best,
Oliver

