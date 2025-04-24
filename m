Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF066C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=; b=O9Gqt9Jy1goc9CfaRTjvAlQnny
	5jsc94ZJjhopFpdW0ez5rB17GxlujACcXOBFaHbmSINo9r46jyM1K4y9fCJaKCLiEBv67qQDB/qT5
	ZJzsxslEj1hUYOnUUAy/tbAukcN2HbZQtezBVxndMpho7/WXzOe1eaAlyt/j37kexTojjP5H1ba1s
	YVM2769r4tqITe2s+3yACGS4lDrpWHd5/Eeddbb6MR9m6OshQ3B7xPrj0qSn69hcBzT7lOvgEH9tY
	uCdHH5e3tvQ3g3bUN8JMsqs2HshAloMSBcbzinZANiSKZRPDwkRM+0TtdlXxxiEm3F54Oa0fC8ZZ1
	T7uj29+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sKs-0000000DPxu-0NNs;
	Thu, 24 Apr 2025 08:53:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3n-0000000DLAv-2WhR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=; b=OQAWeYzSV7qa2slkpvjBQYNEv+
	8r1xLLQb4GWdlRWhzrvHysHtxjKtcNJAHxk+UbWffehkBknQ7O2q0yexP2UPVVoeSYZL+1Ql59l9S
	atdZLjfSCvOpRRemVCiBqtYUdCIqzJaBvRPU6OQpchtgPIX69fbtyt34NF88cA9SvCcxFy1/Vq+CY
	zPcJ8QfdvmdRw0RBCnV78f2MEDk9OA4BfjA7SfKI8z1vYIYQ5FbdTMwZgOfKswC2oc4qHJlrwqMeT
	WS3OBnKQ2Qds/Lu6hQyuktJQUljfZh6f7WnWAJAj0HTdbgqBxnzn1B/H+qv4Z7yxDk0KV+M4SzLEC
	D6dyrQfg==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3k-0000000Bck2-35Ri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso423940f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483751; x=1746088551; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=;
        b=kvQHfVryMiyZ3bAiGWCp/UrK3o8QDgzgncj50yy5/ftFmnNYcPMyy6UvB7BzhTP/NJ
         zVE/oAU1EkZYG9oQaEdClzwHDfGJscNzZ4mLNMIAlCqrdKLV9PxQe5xLYSokFksGvxa8
         D84nojcf0s7pdwGqwrFv2nxq75ov4419GFiiG2+qxZoQMmHOLNpQCOOZ9fLUlKHKtyto
         Sw0O1ovD9ZJVjreaYz0t5jxz92AM+oCOagCtBsfKNcVUA0w37ROPVzDMbSnoRwPr8eM3
         waS6x2h7L/dlIJWD9Ycd8Kq2wJE87aHVGqAF1yCzDlt/6H/eO+WRU4O57miWLRDCW3as
         xH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483751; x=1746088551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=;
        b=atId1eUXhSQC3xlYA9JbwFaMddtjrSqlQobngYwzwLme7Fj16OX/88I4x2FxVWeFxC
         zJmbhnyMEftJ4sR4z5w18vyTRKsbtxhQfZq6yEcsLtv7EGeipGSLm1xI0jPSbTRJqQNu
         U3nDXHjcPU4PzUDEfXQv0ZcWKNjN0HF+M8ToFjPLfZBu0LQWwefcTCdBcYAlVtMFx+Z6
         RF49HOnXgXFu7pijEksqxLGCn536f3lfKZFCWx+HDqIl2jj41/irFc8aMVwJW+XdkbKT
         TXf+96cRSyR0t/lFP04kZSu+lYdgJbXVFJ62gY/HImQ3XHKVEYbQ/IpysCOkBH8M7DkK
         mrAg==
X-Forwarded-Encrypted: i=1; AJvYcCUb46lgfKSElSkG3Exb356bRDSn1W+I8ejkaZ0UFw0LHnliqoZsw3fRyVyBLS/HEW6XXsJ+bC99RFYLn4uaLyIe@lists.infradead.org
X-Gm-Message-State: AOJu0YznGrh6y9ma3rUFgke8DFkN2yy3bZwpB4wzVTL1kWimA01ZEv2R
	rLiuXe+GjriypHVIgHpoofwn6dlKiQy/LivKgZoNq2iHTYVxqppWMtXtFSb4AXo=
