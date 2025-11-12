Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B99CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp0FmiCJj71Jl4oZffl9a+Nd4P6twEmX35nVwvd5KFA=; b=sE5kKdO8lIcqRuujLjelr7OLDw
	U58L/cNDVZvHR3NhJqMgHbkgSy8hbqvy7SAo6QLiSY/f9vB3JuatCDsxPDEZY7t7bX7YsymXniYQa
	xY8Gxh+qETA7vmrR/g09KvKUuJbJVZ9WuEiMAyKYvnumWveFBT6O2MPwCLmvxHPRSku5Wm9YmzWeB
	ZM3YiWc/k+IGIBlraqXeYdlFl5Bu/3MSYhaoltd3tf2KDX0BbKVS8ClKOOuAVxmvuM0wLhWrG6vlT
	QkuuduTAagtgNgijWVb1qrMY6mBHM7kNTKU3GkbaHhxEK79o80pcrLrRZoIoVM+GomAlRn/m+NGlZ
	W4J6ntRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKM-00000008set-1BbP;
	Wed, 12 Nov 2025 13:56:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKI-00000008sZt-3o1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:56:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47728f914a4so5597625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955757; x=1763560557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp0FmiCJj71Jl4oZffl9a+Nd4P6twEmX35nVwvd5KFA=;
        b=BIF3Y2/MinpXuiekQXxRXJMu0oGGT4tW1FsEXpx4HUZ3SEMjMOVpJaS9Tz/L9DNAoo
         OsX+gjcu96/FJN+P8K/LR7cmx2iSzNufbUz4qzIWA06QwzZK+NOKWKzOeZ0HWZcL7mud
         z/2jYDUf8urIA1sL3YrPMYsi0eHeESFwl5aA1gLqEk2eMHTZuCjhU+3u5ZH/jBHNJ746
         n/btD8KMvvGPc7EbsrqoVLA9jUoK0ossSqXsX3moL7uSGQq8OBsBPVM4LQiVhVk1xN12
         g5BG6x+p5+G+gzlRGq1yY4BU0K7ztmH3eX2TJS0ESIxornzo/O6w1SEYoQjIEm0Ua7Tr
         UhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955757; x=1763560557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kp0FmiCJj71Jl4oZffl9a+Nd4P6twEmX35nVwvd5KFA=;
        b=ou+jGRs0jrhLadygtH1MVTBosWWesX+lubaY3c+dhQDLKvKS6+KabcPRri8+OgZ/+m
         PJxSnUGPkDxXzprFAGM1L2d1ukTu496z0E1Bk1yLDWL94xJv0iC/byDI8zQkK7Tv31Po
         5l0bE7hnNtMrTz/rD30tyTJrhv6zQIo1hevaLucTvdLqYNkJgFWg9VLG5EaMguIwXvd5
         MWCQCSAq0qfabQKMi8hGdVFH9oYlVykr1IXqkpwsefWkXE0dWP6OguxVLsJxagjKLteh
         gL8vz5QXSPFKxEKLYcd7q9iiw1AXMsI5XpXIDpwGBBVInsqjtVmuZbzTkk0l4yZY6/Nm
         TYxA==
X-Forwarded-Encrypted: i=1; AJvYcCVTrLiVd8xioauZSi+V/tnhkIBfMWlii8+VdfSw5f9VFThrbOwXCbyaMaf/w9f3cbTsm2w9PRO1YdzcEVfwTqVH@lists.infradead.org
X-Gm-Message-State: AOJu0YzdI3pwEvhAuOrFVE3NIGn+nbe6k2Ax1oEqwEpUrVlfK1N+7ZE3
	vh2CHf2WDjwewydZf6y3dWkIgBGcC6w+kr0JSgJS+RNJ9VmBYAz9tmaHwS/EtabKrxM=
X-Gm-Gg: ASbGncsxRnzFLXyJzGI0LvWxG92I/twHPYTmqCa1mfyj1P9KMr5TXA3zGM6va+hC+lH
	mtACBMniLCbiQl4CFN98MRS20PzulMO1EBgXxHOFjIpONghgh2LozPmGObONQLNFEd/ZRhYK9H7
	35Tnzkn/esRMtMStQrQZRUEIhqfX85rJX5qsFfWHByElm4KTMBD5EEUNrFK8CDBs4OAU9w/TmOh
	lcKOXaSskzsG71+0uLyWzUzLohgC6ywM4VO1OrNOUl/Hz+wX0nEV5c9AJMVN5iSxNvBIkR8cQSb
	N95pkQQViUQSJzLUxXvzy7eC01nLFfxCSM7iIQvVsDgxXJdPejFkRiaTguEumUQg3EG13UbV5SR
	486JC74/ht9lfCu0IGIRRUjl3cJriqekL/1SnyAulfclYT6yzSWC9Xd+SktdtxA07KGk=
