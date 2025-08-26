Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFCECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hkJG+WUZSpEwjO7HzoCtPjyyNbjxdrmMzotvlEggg7g=; b=pdep44IiLGSHYE
	ao9r59OILrjGf+Iapz/m6OEfAmnf/qZi3e+ZcS2zoNWc/Wy4OCTgq64ohVATAHbOKj5b1b4ga7tS+
	77tM+r3qFUlBLoaXN4fcZ9TNdB+hqh/VGCu+t8KxEhOiAqbFUuFLNNhENgAgyKeIx233CZBRwb2xi
	am52O/nX1pmOM9wQtl+KfJPv6rY7XnUS6rRnfKmw6r7jTJnzqtMxOBHWqK4+HshcRjCS9gbvBHuJO
	fSt//apavGxHnZ0h2ZKUFMG5oWGJTE9F0SHk8nJ08mIBkzmqkU2uhBZ4AfsL391y76YMDYF4EyWTL
	hqw2RlGzEbYN/6V4FX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqeq-0000000BaR0-1gMz;
	Tue, 26 Aug 2025 10:12:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq5B-0000000BQxF-1eMt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:35:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so33451645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200912; x=1756805712; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkJG+WUZSpEwjO7HzoCtPjyyNbjxdrmMzotvlEggg7g=;
        b=PM74xbw+JHn9vSAE1frocFso1083OKK9sPlE+360nPje7/rgGK8H4NbYQnHVnVmmJB
         lfBY7GZ4ciscRkwVJ9VYeWs9OozgxbUUtl0r7bCXPlKwWzbAgEOb1UAKm14e2KCuZpbV
         ITlYgyhaieDYQLYsYiZGxcQwwzD9JU+Ljq1OtJIVuAHAJa6JOtDNNNYIrzz0ZlzSz9gj
         E3y24Zsr5tKwjucokwpsMA+5gt+DWYyYiIhCVCXZGUStftgdqVeEi0nUKLx8dHkQ0KKL
         eD3Wn5zv3uhcj4kMRMuTDjUKhqxr6ZZvLjJJErUYmJ5as6Qf9yh/2QQ+gSZb0ZN4xs7Y
         Ex8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200912; x=1756805712;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkJG+WUZSpEwjO7HzoCtPjyyNbjxdrmMzotvlEggg7g=;
        b=HwQFEJbR9Fjmsw+hywYWl4fx8QuMwxJElnfNPDoopysMfULdLE8AVoxM/mOfREnJWw
         sKOvaby6OIZIvVeHVhZOoVNxM5rg2oF/NSww3Ld2vJcDE1qwj/H2WPElRYzi3L+0J4Z6
         7Zj3UOsaHpRO2V+TA387M+XTsKoYqKYr05+TdgKgeo6PZBBl70Pt2kj3qh5uSlwGMswM
         47CAHbfIKhfmC/DTRo13w2kz4Pm3PYefP/gsCutXrtZvPLLtoxGka/5G/lnFGNn9yjWb
         TtXnxoOXFZ/Cf/DEcYQzVIpVT2RL/WewsYmhpNr3z6SWG6opt8atXKArdKw+esfzRXIK
         lLLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx1FHA5Iu/Z1M+LDQFcBhU8T/LR5qNxfZso+ku97D317jBu+QgehronPgBjRdR9r92bYkaVAIWR5ZS1JTvAGGH@lists.infradead.org
X-Gm-Message-State: AOJu0YxYD0eLz2bmVe4WFd5xh3fD8PVW4AzyiQN9kB2G3ExlSVq7ey4y
	r1qKaXIkf/Zc8f9E8sgZzCbEe7WAsLziZiM3NVvZG95QhZtkda99N5kyFH1WUJOgxOE=
X-Gm-Gg: ASbGnctyKKMbK+dAzs7HBw9ReFFpx6oexeKNyCT+gsX/3SkO+y2fukJ3jhd29eEsh29
	NRXgndOXJ/XFYvkPOFyqLMiocg5JR3Q0rwUtfkGJLmw/q2qcGfQs2wzfv+20ubU7skHbBJimiv9
	ozh7EBrQDc/rZmdQAmvr40CGv1s5EG71Q9vacl9Z1uGQ6jxnSR9ZT8I0+4trhdXTl+Q7xHmqLmp
	dtE5947cCKOqT6GMhQ5XWvhzbh01PCzkICV/5Km0Xgcib7pn8tI31SQh5po9XKmutE55xlcK1od
	iD30DS/Cw+5zRJpqfazUjxoDg+Ysi+GmcLR1ZUmc5shO0pn2mal4IRL4NoEFrrD9N+R3RT8NXF8
	dyJLkA7PPRNHpvdp/1hbdtsIpLUI=
