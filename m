Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B275C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kfQbp+syyXkO/RHw4GNJukoFm6a9w8JqJKtPVgxdN5o=; b=wR7YFfe9u8vafR
	Gp5VcpV7nnZWSELUVwDaVUo3XcxdXz5Ior2fw/OFdwSH1HriQ1EhnpoppQ8qPw+hQVBFr4KcnbmlQ
	1uFfw0ksHvqvNxYVmJjAidjS2FwuwVxyF2Wfw4XVCA7tXmLMrZPkA8akUE3p/ysclr0l/6d5dy0RA
	JkDdNxyouc0l6O4YE1qw0P+g2cRtrw7MKU/cHvZY9HRNb7EJrvtmC5LWW1BX8eSKdNbEObELZuDhB
	ojnmpyoGYsA9DLGPLkVgSSXt6QEoU5ujWrFqi7zC6udJaBfNLmvi9JOpr7aj3uN88RqAkMPncsxEi
	Z+b5r3QLfFhS1XZ3ud9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UQM-00000009Upb-1Vlh;
	Wed, 23 Apr 2025 07:21:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKE-00000009TSc-48Jp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39c14016868so6037528f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 00:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392516; x=1745997316; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfQbp+syyXkO/RHw4GNJukoFm6a9w8JqJKtPVgxdN5o=;
        b=Rqxsaa00YQwURMFBZX5tCCeu9jHrqWfWG5kb93q2/0puiGUGQtNH6qqLh+W2uCyZB3
         81heo2ZVG1j1Ec3aXONseI7SceZQiKxwUHCzKnUIX/CWj5OwHQd5KKx0qcDYyFHmZvjc
         8PcTJGM9dPWJNrxoJT4JDMLK9Ryl3U6mtD1n9KwI3XmLkrONdxhQRM/eYkFu96qS9uuR
         vWpA/5xM7HjXQgfVbNF7R4FH40GYyp/E5svl0xpzFwN8OsLi4OqST0rv0FIiyeAJMUyW
         1KAMpZlY7+dIicPd9xvedtvg6Kg1VZ3bsrXNoUY6TYV2vkrdfku1P7dBqZ6YT87DO9jH
         4m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392516; x=1745997316;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfQbp+syyXkO/RHw4GNJukoFm6a9w8JqJKtPVgxdN5o=;
        b=FqVyaY9NElEL7akDbYuust681DJarsINMDPEa68VzoYnVBKgGXFlrg3MVtogz7FE1Y
         nggG5ZMtIEi3yoK8ulWrf6NwXqObI+vgmzYgM/QuJyuwwpQcZMoN8l8kyvjX8pBJXKfL
         q15vtASodttvYNbpmsxjip9z6/vLF/8a0yZyyjtp9pFJnVAslkgfRtv8fNHBoCNZC/pr
         7mok9RPR956qzFRwzenYYrckPmswBXgPF2A7lux20OsQ6mN57eKPluM1NFYgY8vaJ3XN
         XhTXW8f7g4eoyCaxwwjDNJMsLNl4bx9Oo0gYmpVJ2a4s44jCh/DyiTWHUXa0AnnXa1M1
         nR9w==
X-Forwarded-Encrypted: i=1; AJvYcCVX608axf6dShBAb/JNkDxXj9MTJnwq1BH1+tVnZDQ4FLcFiroJCJ77xkHXz09PBaklqWbYzq/0fPpD0jnhfwtS@lists.infradead.org
X-Gm-Message-State: AOJu0YxXcsiB3WDs9ngx1OWf9w67Riuztxn3ug6XNUutV8BwPrbfwSAS
	GYo6TEUjF1YKyyM5VT9CQ/vjQQlkT++VQHmZRs7euqDSk07KC9dL1SUOKG8p8eo=
X-Gm-Gg: ASbGncuhNKuhZ3vd8N3bfCYG6OAPobrBSkkRITp2QBfZ3B/lmSYUuxr3GA/vaCr13Zr
	gdeyfPBkzStVWgxiOC6rB3DsEgLJ/UMPCAGhbguUw579L1u+DdDbtisAsWjwm93i/VlmgVK9151
	wLOvR/sfoamSO4uWoj+FvtP0XqoZsvLFGJhy4E6YXyYKYpamtIrmGOHJcVclXtT/DnZR8u20CLm
	GbMzDeBDtrWvcFUXh51lo3y3tqhMU3FTkY/QzeAWF/J5UdowEnxgCIH6zMR3AAUh95hbpij2erB
	nepUiMmAwV5FwR6OF8NoFRgDrDqJEOAviYFLjIu3Wmot
