Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E59ECA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh/y+8ww4qgzVtVEmUDXThCVXr+h/XhtDr932zbuajk=; b=EBHt/wmMIEZDFEQV4szzAsdPEd
	NG4Ergjh1wui5CRIposBZ3epvunOHH1SItjAmTy4yGJ3ZPg2uhQsbnQmIBSoal42ltNE1mbEdNGOj
	ykhhBoFqLRYP68KjVTF2IGTsyfRWdIyTAVAbbl5PIA8IuHRdiVhNgvekecRTcLSJTuB7BKsNt34A1
	UY5rDEhzex7y+P2VizkR2N4M/YlaD/VjOFwdkRjdGiXS6OOgcD/PFnTwn9xWxdv3U24ybTIhYL6/N
	2xye9E8Jb0i7yXvQnpT+y0HhSg/oZhQJf86mK//7m6csZRHRldE+Def/4Ya7hI3MNV6ifPa5elESZ
	qWoGGfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUKu-00000002zo1-1d8Z;
	Tue, 29 Sep 2026 09:41:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUKq-00000002zn2-231x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:41:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AA9360008;
	Tue, 29 Sep 2026 09:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B868A1F000FF;
	Tue, 29 Sep 2026 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790674875;
	bh=wh/y+8ww4qgzVtVEmUDXThCVXr+h/XhtDr932zbuajk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eTycSW45LWX7/MF/VprD1aZhTjRJiAnwtoSIPTcvI0ixyV2lo462dvvMoGBuXePXn
	 RcHqZ96S4lKeUa+2akNWJzW7T7MSIELhVevIsTmR0R0/dHxbKkO56mPQPFzWtTBq5g
	 5HUdFlp5nEQcsDhpTT5gSzE8BG9usfZegJKCptcAxCQPRztTkyySKoFLLzDOjMYcRm
	 dmHRFlf7VVwKXPh+bPs2E7hHvymkou/rjr8QhyA0UaGCigsoYz5go0TIUmjdqh5MFc
	 ibIChelswMAfcE2R7kWD7RSPpXJzdOsUz5/jpmC5cPcxTixG9lM8YnQ30llhP/bJpM
	 TIum7PFha6skQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Norris <briannorris@chromium.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
Subject: Re: [PATCH v4 0/4] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
Message-Id: <179067486422.102650.10176830320558486814.b4-ty@b4>
Date: Tue, 29 Sep 2026 11:41:04 +0200
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


On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> This series adds initial basic support for Laguna (Tensor G5 SoC)
> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> 10 Pro XL) phones.
> 
> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> entirely in-house Google designed SoC.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
      https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
[2/4] arm64: dts: google: Add dts directory for Google-designed silicon
      https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
[3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
      https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
[4/4] arm64: defconfig: enable Tensor G5 SoC family
      https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


