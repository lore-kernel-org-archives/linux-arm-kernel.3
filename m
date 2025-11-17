Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426AACE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=; b=NpiIBUl8wytofo9lTmIHa68Pr+
	u4YP9EW5QKjgimvDwEXr5coq8gfYzp7PfZjdK83KmyLDkdJhkERzF98vEN7e09/jsWWpaSamvDKzK
	eTeDaqKtCDsIeX9SOJ2PmpsaObOGfEXTZsrtoNjYL7TVrZWJYyyeeNL/egLigX4lx1B9z2EyUgiyv
	57bNQsAIQXL0Jrk2gjZCdpdEyWiVf8gj6RfbwM3wA9BsgdHTpvhuoaEgLptCTGBCoohj8QwutFyhQ
	y+QmpwjEaLL3sAQJv6H3lB84G6YtpGl5CjzpWQ18N6tFQ0iPFbI7ZxEV6nYQuB5Eh3+WBy8MGXxqF
	44MQduRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvBE-0000000Fk2A-3j4C;
	Mon, 17 Nov 2025 09:05:48 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvB9-0000000Fjz9-3nZj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:05:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5957753e0efso4314211e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370342; x=1763975142; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=;
        b=UcS1oiQSzw3QQ8kK07gNlfoNK5lAoheiEmTqqdsxmaD2wWky3fyKBgAGDSVfbNVEAh
         d9pGitIO8F4KW3O8B3kRMtr6cE1v9zP3o0ePqNZ6orpLDTbtSXlAgO3nKS+tvA0BnoGz
         KKhwLVgazwHMjBpt9Uy+hs1eC+p0bSvB0D+sYNoLFhqsE4rq6PiODOVotaioIZyQNKaw
         XzSYRCotPVwaRd+MDHuMR60uwpQ6t2iNk7D8la3yEcD+sq2Xp3a4UFu2Uv3f9wBy2z3S
         sAPx8s74NHAHJKPkytTSaBTNvJ1BNmVsJtBqS8PFeDn5QyTHaUhvANux2QRIww8HWcN2
         nIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370342; x=1763975142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=;
        b=FxCdFeXjwmeFFl9Dd6ja8qMIWe4ghFfVlDzBeFPGCewHR3x+5K5oB1p6gJTAjwfQ1O
         8XHML6MsvFU7c5AJQiCETCGr+IXMlx3YhVh/LMALYPnlZ6kztpES0iV7QfFvWmuuTztz
         Hw1GsMeRyxDqONBjsNGqRNxkUupC95tU2iQFIIeeniJx/ovNb59fy0a5zGRKtAzNcrWH
         t31XiM5PDP0uyue0RQ+Uk+sLBhSwMD6VmLqXFCm11tEQ0L4ddx1hAuAAF3IqpoPo/VoQ
         bupUT+3FKxJW8vTGMuh4QmBnno5vDifHJ2MZVLuJAOND6+HGO6clVo+zcEFzm28ZTuhr
         rQZg==
X-Forwarded-Encrypted: i=1; AJvYcCVkPosxU+iT3accAshhv3QMaCTuiA7ow/7Oto9iQnWXKWSZnG0RfGEcEJTgazGGlBbSSa0GiC0DtgihsHRGZo/d@lists.infradead.org
X-Gm-Message-State: AOJu0YwWZcGPx8HeVgBWDlSvuxz/FPaIPPkqs5s8B+lBpvc4TrRQhQyw
	/UYac5isyjJiGEN9S2EVrL6lGKyNwtPxam6ieU/VFbbUhlbAIdhY31nIQskCkm+B
