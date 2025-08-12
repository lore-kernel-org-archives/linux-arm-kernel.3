Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A3EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RB0uz3KhCKwDWAd49C9Ih5QwxR0kHWB+azypPaZag0Y=; b=IbYLd16ZQWP70N
	6rHFnDmLbZGUXa619vc6HWYxXiJJtcMxqBdLmY7vm6yyh8A/afSeXQnT32RsapxM9OU8qcDYKs+pa
	wnFdIRFRGBLCT0clqKEABMYAjCJau2uh0kYRhyp+j+tpsHgYeUJgCGP7zwliYNLixvb3y6bhKf0Vq
	hI7Jy4PVZG5rcyHyrF6ATXEvcALRm98hbPj1Exx6M3Xvo/VbGknyOsQPGutt+9WlvmD/XHCDEET63
	OAs6o2A+quhM7oxb/0YNz4dojCFHULZzLW6PC67T3OFZNo/gPkxglxY87yM3hHEXvvvkx+iet+Pxs
	2PlK74Eg5oaJkVwVCRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhh-0000000BHHG-3ms4;
	Tue, 12 Aug 2025 16:18:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullfy-0000000ARDx-1E67
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:52:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45994a72356so41709625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992332; x=1755597132; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RB0uz3KhCKwDWAd49C9Ih5QwxR0kHWB+azypPaZag0Y=;
        b=vjuuKsipldmEPtCHF2AAUnTlEURVfqkHMs1Vy1/yP4uYTN0TNeDlMvEAWkpwBraKF6
         kX8OfvHNbyS1rT+6C1MvMmuNGkVWVZ5MC7NxkmSGlVSfEK2hGHQTDVXPb34x61F9GZrS
         oBG68miEhgu9YFxp9M7kmVt+sTbU3nN0Ie2LyOgtqUGmrdG+HJadRYr8LKPX2YAXWo9o
         odc1Bk6LFSdxc5WzvNEcdwwvp0blCMdY1HlbG0YMwNmEZvSLjHY9YjrDtSIxYy34sZow
         TG2rdaoAvO/rfJ9xuL1yEGFtuWCR1DTe3rVdSP+GJRcMzBSFxlyC8dsLpn/hyqbBLYjn
         fqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992332; x=1755597132;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB0uz3KhCKwDWAd49C9Ih5QwxR0kHWB+azypPaZag0Y=;
        b=YVsCcyrM+zrGqt3fEoE2KfkWvJyss2W0NzfApAxpjjd5MM4U1oD+Sda8eEO7UThlD0
         9lRcWWIsFoC7/h43uBjRWGCkleg2wnFNNZ5We3GeUxSXu2r6yhadpChjuIJk7VL+cZIB
         cGGsUkAsr1uOAHJ1MvPq3LACZJmT/+lgNiGVYpONcRetH1qoahT0+HbVmRb5dQx4SkC6
         LOueAi/VDp7A8DCCdc9bx/FUU2F65qIsP03K8MxEhtE2SdAhC7AnuMonxE6O8Z70qkO2
         LITqkQt+6MPi3Se0UO/2AyvTDrhDUSRjRFR5q4puqzGgX08eQR34o67takv+T/lnvgQ9
         nnMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkcEPrU7nCX3Opa+Bg5Zj2I3/e7fzNOPB40+KBM4F+9PM1YSeEACxyZkAeJyDAyb/xBlgF9zI6C5Et5HC13bm1@lists.infradead.org
X-Gm-Message-State: AOJu0YyFDk8WNwjkE1CxuM5apzbcLLri7QvVd1ayJVvFt43aYsfq69+k
	qNUXWoYTKgA1UkJtvglDbU0RVpQsC5O9yzoQKI4NPGUS7n+EkMoSqAiTxGK8te6HcXQ=
X-Gm-Gg: ASbGncumbEtt3fbL5xsfX5EBfWRo12JGFtsOT9ATjyWAY7tEM3aSTeyfiG3DBcyhDyQ
	RDzc/vrmw0jah4HRB+xc9CUwpQjtvY3lDCJpCiF1dkog9SHwLfaP1wMLD28KcaOx6pfQ7E+ogqd
	HIO17L2o8qqFCg+/e83B2QNZDytZnUD6GylLSft7304p4Ugn53LpRN73RB37BDeHnEGFUfTWtL1
	+6NQzbK4nK73o7f/Uc7q+nWxKwi/oC2/q6h6AVVIR3FvZ7uSm8xiyZWWRdamid3mesu55uwvsfa
	6UjCHsg/kUvOjKcNUFuQYTMPcRcHAskkM//5NyS9I5KAO3GA6mUohfHOB4qzdGqa7o58txXdAhD
	/0qZkKnLps9EXCBQ=
