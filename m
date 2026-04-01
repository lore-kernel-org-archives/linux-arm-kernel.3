Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D16510F6FD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOhSr0EWBTrngMCiMLViC2pkG6JCY84aLfPOj2AYBMU=; b=vJW1aIjIBHMoH7QulElWxxKNPO
	IBRIJhEjCxOD8t3SJtrORGfWN4Ts1eXgjCAXpzYUxF54YN4R26Wl59UHMo/qhutYqliY80WcrxsWB
	frlWGprv+q3Da0E1cGhKLUdv1dzsTI9Do0cR/6NFxPJj0CflhqdKRusTBy9YgC0q5KoKDyqFUWRh+
	jARfSp6iUZr3fqKl185rkuX0VHniYjlOTFkHkZaqNmbgf9JQsWAujthY5N/ZRJ05c0Im6yTthQ77j
	OB75VGIocctcvmiVZKK6dB58xBcquQNv2L4gzmRmNpdnkBofvRzwJbZmTw6XylFRmsrtPbcdvVNzi
	VyNGA4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xVK-0000000Fdau-38T7;
	Wed, 01 Apr 2026 15:29:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7xVI-0000000Fda6-1ymE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 15:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2343640C21;
	Wed,  1 Apr 2026 15:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E6EC2BCAF;
	Wed,  1 Apr 2026 15:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775057352;
	bh=9AFYi/BUXHOTKuIIr5yD3BrO5yqcxVBx5c2H4HAuZuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cwWWSN3z4ipuPYch2D02vHE3/nVffyQAuFT9mEj8KLq+2zART7k3q2aCl6NCFB2W5
	 +W2bDigTNrRGGDpdK9tPXGBiCIS+ftfYgYFJdFZ4shG3+TPH7iXDehTfhz7AE1DgaH
	 7036xW/wGE41ikko7qK5Rm/n7DN7wG0qM3h6R6MJVfCvVHD3L0qHKRuoUA69tiAm2z
	 Zd+ikdYGGyq1fXRGV4XoY5s6jxdqWkodascjinlRLtmYgrYl4KSml0PF9pY31uV0h1
	 TxHPX2Yb3ss6i+U2RLn9v4S1n0TXg3nqWcTOONnEVKHxOjgxnWPQXzzUAv8zcMlf9e
	 dltwMMAJJDYTw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7xVF-00000007vAb-459l;
	Wed, 01 Apr 2026 15:29:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Fix teardown of non-protected VMs with pKVM
Date: Wed,  1 Apr 2026 16:29:07 +0100
Message-ID: <177505732750.363663.2457509354584161463.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331155056.28220-1-will@kernel.org>
References: <20260331155056.28220-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, will@kernel.org, linux-arm-kernel@lists.infradead.org, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, qperret@google.com, tabba@google.com, vdonnefort@google.com, smostafa@google.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_082912_537653_6D0F6C33 
X-CRM114-Status: GOOD (  11.33  )
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

On Tue, 31 Mar 2026 16:50:52 +0100, Will Deacon wrote:
> Sashiko continues to throw rocks at me.
> 
> This time, it spotted that my fix (introduced in v5 [1] of the pKVM
> series) to prevent taking a reference on a VM in the 'is_dying' state
> also prevents unsharing of pages shared with a non-protected VM if that
> VM is torn down by its VM fd being destroyed, rather than the usual path
> via the MMU notifiers.
> 
> [...]

Applied to next, thanks!

[1/3] KVM: arm64: Prevent teardown finalisation of referenced 'hyp_vm'
      commit: 760299a1d8102b36bed5c25c5a3f94b5a0eee081
[2/3] KVM: arm64: Allow get_pkvm_hyp_vm() to take a reference to a dying VM
      commit: 2400696883870ec3fb0fb9925426c62a3383ca36
[3/3] KVM: arm64: Don't hold 'vm_table_lock' across guest page reclaim
      commit: bc20692f528b2ac8226bafe5b1db9a1f8be96dbf

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



