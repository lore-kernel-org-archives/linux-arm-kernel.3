Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08C6105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5AwS+cqy4cAKKPRWlRgkDDFxDwgSl6qxYrDkjeel6k=; b=tu27n353jLbCWlGuiV4Ox9MDiQ
	u8QLgwX2j3C1E/LCAk9mfZPayQjgTx+sG5yUhikNanvHdnr6I52Hx8psL4zr5Y++AYRI2ya065cJf
	zJa50UNyZ6jKSp0VIXjzMzYtq/XVNCZFlyBp72HYaH+eBZNhHTymUTMFvaSu3YV9ksVs/l5hDPzHl
	iIVi+YwTQ0LdZhMRlo0TftCn3aQC+Z718iMCll/oc8zINzD723t7ooX6BAMSwdCUtz3yKZExi1ZDi
	VCwdHk2Kg9/b9KrxXr06roqbrcUylhWTiTrCjtO678Oe2t6vuILjb8HMDPApA9ucqdTchFdfTyA0L
	Uzt4BGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCg-00000001fnX-25bL;
	Sat, 14 Mar 2026 09:22:38 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCa-00000001fkS-3YUR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:22:34 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-38a3066b68bso27631071fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 02:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773480151; x=1774084951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5AwS+cqy4cAKKPRWlRgkDDFxDwgSl6qxYrDkjeel6k=;
        b=kQifRJ29BkLWtxmAQBqSE1Y/kqu6OcHymO+JDlfWe6BgHOGI5pgXhjAaOin0LPTnGM
         fnodRqyVdoj/kvXCIwRgmcJ4zqDBAkmfl01zb6AAkO9mCKb45Ds+d8cuhGkibRDirj11
         kk3mIPnR/77dezfvxws317qv7JiClmYLAFaoUHNsd095kRzBfbDKRO7JFJMplCPvzdAf
         +9Iv5uU1HpUXf43pzrkzYT3yyoPPw5PMGLJAFNUHUVjSwTt8r5MpKgBLkhcpmJU40c3Y
         7zeT9a+ibZ+uwl79gUJKC1lYoPKhxLPNCkpPLyUin29czMz6/p5txWcXMUPsyL7bgyQV
         64yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773480151; x=1774084951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O5AwS+cqy4cAKKPRWlRgkDDFxDwgSl6qxYrDkjeel6k=;
        b=lYEe521mULt+yWNXbVDHVRplbPhhruPmIME0dlxCM4ZTEYjzeOLQtrjyYvC0eFCKT5
         6zpWW/S8lki+yEEwOFQet+qtCXhlLfHCA+7NkTTSd09ahBXUhJaIyE7Qf9oAubogdxZw
         fcDQLa4GikNqVjhb7eRKw1z+n88I6eUhB9JjupjClg4Tyo+MBZWN5nVs9XAMqCl6F5l1
         wgkf6jGdWaI5tUS0KzyP7eyXTNb9P7TIwx7aDAmzvjD2aQNEtyvkQ6Juk8nu+uAUU5Rd
         P5YixsNDqGIgpL1DseVS7QDl/g9t/5da+a+mEDiY9jVEWRuz3cJXkbgbLcbYNb1mStbx
         I9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwJI2jckaRrt4K/v7ZFcBfn/lVaU3ckuL44VBV4Q53oNjx8V6eZtltxPvKJw0fL5utGNpTmoQ6NsUELe0DiOCO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzinrjfr6A8kF06+6cyYHuIjOuRKs2UW5ZDSEtUVvQHkcx2tX/K
	fB4ncddgW/WCPOPGmbPguzhQOlu57aBZX6qQXYcpzBWKfpGnRnDbsXKJ
X-Gm-Gg: ATEYQzwqz6p9uYar8vlJLHNAryuOJzGfgPO3b/IqdehfjIIAHzlXm1rgN5ljnm2Uf5y
	9HsyaIWWr8eHFT5/nqiXL2fAagN0ky9lcdCFQwgInqLj4s8bnxAINk9KCsqUR63hLpLNiSEeocD
	OXa8tuPfghxOcOewyMJQa+BrnBidoM9ntT5IUQiN7pM8XTFGu0+u9U9kq4rwangQS3Nhh/VifLA
	I+ClUiOG5kSppGkibkkG0uzWrEPWEhuY3IC7MtqRSrZeNBd+hop3CXvE8T65jFjOZJlMJsdY28e
	QFovuZJWQoPlPQgIt3BtJoGwpwqASGwIOLuJWjGLwuWr/I2Ts/fgJhNHFxAsEh1OhwJHaIde2gh
	ZVpeZap0mtpc/ExmSFz9N1IVEmTocDnvnlIi+8dqvyAzxAqV2hh4y/V2BUrX9aMydvakzVIz0a5
	qZTsBhZz2bEL4VXkZms3EjI7U90+1i2mi3I+FXpgZdk8cXyiu6OX00Jx+JKkrHRWLxmB0Y
