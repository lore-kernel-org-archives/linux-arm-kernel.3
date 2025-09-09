Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F82CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 11:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tP+ETbVnBSQFrRZK3WwBGuGE5HSVEMwxjNtKrFEHY8A=; b=enRt6HBoE8hyAO
	OzndpekSAbr1hWb7kAaznqxoTjDLUtdWVh6etS02FQfNIlr4g8bqLNk5ieC0gIXSz5VF0WO6oh8l2
	+ImDIAz1KOarm/iPYTaVVDtWj6clfkyjww9vI2NXdCwRU6T122RgUAJZmjoyqP3H5CK46Nd7dGg1h
	bxIiIquA4YkTPJwBeqDUYs/YL3zuB2ZDcdzq77qfejhjU7P3e3yAyMPKm2y4WfEQ9yTtK84+YHPwn
	z4zHa1ABMNIjFyvA8AK7TljYSbpGTicX2VOgyDyk2rIkVninSn78fjHg/Zj1PXShyrbb7k3VJk62Y
	5/WHjfXT6DgvzrAvcZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwGM-00000006d9h-0tCn;
	Tue, 09 Sep 2025 11:11:50 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuRz-00000005sS8-3udQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3dcce361897so3554129f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409342; x=1758014142; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tP+ETbVnBSQFrRZK3WwBGuGE5HSVEMwxjNtKrFEHY8A=;
        b=3gN64pIU9j4FG/3ghgbTdhqM+1325M83+0T2TUBRut/X8I3t7W6DZbQowS1LGy1qvJ
         T9yUSfNWL3jd9drNTovMh46aXSOPN58ruVTXbnJMeH/hqEeaIFRc2h3MsbEv7SR8fVgz
         7SvZAnRE5W2RXNEu3B0I2RNs/JhEv9FoCS6asfS4ZNbs2z4oTVuhynlIVI6meG4yVhIF
         B2DhRgZ/9iof0oH1kSAPGFFwlJMQlOtVrnRacXr8gVFbeyU5v9fgg17zXrRlqMyiarOK
         9kLB++aiHuOXiNeYHx+5SjutHv0rGd1rEOtflNoxyNhO9OEUtI+jS6odZwsJoT1Nha/V
         tGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409342; x=1758014142;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tP+ETbVnBSQFrRZK3WwBGuGE5HSVEMwxjNtKrFEHY8A=;
        b=gKWEQhy7880WcD+CFn8SFcVt3DxyPCPJ0vNnUoiDDv2bT6AMREhKh5aPjCPU4gLdPl
         /mYbIVSpxkojx+i0LAUz2qKHSdV1KbWIrt2niIyJbEpMC2bNAo+yFCnWZ5j9sunMhEzV
         OSAlh7iOhOsyTajDpUxlkNZuG2SviZEB0Dn0t1leUPC/E1PY3rYN/uzdf26J6nWIKugg
         ybNdmSA0yrUziBK5QFfd8tmRNy6TjWFZ/s0pDIe3F/PE6seriebetj3fM3K+7AlLh6yM
         ZqJmQMNzyjZ+9Upr+2VAsfLgYmt/CeLZB9JRzAXgoYMr43PCzvBe+gZ1ITx+9zLf+E+y
         fnWw==
X-Forwarded-Encrypted: i=1; AJvYcCWoXYwVJId3cyQ6RzXnfKIqoi4dSF7wojmRQypkYuKrMioRRk/WKNRXayHkYDRPswXwj1Lps2HalCNV0ax0NaZ7@lists.infradead.org
X-Gm-Message-State: AOJu0YxPSavBq0e9ru/tCfRo5XOcgzKOEeRjj+n/u2nA0ddMrLtokyoK
	p3aeI59pOwl93ONwnW1TpS/4ID2iqSqVxBXHV6ieUtfpw6jew2h/uimwg5Co5Ub6RZ8=
X-Gm-Gg: ASbGncsfnDTEAU+f97lou/zaQasvBxd5GRnU/oV6sid6tZkZoo2Cxur8t2Y983w/qxo
	JDW0rBn0OEw6tQPG0u1zffBIJM3SMXFOKTDXNLx7wLeNbvhFGaEPY/GL2ifjFRpBLL2LZ5sc6Bz
	/fAGXZk3px/2JtYhhLd+lYKzE9uX2EDXccHwPS0vRFxA258Yy0I+pAAkEXXc+mjZygRjYhj7jcO
	8hm2zT2JL5avbrdaEQqMK9qGl3jAXOFpU89qY84mttjjhtCMMEhfbnj7AswkkdJoOBZevJNmShn
	6KSI5YW751Pv0zN7yMVunZuEAOBku0Ki9lJUO2Ce8cFDEvFhWjA6dsD+E4LeNZLF49jyuSrcWzk
	z+4tz+1EcSi9TSX29DQ==
X-Google-Smtp-Source: AGHT+IFxM+HICQsKhDaBX2Rk22xBRkSqIHTShzXPmAQzNiNBdQoOhni1m43entJS3MAB8D5d0TZglQ==
X-Received: by 2002:a05:6000:3106:b0:3e6:116a:8fed with SMTP id ffacd0b85a97d-3e64bde97a5mr9793821f8f.45.1757409341378;
        Tue, 09 Sep 2025 02:15:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
