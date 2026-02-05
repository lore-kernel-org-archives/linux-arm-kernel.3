Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D4E91297
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erjiEnS6gwZ0clBuqIdeKDuwy5dgGujHDytrq2wGuAI=; b=G69w1LHfTEqq4U9vUf065zoUCl
	/oNzBucjpjf+vh/4t6CQh7rlEV88GT7pd/7lUyQrkNXSYFZ2X7LuMZDFo4MMLpaCJI9SMShKnAiaq
	7YYmJkv7DifJcDmeLPTowmXL5nWawx+PbkNs96i7YuUAG+AhDNd8l/slLu6JJ7EINjT5+zJUmoPRP
	bwl7OIxNkKZVLRvWz8y2Fqpe2FjdU+A8lRIPKXKdzRnaDX4vtIYPggjFhqEBaDadR3AD3mrGupRlD
	vxQ1b0oiI5mbtMFTKuhYdnoA4rA71SNMumeMrHbadNQHUHe35qIbTQRVrSc/Mvif36+fwXe91xUIv
	PTmuvBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvBD-00000009dvL-2dP2;
	Thu, 05 Feb 2026 08:57:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvBC-00000009duy-3hDc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 08:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28A77601D2;
	Thu,  5 Feb 2026 08:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E522EC4CEF7;
	Thu,  5 Feb 2026 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770281858;
	bh=NMpINejUDk41lLVnO0baNt+n3V31uNWLnmlfSOm3zmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t+Jh54xmNkIHHGxBrC7IqS6P87tiotu9H6iVNJshyTNRzvuagX5mNzntr9/mMxZnp
	 fzhsxEazwM31R+rBoX8Rvl2w8D9kHRk23eMXgcva+QxjiQDrQCu35vD/3qMPqIaQqq
	 eOdg9BDIZK1sI+gYyarlWvoe9G8+TlNDbJPfu6ZKViIzOQ9CdKGG3+Jhc99PNwuZGp
	 h/qYF0dtUVFcBUR/Ufw/S8lFPsaJrJBGBgFQqYe4d96CmV4nez23K03VHj5dRE9sg1
	 K2Pl8FaJUXK9MoilYFz7rXQ6/mrR/cxWjqHsJOHKBHIh7y2TrnCUKA/2wrIZ1ACOhz
	 v+jXWXit+mX3Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vnvB9-00000008kjb-1Jfv;
	Thu, 05 Feb 2026 08:57:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <tabba@google.com>
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v1 0/3] KVM: arm64: Standardize debugfs iterators
Date: Thu,  5 Feb 2026 08:57:32 +0000
Message-ID: <177028184517.3559278.15033024966094248612.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202085721.3954942-1-tabba@google.com>
References: <20260202085721.3954942-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, tabba@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org
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

On Mon, 02 Feb 2026 08:57:18 +0000, Fuad Tabba wrote:
> This series refactors the debugfs implementations for `idregs` and
> `vgic-state` to use standard `seq_file` iterator patterns.
> 
> The existing implementations relied on storing iterator state within
> global VM structures (`kvm_arch` and `vgic_dist`). This approach
> prevented concurrent reads of the debugfs files (returning -EBUSY) and
> created improper dependencies between transient file operations and
> long-lived VM state.
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Use standard seq_file iterator for idregs debugfs
      commit: dcd79ed450934421158d81600f1be4c2e2af20bf
[2/3] KVM: arm64: Reimplement vgic-debug XArray iteration
      commit: 5ab24969705a9adadbc1d3cff4c1c15df174eafb
[3/3] KVM: arm64: Use standard seq_file iterator for vgic-debug debugfs
      commit: fb21cb08566ebed91d5c876db5c013cc8af83b89

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



