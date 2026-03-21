Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23E01075269
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 21:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BWB+VGEIpQ45uutiMxVhbDm4LDmqCVu+8gAolxbYnsI=; b=Lh4R9uPeKLGgu1CFah97XwW6dA
	jAKq/USYWVnsk0pbZnUBBhRLCyxxNCDh5IbFaN2pZIZ3cYcQOWUe106eAjBOdcK8sKbjIL4m9mi+/
	xxj9uLSZsx8aHe+e95gUZlBmTvQX9V5SVKkOQrM4SWkxjQMWCl9JIzV3cIOJD4fz6oIp4J9dZYs+T
	cXoVjrkvO+jmSKPL58li2K7P0ooM1daYCHELBAvYmDlWkvO3LOklDTdfD0qhHrYcGVQXjE6yyckse
	Y5d9RdwtqTCtlCp32Z4bRgRmrNKHUqLT33VWx0pra7VXjQqyxSFq3ZhMsuNSo4DjLd865KRmUFARy
	9qi9hhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oM-0000000EnpV-0ylI;
	Sat, 21 Mar 2026 21:24:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oF-0000000Enn8-1iYv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 21:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 435874397A;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AABC19421;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774128278;
	bh=nRoaLuGwYpbMvsPMsvVjX2A8kmDi7xUzyfUclf9j2sI=;
	h=From:To:Cc:Subject:Date:From;
	b=kxHgA9b0ymDLPEMZUXO1eGE1UH8fHQHKuNn4TK80XUw7V13PyyCrq/exXa+enbE3O
	 cyWBS7Gp+PmdL/f0u/4S2PMakkepZE91N0UeoUIt1rrZwRf0kkH9XiB4tHkSdQctP0
	 E8vCHmr0GrXszj9mGI1yBPQNVFD7OjU2r7LGBi319XEO7oweZBxLgt30Y0SJSgDsCV
	 MC94O/Dg1Mp0f9B45oyfZ4VtV0e8gksS5wBRZ1IwEPbgW/3jqj5jO0LB9rOz55aLk/
	 4SVwrijbWuDaNWY5xJhHDozZ/yr1bs8A2B194wadkF95+0F9UbsjXPkyCV+iF/jqG+
	 CO4TdJAQgEhkg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w43oB-00000004NPB-38Z0;
	Sat, 21 Mar 2026 21:24:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 0/5] KVM: arm64: pkvm; Rework aspects of the PSCI relay
Date: Sat, 21 Mar 2026 21:24:14 +0000
Message-ID: <20260321212419.2803972-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, smostafa@google.com, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_142439_469731_9E0D2329 
X-CRM114-Status: UNSURE (   9.60  )
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

Having recently spent some quality time debugging [1], I ended up
reading too much of the PSCI relay code and felt that it could do with
a bit of spring cleaning.

To be clear, this series doesn't really fix anything. It simply adjust
things to my own taste, which may or may not be everyone's.

Comments appreciated,

Marc Zyngier (5):
  KVM: arm64: pkvm: Move error handling to the end of kvm_hyp_cpu_entry
  KVM: arm64: pkvm: Simplify BTI handling on CPU boot
  KVM: arm64: pkvm: Turn __kvm_hyp_init_cpu into an inner label
  KVM: arm64: pkvm: Use direct function pointers for cpu_{on,resume}
  KVM: arm64: Remove extra ISBs when using msr_hcr_el2

 arch/arm64/include/asm/el2_setup.h   |  2 --
 arch/arm64/include/asm/kvm_asm.h     |  3 +-
 arch/arm64/include/asm/sysreg.h      |  6 ++--
 arch/arm64/kernel/hyp-stub.S         |  1 -
 arch/arm64/kvm/hyp/nvhe/host.S       | 11 --------
 arch/arm64/kvm/hyp/nvhe/hyp-init.S   | 41 ++++++++++------------------
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 39 ++++++++++++++++----------
 7 files changed, 43 insertions(+), 60 deletions(-)

-- 
2.47.3


