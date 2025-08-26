Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E235DCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RKCpxqsXSBWd5rXXvtS9KbFsw7XYgbeW+Y6mgnOOsQs=; b=vUByEL7+mZ2Jsf
	jJf5QEMp8g4fw0bdL9FNlIcht40WpSeMn8DWOUSFEJ50AiHoCHCS+8VUTlp9QsZRlLXkMEJIzeO+D
	/dhH4RVm6mR27c+bPAEvb7PVby9p8DL/xvksQ0TOYyakurepe7urWQ7IwqTnMZ6YpqqoV0mJqTEib
	8wOKZ2a9jaKAsGp+HHlW+j1lqSnV34oJi1yCyWnMOtD6QPmDv8JCNZvUd0nMd3p2Q68FX7WH6wWjR
	/2qmrSyRPQ5PQRjo2szXpLnq48eZ1xH+hAsISQ9UIutHIVyRJ7IRy6vaJRBJdCHwnoFQjPdiB3Ts6
	WaUaM0qd/LmpX5OkPfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrBT-0000000BfDH-1G0P;
	Tue, 26 Aug 2025 10:45:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqO4-0000000BVl0-3S6A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:54:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so33627605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202083; x=1756806883; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKCpxqsXSBWd5rXXvtS9KbFsw7XYgbeW+Y6mgnOOsQs=;
        b=sET0Pz6PO6zH0pH5QJm9V4/y6GAf/865nrCyDyHlVt/mWJ6OHdsRytBQL5TZNgR1D3
         ZDZKK1VqFcVdrjuYRxHQRL28E9YlJSovxbr0BrbDMQt7awy8fLOFdI6del8FPFAd6anJ
         gRLmVFAmJYLg7w1gW9kCwycrn33P0ae9jYsWS4uqNiY0AkV1eikZsKxvkeFPfPMdgpxu
         Bh5QPBIGNRAy/H2rt9vgrWXJCfvG3eRMe+SEkBLCk60Qm1PfsC9WU+dM4BDZ9Pmt0KzG
         EbfHQG1IjjfJQs6ZAOInc3jIUt0C8JhglBc0pg8utjzQ8rfaKvuTslWrsFM2WrCSNYkG
         J2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202083; x=1756806883;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKCpxqsXSBWd5rXXvtS9KbFsw7XYgbeW+Y6mgnOOsQs=;
        b=ZboyGhRaFa4UZCr+lGqflD8my25RFABG3qSPfcmyIfCW/MiNBo3Ibuf7LUWoublr2D
         gtBTzcW8uYMPfVxZY1WLM1+tjCj4FWngZ/uuYLw4Rne3c3NRtcvD/uk7uDXBip9k813p
         B+GMBQUFKwm/qsuqnWfdJiMRK/WcnGhKi8XoUKXEBD8QbruWXrPvhs/JRjlXLJ1QMeZz
         xQMDehi+pPBHxVoPgQ/kcsUPeFaVzzeLY2hAhGryd7QtFHfxV+hkJY/krEzffBqqe8on
         OUNZygxgQU4AF2YiqvZkji3jh0TLsyWHJMBTSeqGFkCgAamP2behXwOqts/k+4jXoLrZ
         fOsw==
X-Forwarded-Encrypted: i=1; AJvYcCWLC9rgTS8ja9fQQvw9Tz+93UrDfBYRn1Zic0f7xn3QqCbn5R/0nktEVFeEMu/kpN5BF5JLNVvaWHg5bCL11dlA@lists.infradead.org
X-Gm-Message-State: AOJu0YwwONiNDL7cbyuUV9j6phhaRPORecOgae12e9XLwxeSDHyQVKkK
	57oLRGZspfpILa0nnoxJESfgIySYo9SvnYJK4NcgH/SPloH/m/7epD6sRK7/4jtfmXA=
X-Gm-Gg: ASbGncu1dQ7usz/zzvJ/V445n3JCh7C/bh5Po+aLZFUrUBFLd8U7T01Cq5AnWODW8Rh
	wnETOmSQKKLOAPHcQKFCQZTvpHy7qS5EKoARPxm2dVMkL9asYCWQEchcTIO4yMSoIQ87ZQZvDlW
	dEvX1WuZwEd1CL3elaf4EWKfAT+ZmS9YtFPI6hmZaRhsgEY/Z8OJvnDzTKOgSmwWExQOdksQ7/c
	Yn0pZDIwKtKfoZ0QTniqj8w6hTbXj/mybpu94XUQW8nwWCWt6jQpHVReK45V+KmNxtlupHgsDwj
	y9IbIB0P/4WC8NoEW3xZhYWT9IB+xX1XpA50BPR9JQ2t+m1U6Hboo8ruqDArMJxIDyfiHgV7ald
	dZMBHJcw2n5ykTlsoBY+koxdpeH4a
