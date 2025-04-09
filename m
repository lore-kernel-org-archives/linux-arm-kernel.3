Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52255C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=el1YoTqrU0Hduquq3XtvrhCcVlg8sd7EcPhPRkGv2hE=; b=vKHJQTi9FbWc9HMaw3L5VxuE5e
	Mq4rmcfG189o7QjUmUt6yiRMqPzNQqetV8gnxiIjlaIJD0PPUUib7NriBAuWKtsLfC5KzCvsttnNO
	3hVxqI4QeLz90eRc1N2RJFks0M6FgRxeOwXYof4XMQTJlgl4gVD7Y9kik+k8Aej3HhRFjL02N3YGH
	/p85PaCkh1ul36KplZNe8qFdhC6+TwzzoU6mGzq2CssvSqeMWiKl7GlfPA/AQVcBK4nVFNfmQjNVG
	ZB+/WCj9lao8vBA5whlB7aRNK0ZjZ1xAhH41+ojT9U5/HMZYW+dnUXgzaQKqWO3dSodpEsWKcxogA
	n0iP4+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QxZ-00000006bv7-0O3M;
	Wed, 09 Apr 2025 08:39:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QuR-00000006bRp-29sm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 08:35:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso59790815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744187746; x=1744792546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=el1YoTqrU0Hduquq3XtvrhCcVlg8sd7EcPhPRkGv2hE=;
        b=BQKTvP498hNiOtiIIUJk0ythdIp4jsOk0JIVpXCI7m+k+zbi+dhwP3cY6kUUGIGcE/
         wwh44j3DI4N10boUegq30iMv8WtiyNiL8YmergE0yhBHRPRdX1vhZnd6bLemBWjJEQwt
         hDK7jxOkVB/N/J/iilpuwxsI/npyjE0s+JEdZ5PHOcNV2bLjGQlB9AOKDD5Q0TB3rkzS
         lse58HrSsQan7lKJSmvcxWsna2ZhCRveXpBYRcZNsOzXiQtPZ4iTUTn+/2FNytD8uiqU
         ai71XW/eEyxAklrQc9VZQNuNRWu22es/j7jfVMWlcBrpmYQa7e8oknjwHva2HUBoeM+5
         0vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187746; x=1744792546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=el1YoTqrU0Hduquq3XtvrhCcVlg8sd7EcPhPRkGv2hE=;
        b=tO3OJmZWFFEHge7gqOdbmfMqHFxyjueBXjO70eWdrRxxsxH+cTjShKgFHeRi3R/myT
         vkdkT32LwC/LGXISD+03baGTOhaSXcv8zd+sRCWj6wxYzL6wUKsWZMpq6RTKzcJVQWyx
         k9AQ0Omv0AetZgtO/Z00GBpcQnDrB7uf/JFWbM9jJd9A/ETxml7Zcq6UcS6PHqPB9Cm4
         OH1gvU6XpOBYittvo+orgvLmtfUjNg9ck3H3WGZILFaJPdOsgHP+PYYDbWhPKa4tYLp5
         M0TReTQAnWaqTOiQmd05lG33BvGcgwJDkggelHDd2Uh6FE7DJxyqi7xYYyUAZE+eJ/hp
         0dEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7QTu+GBOwFjTvMo9U8hgqjeaCHhQheggX3AL1f+60bzKBjELnuEw48/VxAcZzqvzyEj2qucOTUOuBt8NbEqoD@lists.infradead.org
X-Gm-Message-State: AOJu0YyquUFSMI/Hd8lVS+uc8iAB4FdPszT22sgprbjwbhQuxrAKrS++
	LM0Xz4hK2RBfCtSqMNjnSgr+S9SmHmopxzuINMs3CIwJqaBS+QDKXFN8pEcVRpM=
X-Gm-Gg: ASbGnctO5ldwU3Dx2jxIUBBmu9f0rtNdXZqkR5HrxUcFcRUYkaIN+scutua6Hhckxgt
	1oNYWXV7n1Hy2w410nzMiFBTu0KQC94LTlCYWeCdYwvSCxN3+38r53fkhbH3GqDOtlbatHvCnDd
	Yo2zo5BZQweKLRm9UrF/qE2IiEvINDing/SZ+WR2u8KBkpWtvlGzES6PspnYuP4LtktJE26axtr
	ITF9dD9Aj6Pgsx7Lxgaeln8ySHmTm9GrAxUoAZ7R23/UAW00H+Pw8T+aj/KahvgMp8k0k/URnJd
	kEZU8/9Q0WqoJ1TyQ2+0/+Fn//zU8xcaGtWyPM5anuLalSY1CN8=
X-Google-Smtp-Source: AGHT+IEVD2lslpaI/7rJdnAeqx3wViSVYCOrqXVSkQ27OLCHAfme1XR6nMNHEVQPwT+A6iaBHutElQ==
X-Received: by 2002:a05:600c:c88:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-43f1fdc3bf7mr13678815e9.6.1744187745673;
        Wed, 09 Apr 2025 01:35:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecf30sm12557045e9.1.2025.04.09.01.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:35:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: convert board-file GPIO chips to using new value setters
Date: Wed,  9 Apr 2025 10:35:44 +0200
Message-ID: <174418774169.21152.4210389076223179557.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_013547_552208_A3FD8513 
X-CRM114-Status: GOOD (  10.83  )
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


On Mon, 07 Apr 2025 09:09:17 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all ARM board-file level controllers.
> 
> 

Applied, thanks!

[1/4] ARM: orion/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/6982e6b0bdd838fe71a6133cfc0f79645bc31a04
[2/4] ARM: sa1100/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/9c3782118a57a6d7a17980115f46bcf2b85fdf29
[3/4] ARM: scoop/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/dd8a6af45928871e5d9a04959ab8f97c3714264a
[4/4] ARM: s3c/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/fb52f3226cab41b94f9e6ac92b1108bce324e700

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

