Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71208C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lRThQzopGYDbJfG1tnSg9IzEGu5vhLjPPN98tQDLnw4=; b=f/uBVJndXKpgYA
	OJu2+2+aF4nS34otSxZ/CvRj3QY6rLzInrbuiw2deIU15icH+S3gqGGjBL76ZY6Cb1CXKg1IYM4Vz
	E+1SgOuiNbGNM5LD5y58PkbaY7+QN/FWgh1Wj19B6wsRX/Jkyn1VcxBUK1kNhCiJOe+TuB4H1CNTD
	U6mP76I9+T9ccox1SQMwSjjuyd9nWuLgZHxYRnQB9m/NoNHeqmWfODBvlBBzeHNKC+yU8sUMLlF5F
	lhCldn8gQFl/gX9FPeAyX2zHvxS02YfvOaXtoJ7QZYOnmRWZjLK0Gi3tJHrbkc8gOOld3JZLoEHBx
	fl33I6BK6GxZMk0rqbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOeb-00000007jFm-39Wv;
	Wed, 09 Jul 2025 06:51:41 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVU-00000007h4L-1X0a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-453398e90e9so37318235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043334; x=1752648134; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRThQzopGYDbJfG1tnSg9IzEGu5vhLjPPN98tQDLnw4=;
        b=SQoZyJcZRqWfn7XL3OASbZjA2anTxiBoNvNboZ2bRiJ+gl5QpPHv6BKHcbWyX5z2hu
         vlQsiDHL3GLLzKb28gr7BOaTtpzY2BfO+CeVE0oKaw2b+0LojVjZ4LpqjwQ4bXRciJhd
         AizBoaK1joUq4yTXQdRdWvoJ7g+azn+qxKCZ0Bsv8giAOcxjHZ63Vxg2UUxuMG+T1k0U
         4eD47X6DlEZ4VF552UTt9vBXgfL+EZYoxwx0paH4fbkC/bGhq8YqC5Agoq+x8WpoMYAh
         307X5HV5bpueTsvP21UsV9/gzjA6CH4dEHJpbPbvLj5sqwXc0lChN/xkLxzwabn3Oyk/
         P9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043334; x=1752648134;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRThQzopGYDbJfG1tnSg9IzEGu5vhLjPPN98tQDLnw4=;
        b=m7bFfn07S75UCPkXYZzkyewu7SekeraYnDhqHKZUkn6WihgwAzQ8Vmr+wHHBdjKaTx
         5EYdOwGscQ6wMldtr60MPj5KT74sFhh2+Q0etGWTyiioGh/umbAbbGqo/0Idp0h4Cqyi
         dkdYrpGlP76W4Vc/t73xLoZGkhGXnd7vvZ0xs6DFJLRrngMXuU45INk0SNVYNRaXupnp
         FP2dneBG55Wd2I6G8BMCzzyybrQEwth41HqvdwQZa3cyTLLoF7qlmGf5Zu6ucOCYflFK
         KmOUjE0jiKzP+cQzj0n5E0UACWvLz0mYqB5pueEIoPiiZgqVU29i+A8hGGtEuQDne8EO
         PAlg==
X-Forwarded-Encrypted: i=1; AJvYcCVMIRWYN3ZtqH4e1TqG0QJLG9a1i7KcJ29ZVDY/XPAS208yGWOdhQQHG4nKQ6+E569pjtlUbvtHwzz9h5pNn2OA@lists.infradead.org
X-Gm-Message-State: AOJu0YxYcUSgHVy7M/cwVXeiS6ty7+NKqppBV5LRiWF1J0Y5ISvnFoYR
	Mp5KuYy+akBahG0d9R47jfk2xddZcYAiZrqEipT/V1ZsN2/PMy7fP1pPRYyWV0AJK5c=
X-Gm-Gg: ASbGncsHDqakcnDh93xNcnLbamowG4G3QZxSIar+FdrvLr2a1bwdX85/GUBrWeZpi9f
	f5m3X1iRPJFlVrPg3duCyzK/XvkVeQaZDmcDqQ99KCTtzi1aDNmx/rcGRNofTB2KQW4DU3lD6Zz
	IpMEk8720QYDK4DVOtZdL+dtMNAX+2Vih8fv5xy8SyYQHV/qDgVYA4JAVRlCg1h7pRnr2VDINRg
	O0QBtJdrldyOezmavBxaeZxU86Fefxc3TQmP+wcWxwLokvNmewDHm9KghD50vsd64qEO2WMmkT1
	xJIM9FPLx6Q8Vt38f6yPmhgIP2RQW08xMAgVSBWV9IKls4PKFnU2u8bb
X-Google-Smtp-Source: AGHT+IH/0gx8Wcg+F9ixIJxQt/PgzFH8Il6oQ2HrnI+NhJ/fF9fDw5cwHNk9jMl6YFbMAhikddweJw==
X-Received: by 2002:a05:6000:2485:b0:3b5:e29c:190 with SMTP id ffacd0b85a97d-3b5e457a8a2mr717044f8f.29.1752043334105;
        Tue, 08 Jul 2025 23:42:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/19] gpio: use new GPIO line value setter callbacks in
 remaining drivers
