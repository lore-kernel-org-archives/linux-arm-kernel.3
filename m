Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD4BCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=; b=ePPGbU94JoEfXpM96QVN41S8wt
	U1eqNsy0MLDEgtbw88E/tEm6GnDgtMHsyj7Q+VgG67rVkE8+G3KG/Z8mkzAabKxOgxYE+TSmY0Is8
	6d2uNgOnBedbUYpqQjzCN+t9/jwsx7tYpjQxtEQIutB9uEBHn6QChcMicOlJjXuBbMkw0/Lyx0SZT
	hTTUpQE53SBkMlpAsHuH3MvqxYKxHs60VnWeebErBlpmhNnAkMzkbpsBp0xp7BpLyiqlFDCxbcqgJ
	SsHanwo+WeC7m8z/A/bYavg0e1/gFrfyjUCrAI9ghrV+jkE5bvCD7a9g+kgQ0CANrSxncz54wlZXb
	A4bI/cAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTf-000000051v1-1948;
	Tue, 02 Dec 2025 08:11:15 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTb-000000051tb-0mlE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:11:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59578e38613so3945643e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663069; x=1765267869; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=;
        b=G7fCB6Hf6/C1VRep00Ge4SlpvJ5o4IfCUSwjkzzKAUeVVzPIfJD4Ie6ifG355AQiSf
         C9pT+XDOyk+5U34wf3WH5ZUyGWXdvMOV5HctrHIpKBh+dRnI2S1W3mjzIYqfR3L1PPvX
         s8uK/Yl39yRSWxTIODxdsye/i+HAkqtbhdca4YOx/Tzl+wjM6eA4bhWyFtwcpuHRZjB8
         AI83gkKYNppEbnjxMK9UBV6/PpL6jK/AlNxlwX1ApRTu2PeieDHh8QDrWt7RR7M4/KSk
         H8Q5EfYDXYvQ8htzM2YxBr2sUrHMZOG1nzZklKn+I+gLxN+CGE0zAfB18UW/cA1JF9ks
         2R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663069; x=1765267869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=;
        b=U84zP8J/cleCCGqEEz7moQU0858odAg51FimC4lHnsBBTyK/ClZ+/1eugal/vUA5t5
         dr7pHMWFbPJ4SMfcHrw3AYcpMucYQK28BCe6kZQejOS4sAaytvDNyYFEzH8BGiNO8A8O
         /dL6jWaZcZzKD2x8KFxmrLAn1FE06IDTRpuqLwHbwThW7vrjFCFoFJqJZJq0268ZZqLz
         9tUW5v+V67pr62f3VbP8Odiz9fRBV0GSfptL8Ati4TZrf1BpYauSaEW1BVl3+lEP111Q
         xkCd/auOw3ff3SkX27zhyvU5l8CT+PFSCZRHA1zr774oJs9MW1L/ktpNmtRLVmhun6aS
         kQgg==
X-Forwarded-Encrypted: i=1; AJvYcCUXiQw90gusP8SmexnoUMimMePyVzKCrxBdSLty0HK7yPh52L0P6DZLH36jDx3j6ziwnvOe/85hvU3PUBOrKNui@lists.infradead.org
X-Gm-Message-State: AOJu0YxiaorAT3ITGxGgznmyWCTbu/m1gIhwN8Bh9jamw9zz5xh/V8xo
	cKiS74AqrcdYldMu+BYRjGpoNG/zPn/Aie67CzxX3CWHfGbJfVVSz3+t
X-Gm-Gg: ASbGnctfrI2VPNNYXDFfEH2gZ2ZMD9d3LxC7O6R7ZxJshYabwsexgbxKPeA/QQGQtvx
	cpjgsA5RAQkTPpCOkGFiQTJCFYRg5fMiMOQbM1Wsc3QIgt720fFpKRUmSKHSfJDp6eaZ7zJPeTu
	lGCyf5rPo4XVbdFYK3AKk3yYbZnYMIvPYsI2srqdPKOYnesgygAvX3xt/PBWZ3HUd9AnHPh+i3x
	OsaYam6kEb4M51CNtfbH2BLFfVpReWeAnwpHo8rHt5HYer1qbApKLBMJxF7quq+xzRzbyi/gYdX
	oTLbggS7jNCpT5yRhpoMLhZk9QK0BgjQ3RULIDPd5Xe4spBa8ln+aPBIOUV/1LmXA479y/r3aER
	rv0hEVftvkUvEfuhGNSqZaOde0KEbMqME6NieHTpQ9GLXooZWclw8kBmfexf6xEffNaztEu0yXN
	92k2D2IyPNYVF48ZPja9kkjAsdd7qGud5cjqH4HBd2MhyG1dnh7N0p9aLRj6U3wZtdDCY=
