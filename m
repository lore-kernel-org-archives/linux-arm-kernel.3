Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63584C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hN2eSZi4ppMyvxv/XURS3UhT1jZudfF1T4A//Uza7w=; b=an90ge9t48Slq4xsgOiYrTJCcR
	4nxcvc/NP4323R/msmpTGUt0DJFI94p1WzZzbDZ/mIVrlnxKMHJJAafbS2n0gCTvtmG4eoAmyeteU
	fEloBUewwyiPeFmlL/+85ffYQu6aT8n8XXJcTrJ375U3/xpJCcBRkuwoOzbXPKGUC+Xm+8jyHuhM9
	d4qBPj7Cei6q+DNYpfrbH6Dwhqc0xxLWvV8A2xNH060BoyQZX3imnmH5LCT+QmyiaMoGRuae4Jfu3
	F2+yyAUJJwYOrGvh8FckRZyon4pM39CWtmf8S7izSjvfxcUWJE6IE9wu18gAy3Fes6noa9kP5ECrc
	cK2smDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zCm-0000000Ehed-1tzC;
	Thu, 24 Apr 2025 16:13:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yEc-0000000ESkG-3bFA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 15:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22D5CA4CED5;
	Thu, 24 Apr 2025 15:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C47DC4CEE3;
	Thu, 24 Apr 2025 15:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745507489;
	bh=BaigLKgi67/CVqkot7IIPq3EJQR29/Gk6ouHiFoFK2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JeY03B1TWTc8tOQ1C9dlZuITJhFQrFeGVy6Uq2qfuk5n5BKK63mEq4v+xjtxaRWwm
	 zYcxzm6rZtgEKx13PKAxb8Ghk39ZIP6GxHp8/G5sZ7pN17imkZBppQIGSGVb40O0SG
	 yiIqZlTvRgJY9XS9y1h9Vt7hy6vF62mGYsZm5Abm6tV39Q00uBoPzJBnG+QFOVej1d
	 MmtRb4yZusQ+HbJBU32nPOqndEBs9V8I/WMWWw5SDCa3hyyb2krUmif/76l29o0P2y
	 sgBpBGi/jn6iDifBnU/9PIGo5YS5Rwjb6pQrpxoeZ3KfRs8DqEg8/daA1h/IZgAfO6
	 h05i4tAQoEupg==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
Subject: Re: (subset) [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based
 drivers
Message-Id: <174550748501.1452626.16896113997247650772.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 16:11:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_081131_023327_AB468AAC 
X-CRM114-Status: GOOD (  12.01  )
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

On Wed, 09 Apr 2025 21:37:21 +0100, André Draszik wrote:
> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).
> 
> *** dependency note ***
> 
> To compile, this depends on the Samsung ACPM driver in Linux next with
> the following additional patches:
> https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org/
> https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
> https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/
> 
> [...]

Applied, thanks!

[01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
        commit: 702ac7e59d9bf018126d51a2a3c7708e35afd8b0
[04/32] mfd: sec-core: Drop non-existing forward declarations
        commit: faaad8c7fa7aca377cb0a2ec2b4a64c0bda6f451
[05/32] mfd: sec: Sort includes alphabetically
        commit: 3e18fe35ea16640b53e41e963fb50f8dbd80e004
[06/32] mfd: sec: Update includes to add missing and remove superfluous ones
        commit: e4f9f9942e80bc512da2a2ecacf294b603e6f4a8
[07/32] mfd: sec: Move private internal API to internal header
        commit: 60ab5a460717ebe8306535cce8a4abba4df99b3c
[08/32] mfd: sec: Split into core and transport (i2c) drivers
        commit: 286ee42bcd9b64bf13190769e705620e1d11efb6
[09/32] mfd: sec: Add support for S2MPG10 PMIC
        commit: e60189f7863bc47cbdccd8cca235cc159cb153c6
[10/32] mfd: sec: Merge separate core and irq modules
        commit: 494fb2908480664ea95c5bff26a174dcb8b072eb
[11/32] mfd: sec-common: Fix multiple trivial whitespace issues
        commit: ee5114413def30a79e1892eafe9194c06124e9dd
[12/32] mfd: sec-i2c: Sort struct of_device_id entries and the device type switch
        commit: 742d53cd4487792c2d70d5b5ccc8468a7c4bcc33
[13/32] mfd: sec: Use dev_err_probe() where appropriate
        commit: a745673725d2a63aef8c8c62b2496e345c5f3b78
[14/32] mfd: sec-i2c: s2dos05/s2mpu05: Use explicit regmap config and drop default
        commit: a0164e4ed50bf0cb05d2692a866276a11db0dfa4
[15/32] mfd: sec-irq: s2dos05 doesn't support interrupts
        commit: a5ee21c891befdf9b695f17222f246fda14ec580
[16/32] mfd: sec-common: Don't ignore errors from sec_irq_init()
        commit: 12933bcf7119ec1b75b8d43f17cb7ed4797aba21
[17/32] mfd: sec-i2c: Rework platform data and regmap instantiating
        commit: c206953656074edeabfdf44bbb2bdf89daf6bbe5
[18/32] mfd: sec: Change device_type to int
        commit: edd2e1784f620e1302b660e68578aa353253fa2b
[19/32] mfd: sec: Don't compare against NULL / 0 for errors, use !
        commit: 079b0fe8185c5a6995b3d3c80a6098f857702048
[20/32] mfd: sec-common: Use sizeof(*var), not sizeof(struct type_of_var)
        commit: df7abb6bbc6a75aa0b7829d39f1fe8499d9580c4
[21/32] mfd: sec-common: Convert to using MFD_CELL macros
        commit: d4bddf7d284d61331964d5e46405b7afe0e98bf6
[22/32] mfd: sec-irq: Convert to using REGMAP_IRQ_REG() macros
        commit: c0d96474f496db3fe286fe8ae2072c321205629e
[23/32] mfd: sec: Add myself as module author
        commit: d2bae7c2b23185a71a22f85079461f22143f9b64
[32/32] MAINTAINERS: add myself as reviewer for Samsung S2M MFD
        commit: 8a0542753218d260e23c77311cd909f7b38e6daa

--
Lee Jones [李琼斯]


