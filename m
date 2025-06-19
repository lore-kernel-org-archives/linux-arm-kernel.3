Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B44C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L6Kp9os+xz5VTdOcLDt+j5wxoDnuHFI6sku8Lw3uoFk=; b=hCz02DXjhY4F2c
	8sxeHevRHlYtx38a72jjTToW8T6L6hT+QSwYXZoffCUVvjyRlAjM+EjLyz/8y4KecW8XbrGHH2YbC
	OfMayN3va/Taix5RgBQNpB2gHwixd5jAj1XPFd+HY/h3/kM6OAkb12wceA8Ab8DCyw9dkSSVBqqPD
	GkUo28HCwVPUkZENWJbt6qnM1r8HR57FZ5m9VbTUfstd6yw9ZSsjf9DnSxSnGJGLYTfLXGdFiLuR5
	3vE8/tSbun8tUqUaPAJA/ZloTolSVnfOp080x+58A7+m83cVR9WFnie+OtXPWUGRooTdzaIX89FQ7
	jl1oKvNn5Ud8TSaCoh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSC5m-0000000ChFw-3uZm;
	Thu, 19 Jun 2025 10:01:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAi6-0000000CRFq-2YVc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so449132f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322005; x=1750926805; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Kp9os+xz5VTdOcLDt+j5wxoDnuHFI6sku8Lw3uoFk=;
        b=e4KMqlLEq6QTFkvFhRehWJLHrFljEthg8dI+OmQa4IGNeJxc8OTumaTo2J/TQUbKWc
         CJ1GD/9bMqsD0zL0Ju94rOy+v7exEzWzWFrGI9GkekP8KrZ2DciAt0eEaXY+IHY1WR9J
         SvEvq8aixAvngKwRRWv2J55QLNwpOwp3MBb69fPNmD5tOR+4bAlUDwoYV/iER0+XG2fC
         z74fkyuY5rzvz4ot4wMOPFclxjXuVC2XjBg8+AWXfBDlI0IHhs8UfhMcp98KB38yvdhP
         WuvrpnFuRn08YOpYS18Nh6cj/Da3Tq2ST1UjzoCwEqP0YxysFOjccdKs/ipQufvwj5dp
         +5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322005; x=1750926805;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6Kp9os+xz5VTdOcLDt+j5wxoDnuHFI6sku8Lw3uoFk=;
        b=iP30gsHohdQU4DSnS+ICrSXDYvj7FbQ0Eqm9v/ge7khb+VkMzS2pP5P3uf7EdXRuUu
         EqyNBUEIGINjLLYgsNRoXuoL/MVbQ17t3Lc51ABLtOdSwWOhmtRB0F6kyPb8/1ceoy0A
         hG7hUBo+VuZWKw9U+cNgYKxO4p6RAc8ZWFMhMcWWz+x8FgmoXizfrqUJtRyOTfnU93WE
         CZ1XfIkPKzMBoccJP4g3cTn1p1zK0MXM9P95qX/SkW2B36HZaV8A/t1+iEa7mvmJhmAW
         pyfi9rZXomk5+DyvN10QORV9qfp93OR/gKbnuRMb87C5+qYbwhCy6+UccCNruYUDeMk+
         o9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUMnDj4pNGBhkhyApTq5MjCuUvLCR5VovgSZj4sw18LHJww5MGOda9F4+HDEgNLDUpLTe5xiGt0okqTJZRKWB9A@lists.infradead.org
X-Gm-Message-State: AOJu0YzwRlUl8unmFLrVKNcwAfuhFXL1tRrkYT59h0bN0KytlOL3Q759
	0ljcXHSRMzjyWlJD3sQVqxRDcosNLSiTz5RbHY95PH6eUq4bY0evJf2dOSk6k7MQeqk=
