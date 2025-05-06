Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B593BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bkSckdGbet2iMO3lK9JiFkiMA12riXIjt+egFZP9xhw=; b=jXBG2A2fa0dtNc
	TFzLabUrqqYpGj0JS3SrZGtvnx8BEcfn2CCTVzEwYE6s4kFLdGXxZc4rlNrtVopjM1Y09LTPzyGJT
	m4udO0t1qOK01myAm5hF4hG2sprANjVK1UFs71M+29TzSVxrr3CqG7rnfSL/OGLAI+atpIgdK1dep
	UzooveJmGzV1ea66zSYI/hnCzN1kuzTqEgf9rlD40oAAQfwxjqZx77xCQoL2XQbBkGf2Z7yzLc8n8
	clTtIcwnXR52aEwmJNt95icqUgPEQjuGZCPkbZcFrW0z+uSPGuBolJkcGzQmmIh4NkxnjGmXbaRWX
	LL+x1qLjd57Fg3NCWYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEq0-0000000BR4w-1jO1;
	Tue, 06 May 2025 09:43:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBX-0000000BFsf-18d5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:01:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so44931185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522113; x=1747126913; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkSckdGbet2iMO3lK9JiFkiMA12riXIjt+egFZP9xhw=;
        b=zYQyFIR09FKYVlRViUTSSNxYwSDs5qDaZA6YFI+7INJf5Y8CZ/J9TYlMxKHZ5QjTw3
         ZryOJHnIx/Lr4SOIrMaRGKYV14bX02+U5xITJ9rvUyWMJxMS7MjBlOqEWDxXwE2c0rBJ
         FnLL0mxsLC+eqFZ3k4pgXLpqcXL62dfeW6+rRHX8QXZhkLxRrTCCXkYkLmgxXx0ZsbCX
         aNR7ksch5VIlXG/pna2avBMzRRe2CMzCo/kE0UiCPdgNSG3vIk9xb0uBTqYm6PP/Cxs5
         cBqky8cWnvwl5DGVHWZd8vnHFz+SzxKM53IFfia12r/SV77/KsttRsfpa3Kfv4xelZeF
         nQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522113; x=1747126913;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkSckdGbet2iMO3lK9JiFkiMA12riXIjt+egFZP9xhw=;
        b=Xyw1kdyjQDN4rl1Q1eGfiXrHNPBDmIX054TFtjsrkN4RvanwRuMSuDtQ1nTRFvB2t8
         5CKh+5rH2veb4WvfNNoChEiCp+ynDnWkX3AwZ7ozREuq2SxBJLcd194MdZFEe/D/6hX3
         WFrocFonQezcyCUj8Akt6pxzLvJXTfPQBxdhmTEU01SVQUK3E6zi08scFtIf9as94wMC
         /S21nWQEmeEuMCp4FbIqN53hdQQwGWU8+bmDUmcoN16A7x/r/eC7mu8uRzTpzvfpJAlH
         VN5n+jpB7cv4akM1cDxc/+Vw/jYR7qoS3l8j+N+vYzz5PblYJY/l/F/hKen/WgOcMcvS
         4qaw==
X-Forwarded-Encrypted: i=1; AJvYcCVciI0Zm5KYv4eYiFAzBOt1hIcaAVsvFU6SUX+7auyAGzgSYfterwOkuoiUj6cfgvkKnE3YLdmgl3Uy0dzNaaZL@lists.infradead.org
X-Gm-Message-State: AOJu0YzY3lTzgEQKsD1ZMw24GYJqZGx6lwaKq5M6uzskGKZvNEMkj+3a
	lNfWqmESff4FCc/fk33kGCenNkxJJXEe8aJont8Ogr66jB40Ha/cuFfw64mAdH7Tnt0jj54XT5Z
	F
X-Gm-Gg: ASbGncvjyO0kVdg/k2OikTkoxqJXytdfUwFu+Gfci/bYDUnlEtHM51qq5jK/vv7HlL/
	B7inI/4iNfz4VcwdWBrdorJ9jfC6SHvMbPJrZ0FGFqb+E+rOTglK01AFtSgX5VLMgq86EDlqE+J
	8Cb4Osnk+I2AUqOei/56G5IXbz+lnZaea8Y/DxwZp8ACDJ3JfHU/5VEKnTw4KP4UBxdrSFS/vuq
	djg0VAqflfRw1OXB36Ac51N6x7HogeUcCtR45IM/4tmYhMI/ydd+Ag1FtooXWdeB/0kUDPz8v/b
	D0SMdkg02zn/H/smuI7TyvzVZFehja1N5y7Fn9v3REu80A==
