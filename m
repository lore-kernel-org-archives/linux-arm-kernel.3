Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC7CD609D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yn1y0ma0/INxv0iAdfy5H9zwLwc5DdEAfkOBFrAaKSE=; b=GW48MlaYyKqPfDqVy02TqKavWj
	YLuxhlPzOIiEZ4NgIS76bkgEfKz7ItMrTwcIHhdeh8xAgty/QIBUVQQJa+LLu8hpLcTOriph+VpOh
	LxU/T4/Vo4SIRaVIHx2upyDAlsT231H4Fq4Ssrab1fpuCV3tshwGUa3d4kyqUjGLtSIDO4OEx2PAS
	mW0XfRE849L16kjY1OefZLaNZBXZQdM+SwJP3NSW0NHPLUlKagaFgRFI67Fp/+QVjNwEWzIz3EF/Z
	wwExGHJ/FJkfAWp0BZgzkfmKs+xsc//Z+4yiDwGLbt1cWtETZaD1DGfXRiM47WA9m5EklfnpD0RUZ
	RrYOH6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYOm-00000005Zpa-1CBT;
	Tue, 16 Dec 2025 16:59:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYOl-00000005ZpO-23dx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 16:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yn1y0ma0/INxv0iAdfy5H9zwLwc5DdEAfkOBFrAaKSE=; b=DUlGZpts0d3hfA9RaHubv4C1P+
	mADYY+FxGWjRstNF0Qct2l7Gy/Tih2+iIGdKkajTLx/nODKXg2z2Q6coD/VTkSUw2WaNHq+jpB0Pl
	UqNVN7mpJSReXke8kU7yw9oM4BOqZPUPtiffON3ijOZRSOHJ+6G3BVUN0Rzzt8OnCM6GJq2t1WmU9
	hM+KHPUyvZZ3z7ZG4JuA0IvOQ97ZuGL+zurIOzvEGwkmdVHuA+Q23/N2C26nSoOZkGKuTx2sXyKS7
	GlW0lMepU3TmwHpkJ3065ZY7ewBmEszAEvkBmnvOpbr9mNsLQOAhbtqZPIFV4zNDAp3UNR9vkLfS+
	qzgLDyVg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXXE-00000005D37-3DIk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E3744445E;
	Tue, 16 Dec 2025 16:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271B2C113D0;
	Tue, 16 Dec 2025 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765904378;
	bh=gd+LVa87L/5nacGvsTeXMVlyPGvTYEgI4GD5mnHFym4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SawhsF5Z8Opq5ci/eYR4Rhimoaj2sOV6bMBRWp2yZc1kDiZ9XZ6x2Dg55b5hHWmKp
	 J8aRJW9t1r7z9v5KmsFRmWeK9ptRwCY/QWR3TmJUxP9QWBnUJMyLa/16b4uiEj6Kkv
	 TWir+yna+KjIfypWOZZ3N+3v1qZHYz9oEX8ZtZjMCqjdUu6mO+zRjWUhckx7zE5bqx
	 gzRH2HXt/coLotsD6wCyqX7Dupzu7CNSgPccI6PW2Rtm8/7kNekoXxlr2wEq+DGrDz
	 YEwCFlgINAufvzeFR23L4DrHp9v4/i89z/MfhXx/L9AQEU4fn5KHXkgSdWL8/Kp0uC
	 /JMnV472mBsEQ==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20251121-dma3_improv-v2-0-76a207b13ea6@foss.st.com>
References: <20251121-dma3_improv-v2-0-76a207b13ea6@foss.st.com>
Subject: Re: [PATCH v2 0/4] dmaengine: stm32-dma3: improvements and helper
 functions
Message-Id: <176590437579.430148.12860558109000484739.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 22:29:35 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_160425_132300_24777E49 
X-CRM114-Status: UNSURE (   7.14  )
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


On Fri, 21 Nov 2025 14:36:55 +0100, Amelie Delaunay wrote:
> This series introduces improvements and helper functions for channel
> and driver management.
> 
> It enables proper unloading of the stm32_dma3 module, replacing the
> previous subsys_initcall() mechanism with module_plaform_driver().
> 
> It introduces helper functions to take and release the channel semaphore,
> and restores the semaphore state on resume, considering the possible
> reset of CxSEMCR register during suspend.
> 
> [...]

Applied, thanks!

[1/4] dmaengine: stm32-dma3: use module_platform_driver
      commit: 0d41ed4ea496fabbb4dc21171e32d9a924c2a661
[2/4] dmaengine: stm32-dma3: introduce channel semaphore helpers
      commit: d26eb4a75a4a2bbf27305e62ad82cedf5f8c577c
[3/4] dmaengine: stm32-dma3: restore channel semaphore status after suspend
      commit: dea737e31c2c62df5a45871bfb4ceb90a112dbd8
[4/4] dmaengine: stm32-dma3: introduce ddata2dev helper
      commit: 8be4f3cbe263d22053d7afea4efee2e7178eee21

Best regards,
-- 
~Vinod