Date: Tue, 09 Sep 2025 11:15:27 +0200
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/wv2gC/x2MywqAIBBFf0Vm3YCKIfUr0cJqsln4QCOC6N+TN
 od7Fvc8UKkwVRjFA4UurpxiE9UJWA8XPSFvzUFL3ctBGvSZE4bQ8K81xQuzK6fBntRurV6c1Qb
 aPxfa+f7b0/y+HxskalRrAAAA
X-Change-ID: 20250904-gpio-mmio-gpio-conv-part4-5e1f772ba724
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sVPlOFYsePlUlVyNjlOXy8QPDA01db/Wvcm9y2+eUf8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/Ays28j7tkwm0rJbaeX4j6Qex2lOj/LqMAOK
 1PDzm34psOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wMgAKCRARpy6gFHHX
 ciEyD/4rjlTpLHFFOAETzbM8BZ7x3WlTsL5ofRL45hTWSkD3Bsd0OZjcixkAe0OHW2e3zFw2szF
 KeXpnt2sCS7J2vacxQtg0jH2fWZAf5bZ+OoGUTAieReshYzmxRi1YJFUgIrAX33d2SDzSvQrZvR
 VCG+aKnwtsgLIS3bpQ1AqNCIuxAy4Ry9lCAY3GF9UpNsbYioHxmLpykb53ferurCzD0dP9d2FfA
 qniXI92yE/VlFaWTo+gqGjUntxHg8iOH4ZhmUCDpE+Jd4zHfEBtw+OfWRmZkRnTp79FeNdacHx5
 p6k4r4XWU7dQ7BVOwC7MAvwAE8H7OI0viWBqD/6NVLyk6JNskJqsOwu8e94Ddt2gGDw0ARDpeD+
 I7mJlpyD/qmL48+7obrP2XRtew+5bs1uUUL9Agv17b6I59tLZFIO+8lix4XEyj9/Fg2w8cNkyZY
 c24JWXw0s0j+0JaiJKzZ5d6j7Bt4uYvxV2CCUoJ7bN1qi60NyHcPYrP2AwQ8sZKU1xtPedwTG+O
 KxwLrf9Cweg0/cRvkk6QQ82ss5f+Y7QsEwe7HuuKRKPRU9azoXk5BTPKu4ym9w5yjZDgjO+RreU
 OYdfHdNscHAHrLf43/UNtW2sSEmvItWokNn8tfM/e/oZXWUa6NjPf7lUXt62Wdv9ck60Df/2/bM
 oqEJP5tTEFOaNGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021544_092378_783821EE 
X-CRM114-Status: GOOD (  12.72  )
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

Here's the final part of the generic GPIO chip conversions. Once all the
existing users are switched to the new API, the final patch in the
series removes bgpio_init(), moves the gpio-mmio fields out of struct
gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
the new situation.

Down the line we could probably improve gpio-mmio.c by using lock guards
and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
something similar but this series is already big as is so I'm leaving
that for the future.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (15):
      gpio: loongson1: allow building the module with COMPILE_TEST enabled
      gpio: loongson1: use new generic GPIO chip API
      gpio: hlwd: use new generic GPIO chip API
      gpio: ath79: use new generic GPIO chip API
      gpio: ath79: use the generic GPIO chip lock for IRQ handling
      gpio: xgene-sb: use generic GPIO chip register read and write APIs
      gpio: brcmstb: use new generic GPIO chip API
      gpio: mt7621: use new generic GPIO chip API
      gpio: mt7621: use the generic GPIO chip lock for IRQ handling
      gpio: menz127: use new generic GPIO chip API
      gpio: sifive: use new generic GPIO chip API
      gpio: spacemit-k1: use new generic GPIO chip API
      gpio: sodaville: use new generic GPIO chip API
      gpio: mmio: use new generic GPIO chip API
      gpio: move gpio-mmio-specific fields out of struct gpio_chip

 drivers/gpio/Kconfig            |   2 +-
 drivers/gpio/TODO               |   5 -
 drivers/gpio/gpio-ath79.c       |  88 +++++-----
 drivers/gpio/gpio-brcmstb.c     | 112 +++++++------
 drivers/gpio/gpio-hlwd.c        | 105 ++++++------
 drivers/gpio/gpio-loongson1.c   |  40 +++--
 drivers/gpio/gpio-menz127.c     |  31 ++--
 drivers/gpio/gpio-mlxbf2.c      |   2 +-
 drivers/gpio/gpio-mmio.c        | 350 +++++++++++++++++++++-------------------
 drivers/gpio/gpio-mpc8xxx.c     |   5 +-
 drivers/gpio/gpio-mt7621.c      |  80 ++++-----
 drivers/gpio/gpio-sifive.c      |  73 +++++----
 drivers/gpio/gpio-sodaville.c   |  20 ++-
 drivers/gpio/gpio-spacemit-k1.c |  28 +++-
 drivers/gpio/gpio-xgene-sb.c    |   5 +-
 include/linux/gpio/driver.h     |  44 -----
 include/linux/gpio/generic.h    |  67 +++++---
 17 files changed, 548 insertions(+), 509 deletions(-)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250904-gpio-mmio-gpio-conv-part4-5e1f772ba724

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


