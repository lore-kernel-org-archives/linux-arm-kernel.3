Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963FFC624C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQe0/H8SNUjRW9auKFahnt1W5WCW5fFGWugsoqcSd7E=; b=PDprnPrpdV79X+Nw+91+7zzuT/
	zVCSHvwWgvj7Q6NpB3vNxNFYBb5KaofZZZHYq2w1zhF7fJhKQVSpDPlv2GbrLECRyyG1wwmyVEsfZ
	/nUJkbqBqOxgOHifGwgzJREWwn5GGGmKztCIxFkpwQagX6SMLpcS5cXI/qkmRgt7EdFg2/cEaJtXn
	Xx1j10tVNEVXMIZO8a69HSmffxKqVpuCc2vQ6Zxh65NkxCWE3VibG+AAls6DanzwFX2SHcdbXrlcc
	rvNmmr2cn/CNWagWuBsyZSR4CFSYma/wffBY2STkAVE5goYoTUYX1ciIBfSop6T4ADngGA7q7dUNC
	P2Q09Vog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x66-00000008nh6-03fH;
	Mon, 31 Aug 2026 08:10:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x5z-00000008neZ-3wEL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:10:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so36101695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 01:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788163822; x=1788768622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQe0/H8SNUjRW9auKFahnt1W5WCW5fFGWugsoqcSd7E=;
        b=oDBaRkBfH6IGvUfubzo+Hx0svoixs6YzY2Fvffh/iUzqSmn6yKHr7x+ALW8eFA+CZH
         n4qonSQqWXvgYxzShLvFrqHE03W6KNnpG2soU/ocxL27jf4WfiQQKQKeUUg3kE5LUf95
         B47YcL5xvPJDaBp9qUrBXNe2DH1AnPBTzahO8jNu/xCWhUd5veqBvwImXwQ3tqZiOCqm
         wH5SouVR0Z7AmTE8F4I9e7YlvxtdXFhZjfmWPrWaDakNdvCXWZP+VjX6hL1i8kUozWmw
         pdtfD35hHtR1Zf2yO0DpqXeAOAniY9ZM3+Tg9RCu7698zCbVVY64OVDXg1Eh1UA2YQ2k
         2sRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163822; x=1788768622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQe0/H8SNUjRW9auKFahnt1W5WCW5fFGWugsoqcSd7E=;
        b=bXSnUobEmlAV7Je4LRPVO2ovfY621LeztMWLJ5UwKNKj5xazgoA4YFORWMxExAedth
         pcnf9pl68O0TWn8/v60xOOz4J9J0yyRlHll9A8goXy/ixSAOBveEjb5HJe4dedRm/NhX
         SnydMqIKrT4BDSFJTVcpx+c8qjrHgvUS5Ho1NNcolYzcTOkgEAOWpb2ljTEH+Pi6ddEt
         pyswZ55PP7O5rTeNc0u+71Ps1DAUry3c1wN88sr+C4xXsN1BSWIveqCWHU+5DGMxKTa6
         q4nYG8jt8Ua3x9Utt9jRZutrsa2KJK1kPXctkCVEH1pJKfm8eeHbkWMkgK4v4x+XKakk
         AhRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnWFOWUtnsJdKvtGQmXtmtlEgSEKXr3y5ravYUH87thIW0ykB5zR8ZUqFQqohmMdD3Qj9OhSNeTkUZ7rzaZwbY@lists.infradead.org
X-Gm-Message-State: AFuF++mDJ/mnUjlkAAT3qhziMi+Q4HMFDAH7qZDL+dMa1G8lwfHxplqW
	d+488/1PdZmw7akYl78bNE3BdIFU0UZx1WzY5AssEB37X5bTZYEHFZGh
X-Gm-Gg: AR+sD11QBBdCkkZux1Wz4WNSKOAIyrYbgcYUCrDw6q05HZjUvQZI4aG1u7hKe/HK+aZ
	mecJ1oi6o9NdpKJbGR+BkGGgsim5DehyqJYSom/03+4O74ehkq0wDNovFhBwKzsn/qOJA7ta8nN
	xPzpGxJJIWPz7FRzRV/4/2W5eOeM6E4EwXWn5NgJHh0JnewgR/5qBM9DBGUIYXTPtMfZhRqMgqJ
	XuLk4D5Lqf/6U5DeRZBVm4Sf6ms+/Q72hojmg+WYhbHI+0dvm9Mk3Cg+FO5et1XW5aN0ItWRHri
	j2fGlQQ22oM+qwu4miX4bPzdtPmTiaQmiMjTROup1QGuWInEklCcHigvvSJZ9CeIwKWyvldO7ny
	i+5tUF3GuBxo/9Wtxw9B3Fblyv23l6736J5wvm/x9PsUtB9Oiu9P6sGGvmPwGfEStxz9hqJup3W
	5xmOka2q81Qy/Cs4dOXidC/fVV0XtWdycdXlCy+qb1nfWqjMwH/QUsgRkPjbAqIfPlGVRajLMWn
	XMMpN4KAl46CFbklFkEdAIUWj32fjOJstFluo1Qj35sPokU/RjZbFr5lPtGu32vvM1b/plFpJAE
	h5ROjzWix6yJpSTNNnjGMTO6mQ9KBUzfAJYDJSsUt5O2kPNvrIm1TbWS427EksjXYAQ9vcs=
