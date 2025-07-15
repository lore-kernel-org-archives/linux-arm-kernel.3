Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C267C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oifvOYfRTiHrrZd9oFt2xJWefhV12VLQj3WNflmH33c=; b=T62f3Bv3HULO3Y
	VB3pcd+jv5p9zwcI8NwRMrQHnQZDvPxluYaTmbfmsq/P2w8T8mlUpmc+4WrbAUOhYQ+im746Efpjr
	SUs0Eh/hmQwFYF7t8m86aBxOeOfm1CokrqeWFlO28cqJ/5RXLahllDM+adfXzN7RwtkfsUBjdltLK
	xlkAZpVg17J0MHZEIaE49/26zCwmrK8BzknL5+CfY6HYIWkMPWDrnA2+wL0WaY2OMj9ELDjqCgDmn
	yEMmqPKi3qfMojVlrZirGcl1BMSpVgNeLOemeq2Kn+4ZhQo7ffSCcBwCQ+tUQ+dSS40fO9mbVdjm2
	/3qWGXV1SCoAsSobgbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbOz-00000004aAK-0kYC;
	Tue, 15 Jul 2025 08:52:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubatG-00000004UuC-1kXA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:19:55 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3198016f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 01:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752567593; x=1753172393; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oifvOYfRTiHrrZd9oFt2xJWefhV12VLQj3WNflmH33c=;
        b=zIo313iopZmm0+G9fwg9vx4RcJj6mNUY98reRhd14yrz/gYfFyz8/xxbq7ssvaVW/r
         eIqEQi3sRV1H+w7cRFLtFkHdkiCcvlnWiZYh7HY/hBDEeTMc/6q23s3QpVqal+NoBWgs
         qaFSYLe5ydP/WXqVY6hFe4GpF2fXo5F4jNtlxisDkRENqfSImA0b7SpNxG1qMJE+QH0h
         XOwJmiChT4iUhRqk6i/eEvz2PeJ7NyJ/ZWZ/woeRYS20YmnI0qVDykO4odUeg7YD1lfQ
         m56CVscaThHq6QGTykxrMcdUoZxrUHvEJOUUX0RAYc3wMCdQKK3BlfazOQ92UYK93UnT
         M3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567593; x=1753172393;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oifvOYfRTiHrrZd9oFt2xJWefhV12VLQj3WNflmH33c=;
        b=ZAm3sa39M/s1qFd2x+EEQX/Utyfr3aVBJ6hQOT1rmHMHN3zsP0qonKEuAhe885XI2j
         wdBXBR5eAFtWclvH8RSssKbS4HTFfpGSimqJCuCYlQyDyqLxhQw99ciONdJ78pEmPgs0
         HRCuTmyNdBHd9U4jAlm1afjBQA7fGhUStBpd4s5lLqUrqFpe+OKcI0DSCoISrHux7EzW
         4+QTQOI5IjEoliFjsg9D66dgKZUU47FJPTX6ZnLSKXvx9WJ0f/kUDGn4kkbjJB6ckFUZ
         5HR5bVWLCanAkjIjFeZJAU30CgRgxFnpewk0Bq8sbVzpTFqVi8GR2j3+mo2E4h2DPnf/
         K70Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOC5iB1UxAONEWdzBZYKMN8Yf1tVR++afcDWfAYYL9SQMcORiXzVGFYw9uXMP5CnTpoE4bXbirckyhTjelyLED@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf5v4XZXq+43uNYX+q0nfh0hBMYhjCXXOdNgXomPO308AkxdX6
	RvbqM2rvn2PPRE/pX7G0UNgJ8adH/Rol37Sx6vQAgrtk4aYsRN8bZHGe856IcBblApk=
X-Gm-Gg: ASbGncuLcBVTsOunQ7ofDgFG1X22U5wemOG/0PFmxKAXr4qR0TwQSYWzuGxllT5YRku
	DJsjI4eo9QPLO7m8AjYptDOfG49CueEy5VOq9/Tj2LvlFdZ23+E03HHIeq7X6Pkv1d0YOp2JF2f
	iDKcKlz6B3Zq3QR/laLeoHmhxf+c/LAocWwnobUuuOxxP8cO36FdjX1KXddhEnX7U639rC/r9K2
	lugg0DdjrBYZX8sapvZN/+EsIJimHUVBPbnyw4FeQJlKVvsvTXD8TjZpHX1Uk2At/ruabEMZ6b8
	EV/n+A/EZGobbinJVRto5fbrlcLAzHuieIprpxKvIeVvmwkzGq74aOxGhLxrBReg1TmchCSmXKF
	j/zTHbUDsruxOmtDewJhJMdwi0C8=
