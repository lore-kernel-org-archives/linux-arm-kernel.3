Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697C2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I7U/7TFFzbKxLXCoN9cY2hp8Xdg5JA+fD81iTA/+0bg=; b=f0f3v7Wa7ihFHI
	UKzHtC5PQpdMQJqVF/mNdAxHxDgS+5d4R/enzzpFR86Q0k0Xoy4XF+K5SJUMrimeNJwwZB4VkEgM/
	OaGmjzkWkNJi9Sa4Hglcoa2OwKLVXeHyiH2dgRzhpJmE0jW6WyWsk6wTlKHHwPAKqtgJKoM44Dil2
	yRo+hrAkj63gu6SdPyT7QjDlFsTdSjoqE8+7eBP5PHvJSYxJy93s+7z/g4QLyr7AO6ydIbbwJ0RXV
	H9nRWp3mSgXDcw1VqO/wB80KkDNrP++OVR5kJF8wVOL0bAdsYJmZfWj6pqOVepU18VQFL7WMx++KH
	wpGsQeVPyP9S7mg64ybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUIi-00000009lFG-3Yy8;
	Mon, 12 May 2025 14:38:40 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU3d-00000009hmv-1cpz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:23:06 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad21cc2594eso481137066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059783; x=1747664583; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7U/7TFFzbKxLXCoN9cY2hp8Xdg5JA+fD81iTA/+0bg=;
        b=I9OR9C5Vll0L0YHAiYQAKWGnQKtaTjQHYPdkpiLwGEWpIxoxZu8uoFPwpQtEysmaOg
         qeoxqh27gT1tdPhdobdie85x8MmyEC6BejV0Cxhs6MO0KhM4NEoVZkfK2I7/YWNTaDkY
         LiT1PHA0OzJMWUbGaD7BubNz88+FPEKH3HDffLhbGz25C22quyszn7AoIe9fZSfBFy5P
         A4698NdqZH8FglQxVczOcPRnhZRP2Y17sswBvM7bAmy+hu9S5qMVcP0exM1UQ+zv4qxR
         3lOgM8fF348e6Kd5Y9d0LhkXfldyVJRQZKrmDBHTSzUbSsRyQmx4ypExY3wb1QyneDwH
         uudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059783; x=1747664583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7U/7TFFzbKxLXCoN9cY2hp8Xdg5JA+fD81iTA/+0bg=;
        b=s2b+bplZpsnkk8u8CKyLaZALA3Ase67Ce5M9OmTl9gR2tMrzoZUqJbdH30qjB/hqem
         G5/hnOopmpgAuqsnikoJ10DS4igf/ZyfjfE4qNBjXXwD2kPp5sWrgk170ebgdTM6MRdY
         jzziTVUbv82vYtjWoBWZY0hup0GT9QCL4//oAy+LZcaw+hxDXHWfxHy/0nykNw2OQiim
         HWL9nl+Cny2NYOQ15K2taGyP5viCdDqezVcaovW4JEcDLkWa70DkWzcY15aRbE+00GFB
         Mk9nrY5PJz1fBoP5zTdvRpEdF+uRz0TvOuz9qIVowmXoC9fETwMYEPQ1RO4xsAWi5tw4
         XqoA==
X-Gm-Message-State: AOJu0YwbA4e6cdU6GTAswa40EC/QHRgPhgqb6VR729AgCXETlF/nZIWk
	NHEQBX0Dzd72OsidLsITZQsUNqeGmsLA47p1vsxbXcBgJ4BXxQ7YqwzSAw==
X-Gm-Gg: ASbGnctrHeksU+Nw78vRHUIqcOD7UFLlQi5cE2K5ezaU8ZuI1D+HGozZ04+tr+qOEFm
	7L9CTHyH42aBU7GprABcru39Yle4HXkdpT0CUHQISY6AHu6MGNnuE4fa9Oj2N+whOLtXi75kUy1
	ZrmOBFYkwac5kQ9FL06Out/luFFdzF/h0gULw8AEYUvjwgLDxn4XCx3/IW3GQMFJjJvLAzkbYFR
	TdM/B4uZ15pD3ehELuy5N8An736A97CMnuduEvAXpbD4BE4Ki7WFFqJn9FcFVESiBe5NY48lQxG
	ZHlOy45XxaQFIHDDmgovNtbxZr7tHANVwQU9oOhhCZd5OsQF0dzXKb6TJ+EwG7+NcjQ7ES7/Aok
	1FS5d
X-Google-Smtp-Source: AGHT+IH5BZ0mIdqP6PVPdn96FQfatjAkMNwjVngyRgQXInUcRxpFy4UFr4q/qRntr7dbIFUCIXMbWw==
X-Received: by 2002:a17:907:c243:b0:ad2:5198:d710 with SMTP id a640c23a62f3a-ad25198d7aemr440934166b.20.1747059783141;
        Mon, 12 May 2025 07:23:03 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:02 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Date: Mon, 12 May 2025 16:22:36 +0200
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACwEImgC/x3LTQqAIBBA4avIrBtIS/q5SrRQm2ogLDRCkO6et
 Px4vAyRAlOEUWQI9HDk0xfISoDbjd8IeSkGVStda6nwYu/ucKBpupRw5UQRh3411rXaWSmhnFe
 gP5Rxmt/3A8vr7AxlAAAA
X-Change-ID: 20250512-pinctrl-a37xx-fixes-98fabc45cb11
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072305_428386_2AB47A6B 
X-CRM114-Status: UNSURE (   8.52  )
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

The series contains several small patches to fix various
issues in the pinctrl driver for Armada 3700.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (7):
      pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_direction_output()
      pinctrl: armada-37xx: set GPIO output value before setting direction
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_gpio_set_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 35 ++++++++++++++++-------------
 1 file changed, 20 insertions(+), 15 deletions(-)
---
base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
change-id: 20250512-pinctrl-a37xx-fixes-98fabc45cb11

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


