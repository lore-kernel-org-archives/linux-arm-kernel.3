Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1E8FC6171
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 05:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P3Von/oqR6tF4sweOsQdB8oflDGVDpq56CSH4LwQR/I=; b=4lZfGaLE4secFmTd9JEyxdflEY
	Vd+mVI8D5NPJ7det7Gst+0ph0vtBozJrlBNJ0JrPCriEwnbSjZwuAivokEKkbnWUHHqbWvCRVgUOk
	FMTzwlo2AU4PdT9yGnTF8loqVJ6VkNNE/mVFYqTijwnH7o1YsTk6aTq+UggU1njXwFMnukPsMKxyj
	8blgzWxvXQt5S0+7NQo9/uaOh5WXR43kzZxHDmx1yXnJVfxkD/a2s9hhrSruW5pC6Zmr4kQkJetlI
	CO5jNCTv5owF7J+kcqgTOKI/odlDJOGWbgvdzEC39c+v6vzEKWWY085k4YnMVfPwI5e3jAbV/uI1o
	m1sKx40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbu8m-00000008zlU-1lXc;
	Sat, 03 Jan 2026 05:25:28 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbu8h-00000008zkQ-1ij1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 05:25:25 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7b75e366866so5426543b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 21:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767417922; x=1768022722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3Von/oqR6tF4sweOsQdB8oflDGVDpq56CSH4LwQR/I=;
        b=VkOCGRpuzPwhc1GWnGvLKewAXIPQBAbIE4DNiY91gwPhTpMcKeuUpIzJkPKTf58CZ7
         74lfGKGz1BNU4rAA0YNLkSHzEcVsswunRBm8mjTunHfsKFVKTc5jtKEikQzyHYvK2pRz
         gnj8+Nz0Q+qiBiAJ0u0tX3aNfjAqfAuMTdEs7qX6jfu4t3YJbRl5rmDsAnuhc8daVxsU
         XJQQAnqlHuHqNW6t1HDFMuRs2GNsKUV41oFAp6iFWQeaHue9ETKyMLpphySXD1GjWV6S
         x76DTUNgsOnzxpLUzg7d4l81M9Ab386ufOgsxEeWrpROw41X5isKfbdmz2qkiWcNQ+Sp
         NzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767417922; x=1768022722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3Von/oqR6tF4sweOsQdB8oflDGVDpq56CSH4LwQR/I=;
        b=lHmsrO5r8e/Eeat7XyEGxDxaalv4n8/a7lB/Xwk8uW4WXkA9O50d7ga5nA1tkIiFfr
         jk4mzVyaGdIeIltY4hmOKOSDj6egXFidPpdLMM1oOw8yJShtFYJhBQJaYsa9FkoEORRZ
         6K6cOHthrfJOeD1N4OsqLpzyuMG63LYY0Pr94DtYBuulJu8cvupxFb9lfBD0Oh+lWj44
         0sQVMeokcajdknFvzIhxKX1HqbvKODjPvKzaaeDV9p+HHMXwnVo4lpJI+LUw+ENSX7/G
         0xRlwflZXrsSgXX/ZSdWD3dprEHderMuLQrUDkgXcRXX7DrJJNLc3knKe2ZHTVUEE6vW
         UQ5w==
X-Forwarded-Encrypted: i=1; AJvYcCUk4afE09V6B7X3tUsjYvrhl6v9xkDy6GC9/ZxwXBAmIOPs2sZ3+qBysN5H2s49pn7IqhysgWjArWV4240LNn4M@lists.infradead.org
X-Gm-Message-State: AOJu0YwUOzjz9i7ChVMWc80M0xd0AzDL1htuMiiIdHbWcrYl1c7erTAx
	QEXjQhqOHPw/wmMpSCRRlL3H3xYRbWD0GjvQMFiMKAKnLdL5RYDGIGBRjuzSNA==
