Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869C4C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dJOUAJfKVX2aPL9IEMk2+/CliU7l5+z7z5St/kFtJDA=; b=Iu1LxfQw+DoMxx
	veft67bUuA5PM+7nbwf1td2bEhvVUzDRNy7yTz9QNMOIWw+TrqAzuuha4mHec2WfNn0nKMCTH+fSb
	QSBEoLqiH9w46JLe6r9VB6tRIISyJlc5gKu2VqjEpjc07diI3JxbcKvBdbhj9+NSafrbETdJw3s+r
	W+Hvza8BzPZpKrVG+09dh7XaHbgcLBCsRDUN2x+P6bpmHlhBOpDvEvk328qeURQjkLaLWgRcdYuPH
	CItVAZzCV/0rQwz3e+42Lrt8rGf1W1b8i1uQHKFLZyafIilQOm1IzV7IcWby0JERrhBsBjixMfaxZ
	BZmcAmiFKzMmqPnClQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtvH-00000007nc6-1Z2z;
	Wed, 02 Jul 2025 09:38:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtfU-00000007ka4-18Vx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:22:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so3864128f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448135; x=1752052935; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJOUAJfKVX2aPL9IEMk2+/CliU7l5+z7z5St/kFtJDA=;
        b=P1YG0Zo1bzf9OHmk6hCwkNEQo9nfxq8O851VAIdvDbmLHZdbatIMJTigGRqbCmtJsO
         UzJmEQXluPawPSckwyy/wqkAkbEyGCTBWZc954PDdNHbIg9ksfpGuGnmzuENlaAc5UwA
         kSwxV59lhzLg45uv2ibuiATtvyJl6vReWonlXdUWNdDYWOApEkeFOFXc1NbPIFg3c3MS
         H98cSnyFpaBaDZE+G5H4GYBYzFFWOC7a4WeiSaHlx7xOXiezE1XAkQ9aY+1BynzvZ8A6
         yConil5QliwFX7a8JiibzPGXOpK7WJadtHaceXizWwxM+tPMhsojwazyWf5FJMHCvhrW
         lAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448135; x=1752052935;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJOUAJfKVX2aPL9IEMk2+/CliU7l5+z7z5St/kFtJDA=;
        b=c7wg9/8DaGNDBajVxEVfHUOI2ggG79AuPy7CQf38uMuYmCaPDpizme0zSo7F7TyrIJ
         mXRjqqTDyLgPnjSA7fX77XjmNTBRvOAmrzOEv0Nzjm11uZEHlG5Xs48ZE75BRfTFN14W
         0jvKZrzZOuJHuTFD5teU7ym/SsCW8RymucbJlOpbOdjqnfEBrMcZM5VmLY+KwQdXyKze
         aQZTFCOyP9wbo9MN7SLqWkZWprFmYRiYSczceJPvEPww2apMir6mZB8+XidVsHTa7MpP
         OOzK9MMw1lGA23Q3ZpWLDGKfVeZNZMse9m1pxCtzIUE++V5+SyopCE2gdDgL5X5rHeoQ
         u1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhnNgtvb04Emz3xiw4a+BqQ1kBrgD7BsTqDgz9YxKmns1gNsC0slvTMwxtJIjp+2j9zt4hVyXMdG0NynXhTytX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk2s8KCmtw/9oSMnR/ZVmUgle69Ujh80pP7Rp5hRI1nhRQaA8z
	O931g15HxagyvtVfIhHvSBnDMdIkmuGMPhsXQHT9dN4k4P8bywV6nc80z4FhKserbv4JKinV27V
	NbO61xUU=
X-Gm-Gg: ASbGncuBkk4PzetlpRtRrmIBKlYJgQ1JGnKjtFhhcBLHKhiCJeSNf9SJqp+0qUovznQ
	pfEC6Pib+Ufiu6bKMxOeGV4T3rVBgMSYtUqFmsLwZyykRlVn14WiW3YZmHIOdNDyth39tBka6Rw
	DwJhKI6/KAXR4kjAzdl26m0H0z+xPQJ9QF232t9PRvBiucM1p9yk7p4FYEoBCy2lcJuobuL7ma+
	ZeZp21VOWfb7XJsEkfMk79mxHfz6r07HVl/S0viKS4uf0Mz1BPlSvrWyOnFRQSMTCrgzT2c5UGB
	S7A8VdqRvFWx1e5MS5rGwA1Y8mkC4Ndu5PTKaNEm26ZuPzexAMYvtfFYTA01l93S
X-Google-Smtp-Source: AGHT+IGRtI5EizlyYaagGIEM5B9cIXG2G3RtfcUDuM69KE2zVYdf1i0pFG68QB2VU8jMhrLhfO7HYA==
X-Received: by 2002:a05:6000:188c:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3b1fdf01fedmr1581155f8f.5.1751448134571;
        Wed, 02 Jul 2025 02:22:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/8] gpio: move generic GPIO chip fields out of the
 top-level gpio_chip struct
