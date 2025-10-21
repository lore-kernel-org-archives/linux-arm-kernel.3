Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AC7CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7hM7uckFcu+8xOxYahCnfJuF1kzdKDORaIviV98zX4=; b=bFkf34yoK6oUhNhSRikII5LQ37
	s31HzecZMi83cpYtjjyYyLjYG00YIPCQ9jQSGKhfBKliiwnHnY5G8PP66ngYBrOZZQBaEazQOKLwe
	ogoRm37lRoX0MDRazLpz1crbN+d6ikq7jBGQOQPYmWhL+o/h3aISAsnZcI8Q8/InC+B54rWBra2z8
	S3f2sF6dvBcNNjhx7cO22G4aZ46orZrJaanjP1O2IYTqQB+fc3bVKaZlVhz5DW4rHH2Bf/DdyDPDi
	nCZI6iVCNPOxfjC2+Ar5hJiwLIbmEiZ7WiYcNFAKSuhpVHGxqmAvnG2h6Qzs2WPPO/pf4CI3DtICp
	qdTMHKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8Fa-0000000GNM9-3Edm;
	Tue, 21 Oct 2025 09:01:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8FY-0000000GNLb-3g0a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:01:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4711b95226dso41051205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761037307; x=1761642107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7hM7uckFcu+8xOxYahCnfJuF1kzdKDORaIviV98zX4=;
        b=dPoNSVomFNT72hivQePnwqLKrSHuepZbcnbDQXXYg3itbfdlTbo+baujRiamuK/0Nt
         9+yNIk3rGksptJJX2ExBnr22hMeJ8KmKJ9RVwOfcisIMnJhAmMCkh63dQRZy2I2DSsF3
         zDLtCViuTQRjdeXl9KtKU7fn03Uht7KyJPhBCJHErYG/niyEieM2cq6Yz0Pnj1nFBzR6
         N60gvr7ortiWpGXDmBfTLkV+kXrK2jOfO8EFYRO4zwSYb9hksnDcHhuL65c3fm+C0myw
         e5ePQh4OlyfIHkxx780Eyg6zSVDQKwSLoKg/mZKZiarqG/jT+T/PTJ2AKXu87jeamvdf
         GJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037307; x=1761642107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7hM7uckFcu+8xOxYahCnfJuF1kzdKDORaIviV98zX4=;
        b=f6K4s4bZ0U5ZE5+I2s8TnOfxy2OgTuICzAQNslEtcqsNzQ45ihtcfAO1XXe4IBWOoX
         2ZVu2REuwZE2qUEvLgybRHr6gq5HEMD4ldIwRBEUfdIXTanL6RKgSE1CHh7BCp/YzzOe
         Wzx4EMrK8BI4CtN4tF0tpOxQ0fVVfZ2m4fpmFfGTYRUX3SdzwH+sL5c78vkJPHGM4qRQ
         Q6qZAbWYnWJ1rqzmZDa7DORvPZTppcz8osHWmziv9HJjCmh1LFiRf79Zh8yvNwLnTllu
         FZr2GWtQ7RQwZo+QGifkwO50DLnBX95UfD81eGWEuzC0DVWW4D3R4bJ5l4yeMIzzyjeF
         sD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW86DeqaaUDbO7D9UhGNQiFeGomYKBng+rPgRmEwbF30Hg9aGtw6cqikfCGQJyqOUqm9Z7KjppnbTeWfREqbH4b@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4+1qYUxlRh/lIoOznrIFZfALxyxS7Yf39lPKWJ47VQqPfrcLo
	VA98qhoa6a5psAy5Hzw5l+p+uHPnJpVRzzyYDjIs6aWq/45mJJ6Tw3xSSDR5rGDMn58=
X-Gm-Gg: ASbGncvVeGmdBV4dUp/cTV5rQqfjjPa/hHKfS/BsodlBTnxjFDCJzJQezM2ACBN/sdM
	MyZHbk/QmvawABy+s5JBwUaeACfxbbLtrjqnb/J+/g1+RZmag+6Lsurp8CrEg6h5uaKZoAbO8/v
	vMSLLUqfRVk2s5qLFE8I2F4JZDS2h/RLVUcmGG3+LNJskpVLeTSbWpbCV2k8EyMyNO0hyXZ+8Vp
	CY+pf4N4Opc9BAokHPYkTMPKZ5YgtqQY3bIYci9QYPr7rUatE+ytk4PqN99xNdLQE5OFy06lv9Q
	jzTu/cZB/QBzcqwxrNwWAPJzp9sWSm/AdTkhdxy4HUqyQ9KCKzyK6Em/h/Q4q7NHMlhuiII0Exa
	6BiRkHRqMH+phw9aZFrawnf8Jt4RRmRF/FfhaETy6oYMb3szxzvV+z1yJTNeEDtBAzgFNdTMxxw
	EcFg==
X-Google-Smtp-Source: AGHT+IFwaSBjtILyooiRtf1Ykxp9UxcePTyTy4SgHykASPLMYxBKsOoz1/6AxkfVyxkle8GOQXe6Qw==
X-Received: by 2002:a05:600c:3b22:b0:46e:4704:b01e with SMTP id 5b1f17b1804b1-471178767f4mr119724175e9.8.1761037307000;
        Tue, 21 Oct 2025 02:01:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2979:9ff9:6677:97c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d972sm191369065e9.1.2025.10.21.02.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:01:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Kent Gibson <warthog618@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] gpio: aspeed: remove the "gpiolib.h" include
Date: Tue, 21 Oct 2025 11:01:42 +0200
Message-ID: <176103730245.11215.16894410168920796474.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
References: <20251016-aspeed-gpiolib-include-v1-0-31201c06d124@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_020148_918949_1F8A717E 
X-CRM114-Status: GOOD (  10.49  )
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


On Thu, 16 Oct 2025 11:09:24 +0200, Bartosz Golaszewski wrote:
> gpiolib.h is a header internal to the GPIO core. Drivers should not
> include them. gpio-aspeed only needs to be able to determine the
> hardware offset of the GPIO given the descriptor. Expose the relevant
> symbol in the consumer header which allows us to stop pulling in the
> private one.
> 
> 
> [...]

Applied, thanks!

[1/3] gpio: rename gpio_chip_hwgpio() to gpiod_hwgpio()
      https://git.kernel.org/brgl/linux/c/df900536e85819f6168783d5f6b3908d47811fdd
[2/3] gpio: export gpiod_hwgpio()
      https://git.kernel.org/brgl/linux/c/d19f6451c6feefd6537b97efa5f3859681f243cb
[3/3] gpio: aspeed: remove unneeded include
      https://git.kernel.org/brgl/linux/c/0efa5b2ca6fa7baab4c523b34cfb9495ec143d61

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

