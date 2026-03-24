Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B88F54ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdAp6xh8xeBfkhw2oXmLZzz+7TGqiyYSvmIRi8yYlCE=; b=cVEZykbNe8qbyntmFkiLdMzYBN
	ayELFLcEHWwmPoZyweU27VYFVbWgtvvtuR1+n9F1vCqpBagPy26ldKuGbewGzXWW7FbBuKM8vQxBF
	/wUDhaI34k38/1YpS/4TWONZuPa8+aLJp0jEKljyYs1RKhM7rPRNzKk4y8JjmKaMQqB1b/hZpnPAB
	TF+1BmB6X7W1V6e3D89hrfhn+DR5IKiCwfnbecZvyl0sbK7YJMQCXojkRU6bCW2JR6az1K1JDO9nr
	ymn2nKvBzYZkYW/M3IIDZYYJVnXNvXEjj72+ND2pyrzsX8egyOmpuSC4pF1F/RgCbF32/DDy94ieP
	6nX4FbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52DW-00000001aIt-2IQe;
	Tue, 24 Mar 2026 13:54:46 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52DS-00000001aGl-1w5H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:54:45 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a27eb8311bso3875941e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360480; x=1774965280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdAp6xh8xeBfkhw2oXmLZzz+7TGqiyYSvmIRi8yYlCE=;
        b=VG7b82FvsdHXPlP7lW7iaaWQK5W6M47cn5DD6tnJKGoqngFal5z7PnF10HUgMCTKAv
         bRXSRJcDxkMYwjXk7E/SAuoR/AmKhI6hOYn5BSk2SXEdEztT/ZoWqdFv+RlanI6BUkYI
         aoTzHixt8oJoA/hvIYYnFCITtCX8on24lK+11eYpqRR3DwLCS+V9On25yd+9Aw9g36iR
         gVUdZFk9E0+M9/B+4Q/BZnnNyKx2pBdOXvQwl00bmP0UoELNitwCAsL89ivKhlPEjFdN
         cmRppJW6ggJUgnUm/c//y9BLOba9ZQxJ+reTg4M5nSDRbgN6Won5aW9Tt63Z9T35WfHE
         Pwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360480; x=1774965280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JdAp6xh8xeBfkhw2oXmLZzz+7TGqiyYSvmIRi8yYlCE=;
        b=AJEHbHAtkebJ9xlGtrI1pUbyf0VRojMcyZWEA4OOuPxD+nmeNDQFSCyBdLgcxTY13t
         kzslgPBPEqSBZo8XOn9x2ZccHrfMJZn9/thVlrqrLJ4hGwPI56T2a78LSul9p/uylg2J
         xVYcumKYKId1IVyb32V6nc0s3z5I9KWu8i9I2crrCJEn7Qq48ob9u7WE2qsiR7aHFpra
         49aROemDvPPTO4zons/IDhZbBx2N2jfl/vUAXV3dBOBKGrBLkVUzbZ9TghWMfony0P6s
         nr81tuJZjRosHofdlUlnLkc0zY/a4weP+S0tkbsyFJVWDfT27g9AKLkEOTt1A2RhySbc
         mKhA==
X-Forwarded-Encrypted: i=1; AJvYcCVHfqKL4u3fD7azqyLI4AOSp9fEHrmjGOOMH4MCFA+AE8n9NiYo1rIhCWwQH4x5RbZo9YoVgnlFjovyrHJud/sx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8WnQnxeDnuq0MnWFk7gM16OaO4RpIRY0bgftsWlhVF2xMX5IR
	Jbnpk8AEiCDrt0DTCTZAN6wjAfF4fmuVT87GqYBXuAYCgCw/XhF/gy4Dx0Fo1rcZ
X-Gm-Gg: ATEYQzw6cpHFncxdbRgolbHYtk8gyDXbHXqFffUQadKTypBkeQLTg7v+GEmJ/9EMwCm
	Es+LzzIhAwmGJEXcwYFmYPqFfSaUxbB5ZCNvXsR6JkrOSmZkc3n5s19iBj/EibZbbqySQqK5YNc
	SUW1ASun5qOctjOXx6QSeMGKtQJV/6JsPaKetRsAL3HPTd2hXNYmsPuSAo65Q0qQBnw5pFq9zTk
	rAInCDiXTDw28kBGod4Demnx80mafK7Cl+gTFpK+a2l6tQzao4DuU8s/S5kPWLKb5IyKtP0dsdH
	iETluARwTf8q9LeDnXrALbfFsL9fc5i48/7D1fAuBwZFGEtgZ75yf92bXKDPJq+f5bszU5vGA4u
	1WmGhBg2ss7EMU+/h6qKSxT/k6XLTqfztqj2mt7g48+/BcAQY3wO8tRtbjXiEbce4nobOl6ptJB
	Cl9GVx173oCg6k339TP0CfJ6dg4W7LEGIjVbySdebZlj3831mZLmwkb6U3VWLydHzEMtsF
