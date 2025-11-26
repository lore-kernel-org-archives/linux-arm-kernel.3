Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC2BD1037E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 06:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M011qkyuR20qRDOUluBYMghjw9AXrEBk6NCoxE4iRz0=; b=OYJl/++URk7Pmm8C5EI77/A7oI
	wrWkN5k/64yDURfUXGD6VsmsqqXyQRwdZKtp3L7ixyxQcAzTxAs9gJ4iySdi+eu2rykBlZSGto4SR
	sEnwtGf2KfFVxq8dpMS5VYbSljFW6WHw7NHQvLL45FjzGeI0nj7dYspFgHPgHE7Bx6MT2kVo3vLKP
	j1fdhWtWpLy6nI2eP7HE407wL1z8PsRu2/yTwuQ8oJOe4EE8+WmH+KsKGaOI4B89UoqRfPFIlcbdZ
	nBgnWWAY6tvCBT/qFW3HKCt24O6WHmMgk3i8y2K+PYFiBfDCd7uwmoWdDHWoX1ssnFTg1F35ZM0Sb
	E+RVD+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8x0-0000000ERFU-42ox;
	Wed, 26 Nov 2025 06:24:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO8wy-0000000ERF7-1bIi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 06:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2C96406BA;
	Wed, 26 Nov 2025 06:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F198C113D0;
	Wed, 26 Nov 2025 06:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764138263;
	bh=sUiCwKNe3z+sHXocE2lAIW6X2BDWSB17D73K2hnpa5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u7HbiMb5vvG6nk6FBQ/uO/KiTOokMUrIiXr30Yq+FYW9t9QyYCGht/Xil4RxlxTaI
	 +lJfXdSvyXVzUUfyfLbLwXDGZrgR4qaqRBVVLnwidX6Vao3oAv8E/HXjBIwu50LFp7
	 tbFe8JW2jjUtelsqUyq4FcPth059RPEMNMcOZsOnZ3v8bZiSIKpG+QZe5RhEjX/5iK
	 g/t4qeoZHTJMyHC2mdQ/dE04glKiLkuWW0HwG+q/5kxqp4VuUqy7k9EsRGldoL+A6t
	 /xy2bkUa+2/Q3kNQf4+6DSdn3WuZ6WEdqAiKZ89QuQe6en5vOZXJKZQVZEmnvf4z3E
	 +MYB5J6s3uI9A==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Convert ICH_HCR_EL2_TDIR cap to EARLY_LOCAL_CPU_FEATURE
Date: Tue, 25 Nov 2025 22:24:20 -0800
Message-ID: <176413825565.1765923.11158518614832526682.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125160144.1086511-1-maz@kernel.org>
References: <20251125160144.1086511-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_222424_567575_3311BF23 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

On Tue, 25 Nov 2025 16:01:44 +0000, Marc Zyngier wrote:
> Suzuki notices that making the ICH_HCR_EL2_TDIR capability a system
> one isn't a very good idea, should we end-up with CPUs that have
> asymmetric TDIR support (somehow unlikely, but you never know what
> level of stupidity vendors are up to). For this hypothetical setup,
> making this an "EARLY_LOCAL_CPU_FEATURE" is a much better option.
> 
> This is actually consistent with what we already do with GICv5
> legacy interface, so flip the capability over.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Convert ICH_HCR_EL2_TDIR cap to EARLY_LOCAL_CPU_FEATURE
      https://git.kernel.org/kvmarm/kvmarm/c/64d67e7add10

--
Best,
Oliver

