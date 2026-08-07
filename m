Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5382AC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 02:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pIGWzVgFBhi3QS++pGVJA0SUneFjy47jOKVOvjRMiOA=; b=pq2py5TUCKOLSSpHc4ZvUveFFd
	GVTHOY5JB9rBL8Gp/qiSX8vkGJ24tAkIom2iEx23gAWgVrukQZrSDsNx09te9JD0+a9HtiqSpgGNL
	rxvgv10Gg64CfywUdX+7aOJN2TY0rIs/Gl0YwsyI38Pb+NYKGYqaO72Eq0TrQ/NoRVE0yQq64wnY6
	8JJoFeNuQaeUU3Dn3O9IHN31uqdktkMKUWvULzR7kUTeWx0WkG6jGP4jTOgHCyyZivzxzDi3OcMeo
	h5PKHQiaiRR8KdWZByhxPGNyZE9rBFxP3aYjgjDGYTfxP6FW5MZ5/SuGIwL4F+hHh+LtVLXSegF9M
	QBUp0Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAkR-000000070i1-3Aov;
	Fri, 07 Aug 2026 02:55:51 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAkP-000000070hh-0ljC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 02:55:50 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84e252fbb7bso462442b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 19:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786071348; x=1786676148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIGWzVgFBhi3QS++pGVJA0SUneFjy47jOKVOvjRMiOA=;
        b=qPsmSVSu7cOHbdTY8vLCA1wigk3F1M/u+XVX8vKL5AOJzRNtD+aXXmbB7zIKvTf1Pw
         vQPRbBKhljYg5e32rXdaxsLU2/0hBg+OLmF3ha7RvhTvtGKPLGBPZvnBebmMRjuXCCmc
         w9PCZb/5kyw4eUvgZcWTWvE4ViGz2/qsT+hZ7UfQ/hHGDkshQDgys1LTmFlTGnO/q8hh
         en77/Y4dD10LEpDV5BwDEewUyEKVzeCnuiXa70y7xhPXTGQa1WJTFQYIgwGxjthu4Wpy
         bHsPlL6Pbprp02blYzX3Y+0NpKnfD0jPAf2XisRm2Ue5gUIaRpoxly64+0/3RcxNXvt7
         SG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786071348; x=1786676148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIGWzVgFBhi3QS++pGVJA0SUneFjy47jOKVOvjRMiOA=;
        b=mngpTGvNToUHo/ryY7l9V7Ut9rZ9cu2aGcl76fpG3CTIQAMG8BLqqOzL1dIAUkFAvC
         RNXZpqxrLVgkGaTwlxjce36xXFJuiEuKKuGhyr4CL7F5/g4+M2Y9IkmjYvamrVlhvH2Y
         hyRZkQXWpl7qbopZ08LUMBHwUHfPFDa12dUMgsmYqHIYIdXx+h2dXwEiQLSshAAMk97l
         Hshwu8+JExIf1vQdxL124/dt7n7ifhEZqJmHEzLfuSgqNTnkwrLNHcfZhEQYfDEI2/f2
         rya5T8hQ0LaSHXlsA8DFEkkj67qSbO8ZTvf9cutb1TUPTv70OJTbg5Y6Nxh37PaWv+DH
         44hA==
X-Forwarded-Encrypted: i=1; AHgh+RoCn2EXNJUfHWrAHczHIhspdKgSDMxmC6v3mZJZFMHHf+Qey6I/3rVsqlzy2MM2wpW+77RQADR+f4hy2HnUCiV3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2/o4keFgFTwW/Xfub2uGh0lARLVc+c3TOt8RKdRhFxS5OdLiX
	AzLH7GNXrJEZ7x7akuLQBcMRYmcBSTMddb6kB8MjDkpGjV3Q20aKY0sNKH1FZw==
X-Gm-Gg: AR+sD13+k9oDjSqKl/juVGZUTrU+xL6BfadsXblNXSpUy1tFP93lkhBkkJ9VOTriZf5
	X27HUlSMlOVKkGaK1BhucinCuuU8P+o0bN9ZGh6qv4CKzguh1KPcqaYccAmg4g+rjzsc5cRB/Rg
	ABy2uUYQlZrLCSf1omEswpHQYABWVCE31NiMTYHh41qQGTTpOeZ7CPJJVddDTQGZYgAwSS98xfq
	iQSE9WHFQdOSe4voE/j7Q4YfjQpJCq5p+E4igY/U7oaWyCxGhSDoPbM7rD06VyheZx3IEfV2A1t
	jEwrOnoA1IdcSM1HvJjWs7eWcFnrzXdYfbwc8WcLzP/X3a5MBLWMG+fa+9bnpZhqcEvOXr6sAvt
	9EaklMrNVOjGatQtphm1q+9+H+ASWuAD+qrb007I7S0Sb3utT1NTyTrM/XLih8hMrkC4cHYAr4H
	FjXbw9ku2t0dwny/BwnqE4gFzAFN9LOQsa+DSdYtTJg2TOGMVVdcY3ipa1EZwINEOQq1uun/0tN
	eECr13RoGQ8YmGpjxeOjW5wCzpd2DNn2z4Pxlf0xWg14/mmFHo=