Date: Wed, 09 Jul 2025 08:41:37 +0200
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACEPbmgC/x3NQQqDMBBG4avIrDuQRhOhV5EuJBnjvzCGiUhBv
 HuDy2/z3kVVFFLp012kcqJizw3vV0dhnXMSRmwma6wzo+k5FexhReEqB+v5mFW2GRk5sQ/ODTH
 24r2lFikqC37PYPre9x+DfO/xcAAAAA==
X-Change-ID: 20250703-gpiochip-set-rv-gpio-remaining-6c554dd3e662
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2721;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RgNP9cP0GXXURRnz4MA5U5UKkqJLSbhs9Cw8I4a0k4E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg88JOlcm03BidTriPH8vePZYrhedUWzpG4fu
 QMFyLZb152JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PPAAKCRARpy6gFHHX
 cpJID/4mV9R2Coa2EywGN3kcv+51C/1VpUb7nFvYesRp/5wTQeCl86SHbo7QpzIrPaFhuSOUyXQ
 dyBxiDtABe6U4suMAUjSN0jDAX5hy9bmQ9PFbA/6GnkLxM1AG2ijgZ1FZlFSu5fQZNRKX9mfT3v
 /L9Pl4/64GFwezASNUFJnOwboTRvKvbabmYnn5kXFyQpTBrC2nTUicVrNZeAo2Hmyl4ay+tRynh
 3KGRgeaRIW575tVWttpBdyYJbuxqXcWs5fFo8W4hOFNsOa35Bq2aVulbx1Er1m/Y4RmmAMFwZWl
 h52QqhTqL62GgrkXuxS2r5NroPzmp21SjlN9b4I1bb/8/G3dskjXUGVpLel22QnhWMVdejiHrEv
 nyAByyjtYeXw3bq4Iqh8BvpHejNGDka0dlKiiChoftpsEx3LdQ5SlvqVyJ82/BLdujz/M6TcZuS
 LZPZXrZ1LRNmMlQISVbZQR7XFZ+Djuf2kDFRCpfbCxVygX5EpaBlP2C/8U8RmQ/5yd3I6Y2TUdw
 poogxN1HKPqeYu3G7nLiNXsXx98zw1NMI2yIHb8h4OPDQtVYUzfaySrd1AX6m5OYaU1x7mBZ4Bm
 kyZek0dp+1TmCPxzXmKT2myKHNiMbDmmfrA49XLKTr9F0Lvp0a3jdVtALC98OkoV8yZK2IezhL1
 PQK7qZ30q17MKUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234216_644128_402C1B41 
X-CRM114-Status: UNSURE (   9.85  )
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

Alright, there are a few left so let's get this done.

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts the remaining GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (19):
      gpio: vx855: use new GPIO line value setter callbacks
      gpio: wcd934x: check the return value of regmap_update_bits()
      gpio: wcd934x: use new GPIO line value setter callbacks
      gpio: wcove: use new GPIO line value setter callbacks
      gpio: winbond: use new GPIO line value setter callbacks
      gpio: wm831x: use new GPIO line value setter callbacks
      gpio: wm8350: use new GPIO line value setter callbacks
      gpio: wm8994: use new GPIO line value setter callbacks
      gpio: xgene: use new GPIO line value setter callbacks
      gpio: xilinx: use new GPIO line value setter callbacks
      gpio: xlp: drop unneeded ngpio checks
      gpio: xlp: use new GPIO line value setter callbacks
      gpio: xra1403: use new GPIO line value setter callbacks
      gpio: xtensa: remove unneeded .set() callback
      gpio: xtensa: use new GPIO line value setter callbacks
      gpio: zevio: use new GPIO line value setter callbacks
      gpio: zynq: use new GPIO line value setter callbacks
      gpio: zynqmp-modepin: use new GPIO line value setter callbacks
      gpio: zynqmp-modepin: set line value in .direction_output()

 drivers/gpio/gpio-vx855.c          |  9 +++++----
 drivers/gpio/gpio-wcd934x.c        | 16 ++++++++++------
 drivers/gpio/gpio-wcove.c          | 12 ++++++------
 drivers/gpio/gpio-winbond.c        | 16 ++++++++++------
 drivers/gpio/gpio-wm831x.c         | 13 ++++++-------
 drivers/gpio/gpio-wm8350.c         | 15 +++++++--------
 drivers/gpio/gpio-wm8994.c         |  8 +++++---
 drivers/gpio/gpio-xgene.c          |  6 ++++--
 drivers/gpio/gpio-xilinx.c         |  6 ++++--
 drivers/gpio/gpio-xlp.c            | 10 ++++------
 drivers/gpio/gpio-xra1403.c        | 13 +++++--------
 drivers/gpio/gpio-xtensa.c         | 13 ++++---------
 drivers/gpio/gpio-zevio.c          |  6 ++++--
 drivers/gpio/gpio-zynq.c           |  8 +++++---
 drivers/gpio/gpio-zynqmp-modepin.c | 10 ++++++----
 15 files changed, 85 insertions(+), 76 deletions(-)
---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250703-gpiochip-set-rv-gpio-remaining-6c554dd3e662

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