X-Google-Smtp-Source: AGHT+IG9voS48hdT+xBkoQt9DZv1hKYOn+kmcoFvvCmGnWxQyhCTGn6OKWMid0l6AgV8010JdBsVyg==
X-Received: by 2002:a05:600c:1c0f:b0:46d:a04:50c6 with SMTP id 5b1f17b1804b1-477870c32a9mr35632365e9.30.1762955756833;
        Wed, 12 Nov 2025 05:55:56 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:55 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:39 +0100
Subject: [PATCH v4 10/10] regulator: make the subsystem aware of shared
 GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-10-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cRJh4UNEG3HFtyWkN4hxt+/hsKQWJv1/Ds8BXH+v1q0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHYk7DEi8vVcJ8C6Jm2yEHPJBGM9iGwZrEld
 QRXIbLOz+iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR2AAKCRAFnS7L/zaE
 w5z8D/0TLxRCfJwRygeJ86VvClZB7uM7J1J7NnDKtg4UUs56/PXpS0p9l9x6HrZCLCmXiKCXC6S
 rZimvHSWFvMB+C5AzBTweR/w8AU/dwfANLNHEFQo+iD3CLl9eCDO5S4D3mTH+GpDffO431DA2ra
 NV8XBbpp+4Bo/za49Zr9H2ob40gyv6LMnx0JdjauTBGDkdzOzFrNNOwnVCFn/teRwYxnFj/xFrN
 4GP5pbDAURlG/xIMeu9nKdruuD3lEP3b6bQYe/eYqZeHosVGYr7NPr0onVW2wJHG/RzQefqOWOH
 ABURXDvkqFhKu+lb6wia8HbWw+RyjHT672anUmCEfXDZ9LM0nquoSFzeaiN7Jf6cK/jbKzPIlvC
 Ps2AYAZ1GqYqxYwpwn1rZnnBc0OrBt1a58lr5tBW0hKn/7yuvMJrkWbuXj0BttD3FNhif/16siA
 lttnkrbLgbYY0YjPKMPkbEjdJWESGR7zBrNDC2Va507fkTnxZ2Phqf/lxwNF2PfVO1PzwnBZoSc
 CmG3UEV6uBjSgz2CaPMSPEypNdH4WPIeC1t4kRTUWEWsGV4cHpnmh4BBtCS7l/clKFHd9kYjfhf
 ic0J3okXXIW6QgaD1f5jyr+g5oh5qRFfMovbUX6XdJOev5b4Rh8yx/EQPfOmlJUsw+FnPZDBf0p
 o27rB4fzdQATFGg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055558_974934_0848DDAE 
X-CRM114-Status: GOOD (  15.10  )
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

GPIOLIB is now aware of shared GPIOs and - for platforms where access to
such pins is managed internally - we don't need to keep track of the
enable count.

Once all users in the kernel switch to using the new mechanism, we'll be
able to drop the internal counting of users from the regulator code.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 2eab56df042e6b05abf0989f425dc161c7b0e66d..53b2b2d3746f9f2419234912d49bd8b4f21a893d 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2742,6 +2742,13 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 
 	mutex_lock(&regulator_list_mutex);
 
+	if (gpiod_is_shared(gpiod))
+		/*
+		 * The sharing of this GPIO pin is managed internally by
+		 * GPIOLIB. We don't need to keep track of its enable count.
+		 */
+		goto skip_compare;
+
 	list_for_each_entry(pin, &regulator_ena_gpio_list, list) {
 		if (gpiod_is_equal(pin->gpiod, gpiod)) {
 			rdev_dbg(rdev, "GPIO is already used\n");
@@ -2754,6 +2761,7 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 		return -ENOMEM;
 	}
 
+skip_compare:
 	pin = new_pin;
 	new_pin = NULL;
 

-- 
2.51.0


