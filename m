Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ECAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhpR0LfXWV5JvZ7GhUzYmJjVTr5dLe2TK5VmVVpd0/A=; b=CWhp7XN7ehdvC0JAaf+y0KlLzy
	p5bz76sXhXDh/THm+MFiJyrZqCnMt1dqAQvsKkfUZ8q/XhQA0QiKdLatMPi+yLgZteYD0Vn2B8kyP
	Dhx+zPHzLMVRgPeSIwXlDZZTul7x5ug0ExMHQ8udRhMpchn7bKAgXEu4ZEDjhBawB8U0Hw9wdUSp7
	Jk9FctEJHptUAsiABEpaNDY2eQVA1EYbuAfx2V38+vnRD1TRqfH/r1I6hTFRMAIWA36Pa6Rx1c7pL
	Gwu3DVfk46eSAa6Eg4HewFm45WvA9viEEVbUtLI3IUGxF++ofqDziMeFdm1kbiklcRqjw2J89Rj4Q
	lKaOocrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQdx-00000008seR-17l1;
	Wed, 25 Jun 2025 13:58:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRw-00000008K8N-2mIt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UhpR0LfXWV5JvZ7GhUzYmJjVTr5dLe2TK5VmVVpd0/A=; b=HmL0DfnZ/q+7D77GHXstRz+Ba4
	jvGlJzkzUJBEeSpV5Sa6BnTgTbM2X5UHLcnQc6XxDeOoPG01ehxe2U7crYDAYYbFq7B4JV1/EPQyp
	DU8N6kKd4T/pE1BHfXHqV0N2UY+Lxv8NU0bYmiLLQT9wwiiMZSLTD04OsPW8lC7mAQtYWnZf1wg2F
	kgaKMrE2DzbVifYos8KIcoLzY1FV19ldrj8QtNYz44oNpFiNm9fpGV1p0MyUkc8gQdoxbY+8ezq0t
	s2Ou/meU+fEZWdgi+Pqq3pF1i/ouYlik9VHnh0Whdh8IIpawdUEE+SmhBW6DQLPTHzUKxnmssHxks
	GrEcGWjA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRu-00000005mq0-0vUX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a528243636so937982f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847628; x=1751452428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhpR0LfXWV5JvZ7GhUzYmJjVTr5dLe2TK5VmVVpd0/A=;
        b=VDWNoAq5bORhNk0adsUh7kSVbGl2tzzE4pi5mvbpsM6U5A0VQWFLYmPY/4rkgxoqrS
         ES7RwKkSjZuAL9kY/x1Ev05230eDbwPlNE0BPfNk8byY2LbhuE6BtjVGWvIZz6wHZfU6
         OX5rNHVyNfAARvtd4hqs4o4VSvjGiElHTIhbOevCUwjez28QEOT8VTZtGaADV0/JP4nv
         X2FjPXuRPBFyYs1u/TzPQgaPDp20unjfEAcqPrCCUTOMh9etOErny7Low/errTHU3ojf
         fTGjyltyYAnOz62cvwfWBBee2GoLwa+t6WlqkU7XAHbOqjoT/d3gLrehffknNS5osM5n
         2jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847628; x=1751452428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhpR0LfXWV5JvZ7GhUzYmJjVTr5dLe2TK5VmVVpd0/A=;
        b=MCg/e0QzEAl92ggOV2a5eAx97S/CBu5+Inwr9H5lB1zERLNciSO/fLRqgkA7Xtaitm
         hArUzULz1+458LI3Dh7lUXJ0SBsDW7ctdDze4XjOLzjSkqqaaSyCA9xwUhTQZe9OLeka
         TxlKdxjWI7SQ7D7CrJptGIHF3mu3K0uACuRyeSUijov4IVzK/j/PxEB7bzhD86HLfmBQ
         M4jREO3xLCF1KFAcnx+NTTiJhuRySIYa0G6iZBgfOOT4Mfp28Mkj6GYbZNSxSqDNQAGb
         n8R+PpfOiEdDusI5BPF7WHx8R0FuQYvf+J8MfgDwdRBlUKzh7Itg9ml9wDXq9tBB98UP
         f4kg==
X-Gm-Message-State: AOJu0YypC+Cw1iB0o02cBTL9ROvSu86PADupNzWkKcoltgs4Vk+vaa91
	OFEvXtGP/liMjJCwJOpz4jKrAEjXnd/3bkhVsMifTMeSlI3wCQaqMAwgl3YDeqyHnMA=
