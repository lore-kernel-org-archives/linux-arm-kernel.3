Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA12CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URX4wWWM95/M1Hp0Br3sAEbKSjBXseXlT81KNTuzNjU=; b=eLXmT+Y4m/RSETzKmGntocN5C/
	76gipfVPoEys4QBqwkRB53Jap0FMlSXQUDk7eDOVFNB4KMUnwta1z2j/AhFGCyEt+m3/YtbEPmKmS
	CZQCVIBJHaY0PQGKz9yQ4vmLOhHZyTqkDongVYuSDQyQ9JjTowajRdACFqp1LGb2QR/gzxjhBv4f9
	1IzWafihdTg3EGegQ15vrQM8dHmnOCDG5X98DAAirmS4vdd3IwSSYi4lLk+x2j+ngwI2VqIPISetA
	106//1tOUFQjua9AQ2UMZohn0qrlCBRMd68c2Y46oK/bKUg67w/OAJM4RrODeBWl9xcBPzp82s9c0
	lXdM5TBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZNa-000000068Pb-3qrU;
	Thu, 14 May 2026 16:57:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZNZ-000000068PG-2sc9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD7DF60008;
	Thu, 14 May 2026 16:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F196EC2BCB3;
	Thu, 14 May 2026 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778777834;
	bh=oChIyfQLFymEOPNHqy7AoXKzE6HdH2VvyMttA3ZZRJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kDqaFhHGZX/arY67mGQUBp3FLp0GAUEu+kz4WLdBo+b4K/+l/H7fJdcnFM1H5ihmn
	 EZFBD2RgMzzFyx4yJmGO6fZWT62BqyRKex9JCRqIEIXPHjChQ5uvhugzE12MeTk/Hm
	 1w5USBUSXYhvrN6tCgRsypJgXADvNn7pFzwP9qUG220R+eYGSM59vRMeVKgCfH6VbA
	 KNnWiW0sZu3fbDSYdaSXoEzdVWvenWLxyrEZ4QrSRc1+tuXdW5rWu77YAlLYPGTVkY
	 ed1J5KmneI7roICI6/8fL//F1MFkjmsnhZKDrR12ysiHzk7s3N53Ewe1mN9F3uE43m
	 FPTXoE1oCp9Sw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Brian Masney <bmasney@redhat.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
References: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
Subject: Re: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as
 critical
Message-Id: <177877783172.167994.5951307735596318933.b4-ty@b4>
Date: Thu, 14 May 2026 18:57:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Thu, 30 Apr 2026 12:53:27 +0100, Alexey Klimov wrote:
> The Exynos850 APM co-processor relies on the I3C bus to communicate with
> the PMIC. Currently, there is no dedicated PMIC consumer driver managing
> these clocks, so the clock subsystem automatically gates them during the
> initialisation. Once gated, any subsequent ACPM communication with APM
> results in timeouts.
> 
> As a temporary workaround (and let's hope it doesn't become permanent),
> mark both `gout_i3c_pclk` and `gout_i3c_sclk` as CLK_IS_CRITICAL ones to
> prevent the clock subsystem from disabling them. This makes the ACPM
> communication functional. This workaround should be reverted once a
> proper ACPM PMIC driver is implemented to manage these clocks.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: exynos850: mark APM I3C clocks as critical
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