Date: Wed, 02 Jul 2025 11:22:07 +0200
Message-Id: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/6ZGgC/2WNwQ6CMBBEf4Xs2ZqyAhFP/IfhsIGlbBRKtgY1p
 P9uJd68TPImmTcbBFbhAJdsA+VVgvg5AR4y6EaaHRvpEwNaLG1lK+MW8WaaUig/vd4M4VB0xak
 mqitIs0V5kNeuvLaJRwkPr+/9Yc2/7U+Gxb9szY01xJQj2rrH8tzcZSb1R68O2hjjB2ELMa+xA
 AAA
X-Change-ID: 20250606-gpio-mmio-rework-a2f4c439aa96
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=IDsUBmMl4vmxwpChddfz/0o/3m8yos2rsQrr3srBtqw=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhk+kPIvzlcY34zkh2Nj4PaZstktliKWBcYWZ3+v8XzOCbDD
 IkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoZPpDAAoJEBGnLqAUcddyvM8QALht
 p+0/5kj0hAd1GH7XCSJQj1xtclo+EbYwl+bIW4Ppol5rzy/Ww+YmiN7UfX/LQmQM81ByNclCOk8
 8yVuwOiCUfYJuB5mKWYrWLwiGZCFX18PXJaf2eDjbSuGXxBAaq6sv5p6gWUjzkmKXGd3R1j38FN
 2MP84vl/De+q+j+gS7qOICkoFnew3ASVw+Sehu5b9KiRNdNyC3RyESwRBvE+rSiB/SxJWGVmRZQ
 Vd9BDYTEglata0+NQUyij9ENWct0NzUdygyVwa6a+M5y/OfxRgVizsGIUuKPJh42tXK+7eENAaK
 lTDM+bpEsrkroP/o32TIo2RazbpVv+To7qR17XNdfdoWNiqonSruJF16yPfZ6l4mxaLX9vQB//G
 voAf3FRniA6ym8jCePwxqGGGX0mJL29lHxiMCItsnkBLbZKbQhTGq4+VaLcletzTe9Ydtw+1bE4
 skQO84IjV4PI71bOpfgrvkBRksQGm6k0+urSfW9uzq0q4FZG+yjdZinvNUniWeC6qByqdtnilQU
 LPZ4zjnM6y8hiw92JS8Y3Xfo26+SY+49p7fL2tBZgRwAIJGe9eH7aaKFgcJB1OSccqGFDWIibKV
 27KSY1CtQxooxZ/ZU8T2Lq+5lDJ+omh7OW8vD0sPCBItzUdDE/8lq9GMhFs/KZhZWVHmS9EapOa
 xcgFa
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_022216_318602_8C917ED6 
X-CRM114-Status: GOOD (  14.47  )
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

The conversion of GPIO drivers to using the new line value setters is
moving nicely along and we're on track to have all the existing
providers converted upstream after the next merge window. There's
another piece of technical debt that bothers me - the fact that struct
gpio_chip contains a bunch of fields that are only relevant to the
generic GPIO chip implementation from gpio-mmio.c.

Let's work towards moving them out of struct gpio_chip and into their
own struct gpio_generic_chip. Doing this in a single series would
require some ~40 commits which is way too many to review at a time.
There are also users of gpio-mmio under drivers/pinctrl/ and
drivers/mfd/ which would require cross-subsystem merges. I think it's
better to do this in stages over 3 release cycles. This series adds a
new API for gpio-mmio users, hiding the implementation details and
converts the first set of GPIO drivers. Once upstream, we'll convert all
remaining users and once that's done, we'll move all the
gpio-mmio-specific fields to the new structure, convert the internals to
using them and remove bgpio_init(). The last step will be done in a
backward-compatible way, not affecting the users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- rebase on top of recent driver changes
- pick up review tags
- Link to v1: https://lore.kernel.org/r/20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org

---
Bartosz Golaszewski (8):
      gpio: generic: add new generic GPIO chip API
      gpio: mxc: use lock guards for the generic GPIO chip lock
      gpio: mxc: use new generic GPIO chip API
      gpio: clps711x: use new generic GPIO chip API
      gpio: cadence: use lock guards
      gpio: cadence: use new generic GPIO chip API
      gpio: 74xx-mmio: use new generic GPIO chip API
      gpio: en7523: use new generic GPIO chip API

 drivers/gpio/gpio-74xx-mmio.c |  32 +++++------
 drivers/gpio/gpio-cadence.c   |  60 ++++++++++-----------
 drivers/gpio/gpio-clps711x.c  |  27 ++++++----
 drivers/gpio/gpio-en7523.c    |  36 ++++++-------
 drivers/gpio/gpio-mxc.c       |  87 +++++++++++++++---------------
 include/linux/gpio/generic.h  | 120 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 243 insertions(+), 119 deletions(-)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250606-gpio-mmio-rework-a2f4c439aa96

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