X-Google-Smtp-Source: AGHT+IE1iJj7SbJwoQiYcFUkDL5bk6OUrmSnL1kBvIgwjRcUBEEuS/lPd1BXU/0MQqrPwB2wqvR9Vg==
X-Received: by 2002:a05:6512:3e1b:b0:594:25e6:8a61 with SMTP id 2adb3069b0e04-596b4e58cd7mr9910048e87.16.1764663068727;
        Tue, 02 Dec 2025 00:11:08 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:07 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:48 +0100
Subject: [PATCH RESEND v3 1/5] i2c: core: add callback to change bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-1-877dcf478a9f@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Nc5M9Z8FNun2aD78Xc5NFxJfLrb5FZRGRBm8Kv/u2lM=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8BuoM+ud571wc8WeRvvqmjI7EUERjmmX1g/
 2H3AuZw3zOJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fAQAKCRCIgE5vWV1S
 MrdHEACMzdOg6XFCeOjNi/bb7yWReiTy65HGhwvQgttKUfXWESp20pbKKcalCYnCq1wkYhfE/SW
 BrPuXoltmEYqeSCWcQ566RR2Zhfvi7/EA8234WwAkPyjRs5IxYr521xbt1iQuKo4q9+jv4ANBnR
 0dxWN4jmjdSdEtoH/aDkTec9/SuHZV3rZJbXdep3p7LFZ45Zj0vklwC87WUPfFNTjlC6B+islG8
 pM92OG5ld0on7Bc7tcSbFx0hSsFK+aRLPJ6Gw3XLNNVvQ0I91/TVJVBMn9rwbW+gkFLB9dVTBYz
 lY5kR4bZVTqxsOCDhqnYWSKxp52lZHbv+wYJDXhtwQTIcvkL4q0eBcB0UVU+QBAZopZbyYfbZaA
 YsffxVwpsKKZr45SRziL9Y7Kun5JiFHLM+GT7rBBvYep4fOikfw0PZ9am70zczzkRwAB/EvRzS8
 IywYCdkGDl8Yzxq3SWWcBK+aVs0HpL8+Zp7CHa9Tr5hXVPK3FgqL1CKBaQI3Rn0bkHcvTJj+TDR
 5q8DNHeh64aOmCGGoo7NhD6k3SYsTg91V5NUm5+UxVyyPqVF79DfHtbfpYvNObQSlYEacz3yyX5
 0U98NyxEQtdw0a9o9kpoUr7DIFBxoawrYo/8E8aPG0jMCCf72Pl8mpzDEOzctRiGP81bTYQkMFw
 eiDjGlwptz58ttQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_001111_871938_0445BC93 
X-CRM114-Status: GOOD (  14.37  )
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

All devices on the same I2C bus share the same clock line and the bus
frequency has therefor be chosen so that all attached devices are able
to tolarate that clock rate. IOW, the bus speed must be set for the
slowest attached device.

With I2C multiplexers/switches on the other hand, it would be possible
to have different "domains" that runs with different speeds.

Prepare for such a feature by provide an optional callback function to
change bus frequency.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..d147e388dbab 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -742,6 +742,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	int clock_hz;
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
@@ -835,6 +837,17 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+static inline int
+i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
+{
+	int ret = -EOPNOTSUPP;
+
+	if (adapter->set_clk_freq)
+		ret = adapter->set_clk_freq(adapter, clock_hz);
+
+	return ret;
+}
+
 /**
  * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
  * @adap: Adapter to mark as suspended

-- 
2.51.2


