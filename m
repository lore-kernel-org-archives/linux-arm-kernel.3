Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758EACEFCE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xD3fJ0ULXFcU30vunTHh9fi9bkTdQX9nc8XHIX8JrL0=; b=f+vIgOX102JLJMrwbVAkoJBd7n
	Ztjb4TGrxxb9jMOIwScnl/6Btir129FzODaBFAZM30A5izyzSINc3XDhUW9a4d+T/Zl2vD+O0KyQC
	Sps9rpef/jtszU1fWMGHZxq/tKf+3JyzhXQ5mYp/Vay3Hg8HIO9uGMPY6ZjrZ8Oy2mpoArBjnyRbX
	QDF1F0OgzkUsf6ob39p2WttZtRwE2OztMOZfIjnldahU5bGD+inhZsv0/TrmYtsDWwLsip79qVFOd
	+Beze/OJ6mhtKeHmkcVLO9+bgyv3QGRwsSOvQi4iwHeWHYBBRyl4oUG8C7Dz+GNWV3n1Jr4Kixx+M
	46EeHVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAzj-0000000Da2d-1jFx;
	Tue, 06 Jan 2026 17:37:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAzh-0000000Da1v-0IMW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:37:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09D4D497;
	Tue,  6 Jan 2026 09:37:13 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45A0F3F5A1;
	Tue,  6 Jan 2026 09:37:18 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 0/3] KVM: arm64: Trivial FPSIMD cleanups
Date: Tue,  6 Jan 2026 17:37:04 +0000
Message-Id: <20260106173707.3292074-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_093721_160342_4832861D 
X-CRM114-Status: UNSURE (   6.93  )
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

Hi all,

This series contains a few trivial cleanup patches left over from all
the FPSIMD/SVE/SME rework last year, all rebased atop v6.19-rc1:

* Patch 1 corrects a comment which I typo'd.
* Patch 2 repacks some flag indices to be adjacent.
* Patch 3 removes an unnecssary ISB.

I'm sending them now before I forget them for another few months.

Mark.

Mark Rutland (3):
  KVM: arm64: Fix comment in fpsimd_lazy_switch_to_host()
  KVM: arm64: Shuffle KVM_HOST_DATA_FLAG_* indices
  KVM: arm64: Remove ISB after writing FPEXC32_EL2

 arch/arm64/include/asm/kvm_host.h       | 10 +++++-----
 arch/arm64/kvm/hyp/include/hyp/switch.h |  6 ++----
 2 files changed, 7 insertions(+), 9 deletions(-)

-- 
2.30.2


