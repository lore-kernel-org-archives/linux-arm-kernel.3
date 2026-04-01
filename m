Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9CBD35171
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKupV3VIyWIJgUf2uqmUiB2E/LaX8C+iimvElDBUhdQ=; b=qx1YCk860XF217yc6ppJF72AMe
	Psnk1hC4fYsv8xj/yGyLBlNVDTpkc0/7Key7djIP9XyijP6xRroXJJVxiPmPrMZmUAjLIKf/n6qSp
	3LnimMhx1Zof8m2l2trqHHrNhx5OK2TBP6y2fWUCK4AVohm8EJypHc8SkaKX711Y31tjaHImKC7il
	/qGALOKqibDg11KYaLpEOaiD3kU2yjTJ/NQ67MBREG1dk3E0umb3PBcFVuwqlG7Pti68ZxTcwFygI
	9ewCgtzi1uveFs1bGZZSvzGTOla3TwhuqBL7+Dxdt2NazZ0c35dUO8BP39PmfeYBjbZTgY6hFPfP7
	I1W/kQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7swB-0000000EWKz-2J2I;
	Wed, 01 Apr 2026 10:36:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw5-0000000EWBV-0Pz2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 359F940813;
	Wed,  1 Apr 2026 10:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAD9C2BCB5;
	Wed,  1 Apr 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039792;
	bh=xtvnTDSUGx89lzG8mtjye1LfgZ1vl+5viyWjfbbqRxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iOvVH7mNXfyBK1Q8QeaW5W/W0DB7uVts37OEPb/rfAHs3J84QiqIgcGlnhJXcPN7B
	 ITMelKySZ3WU3k2pnEXTeq797KcUj6nckJh2VKtCP2fePC04AXbk9AIaVE/6oPQFc/
	 oxQGdDWfxwKOhDiipi5+QOC1zBcM1IcroUGgAGbb1TW5UrfnKacXcjxW0oUIUmtuht
	 /EGvJl2zcY+38M/xqqpBUriRd0GSKUcdXaSkGoyd7abHx4OMw3zh3wJVceB1eo8ZUh
	 Vz3qOBInMOd4mN0/YDtAHBAmqdQxCK7loKSN2a0KTJXw5t3ItFrQ5GbXxAID1EFESP
	 QVdkjVLE24bcw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw2-00000007oRQ-1HXS;
	Wed, 01 Apr 2026 10:36:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 05/16] KVM: arm64: Account for RESx bits in __compute_fgt()
Date: Wed,  1 Apr 2026 11:36:00 +0100
Message-ID: <20260401103611.357092-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_033633_162022_BEEE3F54 
X-CRM114-Status: GOOD (  12.52  )
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

When computing Fine Grained Traps, it is preferable to account for
the reserved bits. The HW will most probably ignore them, unless the
bits have been repurposed to do something else.

Use caution, and fold our view of the reserved bits in,

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Fixes: c259d763e6b09 ("KVM: arm64: Account for RES1 bits in DECLARE_FEAT_MAP() and co")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index e14685343191b..f35b8dddd7c1f 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1663,8 +1663,8 @@ static __always_inline void __compute_fgt(struct kvm_vcpu *vcpu, enum vcpu_sysre
 		clear |= ~nested & m->nmask;
 	}
 
-	val |= set;
-	val &= ~clear;
+	val |= set | m->res1;
+	val &= ~(clear | m->res0);
 	*vcpu_fgt(vcpu, reg) = val;
 }
 
-- 
2.47.3


