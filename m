Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580C2C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7rBnsamyDV27J2WwKLyAccKonvibQaYagfLaZ+VNSiU=; b=pQd0YM1IrOyXW+
	+IBSlwTC2JspYxEAbEQAVBv7Rw6t8UQqtfdi6dQDAUnH1ycRZQr0gZOcHcB8np2XkbFTw4JlGh9k6
	Ra9SUm37r6EPaJm2NytSRqQMjvdQGlq/rOmWCBClk9r9ky4WB0QCzm7MHFKAEZx2/Y8QjJthvLVSl
	06G9wRR3diKVy3OYWEtoBmB+715+bxgNQ+USVLgt8vE9gs9ia5ESuSSV0j4cVU3DGbBgg7RBVZfAe
	4kt7Oqfcw6q1M0kvRtgBDIh0uVVTRabX1Int9/qS6Sfkf8nrELSSyHHeThBEDQXvaUzEy4KPGRP5C
	DHcCEVUoHymfyf9kGbvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaVS-00000005Ob8-2r51;
	Tue, 01 Jul 2025 12:54:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZUi-00000004vGN-1GTV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:49:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a582e09144so2403231f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370586; x=1751975386; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rBnsamyDV27J2WwKLyAccKonvibQaYagfLaZ+VNSiU=;
        b=yhfurcw6aF/3GqFXs664+Pzk/Apdwjtu2gCCWPqR3hOB5NbDut/J+WQPBFBZlwq17n
         yY45ZOzTjwSxLp2Lc+UZGWvsayg4QdWXW/F7Gg2fFbXJlJ6kARcO73xmOThSkj+aTC+j
         twmjXlxizimENuDeICKwDUkT7o/w4GhkEwyYIyxLzlTejjF0hNnj9jucbDsOhgd16fT4
         BS63F6gimho3Nng3nOuvrUic5Wc61qpiLQQp4k9sCzjDCcRATHjKPw2jD36GwEb/IMLq
         0Szcq5WTLLPZAUAXyRvLdY6fWzhQkHuXiyN1BEQBqIDAYJ7fjm0zwqTRTxORtQdQNAbe
         iy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370586; x=1751975386;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rBnsamyDV27J2WwKLyAccKonvibQaYagfLaZ+VNSiU=;
        b=JMQHMC/Nkx0VIBk6Eq18RcvXWGIwDreshkvSvrpVCgI29gFuuq5hYh4oLdMYJRgGnh
         vz/Aw3D2wVL2OTW28Vd1zaS1jm+7a6/voGJ3RnlnYZQLIlExvxlSirYHYXWZap+Czevv
         lljxxQTYz/ScX+FwW+C7lwzrCKWvp2lqlIksxIXGVY1KqBl3rJCJP9l/r/f33/rb95Fe
         Yht7iykBo0bw1c9BEvxEOUH0QbggjWfR/lgjZVloBSu9xRlV20+UgaFv2TAzJXkkP90u
         BON1nWR1E0taGJwp/n7kPanSIZN4NEI2ASQIVH1tHrIAKDnVRGVIrn0GIr6OnIedlla/
         /ylg==
X-Forwarded-Encrypted: i=1; AJvYcCWLvcG8pOHrQaVmw0U1VInDX8fpL15Y2/pO/onoxUoWmipnvlB6iZtW0r5HZlPOrGMVNQzxqsojTzWjZlR01Jmz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo2SLAnc4uJtmjf4K5rcgqr+TiaV9/zGCGmtr/Ize5gJ9l0qCM
	6VyfxCCF3qvhStONMLIsIgXRp1xkOfdWBtiBr7JcFDq4VUEF9PU0arczZc6Et5C7tnI=
X-Gm-Gg: ASbGncsCrjFOHz634nEYBrXSytiYviH4R38bmRxhsQdzXg0AgVKfM+F3rqv8Zo6jLPG
	D2JNuTViQYQhNJ+W9ovpi18Pk3GcmuP2JGfdlV1FE8Bf8H/fYswDtQp35lARNDRmklY6RPc3VG/
	AERmTLMeq6hAcQXm2d1mSHdlbKEWhbAYzsfmkIvecILVqBJAGWNY5t1r02hjU54IJCusgkHtmr7
	N14lvUezQW0RQ+byXSmrYFSn2jtQg6opVlzjQnNVO/3Q0tnCcW2/ZlCaDibBhhWm/b0JoIAESkK
	jOqYvZcZtpqBMxJCI16qeg5EbSg3m0b98SbTP+sDiO+m1moKWj1KfA==