X-Google-Smtp-Source: AGHT+IFj7sycuby5+Xisi67I6ctjifRj/oOl9WSXmMnv0sxBewhRFv1zbclSFWHzUaj8JwTL8LEU3A==
X-Received: by 2002:a05:600c:4f54:b0:441:b076:fcdf with SMTP id 5b1f17b1804b1-441c48b3c97mr66535245e9.8.1746522113070;
        Tue, 06 May 2025 02:01:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:01:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 3 for v6.16
Date: Tue, 06 May 2025 11:01:43 +0200
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPfPGWgC/x3MQQqAIBAAwK/Inlswrai+Eh3C1tqLyioRRH9PO
 s5lHsgkTBlm9YDQxZljqGgbBe7cwkHIezUYbXrd6wGPxNGdnDBTQbl+Y9qkWJz8aIbOWWeshxo
 kIc/3ny/r+364QdFSbAAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zzyfhEwAK0od7u7qQvaEU1irR1bKl9oLt0gopkvJps8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc/5slEzhsD4QV82YbNGPsWnFf/VHMCf8ipQG
 d21roh9ByyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP+QAKCRARpy6gFHHX
 csZxD/4p08GnOddD9OWGTSyOB4+3HZn3pFgEl5zIiWCeDBSBuwfSNxTEfLgdhQhMV4SWPcuMgz7
 zztx5NWLVVaBwFAhh45V+ILUKvXpMTIsNgCEXmDYu7/opEgQuH6qEKzTIRBbTiFQmov7SdGC8bD
 4l2vyF69wBGWNC5gL+5ZsIm36sgpJsAFAJN4GOV/Y+QLZ6tC5z2RTD5bEX9gz5q+peiAEEKgm/9
 3xsK7obO2K9DiFYUjMDcsKCEVPyNV53I67w9YcZYBjCDBgvbPPt0keoMJpHfeXPxDKeD4auTRJl
 sLHwIRGdoX8cOmOQTm1sYsD5ISGRd6IYV0RdZ82D4gKBKft+gSgA9+rzZ2+Vz5Df73nTGCnrlA3
 zaYVp8j3EcNKsUfT9fjdAe/zE2zn5OEcroiZo1iBJDTOzR9gleq6RBTf8Vnht+IoUhWwt5Dy5ee
 W0QZQ5x6shgBpFdgGbdNXHfSfNcmON/yayuAzZoKud3EQ/Pdo0qaJW0hbE+ljm5KPBA0NemlL7/
 m5mcq9EaHsXMtcLGVmaHTwCQA9LMiw4YIKOS2CRlI5wOljOBcoDPGnyRWWx8hBLBzaK+Wt/w2Hf
 63/qwQuNNoogtfd6p4JxCxYiqaroOH3mBmEhlIqJsPBK5NW5SEPu4bc0c9WiACtIiJhLM7RCJok
 1eVp+i8HvwPoY0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_020155_318994_FA3F5CA7 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: lp873x: use new GPIO line value setter callbacks
      gpio: lp87565: use new GPIO line value setter callbacks
      gpio: lpc18xx: use new GPIO line value setter callbacks
      gpio: lpc32xx: use new GPIO line value setter callbacks
      gpio: madera: use new GPIO line value setter callbacks
      gpio: max3191x: remove unused callbacks
      gpio: max730x: use new GPIO line value setter callbacks
      gpio: max732x: use new GPIO line value setter callbacks
      gpio: max77620: use new GPIO line value setter callbacks
      gpio: mb86s7x: use new GPIO line value setter callbacks
      gpio: mc33880: use new GPIO line value setter callbacks
      gpio: ml-ioh: use new GPIO line value setter callbacks

 drivers/gpio/gpio-lp873x.c   | 12 ++++++------
 drivers/gpio/gpio-lp87565.c  | 15 +++++++++------
 drivers/gpio/gpio-lpc18xx.c  |  8 ++++++--
 drivers/gpio/gpio-lpc32xx.c  | 28 +++++++++++++++++-----------
 drivers/gpio/gpio-madera.c   | 18 ++++++------------
 drivers/gpio/gpio-max3191x.c | 16 ----------------
 drivers/gpio/gpio-max730x.c  |  9 ++++++---
 drivers/gpio/gpio-max732x.c  | 15 ++++++++++-----
 drivers/gpio/gpio-max77620.c | 13 +++++--------
 drivers/gpio/gpio-mb86s7x.c  |  6 ++++--
 drivers/gpio/gpio-mc33880.c  |  9 ++++++---
 drivers/gpio/gpio-ml-ioh.c   |  6 ++++--
 12 files changed, 79 insertions(+), 76 deletions(-)
---
base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
change-id: 20250506-gpiochip-set-rv-gpio-part3-9f8264c3c23f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


