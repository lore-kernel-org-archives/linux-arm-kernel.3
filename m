Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E3FEC1104
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFcRRBFNWN9K+1ZvnMwSXo9gtRd0Dtv8JUsHZMQS/h0=; b=sjqmpy1vx8XAjBpOwe1G+W7Xhp
	5T0MfWDpDJl4I9vh99oYyPt7AfvPfnDRgE7JAz3h8+1GCD4prNy5IajjdZ9glvCda81dbZKIa1jqU
	m4Pxd30cP9FpfCWFSZgDA6DGBiEdGfihXCVG7aydKgQeii1liGuz0ZA22evpfmVN+Ho2Rpm0ix3L6
	GWhbaC1hCqIrYpbpAQFbLps7j7zKjkdvRzAjjW7CDb44LgPfbbMmecOJrqGpsuTHgQ9wNX0BQlOeI
	qiT8Kj0GLsv5nQF5DlwWKWXYq6mo/f1ausbutkDZ7cU5w4LQCXMKoXqkd1jgwvf82DHBJD5ja/zQT
	IISiJhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYqI-00000000gvA-0GsJ;
	Mon, 23 Feb 2026 16:31:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYqH-00000000gv2-2MXb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:31:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C40DB6057A;
	Mon, 23 Feb 2026 16:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1B3C2BC87;
	Mon, 23 Feb 2026 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771864288;
	bh=kPMGu6rpFObsTaxnVjc9U9DSVyONlwHZ5psqc1gbbww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qp9hig4IOzVjzuK0A9mfXAIYpRju/wh6HryxXQNZWDJEVfi+YupmTFToNLjKl9pkh
	 AhwTT38KNzOjwxaFPLQDZO9WpvBSpqzJZ6ppsi42CLdTsuZPZtFUHvux8SAe1XIPia
	 mNQkYMkFytwJA6ZMfNCUccvKEcvDZCBijdvOQFqFV7Iq9Iwq2nh+ma4nc6Tbc2ABpI
	 j6Hc7jLscqK82YrnC7ScaMnWPFNvoja5JWggqKydmzT9kGNQEFyfaB2Y80EfH1VlxQ
	 1hL5wl5eCBFn0ltlgUh2dwXEYXMoZWkwj6LOvQz4Q5A3yOS+TJbC666Vadc8paRjry
	 JaZ6NmpUBT1XQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vuYqE-0000000D3sd-0hiq;
	Mon, 23 Feb 2026 16:31:26 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: broonie@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	qperret@google.com,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v1] KVM: arm64: Revert accidental drop of kvm_uninit_stage2_mmu() for non-NV VMs
Date: Mon, 23 Feb 2026 16:31:23 +0000
Message-ID: <177186426800.3533992.9302353405604914685.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260222083352.89503-1-tabba@google.com>
References: <20260222083352.89503-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, broonie@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com, oupton@kernel.org
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

On Sun, 22 Feb 2026 08:33:52 +0000, Fuad Tabba wrote:
> Commit 0c4762e26879 ("KVM: arm64: nv: Avoid NV stage-2 code when NV is
> not supported") added an early return to several functions in
> arch/arm64/kvm/nested.c to prevent a UBSAN shift-out-of-bounds error
> when accessing the pgt union for non-nested VMs.
> 
> However, this early return was inadvertently applied to
> kvm_arch_flush_shadow_all() as well, causing it to skip the call to
> kvm_uninit_stage2_mmu(kvm) for all non-nested VMs.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Revert accidental drop of kvm_uninit_stage2_mmu() for non-NV VMs
      commit: ec197dca8735f7627e5cff7e3fa8839b53a28514

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



