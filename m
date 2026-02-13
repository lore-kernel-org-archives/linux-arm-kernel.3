Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA68BEDF156
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJdrgI0gtiqZZNbRhdCivzcmuLMzMB0vNSWzU58rH+A=; b=CSASbIwSJVKreGak5QwFDPAe0G
	Sp2rMLdMPjKyJ/bWPckzRiHULMjMRasZNfcCRbu0hKp1Jb5WI0T6zuxcP7QVg4FTYYYQUCg4K+nSN
	4BIXDlUAYn/rxBWKG/NrKUEn3C5Gf9LmSnr8mU7VSUz0IFay7UTlq/2wQvtIzaCWgq/FH4nxGU+uW
	ZUDzCCMfj8drcX4LWikrrtdHVWz2sbfaTGhm+UCc7ZRAKosls2EqH5aU573Pfy1QDJWItlourS1fI
	Qj8qYQAC7ThkDink+cYVH06wJQdUSFf/1HBEwkqcpimKuVWChV84lVEK6cMlB7mcj6nBX3WVqwwNy
	Pc3FIcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1s-00000003MvJ-2xjD;
	Fri, 13 Feb 2026 11:08:08 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr1m-00000003Mqq-3RaK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:08:04 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3870c7479c0so6140021fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 03:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770980881; x=1771585681; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJdrgI0gtiqZZNbRhdCivzcmuLMzMB0vNSWzU58rH+A=;
        b=kmbuqkmr4ZYyAI0pRlmOOdS5uWTDO2QaGSVZUFFToiGnBhR6QQMhYdF/1KYlFayVUG
         /tD12wwNVQqJtFfuYDqiV7namKv8Ls0QXFFWCICC1Emjf3y6aj4/RFOSYlKmmGz9ManA
         +9ta1y+ysvMVGgfybocmRUIpg+gs/wkhUrpVjXVhjOn2ydfiKl19rTQkob0ITzLKXs6p
         7Cuuphhss6T8lK6nWf71uin+p0cKnzVX7jaheU/cN+YiwQJfTXMZaz2C6+eO+XFXfgUg
         PK2V4VwrVY6pHn62epHZzH7/n3MUt66SQVQJ2hoHu05xq1GptYK3ZrvPK/IbhwsEg4t1
         96lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980881; x=1771585681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJdrgI0gtiqZZNbRhdCivzcmuLMzMB0vNSWzU58rH+A=;
        b=Tlg8zI09MBR8WI0WFxXW7e4/yH/PZSt6gbo8jrxnUUtPbH0J3hY6GgM8+GBVV5JmAp
         LQ1kpUq6hVM9GkkQfANcsCV0c6tyeOCEUFl7PWbXr8lkZVOw5L36BEXWLHXYig1U13rD
         M69pHgVEwQWHMJXFOsypT0/0zWRieRtDjj0pwtYwls19ZZ2C8T1obEycXI6m8bZBofg9
         5H0vwWQPYzxGZ4EgCfCrK9Wvy3ITKh+H8aC50XUOi09VlLJn0faSsJ5JOwatsa9S9nYf
         9Zo3PEjv2ROHdRzuBhPFgCt50VrfgKDSShkpTFu9x1CjJcVPcm3FIdSKBe7p62l/VO8P
         jC6w==
X-Forwarded-Encrypted: i=1; AJvYcCVay/iy5Ixn1a0DxvvPIj3yixKlK92Dd8ya7Vcyi+DlHIhLV/6ig28ZNbN8MW+QN6gfoyL4dVbo10YHQ+LMka1C@lists.infradead.org
X-Gm-Message-State: AOJu0YwlbwT0bO/zoI1ooaEFlX/T7wV/yEpC82m/0VB9IHMqDApzGBPm
	o5HBJjoqGIAR1YObIjkOOigxH2ErfDNI8+YaPa2VuYkWuZm2jgpnkahJ