X-Gm-Gg: ASbGncum60DO4zbabCpl73iY+GhX72gYXqSC2kvIFCKxTT3g05Gn81F5ih9c8HOVnii
	+z5/nA0nM2PFrnfvhq8HPu1oi/nVXgRo1qOM8ZxLXeyenfVVm8YyHoylc3bmXqHflB/edPKN+al
	cwdK6i8v6l/T4QxqHIQV/8kfFFGm/qQkHb6yY2+O0kvmXvjgosN/j1l+kfU2JwN23EEuEAg5Z/5
	eCW0jvxDODDw5UFE7fIvebcNxxHqmF0IBtYcLtNFQna5ziSnZVmQH5NPtc1TjRKlQ6r64NZ74Of
	Mu8BRe4OHLPQ/G7JZfiIhSWsJ2ieTWrQOc/2aFtz/0qAL+jTQKleJcKX
X-Google-Smtp-Source: AGHT+IFYckMm6TqdR+SMt29zt/hysoGmTKQvGlottOkHITi2OJ20YHyb6IYgKfQEgRh6pcZHDimpKw==
X-Received: by 2002:a05:6000:430c:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a572e9c412mr17795119f8f.58.1750322004914;
        Thu, 19 Jun 2025 01:33:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 00/12] gpio: use new GPIO line value setter callbacks
Date: Thu, 19 Jun 2025 10:33:13 +0200
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEnLU2gC/4XNQQqDMBAF0KvIrDsliTZGV71HcRHsqAPFyERCi
 3j3prlAl+/D//+ASMIUoa8OEEocOawZ5lLBuPh1JuRnNhhlbsrqFueNw7jwhpF2lFSMpMnZprW
 uawzk6iY08bvMPobsheMe5FNekv6lfwaTRoWdqltVO6cnb+4vXr2Ea5AZhvM8v1gCtuG5AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JA2MdK9R8F/cOt9CUzPZz/x8ehY+74kE0g6wA3wRlHU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tNX/mWswsFP4HvzFmsSabfA47FF7DtFw8Jl
 09zIyLDComJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLTQAKCRARpy6gFHHX
 cunRD/9vOYV44Hogp+oRtgtxtMzTmPR/jtz8WK4sNlre2T2WIXXIQVGwBDZYkLX/9JO0IggsrRg
 5KbC5YjZhcef6xGufV58QXSUwtr57RBdAz0mKoSnP9zZYAxoud22AmqWm0GuKUdfGyQwLAk/N27
 d0f6rQAXmiMWYB7QNcdYjKAXY9l9EUaRvZsg7h1EaBimz+TWvZgwZ0INAxZfonXhOSKOW/+fI8F
 arO6dq6dIqMPBHz9CIX33WGKstSq64w9ROgBHTT6+s4lMOFbQ2EuCmyH65UwYJrv5ZgKSvkemnB
 KMixt+xY3bUqavu/BU/1qeuDHQfltZKqyDFT6RUgilXBhsNdHasaMyhTWOt56OANNSgRZWLVrj6
 VLcpaoIuvdqpXnXwO5ufD6Vke6/p+ejZtlcK0L56OFESwJrtdGk+gxGOnomrjm/5LRyfkO+1QoO
 B1LhRJ5UUQoFO3mPkLGTTYuFwd05KDeTi67lRDefrekAuXDtQw+5+8WIzMcJCdPYYHzztt82F2p
 sxoGc3Qt42sTzluSykzvqyoV2ZMWnerxNKjKzBDoRwuycmN1G80nrXKvps9jDb+Fob8U9s02dRy
 d2hqXFuSm8UPq6hoQqa6BMjC4dnlW+FmcwPA4yS6T3lU1oIh01M2TxTv3Fq8EBjFcZFsem6jjK2
 LGqnxwEzBeILlaw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_013326_891400_2A95E63F 
X-CRM114-Status: UNSURE (   9.73  )
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
Changes in v2:
- fix a NULL-pointer dereference in gpio-reg: use the correct function
  pointer when calling the setter callback directly
- Link to v1: https://lore.kernel.org/r/20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org

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
 drivers/gpio/gpio-reg.c           |  8 +++++---
 drivers/gpio/gpio-rockchip.c      |  8 +++++---
 drivers/gpio/gpio-rtd.c           |  6 ++++--
 drivers/gpio/gpio-sa1100.c        |  7 +++++--
 12 files changed, 63 insertions(+), 40 deletions(-)
---
base-commit: 9da895e97057ad946b2e727694af3fa5ee51d527
change-id: 20250617-gpiochip-set-rv-gpio-e1e864768942

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


