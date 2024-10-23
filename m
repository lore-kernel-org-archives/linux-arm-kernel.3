Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA2DCFA445
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUBbRPfDl6CiHVlIIfw0UGwvoLtrzFQnulm7vGv6oLI=; b=iHz3YKAjS3SrAytWC5ElLha6xI
	h5dxbcATpTboyuUHeyPSXWLpH+Sn6Xhq6rUyGMxXz6zMJJrp1myrsHkA5v1ywnscxjrF5ds02IaN5
	n+D01hr61wtrETBuarDS0aQAI9xi53TqylCCQSU6M78Q0JI3CvLxSG7+IG0uysoKjd9P5nqOyUF7i
	csX+5P+jEQrXH0p6HWXbMqubst8SxpR/lR+0IfxdDuGTD0jtkRTivjEEMrVvEdffZQBG8aBYo9Md3
	wDx4WK0z5M0AjYH1qtjZNNPyu2d/8qjDXIIoAeDRYjlkZzElSKDKHtM0nu0vfuqJaBc2in1VcN6yC
	6vswe6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dh1-0000000F35u-1wXK;
	Wed, 23 Oct 2024 15:54:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckM-0000000EpL2-3I8l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 559D1A4501D;
	Wed, 23 Oct 2024 14:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C3AC4CEC6;
	Wed, 23 Oct 2024 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695238;
	bh=n7QHz2ieFv34eW5Zkyhf4MKFxk9bAobNuldVjF/QHxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CY7jxMtEKVV1lb5zPSYur8W3AKV8nGKk30puGDAo/W6hY9/exsQwg3dQlvWTvfY9r
	 jHwdkf9xv3XQcfJTDYLFgc+rTxFKrlAPv1fus4Y58ng3yUWAHi2aZbTFO28k4jkHiY
	 X+bAaJwuyQlVsohUu5o/TAOFi7XD1BelSr3yrWKnoXf4axv5aqoGat4FwCUfIt8CwO
	 qqrXw0tbZ/3wyYAQZiBd3oxrFM1XXzPLHZ/6gBpR9HbuWppqwh7aPVrld5H0CKitIA
	 F1J/cdyUfSPnYMKaY6qh9HnfZKnyJ33Kn3P9Fy0kU+XsW/zJVmWsFgviogJWyd5Pvd
	 L7AoBQ+nanK6Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckG-0068vz-Ax;
	Wed, 23 Oct 2024 15:53:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 33/37] KVM: arm64: Add POE save/restore for AT emulation fast-path
Date: Wed, 23 Oct 2024 15:53:41 +0100
Message-Id: <20241023145345.1613824-34-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075403_121083_05E062C8 
X-CRM114-Status: GOOD (  11.31  )
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

Just like the other extensions affecting address translation,
we must save/restore POE so that an out-of-context translation
context can be restored and used with the AT instructions.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index de7109111e404..ef1643faedeb4 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -440,6 +440,8 @@ struct mmu_config {
 	u64	tcr2;
 	u64	pir;
 	u64	pire0;
+	u64	por_el0;
+	u64	por_el1;
 	u64	sctlr;
 	u64	vttbr;
 	u64	vtcr;
@@ -458,6 +460,10 @@ static void __mmu_config_save(struct mmu_config *config)
 			config->pir	= read_sysreg_el1(SYS_PIR);
 			config->pire0	= read_sysreg_el1(SYS_PIRE0);
 		}
+		if (system_supports_poe()) {
+			config->por_el1	= read_sysreg_el1(SYS_POR);
+			config->por_el0	= read_sysreg_s(SYS_POR_EL0);
+		}
 	}
 	config->sctlr	= read_sysreg_el1(SYS_SCTLR);
 	config->vttbr	= read_sysreg(vttbr_el2);
@@ -485,6 +491,10 @@ static void __mmu_config_restore(struct mmu_config *config)
 			write_sysreg_el1(config->pir, SYS_PIR);
 			write_sysreg_el1(config->pire0, SYS_PIRE0);
 		}
+		if (system_supports_poe()) {
+			write_sysreg_el1(config->por_el1, SYS_POR);
+			write_sysreg_s(config->por_el0, SYS_POR_EL0);
+		}
 	}
 	write_sysreg_el1(config->sctlr,	SYS_SCTLR);
 	write_sysreg(config->vttbr,	vttbr_el2);
@@ -1105,6 +1115,10 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
 		}
+		if (kvm_has_s1poe(vcpu->kvm)) {
+			write_sysreg_el1(vcpu_read_sys_reg(vcpu, POR_EL1), SYS_POR);
+			write_sysreg_s(vcpu_read_sys_reg(vcpu, POR_EL0), SYS_POR_EL0);
+		}
 	}
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, SCTLR_EL1),	SYS_SCTLR);
 	__load_stage2(mmu, mmu->arch);
-- 
2.39.2


