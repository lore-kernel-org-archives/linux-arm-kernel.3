Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF81BC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0aOiT8aWvV9AtVi02w4ktGyvJjNxDzIlcv3Oau2aYCg=; b=cx+6CmJqNGqD0k
	42jlaNbQp20WTM0U27ZWgA1BY5YGCwb26wXT4SD0xt84Dzi5NpWBbIXRhZImyr0+p7pQKiiFSUVbB
	s7ext/Jf2zxRhXWfn/oT/holSZkzffZAS1BrJcudboYchYTMdCMT6sAxpNIxPPmN5J0OJuu/kDsHR
	K1zNQ1IF9EJ79cxfNAEQF+FJ3+LvNsN+mRctC/Kuf5CYGoMmhTF5XKdch5KlhrXac7CqF+jatHUbV
	WrNeLL06Jgblp0csrJE2KejvHsiYgu8s99QMG9uEacEMMjMG0eV2UPRDx/krwMyVQrfpStD/8dsJt
	0i2F7TMd19f/Ck/2Qcig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVgW-00000007E6U-1o50;
	Tue, 17 Jun 2025 12:45:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVMp-00000007AvO-3Bmc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:24:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so41871675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163082; x=1750767882; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0aOiT8aWvV9AtVi02w4ktGyvJjNxDzIlcv3Oau2aYCg=;
        b=Mibn+8ZVkjgAsH7xR5ZWkxUzj79UegXnmrhabPdNxRI6cG+y0oDE7u7FvW3j2+vRNJ
         baKlMUiQmj+41sJsmOT756PKL3uzdRGACgKL6QYBAxbzCURfRwQVX5uQeqlh9JWE5CRl
         SNIN9nlvCiBGcfFsN4DJteEt+FzcycOBVjvi0NO541Vxu5Ijs5kjMEO25o+cCq6waQ3n
         VUFVj/XsbZ89JDMvn9eCwsnFCLlgvfnBEDs4JS/76ycMmJ64KM2uTngOFwiX2XZfRvwb
         bjljGSlnCfJsalX/K754pZ6ZmE949tx8vD3rLg5l7VCNDlaulsLj1ewC5fzJ8oj8Y3tA
         a4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163082; x=1750767882;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aOiT8aWvV9AtVi02w4ktGyvJjNxDzIlcv3Oau2aYCg=;
        b=O2x4Ij9ETFdAlDaVgTgqXiSU0DH0n/6/+FvatQLH1I3a5WuQNMrfwaP9S+4FvIzg91
         7+M9rHaawC+Kkjh+iUHyEejlkZ+fW/2BA4fY5SNdZVozgZZw9ZKnvQrgIvCkzakGakD+
         vhCcPaI0D0h10fQPxGf8HzlH1JZSgh7p4QDwGnbXaKub/bzDPcujvQ/CB+ey2G8q45ws
         SD7zf8Bvj7vmh5MQuGhyHRR69aEnKAvO5TjoKuZ7C/5o2hOSIiSEmYgl/hWrhAuIGmeI
         Qp4OR+q1fRCVoJYBe0dZBitczc/YgUwKdEFlGJImR1P0cVx3gOPKDJGWZtWcpc6O2BsA
         uk4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0jMow28D3aovlp0XTqqO0OpNPycZWqAt4eundXRRadB9lgDf6Dgjic/g7L77yqtQSmDR78WgkBggxiR0s6NUG@lists.infradead.org
X-Gm-Message-State: AOJu0YzASca3zNiuL2LkrmKnTj1NkoHKpX9RuCCLdxNK6CR32W/a363q
	xbs0LCWp25mMlL2ORseofdmA3jVNUvgsPlpjpePKNQ/YBJZekr+vhCotnkoFXGZa98Q=
X-Gm-Gg: ASbGncsAqhUolyv//XJvFjWSABvviUM++BSvhDI0jo+cKLiggsRHgggZjzqFQIP5rKV
	NNbGQWCMup5plc5xb5mc/T7siyvbOffxbap36WhmAY34A/eAerKW8mPu/SAtHBhF2ppr8Y510Cf
	fgfCSol86L4bgYqZVvpuRvRzCax6wvCjb91MVSJjyEk90BRIdhPVLrQZsRB1ZSG0I8m1KGnFFMY
	JqDlCak6jAaylPvOsjZBNWq9UIJ2+BbfYfGfbnvQ2ZSktkA9UL7AAm0yoEI+HvS8LiSHJG6ec2K
	v8VWPPQsMGaAz0rWiboPQm7+Jm4cC+KH+hWmFsGThvM9EiHRLUaPvpS0
