Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA29CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOWc/c1a94HTBP6zFYRMkz+Dicl7/4365yjhzPWmzAk=; b=vNBUMgGoFrmr7qvUUOMO54uyll
	fcZ+QNrDPAG8ddPKC0XGjHKQIZlNr9LeedoIxLskrpiHfcMqeWKloLo7jQ2v9u6ImFwbsEM2uNChI
	1xb5SG+DEAY766eskA9g+0WFYssWjdFcNWYgo7ZxzxTyNqNKO3ljTVZNXXHPX6m+kVZcotJSiV3lF
	I2WJqpZJj2tCTE20zuICylsXsLTYgPL+lz9wCYcAyv6n6Cp8kT95/0T7x5p+5dI8Wk0PWEkhgk46L
	yr0oVx2wMh3iB+A7f0IDbO0iGA3M3HyWbcqwIiAzFtFapi9hg6G0wXD73bycgd0IuvZhsn7ulW43+
	8hZ+5p8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzU-0000000E1Ii-3Fd9;
	Thu, 04 Sep 2025 19:51:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAzw-0000000CEF9-15Ah
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:31:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45cb659e858so9482525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 07:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756996294; x=1757601094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOWc/c1a94HTBP6zFYRMkz+Dicl7/4365yjhzPWmzAk=;
        b=NJc7bvnXE6CpPLUJRWT6sg+ILdBBnM2wSDt5EANt79/nW1xA7thdjj/zuwPvSIKPEK
         xmHgkeESXf+cQeV6Pj792YCpKorrxQVquJRN+7yWg4DJNZ7x2x/DbETYJQO+6/uRlFRh
         EQyotxhHwhqCbCY3B6R2wPlbLQgatOQqExFM5oGfTU5DMnjgc+Tu2FkUuUQH5IsgppY0
         ATGyHqDfuUr54/H8OPp/xV58iT4V0ZX2G873T6blyvZdUQeb74/TzamI96vn9rmzKAdJ
         tVrCjmMSBf/g4km5WiK0USnPsJtUQM8k4E+vaC0i3iWp5GKxIkjLPqnTVJ/YnWhDIGjq
         Q9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996294; x=1757601094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOWc/c1a94HTBP6zFYRMkz+Dicl7/4365yjhzPWmzAk=;
        b=jxn2ux+YBmNZ/Wuuwh+MXFycNfDBPh3NresihkX3GtiiZbQUvRWfdKjoLZW8CjD7ve
         2uJH5tFvNsvyNCSXlIyExSC6xiv2vCuhpFvCT91++OSf08l1PkqYJYbNBQkud3hYpUA0
         fXAF1Hslb89ueeo9TfksKbUQeanccPyRe3YgeNCMOIs/ZFZ6WSCntTWvjGvW6QgDnC++
         JBSS/ZWV4DpEjbEoj8gFSi7rRMVbT0YtERxOBxAUSPuWdmjLA1NKaeHSfEE6r9ZCNifV
         KC1T8qFqqPrwlql+DsZqetiwVyCRC8X+mXMk24UizIBTJUG6YmV91RgzBW03C0+9UBYH
         CO7w==
X-Forwarded-Encrypted: i=1; AJvYcCUCw2ajYPqaq+wLDQnNnTtajeUTZUkwG9jr0v9/eNz51zN2U3w4FxcscwDFLv43m97xRr2FbbR2xvNv2RyUKSzq@lists.infradead.org
X-Gm-Message-State: AOJu0YwTXlCMSmHsQmLMjI4n1mlnpxWH7uy1svYlOtMHCV1oxNwUElTk
	eocCv8hlJicjBSwSxFZnXh2ipIJlEn2jZwtmHcZTF+Z+41lKLCgnMTWo7QWEtg3LeN8=
X-Gm-Gg: ASbGnctMgXnX1PwP4kfaKZrBZViAXNW/FPLmrhxixJovYFfi97UeGcCMBF4Aac66uw5
	X21rAeSeI0nCbXmpTMtPMBrLijDnLStyeuNw7/gtOrXYBGS2+7MHGSIiOwisSPLnECVxlwle0kd
	TUA4nQvcZ8tMSSGR1CPOjptUuP1nNUvfqP3BjSjqECUGwuqGaTuxPNK925u6/huW9ZVj1ielYje
	gT7VspaO6uUJqcjsOx2xiu8Fz61TVkLd0BlxG+VvlHGseK2vnuZQb+/FEgrW6IbtJGIbRMaMvS0
	poS+v0Wwynzu3eHuXlTDVQhxqH/uK1dl1v4lkDdKFGs30cj3SJVaY2Vp6BHrr4z1KbQ3/2svmpf
	VLBvLQbdTJJ8nZHYhCdjFQAc40Cy40ZIx4DWuJQckA35e
X-Google-Smtp-Source: AGHT+IGfdMUSy686Cb1BqOU8JAIe9bVYHo+twh1W9Pn3DRVe6Sxnh5hEhO7YHP8lWHvi12JNN11Fhg==
X-Received: by 2002:a05:600c:8b23:b0:45b:47e1:ef6c with SMTP id 5b1f17b1804b1-45b855b2b0emr155588755e9.35.1756996294547;
        Thu, 04 Sep 2025 07:31:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6e82:a4aa:49e0:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d1319sm319642535e9.5.2025.09.04.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:31:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: nomadik: wrap a local variable in a necessary ifdef
Date: Thu,  4 Sep 2025 16:31:29 +0200
Message-ID: <175699628267.79535.14392040407433836716.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903131903.95100-1-brgl@bgdev.pl>
References: <20250903131903.95100-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_073136_426150_E3F37E02 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 03 Sep 2025 15:19:03 +0200, Bartosz Golaszewski wrote:
> The 'desc' local variable in nmk_gpio_dbg_show_one() is now only used
> with CONFIG_PINCTRL_NOMADIK enabled so wrap its declaration with an
> appropriate ifdef.
> 
> 

Applied, thanks!

[1/1] gpio: nomadik: wrap a local variable in a necessary ifdef
      (no commit info)

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

