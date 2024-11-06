Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E10D44D42
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjWc7kXQaRtYfloCU22HJBrnNjhnWHq348fS+iPzQ/U=; b=YNFD5SjFEXnv9CZSInXl70HSHJ
	AhXScMCgilb3OctFBceEOHL0Nrsi2T2eLlpJUC2qTJFIH16vEaXK41jcYY8nJuvcjTNIIqHKYtytO
	0AmGv0eK7MhWbNxOY7poGQHpS5hkX66fuYN1wFPlULdZdemHaJb4yXk3gvaOmRZsIH+mcF9C5VonV
	mX2QFkfd6uqeAF7GeysTBZQK+dHUDRcKBLMGjMF14jGRHc5PWU+9oXZTpl3WmjoqSXF1IXIY39iFI
	lK8ZZQ4xPKlRLsJXEN28yqlYe6Dr1ou9aBqk/vQJpj8AeDZF2lVc2zBn4uBKT4EY3Si/C/1aPQeL3
	tPaGldgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dJE-00000002kcg-0vIA;
	Wed, 06 Nov 2024 10:30:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cZ5-00000002b2Q-07Yd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:43:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1179AA42B70;
	Wed,  6 Nov 2024 09:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB9DC4CECD;
	Wed,  6 Nov 2024 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730886181;
	bh=ejHS7C/7ZbSIztex4f4UJCgT1blclG9gOy/DpK24OVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQP/8p1wgZwWzJ45BgjroCbaVs+5YbOb5IzDHn03FJpvbP6n01CO8AbbhcdXmaGLO
	 hY0rL3z96Qi1B5gDGU0Rj190REZTEne/+z6Ki5PlzH6Ye95VbcX/8lrrWpLolzmYtK
	 DV1624pYY6hvD2OI9IYbAsCkpcHJO96r4owwoInUrTIFj6fHkKeZbKlUBHcL6hD5ri
	 pXEn3TdXFHsaNiIxhHHEOt8fmJyqg8ATnGGDP3IZ1D5L+G2S8Yw1xyO+K33XJE00XV
	 76EVGPoaNre7RohP+kFi1TfX0kqOnBIc3WydIOuW7q49TvnmgAfflRkSNmu2zLPkfR
	 EUTjWvqKJh0NA==
Date: Wed, 6 Nov 2024 09:42:56 +0000
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Qiang Ma <maqianga@uniontech.com>, kernel@collabora.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] net: stmmac: Fix unbalanced IRQ wake disable warning on
 single irq case
Message-ID: <20241106094256.GI4507@kernel.org>
References: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_014303_152846_25BBE238 
X-CRM114-Status: UNSURE (   9.99  )
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

On Fri, Nov 01, 2024 at 05:17:29PM -0400, Nícolas F. R. A. Prado wrote:
> Commit a23aa0404218 ("net: stmmac: ethtool: Fixed calltrace caused by
> unbalanced disable_irq_wake calls") introduced checks to prevent
> unbalanced enable and disable IRQ wake calls. However it only
> initialized the auxiliary variable on one of the paths,
> stmmac_request_irq_multi_msi(), missing the other,
> stmmac_request_irq_single().
> 
> Add the same initialization on stmmac_request_irq_single() to prevent
> "Unbalanced IRQ <x> wake disable" warnings from being printed the first
> time disable_irq_wake() is called on platforms that run on that code
> path.
> 
> Fixes: a23aa0404218 ("net: stmmac: ethtool: Fixed calltrace caused by unbalanced disable_irq_wake calls")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Simon Horman <horms@kernel.org>