X-Google-Smtp-Source: AGHT+IH2xF7cWf9zPiJpCZDblnQIkHuRl4owRmxgCh3l1f0u4tvEtpqb3bPUkqR7KcRXy8joxsDAmg==
X-Received: by 2002:a05:600c:3b15:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b517d4580mr149020165e9.30.1756200911704;
        Tue, 26 Aug 2025 02:35:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 2
Date: Tue, 26 Aug 2025 11:35:01 +0200
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMV/rWgC/x2MQQqAIBBFryKzbkClSLpKtLCcahapaEgg3T1p8
 /hv8V+FTIkpwyQqJCqcOfgmqhOwndYfhOyag5Z6kEZpPCIHvK6Gf23BF4w23RqlXQ31ZlSud9D
 +MdHOz9+el/f9ALS1ILVrAAAA
X-Change-ID: 20250812-gpio-mmio-gpio-conv-part2-0ab8e4871d4d
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Q4ut4up6GX/HdckreW0R8OaX0WDAeyY5hviNTW/p74Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/IsQ61XrGh+TV0cTJdfuJwQ0IU2AzJI6U6B
 xODhnvRaf2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/yAAKCRARpy6gFHHX
 cmJuD/4s6vLLL4IJvlMcBRWt+fL3p/MdEMPyIgv+IS4S1jqjqxW26UsphEQIOFT4zd+2Ei6Qx4E
 bYgNLNqataNIqWb6AtcX8wjj3CWWIqrMTZD2ZXpw7rLb951R5Dotmo1R6kM58oDlTaNJFZjbg9n
 ChkAEyNlA5GRhB6foaz3+Do5OJTbItx/BFm0lH2dyCt0s/6WsRMwal4Iv66YCXtvOGUGiQtRnEP
 Jl0NjctXUHuT0bmeBEDxXiB9np1PybcUOTk1AhTTyvajEThwU8fCt+oaavXD+6mn4QIBRfnqyTl
 jYArmBFJBtDETk2cAIcyPpsRLaXJQfHPIXK+35E53tBd1AVBBWm9wpL/18OzvnFdcVibRnfb+dz
 DpPzPGdSpxkREQGdv1S4HNICQdTQ/FtrRdk0CEJluBKeMXcPSEI0yuhZMEORT20nSri9kTKJgAL
 BMa8VJSwoEoUkx2+GBgUcJYRyPlZ5d4vMM3eFjuiezT9WnyRp4/QLxWBVFxrBIdwvb30HB3FZ24
 WMbajv8vTcO7A4A+txRMVD1IoNqnjKQ5ZR0KDXSRml9ykbYzC8TKlOXRAEJte+Z96Yt5BWlfzIc
 5oHMXijNS4BrvrtEiPsnVbf7kA8XquJdZMs1dq7KwCkiXlLtRlhonbsjN9GGfNZBkyhVrchsZNd
 QX+14T53A7wjY2A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_023513_579039_250758B7 
X-CRM114-Status: UNSURE (   7.87  )
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

Here's another round of patches converting GPIO drivers to the
modernized generic GPIO chip API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: xgene-sb: use new generic GPIO chip API
      gpio: mxs: order includes alphabetically
      gpio: mxs: use new generic GPIO chip API
      gpio: mlxbf2: use dev_err_probe() where applicable
      gpio: mlxbf2: use new generic GPIO chip API
      gpio: xgs-iproc: use new generic GPIO chip API
      gpio: ftgpio010: order includes alphabetically
      gpio: ftgpio010: use new generic GPIO chip API
      gpio: realtek-otto: use new generic GPIO chip API
      gpio: hisi: use new generic GPIO chip API
      gpio: vf610: use new generic GPIO chip API
      gpio: visconti: use new generic GPIO chip API

 drivers/gpio/gpio-ftgpio010.c    | 48 +++++++++++++-----------
 drivers/gpio/gpio-hisi.c         | 46 +++++++++++++----------
 drivers/gpio/gpio-mlxbf2.c       | 81 ++++++++++++++++++----------------------
 drivers/gpio/gpio-mxs.c          | 31 +++++++++------
 drivers/gpio/gpio-realtek-otto.c | 41 +++++++++++---------
 drivers/gpio/gpio-vf610.c        | 27 +++++++++-----
 drivers/gpio/gpio-visconti.c     | 25 ++++++++-----
 drivers/gpio/gpio-xgene-sb.c     | 53 ++++++++++++++------------
 drivers/gpio/gpio-xgs-iproc.c    | 34 +++++++++--------
 9 files changed, 215 insertions(+), 171 deletions(-)
---
base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
change-id: 20250812-gpio-mmio-gpio-conv-part2-0ab8e4871d4d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


