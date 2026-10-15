Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84C5CC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a9BS5o5MDEOlFKxjri8LZd6JmLpT8LmYs8UVHNz++8=; b=4uE8QWO4Ur4WiFCSoja3ZzuS3r
	1k77cG6ibec4ssMfzSz/+GqCLRtZzabEtIQ79nJbjtkUQQ5s+KX8PcL9N+ufE8TNIpy0cJ57gl2Nh
	Sa8Z4V4V+mcSOQ5c1Wf4hAjPDH8EcKRRRHoftk3WMW7p6fuI4y8Wb+laqc3zYyuf+vU7uDlbRJxGh
	TXdeVHl5AIbbBwTD79+o5QWiiqnsyGL+M28UWzqNp6028491gfs64ZNWRh5njss+w/RnKlWCUsMoq
	7guMXBM1DhNkKUURDmqtn981kNEE7t0ZETWRnEcOoLR6J8uifbsRC91FF5dXEpxY6/4hDxGdDRj9f
	l32n8uGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEM-0000000HVa0-24uy;
	Thu, 15 Oct 2026 11:02:38 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJEK-0000000HVYz-00fu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:02:37 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9841363b5so44556491fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062153; x=1792666953; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8a9BS5o5MDEOlFKxjri8LZd6JmLpT8LmYs8UVHNz++8=;
        b=E2+grMnGrf22XfKjBaLSOrIz9LOhgj/1g5QBkU2+qktM0pK+lmAs96GscJJMXKQ2S2
         YogRJKdjjcRXIwh0wOucJ9fs/1gWRxZGH+3f2bc3QM26QCMO2uHRzaE/Kg9TswHcoUjO
         APzU29UNs0aWOFhK0WsYKJebJDokli1rkhbYWBJqLh1/f7od/41Z1uovTFMCAabUXpb8
         aPqopYRZHEnNQzjsPqxwXt6ydh/syuQcbNB6XGrSIA9TUEDjrdZwtbw2NWAHeXECLc5m
         7oPj5AqEac9ZXHK/ddlPBqDr1+R/owFm/4tbcr/qYgEWN0lfHdqDiWwYFI8keYK4VLEp
         O1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062153; x=1792666953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8a9BS5o5MDEOlFKxjri8LZd6JmLpT8LmYs8UVHNz++8=;
        b=yrgSmRYTcHOipZgwW++SZNX/L1f5DGRJ4ZdXnnQUNv0vhG1WJOtl8fLotbu8wzsqfT
         AXBkHCP0wm49mUo5Qna4TF0xJm2kX+39Tk6Jef3EKL0YM8vV1ETtfYfBejns2zw5rkTN
         1KWe5IhZvqjmEKi+0l73KPokt9Qoep/3HkjK9anqyRP6Jd/qYWO7vR81oQQcq1eL9/oe
         ZeHf/xjEag1V1S0FXz+oqH5mGy/S+18ebMnB1eOoCRoAg+Sunle3dakXAz0iXxrzqmFe
         tioirYabmPEzqolGDYwqbhgYxyGPPYXFWGlz0HgW4O42TEesrVZjJuwtCyYDP0wBScFF
         U7VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHBrBraEQ/yJSs8x40LWoq/ftZZa+2Y7q3/iPB2ZWevcz0igEnmuIFh3QpPzQ0p81BJ37sHi2kRvuc/fttlQP9@lists.infradead.org
X-Gm-Message-State: AFq9FYKrSa4mXkEShLclOlJfIONsVgMlB6t07LuUakZev43l5UUOaD70
	Bg7x5JQwuDlDUnOZKQILkze9VLXTrZ1M4iYsK3zC4g97tsgHKNm+GtyvM36CJpbk
X-Gm-Gg: AYBFou0l8Tmbm7pYtCMJ4kFrDywbobLao7jc1+YtBTu5CDNtZdfpt5LF0Bg9/UgPHxP
	yNHzxPmpmB1V9yr+HlifdkEfKo/Euw/ys34fKYITJoNDhQ6oz4cWK+Uon2wyOxskQe5JjlZ9eg4
	n+9Ut5Tkgx+zvaZErDxQbMYUEgv9YNMpXdoi8ApZd1TtwNwMJsAEhjcM7vxwyT01j4A8t4Lew6a
	50RbRq1pN2ppCyYbdWFv2zq6+89NJJShtLTm+Y5sUK9jfLxWchjVVlGTwkTMVB6YOiuHp/+2PCd
	fSQMI+MunzGqoRLJyyzCHPmXawWjxxN030nFbQdhTUK7whkcp+KcuT87zeLyVd9cgx9kfGtplWB
	mXVm17w6H0iZpgFw+t0z88kfxQtyIFXyrZVYS+G3exJ1+WBXPCktzKj+YjpgBAOK4gr+UTkMTqL
	cmKTi72afBQPtDem7/TbNmLs8ahBX/Lh0uU7IJXf5NxCBy/8F7pnLOTCdeMTBBnUrhHnP5iQf+Q
	higv5JNwrTfAb40bpwaRwU2W2WjNk5iyoCyIkRb1NFy7xZhq7Q=
