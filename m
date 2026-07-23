Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B43C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iRhNi+yUXKfpfAd3BQD5gtcqdXgAesz130Ref+69T0=; b=R/mbr9jfGVcReaCWP3coUrUNft
	ErZGfFBSvxh0Uw+mpclZtQrrG1mOOaV1Eelb4efLWrCqbangM1V6YfdWqdCCOvkEP0UCyaC8oCdqo
	xHDQRztZSJyyTN4cCkzN1vBWaM43pNup/ddk3v3vP3UCWiPHxVSmu9Nma4PK4DV771mt0xCEG4rSR
	hW/ncgFaHP5IFGpsIlx4R5l8pUjSBQ4dGAkSrmdt7UThpg+1mXbzY6CUQQAwIYxifVYsHQZOY48Mn
	Dt/x93GL7M2egmvYY9qkwgSUQIeKBD8I2N0D2Qcyr8BqWaEY127I5Wp5xTbmJjEF5iiDEypV9isOn
	oV72lJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw1f-0000000EgZS-2ICd;
	Thu, 23 Jul 2026 16:11:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw18-0000000EgFT-1o1v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:11:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FB5343EE5;
	Thu, 23 Jul 2026 16:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A371F000E9;
	Thu, 23 Jul 2026 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784823085;
	bh=9iRhNi+yUXKfpfAd3BQD5gtcqdXgAesz130Ref+69T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Va66P9RpFS7zFNo8rf/NAGDRn9gBhUncM5Fxaotxl0jrI7ssKffoQEfkuNj9GSaa3
	 5Ihhb47C5QGVojU9c6GH/spIbM4E4kAs8tdw1TI2jZV7fgA7+3jyu8pft41z3yUge2
	 6hlulT0Av560w0gFbbyH/dCSKN6AqFS8N7FIuwrCdlzSQ1E2ruY/ramCC/hcrdc/zr
	 YU+Qhq5Nyi8q8uddK8xamr3dOgIXefnFZetJJpgSGS4tWI60Bx/BKeAA+jL/FSi0Vi
	 qO4eCrOm1k1nh1CykBB8/YLmTC5iZV16P6ZJx66xlBSLiRJUZN49+0/y7k1m/vHzmu
	 P9Bf2c0M9nJKw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmw0v-0000000872h-2eaX;
	Thu, 23 Jul 2026 16:11:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kernel-team@android.com,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH] KVM: arm64: Add missing hyp_enter when trapping sysreg
Date: Thu, 23 Jul 2026 17:11:11 +0100
Message-ID: <178482303777.3351010.5347305905050874552.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617095238.1530121-1-vdonnefort@google.com>
References: <20260617095238.1530121-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, oupton@kernel.org, vdonnefort@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kernel-team@android.com, fuad.tabba@linux.dev
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

On Wed, 17 Jun 2026 10:52:38 +0100, Vincent Donnefort wrote:
> Add a missing hypervisor event call for hyp_enter on sysreg trapping,
> causing an unbalanced hyp_enter/hyp_exit.
> 
> The enum hyp_enter_exit_reason is not ABI, so we can keep the ERET
> reasons at the end for clarity.
> 
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Add missing hyp_enter when trapping sysreg
      commit: e7821048e8d72a94b1fb7422f8b45aa374ff076f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



