Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F2DC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrEXsrmsMuzA+1ugG+tl/Uw8h+zTajU0t+jnzMkT9nk=; b=LK3FwCWWTNtaLN91JHypdnOyOp
	2SSenRctCRe1dd7flc/VN1QfbywXbiAxqmrevn/BQRr02Jar8V9DvSt5u+QpzspuxdAl7sNkXePPz
	ePUKJ68NPVTFLvsq9gjXH+B6hhZPExOo0u6kSVQsxInFiVD/2MTnD0CN0rW/n7NRIlG/q71E6fcZ5
	gcz0kstzzgFG7aJrNG+1uHgKirDWEHaWGsQTIAKG4ng0D1bDmWuNBgb2qH2TuB8/0MjVrwX5gFkTe
	RaLg8ET+UUwgZ+kpArqGgG8UxnylLCROcaMpwK0KbhLETNBd4gL0TdWVlkEIie8r25l+2H1CFnKAm
	9aSpFKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYha5-00000001tjg-0ZJ4;
	Mon, 07 Jul 2025 08:52:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcT-00000001kM2-3DaB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a54690d369so2769902f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874632; x=1752479432; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrEXsrmsMuzA+1ugG+tl/Uw8h+zTajU0t+jnzMkT9nk=;
        b=MeV4n+EIh+VS0lPtyHn3DKFnnPh7VFwQmESj45cZmr1xd5FLQ5WlHMe/agcm7317aI
         R1uvrVYQFhcSWywQHzhaJdKbbHRB2D3kf/Cik06uGtMwRSUld3utn2sGgc/kQTq8UBJj
         Dlgub4Hr4ecMAeIJU0b2XSWQX7q43j2Dvq3I998E2k5XfIupi9Uba0P0piv4y6euUhzQ
         ByhC5Np7OYF9kVHuG+v9GDZ3nrjCS5IOagOAJJHTmdzWLBhNOxQ8CYA7LSZ9GBiosVR9
         /ET4fQ44jDCPatBsBRy6CVhl/ete2vM70WyhpYGXWvxFMya60T2OEiiPcM5+NRqIKrHI
         WSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874632; x=1752479432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrEXsrmsMuzA+1ugG+tl/Uw8h+zTajU0t+jnzMkT9nk=;
        b=CbNj6CDt0HAnj+QjKLGI0ZYhxEdWPVpsTbobUmBXS7JZsf4CZM4IMl36WJs1Pgclxj
         oAmdW3+FwOyexBxtOw6RdUM8p2nquqBH/G6doDvyeAywDKTW4+3+zK73K1dQzlKgguYk
         wYZWZv3Tk3kEsz5BRv4y34C+G+zd7tr5+IEjR+tEYqIDSgonriYh4IS7G1XUGwQjU9fg
         BGvrAcDASVBo+d2lAbIusBmtMDmRn3/93VP+uJA9swlY0M360l4OiSgwunHIj3VXoQYQ
         UQceoUfO/BRN2hnai2IjysT+n98Esarme14QaQmO99zkN2bcalyFGsMsBqVsbU00d5fw
         N23g==
X-Forwarded-Encrypted: i=1; AJvYcCXcOXpm2xfGWbZHygzEZ8ZP/UMg2TQJrbiX67/h3y9fbu/IcjD6J/tewFBLd3tepgoVLHVdRa7MWeelzJBZ/SCb@lists.infradead.org
X-Gm-Message-State: AOJu0YzjgkOlNznnViVdm9vRqHVuE8df+2aJkS6bepH+7htmGoQwKHI+
	wo7GVM/kQ6g3eGHwsmE5jrKYtMB8uS62wxsTrYALd7ITv1c7A6d4HG7n/LEYu+tKsyc=
X-Gm-Gg: ASbGncuSuiDqEJljDiRu/ub3t42kwSJDAboC1ryTV3HIifcWnA8XpoTWMa7TUd38x8P
	Vpk11IcFfX4mXk1hkhzMS+OeVaGJBYDPk09pQglAjl2WbDgjaASykCHH6N7inmWzCuZGChdGHUm
	OhoBW220Dk/iDfOA2+t/I3A7Ysa149poypCc37iv+QMOEePre3O1uFBXoU2xAQ9ED0IDtkht13Z
	VHO8MPiAdHYsiMPm8CggcAwqf1ISX1cuLViIZZvoEUBzPoVSi9g0J2EYUp22mp+WfB44hobsn15
	+CJ5XER5JG80oldwjFijpude9powvziTrOfzQQqBfEMPdTPMViDNe+62
