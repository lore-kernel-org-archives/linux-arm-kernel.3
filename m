Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C75CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CwrvIo2xAF4E3cjhwp+uSOKbZbiJElEfvgD768xUMo=; b=pq7IEJWRuXMBcOpO/qhJEtZysK
	zPQiyjPOP9NB0jVgK6OB6T8WpXccVSnUv7xIBqSN0DPgsabXW5zKDMGYaO+Yn/pZ3LLafMSy7Fu5/
	Bel8xVAEJe2D1nPYS2Mxx1f8dpEQFj6X+S5BMxq2viw09cCtRAtayT6URGJr4uR4Neyz9x6wk1y6y
	vRtmFpKzzpvMu9gKWFtTmHlUJHTa89wd59GfuMi9w1MxRe3+D3EUery6rp4o03ivZnpsSiD+C/Isg
	jn8yQBHq75xYQ/pEYjA9zjvWQrLvyYHEt5CBAo4JQ8sKnHs4++BGAE5G5QSvgKW8tf7PY6hZWCp7K
	ts29V0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq7-0000000AK29-3m7l;
	Mon, 03 Nov 2025 16:55:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq5-0000000AJyB-35Yd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 286686013F;
	Mon,  3 Nov 2025 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA86C113D0;
	Mon,  3 Nov 2025 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188928;
	bh=D6ThXSRZO2uuFBNvwNHEMq61UAk/PzFpLpciFk2Nw+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7GSaK7OPWiiIcHJbO0nWOheoD/cBmHo8NiA5a/eWA/FN14Ba/syrJVu/HaYuX4a7
	 FumPmby4o9wMFexDtQSkQdCR8Ht+9LOn6Kb2Ok+ZcGkKtVOaoLp95ji3IICmdHygl0
	 44bjxkueadHJzitVx2NCua/vZFYt7KjiB47p2D10/3uUaVqGVlg+yVHNgBOQ1hab83
	 JEfiVTY766RT0O/2B4BcT4XbWu9eo8uRqvVVD0dFolhpUNwn/9OaFG2gAXYl4MRME0
	 2jUeqrhAdSi/YP8gDgqtNhGdNjf1ywripZg0F/BTkBH4OY/0VlWR00f4jd/NRE+DZn
	 QxgS5l9QmU1fA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq3-000000021VN-054s;
	Mon, 03 Nov 2025 16:55:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 10/33] KVM: arm64: GICv3: Preserve EOIcount on exit
Date: Mon,  3 Nov 2025 16:54:54 +0000
Message-ID: <20251103165517.2960148-11-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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