X-Received: by 2002:a05:6512:1150:b0:5a2:7eb8:2f9a with SMTP id 2adb3069b0e04-5a285b60fa4mr5257979e87.21.1774360479973;
        Tue, 24 Mar 2026 06:54:39 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207454sm3162823e87.48.2026.03.24.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:54:39 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 24 Mar 2026 14:54:15 +0100
Subject: [PATCH v9 1/5] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-i2c-mux-v9-1-5292b0608243@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
In-Reply-To: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=XZVd7p9mIBaNy+NIKUZiBgjkJyYONlNCoWZWgB7A9Zk=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpwpeNI6OmaQ0d2ac8J3iIBGEysEYB0qwzhghkE
 0W3akq+mXyJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCacKXjQAKCRCIgE5vWV1S
 MtN6EADTibXYTvwLToTRixa2sh4rGUbNLanpKU1sKffHdHOLtUuOEo4bHoRHV4E0tjabv595SmY
 1SMoGPf/phfw7YneGwh/MyGjm/bXChh2E226fW1kkqhRa2OEyU/mVQVKzxuHhD8axJJKo30NYJv
 79zdaNSTsOHy+Jf7dUytw2FXXwi75TI8dknQ2QCRl5mYIzMpwF6aPerYGnna97pwjvUMngzgTOq
 Ug8wZvq6eMINF8G1LRrblPT2MwedfA5QVaIIzIlgTwIF63Et/o0g1nBNJIq6YEMQX0kwTL+kwSj
 IyD4rGtU5yjFjPQK1qhnWtslh+METP8OL0dJkBHCyZFfQOXo+GyIEif4s+xTQmeqwiaFo3i7aK/
 RAD0r2qN0zfBbE8AhzftKThJCECn/IrRMdgt1F1gFfKsqOnRLexMvdq56g9bNHEUjWxIr5NaS4J
 65pO+YAXVUpcXp80l341Xq0LF85vejFvK2mlDnQpMqsYS7Sz683IVEQDkOrwFGTaOnEKYM1gB+h
 tfEcw/4Cn9jnke4nbM1av4S2MXAV+fbaPI4+pEPTQNCz0r4yBc12t0G12WoP+fq/WKdTA6yiN3V
 ExYkKdrb8kyorl6UN/JsBiS04Twgaqh6HsC43OrXnbAzqqzSSs6G3ur8jaBryTt8SvCpf5XCVa4
 a8wntfiGesMABpQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_065443_527649_16C04A77 
X-CRM114-Status: GOOD (  16.68  )
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

As a side effect, several bus drivers keep the bus speed in a
private structure and can now have this value stored in a uniform way
instead.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..712f9608108e 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -742,6 +742,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	u32 clock_hz;			/* bus clock speed */
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
@@ -835,6 +837,39 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+static inline int
+__i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
+{
+	if (adapter->set_clk_freq)
+		return adapter->set_clk_freq(adapter, clock_hz);
+
+	/*
+	 * If the adapter is a root adapter without .set_clk_freq() implemented, this feature is not
+	 * supported.
+	 */
+	if (!i2c_parent_is_i2c_adapter(adapter))
+		return -EOPNOTSUPP;
+
+	/*
+	 * Update the clock_hz for non-root adapters, even if .set_clk_freq() is not implemented,
+	 * to allow the clock frequency to be propagated to root adapters that do support it.
+	 */
+	adapter->clock_hz = clock_hz;
+	return 0;
+}
+
+static inline int
+i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
+{
+	int ret;
+
+	i2c_lock_bus(adapter, I2C_LOCK_SEGMENT);
+	ret = __i2c_adapter_set_clk_freq(adapter, clock_hz);
+	i2c_unlock_bus(adapter, I2C_LOCK_SEGMENT);
+
+	return ret;
+}
+
 /**
  * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
  * @adap: Adapter to mark as suspended

-- 
2.53.0


