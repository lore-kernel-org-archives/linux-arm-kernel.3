Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F4606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SjB/6e8x;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZI1b3+Ym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aaO1/o6pnxKsiPjftPSn0VyBdqvDP2CrGJI/wXBPKS8=; b=SjB/6e8xfWsSFK
	DJoqhykF++C9k4bp/lthT7p9Auh0ZdnTady909qYypDSWToHV4/eAcXJNBGRbBLvINIfiHe5jU1v6
	Ys2wFggK1DLc0pPHBCCRvrQYFw3iehddbnavfNl5b+JTgLC45+FJo5GPAYbIu2B3/kEzjvgso8xCX
	IXXDX98YwO+nWFEUhL6ouDRe8fgaFwGnE3AkonbO7+mUjBT19HD4NDSX7VXPPe6QgvGH/eF2qRJi0
	VnOj3xbeVAu+jYcScC5TzglpUVnyK0+6kPFB5OktTH/Lz0mLp2kKlW0VdKdLMdCON9pu7zayOLnKL
	0j6pGUxCWMSSduMVrKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH09-0000000242i-2VtU;
	Mon, 26 Oct 2026 09:28:21 +0000
Received: from out-198.mta1.migadu.com ([95.215.58.198] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH07-0000000240V-1ok5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:28:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=b7FM/+nMXV/x5ioStkPEzar8jxQ92kribfVG8dU4gAE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793006893; v=1; x=1793611693;
 b=ZI1b3+YmBcniunr4Qu1nsNf54JpKpeAMrtsN6v8B/LjP0mCxq0EwF6WpS4VVaS5B+PQy/Y5s
 J6Ddnw5Qwmt7op4mqWJoT61/DwewX3EVTtrG8fms5CByH30F3r63gxT1/utrGdGeyfqIdPzzrqo
 +s3FjTdhlqUNyyf+Oys+DKdo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4732a03f7734264c;
	Mon, 26 Oct 2026 09:28:13 +0000
X-Mizu-Trace-ID: 4732a03f7734264c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] KVM: arm64: vgic-v3: Don't drop a pending LPI mapped with LPIs disabled
Date: Mon, 26 Oct 2026 09:28:02 +0000
Message-ID: <20261026092802.2636798-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026092802.2636798-1-fuad.tabba@linux.dev>
References: <20261026092802.2636798-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_022819_613804_E0D7D75E 
X-CRM114-Status: GOOD (  12.65  )
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

When an LPI is mapped, or restored with the ITS tables,
vgic_v3_lpi_sync_pending_status() moves its bit in the target
redistributor's pending table into the LPI's pending latch. Enabling
LPIs on that redistributor resets the latch of every LPI that targets it
from the table (its_sync_lpi_pending_table()), which no longer has the
bit. So an LPI mapped while its redistributor has LPIs disabled loses
its pending state, and the guest never takes it.

While the redistributor has LPIs disabled, copy the bit into the latch
rather than move it, so that enabling LPIs reads it again from the
table. It's still copied into the latch, since saving the pending tables
would otherwise write the empty latch over the bit.

Fixes: 06bd5359549d7 ("KVM: arm64: vgic-its: Read config and pending bit in add_lpi()")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 346bacb3198f2..65b77fb35be37 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -552,7 +552,8 @@ int vgic_v3_lpi_sync_pending_status(struct kvm *kvm, struct vgic_irq *irq)
 	irq->pending_latch = status;
 	vgic_queue_irq_unlock(vcpu->kvm, irq, flags);
 
-	if (status) {
+	/* Enabling LPIs resets the latch from the table: leave the bit for it */
+	if (status && vgic_lpis_enabled(vcpu)) {
 		/* clear consumed data */
 		val &= ~(1 << bit_nr);
 		ret = vgic_write_guest_lock(kvm, ptr, &val, 1);
-- 
2.47.3


