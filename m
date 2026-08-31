Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAABEC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mg0FhLj+v96vUWe+LyIXKQir5MTYCv01Q4cNbefOBGw=; b=YEAbxNURvSoQpJ9VVPpv25pHB8
	ALiUqIdpImdGAKFqsW1kXvIOjtQftQVR7AGABvTt+IY+ICECHFqIyavzjDdTFahWuij2HGSzuropX
	gvkgyoscSe0SnB2LZGLpJT/VQS/z7Oh/ug1ssRDBnmwOwPdG43CV1GSgJ+5VZA2fST04eZYWVu5mU
	WqZHH4dp0aWKgOTBIgmhbg9HpYt22+65G2OwNP6ssVAxq+p7i87++w5vzaECMAGcP1+yTrjSvF5qf
	4PWWAEteP+RoaBE8pLwfignF4yj8jDCHMLSrFPa30YcS6XTqR8BkGT/NrYe8rfGrkoXmM/tZzGEgs
	RLktbNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x65-00000008ngo-3j4o;
	Mon, 31 Aug 2026 08:10:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x5y-00000008neC-2bAE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:10:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4956869750eso20000265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 01:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788163821; x=1788768621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg0FhLj+v96vUWe+LyIXKQir5MTYCv01Q4cNbefOBGw=;
        b=ZgjI0r34YQuTY4Q65ly+l+0/E/caG3RTCPnmTfbySuQDex/skLEaW8cq/0jAjYCjHd
         UbVIq9Lh+sOqff87YCAKIzsmbcv0EL8UR4GewTgrfnKjh8nZTfeQ3rUODk45NJqiu31R
         xN+oTxtAj8fk+tiDUwc29brDYm+ehxO6ialpSKxNt8OZWboQlsxSoCCFzYf5vzmDY5Fb
         et9hU5Gz5RWXihvt38BvqprzkKXFyC5tpS5gNlyL1+5Vm0uk5zrVqOqBYBz8kUgp6XUj
         hibaYWdylOAO03FAkxxYP+AcxWiuv7eMb/TEl/gfh4IFYlVA24FEfMRpdeczfuJOGqRI
         VlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163821; x=1788768621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg0FhLj+v96vUWe+LyIXKQir5MTYCv01Q4cNbefOBGw=;
        b=aIKwfvqxJUyuESh6BdKDX288Ku4gmM/i7ekTdVMbAp5dfRUEl1l7iPLu0XGQ8cnCQM
         5t6qbOiqP1P7T9bhTr+ZGNgpm5rQXA68pBR9fcOp/JGC19pryFw1toeUwho1QqbcV+2T
         zSmXzonz8YkRfdEZJxeE17mANHePrgduoPxnmuBwxvUw6OfQnCILg8g9BU3dWkzUJZ2P
         i05EXyzDW/9Iw9zOQoN8zgaMET3HoyJewQMFQN1xqn4tRcobRG8pSsk6M2JGEIseV0KQ
         B2H0XiF75KUuxW+75GrHgvR5Ek1RbIkGVjONBKkqE87PY3wa933wMlxFmW03mtz7rOJi
         QI4w==
X-Forwarded-Encrypted: i=1; AHgh+Ro+47XuDNLQrHngAA72QDmop3ITgve2tq6nesmiiThxh9mdpKuc+UopmTzZD8uLR+O+ybAnpStqc6dcYQf7jZU8@lists.infradead.org
X-Gm-Message-State: AFuF++lSwo5UGnyd1yuACpAdT6c9owkNrGUzNbgJHi+xoEyYfrsqKmw0
	+QVJr781YiK8lflHUdBSnr9/YiPmPFQ3zVCZTzT+Fim62eMT9TELf02Y
