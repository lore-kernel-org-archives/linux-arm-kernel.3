Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA68BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8qLIUHsL4QgH657kTC3Y7xhccUy2MxOta7XG4RiyEQ=; b=HDu8LwqJjZywFSaci/MXyW8jXm
	HNOqrtus/MizVsVLqHc8jq1fkszYOC0i7I2bcceIA+8uAkm+H6q1qFUXC7003IdgMM2oD5QjTsqJR
	d90ySXzdqjpTq/lOjJwRH6Czy3ds2ODUbITyHWBoUBxPL4f5eIEs2xatHDohmsmWLGyTVyuQ27kfp
	EIlXD+lPG/gUIl80l2Vb6poecGTEJ1cBXeaI/OErfl60lfLOdPT/JKZ5vhAK32n/9f/3IRJFmnLue
	MMhUYCq7xF3l1UYS7bjyor15I2DQY6o5EqGNG5xq/isWjMRdO5fM4tTfLhltIRwSDjw+cl2dQwt2G
	Y/hzPwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGi-000000056JX-1cAy;
	Sun, 19 Jul 2026 15:17:28 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGe-000000056Ha-2gpC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:17:25 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-39c62764c7cso25019951fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784474242; x=1785079042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8qLIUHsL4QgH657kTC3Y7xhccUy2MxOta7XG4RiyEQ=;
        b=QeqdL0ix4gmDTeU0gYqJ0SirrwGFkq00sEzmc4maug+AFajUo3N9UczOiZSZuM/srY
         tJtWT2/CRpcf3o17f5FYQ4IAzKeh6ct1x1AOo+d7Bd+IPoi92kFRnwukLGd0yXlnnIML
         /EQBdaCTPd9Sy1h71TSSGaoXT3qMpA4/FmpIGra7vptr+qejXO15rB9GLbznW3rDm6hf
         uaMvC3LxP5qU254uk8hZd+C/rS/QhuQ31wYJgIQw3kcLwV0GVHjLcIPBNkN0N9BYVLzS
         oKpE+gzFfbKuTCfeCjG0bIoB7ktgVxkT0e/JFfZEf8U6vZlGCFTSwSacoS8pZdXCpqvI
         l++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784474242; x=1785079042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8qLIUHsL4QgH657kTC3Y7xhccUy2MxOta7XG4RiyEQ=;
        b=BHr6ewfwx4rKu/LBy+vU6e7n1+vZxxA9N+zN7LtEWAZGuAmLiXmy6hNgH2YU+cP/Yo
         e3K+8BPvEEDaELhvUUX7acJZjolarqj8Jo3AJyVLslDIHKhgOvBiH/9aIiOXyc6QRssR
         jIQfwZGoXA9VivqcsirakKumqUOgF4uZzFLdfcBVYWf8jav1iWJ9SmsphBp0f8gjFBSS
         YD9jpyhMZojB9c2rfFHE9j4Q2ZSvITqzWFmRpg93Dd/qye7jhc6KoEYB4EmxxpXkWr3g
         FxN2GrHm8b7CBXGS2Y56Fkl0HlkAWkCmqtWTk5zkbF2/oULUTKvCdqs9xiegLmoBXDIY
         Z9bg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7AeP28dExt5mtAYqKh8Itb8CVmu/yEnb6yHwKvUUd1p2jDOZvFuuFdcD1PdgTJ0yAT2e0ugY6F//mAxfQozhL@lists.infradead.org
X-Gm-Message-State: AOJu0YzxcAYBZB9CrI/98eLXVxfNu8wczsHAfltr5m34rWDwkWLtqxIp
	V/Z2WFIVBIoly7fHLor7c25J5cOhEawz6lDrTE1zdvmqqRF348grBHn6m84R3jJWTdE=
X-Gm-Gg: AfdE7cle9Q/zo2pnySeLLgoNh0ndtruszd25REHmAZFpcjKJkQi6Rowu61gCf2kadjz
	h+EWAVnTx6rSihus4X88Ce+xDwiN7ffHR3OslLsSBS90HXBN9DTwS84HxHEriwJc3amaPqHll+K
	Plz6rZ0ax/Nou+fwMwdPAdt2c+Qtegkxb1Wq3Y1trUTPGEaA/bUaPQk7ADIzxfKospYjaXlXrlj
	Kzv9GrFwWtTZqbm5n6iFwEWEQOGLlQgfQftOi23mi2fchVftHML/qB3GEriwubvYRvvKOvQD5Ri
	oj8TbeiVqTj+8worhf0VX7iu63pfTIQYGC6gWCDKBEu/FDYig897Lpf4VVeTOY8AeEa02rHQSOA
	AOpgXcAYMFjSfpEoKxhShQSzYZdGK/v9wSqNuRZLZW8+JOMJTrsXRdjAROgpPw6oxB9VMYYKgTf
	VlfJ+r8EZ50BQqTc+szaQjdfXiez60A7SyuJ8nRT/P6wfC2Pg=
