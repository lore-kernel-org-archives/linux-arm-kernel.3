Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255F0C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 22:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spw3TDdOtLdIsF7CwDxVZdY48WpWL2JF0u4UNC1DfkY=; b=oR7w43B9svYLs8WXhXmxShTfAQ
	Xvz6g5wmGnNy80xt4SQrBkdsas16l268ghFbivselJ7RHC/1PvthKovLH0st+7KwpIo5eQ7WAoo8E
	lhpx7A2r2eDFVR1SrmW/ufK0vqOFJlGGHFeUOCb+H2Lu8Rk4E+a3fgx/1uHep6WlY6Hyk21Bksu1o
	PaSsjo+2AzfMuPQzmXK3+BfWddqAcSQSqhO8Gll61FiMnecTyuEjFkoCAOiAqSvioUm8V/f9Ljall
	0NNh/wFyJ4CbBgHOuiDEWH1/W+mQB+fzX5xEHzdE5ByMPrUKtl8GfEwEezHET6KZvav03lEaRjSyw
	2JxK0QoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwozy-0000000AcW0-30e2;
	Wed, 19 Aug 2026 22:43:06 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwozu-0000000AcU8-24yf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 22:43:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-472326ca506so1045426f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179380; x=1787784180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spw3TDdOtLdIsF7CwDxVZdY48WpWL2JF0u4UNC1DfkY=;
        b=o3vJBWmEM5nrvu4jn+EQYNzzHsW6XcQ44ZSSes5yXlLyUCtXnDOifreIrwx53HDi+q
         /KEKr6i2PquFnHS7/k9gQiuLyi0peudzzxwEFBycQg5G8rQETWtlrBd34WnFSijuCyNr
         UJhqKs0831wVDyqGJJjGMhZrqr95aiLfnAx9++bA06rncpdKC9CKTZAAevSgw8VvSkuU
         KB5gfans44u8w5LxPVEk2+hLWK8Mrcv9YXhmy/9XPq/4r3VMh6krw9bCF9/jMRRJdB9i
         xP6oVI2I+TZQR4Iwm8ARPp8TY0didihszUwxxvQUpWxZEq2+Ld3wKLGFPyISU8ivpiv+
         kH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179380; x=1787784180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=spw3TDdOtLdIsF7CwDxVZdY48WpWL2JF0u4UNC1DfkY=;
        b=Alk1XIW9HrknyZREg6fXM0Cg62sVH26zsvrCbSgPjghzd8LmdTZuhajWZ3V/jZPOlL
         7sKoPotW/Tn5EAIvsAGmDSqJHTCvOyyhLBAI6yimf1wN+mO29eFPlXXK+MZAbLnrf7p5
         d3tOnrUjHJdpto5Rq+81f1bAOglLoZoOrDCxMTL9vxs1T4U5R/Dglv5woO7CXo4x6IIR
         7p94zAf9s6mD8uuiqlMlpEsu5cHFfEbKJoYEtR4Ta//dbXIYmTY4DVbCk1s/s4M2Ts1t
         gavfsq8mVAT3QFeZcpRq2BZFC10beUDR09OX66VMOFSc5c6iYUWwAQnbSF46dfqZvfVf
         ulBA==
X-Forwarded-Encrypted: i=1; AHgh+RqwpXoV2StMLHLPZQS4vMRqJ9HMNWLxKA9YEQf4Mg+09lIBlN2R/l/yiOZYMR7XdHd4M60nvC16yKSSbFYczz0J@lists.infradead.org
X-Gm-Message-State: AFuF++l+OuqhtdCdtoPSm2SODbyhCetJsMhIktg22KygPQOHseXf9Kcb
	cA+U0aaRnX4Pcl39Ie3eomkgghYyphTXvN3b/CGNEtvDhBswW0wu1y1E
X-Gm-Gg: AR+sD12v6PfAakysYsvDQXzpK87iVQ4MIRyxHl7OwomuMcfNiylSyhzgDFS2y0CVj2z
	ydum+JDhcz4o++1MXRnkBS+JxuPfI7PHfs+FYDzs0jqxZpPPg7/w40wzG+7LFHDtqq0a2fAvX9G
	ZCyHacpXc0sjzCuB4wtQIvzRhItqPJsAzgf1SmeTgB8Z2pxKBU7Jy+HUsh5qKmCdRWsgd3zimqN
	IXM1crBm9UPBklV/UaJTh5kEn5ejnRexEnS7eOnZah0Qhe21DF0P4Jg1BAq/O+FaJ7Z2UCvM/gY
	NjyhbsAbnOvaqgfX5/O6zgGfIEQMPs9Qfs25Ccn+xugwJROOFBSfNxaia6AjNRw01vYCm1mRWCF
	l0iH0p0rBEcqA3fhl0vrbhA+iIgATfjkA4mVCt1RBxRZUQ2qWHtUBsJG4zpFTQGRCXOUllGzVS5
	Dx/vlvEhliuDj5Sk3/sflqA96hNQZBpnMaIB+vAjbP++BoP4titeMOaHxzkiFYoS0AzoIPDPBD8
	/C0oxdlzKqJmd6atEQc2CT7SXCXGFalbee1cm+oLHOfHp+AFseSjTfKHrElbTKsXA0FR7W2I0Cp
	Z/v9Bi+Cu7rcmLBHQjSqrWRADNG1SIaBqXMx0Ud3rZ6naXcLs22u6zZXGTKkSyelRbU=
X-Received: by 2002:a05:6000:27cc:20b0:482:bb55:8bdc with SMTP id ffacd0b85a97d-482bb558d7fmr23879f8f.1.1787179380523;
        Wed, 19 Aug 2026 15:43:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.42.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:43:00 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
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
Subject: [PATCH v2 1/5] KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
Date: Thu, 20 Aug 2026 00:42:25 +0200
Message-Id: <20260819224229.82948-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260819224229.82948-1-kmehltretter@gmail.com>
References: <20260819224229.82948-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_154302_555295_29ADA563 
X-CRM114-Status: GOOD (  14.23  )
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

Advance free_index when assigning the slot. On registration failure, return
the slot and clear rdreg and base_addr.

Fixes: dbd9733ab674 ("KVM: arm/arm64: Replace the single rdist region by a list")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d8301..c75caadbd1d3 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -766,6 +766,18 @@ unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev)
 	return SZ_64K;
 }
 
+static void vgic_unassign_redist_iodev(struct kvm_vcpu *vcpu)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+	if (vgic_cpu->rdreg) {
+		vgic_cpu->rdreg->free_index--;
+		vgic_cpu->rdreg = NULL;
+	}
+	vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+}
+
 /**
  * vgic_register_redist_iodev - register a single redist iodev
  * @vcpu:    The VCPU to which the redistributor belongs
@@ -818,16 +830,17 @@ int vgic_register_redist_iodev(struct kvm_vcpu *vcpu)
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
+		vgic_unassign_redist_iodev(vcpu);
 
-	/* Protected by slots_lock */
-	rdreg->free_index++;
-	return 0;
+	return ret;
 
 out_unlock:
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.39.5 (Apple Git-154)

