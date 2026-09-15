Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A210C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNxI24y/TunKWl5C4ctu+sU3K8XoQzuW+d1dKY+Zk0A=; b=pHVKMs6xGgv3WloB00OIuRvgqe
	dT9ZEu3HntDMsCazrG5NRk0J4Xwbrl+As2wjME54UrWvLyvp/BxXh11wGnebvPSxDoJX3z5/noFlZ
	HaHlqLvcKQK0HJZ38qT55CArpTqmGGZAjlyntO9cFpWZH35TBdrZsw1iWn3J/hFSdLSpEVY1gqnkE
	sLI4gTUAZ44GuTZJ/udPdvi5oJR4d+kJyiKwn/mwSLNaZqW/tDOsc7G4khnJ7Ep/oNitdbPz9yj0e
	oPrBnbtjD21Ug9zeeIHTlG/RZgrDewBoTa/pOjkB8xFdzQNSAfVi0Kl3fOmSP5eoY0rCViKGU/JsM
	H4NXLsJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bbV-000000080NB-4BcY;
	Tue, 15 Sep 2026 22:26:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bb1-000000080J1-074I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:25:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56176410AF;
	Tue, 15 Sep 2026 22:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100211F0089A;
	Tue, 15 Sep 2026 22:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789511146;
	bh=QNxI24y/TunKWl5C4ctu+sU3K8XoQzuW+d1dKY+Zk0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Qlu+BstI+KeC/+51Se/nSMCSIVHhkuoebDOQF430ks/qH2TgcDhtSLujgIJxxxzo6
	 vMSstDex8T23NYcsT9gfC13O4h3wLPfaY4evcTEJg53z/eHgRIcCz271+8x9rkLLv6
	 BAx3YTr+0tcv7QU3b/d6bkvHlb+lhWOBr1wdrkFVNi1MPIZIvSFT85yCo4Zhm164dl
	 FQa/cON2MpxXqNiLx9kvwPTwj3o6fOBUfQYMEQ9zi/QlqOHbdh64SN2olYjXj3Mqr3
	 pbgF+jLOwA0hKlb2efGbCaQBinsBfBoivb1jOBtbZ93M+Kqkn9vEl4rhZ3R/jZAdVh
	 VKfs8EPLlvm1Q==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Stefan Teodorescu <fane@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] KVM: arm64: pKVM SVE vCPU init fixes
Date: Tue, 15 Sep 2026 15:25:34 -0700
Message-ID: <178951103700.10790.15404656431875850871.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825085948.1674721-1-fuad.tabba@linux.dev>
References: <20260825085948.1674721-1-fuad.tabba@linux.dev>
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

On Tue, 25 Aug 2026 09:59:44 +0100, Fuad Tabba wrote:
> If it's not the GIC, it's SVE. I found these while preparing the
> follow-up to the pKVM core series [1].
> 
> Patch 1 was posted on its own [2] and carries Marc's Reviewed-by. It is
> unchanged and included here because it has not been picked up yet and
> the rest of the series does not apply without it.
> 
> [...]

Applied to fixes, thanks!

[1/4] KVM: arm64: Validate the SVE vector length in pkvm_vcpu_init_sve()
      https://git.kernel.org/kvmarm/kvmarm/c/2a2eb10795a1
[2/4] KVM: arm64: Do not clear VM-wide SVE feature on vCPU init failure
      https://git.kernel.org/kvmarm/kvmarm/c/a1b3c788ad31
[3/4] KVM: arm64: Key unpin_host_sve_state() on the state it unpins
      https://git.kernel.org/kvmarm/kvmarm/c/0d62fbf34d8f
[4/4] KVM: arm64: Derive GUEST_HAS_SVE from the SVE feature bit at EL2
      https://git.kernel.org/kvmarm/kvmarm/c/4f16c5fc8dc4

--
Best,
Oliver

