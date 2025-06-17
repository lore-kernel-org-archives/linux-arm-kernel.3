Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC46C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlDtpw6smBpfIslmsuGCGMOBJqH80dy6aXMZgZ8Sqro=; b=AFMMceJvSoSwPCsEgPYkAT7FQB
	dn8UL5v8UJnO6iqrwXAyxhkcqbga5PbCM+Wvut3b//x87aAuWPe9W8zJqfKgemixG/fV2SOaJ1oaS
	5LdzXhW0B3GL1ju7fgaIXZBTugeLpnxkU/RbEYB4wMOs6tZDdhp8QvP+vaC09xgK4Je2cW/QFR1Q+
	Eg0HXv9wOeD9Kp+0ptUUfie3LnVjUNFxyhVSC+4bDU5sGBUX0aX+z6DseY2g40+GtM6/3cGh6wfkJ
	vX89m6YWqssiknctVbUXp4jTOhgvARE/rESRRzkeQxJHjvU2QKm3zi0+0I4hLfNixC3c9T+hrEHvN
	73dLr3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRW7S-00000007Iti-2wby;
	Tue, 17 Jun 2025 13:12:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVN2-00000007B4M-1cQd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 12:24:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4662114f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163095; x=1750767895; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlDtpw6smBpfIslmsuGCGMOBJqH80dy6aXMZgZ8Sqro=;
        b=ehd+mql7vY29r0N0CAtrz3bBB3V6iuidRGoDF7TLIkQ4/N37nPywxGieMPiBDOVfag
         ltu7vg1EOeaybLXYLvru3xH7MEkg9u/a5wAhTqefEptcG5E/CxJ3JiUZ7+9dCbMIeeI0
         D0pE0JkynLqV3asxb0k3NBXpUiA//Ji3DfNXRjo81zPqDldjZtpIACDqMhQ9W81uijZR
         69/NrszYpEF8r0OKEmjB2bXy7K3NMeUN5HZuIMkkZSA7iG0N//7P+LKYm/pEoiJXfrrY
         /sMJRQbWkmencRWIY67bEIZA56e+bl+g9pg0udHR0AGHIsGYqEU1DVaOGTGIyqhhKs5g
         Kl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163095; x=1750767895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlDtpw6smBpfIslmsuGCGMOBJqH80dy6aXMZgZ8Sqro=;
        b=KaTwBXBVfVcgWKlxOE9/Ro9prIUZH5aMrC3UyjKOMJN0upH56Y0o0MSqU0fcqP6fHm
         aZWpL/5J1zsHLFDKUEdRF9jDilSpPgtaBDWMqMrxUxE/4G/Fnsg1cveAizvZ9rMrorY1
         E+Tvoxj+e0xxgp+XkwrVVZuHakmdEPwUKbqLug93j5Gv0Zvpb8S0DYvNPgAqjTwMWX9U
         wvezVDB7/zz/vNhF1kTDHM3APfWZlu9+CL5eijNwFST51pZJJ802mAD4S+a7Xfmel3z1
         FXzZfXfO64JhsGfa2JUmf7K8UuLpEMRLhW2YAE9ApGlmumcXj+TvVVgotlX2sfja+ejI
         q1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWflutJ5J0U6dP1bBl9deDTJ/0IJWeO+H8ZnfiC/XNVLyIZdV9SalwISutXF5C+M/6tOBy566WXtlfY8gNJy+Wt@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8I2Qpj9IqsrhPYi0k2z6eqlclXZTNmEz5DW63oRw+VgkYbN+i
	khe+T5b3WleKiSAk36x0pebwkCZw4drhYU4AJPY4ul13vAtLKwiWnXVUbgQLmtvQTE0=
X-Gm-Gg: ASbGnct9rEa4MaTgtUU8pPgL0ytQGzUyzPGRcwMFSCYBL3vPEGo7tZ3OPro6z0VqjNX
	Mb4N3U3gFsJxUD16Kh5CLZw9X0RWmhRuPo5+LfJ6+F08DpLnyKYtxgOIBZvJDr7JkH1753Kqxo8
	gUZxIIVtBaHkP+0T6gBo8AKSjMNVH0v7/2h8XM00eQCuvHNUXG9Fx7XAAR/UuCbHz+bksuPkYEN
	T/UaT0BGOb88GkgEOvAJOE+9r9JLA0806RUJuY+yTpm/5rBz4ovBU+LQ9mPcnMa6YRTK+fSf2S6
	pVN+QvRulz3k8trnq7hptMrCiYniQPYG7N+dUwIpAvWONNj294I1QnSO
