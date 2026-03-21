Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D480B109446B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RscDJZRuCLSR0EdEAqplFbrptB0CGIjOssvNhZ5r5oU=; b=XVPBdw7v1db6Q6NuYBwXVlgCb3
	38ZYVQoINviqrMgt9FYws+9is3VuzuDPKPKvZ5EYP7pLTd/p90672WJI0JJrkcS8VzR/XezyVq8HO
	oQzgQoSmFr+/wogKMaLMuD+UclUbDOSpyemK+AjbveIfjq07VEHAMrT0VOfgspp6WglvykAyox2pj
	CzAGPBN2MSuOhfgYzfV/rUmUGsHkrNiCpGTZSxB04IWjE26ltZBTC7V7Pq19EsRPXja4VVWOV+8I7
	wgkqxIXCXOTM2qqdjuBquO2u7faPxraZ+lCF6CoEi6Kky7Z3RL+DQdSORIlPl7Ad/jvo3fA3TSUZ1
	2jTtGZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tvz-0000000ENHO-1NLJ;
	Sat, 21 Mar 2026 10:51:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tvw-0000000ENGZ-1wj2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 10:51:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ab46931cf1so31907175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 03:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774090315; x=1774695115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RscDJZRuCLSR0EdEAqplFbrptB0CGIjOssvNhZ5r5oU=;
        b=RO81q/YknmNy3yjJQJ+lkUO3L/dTVR42iYmvB+iwBJ9Awx2de50Uroz1JeMf6JtPJy
         qiib/KBo8LWmYziMXaE8GqjCgceecWzXSCQ3/Q+qtB10h1a6u1xJrSwAB3Kw71t9/UC1
         jfXMyiD/dJ/JddbNszJ+Ca2now+pR/UbCKir9dlXZlBVvuVxLq7qI6i7Eqk7vG7nkXDo
         mPM2bMHKR13awHG+veWebLdSspX7TBUeQ+MQobWtJivvXAYc1sPukBfT04z/xkCP2rWA
         46su88fXY/yJqOdZb4SGi4wxVDoq4AMXSlxdONbRAJL+OmJBbDe8PZKJFtXZyCZnjCGc
         ebOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774090315; x=1774695115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RscDJZRuCLSR0EdEAqplFbrptB0CGIjOssvNhZ5r5oU=;
        b=JBb1qqnsZyeDYQgpZEZPBdMP6wgFbypC1kfPVxRbXCdZZJzP/lFtukuVnx6kXp0g49
         VZNPF6L1HqiM98PN3kzsZGhLQyEl7QDUq2YkT8xtYN7A7DdA90bSausoeWNY7cDt+ia6
         CO0ttRtf+wIvZjDcTAYu34/1mKayxY1bcIaentCi7eXJt4qRmsJiWG9+BmrohjCHHVBv
         UpHS6TVbgxKAF7DRHvn3/wIZTGgoPf3DR0DpWO/ouq1ZYNRs4CkC+6qSsUa0JPtUfnj9
         AkRgY7Ga5qxEXLg/XY4CJ/J6lIOO+5nZCTr5gbCYkRNW5ehxWbp42Tl6K2Hd6r6+dtcA
         K7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUZOeOQZ0f3XA1Qj2EHoj4ICoDFvtzfwco0TbZcqIoJeHeAY4MrIqkH2GDA3phlUyQ5n/aEmDHiwB349XyZJ0y8@lists.infradead.org
X-Gm-Message-State: AOJu0YwrMCNwcQXlvMP/OeGiiHFOGmY0XqjH91SdxXW5tMSKPozre95z
	sfli+UxjKAo6wtamA2jfoJN4Q1Ax0LURtodJsKcWhg/18o5yLPHBBHks
X-Gm-Gg: ATEYQzxri8irL0gRXyD7sGPmhxM5R9JKBGKJ3n6GauNwDJx70ZtpnRJoUwrB1iu1pSD
	632N054ays/p7XhaXKINRXpcJH6TNJG3eZQPY6K1zesBtFr6c1aDj/Q9iIWgsmBlxwiy+sZ0Cnn
	oN3nQdRVd4oWlmZKZPFVY4BNrHagJd0RpY0561WCF58w6clwQ8aQddFKyPUXWvUCey/UUZjjWpn
	idBbiFf4ArdLeG414KpMONNFeOUTZywedfSRQUwX+D0PeKp4E1DDJuSEFY0YfnHk6BGmqVFAR0J
	n1nQJnZoO4OY3qXCOUIfKcFAOqBGYxVAOfTBw8BHN9jykVBGuD/WmnesDQhPVCe1n2f4j3HITgc
	VS33ghYlktp3t0lW7FiqRPBbYzXcrgruRdBHhjQqyBkI/gvlUNMvOAyQkc+Pdu/SnbH+sZLMU8e
	nU5P0Crf17DPpRs0/tShT0
X-Received: by 2002:a17:903:1a2e:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b077165dabmr82219915ad.10.1774090315176;
        Sat, 21 Mar 2026 03:51:55 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08365a62bsm66752865ad.46.2026.03.21.03.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:51:54 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	David Wu <david.wu@rock-chips.com>
Subject: [PATCH v2] i2c: rk3x: add support for SCL OE debounce and slave hold recovery
Date: Sat, 21 Mar 2026 16:21:43 +0530
Message-ID: <20260321105146.7419-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_035156_515084_9CA8450D 
X-CRM114-Status: GOOD (  22.72  )
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

