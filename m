Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110CBC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dPyXOMdUGR0tSguKqqAMQGFkRYshTiCGx6I8JgO6WQw=; b=JCrCV2rE8Ec+muwGGx5DmOL+3V
	9lHDLYN9syY2B2Oiqpkh+4abdrXRuJUCWcp/1lFetTlBNMN1CoIY7LddyV7MhY4h4P5YDIRj1tWVu
	8+dxIvjTCQh65wlfw2gdVtEy2DRupuAH9O0vPPDtxBEKN7zNOihmDjtsI/b8fWCiAPq8hA8GTg+1Y
	QJUPHDZOvPJCf+8+8M/LMme1inbhnpWto4EX2Gcp5q+MHic7zQOfKl9YCD51xBKKKZCJZ2gX9IQEY
	/xnCd6yn10+hMoVlfJRD8URX5s5InMc34bjrJakQaNqsyBLf8zOZJ9ZU2+PS6KhJPminESPAnn7Np
	8V9q8LGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV4B-0000000Fbx1-1Jwj;
	Sun, 02 Aug 2026 12:13:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV49-0000000Fbv0-3H9E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AF9F60AA1;
	Sun,  2 Aug 2026 12:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEDA1F00A3A;
	Sun,  2 Aug 2026 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672796;
	bh=dPyXOMdUGR0tSguKqqAMQGFkRYshTiCGx6I8JgO6WQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=esK5WBV3+g0ditICZyjMe40JHpdENeWbhdWp84FgXFW1DQaAtdnKExMfmmliOaDVK
	 yEWCjLjRK/neazj933iqequaKBi39UhPd1R1jtBIIeZMAWQxUEDN/AJCH7O+KdjXtO
	 VJ3AAYiLVWZRENeOJVhVjbmhYGIsLjsMW78jyh0dWyA8gCigOD3dEnCBLsNQbCdYia
	 B1j3Eko2syloLeGABh7RhB6gIvfbRnbfjoRxAaVxhKr4Rfgi7IvrCcN1E1ifhHQ3Tc
	 accxdsJYj2XtTYw9GLpo9ICnr08WxwgnRMUSKLY/227dRs2tPhUBVAQeVCqLg2ctwW
	 rlgY9EkoHE/Gw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	maz@kernel.org
Subject: Re: [PATCH] arm64: smp: Fix IPI teardown for GICv5 flow
Date: Sun,  2 Aug 2026 13:12:32 +0100
Message-ID: <178566277333.4131735.6580633448439910841.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731122646.84682-1-vladimir.murzin@arm.com>
References: <20260731122646.84682-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 31 Jul 2026 13:26:46 +0100, Vladimir Murzin wrote:
> Sashiko reported that during CPU offlining, __cpu_disable() is
> executed by the stopper thread via take_cpu_down() with local
> interrupts disabled. __cpu_disable() calls ipi_teardown(), which
> invokes ipi_lpi_disable(). For the GICv5 flow, this eventually calls
> the sleepable disable_irq().
> 
> This can be reproduced easily with CONFIG_DEBUG_ATOMIC_SLEEP=y by
> offlining a CPU:
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: smp: Fix IPI teardown for GICv5 flow
      https://git.kernel.org/arm64/c/4c9c81a08604

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