X-Received: by 2002:a05:651c:418a:b0:385:dde5:1bf3 with SMTP id 38308e7fff4ca-38a896663damr17085931fa.6.1773480150436;
        Sat, 14 Mar 2026 02:22:30 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm18454261fa.22.2026.03.14.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:22:28 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 14 Mar 2026 10:22:42 +0100
Subject: [PATCH v8 3/5] i2c: davinci: calculate bus freq from Hz instead of
 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-i2c-mux-v8-3-fb1738a4df0a@gmail.com>
References: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
In-Reply-To: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=vsSIa0c3XvGrZdSaP0ssvqDlYgrE1wL3DrKCmY5NXO8=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBptSj56Xwy+MgHCIG34d4tFjurt5gk+F9pQ2pq5
 kqyoxNp6EyJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCabUo+QAKCRCIgE5vWV1S
 MlIZEACBCgO7bJ+4AS8gst3qBeg8NEVHmuvcetgmLS99GSwqTUu6+IVEU4oACsNsnQ2p0bIIW+A
 iNQ9BinXfoc3df0p3yh50lqq6hJUyLKwQCXxE9HDJ1wQxZtxXGIvKg/YcZ8Fz2B57uY/z4voHoe
 wt1HxuP7qLxrJp2+HaG7nTMJwrLC8nyaTmLYYt+oqykesf33FWZcHY2+tfcvah/L5LctfYoeoeC
 1dOdlRvTyvPHlgWlBvvZt9OAGXfcRUw4vJTnR8Y7jK+2UeUq2Z/BYIm872D223apEPEv2c+Tg6E
 oQJ6srMBoGvGPgq6QKHkFlFP7XLa1cfbFFXI0Rk1GnIJDSYXUfy2dThHQzStZ41eUTXhJJVD3Do
 hPWsraBXohDkNeqeTFRup3Ef32gAuYztho6eUGY4PcgjOpHQd3FbboGbdRQMOlFPqIizCclzhvK
 bMikaZXvlGYxhiKNN5Fh5mQ3DjKXUoqTOJ20X3ijEcLXkGIluBsGY3tpaw6Zz+EZgfJzjj2HitY
 kZ9YbYaCi6Xt9cVQMZYD5lSKq0F0eLcEPEGe6fUohMUUF0m8LW0j4b0OjFUzWTnsX2XS5qPN2fR
 eFc6J+ar9pi3DLOX7IdyQwZwdmocTmdWFLa3AKf5Z18M9lAI4xjqBm6oria/hQWQSvqLEl1xtK1
 ACUE4pJ/Vltr3QQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_022232_918732_1F14714D 
X-CRM114-Status: GOOD (  19.37  )
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

The bus frequency is unnecessarily converted between Hz and kHz in
several places.
This is probably an old legacy from the old times (pre-devicetrees)
when the davinci_i2c_platform_data took the bus_freq in kHz.

Stick to Hz.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index a773ba082321..549fb22cdf4f 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
-
 struct davinci_i2c_dev {
 	struct device           *dev;
 	void __iomem		*base;
@@ -134,8 +132,8 @@ struct davinci_i2c_dev {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
-	/* standard bus frequency (kHz) */
-	unsigned int		bus_freq;
+	/* standard bus frequency */
+	unsigned int		bus_freq_hz;
 	/* Chip has a ICPFUNC register */
 	bool			has_pfunc;
 };
@@ -209,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
+	clk = (input_clock / (psc + 1)) / (dev->bus_freq_hz);
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
+	if (input_clock / (psc + 1) / clk > dev->bus_freq_hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq > 100)
+	if (bus_freq_hz > I2C_MAX_STANDARD_MODE_FREQ)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -242,7 +240,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKH_REG, clkh);
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKL_REG, clkl);
 
-	dev_dbg(dev->dev, "input_clock = %d, CLK = %d\n", input_clock, clk);
+	dev_dbg(dev->dev, "input_clock = %u, CLK = %u\n", input_clock, clk);
 }
 
 /*
@@ -269,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -760,9 +758,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq_hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.53.0


