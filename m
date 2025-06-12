Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183A3C71151
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjAHLhJ+1JFYBN1/1w0DpX1DtXpB41qpgl0x1LIR3nU=; b=BkI8U1QRiBlr1NBWqlWfnSbUpp
	Pv8KyTeBdqAjbFyPLyNxInKWooyqtm8KEXYZ51eXKyvsgD/iCzUZcsye6UqoIvrSDgzcD4YTDO+MB
	7cdMLF9nSuS+s7tE0viYCD8No658Abb0xFWXGdU/bMoHjIvCuOhSWVfor+4TZC/EoVQdPuzq2tKOq
	JqJWhJsTCtR9rGotWrFG6bH7h9Z19LCTiZPeBZwGlG0B2+abDdOqOzNoMToVbsipSZBxNq7zxoRE9
	a0yHKt9paJwswI1LeEyuXh0Ekasi46wpXG50An+hfOV/x/HdFwldT0yyv+Wk3JTSbjdCAVgL5M6Xo
	CfVxs77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphV-0000000EfV0-3Z47;
	Thu, 12 Jun 2025 21:43:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDe-0000000Ed88-1Rd0
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 21:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BjAHLhJ+1JFYBN1/1w0DpX1DtXpB41qpgl0x1LIR3nU=; b=IOeIQcDIIT8sM8oiWOkenQr2v4
	CqV3UUsgftT49JiD6L7dPpO5Dgijo6ABV4WLeH0idZlwqPRb8e3m+VAGQ5wSKDOeo9DtPvCXruDRB
	8cQ8oyKFqdwBkK3wPLX8Kn8EbF06Q/yXVcvzD5A6gi+5pzTFoxI5Kb8EyReC5zQPIjWm5NyoQO4MO
	9Myr8+Ar6m+5WzeutjER+7USHiBSTeeFcZJ85z6fmc8t4XGTQ4oEHrSTk1pbhKtCvD1eA/T+HDZ8B
	njePInU0WLVXtuq3PHrjkTA1ejt8/I0Eaa82HzbeJQJkWxQaDJ+xGPHfwYMjo5YtvxZhhWnewv5xC
	nqGXcUwA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDT-00000002hzN-0X1x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BF764A84A;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58A89C4CEF2;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762722;
	bh=B+ULNUySL/tycF45z4MninBMMkdPrQZ7s9hDSWM0yxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m35W7jBMER4m6jU1aOYfYRGE65aZVPlqPralPHRh7vzQtkVF1PXTO0WdOCGKidAJt
	 m5uPMOOPI8JI0PQpqqoCnpImSVurGu1WI48v7iSXPL8PbaCzDT71OmiqZXkiPUbMOp
	 ukjvjXtK/P/1/krRa6H3DL1+ETLjQ4gsC1oCYqp07nkVbtbns1BGUGppQGenjAdJaI
	 wBjizqsFaDz254MXAK0PfyOOmAlST0X4r2HmBsxqD7FC78TblUWuUXkAA9g/r2SDXf
	 +zt/4oI6e0+XpFYxiV+Wy8cvW1be48RCNQ7vR5uPaX5rgbDFb7p2nlLR3ttuUhvfzX
	 jIRUYvyhTXEjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D429C61CE8;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:34 +0000
Subject: [PATCH 10/11] ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-10-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=B+ULNUySL/tycF45z4MninBMMkdPrQZ7s9hDSWM0yxs=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a30xydBbpqq5VXvmSptO66k2MZp11785gtr2j91R8CB
 z+4Rst0lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACZy4A0jw98cpg0xd0T3ip64
 w7XKZO5Mrz1FD550BPhdlurgZ9hxqY+RYebbP+6/fRZ9VZJTvKSwN+B0xcNfM58VqXYtWZGu86s
 9mhsA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_221207_673316_5C9FFA0E 
X-CRM114-Status: GOOD (  10.58  )
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
 sound/soc/apple/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/apple/Kconfig b/sound/soc/apple/Kconfig
index 793f7782e0d721a1778a82e3515665c3f9f14ede..e9c777cdb6e39c5446f00faea0e617e51b318000 100644
--- a/sound/soc/apple/Kconfig
+++ b/sound/soc/apple/Kconfig
@@ -2,7 +2,6 @@ config SND_SOC_APPLE_MCA
 	tristate "Apple Silicon MCA driver"
 	depends on ARCH_APPLE || COMPILE_TEST
 	select SND_DMAENGINE_PCM
-	default ARCH_APPLE
 	help
 	  This option enables an ASoC platform driver for MCA peripherals found
 	  on Apple Silicon SoCs.

-- 
2.34.1