X-Google-Smtp-Source: AGHT+IH3eIyt3nJktWsUpR2rtIuEOtr2r5n+aVM2Npgzbb588pn0LgFEddNRASkqSyELBdNKC2O6rg==
X-Received: by 2002:a05:600c:358a:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-45a138bb40bmr10760705e9.3.1754992332417;
        Tue, 12 Aug 2025 02:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
Date: Tue, 12 Aug 2025 11:51:57 +0200
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0Om2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyML3fSCzHzd3FwgAWYl5+eV6ZoZGZsamicbp6SZmygBdRYUpaZlVoB
 NjY6trQUAr2S982UAAAA=
X-Change-ID: 20250728-gpio-mmio-gpio-conv-623517c3df74
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=F4i1WoIbOr27g2E4zkKyu21uLi8iliLJPw08fn/pqu4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7BLkgGIqyWoUu3WVXqVHrRnFIT5ZstC4FCi
 C/2n2j8EniJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOwQAKCRARpy6gFHHX
 cvvHD/9Dfdy9g9z1jpIorWAGa5Qm0jhn9HoktvxvStWvOBPChhMiLufNHTDPFqZ329Y0vvkhuza
 SRf/2Diask/hwJhkZKgTTZlhweDLyt8vMaw7ObD46qB8sLXv6uT59qBwmdLOYFSAYQDeNW8aiLf
 C26Dia64u1oC/+ddxiKf/1TIzge47j4Yevu38YKhRn9jt+vjBLWojDxIQGkKOKxwyhVVM6mR7+V
 Tlng77GUWHZaHjNVdfCvIaxmkIIj/7feZRE94W5x8/ZyGJHwSl74LOM/1whmKeCm1G9stkUL2Ca
 ZrchpQh11IZ0aFsgrqCcnzY89fim2hHdPwSsqfyodrLc4VbYeDPGumnvw7W1k32PWES9YyFkwmG
 aP+z+n9mtH8U7gNWfTHZ1B1fBYfZt8mqOxuDQX15NBn65lm7jZAOmdiBAkvBxbI32aLFdKr5Z86
 V6eSxEcDlEyYJwBZGCyVmpXOPTCqWCVFU8uaZFONf104XhwC9WZCQD8eM3Oy/jO+nv1ttgfzSob
 yPIN/Pne4Soesp1BRY7hPKeX8iYnduIUlngRGM9JJ29v/sXBa42x2spiSsf5myl1IMIgqolzkPM
 p5T2HoJgQ08zcwQyxb+OmWqkEOkNFVdspJo3gQd05RZuLTtrtXeVbll1YztO6grYMrSddXcyqle
 6kyfg8u/BjC7ZVg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025214_577437_2F1572D9 
X-CRM114-Status: UNSURE (   9.56  )
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

This is the first round of GPIO driver conversions to using the
modernized variant of the gpio-mmio API.

While at it: sprinkle in some additional tweaks and refactoring.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (14):
      gpio: generic: provide to_gpio_generic_chip()
      gpio: generic: provide helpers for reading and writing registers
      gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
      gpio: ts4800: remove the unnecessary call to platform_set_drvdata()
      gpio: ts4800: use generic device properties
      gpio: ts4800: use dev_err_probe()
      gpio: ts4800: use new generic GPIO chip API
      gpio: loongson-64bit: use new generic GPIO chip API
      gpio: dwapb: use new generic GPIO chip API
      gpio: amdpt: use new generic GPIO chip API
      gpio: rda: use new generic GPIO chip API
      gpio: grgpio: use new generic GPIO chip API
      gpio: mpc8xxx: use new generic GPIO chip API
      gpio: ge: use new generic GPIO chip API

 drivers/gpio/gpio-amdpt.c          |  44 +++++-----
 drivers/gpio/gpio-dwapb.c          | 160 ++++++++++++++++++++-----------------
 drivers/gpio/gpio-ge.c             |  25 ++++--
 drivers/gpio/gpio-grgpio.c         |  87 ++++++++++----------
 drivers/gpio/gpio-hisi.c           |   3 +-
 drivers/gpio/gpio-loongson-64bit.c |  42 +++++-----
 drivers/gpio/gpio-mpc8xxx.c        | 102 +++++++++++++----------
 drivers/gpio/gpio-rda.c            |  35 ++++----
 drivers/gpio/gpio-ts4800.c         |  39 ++++-----
 include/linux/gpio/generic.h       |  37 +++++++++
 10 files changed, 337 insertions(+), 237 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250728-gpio-mmio-gpio-conv-623517c3df74

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


