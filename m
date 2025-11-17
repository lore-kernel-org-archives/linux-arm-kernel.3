Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CFACEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=; b=x5CIIlr7z4byzscTZJCXQXZVPg
	BmdVlNJc5jZv5pphb43p/lJ5+UPHnNC32Xwl5NoHqk3Lu45bRbU21zWMW4mwQ/wWyp8rdFEQ3OcId
	uDh8AhxgqOhsnfXBZFgtSBY+BkYCVWAG3WcGP1CQ8Td/kiMUlne0isKbfENdxlWJEBSojPlcgN7/o
	BU44MGuMuOA/aEbRZJe8iFpH8V4EhbOHEG0iB5nuP+2n1XncyQb40t4WuusBFzYpZKQ09p8RZ8Mkb
	qtutHIqg1WgacIWCf6w9XTeUFS007NOsw42oX7qQspP9+hF+Msq4nu9FHGdrroWbqgBX2+aWu+5ng
	MIe7NYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvB8-0000000FjzL-47nt;
	Mon, 17 Nov 2025 09:05:42 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvB4-0000000FjxH-0U8L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:05:39 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5957c929a5eso4720467e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370336; x=1763975136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=;
        b=RFfZ7kZsHktTAVDEx51mdZ3Bvt5dM8hn57do0gjynhG0xcatWMbfRg9JvMhmMhIHPo
         OaQ3bvqNUJ+XLCVYD5gxmewzGL+Ot/s0M9eP5gXYwFZyXd1wrmiJIwLQmJAwpbdC9pA8
         zzEftYCqkQH3ANX4tx3UskwYQ40JX4cbofIZlbcpnameiE/qkhXdZdIUgHBghE6GdDY9
         q81KACvRNsNuSToMD4o2Co9JzF0yp2XPwwYGhU1rZcFS9UXw7AdM0wQMRdmYDmjK4wW0
         gSS0oXirfN0sNro7mT888JFeps1QBqWpheRJTl3Fg0IEpOGIVhmyyBglBjyxzlUgedUP
         rHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370336; x=1763975136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hjv89plBIlsGmTTvLKA+ZN//B9WD1brqNLmFgcY68x8=;
        b=W7AJD6sqee+MonjJQDlLHvQwHbU9APdnfuSaQ0wGTFMNAoV5nr+iU3DOZFdN2Dqes9
         SnEO3OiaANuDQRCW4zUDnX4AsKK3jvwvAN7qXu96TUuv7JRc9NI5lu6Vxt8Q6HKFUwtZ
         r559bB91eIz3ML47wbbPsnmVQDdwmkILW0KXwDn024O8xDKdHyaRe5/aYapKo0GtG0Yo
         EdnFw7s5vw12Dub6tGwF2keSVozkSy6f7qrNTUNe8LEM+TDwz/aYhLWNqsrpsF+9Z7cW
         n2KCO8p1tLNsTkMMVA81YKITnVenc5h0J2cw7dUZhh0myMl2zQuNMsZV3FfXZ7KiR6/K
         6PWw==
X-Forwarded-Encrypted: i=1; AJvYcCVrkFtRRR5DU8zUpDhokAjN8ztT6h/CyYYk10amXMz909I2VfCyCcSdMBiGpX4OsA/Y6km6wNUVnxZeY2Dy8hT0@lists.infradead.org
X-Gm-Message-State: AOJu0YwLwBBoqwaFzfVA2yQYChYjsy/MTJJf7iiQq/amfjIFyR8ngYvx
	Au6+LhoMqeWI4Xlh6ZMXokEGiATAtLas/JZXHmpKQHPT+p7fnYPRC7b0
X-Gm-Gg: ASbGnct2r1ohmJWoaQo8DVhGSEamfezhq0ptAfQt3PIrlje8e3VLwt5B5PlVWAolkka
	5TtxHeb9zaFRp12DSCh98d/vzwg99QDv9lHU9srtXCY1OvRWoqcWhl3d/aa5k1FZcLfy54y0KYT
	Wpp1yeIQd6KLKx1JJ0tenkZI53TcARRFeYFToGzi+KsC0iWv2TpPas5OdPotK04KlnNlau2y/sU
	P0gqb6jQEUJ49GD700FKg/v4uLaoU8+g8+2UAJ5PsG+69C1gy+zpcqKfhl0ar28aDihMjUCxK9r
	UvsO9GFhgLmhGHGRNaKqjqF5li9vkj7bM6OeemL9hYc5zkcHtZUhfqewhS0Pd2xWLBBiMMpE6K9
	lFax5heowDI4zYpxty91h4zMtvQPflFb/I2p41lWB7Ypp0sYhyjx9Bp7nTm3dMkVdS+96VkLX99
	CBD5al8Y+pOKe2RFRCT68mnqn36GbioS06j7Vywc1pA2IoIA==
X-Google-Smtp-Source: AGHT+IE1CtPf1rDZdOPLypfOYFlt46lPsgZtKbCXbF1dxdxjZCZ14KCSOG9O7CUC2DPpuH+w99ZeEg==
X-Received: by 2002:ac2:4c49:0:b0:594:3399:985 with SMTP id 2adb3069b0e04-5958427b020mr3894196e87.52.1763370335743;
        Mon, 17 Nov 2025 01:05:35 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:34 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:04:58 +0100
Subject: [PATCH RESEND v3 1/5] i2c: core: add callback to change bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-i2c-mux-v3-1-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVFrW23F6KDDqm3v1Ilac9N1yPAMHUpHzQM0
 bbw8To85+iJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlRQAKCRCIgE5vWV1S
 MrbnEACu/uxioQ6+TkrlS0EEn6+1px/r0vxSiOUMk2P8U+bxuX0sy6xRUyZTXym8cJUtk7NqRL1
 mvkGwQdlirRlO0+kQOozvcp8J88K0Eb5YPK20KspKYKDtQ3XOCEjrWDpZnS9U1tQ/X5q9AlrUcC
 d7irlNXTX/HY6Yr0C+G54T7qRHXMaw0nWYnHU3H/OcBaMw9M5es93OkfA2pg2qXqcQmkZAnpeHJ
 673FvgvLyW5TYPwhZwSqoRD07LEuY8tlzx7SbpPOYrNKMZEypfXS4DP210kQRnJTLdujSBgL1u5
 /GcJY8tAgpZw5IGeK86T8qAnKIp7vrtJszeAhgU5K3J9+1yTvHLiomo/ElgzsvmYzddW6FGog9U
 ia9nweqeh7mhNBcF8ANXkZxUNkZTTaFymE8eh0lzHcbFswymyI3BqxsxzvCH3o/0N3yEbZPpjOy
 slLFscuJAmraVQy20Pb4g9OAjvrkH/ysz/9i88SzG4tz4u/fez6tYbtWi4BygMIuB228kCJxsii
 ZlpluCYXr6ln8KRFCCFuobI05WoNZMnmKRVYSz0n8UGHC2rmHTjacs7+ur7y42sCxU8SXW1DJXN
 2lHRK2ZCZxJkMn38xdhvkm1inavo3p5QDGJduk1Vij+6TuL7BKPo3GlR2P7nmuBtxMg0UhunrhK
 mZusgymXusIdCeQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010538_214470_57C5AC64 
X-CRM114-Status: GOOD (  14.31  )
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


