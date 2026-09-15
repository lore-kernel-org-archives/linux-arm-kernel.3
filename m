Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53239C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+w/qcLrX2rTuwmLcVOn6au3NRLwXERMUbyiNARdv0Dg=; b=CaHsUkZEBxVRtTfNyqySNp94wm
	bu5BcZh6vzUq/UF+jlVk1BfyGvBpQ4Rys4Sk/J/qXqXzy9NYj1lNad9zA7UKzsL3jhaIif/vJs7pV
	GIVIJ6qaX9Sg11lP7QraITdWTfJC5mX7Ez3UE0H/pFeSNJZ0ki9Gj3b4KR1uvYCeDTA+utTD9cnoe
	tr2EeatQBjSa0rrOvLpblMv7LgFEJhhNH4JqtR81jDtfAwIEmhePWYJCGIX1kLxxqO26QUwj6hbFr
	7jj3p/8EISpvFbyjHpnECFbZVpP8PXzzpfmQ07RdUnRyUcOwKhLloNEn5zj8zolGadrFOrRvpL/Z8
	YCWjo58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bbW-000000080Ok-2TWb;
	Tue, 15 Sep 2026 22:26:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bb2-000000080Jn-3S1v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:25:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7E37602D1;
	Tue, 15 Sep 2026 22:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655511F008A1;
	Tue, 15 Sep 2026 22:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789511147;
	bh=+w/qcLrX2rTuwmLcVOn6au3NRLwXERMUbyiNARdv0Dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JTbZMRmBrSnpUtOvIGLKkvcMuM0cdSivcl60DxSsSfRu/1YmKDiIVi/sz9KpzC5LM
	 PzbYPlOlnxkk63Ar/caJgqbq6GCbOuR/7kmayLo070MWg3daAQx2sAw2UUkZfLUuTW
	 GB8aV8eQNugWJjfaf4jEcCzUHnXVENtalMkLv/k0szhC/M84buizlzI6G0958+s/se
	 yeb0xhiFJW/zxLgl3qk1Ff7QJmu4P6Uin9rw2l+fpkJJgTDtrQ2kT5BvYZDG4VzlUI
	 r3Cv69JJDiBxAvKmVBX/f8oXRRwZYQyjHLSOr81vh4Iwti5/TCdATao+kzdkoa6hJL
	 sM5b3x1Wt9uuw==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/2] KVM: arm64: Fix spurious warn, null ptr deref on S2 teardown race
Date: Tue, 15 Sep 2026 15:25:38 -0700
Message-ID: <178951103702.10790.13969077149562964690.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901-kvm-arm-nested-virt-fix-v3-0-b154676f7e4c@kernel.org>
References: <20260901-kvm-arm-nested-virt-fix-v3-0-b154676f7e4c@kernel.org>
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

On Tue, 01 Sep 2026 18:28:58 +0100, Lorenzo Stoakes (ARM) wrote:
> When GFNs are invalidated in L0 an MMU notifier triggers
> kvm_unmap_gfn_range() which tears down all of the stage 2 shadow page
> tables for nested guests via kvm_nested_s2_unmap().
> 
> To avoid lockup, the kvm->mmu_lock is dropped while doing this and the task
> rescheduled once for each block of physical address space (32 MiB for 16
> KiB page size), with the lock being reacquired once the task is scheduled
> again.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Fix spurious warning for benign stage 2 teardown race
      https://git.kernel.org/kvmarm/kvmarm/c/38b70fc453c3
[2/2] KVM: arm64: nv: Fix null ptr deref on nested wp/unmap, teardown race
      https://git.kernel.org/kvmarm/kvmarm/c/4c74e233cded

--
Best,
Oliver

