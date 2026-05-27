Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d34ciTxG/47qWh26HChtVlWlXdmTlrot9eCQiU6gEY4=; b=ply2Z/ReGc2jBBBIHzCvO6u3j1
	5k9E7+ojXiSs+K58yJtaBKVSAerv6fPsBeSjaxM2p5haNLdTYscH840TypjlD/rShPTaDhpnEViSa
	BSzYXCMtGJGLgF4ToqWpjRa861pjRqGmdspieP3f2wIs1Aq/R6Bwpah8pw6kd9dtKL1LsOmX+7pcg
	fLe+mdWDJd/GIjEK/5wPa8irbTy5zBG/It5CEZAeWhmWalX7zrmDABazDEnoTE9wowCtouFNu4zFF
	bXjbwv2RMKS4sJhqWeQgdJNlSAYjy6rIVFpbMoQWT6o99J6/DKKS58p1wWuNgUT/9IOt4+9/k9Te5
	Z4CpOIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEQM-00000004Cql-2F0t;
	Wed, 27 May 2026 13:35:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEQL-00000004CqM-1etX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:35:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D1436024D;
	Wed, 27 May 2026 13:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D2F1F000E9;
	Wed, 27 May 2026 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779888950;
	bh=d34ciTxG/47qWh26HChtVlWlXdmTlrot9eCQiU6gEY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RLmVXooHEe0KwtJBbrmSgaiklTlpB5fpBn5xJAqZmkNBQfJGUZfyyA3078vr6Udrz
	 hcv3rGOtVDbXxxM/iBYzEAzxlKIf8pM3tMjkOt7sjFhNtlo8Ae6lqE0rl7h7WWas1B
	 PU5xGEWA9mnHyJsTcVHregQJnDkkaKRaUcJpK7ItZQU6gBnrhpDbwKSsg2UDpJXCjP
	 nsVOCEqI4w7UbHuzkA95DSei28oTSXYUEb4RRD1zbzGOvdpnPTCz/6gaU1jO6JKjCn
	 4G01rp+3XmC/R9CCUskHmuO4rsmKFp0XtrNHMtA6Q/3kuT1Vaf2xIjmC3XL0Bx7Z3f
	 dCzyqE5ttu1Xw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wSEQG-00000006h95-3Snx;
	Wed, 27 May 2026 13:35:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>
Cc: james.morse@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	vdonnefort@google.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	yaoyuan@linux.alibaba.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] KVM: arm64: EL2 synchronisation and pKVM stage-2 error propagation fixes
Date: Wed, 27 May 2026 14:35:46 +0100
Message-ID: <177988892825.1514521.8187685470301754146.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501112149.2824881-1-tabba@google.com>
References: <20260501112149.2824881-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, tabba@google.com, james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com, vdonnefort@google.com, catalin.marinas@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Fri, 01 May 2026 12:21:43 +0100, Fuad Tabba wrote:
> V2 of the kvm/arm64 audit fixes [1].
> 
> Changes since v1:
> 
>     Patch 1 (SCTLR_EL2.EIS|EOS): Fixes: tag corrected to 0a35bd285f43
>     ("arm64: Convert SCTLR_EL2 to sysreg infrastructure"); the commit
>     message now explains that the conversion auto-generated
>     SCTLR_EL2_RES1 to UL(0).  Code unchanged.
> 
> [...]

Applied to next, thanks!

[2/6] KVM: arm64: Guard against NULL vcpu on VHE hyp panic path
      commit: 214a821c1462924668644e167a9706564cba65ea
[3/6] KVM: arm64: Fix __deactivate_fgt macro parameter typo
      commit: 1bdcdc84f9f91e702bb4410cb46016cde1d57d9b
[4/6] KVM: arm64: Seed pkvm_ownership_selftest vcpu memcache
      commit: 3a4f5b96730cb40d5d9b31293fd34e11a10f2d6d
[5/6] KVM: arm64: Pre-check vcpu memcache for host->guest share
      commit: 8ed0fbe5404616041f6daf1d2fa1824d75602f63
[6/6] KVM: arm64: Pre-check vcpu memcache for host->guest donate
      commit: cada2549ca4c934e6fb3801f857c6b4b0c36490b

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



