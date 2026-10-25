Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B4E606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mGaJjZ8Q;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b5c/+U/o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mhsArRboNOG7MEYGvuVxZAVzLd8DQVPPiwRvsOHZhfo=; b=mGaJjZ8QLe/a4I
	xfv43+iCMjcHlCHB3BFJ0Rpzp4lYonENzWkBB0rgOiPJZoFUptWX1JRggXwtW1h7pjUYQ8AvGUgKZ
	m0jRXfonmD6NyHAdP+fIdWoKuA2KoOci7NR6r3vAdgxEvKA7/dvTi9J/vps9iDf5neDM/hTwN48un
	ECJedU5qKbcale99oxoawGy194bXax74CuoEjvCEMLXExIazk7vIvAXwbv5OhjPLThcRwW8dyMdhW
	VYpqeGzOHoEcGy3rOwkVYwHnfa8VNSHowh3bjsbfLkqY+HGHBdNet7yqjeP2j7Rc/3Qf9wdfyHdWh
	jkSSRgfupq6ABczslYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1a-00000000r1F-1JnL;
	Sun, 25 Oct 2026 07:52:14 +0000
Received: from out-72.mta0.migadu.com ([2001:41d0:1004:224b::48] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1R-00000000qwe-3y9T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 07:52:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LcQIPG/aqOFsoIK9+iuAeL5MlGsV4fSp77IzdGl2HiA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792914723; v=1; x=1793519523;
 b=b5c/+U/oukInby2nkiUQoMYepyq4030cqKpS9GEafPT+pwQ6eoNmi40N0/capxxiBri4BsMB
 q9bTxQDb0tGspFSpCCIBDh59QJ2rw2VVzVsoGhVSH33kqYCI71pI1XfVZGqPNf8xQCQHDuD6bk8
 6Eo+gD1bW7db4QBjSseU2L4A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 176e5694bb0be5f6;
	Sun, 25 Oct 2026 07:52:03 +0000
X-Mizu-Trace-ID: 176e5694bb0be5f6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] KVM: arm64: Enable ST64BV0 for guests with FEAT_LS64_ACCDATA
Date: Sun, 25 Oct 2026 07:51:37 +0000
Message-ID: <20261025075138.2919734-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025075138.2919734-1-fuad.tabba@linux.dev>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_005206_125612_8FB74B3C 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 58ce78667a641 ("arm64: Add support for FEAT_{LS64,
LS64_V}"), a guest sees the host's ID_AA64ISAR1_EL1.LS64, but KVM only
enables the FEAT_LS64 and FEAT_LS64_V instructions in HCRX_EL2. On a
host with FEAT_LS64_ACCDATA, a guest's ST64BV0 therefore traps and hits
the WARN_ON_ONCE() in handle_other().

Set HCRX_EL2.EnAS0 when the guest has FEAT_LS64_ACCDATA, now that
ACCDATA_EL1 is context-switched.

Fixes: 58ce78667a641 ("arm64: Add support for FEAT_{LS64, LS64_V}")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_emulate.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index a3c1928bdf743..d07f72082531c 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -712,6 +712,9 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
 
+		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnAS0;
+
 		/*
 		 * NV3 is a host-specific extension, and we always use
 		 * it when present and that the guest uses NV. It may
-- 
2.47.3