X-Received: by 2002:a05:600c:c3cf:10b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49b91c47b76mr281088265e9.12.1788163821808;
        Mon, 31 Aug 2026 01:10:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm370393515e9.12.2026.08.31.01.10.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 01:10:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 2/4] KVM: arm64: vgic-v3: Roll back assignments from the new region
Date: Mon, 31 Aug 2026 10:10:02 +0200
Message-Id: <20260831081005.41346-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011024_006649_11C59A1C 
X-CRM114-Status: GOOD (  16.45  )
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

A failed REDIST_REGION write unregisters the redistributor iodevs of every
vCPU processed before the failure. This includes vCPUs assigned to older
regions. Their assignments remain cached, so a retry does not register the
iodevs again.

The vCPU whose registration fails has no assignment to roll back. For vCPUs
processed earlier, limit rollback to those assigned to the new region. The
region is removed on failure, so its free_index does not need restoring.

Resetting assignments from older regions is unsafe because a vCPU can own
one before kvm_for_each_vcpu() can see it. Rollback could then move
free_index behind that live assignment.

kvm_vgic_addr() holds slots_lock across the REDIST_REGION write. vCPU
creation takes the same lock before assigning a redistributor. A concurrent
vCPU cannot acquire an assignment from the new region before rollback
completes. The lock also keeps rdreg valid across the config_lock drop
required by MMIO-bus registration.

Fixes: c011f4ea106b ("KVM: arm/arm64: Check vcpu redist base before registering an iodev")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 32 +++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 22897ce64dbf..77aa8433701a 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -855,7 +855,25 @@ void vgic_unregister_redist_iodev(struct kvm_vcpu *vcpu)
 	kvm_io_bus_unregister_dev(vcpu->kvm, KVM_MMIO_BUS, &rd_dev->dev);
 }
 
-static int vgic_register_all_redist_iodevs(struct kvm *kvm)
+static void vgic_rollback_redist_iodev(struct kvm_vcpu *vcpu,
+				       struct vgic_redist_region *rdreg)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+
+	lockdep_assert_held(&vcpu->kvm->slots_lock);
+
+	if (vgic_cpu->rdreg != rdreg)
+		return;
+
+	vgic_unregister_redist_iodev(vcpu);
+
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+	vgic_cpu->rdreg = NULL;
+	vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+}
+
+static int vgic_register_all_redist_iodevs(struct kvm *kvm,
+					   struct vgic_redist_region *rdreg)
 {
 	struct kvm_vcpu *vcpu;
 	unsigned long c;
@@ -870,12 +888,12 @@ static int vgic_register_all_redist_iodevs(struct kvm *kvm)
 	}
 
 	if (ret) {
-		/* The current c failed, so iterate over the previous ones. */
+		/* Undo assignments made from the region being added. */
 		int i;
 
 		for (i = 0; i < c; i++) {
 			vcpu = kvm_get_vcpu(kvm, i);
-			vgic_unregister_redist_iodev(vcpu);
+			vgic_rollback_redist_iodev(vcpu, rdreg);
 		}
 	}
 
@@ -984,10 +1002,13 @@ void vgic_v3_free_redist_region(struct kvm *kvm, struct vgic_redist_region *rdre
 
 int vgic_v3_set_redist_base(struct kvm *kvm, u32 index, u64 addr, u32 count)
 {
+	struct vgic_redist_region *rdreg;
 	int ret;
 
 	mutex_lock(&kvm->arch.config_lock);
 	ret = vgic_v3_alloc_redist_region(kvm, index, addr, count);
+	if (!ret)
+		rdreg = vgic_v3_rdist_region_from_index(kvm, index);
 	mutex_unlock(&kvm->arch.config_lock);
 	if (ret)
 		return ret;
@@ -996,12 +1017,9 @@ int vgic_v3_set_redist_base(struct kvm *kvm, u32 index, u64 addr, u32 count)
 	 * Register iodevs for each existing VCPU.  Adding more VCPUs
 	 * afterwards will register the iodevs when needed.
 	 */
-	ret = vgic_register_all_redist_iodevs(kvm);
+	ret = vgic_register_all_redist_iodevs(kvm, rdreg);
 	if (ret) {
-		struct vgic_redist_region *rdreg;
-
 		mutex_lock(&kvm->arch.config_lock);
-		rdreg = vgic_v3_rdist_region_from_index(kvm, index);
 		vgic_v3_free_redist_region(kvm, rdreg);
 		mutex_unlock(&kvm->arch.config_lock);
 		return ret;
-- 
2.39.5 (Apple Git-154)

