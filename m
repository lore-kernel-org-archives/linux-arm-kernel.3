Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E67C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eptxpJ0Yx0wWZW9/nNNpkoZdSzIonCkt4KahodklTGQ=; b=AKVjtMfnMy6Mvj
	SDWGQEALVQtKTrmqt0fK8HnNLEB9uolp0vziJj4xkFCCU6T9C79jLWC5Ot7kcsQE2i06vVHKAWSu4
	AOAy409br8sm3RsvJjlR06Gajuf/JmnmFd9rrSeF4y7kXtiD/hb+SV4e617Gdnc63rLaEuYjyhXQQ
	j39jeFpNgyoqlpMIEkCh41iofsIsd1/PjJuQqBAhxC2PK6BfCiso0Dg6p0QgwRJSat7qiCVGTZN/B
	Rp8P3gOYeupEdPDG9TnWf6lReZZlemLXS+FUbZ2az+nBXw1V2ZF2XN5hrkIDjvrfDPxYLWTC6FR76
	qx8mlSla958fIPualdjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrl5-0000000BM3m-3Kke;
	Tue, 12 Aug 2025 16:21:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulns4-0000000Aexe-2vK8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:12:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so49503565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000771; x=1755605571; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eptxpJ0Yx0wWZW9/nNNpkoZdSzIonCkt4KahodklTGQ=;
        b=mTIJUlcsw7yHwH+x7tIzxNc76Iez3t435YnCSu7ec17nHUHg59gjF+td13b0ipX45O
         3oANCFVFymo7Xf0VXabaxXdWoC0WzqmWAOOBJTkwyAS+W0LQDx+w0GUq8FXSOtgJ3bma
         iBuXhoRUcZmLCTZwItMBjEJW9riLzSHgbkOATHSgrhU37PKZINWqndt1EEqxJPb0hVbG
         qA0+HkXmXgvngKIW0yToV4mZO5xSqbin1+NdojNeJeIqA6UuAuIXQPbuxooluYXiTQ9V
         h/BUsPF7h1QU4DhjMOHMH/SO+4aw6kNtbwkPaQ5GZ5Ss6ZJlusf1MkgBEJpfWNFEtAGR
         Shzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000771; x=1755605571;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eptxpJ0Yx0wWZW9/nNNpkoZdSzIonCkt4KahodklTGQ=;
        b=Fe/TxBFU1A02Eq6gy9SmqajV8towGeSItCqBqazxo18NIS8yHc3qneMH1SS2wWXREd
         bpu9uebKzAwPrSb/sBh/h7E4zhLmWS3+BBHnbQle8TjIjYsOadhgW/HfFYguiaLCsXy6
         bJCoa/6PnfBDDl+HxRUCmXbwWdJFqDo/JIM8sgvpRc16igKiYKeRD69SdXQc+EoVORTd
         1eQwdP/PRCi5rFISjr3Smt+mf3pzBgKQQwkhuMNA/OlhMw1HzynEluXOiOtzh0AHaNWt
         KRXoPf401lGNPNxCtKpxulItYfGI8f4BnVMfC73396PAQmfoTmMpBSY44deXPNxJ7TwW
         wFlA==
X-Forwarded-Encrypted: i=1; AJvYcCXzV3kJN8sI7dgw6HTBurdBrWH3faAcgimkvGIBkBkaP2cgGfj/lYn1+UEsLqCXE49uu6biCKjvOsGIsukDVsa/@lists.infradead.org
X-Gm-Message-State: AOJu0YyWc56jA60rChNBi5gcjwDtvC2l3v7uiczo6sW1XHCrkiCLrcJj
	UvMiKnDno1DgKHlekhd8nJmkpkrLER+xg7I+zqoET2fcyDLzf/SLxIhMU8a+KONG0nw=
X-Gm-Gg: ASbGnctg67GplN50vVYG1DzBgOYwcd/eeQkJLwybBhMHye8Y25DD+3t3wM3vOJhozn4
	XjjcrV+4ORuwrUAepRTI2jTuJg1yiT44+6EkUHJPqDmDm6/fl8vuFI2p6lHCIaFL9QsfdK761gO
	dWy+KC87A61lBnCGf6yEN8gtkos14SQObuON5a+QCGPq2eLnD1710kyMbSrM8P45S7OdAc3aWIC
	GzTYqvKE+Wjzx+RSbqqwH5dX7IXeDdfQNYpBWEOfeHP7gUaCdCUj6PxOfUKUpASfEnILbeAqPmi
	PnV62wuS1+i+zYCWEYE+PoA71fvvfEGciX6VAhHIf1OAx5BeZaV1PJ5hhgoiPYThG8vsRabGZae
	Ps30cRv1hikotMWI=
X-Google-Smtp-Source: AGHT+IGrKlosN22orMav7f+vJj0S00uwK1i7LZju2ODkMixHCeR7FanAHC/Iu6OLgDLOv4uYkqeKQg==
X-Received: by 2002:a05:600c:524a:b0:456:1204:e7e6 with SMTP id 5b1f17b1804b1-459f4f517dbmr134199135e9.11.1755000770984;
        Tue, 12 Aug 2025 05:12:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RESEND 00/14] gpio: replace legacy bgpio_init() with its
 modernized alternative
Date: Tue, 12 Aug 2025 14:12:42 +0200
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALovm2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyML3fSCzHzd3FwgAWYl5+eV6ZoZGZsamicbp6SZmygBdRYUpaZlVoB
 NjVYKcg129XNRiq2tBQA5H9IJbQAAAA==
X-Change-ID: 20250728-gpio-mmio-gpio-conv-623517c3df74
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ufruTN/rsMjpZogkg1bX/2fwukSGxpr2NY77MLQ1ScE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy++n89pg/9ESyGDJ0sRR4xk/Cmg/ARiF1xR9
 QgmE1/ouKWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvvgAKCRARpy6gFHHX
 cjOxEACZJpWWPGUL9CfHiHTHVE1TDp9GRb5oraK1gn34WFUDtudWF/KwjDYDi1lguczQxt+c7Dd
 IqnXpHRgrc8ncZmbUskDlzhu54x85mdlun89rTwhTrS0Y3bVQcGyagxVBep4QkzBoCOvdzeWbgi
 9jBraop/CGfr8bbZc96GBP4A1eyAdt6zINaWqHZOWG90ylNJWRAacUiWAVedcG9X/gA2+eX7tnr
 yTF1LmdMVJjAubARxEO5T4/lgevQtBxvlUtNqRoI5IK9vk8wG6l457u4JPHby2jMYoNfrsjZttO
 KSaRdBBT5VzDKOJxcysnZkTvww0zewKCemWKXsF9MFDb5znPOjg9824NKyw4JB51Fc9aRa++JUm
 qbvsQq5skDcO1O+8L5ghkDriXZaHeYxOFnFlDjrax63RTwb7V71bksIhrdcjsf/r/pxy7o/5/nZ
 rXvn6JM9dDW7NavxZSoA9cfPg/7mftwO6rfrGdUOoh2IQye4X/3JLo5Gy2hp4kau1fSPH+GrSz0
 1bPijJE+EwbMLxdmUmse9dB+Mv8FYgEQlQhmqijTAL4KC2cnURSWoMMzvInCJ/y0fPkfJI0mDXS
 FfN6KDFWdmXgI50RWaslZYkunzL191aZUv4ZQNGjUawpagr7W/s5nlQKNDo0q8ua5lcCKC33OtM
 NnksUq3oJlC07aw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051252_842792_22D22E14 
X-CRM114-Status: UNSURE (   9.90  )
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

I hit a network error when sending for the first one, retrying now.

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