As per the RK3399 and RK35xx datasheet, Rockchip I2C controllers
feature a SCL_OE_DB register (0x24). This register is used to
configure the debounce time for the SCL output enable signal,
which helps prevent glitches and ensures timing compliance during bus
handover or slave clock stretching.

Introduce a 'has_scl_oe_debounce' flag to rk3x_i2c_soc_data to
distinguish between hardware versions. For supported SoCs, calculate
the debounce counter dynamically based on the current clock rate
and program it during divider adaptation.

Additionally:
- Implement detection for the REG_INT_SLV_HDSCL (Slave Hold SCL)
  interrupt bit during transfer timeouts.
- Capture the Interrupt Pending (IPD) register state before clearing
  interrupts during a timeout to check for the slave hold condition.
- Re-apply the clock dividers via rk3x_i2c_adapt_div() if a slave
  hold is detected on supported SoCs to attempt bus recovery.

Signed-off-by: David Wu <david.wu@rock-chips.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: https://lore.kernel.org/all/20260103052506.6743-1-linux.amoon@gmail.com/
Changes:
v2: Aded the to detect REG_INT_SLV_HDSCL interrupt timeout
    it was part of origmal commit below.
    [1] https://github.com/radxa/kernel/commit/006c0b1e7710d471119a69d6bd56917a15a85a0b
Fix the order of SoB,
Fix the doc warning reporteed by kernel test robot
---
 drivers/i2c/busses/i2c-rk3x.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index fcede9f6ed54..57ef31cd96eb 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -36,6 +36,7 @@
 #define REG_IEN        0x18 /* interrupt enable */
 #define REG_IPD        0x1c /* interrupt pending */
 #define REG_FCNT       0x20 /* finished count */
+#define REG_SCL_OE_DB  0x24 /* Slave hold scl debounce */
 
 /* Data buffer offsets */
 #define TXBUFFER_BASE 0x100
@@ -74,6 +75,7 @@ enum {
 #define REG_INT_START     BIT(4) /* START condition generated */
 #define REG_INT_STOP      BIT(5) /* STOP condition generated */
 #define REG_INT_NAKRCV    BIT(6) /* NACK received */
+#define REG_INT_SLV_HDSCL BIT(7) /* slave hold scl */
 #define REG_INT_ALL       0x7f
 
 /* Constants */
@@ -161,10 +163,12 @@ enum rk3x_i2c_state {
 
 /**
  * struct rk3x_i2c_soc_data - SOC-specific data
+ * @has_scl_oe_debounce: Support for slave hold SCL debounce
  * @grf_offset: offset inside the grf regmap for setting the i2c type
  * @calc_timings: Callback function for i2c timing information calculated
  */
 struct rk3x_i2c_soc_data {
+	bool has_scl_oe_debounce;
 	int grf_offset;
 	int (*calc_timings)(unsigned long, struct i2c_timings *,
 			    struct rk3x_i2c_calced_timings *);
@@ -876,6 +880,7 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 {
 	struct i2c_timings *t = &i2c->t;
 	struct rk3x_i2c_calced_timings calc;
+	unsigned long period, time_hold = (WAIT_TIMEOUT / 2) * 1000000;
 	u64 t_low_ns, t_high_ns;
 	unsigned long flags;
 	u32 val;
@@ -893,6 +898,13 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
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
@@ -1063,6 +1075,7 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 	unsigned long flags;
 	long time_left;
 	u32 val;
+	u32 ipd = 0; /* To store interrupt pending status for timeout analysis */
 	int ret = 0;
 	int i;
 
@@ -1107,6 +1120,9 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 		spin_lock_irqsave(&i2c->lock, flags);
 
 		if (time_left == 0) {
+			/* Read IPD before clearing to check for Slave Hold SCL */
+			ipd = i2c_readl(i2c, REG_IPD);
+
 			/* Force a STOP condition without interrupt */
 			i2c_writel(i2c, 0, REG_IEN);
 			val = i2c_readl(i2c, REG_CON) & REG_CON_TUNING_MASK;
@@ -1125,6 +1141,17 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 		}
 	}
 
+	/*
+	 * If a timeout occurred and the slave is holding SCL,
+	 * re-apply the timings/dividers to attempt recovery.
+	 */
+	if (ret == -ETIMEDOUT && i2c->soc_data->has_scl_oe_debounce) {
+		if (ipd & REG_INT_SLV_HDSCL) {
+			dev_err(i2c->dev, "SCL hold by slave detected, resetting timings.\n");
+			rk3x_i2c_adapt_div(i2c, clk_get_rate(i2c->clk));
+		}
+	}
+
 	clk_disable(i2c->pclk);
 	clk_disable(i2c->clk);
 
@@ -1198,6 +1225,7 @@ static const struct rk3x_i2c_soc_data rk3288_soc_data = {
 static const struct rk3x_i2c_soc_data rk3399_soc_data = {
 	.grf_offset = -1,
 	.calc_timings = rk3x_i2c_v1_calc_timings,
+	.has_scl_oe_debounce = true,
 };
 
 static const struct of_device_id rk3x_i2c_match[] = {

base-commit: a0c83177734ab98623795e1ba2cf4b72c23de5e7
-- 
2.50.1


