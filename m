Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD51D39426
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz1zlRSiKHlMJZnEUctS28g6FTYx8BEHRWatZco+c68=; b=MntN/oasTg1t2HaHMsUKDkwJBC
	Iw4BrBu2lck2UTMvT3pHSaCjZmw1JMSinqD/YdfSHeFcqd7TYDso93717H1QITbm47v/7QWPpoMr8
	AV1nF8UCK6BJ95SBUbcerourkOFxKqAYGucDyZ6iPj+OtuSeR3IPIKQHC0EmudbVtQIjKMDKkneH/
	AGBh2JTFymU0vU1i5KWdvgW49r1cuzqm3wTIgkRX29dc9t/G0nKl1tADTzCRG2YNNnBR5jf8hhro2
	Q4AW7MpPPPdEFwCL45yuaWlZn+6w9vQBDuDzBKh+hQrsYAqNmq1rOQcJNGGLW6zIM0vLOzaWw+Bkv
	ZcZ97txw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Itf-00000000JUE-10JK;
	Thu, 02 Apr 2026 14:19:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ite-00000000JTm-0UUw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zz1zlRSiKHlMJZnEUctS28g6FTYx8BEHRWatZco+c68=; b=SsmGhf2Bx2LNKcszG+er22O5W3
	GBkbtpVaSh+GAfA+Ma2411OhLY4px3mANpoUOZU9FHuLhZg6KtkdF0eUhbVJXXF+/Ks/8xYTU5WM5
	joTfzFunY5+fPU9bWr4d54Iip8f95if9v2+2s5QkWja+hRBY0T4v/dLm9856kiIKOC8RZ5sLNPwJG
	eaJUxN1fm0AJ/GtrhByVmUNL57bb3osHC/M/F0SWpd5EWUzngm8KAEIZ1OsRe1qWHnb9lVLjUq7Lk
	2mKe4wEWL4+HdwnB0kwGzy4hEs2QIZllx3z3hwl/JV2W5Hf9hn+WbN5Alax/URaF3CATKLPOD8M/G
	id+2vg8Q==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Itb-00000002ey2-0hXq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:19:45 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35c1a131946so1269416a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775139581; x=1775744381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz1zlRSiKHlMJZnEUctS28g6FTYx8BEHRWatZco+c68=;
        b=OfRICO8KxDsZXxJTPAbSE0eHGK4iSe2sHN8hBIcDUykyzF4ZKvZUUO6x/CpM3nSFkn
         sDqnDuZMX2mRxjEyIXSw0fDm/djZ4kI84vMKledUWJ27mW+MIDmK74QlpIb23hRBT6mz
         7utP/PGbT+jx5dCXgXX+SNv0S86lNp3yr/FX1PxinNZYNodJaMQ7uFSw+r6KOPSPWbSm
         pMG+dUAJbwDlub/3UbtI8/jK5KDpQCxrearRyF1ZafdxZiufJT3l64CW3uKBASdi4RdW
         ggsonAcRwoZDsN35TbaE08SVQqRJoV66lt0mhyPx1tbftCCtKTOdSlZSiw1J8w9HDwXT
         wfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139581; x=1775744381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zz1zlRSiKHlMJZnEUctS28g6FTYx8BEHRWatZco+c68=;
        b=mVpuyitrJ512lCDLvZxUX6bH+o+1SZD/WNVOUjdPeZXd9HJYDLbnijpnWCCkDVJ4E2
         QLQwdDH8kjsiWToqBwzMT7PlaosGovPBWcszcvmp8MArCpIO8PlP0p0mI3Ir15OioPqg
         +QJ/UBuEO5l34DBMzuI3LYT+yyc/bmunESF+I1p8chd0W7x/8pTcT3UMPvIUjVRxuCq9
         ZXidiksj2aHFxXh0cMtZgqKQ97gTHFgkB5BMTSPWOZjMYOF8NlwPWrwWAfBI3i3mIz9B
         98r5klBwW6ebXx/CLmNd0QUmBD/beiowup3IsPknVVA6cU0HapdqsgbG3z9HB1/EZiw1
         ErAg==
X-Forwarded-Encrypted: i=1; AJvYcCWJjUYFPAkn3TQoRpbpiHvVHXuVDRJ6Ib7zfY1D0MWNkkrCkyh7U1e/dJyQ6Ev/vNLQejiR4kNi48NesRJHhAHD@lists.infradead.org
X-Gm-Message-State: AOJu0YxAtfD0RQkFWQOIHjC71+XAP/3j7y4O50b8wGX3TaJpWM7OzX2T
	/vuP92kGJi1pvSVLZFj/AV1gWdCMnQkYwg3gF2HKERxOD7/jH82w76T6