X-Google-Smtp-Source: AGHT+IHotH4B9LlGDmCSIXwZpmAXmPsr5VXRdVlhQbnK16OE/92hwFpeN5bfSobrsX8y6fGRDkzn/w==
X-Received: by 2002:adf:9c84:0:b0:3a5:1f2:68f3 with SMTP id ffacd0b85a97d-3b5f18d2e76mr11705226f8f.46.1752567592784;
        Tue, 15 Jul 2025 01:19:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5631:db97:f06d:3c45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1de0sm14334589f8f.24.2025.07.15.01.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 01:19:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] gpio: use new GPIO line value setter callbacks in
 remaining drivers
Date: Tue, 15 Jul 2025 10:19:43 +0200
Message-Id: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB8PdmgC/4XNQQ6CMBCF4auQrh1Tiq3gynsYFkiHMom2zZQ0G
 sLdrSSuXX5v8b9VJGTCJC7VKhgzJQq+QB0qMc6Ddwhki4WSSsuzbMBFCuNMERIuwHk3MD4H8uQ
 dmFHrk7UNGqNEiUTGiV77wa0vniktgd/7X66/6y/d/UvnGiTc207LyXSmbu31QX7gcAzsRL9t2
 wfib4pUzQAAAA==
X-Change-ID: 20250703-gpiochip-set-rv-gpio-remaining-6c554dd3e662
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3TZO4356pJmTK/ucycFfV4RA+RP9ThUPXqXUz1dGC+E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBodg8kKYpZCKS3QiG/e1wcc0k1zptSwkpbzJN06
 58eo+07AsWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaHYPJAAKCRARpy6gFHHX
 cocrEADUjMTvlwIFqUuWqBqoKCvGYmokDqIRdoxHpL/kMPh17nSrL1zk7mbVhpGcwss7nXzEGu3
 +5r6z2AtzUKhgBkNz7HVIWs9bgsmbv8wSTxpwU83E7wkEqt+jdxS1Q9dSzjtvsI1FwbWLn0zWnR
 ig0aMQ415toX+PR4rtxGx2t9UaelpITlFbeQRgyp4UOWa5c8EuZrCYsJ3mfYKWnso9bATKiFz0u
 IpEvXSTSQ8gWJFV5r+sQQTXWwZlfQceEd3ZLVhSp30YYZWRc/CRiDWK7eQ7tHKP5RulqgxYXWXQ
 9nGem0BptR2tCxdC9Ev+vA5f6zgk/ZNSTiLxcyTJvvgreD8TxnIMA8Mr6Qd4u4GGTGYCmZbpqoQ
 ANPq0/ZVS/Xao3AUmhFicnzybVn2NMATiuMWiyY0/k19zu2UKKeVW9pxSf+SgDr5W446yBYVZcB
 IQslMQiDO9n2imSLLkatQcFo26PoXfCN9m7O1I05IcNM+GAGUcM/RJLfh7XpIUYe+m4CSGhaSdb
 54PPgFuuVW6YIju879DvSnCFwbXiUwLVJJpQLWAEH8hcJ2I9qsPBGUcK7J+xFeKFsEYErGoEgwu
 UnoFLXtasMKGCeZiJf+XQoefwFzE4QMRUtlgUF/lvEhSxMaCBYpNv15Re8VMO08HRlzhfW7Mt+b
 upx4Y/xm2v4FRSw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_011954_473363_B80BE6A9 
X-CRM114-Status: UNSURE (   9.60  )
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

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts the remaining GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Drop applied patches from the series
- Use regmap_assign_bits() in gpio-wcove
- Link to v1: https://lore.kernel.org/r/20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org

---
Bartosz Golaszewski (2):
      gpio: wcove: use regmap_assign_bits() in .set()
      gpio: wcove: use new GPIO line value setter callbacks

 drivers/gpio/gpio-wcove.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250703-gpiochip-set-rv-gpio-remaining-6c554dd3e662

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