X-Gm-Gg: ASbGncsJZLBKJkQJYAsU4baeZqFUDELIp7I+q7ZDg++LZot5KHEAZqhFTLgIzXoo5Nm
	rASJNb8Fdgvw//npu1Fmm/sDsznyF92Mplu082qfloDH4xOohd+N2cnxWNmuZInP2QbRqeSsl9Y
	K645/MOlb+gve3aiP9OTMQqbHphjP31YkQwwDHrokSr2pzB92/CPQrNFkCPdCdprmXdOkeC4Qp0
	zupteSTmyjURDshrgIMvvqWcUKl+h0yaudiVkocwQJG3UrzxsNMzFsp20Q5qwYLehTeJ4vd889v
	+SQxOdV0sY+ocz9w+Q60vwHnV97T73hRO2PGB2VzQyZd1DPXjWh4abytwDCyw15MFXg=
X-Google-Smtp-Source: AGHT+IF/hKIUSdhayitVn6hZpq9OzhaA692AFTDhpZlmYLAfLk9tzRqaFx2BldzhhLO5wdMy1ojcOw==
X-Received: by 2002:a05:6000:2d12:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3a6ed665f25mr1345927f8f.28.1750847628468;
        Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:31 +0200
Subject: [PATCH 08/12] gpio: stmpe: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nrAVZPTBoQ229SHfDIh9dyXdsDhiN887rJ9P45Rfdwg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9B/iPuKORTRq0vxAyvSJlHeJa6L3vnSTVwpw
 VF0iwgRHxKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQfwAKCRARpy6gFHHX
 cmVDEACllLptf5+JN/M7ZjTKKdMSR2YDCttpmE92QMRcSl0mgSLtkXsSSOgucgH/9St3t5k8Tcv
 vashbOf6BSEiLN4QzPlBMbKV7kVSZ/WngXgf7EOqpYrIHhX3XBFw76oD/K2m4q/DJjlbgk1oWPV
 Ul2cfoZGdcMqv/wCxuoyf/x8xC/VVOOaPeq4kKA527sfJYtUxhpYZk6tWuh6sNuSGouWv8obOtn
 T+AykiwimcNihL4N9Zpv/kwCn3PQcDYNP07bGGyiYLHtd+6jg3jLa7l2XM0F60Os42gKe1tsjYg
 XGWLB8SwYdirUeIjzwtnH+Jb9vE2NHTPe/ATBzfbeRBMdlU75eDFdIUIIqo5NSybT1ZJ9rGS2kD
 THJr5zG9aVWsxJr+G89JfMthFE4WvgTo6CrnkmL9Kgn5JLDBM0kDUnC3ucXxrUUH3h5YeI7XzIT
 7SWkiwDjszDnRlceeSC6n84B8jl7R3b1TEgMy7/XhYi49D880xFWllNeTmDhbFx1yXLrcIozuWg
 xSTBeC4GmEV6X9ir+3FUxM7q1gjpFDUSSjMvrrb0UiWN1vy5KDkPCDfzNvp/7TphP33HMvXH/30
 1WGb3nh6uiL2c7jlf92sSoyAOF/D45madegStRtVXUntyWtIR9nOiQRestzsC+ofFVePlgrAjkQ
 vVc730AR8Zq3ZOw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_113350_343923_2DE5AABE 
X-CRM114-Status: GOOD (  13.06  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index dce8ff322e4722f6f97a9850772c7fe7defd9989..0a270156e0bea2f2a6914da6743df6d15b0870f5 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -54,7 +54,7 @@ static int stmpe_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(ret & mask);
 }
 
-static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int stmpe_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
@@ -67,9 +67,9 @@ static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	 * For them we need to write 0 to clear and 1 to set.
 	 */
 	if (stmpe->regs[STMPE_IDX_GPSR_LSB] == stmpe->regs[STMPE_IDX_GPCR_LSB])
-		stmpe_set_bits(stmpe, reg, mask, val ? mask : 0);
-	else
-		stmpe_reg_write(stmpe, reg, mask);
+		return stmpe_set_bits(stmpe, reg, mask, val ? mask : 0);
+
+	return stmpe_reg_write(stmpe, reg, mask);
 }
 
 static int stmpe_gpio_get_direction(struct gpio_chip *chip,
@@ -98,8 +98,11 @@ static int stmpe_gpio_direction_output(struct gpio_chip *chip,
 	struct stmpe *stmpe = stmpe_gpio->stmpe;
 	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB + (offset / 8)];
 	u8 mask = BIT(offset % 8);
+	int ret;
 
-	stmpe_gpio_set(chip, offset, val);
+	ret = stmpe_gpio_set(chip, offset, val);
+	if (ret)
+		return ret;
 
 	return stmpe_set_bits(stmpe, reg, mask, mask);
 }
@@ -133,7 +136,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= stmpe_gpio_direction_input,
 	.get			= stmpe_gpio_get,
 	.direction_output	= stmpe_gpio_direction_output,
-	.set			= stmpe_gpio_set,
+	.set_rv			= stmpe_gpio_set,
 	.request		= stmpe_gpio_request,
 	.can_sleep		= true,
 };

-- 
2.48.1


