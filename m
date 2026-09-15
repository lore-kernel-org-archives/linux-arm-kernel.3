Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63562C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJHW2zr6j28wgdd6ygTO/gZ4sHjNUcda5NUyoTuBQYo=; b=uVyOkOgOtr7WKWGOICbC7xl3HJ
	woKKOB8UUkPLI7vX+86AaJODAPyYVYqUpFx9FqIpRdOtq2rSKkgRfGcfOyTt3z2q+i7kCTT1DfZZM
	d8WcsySp3x84g254YAcbZ4j8JMxv49TQzIeEgmvD+xd8OhqLzjNoYnic9tZjhFacrEuRECPUiuA40
	Ma1MUw/wMLb6QtEo4H9AcTg3mLCUM6f/B4o8qfnonhL9arRNy9QNwbjCYmWOO9lShQD3tzkuBUxP0
	dTGHRt4kWca7pZGbcrYkjyjy65h99aSFJqUMjRlma0IyY7iZ3nx/ewPeslgNmabGphQpc+SZjHs3i
	Zl01uBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bbW-000000080OA-1Htc;
	Tue, 15 Sep 2026 22:26:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bb2-000000080Je-2Eop
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:25:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C3FE60142;
	Tue, 15 Sep 2026 22:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F731F0089C;
	Tue, 15 Sep 2026 22:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789511145;
	bh=UJHW2zr6j28wgdd6ygTO/gZ4sHjNUcda5NUyoTuBQYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MERX6EyvDfpB0PHv1/QcMnPYWf2eUGtcXzm448nfqp/QF82ovFpFp7Mh4MYe5QgQF
	 5UUnashJUXeRsg52cTwkivpfVlej8DXRGjjxz0x/5Q0WRtNBmp2znjvp0jMr4GdFXt
	 JA3MssY1tvM34B3JKfV/QsdQFgPvLmehW8BEXW3oXnhH7N89ni8QmFEsF2WtSjNBXf
	 im3gEt4tU1uXSmhQRyrnfHpU7IxPnvMCEo1mUlIGITdY2uzvtUePnbyAJ/UE0Th5GR
	 UvbuxOIgydC6WXK06waLaRT2NN0VFwjBmX00+7CYtk01O6CnuzRU8bV5fk0z0xCp5N
	 3qXuVLff5ksjg==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Keir Fraser <keirf@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Quentin Perret <qperret@google.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>,
	stable@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] KVM: arm64: Fix host access to the EL2 stacks
Date: Tue, 15 Sep 2026 15:25:33 -0700
Message-ID: <178951103697.10790.359285321366515778.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908110713.1540304-1-fuad.tabba@linux.dev>
References: <20260908110713.1540304-1-fuad.tabba@linux.dev>
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

On Tue, 08 Sep 2026 12:07:09 +0100, Fuad Tabba wrote:
> The per-CPU EL2 stacks are initialised as host-owned after pKVM init.
> fix_host_ownership() walks only the linear-map alias of each memblock
> region, and the stacks, mapped in the private VA range for their guard
> pages, have none.
> 
> Patch 1 is the fix, and it needs none of the other three. Patch 4 adds
> the check that would have caught it and would catch similar instances
> in the future: once the transfer is done, walk the private VA range and
> fail init unless every valid leaf is hyp-owned, or is hyp text mapped
> without write access.
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: Transfer the hyp stack pages out of the host stage-2
      https://git.kernel.org/kvmarm/kvmarm/c/3a8c562892b9
[2/4] KVM: arm64: Match hyp text by physical address in fix_host_ownership()
      https://git.kernel.org/kvmarm/kvmarm/c/5a8b505ede13
[3/4] KVM: arm64: Move the private VA allocation cursor to __io_map_next
      https://git.kernel.org/kvmarm/kvmarm/c/224584140114
[4/4] KVM: arm64: Check every private mapping is hyp-owned at pKVM init
      https://git.kernel.org/kvmarm/kvmarm/c/cfe80c3837f9

--
Best,
Oliver