X-Received: by 2002:a05:6512:3d16:b0:5be:42c0:6cf6 with SMTP id 2adb3069b0e04-5be42c06e61mr234143e87.6.1792062152686;
        Thu, 15 Oct 2026 04:02:32 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:31 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:48 +0200
Subject: [PATCH v13 1/8] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-1-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2319;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=4ap0qTWGOZgih1AXnNRPW+rFGzJn+i0/7ped25p36lA=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LKjS9gv8htmWbUa+mRSHXHg39xhgl4v/q/0M
 8UiIGiLUjiJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCyowAKCRCIgE5vWV1S
 MqpzEACqhNkDj9R2p7VsN81RLy6iRqiMQLVV5o24tYcSG8zybFha/ATDIVbTcYl3idD09jzDear
 lkj5qmtmYxSPEnSNW/FudyAeFhkGbrktpeb+iom6uuDX7ECW3sS0Zg9bQExVzmkp0IU70w8/AIK
 f3e3FEyYsRKfRzWZXf8t4lW3Jr4jmGVeAel+W0uUvxIsbcpBw7iyeXgk7xOHeXwcExUQ4LpoEUU
 LSH2YX/e6yGzwXVmLFifXRHB/yi/0TjCifRgLb52G9x4kI0DGI4LHcKKd9pA2k3fWm8QXH/8273
 bVqOTxGmH8WBDnzNIyTO9hu5nDWrFIwoJ/ddschP5XCQtsEzzs02P/EnDFrtnAd2Ebycwca9yxr
 ztF0tw0VdPIeYmMiWQ81QBZDgRaL8sPbMuy0cKZGb9NT+T1YoqDoD4MiL2D+ZwsFP5uCvuCi28Y
 lcmWcDBGZrCVTftSG5HKDI2GUMzNPaVBJF3ssEDjx7enens4Qa5fKXAwndrE0Ky9bAxfSbxRKpR
 M8YIHo4qVgCWtY59zJ9yo9HlUltQqHpjXP3UXU3do85r+YsMiZRjzmJH2hx86NhXbIuvuf8pHON
 RP/8iRNIYmqDJ7Ggi++UXj/eQ2WLZtQfdBPntA4iottyJSQ+nfCdGQFslr+sHQl9ZW3YrFhh4Jd
 9bVLSlQBiNIAtiQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_040236_093736_A8D9242D 
X-CRM114-Status: GOOD (  15.12  )
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
frequency must therefore be chosen so that all attached devices are able
to tolerate that clock rate. IOW, the bus speed must be set for the
slowest attached device.

With I2C multiplexers/switches on the other hand, it would be possible
to have different "domains" that run with different speeds.

Prepare for such a feature by providing an optional callback function to
change bus frequency.

As a side effect, several bus drivers keep the bus speed in a
private structure and can now have this value stored in a uniform way
instead.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 6a847fc88d25..d2d60e937244 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -635,6 +635,15 @@ struct i2c_timings {
 	u32 analog_filter_cutoff_freq_hz;
 };
 
+/**
+ * struct i2c_bus_ops - I2C bus control operations
+ * @set_clk_freq: Set clock frequency for the adapter.
+ *	Returns negative errno, or 0 on success.
+ */
+struct i2c_bus_ops {
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_Hz);
+};
+
 /**
  * struct i2c_bus_recovery_info - I2C bus recovery information
  * @recover_bus: Recover routine. Either pass driver's recover_bus() routine, or
@@ -744,6 +753,7 @@ struct i2c_adapter_quirks {
 /*
  * i2c_adapter is the structure used to identify a physical i2c bus along
  * with the access algorithms necessary to access it.
+ *
  */
 struct i2c_adapter {
 	struct module *owner;
@@ -760,6 +770,7 @@ struct i2c_adapter {
 #ifdef CONFIG_I2C_DYNAMIC_TIMEOUT
 	int user_timeout;		/* I2C_TIMEOUT ioctl value in jiffies */
 #endif
+	u32 clock_Hz;			/* bus clock speed */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
@@ -774,6 +785,7 @@ struct i2c_adapter {
 	struct list_head userspace_clients;
 
 	struct i2c_bus_recovery_info *bus_recovery_info;
+	const struct i2c_bus_ops *bus_ops;
 	const struct i2c_adapter_quirks *quirks;
 
 	struct irq_domain *host_notify_domain;

-- 
2.55.0


