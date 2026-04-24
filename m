Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B1BFE520E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQsxGnYdIMXwvibCP7n7X945Q3eemQP7BAL4MjC1s48=; b=Gy3l12csM4NeRsDLTeRuaHiAqW
	MCwtypCuvAXfhpRkaegoXWmU9haiubmYlSKGgB6tiaDbWW7IeNxOeIaIQToJxWqojIhJRGkXW/YPI
	/SfQHXNczwgQPc5jAXHd5yAGI0MJu3wFsDGIvk4KRCwwVPpugv4g7bk3WYMYLMggN6+qHln1CIbZ1
	XuubQ4TjFVUpvBElVpVZWICFv/exfHlm45J2chOaUxN0kqkRGrZ3Ha7XMfT3KRAg9F+fhiwUPrMZS
	bMitK63QgaddPHiGK0tY3hdJcN/0U5LWChfLhjo/1c3XHPOtBsp4NrKpfmSxpt7hQSoQpCyVcdXWZ
	gjU0XNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEOQ-0000000D4Ki-2QvW;
	Fri, 24 Apr 2026 11:08:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEOG-0000000D4GO-0iKY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 11:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 875144457D;
	Fri, 24 Apr 2026 11:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A7DC2BCB4;
	Fri, 24 Apr 2026 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777028887;
	bh=Ea5gfF+HbRCMpht8ZAX8ej/HdIt06cHNLMmLRfWSvcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y9xOnyAg7p/24KacJ858wX3cZoHMZCs1Pmxrx5QXUdmgF4CFM8pIUGaakyX2+4HDZ
	 8blnIujUN1DTs7RzLn9giR5KdRZXzfFEAQHIxQk1wBColOQzNa4OE0qtfCoXZ9T8ym
	 BUaSoJbW41Cm8uX6LCZ6lfHQdO9y9XPXSNaJyawATVqHsvFmDVH7V9HjBECL713nyq
	 oL4U/OtJdur1rfbKZMSr4QmHK29hlhrb45JRO0qgf+hUgWZIlwoSUT97SlqeCU9sPQ
	 cJiqnUjyh60W9opatnTSWuM+qnzuNjeTXDfwMdgRgEutISFicMryvVXu6XyETgSRl4
	 kI2QM5hGL6I/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wGEOD-0000000ELuS-1s94;
	Fri, 24 Apr 2026 11:08:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Wake-up from WFI when iqrchip is in userspace
Date: Fri, 24 Apr 2026 12:08:02 +0100
Message-ID: <177702878146.537738.5575062424805224774.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260423163607.486345-1-maz@kernel.org>
References: <20260423163607.486345-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_040808_230234_F906046F 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, 23 Apr 2026 17:36:07 +0100, Marc Zyngier wrote:
> It appears that there is nothing in the wake-up path that
> evaluates whether the in-kernel interrupts are pending unless
> we have a vgic.
> 
> This means that the userspace irqchip support has been broken for
> about four years, and nobody noticed. It was also broken before
> as we wouldn't wake-up on a PMU interrupt, but hey, who cares...
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Wake-up from WFI when iqrchip is in userspace
      commit: 4ce98bf0865c349e7026ad9c14f48da264920953

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



