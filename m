Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0305EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lokzVSCjnI+/HGYEwJEY6r1YE8wfZpR1yRXJ/Lux6Vw=; b=gTuiZV8G3Nvyl/iyAFHahQYTK6
	8sEdXxUOrs2cZ6F3V3km0834BiEmPpFm6yWROrIBzf5+Ag5u+htEFU5Rvqd5VQ+WtwBccNiJnLHmF
	kFOHb6A5nakrRxMdFyO9nf5oA5146L/6u85WUX0lXUH98Z87RKVbWKI10W10tLA2XiRm74kiMagnI
	kzpxwLOyTzKzgj2cPjmejZU/V+6w9Y7pz/G0aClP0Q7TkLPkqOv5+C108bXMbH9X/FU7G1d3iZPWf
	m3hOWMAnyKc+xftttOAuBjuM8b1ZTC+PF186XHvJSQ3/U+pY0rIo8Y2CgjQy4oHpAMR75Sd+90FVF
	yZSYu4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUzH-00000000AmY-3zi4;
	Mon, 10 Feb 2025 14:42:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUsi-000000009PB-2jST
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F5F55C4B47;
	Mon, 10 Feb 2025 14:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A72C4CEE7;
	Mon, 10 Feb 2025 14:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739198127;
	bh=YOnLsQVFLMH2bFUH18nK2RMlrkj9YbYtO1geEZmMl4Y=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=C2Fsb1tvvXRR3kJMMeaWrn2+i2Yby3dftAZyFsBmQ79eEk/mph2/3yo61l1MrcQfL
	 hA8JlslLwXOMqyMYlC3HKWHLl7IDfKlzsHgbmCtWDiVxBSFPUt4iKSGQgRuutGisuy
	 GGDBhjmbk5WsGCBARlZDja+rBNlRP7bEWSseAZHa+TohVCR8cdiGAf21VJf025VZHV
	 Qz+S6jJYotb/FeSbMBpyATEJ2o+0INTMj9h8zOEgr4C0PUi7+weAkF7Hd3OS3+4e27
	 1wdDwKcz3I+Ly0Qg15Imii/gq0FC+RpS8sC8NfLJ/xneoVLMmByzW6woZexM8Vtr10
	 Cu3s5F0tLGWKw==
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
References: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dmaengine: Use str_enable_disable-like helpers
Message-Id: <173919812243.71959.2545724653806590968.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 20:05:22 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_063528_763853_60A90607 
X-CRM114-Status: UNSURE (   7.88  )
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


On Tue, 14 Jan 2025 20:10:20 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: Use str_enable_disable-like helpers
      commit: 8e63891831f3904047d7ad8078ff52dd454b6975
[2/2] dmaengine: pxa: Enable compile test
      commit: 9fc2f03e85952ee52558ab844473a8284d924a56

Best regards,
-- 
~Vinod



