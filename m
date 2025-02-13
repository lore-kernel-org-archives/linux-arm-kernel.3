Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B16C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HD0F6MlrVX6ONSbgfROhExBvSXKoR02iMdIDwIZ7zo=; b=xtpBaVW8MA1uIplImAKChVdcuR
	8win+5s638g9FxPVOVRIpRX5RHBawB5Kxtv5XyxQai2USm0gXMTL85Fdt1X8TDXhMvpneiU/G+LV1
	AmbFrAKSRd536OEzNIqXXIaqYE5L+lDLeVQ7tlxmVD30IH9SovnfE9ha6Wr6vttdrwpoml3CWP+/U
	XNpH+qlkHV+SKQ4iawn+iGByX++j7H1QdXLHDsGGJo8DHOtBXf/o5LhPG0h5oxYrWi+q8850ipRT0
	JNjkwJHJxtS6gMCU8qvQQFW9KKo9IPMKNtYBU/t84aSSBVUguLT6ILjS/+BkSItXr6PpQafIknNLl
	48mky1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieMV-0000000CJe3-13Sn;
	Thu, 13 Feb 2025 18:54:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidXt-0000000C7eX-2k2y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:02:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91459A4283A;
	Thu, 13 Feb 2025 18:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACAFC4CED1;
	Thu, 13 Feb 2025 18:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739469760;
	bh=KCXWCt1tfCPrXneMgT2CusbMh3K2XAvWCZTxxW+kCs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C4TlgEEz2SIOtgFa6lO18TAdRvksbF9Wc6+oD9Vqpiq7bGnLbTTqagyvRr/dKeLo7
	 BapSmWlLvzEwd/0rNdVKBe2fGvEdR+XzfCEyQZkZKYDwMMil5tN8KsqHuruLCEZcJt
	 AQhlkfgRcAU6pB1r6hLJXO7YYbAXtsf20wMFMivmYg+WpqrihiEEOf2XbQoeh7FBjI
	 aPNKbj24qU4yUPWTXs31yTsPNDce6S+8ELHefezrbMwh4PrIOKfNnZBQTSLef00XKX
	 CJrdbasTp6zPEnxO/XqPeTmRnlt1WnIHsQ1IrM5nwcpFoI3CSpacR+OBlYMU2XViIZ
	 4jn3k0D2mhbbg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tidXq-003nWM-1J;
	Thu, 13 Feb 2025 18:02:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Cc: Keir Fraser <keirf@google.com>,
	Ben Simner <ben.simner@cl.cam.ac.uk>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix alignment of kvm_hyp_memcache allocations
Date: Thu, 13 Feb 2025 18:02:35 +0000
Message-Id: <173946974570.2974684.11799250388121421778.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250213153615.3642515-1-qperret@google.com>
References: <20250213153615.3642515-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, qperret@google.com, keirf@google.com, ben.simner@cl.cam.ac.uk, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_100241_757394_5817E515 
X-CRM114-Status: UNSURE (   9.61  )
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

On Thu, 13 Feb 2025 15:36:14 +0000, Quentin Perret wrote:
> When allocating guest stage-2 page-table pages at EL2, pKVM can consume
> pages from the host-provided kvm_hyp_memcache. As pgtable.c expects
> zeroed pages, guest_s2_zalloc_page() actively implements this zeroing
> with a PAGE_SIZE memset. Unfortunately, we don't check the page
> alignment of the host-provided address before doing so, which could
> lead to the memset overrunning the page if the host was malicious.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix alignment of kvm_hyp_memcache allocations
      commit: b938731ed2d4eea8e268a27bfc600581fedae2a9

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