X-Gm-Gg: AY/fxX60EwaBhBYXYnpF2DnXjzib8RxmH9A5YEBNjbQtXnoVwxcxoOgTGQspA8kDho2
	JJ3uPck+HmlD7AG4Shm4TYvc10PU5H/90CC1xS36VGii3TV+WFqadivIp0X6w4XFcQZK2nU25Pn
	NsCFdxfOVjbfikiXa5RjBq0myxZQKhpIiAgff671nehD18DOFvfmH49Ks2hg1mnravADOXeufad
	zS88eLCO+7JhX0nITSYgDLJIUGXL1TawBvNPH66EKOQBQjkf5dOiLyYWsDu4/CQ73j7m/CYmkVC
	Wx5EU1JuGeNdR2ADNGQUR0LdG9JPWEZeOkH259cG3pGhWaeTIFhLRczLne37W4r5JhpRgAQVmk7
	0rc0JmbqccV9WWfQPDwYIVZT4eOF0N1ZtCAWmyH3xdw8x6x98ZYtEECYb3hBHzEbD2PGvrQt3Jq
	zJOr/yeQ==
X-Google-Smtp-Source: AGHT+IGXYc8+FvRJ1M0wgH9j9p6V5dVha9j+Kma2Qez7gSUK8elkPSRSvbOR59FPXYmmBJmR/5NC/A==
X-Received: by 2002:a05:6a00:1f06:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ff64ed14d4mr37036813b3a.14.1767417922373;
        Fri, 02 Jan 2026 21:25:22 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f258sm41658653b3a.47.2026.01.02.21.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:25:21 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	David Wu <david.wu@rock-chips.com>
Subject: [PATCH v1] i2c: rk3x: Add support for SCL output enable debounce
Date: Sat,  3 Jan 2026 10:55:04 +0530
Message-ID: <20260103052506.6743-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_212523_505319_336A465A 
X-CRM114-Status: GOOD (  16.69  )
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

From: David Wu <david.wu@rock-chips.com>

As per the RK3399 and RK3588 datasheets Rockchip I2C controllers feature
a SCL_OE_DB register (0x24). This register is used to configure the
debounce time for the SCL output enable signal, which helps prevent
glitches and ensures timing compliance during bus handover or slave clock
stretching.

Introduce a 'has_scl_oe_debounce' flag to rk3x_i2c_soc_data to
distinguish between hardware versions. For supported SoCs, calculate
the debounce counter dynamically based on the current clock rate
and program it during divider adaptation.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: David Wu <david.wu@rock-chips.com>
---
v1: This change have been pulled from linux-radxa kernel.
---
 drivers/i2c/busses/i2c-rk3x.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index d4e9196445c0..31d7d6487613 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -35,6 +35,7 @@
 #define REG_IEN        0x18 /* interrupt enable */
 #define REG_IPD        0x1c /* interrupt pending */
 #define REG_FCNT       0x20 /* finished count */
+#define REG_SCL_OE_DB  0x24 /* Slave hold scl debounce */
 
 /* Data buffer offsets */
 #define TXBUFFER_BASE 0x100
@@ -164,6 +165,7 @@ enum rk3x_i2c_state {
  * @calc_timings: Callback function for i2c timing information calculated
  */
 struct rk3x_i2c_soc_data {
+	bool has_scl_oe_debounce;
 	int grf_offset;
 	int (*calc_timings)(unsigned long, struct i2c_timings *,
 			    struct rk3x_i2c_calced_timings *);
@@ -875,6 +877,7 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 {
 	struct i2c_timings *t = &i2c->t;
 	struct rk3x_i2c_calced_timings calc;
+	unsigned long period, time_hold = (WAIT_TIMEOUT / 2) * 1000000;
 	u64 t_low_ns, t_high_ns;
 	unsigned long flags;
 	u32 val;
@@ -892,6 +895,13 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 	i2c_writel(i2c, val, REG_CON);
 	i2c_writel(i2c, (calc.div_high << 16) | (calc.div_low & 0xffff),
 		   REG_CLKDIV);
+
+	if (i2c->soc_data->has_scl_oe_debounce) {
+		period = DIV_ROUND_UP(1000000000, clk_rate);
+		val = DIV_ROUND_UP(time_hold, period);
+		i2c_writel(i2c, val, REG_SCL_OE_DB);
+	}
+
 	spin_unlock_irqrestore(&i2c->lock, flags);
 
 	clk_disable(i2c->pclk);
@@ -1198,6 +1208,7 @@ static const struct rk3x_i2c_soc_data rk3288_soc_data = {
 static const struct rk3x_i2c_soc_data rk3399_soc_data = {
 	.grf_offset = -1,
 	.calc_timings = rk3x_i2c_v1_calc_timings,
+	.has_scl_oe_debounce = true,
 };
 
 static const struct of_device_id rk3x_i2c_match[] = {

base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
-- 
2.50.1


