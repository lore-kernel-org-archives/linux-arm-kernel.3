Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22316CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdA+2bWyj7Sh3t4i8SNy0DbADPMzMjxUZDQZrHm4iZo=; b=XNirHn6b8ZHHxv7DXWnlI7g6SB
	HVpGySfpFaDE6tkVrTjFEBQj1dW3M2/+Pr5loIj19+jA3pr9jtabLdAXSC5TpctwQ46kJk0JHVUKT
	xnPlBew/VPiH0JIiYnTNqy08Jix69tInPL8FT9lAPrr+0NaZm/ngT+O6FAgJKfiqUiGqhvyYLvP7K
	PQH74GQOm6o9APgWvorDEPl61e8dwmlfaEnTkZQ72Uf3ocqApoPhEDqt66QpzyjXFcHVMdC/DDYLp
	bWr9V6iDUGQzptg3jN7vfDlYXdErlJb4ztjQoZoyrIdxb7qasBoyncuJCXT+bt0R+HIwFwS1R3Da7
	o7w5f9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3CN-0000000AhVn-28Uw;
	Sun, 10 May 2026 12:23:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3CM-0000000AhVa-3C7b;
	Sun, 10 May 2026 12:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39E1160125;
	Sun, 10 May 2026 12:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD44C2BCF7;
	Sun, 10 May 2026 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778415833;
	bh=TC873zStqJ259MiwNikRrru9L89mhebxpZ8MWRYnZmM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AD0b9e+ezrryuNWZ8BZEaU0+rFHiKV5efAYKwxEINwCllXX7j2Fv9630NzBqPHRD0
	 UaDnpvaG4g8DuuO0A5YWgdFWl7E0YwH91ujb1+3YGGEcz4aqGaqmnjxz5cSM14/mb3
	 0UqhiYJxb8Q8DojeQueJupwWhq64tCHK/Txgh1lnA2k6PguhvDW+5nX9TlAmtVZmK4
	 myJceoTdZAiZpIIFR906BUQhqQ8qseQlxUGZs6QUXSOZ9NtGvcPbXlNakbgAqX1BZO
	 YEbx7zcLhAqC95s5fzmqKUOybvOnKcApvB2olYBFwcwKa3T+csPiOng5phrWmGUIos
	 gxDw2DwSFWZ/g==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
Cc: neil.armstrong@linaro.org, krzk@kernel.org, alim.akhtar@samsung.com, 
 andre.draszik@linaro.org, pritam.sutar@samsung.com, kauschluss@disroot.org, 
 johan@kernel.org, ivo.ivanov.ivanov1@gmail.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260406135627.234835-1-kernel@lvkasz.us>
References: <20260406135627.234835-1-kernel@lvkasz.us>
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: fix USB 2.0 HS PHY tuning
 values for Exynos7870
Message-Id: <177841582887.420676.2529810300062190966.b4-ty@kernel.org>
Date: Sun, 10 May 2026 17:53:48 +0530
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


On Mon, 06 Apr 2026 15:56:27 +0200, Łukasz Lebiedziński wrote:
> The existing PHYPARAM0 tuning values for Exynos7870 are incorrect,
> causing the USB 2.0 PHY to fail high-speed negotiation and fall back
> to full-speed (12Mbps) operation.
> 
> Fix TXVREFTUNE (transmitter voltage reference) from 14 to 3,
> TXRESTUNE (transmitter impedance) from 3 to 2, and SQRXTUNE
> (squelch threshold) from 6 to 5. Also explicitly set
> TXPREEMPPULSETUNE to 0, which was previously missing from the
> tuning table despite being included in the register mask.
> 
> [...]

Applied, thanks!

[1/1] phy: exynos5-usbdrd: fix USB 2.0 HS PHY tuning values for Exynos7870
      commit: 5a759b120e31aa3ed914d98b51eb1755235250f2

Best regards,
-- 
~Vinod



