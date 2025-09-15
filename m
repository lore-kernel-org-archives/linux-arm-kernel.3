Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6A2CAC59C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPriv+Pd8wa1uu99iyTwHokwW0gFJjOWz79VvRz6XBc=; b=ywjG0SVv96d3Jip8EmlpvQTcy2
	nj4aPcoQ/yAJ8oJQtHC7ccc1b6v83lbEdUuMbfX5s/vYWLD0Z2ibu7l7OoQ/4Dzp6Qc/Q/tUUMxB9
	+zMXq5pUIrsbOgWaZ/lg4JjbxiHXogE54BL5HHfvBkghPKEa90/IRc1AlMx1myO7YeC0GLDATDkSw
	ner3mzVsJGGNMPI6X5i20nNS4bY2XwPUcGFi5k8kY32+AUw43yNUAntNo/tLZvDrFmdO/HKsubUhR
	/piL6/cwfy4VO9erDqeyo0DhbYT1s5QAn4TkMVeBERWWh6pyeKJDRQjef67oPKcGo8RnGeIyLE6OQ
	JqvPF6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dk-00000003xfx-06jo;
	Mon, 15 Sep 2025 11:45:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7di-00000003xe3-1XUy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:44:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96371601A3;
	Mon, 15 Sep 2025 11:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46108C4CEFB;
	Mon, 15 Sep 2025 11:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936697;
	bh=mhZ8FtLw1uVJo63UYY9F46ru+KoRuwK839fahTJQtTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1JNFNv1yOD+9Ejj0uf4Re90iikorvz5K5ZfV+zYMWsfZNMeQ5ZbJTxeZ+hW6Lgz6
	 4x1/EzPxBUjldVTa6N2bx4B8+Wanw5XAWauyxFF0DauyaMngXF9UiGJt1YRW87ZKCz
	 NCJFJubmhlAWiy8A7+5s38JtArfzZXj8TnwvAUuAYgnTpz0TxhRaxKZZdi4By7S9uS
	 V6bm/z8EnI2nHRP8nAY4U7K/AxtJ1ubIrglaMS/jKWrOgyxA+natg3Jlv8xGrOya/E
	 ts5guoJ5ggf+TAB5UgnHipT2JhcTpEmNGD1veJvHfqe8HP9h/5igsxOGM6hTLFzXwK
	 8qI1Ap1BQtx4Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7df-00000006MDw-29jP;
	Mon, 15 Sep 2025 11:44:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 03/16] KVM: arm64: Compute 52bit TTBR address and alignment
Date: Mon, 15 Sep 2025 12:44:38 +0100
Message-Id: <20250915114451.660351-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

52bit addresses from TTBR need extra adjustment and alignment
checks. Implement the requirements of the architecture.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 96452fdc90e2b..e02e467fc2ccd 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -28,6 +28,8 @@ static int get_ia_size(struct s1_walk_info *wi)
 /* Return true if the IPA is out of the OA range */
 static bool check_output_size(u64 ipa, struct s1_walk_info *wi)
 {
+	if (wi->pa52bit)
+		return wi->max_oa_bits < 52 && (ipa & GENMASK_ULL(51, wi->max_oa_bits));
 	return wi->max_oa_bits < 48 && (ipa & GENMASK_ULL(47, wi->max_oa_bits));
 }
 
@@ -301,6 +303,16 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	x = 3 + ia_bits - ((3 - wi->sl) * stride + wi->pgshift);
 
 	wi->baddr = ttbr & TTBRx_EL1_BADDR;
+	if (wi->pa52bit) {
+		/*
+		 * Force the alignment on 64 bytes for top-level tables
+		 * smaller than 8 entries, since TTBR.BADDR[5:2] are used to
+		 * store bits [51:48] of the first level of lookup.
+		 */
+		x = max(x, 6);
+
+		wi->baddr |= FIELD_GET(GENMASK_ULL(5, 2), ttbr) << 48;
+	}
 
 	/* R_VPBBF */
 	if (check_output_size(wi->baddr, wi))
-- 
2.39.2


