Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D77CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcAb7kozyts+b1h0rXGYQK+xZkw2WmbmCBb1u9nQJlA=; b=W5iKwnysKQVNxDOVhy0QcRtnSa
	euo1j8C2TXiIeUudFP65zOPn9wxvVEmwLrWYazV4UsJNNK5EZn1bjk0CZXGeoyhWCR42a8ybzz1HF
	O9oJ3x2BKRTbBNflzD8NCepgN4g4flJ0FNyrCMPH0RxGEEC+v+QEEfBys/v5MgEtJFAV/orwZsypB
	U5svAQ0DyE1TYic/bm5es7bkTgt8XkFTJVSjjZxGH2RrIfSGt0wavXsFqnlxRm/k3hh3Sc1N8ibh2
	6lP1QBZUcZg1OodbPCWr1i7KHekwOP7+WAtATJpQ5BE3IILgnSE1DlFNJZ/t5Q/rbM9rgIXdilmkr
	bPC1Ebhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTIee-00000008iit-0MUs;
	Sat, 30 May 2026 12:19:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTIec-00000008iim-1jaJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 12:19:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85BA1600AB;
	Sat, 30 May 2026 12:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06241F00893;
	Sat, 30 May 2026 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780143541;
	bh=jcAb7kozyts+b1h0rXGYQK+xZkw2WmbmCBb1u9nQJlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OiwRNXUtgv8vu2GE3Vs7nfzsSEaqco8BB+scWl7dzI+x7NeQYl4F8HYrG9z0BTVta
	 KrBivUXm9uMwA844Ewbdtppn8XntdVqltW+tBqyfMIsPesuMC9NDw3zWjRDVistI6M
	 TPT4xlexzY78TBfV3blg/t1YoU/ZtFU5d/MZe9eHodzCCB36UIlndQh3z7xVPhkkYC
	 HkOZyUpIhmKXNHHX3akIHM8daUdhXGiOzjg/zRnbBOUoIbgTUUGfVs8DPUT6PYM7kJ
	 N5v+vTVlnazwUiNQdZ4cz9ffs8EQE12L8uyVXxH0TuWBAwOXtZAfTi42N4vUj768RX
	 YhhtKv/RwNA+g==
Date: Sat, 30 May 2026 14:18:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: samsung: exynos990: Fix PERIS gate clock parents
 and add TMU_SUB
Message-ID: <20260530-fuzzy-rapid-corgi-f9eb86@quoll>
References: <20260528-exynos990-peris-fix-v1-1-5b65aa7def2d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528-exynos990-peris-fix-v1-1-5b65aa7def2d@gmail.com>
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

On Thu, May 28, 2026 at 08:10:39PM -0500, Denzeel Oliva wrote:
> Correct eight PERIS gate clock parents to match the hardware clock
> tree, reorder the GIC mux parents, and add the missing TMU_SUB_PCLK
> gate.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
>  include/dt-bindings/clock/samsung,exynos990.h |  1 +

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


