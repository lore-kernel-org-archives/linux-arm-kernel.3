Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3432DCF9C79
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9SC78yVN/4D0pMCsNz+mLE1e0p9y76We4oONRt6re0=; b=WVpSPT9Ha2UfPRuAZU6KzRFLpu
	9Yct8P+X+vzqXK5a0zgNhm/M17H9liURKrZpJK/FAUpahiUN8XC/+tK1Bh2tIrwFTxg8S/a9ShvQX
	/0W4CaRNi3QN7YZrkmQChu+4iGun+jKFWpSadCNP0stUVZkC/sLz6RUtB42WEIqOEHbz5Jl9zSQzX
	a/2XCFtAdY96tO4C4jvmdmyvorPLytHTPK9oXQTbMIEDPgXXHaFaUXv/tagda34FHmR14UAkhF80X
	qY1krV9V24mp/wc9X86cmvPO86M0/NgfKfV/5Ebt9gPnvwOagc8J7hmNrVvBTCZiQAdei/CKoaUcm
	fv8V0w1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8C0-0000000742R-0U1Z;
	Thu, 20 Nov 2025 17:11:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Bs-000000073zJ-0edd;
	Thu, 20 Nov 2025 17:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3F3244215;
	Thu, 20 Nov 2025 17:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A64C116D0;
	Thu, 20 Nov 2025 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658687;
	bh=IABz3Vm9WE8tNAIYgl3s7DgNhJLHFMdvNzFll8AaOrM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UF91YOyEeFNguuHHLAdKTR9eAYMaQEjGov78H/L9q/PSBxcLKwMGwHx57I9Evbnm+
	 T4qlamnkQ9ugk0Ggq98YlDHt+CsBwBVP4AVMBwqhe1TEIaxrP4fZk1qTetghCmnrBB
	 mZ4LgM8KLZB35rVdtQRxE5Dr1BcZjGFCTeivy9iKofuAirk1DWlrdtoe+nz5eK+jB4
	 pHbcruZfsgFl1qGXmqRHT8A8fJ1KqA8jxcVZD3O/Ux0XZB+a5UQnq+o9kSBdPHvKvN
	 aw5URqSKw83JQQ13oqWyv5HLwt7flM6Wy4gKlTYm/kKHTXhB6qogGnmATJ0jMs2DR+
	 vgT6tZJuKzucg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
References: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix clock prepare imbalance
Message-Id: <176365868405.207696.4847424403085518315.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:24 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_091128_280258_9734CA52 
X-CRM114-Status: UNSURE (   6.44  )
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


On Mon, 06 Oct 2025 09:07:12 +0100, André Draszik wrote:
> Commit f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend
> with UDC bound (E850+)") incorrectly added clk_bulk_disable() as the
> inverse of clk_bulk_prepare_enable() while it should have of course
> used clk_bulk_disable_unprepare(). This means incorrect reference
> counts to the CMU driver remain.
> 
> Update the code accordingly.
> 
> [...]

Applied, thanks!

[1/1] phy: exynos5-usbdrd: fix clock prepare imbalance
      commit: 5e428e45bf17a8f3784099ca5ded16e3b5d59766

Best regards,
-- 
~Vinod



