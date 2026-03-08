Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F5DF55106
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 02:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iIcO5BEsmaavjxp3pWNdUOixbx6V+gvKfNkKSDPbOxY=; b=j/+N0m9+r6FDYGRZirSZGgRVsC
	8bydFZeEkStrawL6I80LrVt5x2ysrRRf2RH3kZKV9vs3ThLnNcBq3B1caw3i06/TRt4sLi0gZmleV
	6OisqlMCHBkvNZcqXPwQ0jDIxKH9DCELGyTZCVKplckXkfzPjkkw47TEODxLgQa+GMIQXKmH3LGeS
	v/h+Vryt45XzNBKooVaLCs9+gGipOFN0kg6376s8DIcN26SlRuzmu3ID/jKjyty1q36GK51GOr0Ou
	TAh9MWuTh3nzD15WcdADas785RnNP4pszW0lSRWnsYqxKWphNs4vcleUAG5PakuGmLeEutMzKIfdc
	19ywBe5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz3gT-00000005dqd-1NPE;
	Sun, 08 Mar 2026 02:15:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz3gQ-00000005dqB-3Med
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 02:15:55 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-359894e17b8so4921099a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 18:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772936153; x=1773540953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIcO5BEsmaavjxp3pWNdUOixbx6V+gvKfNkKSDPbOxY=;
        b=eovU4NyFV0v9vvBp2g4osQaQg2FZFYmqoy2fHvtrRtqFSMChp4u6WJpvsxRS8OMEdE
         2MxnjZwp1NXe97SJhXjTT7Y/s98Gy5n7EIITJCq0+4fmDii76Rz63Ve4HId7gikAwdxZ
         0qcVW6UR2DQeLgbAblszTz1Cw0NKCx2KWg7a/Szj+TjhwUJe37w64q1Fbg36VKZU7mbB
         4iNcyN2MhP5jG56nDzCHYu0j01fASnEufGgh9bFjzZbTQB9Oo40Uhnpj7/c7s4rglGQ/
         hnXj5WxdKxW8UP05PdwKudHpwdYiTIPAEJPeOH5jykSacylK1FZCGfQgF2oe95w2+yB2
         bC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772936153; x=1773540953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIcO5BEsmaavjxp3pWNdUOixbx6V+gvKfNkKSDPbOxY=;
        b=ZOPyj8fTH2h4TogbbZv6H2eWeG9ElScoHPWakgQyw5miAq28QAY4OfJqZVNmG4UwOt
         eF5sbBY3mD6sZFfOteOhVpXYJ3F+5HcC38HBaYKdA50O3v5pfO+J6s4PMm/RcZXuiw/v
         jHrSG9KgI4zGgLgUtcaOzLF+Y1QIAEXTRN3x1mEFLxdpXC+5n9O6zF0B1VHqdl9f32bm
         QR0hjV4zHHpT3PSyY2XKtseSHMvLHjNMbpotyUXTNmNlPALGLraMUSU1tLz12Bp0AIMz
         BnHMciirkeolHm+mCXAnRZ/yXScqTC70clkKgDhKtiLIZLvxWsaXo7Dl9jFu7e/4G3j6
         yAJg==
X-Forwarded-Encrypted: i=1; AJvYcCWSp4Za5O8ecxUpCUAnuitIqFP3qmUu+98k36d1Q2eRAAQTzhSgmZgzBStjMJpnGZdalbTOIC3jljt9KRN/EvL9@lists.infradead.org
X-Gm-Message-State: AOJu0YwSiChidqavOMM92tm1XY5E6K8ZY69bLvYWZYO+3If/9tb/57PF
	n1+wxoeekZW2A843d6JA4oIziSM7/jnqzSnEHNFQJmdjQkUeQunn9RCCKfsQnxvzeXA=
X-Gm-Gg: ATEYQzyzpvyUP+ZZPDoPZjOi1bynCjFi5m84Lf4HLS1l9/K/RnuJ+Y6Br+p8Fo84tQT
	faqC2OudkDlU4aPbHiVdHqoQzyQSPSCvYgQ7E8bfJ0NIyBNOb0PdsHdk1J5RxEbIajfLHB/uUxG
	8R3F3Dh27TL7QYglaNSKIPp32aKN1ULlqdTSAFel9fgr6/HBHJ9QIZoP9ke0NARAi7phWxy6UTs
	PE8Ft3m+1dKf6OZJVqTD4y4fVefs63ahYoZMo3yyb/xrdro4zltdem/EXXjAovhTamKOGdPIyy2
	UU4376nArQ5i1FExZfsg8L1tSlunXRrOaapFUR6MqQtobekxC8liRxeuY91ddNfQ/RD73OxYSei
	nV6lMksN2jVduCVbqpmZHUxjftaa/Okc6Zx0SKZUG/FEFE3QVDrQMBbTvbomtZG81UdU21kpMqh
	KBpeqFBGOL/Fvbjp9eRPall8HFhG+DGLTMPDTxL9Tim2TUYaqk6O1blA==
X-Received: by 2002:a17:902:ce8e:b0:2ad:ca3a:ecb0 with SMTP id d9443c01a7336-2ae823ac6ebmr70405345ad.25.1772936153317;
        Sat, 07 Mar 2026 18:15:53 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840adb42sm85962385ad.81.2026.03.07.18.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 18:15:52 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Daniel Palmer <daniel@thingy.jp>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Romain Perier <romain.perier@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/MStar/Sigmastar Armv7 SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: msc313: remove kcalloc
Date: Sat,  7 Mar 2026 18:15:35 -0800
Message-ID: <20260308021535.48098-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_181554_843167_529AAF5F 
X-CRM114-Status: GOOD (  10.91  )
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

Use a flexible array member to combine kzalloc and kcalloc.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-msc313.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 7345afdc78de..de3e6da2a089 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -483,7 +483,7 @@ MSC313_GPIO_CHIPDATA(ssd20xd);
 struct msc313_gpio {
 	void __iomem *base;
 	const struct msc313_gpio_data *gpio_data;
-	u8 *saved;
+	u8 saved[];
 };
 
 static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
@@ -631,16 +631,12 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENODEV;
 
-	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	gpio = devm_kzalloc(dev, struct_size(gpio, saved, match_data->num), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
 	gpio->gpio_data = match_data;
 
-	gpio->saved = devm_kcalloc(dev, gpio->gpio_data->num, sizeof(*gpio->saved), GFP_KERNEL);
-	if (!gpio->saved)
-		return -ENOMEM;
-
 	gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
-- 
2.53.0


