Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30423CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIfn+AcWvUSTvZoWssHiVYP+db/bu8cCcQh2iVRttTo=; b=gkCYFt3vWZnsjmfxWvdhxxJyqn
	A6DZilGOg1gZhA+otpQz0+QJbOrmZn6FmNY3GK3d7YzLu9J9yGWIX2+OvYQxW/62i/75RIUxwN+SK
	dwJErWQUCPcUeTZfxS5eusyPnu+sxKZ+HZUsrbGPu2O0bUKYzPYA2h75iilOtxjGRpA2ocmHioQtH
	N5bHjJ1NdxiQMHgkSdICjPGVqqSSbjo1pxCs/rmeH8y+v110XxkbxAtMtwzYB3RyVfUPkappgsNsB
	4YmmRoDRWF8hWb/YEMheLqVu4r9MtPr7eKt9aLf5ewEslh8S49v1vUxxZr3PfuedkVtB8bCQRK9yc
	TH0GxJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWyG-00000005UkK-3gQN;
	Thu, 28 May 2026 09:24:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWyF-00000005UkB-3rVT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 09:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A249C60217;
	Thu, 28 May 2026 09:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B891F000E9;
	Thu, 28 May 2026 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779960246;
	bh=BIfn+AcWvUSTvZoWssHiVYP+db/bu8cCcQh2iVRttTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ku85Dlk5bbc6YYEDeHnW50vE/MFzA10CHIyqU2BPc3jMyoXdHZsdXe9/EDRRQMOh4
	 S7RVJ3AuzN6rPiBpxRoKx55CwuMaxR6Qb/jNFPMDt+A6bRVSaUMKxbymlZFbu+3zZS
	 jfmrrJDagnVcOU9wMUuaZZ/h0XJLhvWSJtOZBUi+fwEg8zHS2l10MgCUokRdvmzY4X
	 jqo9l9QgsogaYzGx48qS0cUmjoCiick/BFoWwLigSnjdmm3DZG09D9ZeTViU4rUyad
	 QquIlstJdHPPHuk9NyOHwhTbHPiHOiq7z861sdF0JBzlIyzBOz30ymAlICLDqUQZht
	 KnCyHBgYmzK3w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wSWyC-00000006yjL-0Wbv;
	Thu, 28 May 2026 09:24:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/4] KVM: arm64: Handle unsupported guest translation granule sizes
Date: Thu, 28 May 2026 10:24:01 +0100
Message-ID: <177996023466.1525303.2108207515102273832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414000334.3947257-1-weilin.chang@arm.com>
References: <20260414000334.3947257-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, weilin.chang@arm.com, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
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

On Tue, 14 Apr 2026 01:03:30 +0100, Wei-Lin Chang wrote:
> This is v2 of fixing the granule size selection for software stage-1
> and stage-2 walks. Thanks to Marc for the feedback on v1 ([1]).
> 
> * Changes from v1:
> 
>   - Take the entire (v)tcr value for TGx decode helpers.
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: nv: Rename vtcr_to_walk_info() to setup_s2_walk()
      commit: a878096e0e86b44e758aafc6b26af97e8f548673
[2/4] KVM: arm64: Factor out TG0/1 decoding of VTCR and TCR
      commit: d7768b4f718503e79e7c626d29e9131b747148ee
[3/4] KVM: arm64: nv: Use literal granule size in TLBI range calculation
      commit: b154da8288add1f6fb958797d0b3462800f9fc77
[4/4] KVM: arm64: Fallback to a supported value for unsupported guest TGx
      commit: 8853566dfbab1a255ae72676ab5ec43e1631ddb7

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



