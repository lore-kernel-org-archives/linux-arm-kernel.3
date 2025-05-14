Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BCAC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5BtbSxTybdtcFtS1jNyktVMyxuW9cSflR46MX/L5XT0=; b=ibB6aO//Qvoh8u
	2AAfP1RCszaM4b/wzF//LXit8RQXpEs1jiGGLv53e54MONTTbcsDI+PqnKWOhYJ4zbI3ibFKkA7qX
	fSLVTHpgPnwvKqZ+0Tj4dvYAO1llMZB8DkPL7gTOv/cn9Jhc2UDvJp+x7R5HI1w2isJQ0wShvkaoy
	sykgE0JnulboPU9veXXHkF66P2h9WvHaRdcm4PyY8XXeg1/zstydRf+/wF6ZGMr2Hn+dqU+VavDxu
	+W+191Mdwm4f7i+LK1VN+4GB+N3/ugBTVdO+X9yLu/JWM+BEJ54hrHqASeXHwaH23djC/OoV84FdU
	p7U9PEO3T0lR2WSZeodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHew-0000000G9rY-3dPI;
	Wed, 14 May 2025 19:20:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHct-0000000G9U5-0Jml
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:18:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf257158fso1131845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250325; x=1747855125; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BtbSxTybdtcFtS1jNyktVMyxuW9cSflR46MX/L5XT0=;
        b=Z/P9os6LKRgx+k6iDXwWLWJ6zazP730Bs+Zm4RXfeqeRNMA/BzT3TMPyPxLtZ8h5sI
         m1Qpz9Oz6d6s8YXEh/VqvdliJKdZxtMrDMO68TRhPARvfHmW6i/trU8iRKAROQ8ibZMa
         dVMkUFphrJECHDLAVCeBxFboXEnZmI/kC1goM2Hf4JAmF++LCsq2iJQ4hO9P1p3ueLjs
         4E1mEQqdJdWKzj7vwSItXqsPjkWym6QEmF3c6FjdOw615eQOYTAPxhMqomoUTEtmtcW0
         qCJYYx5jmj5WxNoYcjh1gp35GUTVi2OK70xkrasODyQg5KDJvka+ETy9ecxQky5XFxIn
         b91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250325; x=1747855125;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BtbSxTybdtcFtS1jNyktVMyxuW9cSflR46MX/L5XT0=;
        b=Oz4r3vOdUr5jnBL2sqJ8VWUhiV+gutOtmmx7vyPg5lWTyf+5M5FJ6D2aURFF0htcf0
         JpxOeVv9hJNOr06CkiNNj6iBCNebJfky10VTAvmwGt6pYevwg5ZqGtsehuR/1ow2Yo+P
         1Fiixm2mjzSqQ1elvc9Ci62LY+LmaKVJqa5QGT8hwhQzt+NyM4zL7gXRTx94xqDkvlUg
         H9fE0Hs5+xXrg1mN7G8hHX8A920+UrKzNiR1ymUkpeBbHKgsf8urNWXQnwP2y3sAoucv
         WZyerzYN0Q+XCPnH7Bw9TgxEB7fOWG9Mdy6ao+OG8stuPQ7LKQ49Hl0GSZpaLzEzqN2n
         kIng==
X-Forwarded-Encrypted: i=1; AJvYcCVKmrMpTItxBj+UUsK6ds3m6tLBFm/dJJnIjiJmkQU9HhKcQEO+VhnD/a5e7rMq8VUd7Fr3Zw3XnTq4kVw6qDkX@lists.infradead.org
X-Gm-Message-State: AOJu0YyIRZcAkzE0wvvDTBx6NAkL+PN6ZjJP/dKvTYWJdUwJVhtI81kS
	glZQRlVo9z4/W1hVNDjDONIv06MZFYCegpsbLSc+5PQZDKMs6HtR
X-Gm-Gg: ASbGncvE/iabece6q86njz4jlaSjB4Zg4cIaMV/vDyxxFADV/8UvoDh9U4KP9PRxbYs
	CaZUIbsdjrjdGsVVNLSgPtYPiJBRbqEsIEnI8a4hEL+EQwWO4x7yC9d3JYIXyQCTb3C0tg9YJXP
	FuZN3Iw507RjVIn9leFbKlVI6odEFk9WeH9HLq8wFqFy+44ivueLGvA/ztOYd1xbxtuxYe8SzBi
	IYPsvGacGXVowyHorOFtsIzFY7KxlQVWlends5mhpccasS8EmGaE14mkNXu6Nrr7L+rkfa0KgXT
	rV2FuJBKX+QeJ4NvsAln+NDli+enrd377573LhBnIo8ho2bt8tC68nDTuQ41YjU/oiY6LvwQDel
	38ON7
X-Google-Smtp-Source: AGHT+IFKFToRN7zXhbHdXQ/cdww5PsgDL/Kla5r5RaA5iyZqqiHLzqal1BkIz+g9xpxoUT2qzwYoxw==
X-Received: by 2002:a05:600c:3483:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-442f2168b73mr39019935e9.24.1747250324619;
        Wed, 14 May 2025 12:18:44 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:44 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v2 0/7] pinctrl: armada-37xx: a couple of small fixes
Date: Wed, 14 May 2025 21:18:31 +0200
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfsJGgC/32NQQ6DIBREr2L+ur8BKrV11Xs0LhBBf6JiwBAaw
 91LPUCXbyZv5oBgPJkAbXWAN5ECubWAuFSgJ7WOBmkoDIIJySQXuNGqdz+jujUpoaVkAj4fVvW
 6lrrnHIq5eXMWRXx3hScKu/Of8yTyX/p/L3JkONQNs2WQ35V8jYui+ardAl3O+Qvqep+CtgAAA
 A==
X-Change-ID: 20250512-pinctrl-a37xx-fixes-98fabc45cb11
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_121847_138613_C840942B 
X-CRM114-Status: GOOD (  10.59  )
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

The series contains several small patches to fix various
issues in the pinctrl driver for Armada 3700.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - remove 'stable' and 'Fixes' tags from the error propagating patches
  - collect 'Reviewed-by' tags from Andrew
  - swap patches 2 and 3 so the bug fix in the latter can be applied cleanly
    without depending on the change in the former
  - Link to v1: https://lore.kernel.org/r/20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com

---
Gabor Juhos (7):
      pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
      pinctrl: armada-37xx: set GPIO output value before setting direction
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_direction_output()
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_gpio_set_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 35 ++++++++++++++++-------------
 1 file changed, 20 insertions(+), 15 deletions(-)
---
base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
change-id: 20250512-pinctrl-a37xx-fixes-98fabc45cb11

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


