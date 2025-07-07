Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C44C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ywzRjmVlyGLID/ZIJbfZI0O4b8LZWe/3Tlbj+llTQg=; b=KM0AzTczR9pt+/bUpBvsaEpn//
	aAzafLs1xEM1/wVGKWcj5aPobHoBMxkQLSuTkSW8ZhdPbyqElDsBYuHr4UwvyiwCBqLoGbAhEAVgk
	wCFiO6IvnI4f+zvdqWo4gxt04YcNXzfGCy/1CtfcoIPyyQ8XK6ZLYKAepIjihwIjfNDKWljEZ4Z/J
	EJHChUJ1fuOpa8SzbUh/lLj5MCY/uTvgA/Cj5tdrwHpJD7ls1bWTQiG8yzKKUYFrfvfKB5kLNq82D
	gsu+aCrtB6QYkHsWrPHn6mjZmTw3mYw4l/NKfCwHkNHzi6EwCKEZNAm5IRiWB00HQlpJ0AFEFeEKg
	MIzh1wMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhuk-00000001wgc-0rzw;
	Mon, 07 Jul 2025 09:13:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgWU-00000001jOk-272r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:44:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-451d54214adso18883685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874261; x=1752479061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ywzRjmVlyGLID/ZIJbfZI0O4b8LZWe/3Tlbj+llTQg=;
        b=B23bG7ay8AuAEY82g1he2OU/ySZIXjs1VFmErP1Zidqe8Iugxm3iCGEhTE1++d1YWT
         QBHPNn5LuH/ZRYB+wNmvdjjPlJQGL1MO1lxsZND96NE8seFDLY4pLzxW/HDEcyMLk5ME
         bx5ifyuN+qPId1awFTo3q6ExOawavpAOFugZRfqSiWTfrDwqle0mCQvwZjdEqbL0AGMl
         vUE6Em6NOZuKESBaq/kfTI5fb8gars2JJ4w0lrhcqM+/sgJq2qv8iU0HhiXQ8vNd5tzR
         ha+EsHMFpAIj6Ju/q3eRs8C4uMTduC9vcRdQIbBObGiz5gg1QWmUH1zvSueC5RHnhmeI
         wjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874261; x=1752479061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ywzRjmVlyGLID/ZIJbfZI0O4b8LZWe/3Tlbj+llTQg=;
        b=vM/wR3QjcMlOSv+S66ZSyw7UmevlrhAXwB59hMyh1EQDWJDEi6aCysz5Y4/Lnuyw95
         sIKkEm4NQNhzgIFL9fdiOmqHCrQUbqPQfl+6COxBxhPQaizJJv4hBt3XCjGDhEq3ZyQS
         /iSSfVlXsmR8WezGgf7CXarQKJ5wOQDzX9TaGUF6e900B/OeATlOi2ax3SnyKUEW90ji
         LFsWzCieTJD7LtcMngUQ/Sp0gxNyBX7vyc7+MQSQ4n/pi19Bvk66oK/hxSZv7iY89KUv
         eF7ahW69DOW4Xd7B7eAaQeS6Je+qmWHebz54A8HCM6+3Hm0Lher+wMPh0ZE0YRrnHg/H
         Tb0A==
X-Forwarded-Encrypted: i=1; AJvYcCVqEA6Wc4RiMgizaBAFShw0mD3IQmavwRbhOwOWoK2Q0kBzXa3Qw4sRRrVJOWvC1XT3JpGl2PjXAX/Sx7TeW89M@lists.infradead.org
X-Gm-Message-State: AOJu0YwpwpuU1MBU8TC9dty9ZNu1sgEXCvH/KvRochmilZVrWqnVfkNm
	jwCX16sVSeEjth26vE0Z13w59MTvvuugMunlZpRcvuM87lH6mUBS4hdA3m3zor5n1mg=
X-Gm-Gg: ASbGncufxK210WGx/iB+v0mMUvuqC2QpwQjJHkaf9tvAye6rmxfjbqyZ86L+dLZ77kq
	ar34gOF5SHOhw9aEIscfS5xtwsDZk9TGZyByqBg9HyLU8U2rSvXkoUd4tL7ZcNJ9vBhYh5KvCRZ
	ElRivPOcmt5Vr0+tTNpcPL3oyrc+96BTdTXZjx8Njik2TpSZw3BBH1dG+Cvtx8rCwO8bDplHwNL
	SCrLoB0WlCXTnctujOZkS0Rd6imPDwDiwFcOAUVxmOh4HU8yUcoF3q/ZYBllCv7AaH+lAP4egu7
	+TVKVWpbJg+ePwcS12iyUPZuYr5hluiQ7LWFPzgH1sHTAld1tCBslPdUR0jq/Cs=
X-Google-Smtp-Source: AGHT+IHTukiObLm9v3Qws0DGAdo+R1EltNu3P4uRttEma+tA+Aqku3e4Jro5pb0JFOVJRpGK9M86QQ==
X-Received: by 2002:a05:600c:c109:b0:442:f482:c421 with SMTP id 5b1f17b1804b1-454bc5c2fbcmr36096125e9.22.1751874260966;
        Mon, 07 Jul 2025 00:44:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1628d60sm102884855e9.13.2025.07.07.00.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:44:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/8] gpio: move generic GPIO chip fields out of the top-level gpio_chip struct
Date: Mon,  7 Jul 2025 09:44:17 +0200
Message-ID: <175187425322.11592.10235201169353837001.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_004422_545451_12E34ECC 
X-CRM114-Status: GOOD (  12.16  )
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


On Wed, 02 Jul 2025 11:22:07 +0200, Bartosz Golaszewski wrote:
> The conversion of GPIO drivers to using the new line value setters is
> moving nicely along and we're on track to have all the existing
> providers converted upstream after the next merge window. There's
> another piece of technical debt that bothers me - the fact that struct
> gpio_chip contains a bunch of fields that are only relevant to the
> generic GPIO chip implementation from gpio-mmio.c.
> 
> [...]

Applied, thanks!

[1/8] gpio: generic: add new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/8595375e4fded27de24b189c692c2c50051a7b3b
[2/8] gpio: mxc: use lock guards for the generic GPIO chip lock
      https://git.kernel.org/brgl/linux/c/ba441322c7aac4735d78fc6781e497a01fb8eac7
[3/8] gpio: mxc: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/1f129b15c2dea84ce12ee3120c7fffdb7bfc7395
[4/8] gpio: clps711x: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/fd0f0d1a1e71d736deed3593470b3b03f8e76df7
[5/8] gpio: cadence: use lock guards
      https://git.kernel.org/brgl/linux/c/76045e90400b7ecc60a33526a505124b0cce1d7a
[6/8] gpio: cadence: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/47ecff3839cac71c6b7f89b7860f6f76a4c07b65
[7/8] gpio: 74xx-mmio: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/bd9a0dec2d49836e7d186642600e0f668fab33ed
[8/8] gpio: en7523: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/34c029c20300b9b3072f40875b899ef9c40e69cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

