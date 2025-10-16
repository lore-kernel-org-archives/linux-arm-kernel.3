Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907C6CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3XfGtDpvixDdEbcRz5vwuGcb2ROuArxfXHlo3yElQWM=; b=PjtmJiHCtN6rBh
	QFcwKJ4RkyghEnIavxwSZkpSDFRW6erOxEQpjNrF0o6p/7B5hqgGEE1Dj0OJ8dz24xXzh5iC0TCug
	2gqUmqI59f/0BbZOnzzTxpeN3Qbdvw4IWcNREEfr3KDIczX6O5aX6AIHvGTlTMm6+iZf8mi6XzHlU
	7cEXh9Gtmt5D2XfrSEeFJaxve3CDkb0dWWZnG2uFk7wksvNWgo5fvSbmmdPJYFKhMnmVBterLuw+R
	pUaKOatNVoBwjNsezETrnhVUk/0GT1jpxaE6O/hvbAXr2mVMvFRO6vf098ORVoTyW+ZKVeyMhByju
	PxNdJyxxNG8eIZYkikGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JzO-000000047bS-3uMW;
	Thu, 16 Oct 2025 09:09:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JzL-000000047a7-34SH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:09:37 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so424072f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760605773; x=1761210573; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3XfGtDpvixDdEbcRz5vwuGcb2ROuArxfXHlo3yElQWM=;
        b=nG+anTh1WqP2IK+bGhjqcY+QTEGwibpvaC1GPR7owuaJjbU6sHQ6iUbOWCJkkwdwea
         59y/N8QBvEOTtqgSw+98xQqivO21793FVw4hU9YU7Q9v90uWTP65n2tBmodaBmsmm+qF
         S1xBrca414mTxfxSq2wd4YiSJUwv1pe0tOIuhC+mU+mAT6x2MpZkxJia1Dsbfu4uR6JD
         MOgLETrda8mYyKD4Z25L81jEY3lhRwy8IqB48EZcO2g931gisSvi17B1qmA4oLCctvOx
         OMaZj5tYFGjQAKHm0CoEamHnwAUs9DZQghmiYbe5vB4EHWDt0V+oM5Ep0j3iwuRbEL8S
         lmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760605773; x=1761210573;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XfGtDpvixDdEbcRz5vwuGcb2ROuArxfXHlo3yElQWM=;
        b=umAQRPFbHRQT+ZBw30z5fOXEYHMl+hyt2nK7U2z+QHTEzINj48iJi/W+QqDUEkPwgh
         SptNbK2LzeaGwqGiKo2UzGaCkh7SZhlfKR+xI6iqE7mEWbrdFCbJ00DPxtl9NDBXvDTd
         TMb881uz91bxS1qgqXOMQLBhQSuBdtopZKRXUoX6LdvOB5IP17dwLNQyKCRJ7n5kZN2f
         WCJuewLTqZOS9Zowmow8T3q2tjMfiCRwTjdq40tnN7GpQ7h23A/6gG8cGUKg0nSJccSz
         SZWXzqmDKYbHzgVji/ohIQafsND7sPZs2kCWJGlx4CvVUXDYF0XDgzNBRJ8uw8MUFCq3
         WJig==
X-Forwarded-Encrypted: i=1; AJvYcCWV7AYGoS+q07wyf7PRKvrInpOjBBUbUyEFnDX9io7RFM3zaT7yLngBPpJPOoebQmm8aXwktviv4RtdRDLkoSq7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqn4FZNg8gT+QUTm7EuQSLxO+JhG6GdPj1koPsWP6lf6aQGSik
	sEC65ksYo1rlrPL6TUqDE8UCSDHUljEXpSGUx/S5TIEsKaWMa6LURffjikfIO4r+7dndFgrS5yI
	TOfoQrW8PZA==
X-Gm-Gg: ASbGnctFeI0ZFkbH4T37n7KizINUQRt5JmIjdsmJUPZVACKEkRaAIf4FXXzmsPKWqxU
	OD74Ej9nX75FMt8/IQRLa/W9VqYD+r5aoD120T5PkLPa/Qsh13nv4Qf/BdW5HY3wkUDJl9hxPJb
	APnzJsm8Q9xTKe7xKbJDbbuFwAPIW+Ul3ICC8EauQ24LdjzVA6RY3iXQUqnBrK1g+3IFOkOH2I1
	r+Q+26ST1MAaiBnVKWX242Q7IKwLPIohTobjes1zCzLJa+HyvuSD7/8WLVffehLxtkPvzXtjrDi
	RXj1ZgQz/h8Bt7JysxMmFcaEbtstNjVOg99bbrUkMZDsRfG4EtJ7Esiaz+hOkwFpP16bvxuGUC9
	iDzk4rZBEhNu12Dbii159z9300lACghFGKFS3nuAzSrMkfPpOAdZJXOUgyyHI9foGMteKwnI=
