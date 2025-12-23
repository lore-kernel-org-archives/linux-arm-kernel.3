Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7876EE6B272
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUHuB82vpXqtM4mqDLbMwJfY8lRSnm1OS32W+P5cNUQ=; b=WflsUJeHnEzQgKcv0wHIh3kOS8
	j+CKXQT0CAn1G7kV+BbEt04krXZI4gvTbYA2WH7TZjlgn8yhatC91x/0fFwL+1L9JJBWPWfjmk/3W
	B7ZbPD68JKPEhR+Ui0T147fWalamuqFxq+ysad2WgCwkdRmz08uUkeBQ3ZX2GeQwuoS/tTF/JYd7D
	q93uzNH0evlyuxLEUjfTe4PZyKxGoOOkCFgnZ17bLgJ3oF8vrZIyCoiRDKcJWAcfextLGh0jnYbwz
	YVqetjEFKxrPkPnr1xAz3hubppel1D5d6Crf3Pwr72pNvzs0vvrzlfbwuahFtwUEhKN+oDCxn69bm
	zc2XI2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0ZC-0000000Ewmw-1rEZ;
	Tue, 23 Dec 2025 11:28:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Z3-0000000Ewiw-15ri
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:28:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD1956013B;
	Tue, 23 Dec 2025 11:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E5BC116C6;
	Tue, 23 Dec 2025 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766489308;
	bh=KCJf4ICKUg4d+4CCrW1uq1qUVJx+y45H9G4fHNmF96Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sH5oTrTB5k619Stb59NdBv4Swig7HXVjHNn9QI5WMWz/Trcq2M9GbuTaoVu6skcf4
	 reZe+wV2HXuxEUMT9Sj9aWXelCHJ4SF+7Xh0yIh69XV3I9OreJh8JLXjrHfFlU6A3S
	 2aKjO7ow6tJykFtKOumFrhc4smLI5c3mWlvmPW4dgp6q9Mci+PTgErMLDQCpnknXL0
	 CRVISSBsGI+TYdhgMgVl+vufkZDWJglyG2TUS5k5RkjK/Fsd97NKx6wdA3yKldThGF
	 JerthVbXS+1eibIZPxcCK7/zjt57amdmlTz5aVGlT8DBW9B4ZuEdleQo25PTKfgDAI
	 qnbPQpsfa0YCQ==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20251217-mdma_warnings_fix-v2-1-340200e0bb55@foss.st.com>
References: <20251217-mdma_warnings_fix-v2-1-340200e0bb55@foss.st.com>
Subject: Re: [PATCH v2] dmaengine: stm32-mdma: initialize m2m_hw_period and
 ccr to fix warnings
Message-Id: <176648930565.697163.2533356435881488772.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 16:58:25 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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


On Wed, 17 Dec 2025 09:15:03 +0100, Amelie Delaunay wrote:
> m2m_hw_period is initialized only when chan_config->m2m_hw is true. This
> triggers a warning:
> ‘m2m_hw_period’ may be used uninitialized [-Wmaybe-uninitialized]
> Although m2m_hw_period is only used when chan_config->m2m_hw is true and
> ignored otherwise, initialize it unconditionally to 0.
> 
> ccr is initialized by stm32_mdma_set_xfer_param() when the sg list is not
> empty. This triggers a warning:
> ‘ccr’ may be used uninitialized [-Wmaybe-uninitialized]
> Indeed, it could be used uninitialized if the sg list is empty. Initialize
> it to 0.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: stm32-mdma: initialize m2m_hw_period and ccr to fix warnings
      commit: aaf3bc0265744adbc2d364964ef409cf118d193d

Best regards,
-- 
~Vinod



