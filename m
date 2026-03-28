Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163AE10ED67B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LPe9nqhLXJmjhT+lLYN6uaAGruBC1s3jtNYnTBiISRY=; b=p+oKzV4tzDIG0CIaMx8bNyPN+Z
	oRdgIwP0ILAtuKYY+uVZihXWNKcWZgpKksAqJuNelbxKGCla0lN21oU2VHxfhVmVnEb+s5jN+Pncu
	zcVS3gk0b354BhctAU2oCFuoGFZtMh6I186bR/PwglD9mghi+W2Wi6WHsAyrv661Qu8uGA9RjVPuX
	DlBqmd0OICZ4GkJGFpQErBjjJwUbfy3GWu1p2kc6/ldkgE7RMkUbl1O5hUudbXSbstIRw4M09qtG0
	7iZMCKIX9zaK72iiMGaAkadN00a0yQqG9GLRie3MjR1/pFRM0RKbkrfvEDVe0HnCmuKyKx3ULrinG
	WKUYTTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6V4C-000000092NT-0k43;
	Sat, 28 Mar 2026 14:55:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6V4A-000000092N3-08sq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 14:55:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23DB245E5;
	Sat, 28 Mar 2026 07:55:00 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E0703F905;
	Sat, 28 Mar 2026 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774709706; bh=NlRVE9bGVP4eixMrI2DD5OnHRc2Xeq2aI5b+GYpyI5k=;
	h=From:To:Cc:Subject:Date:From;
	b=gVU0WhUYJMW/vcdwGy7FEfLuWn1hZ3aHJhSuxVVTYns1BOif447samFyHFhf/73M5
	 gylXRRysltdeUE2RGyRWdSwCStwwYg9P7PnFOuENQbAH37DJ7JubGRo3oz+fcl3g1J
	 bz4ec9NxrWnZKqNPHseiM6PSoMR4RreD7Xubi9jU=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 0/2] KVM: arm64: Small cleanups for stage-2 mmu teardown
Date: Sat, 28 Mar 2026 14:54:37 +0000
Message-ID: <20260328145439.2501562-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_075510_202986_7E4CCEC5 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

Hi,

While reading the code I found the uninitialization paths of the s2 mmus
a bit confusing, so I did a small cleanup. It includes renaming a
function and a small refactor. Please see the commit messages for the
details.

Thanks!

Wei-Lin Chang (2):
  KVM: arm64: Rename kvm_free_stage2_pgd()
  KVM: arm64: Refactor stage2 mmu tear down functions

 arch/arm64/include/asm/kvm_mmu.h |  4 ++--
 arch/arm64/kvm/mmu.c             | 10 ++++++----
 arch/arm64/kvm/nested.c          |  6 +++---
 3 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.43.0