X-Google-Smtp-Source: AGHT+IFsTWQIKZSJGIY/CXmS6lZIJ3ZenpODtlq8yK7uNveBH+mmtvLiQ+k6AgHQE4CwrhnHTwO8nw==
X-Received: by 2002:a05:6000:2382:b0:3a5:3bdd:6cfe with SMTP id ffacd0b85a97d-3a57237e161mr12452604f8f.26.1750163094424;
        Tue, 17 Jun 2025 05:24:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:34 +0200
Subject: [PATCH 12/12] gpio: sa1100: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-12-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=c4Isjx61IsXwy1L10lydMFlqZBELu3z3ba+yBwH+QRc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6Ipp+OYSt+ikqj2UvGKKNMCmar+1zqMNgVE
 W9N6iQSuQGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeiAAKCRARpy6gFHHX
 chTeD/9I14P9RY3COUbCjQedgou7h73GVSmQAfpsU1+oR9NX67oKSF9DMr17US1TFf2xZifaFyB
 +A7PUaOjWr19fNg2617gbOaCxUfM1fd75XPrCYVHaR6PUWMzfvo96J35H4Aq1E4rp3nv6j8oYnp
 39K7mMEvi66do04dqvXYuAp3nGAPJ6+P7RXanRnhC0jbJ5JbGuJdG2pSH4gX8+YW3cc91WVrb7d
 4GxpxIYGWe0bGcDqZ17neqzVyzrpEluCO/VrPr/e81YyaUppzx9GoGtYMBXtNCd80QGyeAzfkOr
 FavT1ZDpRsyWPsF7c+aJ5Lk2ADy5FyToc5wtk1/IEhbCOc0ecPrrl28VY8mITwHwVpRtPIb48LK
 40+TDflwhqQkl4wvcZUGrZQJYaGEALsIizpjR0LRHe/nQxSHyjrudyn6DrrgfwWkzY9UBJsQMA8
 skB+VxmtuPO4gOKaUTkFlDa+LkasazYamiCrWNrJvXwY6PWop8tn0K8svtQ6P8S5HWlzSK0N6UZ
 Rxn9y/tS3F6w2S7c6XQTEEvtzi1V53Z+wxP2I/VELpg0AZVFcM1+55C+GTwbWshUf1qcMltwGSP
 vupnX/UiKGo9M3TMglMKZkB2CyR3GvqKjQ2rjUXGTgNK2IXSeKzrZbsyRGkQiOJDgGbpYuU5p4B
 SKaO1D2IiPKNZTw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_052456_435879_9AF94F10 
X-CRM114-Status: GOOD (  12.64  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sa1100.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 3f3ee36bc3cb19a7baf530def0575d2ff09dd3c5..e9d054d78ccb8485b9f662fcec385fe0d0edc0d7 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -43,11 +43,14 @@ static int sa1100_gpio_get(struct gpio_chip *chip, unsigned offset)
 		BIT(offset);
 }
 
-static void sa1100_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int sa1100_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	int reg = value ? R_GPSR : R_GPCR;
 
 	writel_relaxed(BIT(offset), sa1100_gpio_chip(chip)->membase + reg);
+
+	return 0;
 }
 
 static int sa1100_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -96,7 +99,7 @@ static struct sa1100_gpio_chip sa1100_gpio_chip = {
 		.get_direction		= sa1100_get_direction,
 		.direction_input	= sa1100_direction_input,
 		.direction_output	= sa1100_direction_output,
-		.set			= sa1100_gpio_set,
+		.set_rv			= sa1100_gpio_set,
 		.get			= sa1100_gpio_get,
 		.to_irq			= sa1100_to_irq,
 		.base			= 0,

-- 
2.48.1


