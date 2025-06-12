Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03A6C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JYEKQOFsjigpSWy19K9277/0HgqRUWa3crDLWVHwmg=; b=1685KsEWI+3545MMU966Isrqcl
	8rylFOQh9aSkluoKDAwToULKBccMRiLkgu3YXeFDev9jmcQ6CMKhSBKF9kl89u9VnKOEWFKFDaGU6
	4Jd/C3NN3sgcpX+Jpa6Nz9yIFCXinsoqVC/69mmZKkp4CzonL6gV1HgaNAVViLWiASdRdt9bIN65Z
	AqhPR1I4IEOrQznJO29CrV3eU99hmrxRlnfPTqjimeBd/HCnHwhOEnT3tjgd3CdRrB3JaeiDvZ9Tz
	M8euc1Mgho83R4VZbudWUmfOmc3Bk0MiQYaSrGQGCgMVBOFKzlZ2rSHLbd+mPKy5/7YNXebX9+Qpr
	D+srB1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphS-0000000EfRs-1UAe;
	Thu, 12 Jun 2025 21:43:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDU-0000000Ed7D-4BMP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 21:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1JYEKQOFsjigpSWy19K9277/0HgqRUWa3crDLWVHwmg=; b=mMuqUG+F9gp4dHFfFurGZPyZie
	6M2fflE0QcsKwemx5BymlCVYbiZbQ8REC1Vi7NzEUVaQeCt3CJFahun3vzO7w2iAKLUQ6PLBQIyIo
	Rk0t/mnDaGZenfq7l+TKUu0/cwkYB7w4GXYxjK2D6b9t6hq240nmPveN9aDu2NZV9CnSpfTe8cYZv
	o9cwhTOH7gRlYoKWceq3Jbbh8in4w4k3dsoyUycGsOwmBWpxkLIcKaXmpUU+Hh1i9TlFqBfCfHkM9
	SL56aXGmzh51+/ZIzRajXPoibF9wWkhLqYAJZ1bIaQVOGLoeinG0F7twUBb+iuNyEF3jtKx7lxfgV
	r3ylVa+A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpDS-00000002hzK-21bV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 21:12:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1548F4A85A;
	Thu, 12 Jun 2025 21:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6BF6C4CEF9;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749762721;
	bh=fpXgaicKdFrQeAEZR+OxW2abaKNb7vcivYXBy1nvPSI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ACfor1YFhhOjLScqQiuTFP+IDgfpmfy7NrgT5UGaZGhgm7vHH8kZ7XVjq54Z3c7q2
	 OI9zkxbaqMy9JKx326OKRHMsnIUL4QGmrvge9T3FJ4G8hpMFiWHWz9ymd/aEIYXoFv
	 /YB34ck21DXGx/AMa20FmQBERMhVFbT/YC4c2UTcW0EqK6SetoI23NJsiiV9au8BP6
	 ENqcXMd1SmaNzgOlOdfz0hwB6ojcj5baWyoOPmzEIeYPd/xDkJ7oC0IYaM7n8XYoIz
	 9foP5brZ3s1Tjh3Zy7O8BI5xU1qUxNWAb2lcJ1/RSkkuJKe+IPwV5Yan9CuxQ+rA6r
	 7bip7TobVm0Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59DDC7114C;
	Thu, 12 Jun 2025 21:12:01 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 12 Jun 2025 21:11:28 +0000
Subject: [PATCH 04/11] nvmem: apple: drop default ARCH_APPLE in Kconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-apple-kconfig-defconfig-v1-4-0e6f9cb512c1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=998; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=fpXgaicKdFrQeAEZR+OxW2abaKNb7vcivYXBy1nvPSI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4a305RfC9buXhnFJeT7ZtXOyWKTBGNcT2RszDk+S+0de
 2zXh3OHO0pZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATCXjKyPD/N8fWXytyO9w3
 H9vLsvuOyryjh7QOM79euYrv9Y67GdKMDP9sbNttXszX8c1ZPtvgjVDNNqH+83FLjxxlkLlnnn+
 /yo4BAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_221207_107237_B52E7A9A 
X-CRM114-Status: GOOD (  11.22  )
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
 drivers/nvmem/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d370b2ad11e7eb3a3549a75edaada2d84c1e8dd7..edd811444ce5f4a1de1c59496f27bec417da2bbc 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -31,7 +31,6 @@ source "drivers/nvmem/layouts/Kconfig"
 config NVMEM_APPLE_EFUSES
 	tristate "Apple eFuse support"
 	depends on ARCH_APPLE || COMPILE_TEST
-	default ARCH_APPLE
 	help
 	  Say y here to enable support for reading eFuses on Apple SoCs
 	  such as the M1. These are e.g. used to store factory programmed

-- 
2.34.1