X-Received: by 2002:a05:6300:648f:b0:3c6:61b9:9162 with SMTP id adf61e73a8af0-3cb863e0633mr15912712637.3.1786071347910;
        Thu, 06 Aug 2026 19:55:47 -0700 (PDT)
Received: from localhost.localdomain ([139.159.170.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8bbfc330sm143385a12.27.2026.08.06.19.55.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Aug 2026 19:55:47 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
To: maz@kernel.org,
	oupton@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qihang <q.h.hack.winter@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: vgic-v3: take an LPI reference in vgic_v3_save_pending_tables
Date: Fri,  7 Aug 2026 10:55:34 +0800
Message-ID: <20260807025534.34125-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_195549_245690_DCE53FF8 
X-CRM114-Status: GOOD (  13.86  )
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

vgic_v3_save_pending_tables() iterates dist->lpi_xa using xa_for_each()
and dereferences the returned struct vgic_irq in the loop body without
holding a reference on the LPI.

The xarray iterator only provides temporary RCU coverage while looking up
the current entry. That is not sufficient for this loop body, which reads
fields from struct vgic_irq and performs guest memory accesses before the
iteration completes.

A concurrent path can trigger this race: the irqfd cached injection path
(vgic_its_inject_cached_translation) obtains a transient LPI reference
via vgic_its_check_cache() without holding kvm->lock, vcpu->mutex,
config_lock, or its_lock. If guest ITS DISCARD then drops the cache and
ITE references under its_lock, the transient inject reference may become
the final one. When vgic_put_irq() drops it, the LPI is erased from
lpi_xa and freed via kfree_rcu(). Meanwhile, vgic_v3_save_pending_tables()
may still hold a stale pointer obtained from the xarray iterator and
dereference it after the RCU grace period completes.

Fix this by re-fetching each iterated LPI via vgic_get_irq(), which takes
a stable reference, and dropping it with vgic_put_irq() on all paths.
This matches the pattern already used by other lpi_xa iterators in the
vgic ITS code.

Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

v2:
- Add Cc: stable@vger.kernel.org as requested by Marc Zyngier

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 9e841e7afd4a..c3a5e2f1d09a 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -605,47 +605,53 @@ int vgic_v3_save_pending_tables(struct kvm *kvm)
 	}
 
 	xa_for_each(&dist->lpi_xa, index, irq) {
 		int byte_offset, bit_nr;
 		struct kvm_vcpu *vcpu;
 		gpa_t pendbase, ptr;
 		bool is_pending;
 		bool stored;
 
+		irq = vgic_get_irq(kvm, index);
+		if (!irq)
+			continue;
+
 		vcpu = irq->target_vcpu;
 		if (!vcpu)
-			continue;
+			goto put_irq;
 
 		pendbase = GICR_PENDBASER_ADDRESS(vcpu->arch.vgic_cpu.pendbaser);
 
 		byte_offset = irq->intid / BITS_PER_BYTE;
 		bit_nr = irq->intid % BITS_PER_BYTE;
 		ptr = pendbase + byte_offset;
 
 		if (ptr != last_ptr) {
 			ret = kvm_read_guest_lock(kvm, ptr, &val, 1);
 			if (ret)
-				goto out;
+				goto put_irq;
 			last_ptr = ptr;
 		}
 
 		stored = val & (1U << bit_nr);
 
 		is_pending = irq->pending_latch;
 
 		if (irq->hw && vlpi_avail)
 			vgic_v4_get_vlpi_state(irq, &is_pending);
 
 		if (stored == is_pending)
-			continue;
+			goto put_irq;
 
 		if (is_pending)
 			val |= 1 << bit_nr;
 		else
 			val &= ~(1 << bit_nr);
 
 		ret = vgic_write_guest_lock(kvm, ptr, &val, 1);
+put_irq:
+		vgic_put_irq(kvm, irq);
 		if (ret)
 			goto out;
 	}
 
 out:
-- 
2.50.1 (Apple Git-155)

