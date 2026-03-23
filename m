Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC9FEC01C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2QpxQtNXxDsar5kae2ZxZeOuUfgaQwT1AH0C8DchA4=; b=nBqEHnuJJCMlZ3UDYyYEdzh954
	D/aUxjGGtIdABwJV3TSI5e9CuRvhLTwgdfHQ2BhnUK2rxiUOwv59vInziWu2gbwodOZrwtIfJjGBH
	TI97tXsnTVyEiO9HkuHq18/QNM07uDPDTOSs72bM2vrlbZSKaEzzv+yRSUF46uA1+EQz3mKzU0mFY
	DF8iKfTOOsJon0SQ55ReOUXV3Uu/KLYAWfTUIg9T9t5BTK6+fdJXMoQs9NVl8ATyKgnO9sVn+ZUHA
	JU3X42tvsOzI//OK7JOSs7VyFI5SeRJCfz64KaeP//RnPJ6nYhcAEoOJxmPd40vRzoYY/3KS6TwF/
	EUDZIEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d6A-0000000GZK8-3B1R;
	Mon, 23 Mar 2026 11:05:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4d69-0000000GZJt-2BiC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 11:05:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C9EB600AC;
	Mon, 23 Mar 2026 11:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0850FC4CEF7;
	Mon, 23 Mar 2026 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774263928;
	bh=BraRdjLKc4SBE/RNIplurqe16L3OY8fCXATiwXvXBFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uwUbIkl1n1u3i4R48wH2slAwkHXeOjV8pGmvtWJqJL6OQh6//txLlkVlj9KpXddfa
	 C9ABLZEQutTyzJ+TsZ9fO4DyqhhpM+xoX1Y6THbK+OsmtWY5B68UHp+V8WkgZLMx5R
	 e+WGkcH0HUGYZDjJjWmhIeSg3l6cDwuVvm5Kr3RBN/1goI8uPQeE9oXkafwBNw/crs
	 k6JJ9bqF+sWIcnhJTw8yxeYWzuzmMdWLQq5dL+/fvXUHML50QYwwggm8gr4SYLo+fc
	 bQeaNpKaMoGv890dPFDpniP/qDnOUe5nuEYdRcnLCtDDFU+iLVv7cbvvNZEBgYt4SB
	 C8VtXQktYGnKA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w4d65-00000004gzt-3Q5b;
	Mon, 23 Mar 2026 11:05:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH 0/5] KVM: arm64: pkvm; Rework aspects of the PSCI relay
Date: Mon, 23 Mar 2026 11:05:23 +0000
Message-ID: <177426391593.2932170.8726976984414575226.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260321212419.2803972-1-maz@kernel.org>
References: <20260321212419.2803972-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, smostafa@google.com, qperret@google.com
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

On Sat, 21 Mar 2026 21:24:14 +0000, Marc Zyngier wrote:
> Having recently spent some quality time debugging [1], I ended up
> reading too much of the PSCI relay code and felt that it could do with
> a bit of spring cleaning.
> 
> To be clear, this series doesn't really fix anything. It simply adjust
> things to my own taste, which may or may not be everyone's.
> 
> [...]

Applied to next, thanks!

[1/5] KVM: arm64: pkvm: Move error handling to the end of kvm_hyp_cpu_entry
      commit: 4ebfa3230b40728638a6acceb709f900f920f921
[2/5] KVM: arm64: pkvm: Simplify BTI handling on CPU boot
      commit: 1536a0b1386850b67a9ea840e57b7b475e895fed
[3/5] KVM: arm64: pkvm: Turn __kvm_hyp_init_cpu into an inner label
      commit: ba64e273eac3d7ec4a2b621b3620c4d3b0399858
[4/5] KVM: arm64: pkvm: Use direct function pointers for cpu_{on,resume}
      commit: 59c6e12d40a5b05038b68bcdb4690456fee68e8a
[5/5] KVM: arm64: Remove extra ISBs when using msr_hcr_el2
      commit: 54a3cc145456272b10c1452fe89e1dcf933d5c39

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



