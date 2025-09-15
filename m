Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C20CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CruBXo04JIwxh83Y+BdR4stkDQvHqXd4Z2lPxZpKdj4=; b=emXZ9mnaJ7cVfoISA9izO98Qr9
	/jts5yV4/A+KGHh+93WPUTAv53Tc2cEWw9mahUP//sf3APCBvCgLBv1imMrb566ZvdScsuxIfScsm
	R68gHzV9YnHAAFp21yiv4qVao8uN4I+PbmVf2iRJAKpsHgOl80ZYanYkv4zsNQV98qXBcaXHP9BH3
	uVmm4DzaqzlXrZsO7utjJgbNuZcgDJFxcUS+V9nSgVKswAvHMKs8+vF8A8mYGzfcGMAijNgLtXG/2
	trmU5yJWrqSEHZM6ZP2Ogk+/N8lNAP/ChS3XqGBbLjlN8EyOJoiidRvxMGM0RmXuBdVqdvs09beQE
	AvRGOsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy603-00000003Yps-0cII;
	Mon, 15 Sep 2025 09:59:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy600-00000003Ypd-4C3c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D58DE60191;
	Mon, 15 Sep 2025 09:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E050C4CEF1;
	Mon, 15 Sep 2025 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757930391;
	bh=l4ynf+cyA3et/jBfIs6nmkskoymLiWmJNcg7GsX/poE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uy/MHun2rSdJxZa6W+MCEgBhv4wvxqBHqeTeX8aBkDsk7SjpQzhLu2ZmuBd8sRvGw
	 k6WEg1W0uAL8D54IUojGx/u3AcDyidyoPJbmxixZhFIasgGrg9M2tXB98MxOswe/CS
	 LzYjGfn2WNmKBO3aQlKuTyyvG15i5QEAt6gK2defuByZJsjI00ozMCwUrIaTAg/xvj
	 s/fQUHYdcOVNAVFxoSNvVqoOk8vFR8kOZP3S1kZqfFIQuK9SXtHILi3mgkbmZwoUCn
	 PuzVG0BYfEW9UF5gJZe7kvk1pKhSnCR/HMydjD0//XAiIvn3AzzwUunFXg5CBIAn0R
	 n+FdVAi50PnTQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy5zx-00000006Jee-0iH1;
	Mon, 15 Sep 2025 09:59:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Keir Fraser <keirf@google.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 0/4] KVM: Speed up MMIO registrations
Date: Mon, 15 Sep 2025 10:59:45 +0100
Message-Id: <175793036859.521995.4956413640156757969.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250909100007.3136249-1-keirf@google.com>
References: <20250909100007.3136249-1-keirf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, keirf@google.com, seanjc@google.com, eric.auger@redhat.com, oliver.upton@linux.dev, will@kernel.org, pbonzini@redhat.com
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

On Tue, 09 Sep 2025 10:00:03 +0000, Keir Fraser wrote:
> This is version 4 of the patches I previously posted here:
> 
>  https://lore.kernel.org/all/20250819090853.3988626-1-keirf@google.com/
> 
> Changes since v3:
> 
>  * Rebased to v6.17-rc5
>  * Added Tested-by tag to patch 4
>  * Fixed reproducible syzkaller splat
>  * Tweaked comments to Sean's specification
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: vgic-init: Remove vgic_ready() macro
      commit: 8810c6e7cca8fbfce7652b53e05acc465e671d28
[2/4] KVM: arm64: vgic: Explicitly implement vgic_dist::ready ordering
      commit: 11490b5ec6bc4fe3a36f90817bbc8021ba8b05cd
[3/4] KVM: Implement barriers before accessing kvm->buses[] on SRCU read paths
      commit: 7788255aba6545a27b8d143c5256536f8dfb2c0a
[4/4] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
      commit: 7d9a0273c45962e9a6bc06f3b87eef7c431c1853

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



