Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AFF10A88DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPpx/Q+GVTNOuVl4tbyuxiFqJFoswe0JenU6+3/COkI=; b=cxybowte7Emg6QTPnVfG7C4uZo
	yt0PkKKTdnVZAa3/J4tTxB8FDG0kHc8o8jqS5eEwbaceiEre+JgR9nuvuRVbQ0fnb6OM5L3lEKMqj
	WwNcGDcFSSVxB/ZKM0dw8k/sXkRnz/+rfWioR3IGUaLBCcHPk0SjkRtFI/BPeTr3mlGnAvxQpQxtQ
	eviAlwGpJqEdf22GaKD06iNgt5OIOp9Z4dB94jOaAzYs6pwfyKcL0bxh4f1q9RXm7btTZoItLv8q5
	GCA58DygN7GslALzxFEFZfcyESEEQmP0z4ih8N8KoC7YxeqBAIHWt3KvqvUwA3J62/CjiV+7Q4Na9
	wTukva6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkE-00000005l3r-2MMp;
	Thu, 26 Mar 2026 15:35:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkE-00000005l3E-1KPy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E65860130;
	Thu, 26 Mar 2026 15:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3DCC2BCB7;
	Thu, 26 Mar 2026 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539337;
	bh=RmLa9GzRXJsahedmoCPhB+xtwC4BH6cVyTiEXjDvIDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ugj4mrrTIo1yZ2LyFlk8NH6GJG+e6AXu2LK6PIOHvzUJvNEIOzZ5DLHSZtE6lB9FU
	 xb7lQ+fbNABDIdcZB3HYeDohLm9DTcbRu/IfEmhYsGN4YbWQTsBa+tvTgeC/9LTmqp
	 1djBNm8fW4GFYmJHlL+PWL/ci1eJ6nfPQ7t8ctDiJ2mcSUdHrGWno0wgMoqO8kDAEX
	 Jn7NFTInau7olHypu81TnZNgwvA1FSPLyc4zcB65Jy+yfPKZyqWC75ZqpKOqZ3NxD1
	 9tiXF7a6T8VgTkGFUJt5NzaWPhMtFFZuc/qA9zgIVR7RpDIq4t99IkBQAudr9evqJo
	 jbVhDmDtIvwNA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkB-000000060II-1FQB;
	Thu, 26 Mar 2026 15:35:35 +0000
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
Subject: [PATCH 05/15] KVM: arm64: Account for RESx bits in __compute_fgt()
Date: Thu, 26 Mar 2026 15:35:20 +0000
Message-ID: <20260326153530.3981879-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org, stable@vger.kernel.org
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

When computing Fine Grained Traps, it is preferable to account for
the reserved bits. The HW will most probably ignore them, unless the
bits have been repurposed to do something else.

Use caution, and fold our view of the reserved bits in,

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


