Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1818AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 14:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gsa/afuzkL/muRZEKJaSmP1G9IRaDNhW+p7U3bAdGsU=; b=FgpcRZaQ/xq9Rg
	BDLKfUmctX9aI0Xvk4RuJZSi9minFPuzXzRLdGT3Rw2B1Am4AkNle/8iMuiOKia8o8K94IQBp/48V
	0DZSuWVHwkyR26sslY5JiMu9Jwfzu8Pb+uyB57jRuDY9+Q/rWVbvI5INzs8+Ke7QtzOgxB/VYbYLz
	fPV5Ifct0b/ZlYsdqwEj7EV/5TybHDA4acjSG0wxe2pA66jB3FbwPR3fw0dw/NElqJu16sEsubhy7
	rY5BAkvlZBUoaXjR+D2Yb8JHv2i0sdnxEIf1JD5+bZIboAD0Ds8DsfqO7eWl0M0z7I78SqmEJOvlp
	857UBdmlxMR3Gg7gyUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Yi-00000005tSu-3WYr;
	Tue, 24 Jun 2025 14:23:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Ya-00000005h2n-1LSr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:19:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-442fda876a6so48016825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771162; x=1751375962; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gsa/afuzkL/muRZEKJaSmP1G9IRaDNhW+p7U3bAdGsU=;
        b=AqvOY0aLWOXWTppXaHHclS6q3aHc99LqXhbx3joQqkbqgxLj1dUc+FXk/zAu8Az+Cz
         b4QwJ5Gdds+46nw4tvg0BAXH4UOW2EAAcn45/5CT9YT5+5j/KbNvF5FRIwDN8YbaZ/gh
         WA4nKzgCDtajXxHe+H2Cwl39H8cYH4Gx/dO27d6ZWz2tsG3nnl3jWkHDOG0/MFKfhYmW
         721xUhrcHD3mzWSMGd+9JcxigthEqD2XA2fyzHcYwFjBlWf63GW8ikaWmUUNJC8+dfi9
         H0DrKgY9Ay8QjW5UZ8ukkTKYfJs7dI198l1I4VabBRf7B4frJis8FWIFEAc7gY+OAxKa
         ujDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771162; x=1751375962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsa/afuzkL/muRZEKJaSmP1G9IRaDNhW+p7U3bAdGsU=;
        b=MiAUPk42bf+pHN5GZCFs7J91OH6t8xO7N3Q0ZMYPrZaO8sYKhqlp2627FJsfsED2sQ
         1/N8PuvfdfpHZIhD2HfMBftuRq20zMP6S9YTFRHQQC6/48tLEYD1yQpQYt7urnXZIs5u
         f2F9ltQTwbmjb/0DmUDX22jYIv6GZCMBrd8qTX4X3aqFqZxP51Sg2Qa2r1PwTwntw5dZ
         7j9aqmOPq2UkCmoYXRVjlzMhCY12+wIvrsHcObP53nc3Oy7GlgZcMMw4uc2yLxCwmKG0
         zdlSNYOwf8jUK5XdqQdOoffGrXiyUxC6vYmnUDZmtZAmyBIxIeGW8UTeyc9u9ZmQyKKs
         FH0A==
X-Forwarded-Encrypted: i=1; AJvYcCWX9VdaDIKylGYS4PwF3JUogUBnhFqZzKMlyh4FqHpM++/nA/ZYSuewa5T08F/i+syMNPda32VnEIWvMgLJX4Qy@lists.infradead.org
X-Gm-Message-State: AOJu0YxmGPVhwur6VQQ+5u8wZq3zFkvq+7mtl2rAyrNUqr0VWCIKUHq7
	D6naFusRviEtnSst2ascNcFrRpF2PwTmbt1ZSSTqfrupsBnMfmYfE8tENEtf173p/mQ=