X-Received: by 2002:a05:6512:608c:b0:5ae:c2ea:b3f1 with SMTP id 2adb3069b0e04-5b28a1681bdmr2552035e87.10.1784474242005;
        Sun, 19 Jul 2026 08:17:22 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e26e5fsm1835096e87.80.2026.07.19.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:17:20 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 19 Jul 2026 16:59:45 +0200
Subject: [PATCH v12 2/7] i2c: mux: add idle_state property to i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-i2c-mux-v12-2-a5010d623a57@gmail.com>
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
In-Reply-To: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2781;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=y4CWJt16YdZrTCn8rdj1CNouLpjIWr3Jrm21zLmgNMc=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqXOp7WFi6OrXLhmafy952YX+tICQUAvJ64aqCl
 Vj2SS1Nh5qJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalzqewAKCRCIgE5vWV1S
 MkUvEACBhKgPGGuR3qHycC2u24eW23zFyI1Ka1kJ15o928/alNJoCF3E2vkSsJV4VO5HlIYSk41
 zqiZk/1/NYlEorRIdrRZtru7cocnd5lvayoiFDAHbbnDagGn8dATvnwbnNaRS68e/fs2hatNr7p
 V1TC1e4Md6L3gecHbpOafI2p0RCVCi7z0Ashi0+vkc6eNk7up8gDQQ6nq+vHhWw0PGGL3WWqkxx
 vIQCC2JEr+CkU5+srA5H9HXSJIe/L6Vm6cPgiGPv/A77TNNsqhsy4694qp56yMbqNrIUh+H49/G
 zFIZcV+ObnEU8tPDX26wQp7O8+Oh4dpHMEy1L+PdgjcHkZp3bI34jol4oTMYDz5A8QgW0OikWNk
 2GKObd44wxpSQP+ycs/vbJGz4Llwzc/UJqj5fpwmgrgVS1GKgJccx9J+dRo0OR+K2v3jX8eS1yK
 ++ZnzcuP2gDUocLAS0bQBvGXgbesOHGLeZd9ofSaS1VmzPNuJQfEXQBYgi7iCfvwAs2247KZ2MP
 E8KDM1988ewRpD5W7LXCisjddvDw1saTLeyE7lesX1A4UWvar614kDCgua0vf2nZTYdRE/1s2V9
 jAc6Ne0iJa51R8vfiImtgKzfkgBlO7B/S7sDmf1hcTFpLM0aKvGbHSZ8ubUgwi4Nqa1nkqCzRQX
 dLQM/h0YMYzrSKg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_081724_715657_0CF8FF22 
X-CRM114-Status: GOOD (  14.86  )
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

Muxes treat their channels differently when idle.
Let the mux core have this information to make it available for
internal use.

Possible idle states are:
 - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
 - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
 - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
 - <n>: Enable channel n (starting from 0) when idle"

Default value is set to I2C_MUX_IDLE_UNKNOWN.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/i2c-mux.c   |  1 +
 include/linux/i2c-mux.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 681a201c239b..b126ce7338c2 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -247,6 +247,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
+	muxc->idle_state = I2C_MUX_IDLE_UNKNOWN;
 
 	return muxc;
 }
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 1784ac7afb11..a348f81e7a90 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -15,6 +15,10 @@
 
 #include <linux/bitops.h>
 
+#define I2C_MUX_IDLE_AS_IS      (-1)
+#define I2C_MUX_IDLE_DISCONNECT (-2)
+#define I2C_MUX_IDLE_UNKNOWN	(-3)
+
 struct i2c_mux_core {
 	struct i2c_adapter *parent;
 	struct device *dev;
@@ -22,6 +26,18 @@ struct i2c_mux_core {
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
 
+	/*
+	 * The mux state used by the driver when idle.
+	 * Possible idle states are:
+	 *  - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
+	 *  - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
+	 *  - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
+	 *  - <n>: Enable channel n (starting from 0) when idle"
+	 *
+	 * Default value is set to I2C_MUX_IDLE_UNKNOWN.
+	 */
+	int idle_state;
+
 	void *priv;
 
 	int (*select)(struct i2c_mux_core *, u32 chan_id);
@@ -38,6 +54,20 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 				   int (*select)(struct i2c_mux_core *, u32),
 				   int (*deselect)(struct i2c_mux_core *, u32));
 
+/*
+ * Mux drivers may only change idle_state, and may only do so
+ * between allocation and registration of the mux controller.
+ */
+static inline void i2c_mux_set_idle_state(struct i2c_mux_core *muxc, int state)
+{
+	muxc->idle_state = state;
+}
+
+static inline int i2c_mux_idle_state(struct i2c_mux_core *muxc)
+{
+	return muxc->idle_state;
+}
+
 /* flags for i2c_mux_alloc */
 #define I2C_MUX_LOCKED     BIT(0)
 #define I2C_MUX_ARBITRATOR BIT(1)

-- 
2.54.0


