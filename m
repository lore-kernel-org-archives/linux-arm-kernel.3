Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B18C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 19:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmI9U+9Q5oD+geQ62JVVg1m8f9x4i3jK9qeYOwmlmwQ=; b=kT3yGV5h7Z+9mmsjiN8H5xDR0z
	f7MrX1dD1CxuP6K6OkzjiNJDCtaiqPpFKlSUxC4c06X6LeuaebSOEbZq15h5To/hdxS/Yn1VdpZS8
	iAFVuLiV6h6YYiLTgaY8YscTcz9WgCCLlv1lmW6m+oDTKm3GbMCNz6CDf4MJyjfxZy7XQv2oet3Ah
	WpU2KN/YZ7X/cpOHdPbjqLH9v0c/UbNzeq3YgnunEiWtVG3lifcBXbONiNalb4ZX/pKGJSe13Mzbz
	vZAHFknO0IL5PpxbQ+V6pWwqqvjGgMT6+UOuyBNq+xegxc5FH7EK8ACTN2lyf6R7jSvy1GyhjdtFs
	uHBgFcvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhC4J-0000000FnKd-3eQM;
	Sat, 17 Jan 2026 19:34:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhC4J-0000000FnKC-07rs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 19:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16A776016C;
	Sat, 17 Jan 2026 19:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD77C4CEF7;
	Sat, 17 Jan 2026 19:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768678480;
	bh=FeOvqBq1LCt5Y3EfFFwB6cXnm/gCHkl94fPqysN+CNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kx68UQDo8hDbs4wzTHfuyE5A+jf2MbP7ZTgppDP3Ksern1DYLeZie+5l+ob130JSE
	 EyoETbM4/BRaAE1DzqjuTGgLfehvLUmTzL9xM3q0MHOTO29xGbNqN/nvRB0JrH5o7x
	 xFe9lBMLIJJtxSpZNjTdI6EB2CbmUiIF8oU+ilRUfSJZG1Mxkaw+OmilyCUHBiVtVA
	 InnSbn4wlok7oIu6ST+eBBgsuaPD/Ia4zZr90SumJgn6+pnl1+g8ag7vwAx3ghk+Yn
	 14jWhbktNg4fSvh9Wg5LB9ae/k6lwOlnC4D7MsTQ2WUeroxA9N5xK8K+7OOlFEaDBA
	 w3fTQrrxlwmjA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
Subject: Re: (subset) [PATCH 0/3] clk: samsung: auto clock gating fixes for
 PM
Message-Id: <176867847762.124121.8738642707805384066.b4-ty@kernel.org>
Date: Sat, 17 Jan 2026 20:34:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 09 Jan 2026 17:27:22 +0000, André Draszik wrote:
> The attached patches fix issues when CMUs have PM enabled and also a
> needless warning message on older Exynos platforms relating to
> automatic clock gating as reported by Marek.
> 
> Without these it's impossible to enable PM for a CMU when automatic
> clock gating is also enabled. While currently no platform uses both,
> patches to enable PM on gs101 are in the works but things stopped
> working after the auto clock gating changes. I've verified that with
> the patches here PM and runtime PM work again.
> 
> [...]

Applied, thanks!



Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


