Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C3CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 09:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqVzAbnyjF6+2pKtzAxu1aGHo1gAHNbWqpu34didy+A=; b=qfgYPUBzhou4szWjaoDSF9FvQA
	/nifdUKTPEF1pmDEdInnyOyPNwSdrG6tzZxnwGud4aYfyKJWOjKBIsKxxSwtFTTH6nfqiqqW1tMlL
	/rgFdCVb219RCQTLnIE0Fdkv6maBL1BMTdjvXkBMfc4UO2e06Nl2cvdvvpbg2t5ZXkUzRsb5syzmt
	eb7ykNnKll3+DvVerm+j+HGDBWyDBGj44ibN3Cr+TC2QiLCJ4YFjYCLWXefIwAQbnjUAkBI3SxjeZ
	/Jx/G/xXQD+T242htpPiezMccNSGe8VjIQDThHL351e+HinIUEEpOdY6mUPcXIEDyCRdSymsOBLAS
	P1zeHxIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQN-0000000ERNM-3QPq;
	Sat, 22 Aug 2026 09:54:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQH-0000000ERLC-0mAv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 09:53:58 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so2340446a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787392435; x=1787997235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqVzAbnyjF6+2pKtzAxu1aGHo1gAHNbWqpu34didy+A=;
        b=ewpYaDnw44RMeEvKV/2ED1csUHsx6q11Tt2DkGet5uqMDuCk1W6tGaE3qcRfPDOiFC
         /Bs/jJUcudls48qXT9/ccAlGh6AvT8fsuDZlE0iOjIKUiCYCEFwRUIukopfvr6iT3jk3
         V6ha7ieHBI87mECdx9xYpgihpTF40uaOHk9j1LXTKEIirjGbilXKcMXamMwnYDixXwVk
         lF8mUzNj0O9poVLLtlwdg8xFL94ygiqroOFasU6kGKXBlpz5765TxO+3SfAj/jmiLo1o
         s+iLK6NOGJKODb5jyDqEWHE6CsU2HTCy6kOC5TQc9dzFHdtQjGt4O6x6SXmiwpEUAFld
         2OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787392435; x=1787997235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqVzAbnyjF6+2pKtzAxu1aGHo1gAHNbWqpu34didy+A=;
        b=VVMc/8AyFizL9aFiM+IFkb0Df7gicpOMrCoI7V5ybfOpzkb994oVRktYzn51DihVhq
         YKBUn1zABxomOY1R9Nc2ucbpbKZ23iK0SWjQvqOlWuXEIZCV9lPKwA9ZFmmCQj3FKy3b
         7YJqn5le6GJshz0gRU5RUShlkuDeyMc3LHbTerbeM/MSpUXQ8bk9ifDIZV7/0gmyFIAE
         0ypIOA/uE0FKKwIS5RBeH7B0fa1D7GDQOyOKKTSHDlmeXK+9aRX+GVj6F3Zii0t5uEHM
         M/oSHOSBzcMBG1JtBO+ZUFSLvdBy1YF4Ccv/To/t5XI5oNIO9E9WP2CMpppj3jVH38UM
         f7EQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTBG/tvQrhtnu7HRzkfJAKTX6uAg/b8R3o95HxgWDVYklg5r+t2x+t6dmZ25pCg85lvlHM5KTy/ZbVNB/rVMYu@lists.infradead.org
X-Gm-Message-State: AFuF++l8IKb8eoFLrNMbeTumciTrjAh8dQpKMav2KydPj04Lf1diipRZ
	SmLuaUyYgxlDXqwUYurxAOefYAPY92LeNpRk+Eo0JK8b7wls/2T9MNch
X-Gm-Gg: AR+sD12pywq7i1yLzaP4H/k1zrWHsGqQ/n/AnfMcnsJarHMu1k1KQvgyQqWEY05UYqJ
	CQ/XJjzCrucKlPbbs2TpS+pDJLUp6Spjk/x5OY/+KySQTrq5pPQdBXnHqs06MiSZ3oRfwxifrFh
	0/wyU7nslF/ATpS232mGZ67EYCmkt0bvM6YWSyaCHDiaqpwEVE/0nvFVjmXoCICityhS3RJ4I4j
	MvUp79MzwauL8ByRxxARQhmmVoYl+qzhOK1QToQtRnql3jrzq+oWe7TvmbexYoKyRam9SYCrBmo
	7WDZpvf3sOA7ID1sPaWNztImFo3GwWiA8xwvvBT8YgvyjXbrvETg3pdsyRqMpMGSa/NvdlqwyHk
	5zB/7fmfju4fkBpT7xN2hOkVKlsC1MDs9kRqi738uF7n8/eVcqM10h02l4UFzYnyf6+ehh3ZN1G
	VM2ezoGORoVxHVLm/YwJ57yKM1hmgZBKlQnZ70gvlTKAJHLIT7p52piY1EHb1RHio276WsSN6e8
	RRU6Tp4iTENnythyPMIYziTJq3rlyiZhpjp8UkVkeg1Yn0PVRACdFPlsMQDPgdPqxSDUo2ufShM
	vvlKemcDcfijlBbu5AbLRuVPqHTDxZV6ehj0Ffkq4WAsmGtoOuy4TKQYl+eoB0w3gjEi
X-Received: by 2002:a05:6402:501f:b0:698:6084:db7f with SMTP id 4fb4d7f45d1cf-6a582b5f1a2mr5487769a12.10.1787392435123;
        Sat, 22 Aug 2026 02:53:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c327asm11151586a12.8.2026.08.22.02.53.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:53:54 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 1/5] KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
Date: Sat, 22 Aug 2026 11:53:42 +0200
Message-Id: <20260822095346.53882-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822095346.53882-1-kmehltretter@gmail.com>
References: <20260822095346.53882-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_025357_259183_04135C4B 
X-CRM114-Status: GOOD (  12.63  )
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
-- 
2.39.5 (Apple Git-154)


