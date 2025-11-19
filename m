Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6D4CF6480
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 21:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miWH1+bUoemOaKktZi1rHCPFD1K++3WX1ATgPwLRbCI=; b=jTCLvScbgtbWx0IC1XRPSI0pvn
	NYO3FkLG22UicIsgEwRPeWS3kjhXmykhpYXMtDK7gkWdhAItFsIGw2qXm0NDVkyP8U/Kxf1902r3b
	c/BchKQzpfm4WjlUp6T9DPRaVvjEljrB0Jq0n/okF/HI3K8hh94pzq0ftA2qgLWt9s/UjYbo4jHvs
	rN0YHVadpNyNc9P9ZR2/IVVn6v1CaElNH4+wyjnF2ZuO8sD3sjSHMz/syZWz4BVq/Wv2X8DNhxsmD
	ZHxg4CSQadUDET9Cb9oDPtEUZrfVwguY2id5axOp9ztHqTtuTaS8JevkQbf1vR2NV4jhStk/QtCAr
	GSQDdIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLq5m-00000005lvw-436h;
	Wed, 19 Nov 2025 21:51:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLq5l-00000005lvq-1ecw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 21:51:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FE916000A;
	Wed, 19 Nov 2025 21:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122B7C4CEF5;
	Wed, 19 Nov 2025 21:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763589116;
	bh=nwi+ZvFeDSI2K72amAnDtVwqMnAIb0w5EqXwQ4IVpAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1j8K/Thkm7qVc4L5T1qzRf5mvjXoFl6aQpZ9ld0naktl7muueng0UxfJFtohyJXK
	 w+VJNlaLcXcW9yTHawr/YRztaqfB3MiodZA75XSj98MHZQf+b73RFRh+do7C+Va6zo
	 F0aAV9zZKD1Bbpi7OUMi+wlEj8UvIXXWCJmvudqfgd9DQtxh+tFbx+T5ZU4H3NpqkY
	 yFbp41+SswGWScOhhmHrVH09OLel9PuaBw7eRVoSZb/Avir8bFIfB1SjfMGr9nXPLf
	 A3mBTN4qgaZBn0exCLw0BmtcTjnXyUoK45PeiXilZ1LioSXL6OoSVaX0SsXwvfM+IF
	 eWLNS03ZGMdTw==
Date: Wed, 19 Nov 2025 15:51:54 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] of/irq: Handle explicit interrupt parent
Message-ID: <176358911083.3363410.10556334198340567279.robh@kernel.org>
References: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
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


On Wed, 19 Nov 2025 14:19:11 +0100, Geert Uytterhoeven wrote:
> If an interrupt controller is used as a proxy, it may have an
> "interrupt-parent" property, but lack "interrupts" and
> "interrupts-extended" properties.  In that case, the "interrupt-parent"
> property in the interrupt controller node is ignored, causing the
> interrupt controller to fail to probe, and leading to system boot
> failures or crashes.
> 
> Fix this by also considering an explicit "interrupt-parent" property in
> the interrupt controller node itself.
> 
> Fixes: 1b1f04d8271e7ba7 ("of/irq: Ignore interrupt parent for nodes without interrupts")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/20251118115037.1866871-1-m.szyprowski@samsung.com
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/of/irq.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


