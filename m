Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EF2D6B09D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHDlefDFBwuxIW8YrPkmorwA2xDfjyztN0fMf0dmC78=; b=Y4RsLaeZ8x6RnzFaLpP3iHBtg5
	hn/H1Bn+A6VyJ4Ebp+XPZAhuuZc63SAxKy3E3A3BpXPsxqKlt4QwaYXfKxM4VY0GiLF7w5W8fMDXn
	zBU9c63Hb6MQYZI4TTm0+0PsodyF4Ot48xgncC5ankr+KqlVmQ2LhwkTNPYEyVTBp9vCV71SdN8FB
	CVkWwF7eektmN4E1es6KrKrEwzIaO+yyuolnkj3pfDahadUN4FynjwiFKmYPpRTgnAcDrl6b8x1d+
	6HxfEsYo0ZgyaxPwOKANY9IF2HZR5nI652Weq/44RB+mFO/a33cbmYcjBH87JYyObUTx+c3eTAxSz
	GDcfqqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVal-00000000P2A-3Pq9;
	Thu, 29 Jan 2026 17:14:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVal-00000000P20-0ezF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34FCB60054;
	Thu, 29 Jan 2026 17:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B720BC4CEF7;
	Thu, 29 Jan 2026 17:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769706841;
	bh=27kNKSKigZ302oO4twnPMLC0uG5HbWa0Z1KJS0oe/D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tN4zAYJXAZpEy3d6ProYbKGSY739oMbmdfcn5NU4TuOi72e2duwvu2H4xBEsLEWiC
	 +JfvZeFm2UoEdMRZd47svwmODAxX4pi3zeaF22UV2W/nuE39wNgGsFhdZlmYMie1ta
	 Nx/EhbK+wOMQoo6E+UtPTGBdAU+fTt5ml2q7wY8+UX2f35E1r04rmfWgxcV1rW4H0s
	 q2/gPbIS54mC4uNOSqn1qmQZyZzuBAZEE6VlKzYlw5CsXsJoYKtAcDPJPCQ4gB16cp
	 foi/HCKIAOHR6emQmWYkoPwzBE2XfhY7zv2hG+EzWGi58mMWxeiYd7rERf/JO/Mpv6
	 wDcR4TVpKurRA==
Date: Thu, 29 Jan 2026 11:14:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 00/12] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Message-ID: <20260129171400.GA1287342-robh@kernel.org>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
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

On Fri, Jan 09, 2026 at 05:57:44PM +0100, Krzysztof Kozlowski wrote:
> Dependencies/merging
> ====================
> 1. First patch is a prerequisite for entire set, so either everything
>    goes via same tree, the further patches wait a cycle or stable tag is
>    shared from DT tree.
> 
> 2. The last media patch depends on my earlier cleanup.
> 
> Changes in v3:
> - New patch: cdx: Use mutex guard to simplify error handling
> - Collect tags
> - Link to v2: https://patch.msgid.link/20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com
> 
> Changes in v2:
> - Update also scripts/dtc/dt-extract-compatibles (Rob)
> - Collect tags
> - Link to v1: https://patch.msgid.link/20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com
> 
> Description
> ===========
> Simplify for_each_compatible_node() users with a new helper -
> for_each_compatible_node_scoped().
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (12):
>       of: Add for_each_compatible_node_scoped() helper
>       ARM: at91: Simplify with scoped for each OF child loop
>       ARM: exynos: Simplify with scoped for each OF child loop
>       powerpc/fsp2: Simplify with scoped for each OF child loop
>       powerpc/wii: Simplify with scoped for each OF child loop
>       cdx: Simplify with scoped for each OF child loop
>       cdx: Use mutex guard to simplify error handling
>       clk: imx: imx27: Simplify with scoped for each OF child loop
>       clk: imx: imx31: Simplify with scoped for each OF child loop
>       dmaengine: fsl_raid: Simplify with scoped for each OF child loop
>       cpufreq: s5pv210: Simplify with scoped for each OF child loop
>       media: samsung: exynos4-is: Simplify with scoped for each OF child loop

I applied all but the last patch which did not apply for me. Send it 
next cycle.

Rob

