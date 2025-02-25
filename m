Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185DAC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mBQVNLHun5M0sl9D30BCaMC9bafP/KNemKqU065LzyA=; b=ip5+LwsYPWZ5Lg/cTs+zOKu84g
	GAsvmSyxmjJ63y54oPCAx2l9CSrJEI5sbLBjwTVr+6YYEuacpmvGZPNKQgC8/bRKRE4M03Xw91jmD
	B/305+eqLOvidFmkQR+yo9kD+Iib9u22nHWVS6eyniVds7PFoSyI1EPm4i5tZC8bcouol6NlValeb
	kI1eagnb/hV307nmks++sGhxrXa3JI9IgAw8OL+K5mt2Ny0C3l5wUdlnHMfDgjxC34qihORSGayNu
	eG4pyNulo45ywHQxpJgzDYrjYhngcRq6uydoVNVv1y9xPc9AW+JjWSindPY5u1LRvMsBdmElV7pmu
	1xqqsv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0l-00000000LCd-1CPh;
	Tue, 25 Feb 2025 16:42:23 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwJW-0000000Hag7-1AUQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D75C26126B;
	Tue, 25 Feb 2025 14:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19583C4CEDD;
	Tue, 25 Feb 2025 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740495217;
	bh=iY14Gvj82e3dtVYvilbYGIx6TuQ4PB6uf5B9BB0r2UU=;
	h=From:To:Cc:Subject:Date:From;
	b=gvWWTaLq4syM5rd2Fd9ml817TZ5fEzFxKxwviVS7t34QYF0+QWhOUsLkxVBqB5Kyi
	 nHftrZSghKEPoJoHq/RKqz7w2kIrT2zR7yMhM7V2y6ZkT86jNHQhXLWazJabfVJGQg
	 XILF4edBXbWOTJd7753kD//cE72XaSAZ7ku6PZpu6BcGl9XzBKfwOALxMWXscVvhYw
	 RP6G1Ts0GV4Ip/7b7t6zz79iwzBan5/4EEwJB/TAphIIuuRjLY2sY4hYidRk/eVjp6
	 gn0Vn9KJDgb65qytfjoeg1P+UuCqIrFI4zINl5ZLVdM5xZ+MdlLLz/hUIqiqGcH6Rf
	 KRYjOnHoveFew==
From: Arnd Bergmann <arnd@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe unused
Date: Tue, 25 Feb 2025 15:53:26 +0100
Message-Id: <20250225145332.1116557-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

When compile tested with W=1 on x86_64 with driver as built-in:

  stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]

Ideally this would be referenced from the platform_driver, but since
the compatible string is already matched by the mfd driver for its
parent device, that would break probing.

In this case, the of_device_id table just serves as a module alias
for loading the driver, while the device itself is probed using
the platform device name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/lkml/20240403080702.3509288-8-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/stmpe-ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index a94a1997f96b..3900aa2e3a90 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -366,7 +366,7 @@ static struct platform_driver stmpe_ts_driver = {
 };
 module_platform_driver(stmpe_ts_driver);
 
-static const struct of_device_id stmpe_ts_ids[] = {
+static const struct of_device_id stmpe_ts_ids[] __maybe_unused = {
 	{ .compatible = "st,stmpe-ts", },
 	{ },
 };
-- 
2.39.5