X-Google-Smtp-Source: AGHT+IG+25ORqjof2ATwzWOqh5zMg6Fps3s9la097lt+3O2I/uIH0JvNAAkPT5A+WwcwcTlymgdPXQ==
X-Received: by 2002:a05:600c:45cd:b0:458:c045:ee99 with SMTP id 5b1f17b1804b1-45b517d4562mr118379285e9.28.1756202082873;
        Tue, 26 Aug 2025 02:54:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:54:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/6] gpio: remove references to gpio_chip::base from
 debugfs callbacks
Date: Tue, 26 Aug 2025 11:54:34 +0200
Message-Id: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFqErWgC/x3MQQqAIBBA0avErBvQQsquEi20JptNigMVSHdPW
 r7F/wWEMpPA1BTIdLFwPCt028B6uDMQ8lYNneqMGrXBkDji5gPKEW/0Tgjd0PvRKL1bZ6GGKdP
 Ozz+dl/f9ALZCNeNkAAAA
X-Change-ID: 20250815-gpio-dbg-show-base-a73b8501f9a9
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Gn/lKg9DW9+7A7NG/Xm8HI1PObyZ8u17xB6xLp+6Zns=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRdOrntH6xLuqY0RG6LOlTXHAItfAvEs25aM
 ASHA1ZZdbOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EXQAKCRARpy6gFHHX
 cmEtD/9Kspk5oVvRCV8qA4ZGfkv7SpRDLcPGj8xu9wBbaIAEc3SFVsuf56Fk5ofc3w3SsJTnhYr
 mXtMgsAOjRgswZA0xPsP1/YIRGwVdmHNBywk+6bhKaUz8+sTSyL3+vQ+IBPQ8NN11dV1IdkgrLu
 7ch/JoZCDM5HVPLziqdmKKyg2P4IOD1McVr1lXvvjQsKp8yBkyB3LDCOqb5TSb/D6jVQEsQ8X2B
 PqQGvNnB1Mi7f4vwP8MrjNyzfwQsk0g24n1Hp2RLCzM4ovP5DO2jmHKWP3GIi9bJgmG3ADgZeo9
 aYZaf0S59RIUz49NIZSjizww7qHTJtVtvWuNsIQVxkUn+6B25mzkZ+lRo+SrPjwKOIdjy/ocfuz
 0iHNyDod57+ptCo48ED1p2U4pNrMnkf/oSZKWFjGyt5BUniAqdss1bcCDOB12acGAd3Y7fnf753
 2WJjitNAWknKwpilmOMpnqK+RLI1FEffx/OITVlWPCOrSkBdYDGYyWBuMxyouSP8O3wqA/JlrXC
 6SuzAVXLdAzBMTP9jYXOjq7ZLUntsdCjCIFtG5C9lILvgvK5UgXEN8t+YrqX0sPkkkshhT2hUhh
 N5+rsep5nGITtAFlSSOOFWcmJW1x9smqqTHgh0wpaYusTUyCDuJ6CFpj1ZCHWmxmNsjBWvwnvda
 JoUY+IbaNQ/gW0Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025444_867916_64C6238A 
X-CRM114-Status: UNSURE (   8.17  )
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

We've stopped displaying the global GPIO numbers from core GPIOLIB
debugfs callbacks. Start dropping it from drivers too.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (6):
      gpio: stmpe: don't print out global GPIO numbers in debugfs callbacks
      gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks
      gpio: wm831x: don't print out global GPIO numbers in debugfs callbacks
      gpio: wm8994: don't print out global GPIO numbers in debugfs callbacks
      gpio: mvebu: don't print out global GPIO numbers in debugfs callbacks
      gpio: xra1403: don't print out global GPIO numbers in debugfs callbacks

 drivers/gpio/gpio-mvebu.c                 |  2 +-
 drivers/gpio/gpio-nomadik.c               | 25 ++++++++++++-------------
 drivers/gpio/gpio-stmpe.c                 | 14 ++++++--------
 drivers/gpio/gpio-wm831x.c                |  5 ++---
 drivers/gpio/gpio-wm8994.c                |  6 ++----
 drivers/gpio/gpio-xra1403.c               |  3 +--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c |  2 +-
 include/linux/gpio/gpio-nomadik.h         |  3 +--
 8 files changed, 26 insertions(+), 34 deletions(-)
---
base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
change-id: 20250815-gpio-dbg-show-base-a73b8501f9a9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


