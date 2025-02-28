Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBC9C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xhLZqgcaujiFhw9G1dCH5p0FiLmGyvslkaMt4uwl9Do=; b=W4AxzW7Gf3v1nk
	4lYFndhHWAcZH7Jrbgf92nCBwkqep8UXg9LVowecgxS1N0kFg2Y87txjAg6AHTbrvsVaoAZoeftTu
	/mO/ur1W8GGAoB4PlrVYWBZg5+jT2qce+L/w8V9xWA2BHZKrIwsbehVFu502aQCU5MaX6EdvTsEBS
	tcbFHXYvHF37s1jdVI+ovPt3wUPIsjq3FjvQExlpuLA0vEhKjIuebOX1IXu7TIJbjvDqv+A4Gx2u/
	NcxnXSFcS/oShjyAuONkCXjE4vMmbgDlerzLZSIFZWpk3gsp+f+6OEIjN2KIrtYSsZShC26z7Wi8y
	FsFbVOhTIOV4UDkZkKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to13D-0000000BBl5-0ZWn;
	Fri, 28 Feb 2025 14:09:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11P-0000000BB32-3OTh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:25 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5dec817f453so3274417a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751642; x=1741356442; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhLZqgcaujiFhw9G1dCH5p0FiLmGyvslkaMt4uwl9Do=;
        b=YCveMr2crzPRsU0zjO5QqERVT3ZajubiPM3jVF0/CdFyMtwVUcF3vLdR6TMm9N9kTJ
         gmk6wYBvLVzlTuICtJq3DflifGp8bW0ZRZVqEbjNxbWfvcARSyx8b9nK3uWDKSrSmyfW
         b1qR8geKeAoA1+P8Iy4K1okVWHgCX53P/OvM8dZsqX0ud8uI1oP8GDtkqjwTWIKtCGN3
         TZ6a2jaAa3vE576HpypAgRqoYAkMbQ8Nceb0RJnI0V1hw+6ap1e7PUHBfBELj2AFMzzG
         G5ZLfvxR74qMg1qQjPpTWyrXArCDPyYFu5/sAMSuVju6S3hCVoz5P+WyL2NCL2YLY4+y
         wTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751642; x=1741356442;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhLZqgcaujiFhw9G1dCH5p0FiLmGyvslkaMt4uwl9Do=;
        b=jieJ5s+6JkIvDeFisXfd03chDuInQycYiJD5xhDjWeMBHVSsoe+TUJzEEe0S9c5/i5
         C1rvp1YKeAR9sWnWJVZu35Z7+zKms8OimFLIu6Viv1crIY/sn42uh/cCvAyfhwDXy1fa
         tS9JmUpzNg9JjusLdM9beQwXAMUr665U/mVsipwOug6nSCN/sKq7m2FCmfqA//fM+t6N
         C3QBhxclPLf9MKh+dA4oR9a3K9FA6T3gr8+1xw1mG4CifrvNoXeznME/98C5KiS7HqkF
         t7qoHxHRUmcrCjQY65R468Agp+H6zlW+3CuPpPkNrTk/kJ6OsvoOeQgL0l5SWob1iAAc
         Ncnw==
X-Forwarded-Encrypted: i=1; AJvYcCXSvF2wfUVLvtJhJ87+EmS8fVsfQEKRBvj3WkkIUWx4VXqqT/55dvjRGCuj3x1jjhMQJDP/h2fDIUcwr6pBgSy/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3YlGVJy9cDaUVRH+rhZ5uAntyy3NEt7rRUHQ9MqyhpQnzhITM
	b0FNvwuDnlXbZwWGPzwrWmmBOr942ltnRN/CN9HTent8yW18YWMoqTM70YcEvmw=
X-Gm-Gg: ASbGncuJGbE0JuHRXyriqBAMvucT2068TCMOY/hxLEwI3+XRhS7MkE06kb9qsBHzhAO
	CUhezHuDqt+9h6SpSKsKOVXY3Je1kR0UBzNTvFkUkM/2oCRJcE5ZOcEzTz6wUabXUy/oVTcTc4b
	CaL5d6PQnGbfDk+d0POStry12o+CkZEyzmqOcModVwrNEtloM1mmAyw+i0sYQmPeDj+9+3FlRnq
	ntfTwhTy+6Gc1EecrN2wnUbtTb/h9M5/9dCVwfkTIh1tfQV8m20Rqeii3wz96LN0qDnbqiCvlA1
	0MYoUNlxjY1JhDwJd6XYoGKjWmAyUdtABHist2P/KJw9byYho44Vi8xnC4MOjh4yOu4738FTTEW
	27Abd6tZiNQ==