X-Gm-Gg: AeBDievEmmxGDF1qhyR2wZQBOYzNlc2zCcTGr4vCODWroUx8mUI6lVhshofUDAcLtH+
	+6m5TWfBN0Vd9Y54CYIDd65NyztchtczmrkFJ57GsxMHwEppaxAy29L2inrPfxWVgsA2YM+iUaW
	KWxEeeY60tobecs8hVKxNXXB/QjGoovVGac+zsq8c8eAeam1RIYMiiBrJ4rx3DhYYk0k0LKMnOn
	5TbLL87uy7FI0KTTfqzS/gRSkiW55KIAchYaK9qvyd5MzhiTsSVJLrQZNmWVqDIXlFHQvedFhmY
	A2GfIfqkbHPx6lVoHfL2tWuMdBw97tyfUmsS0izWbd6z3iQOxL2NvVA085pBwts3/hwl02Y4J5Z
	d+lPTdqbKvSzdzFRrXl+/5NMEMrb/qtDglwKUxwLrQcMSIH9AKOYCI9kfI4P8DUMYVpF8wj2hP1
	lnpEErwFCm09x689uH1r2q
X-Received: by 2002:a17:90b:314b:b0:35a:2ed:9b6f with SMTP id 98e67ed59e1d1-35dd65b05e0mr2598226a91.0.1775139581041;
        Thu, 02 Apr 2026 07:19:41 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9377b7sm10959123a91.10.2026.04.02.07.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:19:40 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 2/2] i2c: rk3x: Fix deadlock by splitting rk3x_i2c_adapt_div into locked/unlocked variants
Date: Thu,  2 Apr 2026 19:49:23 +0530
Message-ID: <20260402141927.7216-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260402141927.7216-1-linux.amoon@gmail.com>
References: <20260402141927.7216-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_151943_370500_272F48B3 
X-CRM114-Status: GOOD (  13.95  )
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

Introduce __rk3x_i2c_adapt_div() function as a locked-only helper to
handle core timing calculations and register updates. This restructuring
allows these operations to be safely called from contexts where i2c->lock
is already held—such as during error recovery in rk3x_i2c_xfer_common
avoiding recursive locking or deadlocks.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: new patch to avoid deadlock.
---
 drivers/i2c/busses/i2c-rk3x.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 06a77780cf82..2556a3d8b2a1 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -880,22 +880,18 @@ static int rk3x_i2c_v1_calc_timings(unsigned long clk_rate,
 	return ret;
 }
 
-static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
+static void __rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 {
 	struct i2c_timings *t = &i2c->t;
 	struct rk3x_i2c_calced_timings calc;
 	unsigned long period, time_hold = (WAIT_TIMEOUT / 2) * 1000000;
 	u64 t_low_ns, t_high_ns;
-	unsigned long flags;
 	u32 val;
 	int ret;
 
 	ret = i2c->soc_data->calc_timings(clk_rate, t, &calc);
 	WARN_ONCE(ret != 0, "Could not reach SCL freq %u", t->bus_freq_hz);
 
-	clk_enable(i2c->pclk);
-
-	spin_lock_irqsave(&i2c->lock, flags);
 	val = i2c_readl(i2c, REG_CON);
 	val &= ~REG_CON_TUNING_MASK;
 	val |= calc.tuning;
@@ -909,10 +905,6 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 		i2c_writel(i2c, val, REG_SCL_OE_DB);
 	}
 
-	spin_unlock_irqrestore(&i2c->lock, flags);
-
-	clk_disable(i2c->pclk);
-
 	t_low_ns = div_u64(8ULL * HZ_PER_GHZ * (calc.div_low + 1), clk_rate);
 	t_high_ns = div_u64(8ULL * HZ_PER_GHZ * (calc.div_high + 1), clk_rate);
 	dev_dbg(i2c->dev,
@@ -922,6 +914,19 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 		t_low_ns, t_high_ns);
 }
 
+static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
+{
+	unsigned long flags;
+
+	clk_enable(i2c->pclk);
+
+	spin_lock_irqsave(&i2c->lock, flags);
+	__rk3x_i2c_adapt_div(i2c, clk_rate);
+	spin_unlock_irqrestore(&i2c->lock, flags);
+
+	clk_disable(i2c->pclk);
+}
+
 /**
  * rk3x_i2c_clk_notifier_cb - Clock rate change callback
  * @nb:		Pointer to notifier block
@@ -1152,7 +1157,7 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 	if (ret == -ETIMEDOUT && i2c->soc_data->has_scl_oe_debounce) {
 		if (ipd & REG_INT_SLV_HDSCL) {
 			dev_err(i2c->dev, "SCL hold by slave detected, resetting timings.\n");
-			rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
+			__rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
 		}
 	}
 
-- 
2.50.1