X-Gm-Gg: ASbGncud9OlsZuV9lpSco37/zg7SwyukZX68sQnCqGoqubZGt5zx0WB7r60M8HoTOze
	dJYDkz+bss+qRrlRKcDyjXZxn58sjuhe3WaXDJOA6GcOaIqBUURlGbm/XDFyI3Vcpco+Bh6JNXE
	p0cUh6h3tgOE34qDxxBHLSAlClBKYgwmR691fk4qiHPShkDfgGdIwY8FrVVjX3Zl7mm05GcModI
	lv2MHQ7TGo2iBSc7eASv7cDoo7UC8nOjevLA+iiQvKpTkn72yT1lTg6OMvk1pljwRU94/Q3uBUK
	eWzUj/+lG9/ejmpr3A5cDUhZgJ+SQKbmzg==
X-Google-Smtp-Source: AGHT+IEVNUQ6vip2brhi39nvtk6MkVQTh+2bIVjwhO/bWPyTJvPXnQpR+hxBTWqkmpl4+az5f4M2GQ==
X-Received: by 2002:a05:6000:18a2:b0:391:4ca:490 with SMTP id ffacd0b85a97d-3a06cf61b5bmr1267744f8f.29.1745483751476;
        Thu, 24 Apr 2025 01:35:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:29 +0200
Subject: [PATCH 06/12] pinctrl: ingenic: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-6-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EpaHLTvHgujEi7qKfzUhgTml3Oo3ftuzcWIJ8X5naTs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffcqRFqMqwDfrINHgXeUxjJc+Heti6mMqltZ
 WXN9WyQbmWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 cofZEAC+M87Cf+K0esqTbzfza67g3hY5z0YJwPkX2vXvmZuWICpN8P5imK8RtM9vESiUtCN0ybB
 hTNiizbnx9EY0sYuvoh714dAmY5WntJSjg+lKkHxYaFY6O+kKPcQks2ESZNLsGfxCIwbDjx8UE4
 dnA7N2MMnPS8EHdw7onAjS5gytn0XfnCyma6MvFGEEirp8OC/7UTcsEttr5kLpIOt4qze7JZETn
 c2Yla5eOk3uSZp0IWQDbBkMnxMJvqSA4uUuiD32PERh/cGH6Oi9u9nkcYojNbnhFVUnNgxAow3j
 GIWL6FS33qlbPsXXexga1/6/bHbdKgDL3kcsbJfT7ROdq+AhtedMoKE3uUnu6SID+u7yy1aIrMV
 u1VfeW00/l2wDrmsXSb99WtG8SonrP0w5jQe/uKxq/lUdKqkdDL/K048p/84bM/K2FaTXS5PqMa
 LQYoovAMpXR7KiqLnNlvPkXUcMQbmXmJ9w7sfdj0tIrsds/fklzsW00FLM20w/UWRnBoPwkgcsU
 s5fKhyEWdbM8MraopZYWx0OkbqIL05w24OOAcEymloFAxHQMBJEDkM9JKO0iPMkeECvZ79w/syz
 fjW9mwYO4qG30U3wUD9519EqOnbGP4olbfbcmmkC7HSPkHjZzbmWs+VYwUqCBTxWMAUIsCaLlbk
 hX+zipAXZL6tN2A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093553_062440_59235C37 
X-CRM114-Status: GOOD (  12.36  )
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
 drivers/pinctrl/pinctrl-ingenic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a9e48eac15f6..3c660471ec69 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3800,12 +3800,14 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(irq_chip, desc);
 }
 
-static void ingenic_gpio_set(struct gpio_chip *gc,
-		unsigned int offset, int value)
+static int ingenic_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
 
 	ingenic_gpio_set_value(jzgc, offset, value);
+
+	return 0;
 }
 
 static int ingenic_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -4449,7 +4451,7 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 	jzgc->gc.fwnode = fwnode;
 	jzgc->gc.owner = THIS_MODULE;
 
-	jzgc->gc.set = ingenic_gpio_set;
+	jzgc->gc.set_rv = ingenic_gpio_set;
 	jzgc->gc.get = ingenic_gpio_get;
 	jzgc->gc.direction_input = pinctrl_gpio_direction_input;
 	jzgc->gc.direction_output = ingenic_gpio_direction_output;

-- 
2.45.2


