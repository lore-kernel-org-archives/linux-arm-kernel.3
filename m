Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2191CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 20:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reWRkuW0hAlZFnk+d1VjwTNlztXheRbRR+EBybysZfs=; b=mWgNmbIwJVaOIgw4JqLuJ3aoWW
	Pa8n8wcmp7kalN3INouDGib0cJ16Zitm2jpFP4utPVmcWDddWG2H34HCO3eScw+yVjx9cOa2j74i/
	aanwudkyDkwm+paXiaDpZj2ywCcjeSQpiRS3TWOxnFRyJRKZHqizJh0XYaFqwOprCDigvsW1R1SKc
	ICf4KuPQuCPQnKFaFeMBJKmeZVoUQpLAKw9dpFsF5zDX5VS1nRYWtrxtSLM3duUud3lZxk0ghPvH1
	RB7Sl+l7DLGKy83Ig5weMigU6iiWer0ZRrxt5HNRft8218Y1JttqCbx0U8TJ5auuNUn4KVgJN0Xqq
	gsxSD+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0Jl-00000009OpX-4B3W;
	Sun, 11 Oct 2026 20:38:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0Jk-00000009OpR-347o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 20:38:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99B26601E4;
	Sun, 11 Oct 2026 20:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9351F0089C;
	Sun, 11 Oct 2026 20:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791751127;
	bh=reWRkuW0hAlZFnk+d1VjwTNlztXheRbRR+EBybysZfs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fhHDfr6wU3HBez1/wFQeI5uYxDofNlXyRnKB10NELoMxwZf7jvHAXLV9vLjQ0lPXN
	 Xo3CnFPkfK+BpLFwAA6Ljtr0ZFp/Qt5bWBwV3LEgDNIaYj8tEKHFbf47R+8pbHyY6P
	 K72bnMLwPNHTj4/BXHJ+ox+E9tJ8gf8k+XMg/x5xDQ7D+VuKdBo0+kFBNDjp0EXpg7
	 YpBuMv2D5pSBUCRn0Jgg1WUKR1R3Z49J3Wf80RNTlRboiWPUFGUzJErnoDiMGTFR5Y
	 GU4w2zqmwjSKsAsIeTfgVTzgWGfYZPCqf1XwU7jAgQUYLunC2TDSkHu0UdChx0BaL3
	 H57GjeOgPwbdw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20261010-dma40-smatch-fix-v1-1-26ca10043957@kernel.org>
References: <20261010-dma40-smatch-fix-v1-1-26ca10043957@kernel.org>
Subject: Re: [PATCH] dmaengine: ste_dma40: Preserve the LCPA I/O address
 space
Message-Id: <179175112609.604740.2384834135572859219.b4-ty@kernel.org>
Date: Sun, 11 Oct 2026 21:38:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Sat, 10 Oct 2026 00:58:53 +0200, Linus Walleij wrote:
> The LCPA area is mapped with devm_ioremap(), but lcpa_base and the
> per-channel lcpa pointer lack __iomem annotations. This loses the I/O
> address space and makes sparse warn when d40_current_addr() assigns
> LCPA register addresses to its __iomem pointers.
> 
> Annotate both pointers and the LCPA argument of d40_log_lli_lcpa_write()
> to preserve the I/O address space from the mapping to the register
> accessors. This also fixes the existing LCPA read and write warnings
> without changing the generated code.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: ste_dma40: Preserve the LCPA I/O address space
      commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b

Best regards,
-- 
~Vinod