X-Gm-Gg: AZuq6aKdtQsn+EV8IRZ7XcneYOcx2rMYVG42QtzusBx77oLDBCdFSfg+i6RtYP93cPZ
	ZlshmPZqT00q7/pyo9eMcvJ0BIAB9fBJkfeGKwZ22JFLLz/wNnGds1r2rYp3Nq/0NC7/JsVwCDg
	S+vbslhxsZx7657/YaRoI0A0z45mSAiu0Dlo5LGVw1Y040CHD+N8UiT73RTXFXndI+eHnSHo+y2
	rFxO5uUKBuGjev3dxsny9yD5nhBX/ktFhLuy2bPG6cs0ZdfP2mFARXKJ9MD5ur238k1l74CgM1K
	e+C9tVdOwgValGu/YJe3gibQwUaQQOZ/Drp8XOrAiSVSwZhi2p4w75LteThoIHZX+ig1dbGqQIw
	SOFleJVuMLgYSwmHRMT55CU/rH60wzsWEwgvLrWwWlMgzzCztLPz/vPyTB2ETuh0od4JNqc9DmD
	vHMjBaSn63ZzzYJ6NiibcXJ7vs4libWfs2KNDh5kBG0YF+jilfFTsbyDECdPqypTpLve+W
X-Received: by 2002:a05:651c:2104:b0:387:6d8:8d61 with SMTP id 38308e7fff4ca-3881050d8f8mr4342821fa.10.1770980880492;
        Fri, 13 Feb 2026 03:08:00 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068924c3sm13635831fa.1.2026.02.13.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:07:58 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 13 Feb 2026 12:06:53 +0100
Subject: [PATCH v5 4/5] i2c: davinci: add support for setting bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-mux-v5-4-fb2cbf9979b3@gmail.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
In-Reply-To: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=32tpqgfedy/sxp2AZTtYj6G+OqEGB6zW9YyBBWylfYU=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpjwYQjYtkmVzixam7zJlmI7LwWiVJSUQa8NVod
 MxK9pUbs/OJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaY8GEAAKCRCIgE5vWV1S
 MjL0EAC9rAgMMCWzcShokvBpBcCZucXuh3KlCmPqH5ZUGe3a8fLC2Y92u5hFvUeaoBpLmTLGP0l
 m93yekpOYZ5TdQSFzfnrikfz5HU3kG7n9J8UROVxIJksRZL5UUU3HgpObeJgxMoDPCvISmpgalJ
 jefFt/X3XOHJ3Axq4xHaH6B7IBvbYYu3KHIF7UWfDRmXeROBw8+oOqVcddBE1SCa/C4NUFTXpuL
 MWs1PUaG6BDi0vdGsBtEVMbsGRVKDYlKWgehq4AxBKzfc75WiI79nvwXOWlna8VnzBG6cQoDtGI
 dSYKb1l35lkZg0obmYBp0SDoiVKm9nT8JjteMoZl3r1q9mBrQB4496aCXtIZ7Dppc7S/d/JFXNh
 HcuYPMXPQ5zgAbsJmrQlm6LQ2U+94wLvMZMtoPWHVznvxvoVgTnX6xqEfTuJ1S6iluX92ACblGN
 560bD4rPEf2D/hRKNmM8JRKNAxGrVcueMfJ27beq/HMwddNkpGd0C2i6iJmv0gp+I1b2tuAEErq
 pccgokdH9wtCL8+lmwUBRGSKy5zOSt8iB/VgcTnQ3SbsYCX8MlhTjwZ+W3wYvC/oNi2oIZFOR5A
 23rYZ14sUuuD4cu5iMX99Wfops3pVytNSxnKQBMdro8CQ+OXAStSax5Gf34RbAcJs7bVVPe1zDP
 7oNl6E/1JN8+nNA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030803_229647_AF112F3F 
X-CRM114-Status: GOOD (  13.67  )
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
index 761de5a814df..3daa823dcb9e 100644
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
@@ -809,6 +830,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->clock_hz = dev->bus_freq_hz;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.52.0