X-Google-Smtp-Source: AGHT+IG+tJxvr2pB5uojdqPwlJlUoCOQYCF7lDXIVNF2nVM1sZvKoDsybtSZIIss18Pryk/S0Ef3fA==
X-Received: by 2002:a5d:588b:0:b0:391:45e9:face with SMTP id ffacd0b85a97d-39efbb0252emr14722584f8f.54.1745392516313;
        Wed, 23 Apr 2025 00:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 2 for v6.16
Date: Wed, 23 Apr 2025 09:15:02 +0200
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHaTCGgC/x3MPQqAMAwG0KtIZgM1+H8VcRD7qVm0pCKCeHeL4
 1veQxGmiNRnDxkujXrsCUWe0bxN+wpWn0zipHKlCK9Bj3nTwBEn2/Wbw2SncAPxtUNX+xaUgmB
 Y9P7zYXzfDxJIbI9sAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=P8T6A2RfhQi9cs8jlDhrwJia7IeYiHPIj6iHNUhHRRs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJN9PtDzo6pQhpJrIbuv3TgdhcsxmnoGxcbPW
 lRtYYU14zeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTfQAKCRARpy6gFHHX
 creZD/4wB84rig0XgfTyX7mc6x1ZYJw3YX7GCsmp8eACazubUCcNQBQO4dD9X2QWoeyiZr9sNj0
 kG9snhzeXa0Tvzh5T2gedGUErStlmEEtNkjAjWsaq9hswKDrmsuc/mKcA5qWrkhvkLhcc/Pbj12
 cpxHdFxDAASelR4triAIaQu18P1ZQp2Vj8paAhxBlPEaCPy8hUL0e4FYVMB1Fv6j4lrnLuw73xB
 Mokir5p0P2mOSlg7jZ1KDABtZMRJ3CPkcRtQNnaeOTtbw+iMAeR5G1DDptYOQFchClFJcz/xL3c
 GPMzwOimJLewFHGUaLNPOD++aD3pgcAdTPjwEFrbnawGcOeo9aVVaHTLh6A6y/5IzUup2dND530
 zgLyZAtdQ1aYqwT43bhc5q8GGZbwkhi44RrPiO6wbxV+nySlux9Qeik/KNe/sCId8qpryzVd1ZS
 eWLn8FftriS0QGv8+xltz/TLVnEDjrxdGBl/xTpUgFPtY9cEsdvhi/cOJu+CgO1aX6HcCbfRbOo
 DMzzTyiMPndixsvtLUQBW71OgMqChX+LF/Ti24nk6z4tzcBW1oeIArw4ew5oJv7DacVyy+DdDTi
 z2Oe6DeVscjg4pu7aChY2RpA1zzxwUS7QhJ3BDJZGw7UjNPoDfYoRHSX/kMd+8zwZFidXAVhwUI
 bR7t8EKz9jVunow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001519_171119_331AB181 
X-CRM114-Status: UNSURE (   8.46  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
another round of GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: imx-scu: don't check the GPIO range
      gpio: imx-scu: use lock guards
      gpio: imx-scu: destroy the mutex in detach path
      gpio: imx-scu: use new line value setter callbacks
      gpio: it87: use new line value setter callbacks
      gpio: janz-ttl: use new line value setter callbacks
      gpio: kempld: use new line value setter callbacks
      gpio: ljca: use new line value setter callbacks
      gpio: logicvc: use new line value setter callbacks
      gpio: loongson-64bit: use new line value setter callbacks
      gpio: loongson: use new line value setter callbacks
      gpio: lp3943: use new line value setter callbacks

 drivers/gpio/gpio-imx-scu.c        | 47 +++++++++++++++++---------------------
 drivers/gpio/gpio-it87.c           | 11 +++++----
 drivers/gpio/gpio-janz-ttl.c       |  6 +++--
 drivers/gpio/gpio-kempld.c         |  7 ++++--
 drivers/gpio/gpio-ljca.c           | 13 +++++++----
 drivers/gpio/gpio-logicvc.c        | 11 ++++-----
 drivers/gpio/gpio-loongson-64bit.c |  6 +++--
 drivers/gpio/gpio-loongson.c       |  8 ++++---
 drivers/gpio/gpio-lp3943.c         | 13 +++++++----
 9 files changed, 69 insertions(+), 53 deletions(-)
---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250422-gpiochip-set-rv-gpio-part2-7e2d60e96d8e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