X-Google-Smtp-Source: AGHT+IGiB5wh2xi45fqGt9AHQHRjpRW/BPh60+Svmei7EnochMvgfDKfftV2c/QbNugPLrF4Z4/urA==
X-Received: by 2002:a05:6000:288c:b0:425:75d7:c308 with SMTP id ffacd0b85a97d-4266e8dea0dmr19755334f8f.51.1760605773226;
        Thu, 16 Oct 2025 02:09:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1284sm33191287f8f.45.2025.10.16.02.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:09:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] gpio: aspeed: remove the "gpiolib.h" include
Date: Thu, 16 Oct 2025 11:09:24 +0200
Message-Id: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAES28GgC/x3MQQqAIBBG4avErBtIy0VdJVpY/tVAmChFIN09a
 fkt3suUEAWJhipTxC1JTl+g6oqW3foNLK6YdKONapRhmwLgeAtyHjKz+OW4HFh3vW2N7rE6QyU
 OEas8/3ic3vcDmqOiCGgAAAA=
X-Change-ID: 20251015-aspeed-gpiolib-include-249a3529efd5
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/A0ZCcFCCbHISULOnXDBh9EbzVTgeCK0Cn6Fan3eR6s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo8LZH3arKi5byEXGVlxJX2oBym0TIUQaJt4vNT
 2Xhn80agZiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPC2RwAKCRARpy6gFHHX
 ch71EACPqE9VZd/9ZyXyN0sohSzOOWITHwl9w0/7pdKL5fhienPDAccVYCkftlwlyVuR6IEaINE
 NS8j/mdCrT4WJfa5s+32eqU7LcMma9kwO7ZGhRtYJlKJlRCOqV5RiNU5nWhrL179JY8i8iPNP2j
 8TTKj2+zZGarliK69rjNxfN8eO4CvMbnGQVQpOTz5q3ggMBC5Q+NFLn3ruJxDRYz/o/rbpmm8Ci
 P7emEyEGFOV99QTDHmfj9y6203ZN322qZSET6UBrW7GX3gMslcgtmhvROjfL00YyG4FLvkPomPR
 Qx6fQlJJ2zMgvQkWqwxxLt4Ga/Ms+c6mmL5fdINtDr55jP5jx1gw8i+akbhiimaDcacFIst0ghX
 ShGVHue+2vDlV9QUpLwG9kIX0yjmCFHhbvh0/ZRhE7z/YXSouMX7fPF8jE+ch1Ms++5w3fHU//b
 p4/BmPhBqEYvzFpNof0paEusUG6sAXvrkbNCKlis6m5JGWP59ZP/lsXbMkU0o+g6B6dK2kxrsdC
 DkpfSgbFD78BGPHNXaQMrrMb2E2HSUfcJpCAIAzZkFqK09WtU/NPIb+kj2LBq2LtYasZPMXcEqN
 kIUBHTzWzvWGnU+qpzKkEr9RdRB9L9sKakgDpWqIj5MutGTOA8KWZA+RYmeP+7GUZfmrLpRdxGT
 5W060Q0/Ve/5ewg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_020936_026175_E4980B4D 
X-CRM114-Status: UNSURE (   7.99  )
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

gpiolib.h is a header internal to the GPIO core. Drivers should not
include them. gpio-aspeed only needs to be able to determine the
hardware offset of the GPIO given the descriptor. Expose the relevant
symbol in the consumer header which allows us to stop pulling in the
private one.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      gpio: rename gpio_chip_hwgpio() to gpiod_hwgpio()
      gpio: export gpiod_hwgpio()
      gpio: aspeed: remove unneeded include

 drivers/gpio/gpio-aspeed.c    |  7 +++--
 drivers/gpio/gpiolib-cdev.c   | 12 ++++-----
 drivers/gpio/gpiolib-sysfs.c  | 14 +++++-----
 drivers/gpio/gpiolib.c        | 59 ++++++++++++++++++++++++++-----------------
 drivers/gpio/gpiolib.h        |  8 ------
 include/linux/gpio/consumer.h |  2 ++
 6 files changed, 54 insertions(+), 48 deletions(-)
---
base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
change-id: 20251015-aspeed-gpiolib-include-249a3529efd5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