X-Gm-Gg: ASbGnctecYZMJoo8P79VtxulLxF9TWgI9m0DkFJY7QRexRmzb86SvNlW1xecQy+/B62
	gTSym/3jx2+aSAjc54TMZ3BAEywxID+abZkb7TE3tbqnQnfGEe4nlAu0GrgXYI+HXshXfUmC3cL
	FGaoH3wCk500E+Db6/7efRQNaUBvY+qvnvFuZIzvC3LYkv4hoqSCBNIFNA7OVgaACLRYGFhyAsH
	Vif+66mC9pfdwyK1/ODR5OG+Vnq8tSeIcQXUMZdq09RAjzaztgky2p/V7G2kwbf1NF2Hpu5G6dm
	BswD6Jvv1EG/TRTVe+Ozo8UhZzX4o3fi/43QT732BZdPcY86JZlcB3G1wCKMZqjZET8V1uieLLq
	rTC9a+nodmAl5k7VItMVqVIoDW9kj1QdvYP335helwne7YD9pHnMWKlNhkL72Z57A0vnUyOl14+
	fRGGIWctgNCZ1oxX0KtwwgMOR6fK5W3f6r7UIEAycg89BCUouO1Kt9VbQ1
X-Google-Smtp-Source: AGHT+IEOFfa+B0kbKk74AoMNyN2v7HrCUuX9sI7uI2roR28NGM8p+kdspmLaO1sVzSXl6FETBuE3Sw==
X-Received: by 2002:a05:6512:2311:b0:583:903e:b5a4 with SMTP id 2adb3069b0e04-59584214f80mr3460710e87.46.1763370341593;
        Mon, 17 Nov 2025 01:05:41 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:40 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:05:01 +0100
Subject: [PATCH RESEND v3 4/5] i2c: davinci: add support for setting bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-i2c-mux-v3-4-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=PGfDlWvGSscBxbVs8v8ZTNXGs8v6TwzoMOGQNHx4lNY=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVTmbEPDBw0DGf55nTkqQfPY0aSmJczmJdzL
 udfzpVwpD6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlUwAKCRCIgE5vWV1S
 MsrDD/99RIw+4GMeSZBAZdqbftN+a6QrefWaPyYXbQfwN0gTMDTGL2lUdqnPRz5XYrpBrI+8zJX
 16Kg3VPRKo/si9YBXKjljakdIpkViF/LhRm6VE/s5f6KjUEZa5K82ZILREWEVEcUJBeblUPSpb3
 c9btZcefJ8AmMyAWmiAAXdeUrNJV0ecpmZJn8yROfFp6BF5h8J/v1NYWGgbizI2a/6njFui/lKM
 Yh1Yv1MQgPXx9xpZLNCDiV1ATrxcIT83Cz1FOwC6/5ev7oTd82cmNhbhf28dWeY6Hs7185mmUGm
 B+9ZhV7/bGSzLiu5u43DI2npMiIa3+wkxxfVtr/ovLZhdNXUcf5mIUHmdaTZsZvEeEk/5JEj/UB
 FyDEfFK+63Z/0RbkCMdMAFvnclG9bUZbYBctMKgtQCFnabtupVPifRKka2oeS6jXa7TPdXyIblq
 ORizRSo+drE39m76lmL4SDmjh1wGj2mGsz5QdqN/qD9H9YmSxC5xDb+9KJ2ccIc2lMNw+CeaQxt
 1GR8DgS6yTBGfnS4JmsvtE+lwT48Rgl4k5hT3U7lmGoDqn7zjMdSwNPga0JsoxWbK7yJ2qT2SbE
 DUVQjvExQizKAWxq/AhLfgZDdTtzA5BpMxxoxgzaZzxqtcP01uB55BH/O8WxuVhFfRx9uu+I/Q6
 I+bVBUkrzPsFGMg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010543_974999_78320B38 
X-CRM114-Status: GOOD (  13.96  )
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

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 82f295619c4d..fdde573eb59d 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (dev->bus_freq_hz == clock_hz)
+		return 0;
+
+	dev->bus_freq_hz = clock_hz;
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return 0;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -810,6 +831,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->clock_hz = dev->bus_freq_hz;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.51.2


