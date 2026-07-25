Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C33FC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KkXToa/E/TO7BNSgNTLBSgT6W89C2l7j03X9R0LWBpE=; b=LD13yXCYbKZVWHdDCPasWIeS7Y
	gcQCJbedLRT9A7xfzyZM/Uk4ev+CgDqYZQOpYIpWCPccQdnqbRgtdzIyx41zZg5ka8ONZbe+8oRH+
	XpW1IVAcEc3/mYN1F/k4B/ZaP1AWAYYcNHWYwXE73IKmv/Y/Ijgxbc110XUk0LcmuIIKhvvFkCAs8
	stHrstPqOEivAKVoSv3piBAoPqGA6RkG5GWnQ4ik0mn5vN0cvGkFWyTvnPXs8gR5y6egBYRVq/dwn
	U2xtz6PT7mRwTtBoKhQIRW4bZrAwaCsfbD3nokVbynfOV7prPjjLPQ4WW9F+S+6xOHzjAkT0ZBAXg
	Go4VoSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wneUL-00000000UfR-05FE;
	Sat, 25 Jul 2026 15:40:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wneUI-00000000Uf6-2sYJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 15:40:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f7872abb6so797175f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784994029; x=1785598829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkXToa/E/TO7BNSgNTLBSgT6W89C2l7j03X9R0LWBpE=;
        b=OxsUSPkZwKZinhD2zbiA6khnp8cCe0/FCMOLtqLgHz/UcBY313wqDFF1l1a5wszIom
         I21dUUV1eyLcA0DEFP0qP7wrU2Qw6bz0Yk8Q6hMDKOUejDKOILqqi0Umjr6Cju1vnFr6
         ZGTQjxnxZWuolKHhmoX4hvbNPe8xdjSFMXTkD43Z4hxFDOiLfYB+WtHDYF7WwupmUSAy
         7ZPFcc4GbWoVyjp58ckdf7NiV/2jcwec8fL0FxDYaAPqQw/8Tpd1vACp6PLkdqW6hDBm
         PXo6fHw5xK5/ozeSwCLjJ4h7rE/xPGdbDdk9WTmzlee1XmMyWiXdK74ADMF3/2C7ppla
         EPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784994029; x=1785598829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkXToa/E/TO7BNSgNTLBSgT6W89C2l7j03X9R0LWBpE=;
        b=L8xltD+I3rQjbn4gbrY2D5xxrdfZOtLzNrOqj6Iuq5mzc0BIqTZIx+I6XNka84AfwR
         vrzUTmjabhRW7yxKgLe7TtCq8WXunWUXTy5gDTF55b1LfO9UHoiDpAbPML6239PdXjjg
         ab0yfMenWcb4dl3ihmH/Z1RhyND1bW3XF2VFnrPnarHz6O2wYuZ2vx+LKjdh+woSpY9+
         q4i7KN2qHqVyY8bnjt3xorSkjvXp/rMFaokeD/5+4rpM6NRnC4J4LWEwMwAbJA47gMpt
         tmX+4YztDg0O6tPQbTQHCtCieHs73xv0h+VWKG93CsL3ETQTVBkZLKFyioiKjGsmTt30
         p2yg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7O4YMcRABQ2eSwG+mLuS4dyrAtYqIy5Ib/8aEA/S6XCNMxwMXcLI0BU+4Zr28qwo54H7+PbgbeZiRN82xoL1j@lists.infradead.org
X-Gm-Message-State: AOJu0YxlmTeRgbwPiH0QkKA/n6ylW0zZ+qvM5faGfFcJ3GsREG5Y9znp
	6PmqxCO8sHBDr3H2kqrVdh6veECG3L3mtlgxzSSuBZSK7u5Zhd0POkXb
X-Gm-Gg: AR+sD13zYalZRd/jexzkgJ9VWr9dqehDTMya5ZEnO77pku6fRBtQ3z5lp8r/+yf2UeC
	YMZqNkO/eRGfBuPen7LMbCXQw5cTn/klJe6o+n7tRkr04fJHYnVCjDAQBBThqu9MUbd+TWVPS6g
	SAyQsoG264xOgFDmocFJaNAitzlQVe9V5i8YLAkEjMnRR7xpdU2OppNUXJli81dXBbIC5dMIP9x
	iy/tMIbjmV/tHkek0/N6tzg9mH/gpqOx00Y2TCQZXXpbDGAyZM+X2QBCnMomDGCXDt+YnGik8MU
	GwSslPk3eQfd+3m1fmv9hDttXy2GRsU/qYL0SK0FwpllNB6RaAekrbKL3XV8jLj51k+HhbhCtgz
	cArZnnRfne46i3IL+L2RqBKxgd7oFmVyBCNXjzLAj4WURt+jBO+v5uhI097eei7eujo+PByPsJD
	AvR5vDECIebzfwaCTynPuZzJ9V//iEGBy/nmVQdxbIgKEZctEqmDrumZvpkntbDvuK7mqZTEO46
	Mm52qGTld06Wea6O+ogi1HpLVwHJywLGa3TtSv5wENbDJQ0EP4Yq0DplgqSpAWa9cYlKk3jzKXq
	4zBJiWZMFEluxmdmcnv+
X-Received: by 2002:a05:6000:1ac6:b0:47f:9557:8d77 with SMTP id ffacd0b85a97d-47f9fc82ceamr3194678f8f.10.1784994028285;
        Sat, 25 Jul 2026 08:40:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b344-be01-c902-8e3f-9491-60c2.310.pool.telefonica.de. [2a02:3100:b344:be01:c902:8e3f:9491:60c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85a2573csm32832468f8f.0.2026.07.25.08.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jul 2026 08:40:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: GICv2: Bound the INTID in vgic_v2_deactivate()
Date: Sat, 25 Jul 2026 17:40:20 +0200
Message-Id: <20260725154020.37305-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_084030_791246_A8A2CE0F 
X-CRM114-Status: GOOD (  13.31  )
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

vgic_v2_deactivate() passes the INTID from a trapped GICV_DIR write to
vgic_get_vcpu_irq() without checking it against the number of
implemented interrupts. An out-of-range INTID makes the lookup return
NULL and triggers WARN_ON_ONCE(!irq).

A guest using EOImode=1 can therefore raise a host warning, or panic a
host with panic_on_warn=1.

The GICv3 counterpart rejects INTIDs outside the configured SGI, PPI and
SPI range before performing the lookup. Add the same check to the GICv2
path.

Fixes: 255de897e7fb ("KVM: arm64: GICv2: Handle deactivation via GICV_DIR traps")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index cafa3cb32bda..42430c0fee07 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -163,8 +163,12 @@ void vgic_v2_deactivate(struct kvm_vcpu *vcpu, u32 val)
 	cpuid = FIELD_GET(GENMASK_ULL(12, 10), val);
 	val &= ~GENMASK_ULL(12, 10);
 
-	/* We only deal with DIR when EOIMode==1 */
-	if (!(cpuif->vgic_vmcr & GICH_VMCR_EOI_MODE_MASK))
+	/*
+	 * We only deal with DIR when EOIMode==1, and only for SGI,
+	 * PPI or SPI.
+	 */
+	if (!(cpuif->vgic_vmcr & GICH_VMCR_EOI_MODE_MASK) ||
+	    val >= vcpu->kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS)
 		return;
 
 	/* Make sure we're in the same context as LR handling */
-- 
2.39.5 (Apple Git-154)


