Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD97C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=; b=tdLCX8pagoWc/w32Lk/CAn5J7z
	Tgi9FPoCUUmQ3To+44/6IQ/uuW6G97xupf0bI2QzWCUFtZaTohGLkooxgFZniG3lAsLQq9X8R/k+Y
	coNOGRfiaV6OAEy84NB2AlTsh0b5pAw+3+PvO1Ph0o2/xG+r2/cX3HSW8FzaDa3BPQjX7kLqQAhR8
	sw9A78hmpxQBPrLuz17DkSNOrhJuD7mGMizgILxFB/RP9rAq8XoPFeu7Hzupzki8yawRh9UFRpagI
	qPu4bU8zzDLVIriYVTiqp62FMTuZmcU+gcPd55HRpzpH+02PpJUw2mXukp77GnxvV5KLwZK7fD/QT
	MrKgEBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhq-0000000BHNL-1CnN;
	Tue, 12 Aug 2025 16:18:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulllg-0000000ARt9-3aI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:58:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b914a9c77dso159432f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992687; x=1755597487; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=kqQr9OtdUKzlxMk3T+RPKOUbf0Nr3zLw1SMCfz4ofsMNEPvq7dB/DjlRvZC9UZorS5
         bAaP+bCfvc9VrWeT8DEgHPikBlwLg6p3qLonK4nqxxMA53xTWPV6LRHt6uEwdIlwfc+8
         rG8u1MoXO604IZj/07pfDzV5ZVoQrkR+U/7ofMqSfm0MfjykiYjT9ZB3/UfKId7Dxu2r
         po30l601oUUJaAaJM8olGmBRVk2kFj8LnQAmD/w/KCcZ1X4BzxBrgQ2Z6NAHiGcluEhn
         UT9TUrpNXrLNnjpngUsvD+977sHQOnqtYOl3X649B7eJnN7VcUMdyh7tJfSL107sigC2
         kIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992687; x=1755597487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=fiIeiTooBad2mECU8pZqhyRo5UlYMzY0pZNX4FLQHomzt9PFC8xFdlVml+4QpNHnkY
         aAGIkAD7gioDx/0XFLztIpKun/tR93uASt9OyfAh8HzG3O7XRbK+0SEfsnkQvHEh9ueY
         KCZtUZjgfboLI6Fa7MQLEfEKBEofKMfaj4BFJ/kOxVHm2fepfJc8+t6vuziNgj3KHQCu
         k/0ton4IO+h05n8E0tMnit6wUzmsoi/qF8HEr5aDlIUExbYgBmObNKjs0IW+G8ZCWq0F
         FqUvzGOV0CJBMnWLAksGBN+smwG+iajs6jeMzSZtY3Qi/sW3J1KrLz3jGCte9fxtuY3m
         QZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxsj5kJ4rD+8OcW4HTC0khvBptPDR2w5iUvnHyEPlO1dEnuTpgCimyohRtl9brMjEYAVq2gaJPdEu4quyaMjks@lists.infradead.org
X-Gm-Message-State: AOJu0YxLi4DeWN0SyEj4yZQql3730sMBeuTae05mTfak8ug2YucIH6k9
	5ezXuP0tbS607+rq1xEe3XUMOhyNAYrX8tgdYSZ1QSzIxvSdPwFYE9oOI0pWH8DGu44=
X-Gm-Gg: ASbGncvTJRW6R0WLt48PN6U04Q9yzRf611v+HVRx3/9JjNunnzs27Pefp5sRXYk0Zgm
	6vSSyEBPTzlHgGv3rPZ2uizsl/ly3seEqsZB+13H64mVOH0QoRO1RiuCTOfRAWOps9TFH61r0+k
	9wl92ERskiPPVMWdVrLFUOWA3FNh4yto3qqKdOehGLv0B+fMWts8wPG9V05hz7uR1EUBACosfWD
	OlIX2ZxtTFU9rKyd6sMHxAqQMn9Zz4l5lVnw9Wqpchkw78GJdCobPmfIfz4dnUXfyQnN2JEeq6S
	7Ef05eS/S5CaDwynfTP/gFuZRHznwL3GAAUKFGpaXFMwkYthUQ7wKh/cT9/lINmSfyzB0wj0Gm/
	bK8zAvZE6ZB2cG/FysvoVBp7A
X-Google-Smtp-Source: AGHT+IG0JFbzvxgcB6X4MyZBqm+2xPe40r8xhGAf0WOSzlzFftx7jbu+1MVfa5fUGL+ohg1QwvkoUw==
X-Received: by 2002:a05:6000:400b:b0:3b8:fb9d:249d with SMTP id ffacd0b85a97d-3b900b2d934mr12705009f8f.21.1754992687241;
        Tue, 12 Aug 2025 02:58:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:57:56 +0200
Subject: [PATCH RESEND 01/14] gpio: generic: provide to_gpio_generic_chip()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-1-8492f4a4c1e4@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q7IZHV9NOU3n+seY+p1AeQbkCwKHTjI/3z6Qnen62yA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAmwRO4IQbNhdYvzJyHfuqqGp/NqybhgbKLH
 Eiji2ez+r2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJgAKCRARpy6gFHHX
 cs/LEADLl4q5Pp9BmcpGAF8+4D4VldZtJWYz9SJ98k/ce2tzQ29zimKTLwC20VXHTZuYGjDvQCm
 IuqcLDT2QEKqqMzdPPAASqN/z/heGoW7W+ANwWXhY+AL+mK7ndBSvCx0I4ZZRkzOvpck0EDo04D
 URysnHXBiXHO5o4wtfVCkJcNStCJSlP49m4xz7npz625zWjJVmTmArzd2qX0FBRp+RnKwdnMlLn
 kEDxHP8qeVX1GoNaairRnPuMRSt7CSzDa4oK3UWwMl1ODoUvCXjDx0LNaEjr3jsGoeaJyQSWrWW
 LA3ecwTWriz3GW4lXlZPsxk/JMLJFjYStN0m0YTaHilKwTVnGkTJSE5OZeVxei4vgN/CaWyOCsR
 /INhTtXPt8/FgFiD5901OxhuaOc2eDnE7z9AtCsHAynRsFhyGswM3UnwBwwHn3I/w9cNmGXL4v8
 ZAXOYcNeYtcDeczP60htbgUv9u/t818B2GGZ8UfhoyCyLViSCSdJ4O0Bo+ck0cvqbClej21ogsg
 lumzlDWb/QgrgbFaeGdFhLrbtvcIy9TpbuR5oIJCkD7CCY2qYG+VBHyD0bwV1h68QE6cbNIBVx+
 PYPJ2h8R/D5Gx1M//2p7KfUM2tUdw9iLn4nw0tZcKhYDQDl0HGDCe87CrtYC2Ms/8up7QZ/WHxU
 wr+ngzWXtIQhYFQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025808_889582_D58DFC9D 
X-CRM114-Status: GOOD (  10.17  )
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

Provide a helper allowing to convert a struct gpio_chip address to the
struct gpio_generic_chip that wraps it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index f3a8db4598bb59f1dba4fbebace24dc10be44ae4..5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -55,6 +55,12 @@ struct gpio_generic_chip {
 	struct gpio_chip gc;
 };
 
+static inline struct gpio_generic_chip *
+to_gpio_generic_chip(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_generic_chip, gc);
+}
+
 /**
  * gpio_generic_chip_init() - Initialize a generic GPIO chip.
  * @chip: Generic GPIO chip to set up.

-- 
2.48.1


