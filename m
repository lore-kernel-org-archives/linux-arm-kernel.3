Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C09C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i47mkyDKC0L6QCO7X1RJZB63+BPZBPHoL0VZy1sN3tQ=; b=fRBuICKFNn0in20b1G5OOa3PqT
	gM9q9L0k2+sgZth7uLaSdfJCZPBCKHnevom/jl07lbdmOmrp4ZIrgIH2tvAc3XLNXzCmMtpQttC1s
	/iTOcod1EGkXLehrqvstIhhK2CG4HY4n+iZQBB0+ZUGGwJeV+XUQWwg9yQhlZ5i6VW1dovTFHVgrb
	oHV9DlaiagZEjBi9/RZYpY5Ao6n1tCCaCoDotCem1ZS878L7HIubSCGR1LU06LMf7NylY+I/xnVuD
	D58ui0YeQwTagdPH27Cj7RnCgLxPEn3YP16OXHi7HpOnb/rggt7bHkCYwqcjF1H/LHqfTvW+DEYZZ
	HJoWEEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th4Th-0000000EUPT-3neh;
	Sun, 09 Feb 2025 10:23:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th4Rc-0000000EThP-0zDs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 10:21:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E730A400FF;
	Sun,  9 Feb 2025 10:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932D6C4CEDD;
	Sun,  9 Feb 2025 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739096502;
	bh=ljE5yUYKD7VORy12kAg7aDzprFkq/ZEsUxC+fJE/JKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jcOx08JcDQwd/5MPhSO5Me7KQAI6EDSijqvqQAb+Ga00Cd1eZFfYBIxLr1pR7tS32
	 eNFzyH8DMqHA14LFKNe/5I29sWf4VBMLhPo+uA55qGdlKvINLqcISmKrdf/wia5RzC
	 4+4Iaul0PXoqN2/fVYj0FKQuyT5CthpRALR3EHtQny1ABMAVMyelZnpfdAEr7UiLBE
	 Qc9nmiijGeOgF2BWyXbYwYt6IrKjl1AvO6RtWJsUlwB+7f43ZnHL+M2+Vcu3gOu1Dq
	 mh/mu4Al8vhQEWSQPKU4RYAqMOAtOyxMTTuSOb12AzVipiGjAXj3JZM3bdehzTx9EX
	 IQGD5RihQ+CqQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1th4RW-0029ai-4E;
	Sun, 09 Feb 2025 10:21:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Cc: Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fixes for pKVM NP-guest support
Date: Sun,  9 Feb 2025 10:21:33 +0000
Message-Id: <173909647948.1598393.13009014212384755720.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250207145438.1333475-1-qperret@google.com>
References: <20250207145438.1333475-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com, tabba@google.com, vdonnefort@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_022144_347040_8E9B49C3 
X-CRM114-Status: GOOD (  12.69  )
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

On Fri, 07 Feb 2025 14:54:36 +0000, Quentin Perret wrote:
> Here are two patches to deal with a race between the handling of
> permission faults and MMU notifiers with pKVM that I found by
> inspection. Specifically, pKVM gets thoroughly confused when it doesn't
> find a page mapped in its relax_perm path, while standard KVM deals
> with that trivially thanks to the -EAGAIN special case in
> user_mem_abort(). The second patch addresses the problem by simplifying
> the implementation of multiple pKVM hypercalls, which also has the nice
> side effect of improving locking by not taking the global host stage-2
> lock as much.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Improve error handling from check_host_shared_guest()
      commit: c53fbdb60fb61fd6bda2bc0dc89837966625c5dc
[2/2] KVM: arm64: Simplify np-guest hypercalls
      commit: eabc7aaef7a553b64bf6e631ce04526af6c8d104

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