X-Google-Smtp-Source: AGHT+IHws7BTgvMwOHb/0fBxy+8f3J4P98k7LhETEkFH9aAE9cXx7D21DbjCELzGj9RNQtFyairGWg==
X-Received: by 2002:a05:6000:2008:b0:3a6:da76:38b0 with SMTP id ffacd0b85a97d-3b497013ecamr9654486f8f.25.1751874632251;
        Mon, 07 Jul 2025 00:50:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:22 +0200
Subject: [PATCH 09/12] gpio: twl6040: set line value in .direction_out()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-9-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ny+P9Gso1Z/D1GfvAgTj4CRCkIVwJInh/rnW4mX9aZc=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhrfDui2kwMyLze1B+VgydmH/CxA8d3hCROGBTtuDeM+EhWN
 IkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoa3w7AAoJEBGnLqAUcddyJwsQAJux
 AaGxAEjlCH5FUm7Nx9OKDXdHlFxNrkFQ9QNylf5YpMHGmZ30INP3Is5LpN9xuflbZSf4KsYfYpQ
 xk3/uhHjyszowQ8Y3fENt7agn/Bk8GER5L8WbW21wYLgDWNKoSgShgk0DhkwIpDh+hOqZRXzrep
 q8lnDX5prFNHSG+b/63ZD+NovstwhNvVPg+sYHDDJHHmwrXuyuMziumwH9XqXo4xD8b1bxpsIkR
 oABQK6RNtQddFxJCiCCpg92iodNyCeevtNWB9DEKNT0ZAbqsz/k7vyzutCQarEPdpEhLbZeAAuF
 sQ3rp7OZJOaOQ0O1GiJmk5uR2iAaghn63kJsUN0KkA53gY9+154bOtjf2XvdjS9rLyRX1vzF3rq
 Ik1uGkb4XHNmR7IbLxgGiYd/RsLRY+jo4wDAYfPzbU2yQudZDPvxwcjnRCTctgIlRIReri5apYI
 z8eZYANfP4Q35Z+o/JFxtcEAP8PXEPq/V15Q56Q/71E1o80UOYI4JWXhP65jF/ZKj6MHpSmsJBV
 3u6RHZTWBjfMLIZE5dgL9uFk4IMLRAw6GqNC6ZLCWOzB3WQwhY7UnoPLwQRdyHdmAmXt5jfkNwI
 j4UrJMDJL8THSFsjbsnVckdlMdJ6J8O2nZ2zVuaH9zgWLzcnrSsTQx4C/5iiwNhTIUx/zPDc+DB
 REiJf
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005033_816286_8DB1FA2E 
X-CRM114-Status: GOOD (  12.52  )
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

It's ok for a GPIO controller to be output-only but the .direction_out()
callback must also set the requested line value.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-twl6040.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index b9c0d54d12f43242444f12a2bd8b6988d1511466..b2196b62b528cd0a2df2c4a4c4869ad172d6e2cd 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -37,13 +37,6 @@ static int twl6040gpo_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned offset,
-				    int value)
-{
-	/* This only drives GPOs, and can't change direction */
-	return 0;
-}
-
 static int twl6040gpo_set(struct gpio_chip *chip, unsigned int offset,
 			  int value)
 {
@@ -63,6 +56,13 @@ static int twl6040gpo_set(struct gpio_chip *chip, unsigned int offset,
 	return twl6040_reg_write(twl6040, TWL6040_REG_GPOCTL, gpoctl);
 }
 
+static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned int offset,
+				    int value)
+{
+	/* This only drives GPOs, and can't change direction */
+	return twl6040gpo_set(chip, offset, value);
+}
+
 static struct gpio_chip twl6040gpo_chip = {
 	.label			= "twl6040",
 	.owner			= THIS_MODULE,

-- 
2.48.1


