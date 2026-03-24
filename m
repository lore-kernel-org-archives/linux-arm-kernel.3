Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710B1E9A779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nthGksdJwNmPCD7Tz9LujzL9JLUN4+mKoD1w4YALChI=; b=12mOamFU8zmtXZF4oHriaXU9hK
	g+Vc7+swhhkcYzR0ium8AJ2Bd5ArZbH7hykjezBkQpXrMrep6x1U9ySWW8A3BA3ssAqkyBnMf/hnb
	mREiszKShC4CJMtZk+pluASAL0WZVD5Kmg0M7Fsj7zaOSwbS9zT2HXSTNGJKmaGwGsk2oFCWbScoA
	b0zBa29ISvzkFK6gwVN/g8N3wvM9hETxEJ/9/IcjTz6vl12rJppPcsi71p5VkMeWwEpulU8tqdgHm
	r0k7+CqOS4kO0z0dOpCrrYDtk/X49D6foph+WFrXj6pZelSdy4RzibKDoHSwzFxR5hjK2kgVgonql
	9lgMLn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w515v-00000001PiE-0cEh;
	Tue, 24 Mar 2026 12:42:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w515n-00000001Pbc-2Xui
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:42:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C9A760180;
	Tue, 24 Mar 2026 12:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51C3C19424;
	Tue, 24 Mar 2026 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356162;
	bh=+KslmHzSBWG9NBhqDlaYhG5fkbGzgf/HGFiLtDupwG4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OwMta95+gip+cliKqmzke2R0zgzaMDj8ERA+t+vAJ5qvq/9LQCEgaR9jepWf+n2zN
	 jMse/QX2vdmNUzT13oKZAg14N/GX0NluaOPZB4mXFZubnajYvwyYCTJmZYUI1wFFAT
	 la1OwMf9PcoanN4NF81FditcuDz3qOLr4Xe6YGfeSVsEYO7Lv6m4aM/4soZsOCAoMc
	 HPFcmo3xaWKjYxP2Bff3jShp+9t2agKn6ICaGH8OiURrLhRhGlkHm1Dq0BgH6XKItc
	 K9puSEmzWTYHEmVoEDgzJhq4qi/1NYqs+3w2MxEqYtFUWfbpWv5X52tUIMBVeh6q0i
	 nNXdFjThZVvvA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-1-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-1-983eb3f296fc@linaro.org>
Subject: Re: (subset) [PATCH 1/5] dt-bindings: clock: exynos850: Add APM_AP
 MAILBOX clock
Message-Id: <177435615843.56076.4901466217115766536.b4-ty@b4>
Date: Tue, 24 Mar 2026 13:42:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
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


On Fri, 20 Mar 2026 21:15:13 +0000, Alexey Klimov wrote:
> Add a constant for APM-to-AP mailbox clock. This clock is needed
> to access this mailbox registers.

Applied, thanks!

[1/5] dt-bindings: clock: exynos850: Add APM_AP MAILBOX clock
      https://git.kernel.org/krzk/linux/c/bf9462c82721e42f49e4a62efe96ef7b41a5e42e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