X-Gm-Gg: ASbGncu6Ak8bnezvv+bdYdPp4B32c9OhIH2008cDcb0ikVqJLAYoCykhWn7xjaXCjBS
	5lFOhXZznKMqBRlf1GhgWnnPaWuke5AtUvcdHKVB2uUiFUBJMuZ8Ihj8j4szYWtYfT8+A4PYMKo
	dz01+CLmsdRtKnRzuGeCnqa6ZO7g5Yq0W926Oej30A0qxPCIPXCIUGsjTjcRSOJVXhjG3FMqp6B
	D4oWaNcXMA/0Cj+hTtl1F3/FuwJ7BQI4G9u3y9nKdj5R97Q12wYvV1H6+xYMWwyXwUP4xIB4DRr
	n6w9Rpxyg6XP5rqRV1GMSYLlFTcjs+4y2RHzXleikzbrGtiomONybEGB9TAK6Bd05w==
X-Google-Smtp-Source: AGHT+IEhufAimrhHUzQr0xQtqQC2Hgx0D1VrIPHbO4Qbkas268U0OlP1XXIhz9Fe5pfneFNyUPhByA==
X-Received: by 2002:a05:600c:3513:b0:450:cde3:f266 with SMTP id 5b1f17b1804b1-453659cb94bmr143802515e9.22.1750771161882;
        Tue, 24 Jun 2025 06:19:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RFT 0/6] gpio: mmio: remove struct bgpio_pdata
Date: Tue, 24 Jun 2025 15:19:11 +0200
Message-Id: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+lWmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNj3fSCzHzd3FwgUZCSWJKom2hhbJhkaZZqkZJipATUVVCUmpZZATY
 xWinILUQptrYWAD6NQxlmAAAA
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RBJgsZUC1nqNrB3wsNH3awWX5gMKJEfJFb9c9F8tuQg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXTX/fNaYZzZKf3DgFDCitzH9bRN6VhuKlO+
 tLHKsv3sa+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql0wAKCRARpy6gFHHX
 ckkBEAC3x6MUKlDkZ40OSpS/a57sn/SpQw1u6hapoGkV4PIgEA2b0WNC/5vJVsMsJOE7bEo4415
 d830z2CMbbRl7AA+Q69vBRvmtexOFGW8Zf+5YD9qe2VxlQ+ZhDIdQjF8vG3BBPVfgAAFQLcDvGc
 7eqG8XUAQISuMRzX8jx3aCfaSXu89LnAFmfsLWVO2PFZ1lOMNLyC+FBvxMjBtKf9NjbGjX6g9Lt
 WSs3ihAWqXpsQrMA5j+Sk9pDAAskgyVdnMVP0R1vWn97KCF/aKeXuX3PTKxLgAwkfTtDblPkuAY
 V59ViJhzoB7/+ecRrLUeW7bXb8iJVSVLxRyqakya85TgiL8a0iAFueJ3mbFURtB3V0dk5bcyhZj
 j+t7vqzDcp/lOveEU7abAQm6LW4o3s6jbSEGJqmt4zZLlSuoUdnbTQkwh6O22LbvSsPjt9vfwTu
 ZhWPf8Ul7BSRtjDSrv0G+1pJGMwxzot5HDI0jJKeg0oEd5Mjky6Q8DV6KxWsBQgVKFwB7PE0uE3
 HMkjg9Zqh1+h6aMeFgiEFlkIL5Fa2g+z5SxKXPOiXBP8ZisOEORPZWaBKGx8H1kOTcrlKz6Yi+s
 HRSE9OFs+vg4bWEVBmI4/Yxm4hb4THlDk0eY14SpBmXtl8Qdm279L0/AapoAzTPYOAddTSPgtmG
 kylguGrG3el0upw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_061924_601190_A409B6F9 
X-CRM114-Status: GOOD (  11.51  )
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
Bartosz Golaszewski (6):
      gpio: mmio: drop the big-endian platform device variant
      gpio: mmio: get chip label and GPIO base from device properties
      mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      ARM: s3c: crag6410: use generic device properties for gpio-mmio
      gpio: mmio: remove struct bgpio_pdata

 arch/arm/mach-omap1/board-ams-delta.c | 42 ++++++++++++--------------
 arch/arm/mach-s3c/mach-crag6410.c     | 17 ++++++-----
 drivers/gpio/gpio-mmio.c              | 57 +++++++++--------------------------
 drivers/mfd/vexpress-sysreg.c         | 46 +++++++++++++++++-----------
 include/linux/gpio/driver.h           |  6 ----
 5 files changed, 73 insertions(+), 95 deletions(-)
---
base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
change-id: 20250623-gpio-mmio-pdata-a831b96e8dd2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


