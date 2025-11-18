Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF141CF2560
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 23:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHE6wgLcyC/A2J3GDPYVlHT1itno1PFctdQPXxu0Bdg=; b=wD1iJIt/zdXav33p4i29zKLqky
	kVc9//e3OpuBhqbL6P324HDo/KaoT0ronlOpRHD9MwlqXhjAwJyGI5dA6OwVXDvW4ib4g8oVNYde4
	AoxQCqJzfIfX6IbUhu+FleECHCwd+EcghaSEONuqO1fSATk561OsXEQkFdK9ct2UJ+4OpJUbGDgNP
	reRkDOuNH+f/rhEGodH0UIv8o2abESptqVzwvYYxVGVqUEIMF2vt7A+DYSA4IeQQ26cL+CheOkhww
	YGIkaptZWJr7EF6WsV71NiH1jp66/cPtH+KJA70Srq9JIzepGW4ZNSxSOuZkHfcKPov8xsF/m6Z51
	ZrWLVBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVDf-00000001F58-1bsz;
	Tue, 18 Nov 2025 23:34:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVDd-00000001F4m-1Zqo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 23:34:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8C98437A1;
	Tue, 18 Nov 2025 23:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23F6C19421;
	Tue, 18 Nov 2025 23:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763508880;
	bh=gXBV/4xTwn0jzieLHx+pUWj0FhQ7YIU3nhIOpIaPsBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TIxZtq+mMWHY55GePuSG4b4vyL94wGWhdj9ZRIR8GwGyc9v55CabqX/nHSRlZnt5x
	 VGeXefjeekQkBYOPVTKVcABuhIhXlF5Du1VXCuYVJgSICv2FkJ8OiBPhBSLyjgJPlM
	 N1lM6VS4jr7Pcd3jyT0CG04+MKRnzkQbBwkJ9cxTGYeXSy7bwp+dFupEbUpO43h5MX
	 kNrjBX14UFoq+BtcWrh32VxhZlafy6c32dckLgutkt5m2mQPA+l09nAJqOvQyWDY7K
	 VpidE3/1gW1q9z/4A+6UCY2+xcXzRt4y3qakBiPLVVOo5tfl3rLnRwgh6m/7SlHHOU
	 JMseaSoL5s4rw==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/5] KVM: arm64: Add LR overflow infrastructure (the dregs, the bad and the ugly)
Date: Tue, 18 Nov 2025 15:34:30 -0800
Message-ID: <176350881099.2483203.14164245618391807826.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117091527.1119213-1-maz@kernel.org>
References: <20251117091527.1119213-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_153441_471007_9F93EAB6 
X-CRM114-Status: GOOD (  13.15  )
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

On Mon, 17 Nov 2025 09:15:22 +0000, Marc Zyngier wrote:
> This is a follow-up to the original series [1] (and fixes [2][3])
> with a bunch of bug-fixes and improvements. At least one patch has
> already been posted, but I thought I might repost it as part of a
> series, since I accumulated more stuff:
> 
> - The first patch addresses Mark's observation that the no-vgic-v3
>   test has been broken once more. At some point, we'll have to retire
>   that functionality, because even if we keep fixing the SR handling,
>   nobody tests the actual interrupt state exposure to userspace, which
>   I'm pretty sure has badly been broken for at least 5 years.
> 
> [...]

Applied to next, thanks!

[1/5] KVM: arm64: GICv3: Don't advertise ICH_HCR_EL2.En==1 when no vgic is configured
      https://git.kernel.org/kvmarm/kvmarm/c/3c14fb1b1c88
[2/5] KVM: arm64: GICv3: Completely disable trapping on vcpu exit
      https://git.kernel.org/kvmarm/kvmarm/c/8be00d1ba3a1
[3/5] KVM: arm64: GICv3: nv: Resync LRs/VMCR/HCR early for better MI emulation
      https://git.kernel.org/kvmarm/kvmarm/c/34586ff89152
[4/5] KVM: arm64: GICv3: Remove vgic_hcr workaround handling leftovers
      https://git.kernel.org/kvmarm/kvmarm/c/22c299785240
[5/5] KVM: arm64: GICv3: Force exit to sync ICH_HCR_EL2.En
      https://git.kernel.org/kvmarm/kvmarm/c/54cf1341324a

--
Best,
Oliver

