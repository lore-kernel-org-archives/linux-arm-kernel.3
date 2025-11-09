Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35E1CD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CwrvIo2xAF4E3cjhwp+uSOKbZbiJElEfvgD768xUMo=; b=toyKNsfKvrEuNL6PcNuHjhAq1m
	1eOUujLWgWrtf7F8Br6E6FvgB694SZ0hYrgxVhAzAnPZKX3Rt6QTrZPpTfywpgT7bOo8+pFhsOQ+g
	FPxtA7/2RqVWPC/GjQr8EFaJzLbLMINUK2Te6Ro82OxKvHrQt3MHd4t8DyOi0ipqMpCoGOOEeuDUV
	FCncnABtr0ia7ZOksthHBqzW2ydgw0Z4gYEqb8lSd6sU6his5b4ZUnrE9WEBHvwhgoPrioWEaI9Nf
	BasRCFBzJOhAbZMjuRzuSIa8Thg7dYDeTFne2SmX+a56LJp6OYMz1qj5SO69QqZTvohx9BuynLDLb
	yPMa2JNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI920-00000004CTG-0XeF;
	Sun, 09 Nov 2025 17:16:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91l-00000004CBP-3XxV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9544446FA;
	Sun,  9 Nov 2025 17:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E17C19424;
	Sun,  9 Nov 2025 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708592;
	bh=D6ThXSRZO2uuFBNvwNHEMq61UAk/PzFpLpciFk2Nw+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HV3D1/Z/kC26IyvLDUVtnV0gH6Ix9wCUTNvgJhIqWEIcmk899/kXXDzP/m+vid1Vb
	 akyifkI47eW756Il1IpG10BcXyLoHXDVR3ZyPKZs8Vks6dhu6PCT56PNrJBZqlg4sK
	 V+DaCBbXnJvKpzmAA9PZcpuKg9FKJUXCSu83hripdMW0OMOrMG/nfevAGre5kg2Bvn
	 cw775gOjzaktH7a399SMtu41vgMDvd8yBZiJMszTLoVvRHhVCHXKNYPD4ce5PXk9Bx
	 yeQ6/QD6Wn6mExVR0sfWtkpI9uylrk3VNhvA18AnBGUzaz3p1SArF/Cav0PRrlZbMv
	 smDU9Qu/lp6QA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91i-00000003exw-2Lia;
	Sun, 09 Nov 2025 17:16:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 10/45] KVM: arm64: GICv3: Preserve EOIcount on exit
Date: Sun,  9 Nov 2025 17:15:44 +0000
Message-ID: <20251109171619.1507205-11-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091633_926192_0B3B3DE4 
X-CRM114-Status: GOOD (  10.84  )
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

EOIcount is how the virtual CPU interface signals that the guest
is deactivating interrupts outside of the LRs when EOImode==0.

We therefore need to preserve that information so that we can find
out what actually needs deactivating.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 00ad89d71bb3f..aa04cc9cdc1ab 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -225,6 +225,12 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 
 		elrsr = read_gicreg(ICH_ELRSR_EL2);
 
+		if (cpu_if->vgic_hcr & ICH_HCR_EL2_LRENPIE) {
+			u64 val = read_gicreg(ICH_HCR_EL2);
+			cpu_if->vgic_hcr &= ~ICH_HCR_EL2_EOIcount;
+			cpu_if->vgic_hcr |= val & ICH_HCR_EL2_EOIcount;
+		}
+
 		write_gicreg(compute_ich_hcr(cpu_if) & ~ICH_HCR_EL2_En, ICH_HCR_EL2);
 
 		for (i = 0; i < used_lrs; i++) {
-- 
2.47.3