X-Google-Smtp-Source: AGHT+IF+mB5SqbWQ/IXeYHMObyrSVvwo7MdGf15Ymmh88YebHVybFE0gf/vBSiFaY6F9NM4JITbNiQ==
X-Received: by 2002:a05:600c:5305:b0:453:9b7:c22a with SMTP id 5b1f17b1804b1-4533cb56708mr128208385e9.30.1750163081796;
        Tue, 17 Jun 2025 05:24:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Tue, 17 Jun 2025 14:24:22 +0200
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZeUWgC/x3MQQqAIBBA0avIrBtIMbWuEi3CppyNiYYE0d2Tl
 m/x/wOFMlOBSTyQqXLhMzbIToAPazwIeWsG1auhN9Likfj0gRMWujDX30iSnNHWuFEraGnKtPP
 9b+flfT82d1slZgAAAA==
X-Change-ID: 20250617-gpiochip-set-rv-gpio-e1e864768942
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RLnOLguCkXn77LVyLm/6OTIhPoN1Dit0JrVu41r0fmE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6CDET79f1o2CbISvL3vLRy6ELTLtQKnb084
 knXSnThFB+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeggAKCRARpy6gFHHX
 cpf1D/9lK1akx62CUxztvvy7rfND61EV2eVXetZwZCru69u+80k0krblUEs+OzEEsNomzQQjunB
 t6oGVkODsx9MDCHGMisesmtpssyc9U9ZL9/3Phkj46EdmTFQA4Jv4qP+XwlamMBQXIy1zf3KWOV
 Dx7s9uYPiEhyWDXW1IMHpJksogNn4kOOG9CYb7oZaaHR8S9i9Mujk0yqG77pOgFCF+oWy9cp1qj
 lYsB08HLcanT6fAWkXZ1Ll5rleE9+beB9+HKLi7p1Y31IvlsQ1/D67xx525vqjPeFM1EJ76Igl0
 /FnoKItV4ubW65epwmmWbi/UKTiSP+lU7u6zXY0eEOWuMkrg/uBakg7An2VYYSjtiz5w4e8LjPC
 r1eSzfsmrjHDC8HrNVwbnj9Ashn2tRis9fXAZ7+p7LodRjS6RLKebeav4NUPp3jCDyCGz44Sl82
 KxZktKjqp+0hnXOg2ATa3Ck8pHHtIgTiGXBQF/msz98sLdJq0YdtHn+9Ad2YfzcfYbTvSvq4WgO
 GRO30/0rIKexr/ctI8lBGNh/9MlBpeHFiEpr2CZsmCuht2vy38g0TzZJ8r0tBvYL39W2BdS5SEp
 kjk+/W1gC4lU3DDhbBHQVXR+laf4oumYx342Rjvm8paGhaf+h0T/XKk99JFDuDdPXicCCHnyKRO
 arX7wibv6dGhGwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_052443_805584_2BC90363 
X-CRM114-Status: UNSURE (   7.80  )
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
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: pca9570: use new GPIO line value setter callbacks
      gpio: pcf857x: use new GPIO line value setter callbacks
      gpio: pch: use new GPIO line value setter callbacks
      gpio: pl061: use new GPIO line value setter callbacks
      gpio: pmic-eic-sprd: drop unneeded .set() callback
      gpio: pxa: use new GPIO line value setter callbacks
      gpio: rc5t583: use new GPIO line value setter callbacks
      gpio: rdc321x: use new GPIO line value setter callbacks
      gpio: reg: use new GPIO line value setter callbacks
      gpio: rockchip: use new GPIO line value setter callbacks
      gpio: rtd: use new GPIO line value setter callbacks
      gpio: sa1100: use new GPIO line value setter callbacks

 drivers/gpio/gpio-pca9570.c       |  5 +++--
 drivers/gpio/gpio-pcf857x.c       | 17 ++++++++++-------
 drivers/gpio/gpio-pch.c           |  6 ++++--
 drivers/gpio/gpio-pl061.c         |  6 ++++--
 drivers/gpio/gpio-pmic-eic-sprd.c |  7 -------
 drivers/gpio/gpio-pxa.c           |  6 ++++--
 drivers/gpio/gpio-rc5t583.c       | 19 ++++++++++++++-----
 drivers/gpio/gpio-rdc321x.c       |  8 +++++---
 drivers/gpio/gpio-reg.c           |  6 ++++--
 drivers/gpio/gpio-rockchip.c      |  8 +++++---
 drivers/gpio/gpio-rtd.c           |  6 ++++--
 drivers/gpio/gpio-sa1100.c        |  7 +++++--
 12 files changed, 62 insertions(+), 39 deletions(-)
---
base-commit: f3763403a6bbc3a18379fe4c415bda899a111d55
change-id: 20250617-gpiochip-set-rv-gpio-e1e864768942

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


