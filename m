Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2901D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WpgkPdSm;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=u21D0kvR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=V7BTev0WvCIE8h6eACl3FNzYopQ4CdXZtkVISOrxWo4=; b=WpgkPdSm6M9QtR85WCDTu/IHVt
	JNf29G+DwQL1n3lNWtrSzkl5kq7GFp4aAF7WfI1MmxcImilJy9Zr41/RLSZ/XtyCFmlL39bkM+VrZ
	NTO/C4a/mAgF1uCwEG95gZcoMwFfVbct7JV9r2IjLHXu4N27u9KG63rM6/C38w2+XPm9QPxT9n4C5
	N8uxKc4NwWTEAbpa2PXuyK+6lByj9HQkRJ43qpsOMHHADmVZZRYSsjIsFOKxxoKpw/v9pmrQ4mC/h
	sbS9MNlS4Oo4tyEuwrjlTB4sZANpAwUeHbsSU+HX4Lt0PLiiyBJAly/adcyyHGmQFXbi0Z5qdAQkJ
	5DfWC4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUJ8-0000000A1RD-3ChM;
	Thu, 29 Oct 2026 17:52:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUJ6-0000000A1Qd-2fLh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:52:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16FC91682;
	Thu, 29 Oct 2026 10:52:52 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C16FC3F59E;
	Thu, 29 Oct 2026 10:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793296375; bh=MNFLu7TIDuMgXYx4iE9e2hGmnIPJuc4afAnBP3Vqi/M=;
	h=From:To:Cc:Subject:Date:From;
	b=u21D0kvR1fNWXpIClKGGaqeqXHxTgbsSymQisb5BH1b78NUzlwCulVk/KTLyPs7mB
	 ba9oY4769umLVIEO5efHcazaKglIuThMRc7TrB1zRZwb5iJCtdbCP/Xwpf9MAdZCpQ
	 SDWHyjkgka9xfE3Dk5ufmflxBIKikBCi0t/L3euU=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 0/2] KVM: arm64: Dirty logging fixes/cleanups
Date: Thu, 29 Oct 2026 17:52:36 +0000
Message-ID: <20261029175238.3214788-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_105256_719736_26C95993 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

These are two fixes/cleanups I found when reading the code. It fixes
dirty logging detection in ring-only mode and updates a stale comment.
Please view the patches for more detail.

* Changes from v1 ([1]):

  - Keep memslot_is_logging() and use kvm_slot_dirty_track_enabled() in
    it. This preserves the RO memslot check.

  - Change patch 2 to updating the stale comment only, the original
    change is obsolete now.

  - Collect Reviewed-by and Tested-by tags from Fuad (thanks!).

Thanks!

[1]: https://lore.kernel.org/kvmarm/20260605153248.2412064-1-weilin.chang@arm.com/

Wei-Lin Chang (2):
  KVM: arm64: Fix dirty logging detection in ring-only mode
  KVM: arm64: Remove stale remark on canonical IPA alignment

 arch/arm64/kvm/mmu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.43.0


