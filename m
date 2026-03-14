Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289D2105F7B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdAp6xh8xeBfkhw2oXmLZzz+7TGqiyYSvmIRi8yYlCE=; b=XKH6S6j8bd7ISQMQuKVPD5cI+u
	wlEEL0BqgfWRXBsfHzojGpETx/lXRXg3Lc4UCf0Ig7YTPQNnpOjOOB7W3WcUAQi6SXHxy+VqYECUs
	qzwTWERUl3MdIJbemG1xCcoI4qxUsgOwqjVIdiASWfM52CXdsqffNcm98cbYUiCjNyTuFEC8SyKH6
	CUYCT7hF4l2ghgYQddpubwLh3AaN8hHOJZhMYyn+ltUv46ozM5hoKPiEnUNT5C3F3TYVHjip/zSVY
	+nJNBk+deSBdS/nCdmiq/Mf0inQfZlRuS0TeBNsw8ngr/dOR8KKtmp9hKCLsIHvH+jvy+P3KzYcKS
	cSZWkrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCY-00000001fjp-1cr1;
	Sat, 14 Mar 2026 09:22:30 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LCW-00000001fj1-1xli
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:22:29 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-38a46657a9fso28891381fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773480146; x=1774084946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdAp6xh8xeBfkhw2oXmLZzz+7TGqiyYSvmIRi8yYlCE=;
        b=ecVbYTgugZsJCWXfb7NfKcDJpn9S+6yD9UqsTOiFIW54zRJ4x5kiUsY3RB+y9R3AFa
         Z7rd+tYwQivqmdbmYEQhEKvlncVUbTzhifLE3UeRoSh4GBlQuGK0c2g0w8L0Ocr1syyu
         70FRYR0TadLxngF6f15MnNI7n4lHxiLsfZ39ZsGkR6jOzjKvwAr9rLdWn1jUlKkT3IVZ
         OrQqYX5HSsiuLHPL0+GIxplC1szODJrQ0aZO5ogU8lUT+/sSlq0oL2niTCwbRwDaOeMm
         9ApJhZUO56vqi0Dl/LTmy3z0l9YojJVflp/lXFHhIG20FyKk+NeLCcohbQLqrB3FJE7d
         FnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773480146; x=1774084946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JdAp6xh8xeBfkhw2oXmLZzz+7TGqiyYSvmIRi8yYlCE=;
        b=sr/s6Ma7ufMTGX4bdxM8JSSnlMOIhQ/WwZKhaRgC15alO5ELOrYD9ne0evDymSO40K
         3EytsK8n4idUbZG0+fVqCmxtVXDH82Prb+7XJ7M9+c4CsFTNhj+X7TcMt1qbCRBO9h2B
         Mcho5laSyblR2KAjs0xsrQpSLkk0r3MxPFvisbUKj001QcBdVbS5vgHsu3mhAuq3qIAE
         hfbu19ko597WHqWST+p4xY2zmS1rCqcVbjgddBVn9BrOTNo1UUWHX51L5tMTezxnEd78
         hUksxbHRIMdCcHxK3QRtgOznJ78IuDohvaSL4VaFkLahqabdIu63MR0XcXAnitfGk5/j
         QjKw==
X-Forwarded-Encrypted: i=1; AJvYcCWjQufbDvMG+kyzkkrw87hfFju9JuymXA71I8kLICKPKIXnARidRsMA1ZLiYGI8q1zWyjXwTN3cvXYnpufDInaD@lists.infradead.org
X-Gm-Message-State: AOJu0YzVJHE/aja1TTENJiMQ7iWBtl8sZfItem6UDSRer1paNdT6qdxI
	gW2dEcQdpZtu+6CIDiiM6w+DZWcQfdbysDd2k71zncVxeqdkjr6nth2t
X-Gm-Gg: ATEYQzyYDwiaRL3eyZ4f9yzT9V7mGSJrZ0iZUf9i7RtgRAYsszMyTfFZCXSTBWhMeUL
	aksGVaGynDRkT0YZkKBYR2Sbh2iptEVTQ6rNcXfBw7QzUJKYu2AiYVYYJb8EYz8iksocqQxUboM
	is7hQwh2k6t/0dPMHJFZZbDZD2iAA881f9e0qCIgbTu2xgaWQ+kRm3VVET3UdWAyL/dh3PL7Fwn
	grWQmdk8IaOxWGTrixGFUxqquZi7UUqYTUCx2pIaMm7w+b1CRcucpNEANOugiBt5zw9ZR9pQbpB
	leYeYuA0K8N6arLmhW6Sv/0MfCCw/9ESZpz5GSEGGwb6UOhBlnktTh14iBjKyy7fw9NXKOCYgF0
	s9R512vsDrNv1DZLmfNpQEDeqfbg9x0meUisnflXHCHh5yHtI9EWIFQ6PB9jOf6K17iXIw0LAcm
	Gba4EwsqeaFE7MPJh82BwExGh5HTRvIEDN66L1z30s/ex950k6csX1iUh6B7nt46jyr5L2
X-Received: by 2002:a05:651c:198d:b0:386:fe97:a554 with SMTP id 38308e7fff4ca-38a896174d6mr19418301fa.6.1773480146068;
        Sat, 14 Mar 2026 02:22:26 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ec94sm18454261fa.22.2026.03.14.02.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:22:25 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 14 Mar 2026 10:22:40 +0100
Subject: [PATCH v8 1/5] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-i2c-mux-v8-1-fb1738a4df0a@gmail.com>
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
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=XZVd7p9mIBaNy+NIKUZiBgjkJyYONlNCoWZWgB7A9Zk=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBptSjwLT4MaR0DO6Twk7A21vxdQcVbeFomx/EA1
 +jDGStKmI6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCabUo8AAKCRCIgE5vWV1S
 MkcaD/9VLkaaITlVtQkALLgR9imaLtoSahhvcBaS5hnerW0ZoM415E+OF0n7qMHWx2vJ+6DwVJE
 cYh4zw/V8t/Vq2WtJgxNNKVobFBmGkI8yN8e10b7v01X/yo8P9aBwkeN2JzllVPjp9z1ottTC71
 efLQxd/zVbzEUfscVZBiIDU5jBqnpOx7oIruF5rprombL0+AJky7HBfEBnfltDW24XM3kVRoil/
 SUGQ6ab1qFYGEF4sBorFH2CjwqqoIns9L8u3a9MygbkRCuF01C+cTZxBy3MsVHj6E0vBpJlyDOr
 w7y65qTCcrHUsdNBsAYB0b+KiGgVM74VdisH/ustdjbQVtYhOFulGjyqCkkh0TptdUY4coavYG5
 HGprEjwXC47VGsMN/8r8g2cxUWHOC8i9+fz5cToP2jXuQ+gZisDmiXYopoIUVATbAZ3pCB5u8dK
 kdFEm9aFQmfW4ny1uMHlGQRwtJwChfxSaxInWpH8WuALjtqL/3ZW0NrOAXKln2Mp+GP1SY7nS2V
 RecUtlCpvSUhntRYBf7E5qfb4ROvicm8zY2bnflp6vyfvH3gr73kAVM8LNskzxfWx9JuhliWEKY
 klQjmeO3XUz5A2XhPOGyrSlhbNRIqYKoSq06af6RQzq1e1XaZv6lmk6JxufSjHbAyEWxOC22GoD
 X4PymDvN649/AiQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_022228_541655_8B56B70E 
X-CRM114-Status: GOOD (  16.24  )
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


