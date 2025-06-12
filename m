Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757AAC71155
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOf7/qSspzX3EFt8clpCLqVDdqYt7SDap50gU6szGhU=; b=S728scqoAU1D2jhqMaNJAHr8Va
	zCvKNgP5ghMyficHF/U6LIAXhSOGG3cK5SQ/S/FqknBomEsJo9ugg04m6E0HCTtH4/0OOl8iOWKjw
	EOk5dz2iEBdFud1Lrot1yALUlFcRp8gCoMlCB+pZ8BtVzUWbtdJuL0oLWNGGGUTvZA6kIDnh0+Zqc
	vPDcgXGe0N+sskJpO0LR45iUmmau8SvCothCFqZjUS6Hht7gvMdPgT2+xU1Y4LAo1/V9Ld7ALkubt
	YrxlHDqb+xkQJGx2R+4n7U7NGkx3vcKW6p08Gb3N/tZPFEsvC4EOvbuAWbyL3yUNPfiNZJdBQPu5s
	hyAjrkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphT-0000000EfTC-4Adj;
	Thu, 12 Jun 2025 21:43:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDd-0000000Ed85-2xmp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 21:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gOf7/qSspzX3EFt8clpCLqVDdqYt7SDap50gU6szGhU=; b=q/K6YXL5uMxH5bwTVRsEUahkJe
	Pl06xgXJnNoX9HgGm9yPq1Yho3s+v91jMic46HxlLXoAER7Pl8tUr4cFiRQtbtZSMdXC08uv2nhWJ
	323ybqr7Gcc/uNUevzMO1nSho+HlWQ1JMZ0OBGjeK0hYZWBCEWW0gvOPqyiV6wXxv/3hvSz760pB6
	KEXtzAGKwf1W1LTUPTKC8WNnq17twgyUHblm0Mel2p10GmpyH8dL9O61p94z5HbVrWa2zS1IgQoBF
	DB0VZcTiKxN6OqgyHQ63ZATT/T2gSw9tF1J0lEQ/P/DqePEd8E8qFGzNwgsaZChGWCs8Uq7EPUlAF
	JlB/04kw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDS-00000002hzH-2W7F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BC934A854;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CB62C4CEF4;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=/FOvHL4JoMW59flXeN8dYOocFIaMHLLAYyfKjZ5n94I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eo5g9o6i1JomDM6VcBR+WurO2DOSDU/niQawU+oxH/fXYlNz37XffXLszSnqjqUEe
	 3Jn6L45WIH1Rl20iOdyGddZOwB3VsmB1g0fU383Dv564AnAvdYhPjcWqYbCUxJ6ONB
	 /cHKSflKTI7WSWOqjcO+E+8giyBPz0axluyyz8ho9xKC7a+FOqAhsrgq4CfNJyvreB
	 ZA+QNME+gpYZ2yVHv0NNFXilQahY082xCo8ITQ8gk1DR0z0ebYZSHNaPUYUugxxboM
	 XUzvdNcNRWJF1Vtt6T6vCHu+l6zupyPq1qb1GZYPJdV0X58Mswat3+7/r4GpoJl8uB
	 C9G0Tjej2amIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E476C61CE8;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:27 +0000
Subject: [PATCH 03/11] clk: apple-nco: Drop default ARCH_APPLE in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-3-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=/FOvHL4JoMW59flXeN8dYOocFIaMHLLAYyfKjZ5n94I=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a306Q4L2fzPrPu0KMm66q9vrjfcTsSv2dnxWFfleKmF
 tnzpXYdpSwMYhwMsmKKLNv325s+efhGcOmmS+9h5rAygQxh4OIUgIkoajEyrL1kd7lz5asWXk4N
 rwfitxTVZobZLD506GTIw/mSsuH9Exj+5z094fuhjFeg8LaiolDTXumOMpO4NYcmL5+62iNA47M
 NEwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_221207_465648_F1051531 
X-CRM114-Status: GOOD (  10.73  )
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

When the first driver for Apple Silicon was upstreamed we accidentally
included `default ARCH_APPLE` in its Kconfig which then spread to almost
every subsequent driver. As soon as ARCH_APPLE is set to y this will
pull in many drivers as built-ins which is not what we want.
Thus, drop `default ARCH_APPLE` from Kconfig.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/clk/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 19c1ed280fd7f6958a4144975337abe1728e1e85..561fbc9eef2d82133cab0f165c6c55c5e6ab7fdd 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -61,7 +61,6 @@ config LMK04832
 config COMMON_CLK_APPLE_NCO
 	tristate "Clock driver for Apple SoC NCOs"
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  This driver supports NCO (Numerically Controlled Oscillator) blocks
 	  found on Apple SoCs such as t8103 (M1). The blocks are typically

-- 
2.34.1