X-Google-Smtp-Source: AGHT+IGLudSO4qSGgaoI0lE0gwhgJMiF1fIaIOReku4KKO0+ggLf63z8+JCs9hpvb79VzA7DdKYPnw==
X-Received: by 2002:a05:6000:270e:b0:3a4:e609:dc63 with SMTP id ffacd0b85a97d-3a8fdb2a345mr10940398f8f.20.1751370585709;
        Tue, 01 Jul 2025 04:49:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RFT v2 0/6] gpio: mmio: remove struct bgpio_pdata
Date: Tue, 01 Jul 2025 13:49:34 +0200
Message-Id: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7LY2gC/2WNwQrCMBBEf6Xs2UiTmho9efIDxJv0sG3WdME2J
 SlBKf13Q/HmZWBmmDcLRApMEc7FAoESR/ZjNmpXQNfj6EiwzR5UqXRZq0q4ib0YhiyTxRkFmkq
 2p5qMtQryagr05PdGfMDteocmhz3H2YfP9pLkVv2Ahz9gkqIUqE13VNRqXePlxSMGv/fBQbOu6
 xd5U/AztAAAAA==
X-Change-ID: 20250623-gpio-mmio-pdata-a831b96e8dd2
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2027;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UJc3hmakmCFDejzXGWV/PRSC/VBVjDRZZhjzXcD8pcE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tRdPoTibMAomzGNkjn3M4LGNffQVy9TxdSJ
 ySv+9g/ljaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLUQAKCRARpy6gFHHX
 cjvAD/9XrZRdWLFc4ZGo9ECLkOKGsrV6090zJOH8UE+pCw8zhlOKsArJbrLVXjR21hvLXP7TVun
 cKVNZSf5kTHZwsQMU5c1J3lhTTMYP4qforoqO6USlfVDjlh2U4ZdABevibR2rj0VtTdaVW9uRP8
 o6vioxw4z+bvCvZsl9pSl+HKDY+w0oBYbup1I5OXPkam4/xBOTGQL0cuFmSZre5AX19bw6bY+Hs
 vC9KByrkT1ccFoPrun8h1YsRzpu5h29H/8TBU8OUw6FjBSYTrob5Qbi35KIwoHshEhWk0RVokuy
 pt0JYFcpUCeOusVhltlDF/7si+ISXJCt4/ajpPFHyIDH4tXok/EdAy7GFVROdc5JXxm5y/KDmAR
 1vNIvPhd8661BpKbeHI6diXu4tAASI7b3BvHvef4w2UL3i3AvCZtj2tItLHHHWlWesoxaju9vFu
 HuDy3zng3nIR00ofBuiTnKR4XXT7DJSUtnr/RKS8WhH28RRMypZfOgQGDBj2c8+DuP/2WDx41Cv
 DMcq4UYnjtg9etRNoFWtWPzKKMDE3/sFQMEHqMoy8ZNAlpf6ElOErYJq4Jdb9DG/FUVg571mIic
 U6K/xeM9Y143/Mj5B8hh9qrUA0R13X+nv6sZ4AEaDmO8F0VRgUzrdtdp4CuhQT+hjo6WGXyEx/H
 GV6aS0WOYDNdtYQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044948_416814_8241FEA6 
X-CRM114-Status: GOOD (  13.91  )
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

I'm working on removing the fields relevant only to gpio-mmio from
struct gpio_chip. One of the bits that need addressing before we can do
this is the removal of struct bgpio_pdata from the kernel. Fortunately
there are only 3 users left treewide.

This series adds support for parsing of generic device properties to
gpio-mmio, converts all users to setting up software nodes containing
relevant values in their property sets and removes struct bgpio_pdata.

As for merging: it would be best for MFD/OMAP/s3c maintainers to ack the
changes and let me route them through the GPIO tree. I can provide an
immutable tag if needed.

Obviously I was only able to build-test the changes so any actual
verification is appreciated.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- add a comment about the gpio-mmio-specific property not being suitable
  for device-tree
- pick up tags
- Link to v1: https://lore.kernel.org/r/20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org

---
Bartosz Golaszewski (6):
      gpio: mmio: drop the big-endian platform device variant
      gpio: mmio: get chip label and GPIO base from device properties
      mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      ARM: s3c: crag6410: use generic device properties for gpio-mmio
      gpio: mmio: remove struct bgpio_pdata

 arch/arm/mach-omap1/board-ams-delta.c | 42 ++++++++++++------------
 arch/arm/mach-s3c/mach-crag6410.c     | 17 ++++++----
 drivers/gpio/gpio-mmio.c              | 61 +++++++++++------------------------
 drivers/mfd/vexpress-sysreg.c         | 46 +++++++++++++++-----------
 include/linux/gpio/driver.h           |  6 ----
 5 files changed, 77 insertions(+), 95 deletions(-)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250623-gpio-mmio-pdata-a831b96e8dd2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


