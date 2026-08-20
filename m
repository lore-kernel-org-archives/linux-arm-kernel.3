Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EADBC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 05:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQGmZS4Slygo8kjpwsfEXvWz/G62+OKPWR1aSR0J71o=; b=DYnIRDvUWtzQoNLodz4tiETy9f
	3AeRuRIHzbC8LE1WOAbEGpzilSJTQ07AIgn9n3cXtGI0LgbYw1Z/sdIxTR4Zvh9iIGYsR/ebRP+Hw
	FzA0M0WK6n4DiTdcmms+yrFIapFYw909kDvmbMgtO0lwBlIoc2nUsUcCfu6sKeQ0Y/WXa0l6hwHFV
	nmIWCP5pkokVzHXdiYEtNYLcw/TzApYMZlMk3aRSLKiZpPENkcog4y7D7n9ELvyVCYKd5X/X9ct8y
	9dtc8GAiAmaXZhaIasSgNSeDF57q0MPJ4v3Nk4j48RXnlLDdAc/RoeX185ewiGqymNIHk+8CxOWHe
	6IDyp0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvlg-0000000Asru-2Sk0;
	Thu, 20 Aug 2026 05:56:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvlf-0000000AsrN-1QqI;
	Thu, 20 Aug 2026 05:56:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21F5A6187F;
	Thu, 20 Aug 2026 05:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38B71F000E9;
	Thu, 20 Aug 2026 05:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787205405;
	bh=KQGmZS4Slygo8kjpwsfEXvWz/G62+OKPWR1aSR0J71o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=etYSeNq25EJMXXv4u5We4cSMs+GN9cIyEzv2VY7UVBuVRs1OBZawK1rI2umLSfm+8
	 Z10bjPIGE1Lm2YLQKzTktrGyVont59HrfdephXigQ4nUZtsbP9+TtXX9q20dMYC8vk
	 GG3DYNvaOzjfgKsYxNyKYqSbGMQW22RXnFuPMfW7U7ULdUqfBmCO4aIZCoLojraMQm
	 G264652k98yGakemQGwc7QYSY9Dx5F/StiLfx6Lu5vftbtTFUAHuYGXrYlF380Mpzp
	 HJsJUKYr2mwKN90sdfE5i4F0EoBpkoWG6z2aYvHlVkxmW/+DaGFLcJCrBUipyHOxEW
	 vY/mvnQxFLwhA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be> <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
Subject: Re: [PATCH treewide 2/5] clk: visconti: Make sure clk_init_data is fully initialized
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, linux@analog.com, linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Andy Shevchenko <andy@kernel.org>, Antoniu Miclaus <antoniu.miclaus@analog.com>, Brian Masney <bmasney+clk@redhat.com>, David Lechner <dlechner@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Kees Cook <kees@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>, Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Nuno Sa <nuno.sa@analog.com>, Sunny Luo <sunny.luo@amlogic.com>, Tero Kristo <kristo@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Date: Wed, 19 Aug 2026 22:56:44 -0700
Message-ID: <178720540417.4726.17820278351018025650@lazor>
User-Agent: alot/0.12
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

Quoting Geert Uytterhoeven (2026-08-19 12:05:16)
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>=20
> visconti_clk_register_gate() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
>=20
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
>=20
> Fixes: b4cbe606dc3674b2 ("clk: visconti: Add support common clock driver =
and reset driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

