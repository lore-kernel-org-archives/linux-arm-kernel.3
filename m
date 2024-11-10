Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06B5D3C931
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/WykKxZOaR6yEIaGJhp6UziuwBXRJYF2COdtS4y4HQ=; b=dEhYgav3g0LWwEczUvj6Q4a+dn
	eJDJ/PwKbXC7vgtcz+jpMndhH2GEmWm2GPpZ2BHfoYSyD/LVkh1uSn9A7dUPFgFUHEcIM/gQeqHMY
	la0/P43aPhjusX6PjPdTasuyUJNIzmjciQKnPFxaoMLY09ik+Qd7Fp6GA4GcE8sGcHOR22RXBDstq
	TCN1mV1kqvbV4ON/0WcS8CKXYPwSGxmGtMWB83eH4BQabWF1qBl3valYJlYL1OJ7oAmirDVI3huB+
	vPqhCa0ipQuQlM16a65Kh97urCkj/ml3fsiYySx3VG3eAH7q0nRQUeShRaRCD7IK6U0Iiv/Zf9PgT
	/6Ax5ONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA70C-0000000Eq0u-041y;
	Sun, 10 Nov 2024 12:25:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA6yQ-0000000Epox-0fWB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 12:23:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBD3F5C2982;
	Sun, 10 Nov 2024 12:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE66DC4CECD;
	Sun, 10 Nov 2024 12:23:20 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 874015FC00;
	Sun, 10 Nov 2024 20:23:18 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yangtao Li <frank@allwinnertech.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Cody Eksal <masterr3c0rd@epochal.quest>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban <parthiban@linumiz.com>, Andre Przywara <andre.przywara@arm.com>, 
 stable@vger.kernel.org
In-Reply-To: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
References: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
Subject: Re: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
Message-Id: <173124139852.3585539.10704015898700065278.b4-ty@csie.org>
Date: Sun, 10 Nov 2024 20:23:18 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_042322_278621_EBA849D6 
X-CRM114-Status: UNSURE (   9.33  )
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

On Fri, 08 Nov 2024 20:37:37 -0400, Cody Eksal wrote:
> While testing the MMC nodes proposed in [1], it was noted that mmc0/1
> would fail to initialize, with "mmc: fatal err update clk timeout" in
> the kernel logs. A closer look at the clock definitions showed that the MMC
> MPs had the "CLK_SET_RATE_NO_REPARENT" flag set. No reason was given for
> adding this flag in the first place, and its original purpose is unknown,
> but it doesn't seem to make sense and results in severe limitations to MMC
> speeds. Thus, remove this flag from the 3 MMC MPs.
> 
> [...]

Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] clk: sunxi-ng: a100: enable MMC clock reparenting
      commit: 3fd8177f0015c32fdb0af0feab0bcf344aa74832

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


