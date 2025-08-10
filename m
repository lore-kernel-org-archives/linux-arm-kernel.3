Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4CFC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 18:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9p3NWK+jtv2mhc8DI00xEiWbUGFeQdLedn7/vL4cq0=; b=ainH12bHEvbS9dO6QoBRcB/Z9O
	rtqCoCkCmxdGonA0MRFjulvSayufFQW6B5PwufdzxKLJzak9N7zdtDPro0dxviOmCqlgsrWStDQXI
	KPjwF4eoXSju0/iY8emYttOCXIDGkzBtRGfnPvWTzqw0W/AdD/7N6bLkZu4WAvHGMbC3S9uwp6GwV
	NcN7tPmI8gCPfPPRsNQsSJyYC5PIs+dLtmnqspHD9S12FFRwDGbQy2hzdue2pizxnMV7QGYjihRTT
	QhveUdX6nIE//FqsJtjJOOIl+FnFQPTGoHf7QgP4+CoZR2ppgxzT54hM20whIht0r4AJiRapvK1KW
	zpOwJPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulAmS-00000005t4t-2PNp;
	Sun, 10 Aug 2025 18:28:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulAjt-00000005sri-396e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 18:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D754F61401;
	Sun, 10 Aug 2025 18:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF8DC4CEEB;
	Sun, 10 Aug 2025 18:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754850348;
	bh=mZCkM6wGTji0mWS1T8Wao5Nwc6iHBzOB8nBF6FjiL+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYe7rWM5WTvPFgmLR7TLjrutsMkJklAM/UhllHcSQAfItQYp0TIM5qKhyNbmwqd9p
	 HZnUw7fWKocJce1pJiPspNZGQZH+Vm46cN7KOL9PZ4eh0w2SCOQKvmn1daATRrV9Cv
	 4cdQxC1mAC5SLLCrc9dk587FcaSETEVNuPQjkKwe4pFCCgoht6KoOnQpmJstZ4LwhK
	 mU+QkVG1GAVBX32aiGpRWx+VUTOzOhMWP8cbN7RtcdzXpodPlWtbwmfwo68Jz84cp0
	 iVRfDjK90q+dXl0TmkkgfAGAicf3uU1xgqaNv6tz949zkpXivG+bL2WJz3LruH+wWv
	 f0AqtP3qtqlPQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: (subset) [PATCH v7 00/10] Apple Mac System Management Controller
Date: Sun, 10 Aug 2025 20:25:34 +0200
Message-Id: <175485029271.49938.2893773472462799086.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 10 Jun 2025 15:29:41 +0000, Sven Peter wrote:
> This series adds support for the System Management Controller found in
> Apple Silicon devices which we model as a mfd. It also includes support
> for the GPIO block and the power/reset block as sub-devices.
> 
> Changes between v6 and v7:
>   - Rebased on 6.16-rc1
>   - Dropped mfd- prefix from the macsmc driver name
>   - Removed the check if the MBSE key exists in the reboot driver since
>     we can rely on the device tree now
>   - Changed my mail address to kernel.org
> 
> [...]

Applied to local tree (apple-soc/dt-6.18), thanks!

[08/10] arm64: dts: apple: t8103: Add SMC node
        https://github.com/AsahiLinux/linux/commit/6101fe95b1ee
[09/10] arm64: dts: apple: t8112: Add SMC node
        https://github.com/AsahiLinux/linux/commit/49765a617a54
[10/10] arm64: dts: apple: t600x: Add SMC node
        https://github.com/AsahiLinux/linux/commit/4379305ffbc2

Best regards,
-- 
Sven Peter <sven@kernel.org>


