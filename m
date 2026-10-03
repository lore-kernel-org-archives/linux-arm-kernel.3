Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0457CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofZE+kb1r8+hvMIvcuxyOTAGuinMX21M/94Z27ADFBE=; b=4tpjmUevqEFU60Gj9+BLZQ3OlO
	kSSC/W7n50rUVxk6hit4bEed1nO9bQuFifymv8JdJiD9hLnlhnCuzVRjC8cW3BFeNC/vTdFKuv726
	FXrImxNj94jnT73iSnqpYE+qPfYacNnEjQqSnnSn+mLV0vQPivWcYE0aLlWKJFqO7pi1IYy2bf9oL
	/eOzBGlr2fr8bndhqPgrLpI9Ny3OjyX9jzToGK1bt0vObeupPXdv8p2OTRBhByLrJFQDGA9VE/bJj
	Ii34xw4/JrX+idZMgxJSccpU25CyCoA54RqJ5a2T47cSJBfP6Bvs/1dcQNFWRB08DkJ3DJ/fmasAF
	9ans73rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD04u-0000000DYMe-0TOp;
	Sat, 03 Oct 2026 13:47:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD04t-0000000DYMH-1hV8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 13:47:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D886B40796;
	Sat,  3 Oct 2026 13:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8254C1F0089C;
	Sat,  3 Oct 2026 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791035222;
	bh=ofZE+kb1r8+hvMIvcuxyOTAGuinMX21M/94Z27ADFBE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mHYklXRYPMv6RxvQhyiuDtRBe46DExSwR9/8GHCdBCQcQ8eNPtg7Wpj4u3rGC97t1
	 W4AV9lk7Ld3mf8wgDmNthZDkenjgAjFNPGl9Oe4osu+feJ8zj4za+hsot6D1G4TTDW
	 Q9TJMRKKzFz9BK5UJVBnI0pLMUSOEBlWEFnMr0EROwg/QQV1Ew6hMSZalGlGrZMv+M
	 w9lCP0HIF7claHjnt4V/DNf3aBlOW/d8bVkrgXt+grSKu+oQWs4LsQTHHNgttxt3Y2
	 m4XA2MykwUtdHWuNP4h0fLGh4KFuQ7NjgFYWhfLGk7BfgNGAGnPLwkRxhN1KbqDrfT
	 3Sdl/+BqtrYMw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jaidev Shastri <jaidevshastri@vt.edu>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921-mb-exynos-pmu-v1-1-4babb522ce0d@vt.edu>
References: <20260921-mb-exynos-pmu-v1-1-4babb522ce0d@vt.edu>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: order pmu_base_addr before
 the pmu_context gate
Message-Id: <179103522127.13392.6192386924567242318.b4-ty@b4>
Date: Sat, 03 Oct 2026 15:47:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Mon, 21 Sep 2026 21:07:23 -0400, Jaidev Shastri wrote:
> exynos_sys_powerdown_conf() returns early while pmu_context is NULL and
> otherwise programs the PMU through pmu_raw_writel(), which uses the
> separate global pmu_base_addr. exynos_pmu_probe() maps pmu_base_addr and
> stores pmu_context afterwards, both with plain stores, and the reader
> loads both plainly.
> 
> Neither the two stores nor the two loads are ordered. The callers are
> the Exynos cpuidle AFTR path and the suspend path on 32-bit Exynos,
> which run on other CPUs, so a caller that sees pmu_context before
> pmu_base_addr writes the power-down configuration through a NULL base.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: order pmu_base_addr before the pmu_context gate
      https://git.kernel.org/krzk/linux/c/682df6e2330123019fcdb9f6122f34a395082356

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


