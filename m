Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA21C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+ExZLPgDVqN/4FPN7RMRww8CSWWl502tOiZJcg9SzU=; b=0YMbm1VKvk/neNEWTxJp6G5uqR
	ceghKk7wGG+dMIWm2kRhdFYGb2Ft+cDf8GLD2DdrKKgWWrrFNTOEdBvW48jQ2bKPLo1NlKK0p4KQm
	6g6Rm6lN045FcOLk/IwrXhqLIHAL37uVV8mSkW2iaJ2cc+FJJn1E470ISwx5B69Cv2GGH7t37YTNl
	I0s1ZyN39s8s9CPHCwOK9sVvuQcoYXieHKmtr9HDgeDOhOXeHm5xwcO2LsBiND7uTvqUglswAxcg3
	SIMIBYxpl0tTlfSwNmo+80KNz1gwJPQzf5Q8OdJZxv5h6GHSnWqVH3rrEqHgPFDYd6laoj89TPzXP
	QzkKb3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa7w-00000000zVx-2yvm;
	Thu, 15 May 2025 15:04:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa5Z-00000000yvM-2vOm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:01:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso7319505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747321296; x=1747926096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ExZLPgDVqN/4FPN7RMRww8CSWWl502tOiZJcg9SzU=;
        b=KoAG10RHeY6ZAEdnkRnlHiG6hgZMYGAUqKPThUwjdV0SOvIdHxXjMYnEWYIR8rGYw+
         LmQDFgsqf1ZRhRHLRjWlKgT/EUCZSjOsIerW1cYDyxkC78KIorVBXWJvI6dENPnOCcvL
         8m6ZblQM0naplVXynZmS1vKEpZRJHEh2FvM3wXnbftsSjilMZLE7xJlXPdJgVTyt07Wc
         3CCuq/W57njRZu/r230lv9/53qdvu8H1Wp7hrK/aiGTOv28CnNrCvknwNGq4FPnBhuCZ
         Rp68PNpEo7Uk5Rb8u7tcJrgL9UPq5jczJSUQ4IaU9at2qQXXUWLXM+wSYm91/9mnuqar
         HLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321296; x=1747926096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ExZLPgDVqN/4FPN7RMRww8CSWWl502tOiZJcg9SzU=;
        b=hxqSAknxLy+jyjhVNsVdMGzlDgfoPmXg72b2fNOS0zIUx3ftpyl37x1bFg2bgypj0j
         iVxkmR0cGG21syNlsm4HzMQvYhdgAvizyghJcAFWm9A6zMupfynN61rzSZ7f7R1c3zTr
         YL098yy8t3YEKIHyY+2myBz7Qq0POWM0tiTB3NGJbb4UFtvaV0jTsy89U3ltZjBW3YiJ
         SeKfMm31xw0uK6mQUFjsKaDnI5TF2DlaMHbt0ENbuke4vg65oZT/rf4cQspy6hjfzyHe
         5rnbveAXIxv7R6A0YskEKYUM7hoaRCu4oZk4HPmxBqcK4CyOc6A54+cuqdjrek4hyR6H
         y4QA==
X-Forwarded-Encrypted: i=1; AJvYcCWLqtnhdX13AP69G6wFjot9tai+7eRbOVz9idoH49QdVuvX3f4CtPygiJ+FsOaeSQCKoRdXRUBk8gh04NSqEA4n@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3ObpU9oq6CW+TYzmh8fHSXv4hWEvKPkEFyxWtcZn7odKq9mAa
	IF45VNY7GFwt+xzdMiF/GBA5G7rfRrSgsQa6uPn4EhdLQjS4PkmQJYi3izE2JnZQRB4=
X-Gm-Gg: ASbGncthS6rKdGdXpwVeKhRi2PPkb8UkNWu87eh4R9VyAVZqO2YJosD4Du606spiyWK
	S88I19XH0RPN/Y8B07F9XcVsgvU80H5DmWuKzMa/nxSOgYjdrfhEXko/gEVbPWWPoIAYxshkKh4
	uRMh+Cg9sJhsPoEz4irDJRIYADue8SY9bE/JOlNgvSm4jzFu+RqML9coondq3yt/0r5XHSyuUBg
	tpHxYLR5Xdpjyn5fYVLHteGz0nKhBhSEZoXxRk2ZChWI2X8hhWfIhxgpZa8a6UNACmhTShrBUSE
	mo1+OpYzcLg9IeLXmnsCwd1hy38MzPxVbr3hJVFDXsqoFvyJ5wgYhBynkhiSGb8eOcI7Jvzewdg
	f2uShwZglAqIUZD514CqDBsDo
X-Google-Smtp-Source: AGHT+IEaP32P+mtGWKd+DTEdhUkGNIOD6/Ha+Kt5yoVGB1vbS+3gB2gBhfdgIpL/XkzyzcsRFJdbcA==
X-Received: by 2002:a05:6000:188d:b0:3a3:5c7c:1889 with SMTP id ffacd0b85a97d-3a35c84fc73mr60948f8f.52.1747321294274;
        Thu, 15 May 2025 08:01:34 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm23388046f8f.15.2025.05.15.08.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:01:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-gpio@vger.kernel.org,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/2] gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base
Date: Thu, 15 May 2025 17:01:28 +0200
Message-ID: <174732127891.17102.13995153594267301956.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
References: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_080137_945296_586187DC 
X-CRM114-Status: GOOD (  10.71  )
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


On Wed, 07 May 2025 19:28:00 +0200, Ahmad Fatoum wrote:
> Bartosz requested that I add this to the TODO, so here goes.
> While at it, I also added a FIXME into the driver.
> 
> I'll be away most of the month, so feel free to squash changes as
> appropriate.
> 

Applied, thanks!

[1/2] gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base
      https://git.kernel.org/brgl/linux/c/833c086f22ecebe576af42051733796d1690dd71

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