X-Google-Smtp-Source: AGHT+IHP7pUAJMVQB1Guj47dyI47K7YXQj82SFh5z5QQxgHATc6r4NQ1/TjLpJM/Ncf+/B2eBWDZ7w==
X-Received: by 2002:a05:6402:5242:b0:5e4:cfb0:f667 with SMTP id 4fb4d7f45d1cf-5e4d6b691d6mr2481074a12.21.1740751641613;
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 00/18] a few rtc driver cleanups
Date: Fri, 28 Feb 2025 14:07:13 +0000
Message-Id: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABHDwWcC/x3MQQqAIBBA0avIrBN0SoiuEi3MphoIE60IxLsnL
 d/i/wyJIlOCQWSI9HDi01foRoDbrd9I8lINqNAoxF7Gy0l3kPV3SFKjU7PR2JLtoCYh0srvvxu
 nUj6cRcJTXgAAAA==
X-Change-ID: 20250228-rtc-cleanups-12c0b5123ea4
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060723_846347_73E9C675 
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

Hi,

While looking at RTC, I noticed that various drivers are keeping
pointers to data that they're not using themselves throughout their
lifetime.

So I took the liberty to drop these pointers and this series is the
result.

The last two patches also convert two drivers to using dev_err_probe(),
as I looked slightly closer into those two. They don't exactly fit the
general subject of removal of unneeded pointers, but I wanted to share
them anyway, since they're ready.

All of this was compile-tested only.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (18):
      rtc: max77686: drop needless struct max77686_rtc_info::rtc member
      rtc: s5m: drop needless struct s5m_rtc_info::i2c member
      rtc: aspeed: drop needless struct aspeed_rtc::rtc_dev member
      rtc: ds2404: drop needless struct ds2404::rtc member
      rtc: ep93xx: drop needless struct ep93xx_rtc::rtc member
      rtc: ftrtc010: drop needless struct ftrtc010_rtc::rtc_dev member
      rtc: m48t86: drop needless struct m48t86_rtc_info::rtc member
      rtc: meson: drop needless struct meson_rtc::rtc member
      rtc: meson-vrtc: drop needless struct meson_vrtc_data::rtc member
      rtc: pl030: drop needless struct pl030_rtc::rtc member
      rtc: rx8581: drop needless struct rx8581::rtc member
      rtc: s35390a: drop needless struct s35390a::rtc member
      rtc: sd2405al: drop needless struct sd2405al::rtc member
      rtc: sd3078: drop needless struct sd3078::rtc member
      rtc: rx8581: drop needless struct rx8581
      rtc: sd3078: drop needless struct sd3078
      rtc: max77686: use dev_err_probe() where appropriate
      rtc: s5m: convert to dev_err_probe() where appropriate

 drivers/rtc/rtc-aspeed.c     | 16 ++++-----
 drivers/rtc/rtc-ds2404.c     | 14 ++++----
 drivers/rtc/rtc-ep93xx.c     | 16 ++++-----
 drivers/rtc/rtc-ftrtc010.c   | 17 +++++----
 drivers/rtc/rtc-m48t86.c     | 14 ++++----
 drivers/rtc/rtc-max77686.c   | 37 +++++++++----------
 drivers/rtc/rtc-meson-vrtc.c | 12 +++----
 drivers/rtc/rtc-meson.c      | 16 ++++-----
 drivers/rtc/rtc-pl030.c      | 14 ++++----
 drivers/rtc/rtc-rx8581.c     | 85 +++++++++++++++++++-------------------------
 drivers/rtc/rtc-s35390a.c    | 22 ++++++------
 drivers/rtc/rtc-s5m.c        | 58 +++++++++++++-----------------
 drivers/rtc/rtc-sd2405al.c   | 16 ++++-----
 drivers/rtc/rtc-sd3078.c     | 71 +++++++++++++++---------------------
 14 files changed, 183 insertions(+), 225 deletions(-)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250228-rtc-cleanups-12c0b5123ea4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


