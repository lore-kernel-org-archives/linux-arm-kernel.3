Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A723FCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJpgRICzbLGowr2FIuOE8Yg45vw7HbIpaAZsTNxfjgI=; b=0a2U+ce7HErkSP26XFA/rqeuun
	uK3lW+xwiZ8wOok+DTGVyAj91/xBLhxRvNGbagmgpIFHDIs7zEu38zPjWDPYljpjyk8bxcwNwz0c7
	hACshkL9G2vRw508IAuhHl2wBRokaKqFG3AYzx1ZkB96FLJ1Sewqp3jwqR1SQTSys7/ayWiHK3s3X
	tjIVcMhoi2XSYhO2lySbxFM8NVL3PrKK4oi09CdeIlS1uTsI5lyf6dZRzB/253UeImOemg1+4DvHA
	qI4BBB43dmXwM/ZH14mz0Sh3ku1SIm1fQL/iWyY4PeF3Z6y9vtdv83M0Li7Y3WhExnVmJrM1Mj8gX
	Cms6rYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynxa-0000000AiaE-0ILF;
	Wed, 17 Sep 2025 08:56:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynxX-0000000AiZj-0X3U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:56:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45f29d2357aso26710435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758099373; x=1758704173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJpgRICzbLGowr2FIuOE8Yg45vw7HbIpaAZsTNxfjgI=;
        b=IeyK3r59LPDgxjgoAiL8lEhYVMq1foR7FVWYUwsb6zrab79LEKKyv5yQoQV2VYNPTL
         JAdT9VpUYM3JZ8lAaNW0ti0u1yqGsEthIhVEr0vDm1NCh9GpBbst5WMhBGvGvqHdP8lu
         aRT5jLVDifnza4b/wN+ibu/8G2hFdr7g3LEFDKXeActzU3qKak0vIzgvNXdg95YkD6dD
         J4GsArHjYm57dr4cPXTsCSpq6SmFXprRCsICjg8JhaJSGEyIT9zGuxrZoU4FgRaewih0
         8cJmRlP49aOzkIW9BZfLN4cq8h162Ak7uVLLfMikUHqaiLZjS98qnmTud78aZ4k8kqaR
         rw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758099373; x=1758704173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJpgRICzbLGowr2FIuOE8Yg45vw7HbIpaAZsTNxfjgI=;
        b=fgbTWq0pA+olPZnbVkVxv8EORXzv++diCJctI9scV5GMdcDSOzaZV5ev6re9NdObHI
         rpuPURPoAZQ+iVrEQiWguGumoWmoqW12WlBelj9NnjIVSpOzzMyGRgcrS8Prv84xXbYn
         bO1h14UkZHaj+EfhFu+VHgcdIe9tUvtJAeWCCfPwngB7mEZsvW4kme0P94PHBiPgY+wD
         lZJR2CVPXBlKOByQvut0OUHTXpNNO545dkPVyDiQWDt0VpatnoEy6Kga5mevJK9EeT30
         x9ug3IQhIn2jRhXMrovuSBPfpymtn+9S6oOpZU9NDzg+Lyi3YDb5Mpxy/apngDKOncog
         nq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaatK3amM1pAAM9K4Zs9atniv0sF3fqaAOIFOvfm0lbmD1mM4BRkPDARePFhF1WtrC+poShpcNfJNyI8dPLrsR@lists.infradead.org
X-Gm-Message-State: AOJu0YzLwVsUc/nrZ2ouQ/C+I7dOlQ8yUEN3qxFMLNSEo/l+OTBGcgQx
	YpM8+u3UXSYmgEKN8M3s0NX9sLJbJwiveW3caYOORoggvG22UlNCAN3389dY4X/WvGQ=
X-Gm-Gg: ASbGncsPhd32+A5t62F2oPO2sJEdHWF7Q1mCeMK+Lyedrwc8/tgkvhG3+oVaCyNXuz3
	gJRzWNoaZNjSsGkhqubUf1zsaWRIFPKx0U6dgk29kX9C08pbA+uRH302bWes4P49wZ4YiETUkd6
	xVMrdE+rW2IXBXNzsXM1G8k31QAFOT3P1fOR3p4ubPdp9P88gAp+qiLGJlmgLis9QQJfdxJxp97
	jo2S70BKBilpP0YFVcys+XeZivdfl9BsK/YbWvtdgVVzerF+bURzqMPV84j3r/UUk2xpbmsjBt/
	5mM2KI2KyJkfy4chgMBRu5kfIrpK2zogiCouwHDTjD4XwwFavqjAV5iT8XuihPhHWaRe8xT49Nq
	rBBygSdIW+iZeF6P3+Iy2v0LDuXGIRFUHY1AkJu6nw0+X3OKP2mRvNhEOYZqx
X-Google-Smtp-Source: AGHT+IFfHj1d6cqh5fxkybLL27UGQX+/B51RY41pe17x67AKJn2yXlPBr/91btPURGQ/8K0wjUfYSQ==
X-Received: by 2002:a05:600c:548c:b0:45d:84ca:8a7 with SMTP id 5b1f17b1804b1-46202a0e8femr12039265e9.14.1758099373158;
        Wed, 17 Sep 2025 01:56:13 -0700 (PDT)
Received: from brgl-pocket.. (94.red-217-127-72.staticip.rima-tde.net. [217.127.72.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea6805001dsm12895995f8f.6.2025.09.17.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:56:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: nomadik: fix the debugfs helper stub
Date: Wed, 17 Sep 2025 10:56:11 +0200
Message-ID: <175809936780.35722.8768362923828333161.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250915091007.28438-1-brgl@bgdev.pl>
References: <20250915091007.28438-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_015615_176760_6FF3C8DA 
X-CRM114-Status: UNSURE (   8.14  )
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


On Mon, 15 Sep 2025 11:10:07 +0200, Bartosz Golaszewski wrote:
> Commit ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers
> in debugfs callbacks") failed to also update the stub of the debugfs
> helper for !CONFIG_DEBUG_FS. Fix the resulting build failure.
> 
> 

Applied, thanks!

[1/1] gpio: nomadik: fix the debugfs helper stub
      https://git.kernel.org/brgl/linux/c/0b1619c38600fc06c73b1f59c64af0b7df08fc2c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