X-Gm-Gg: AR+sD111JdiXmCNTRjJ7Mq4pttSXEQI8WHEXLs3PhWsQfZDkSl7uXb0xGcTOj3RAAv5
	ng5GURxFpSBrBFVmoQ09hChn81x5RN7ZpgNWixJC6HVwGf1qEvbhvWSnBZ3nYZ9sZrs2fWF7YMo
	c3JwbHU+HFi5U3UBDiSoUl8hPrwtX4OLwHIkLZcwChtvI56Igk2jeBeC91ATgKaRBpb8WebMxV1
	BdZni+3lQpQaed5s7dpH/I7R8WAaCU5iUpwuXO/n3cPI5twwvL3+y5XZnp5mI6GeeP/M6421dFW
	IjQAqOKnzCEtxbOisBIyX/AkRyrUsibOVcx8pjYd0L0QVSNdnLca0Vf7Zxf8EWd/LJF+CKzJr6u
	8ckQVIrIL7Zgu4eW6jp/R96TqYXFGO/FdVP9UvEL9rgVqQMzZy7XT+XnyN8jxW8pm/ejYH1BRIt
	0qBZHot0+Chja9ufoRY4vTcuetbQkMGpqMwKcQwUaMJ6otnZcLWQQdwjE9Rq/++OT0rK2DYJU1N
	5qlDKTtosdMYSGZHwsMqqNgA/II14fIAUSQwCam35izYjIODI9MIeG1AaeWImqouRn5RZStbeGU
	H9ruX+bOfcGNxE/K4Uys/fepEFcVVdjsU2f4p9BWrF5ILg0dTEXjLyCwNiM0+CbZezCiHvs=
X-Received: by 2002:a05:600c:4f92:b0:49b:90cc:3c87 with SMTP id 5b1f17b1804b1-49b91c487b2mr367309225e9.13.1788163820227;
        Mon, 31 Aug 2026 01:10:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm370393515e9.12.2026.08.31.01.10.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 01:10:19 -0700 (PDT)
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
Subject: [PATCH v4 1/4] KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
Date: Mon, 31 Aug 2026 10:10:01 +0200
Message-Id: <20260831081005.41346-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011022_674959_A429CD4D 
X-CRM114-Status: GOOD (  13.14  )
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

vgic_register_redist_iodev() assigns a redistributor region and base
address to the vCPU before adding its iodev to the MMIO bus. However, the
region's free_index is advanced only after registration succeeds.

If kvm_io_bus_register_dev() fails, the vCPU retains the assignment while
free_index still identifies the same slot as free. A later registration can
therefore reuse a slot that remains assigned to the vCPU.

Reserve the slot before registering its iodev. The caller holds slots_lock,
so a registration failure cannot race with a later assignment. Undo the
reservation and clear the cached assignment on failure.

Fixes: dbd9733ab674 ("KVM: arm/arm64: Replace the single rdist region by a list")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d8301..22897ce64dbf 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -766,6 +766,19 @@ unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev)
 	return SZ_64K;
 }
 
+static void vgic_undo_redist_assignment(struct kvm_vcpu *vcpu)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+
+	lockdep_assert_held(&vcpu->kvm->slots_lock);
+
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+
+	vgic_cpu->rdreg->free_index--;
+	vgic_cpu->rdreg = NULL;
+	vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+}
+
 /**
  * vgic_register_redist_iodev - register a single redist iodev
  * @vcpu:    The VCPU to which the redistributor belongs
@@ -818,16 +831,17 @@ int vgic_register_redist_iodev(struct kvm_vcpu *vcpu)
 	rd_dev->nr_regions = ARRAY_SIZE(vgic_v3_rd_registers);
 	rd_dev->redist_vcpu = vcpu;
 
+	/* Protected by slots_lock */
+	rdreg->free_index++;
+
 	mutex_unlock(&kvm->arch.config_lock);
 
 	ret = kvm_io_bus_register_dev(kvm, KVM_MMIO_BUS, rd_base,
 				      2 * SZ_64K, &rd_dev->dev);
 	if (ret)
-		return ret;
+		vgic_undo_redist_assignment(vcpu);
 
-	/* Protected by slots_lock */
-	rdreg->free_index++;
-	return 0;
+	return ret;
 
 out_unlock:
 	mutex_unlock(&kvm->arch.config_lock);

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.39.5 (Apple Git-154)

