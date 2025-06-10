Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2691BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=; b=OeJCMoIQ6bMbjene9tnBXvi0I3
	TCOQ+vLD646Rv0qoyBvfNcNBdeYioxpXh+cRO5TSMZl5VYcRpY0p9wnZg101E1mkqT84vlY4uJ0+R
	h8x7ElqJn8B+M/caw9nlBHjEmzglw8v8ld6+ZUTodsrWayfPzmOH95QMIjClxki6XYQxf27qPXNSn
	whijCjfGPSO/lxPs5ijwOgrTvx6Q5LsJrI3mNxOgabxlr9UWDgY427L+jpNgcb4BiD0vvNIRftRJU
	w+i4ZTbnAwg4iZ1DGhyCfAC65LCyaCf7UkReUngdcOxeYwvmGj5bs5r370LhG5EBj1v68QnmpR2b+
	YEWkFabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOu7h-0000000689X-0CRd;
	Tue, 10 Jun 2025 08:14:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOu5V-000000067mk-2hkp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:12:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso47989945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543124; x=1750147924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=CplHFIP6XsBthjGPvS9QdSFktCvEAAAVr8SrYC9VftkdWSGjJxpb3bEvzqOOpvq8kh
         KPC0yRut0llBqbq+wxmoXooQ7XANtuHpKky0kGcE71Q0aKKNKTT1yBhn86jj8SrLUHus
         l75a1DXuV6I9tfe28D12lsV71LCkEK9sOvZGV2XM6KGY7dJJIAy1UCBiw98wHxWgyvh4
         Q4UeaRg//0MnXudLBOdOQeEC88dCTsNqwUBq5wfOUzlT8LtC/3odx5M4YbvxC7iKlJLM
         sVp/X0fIehscJK12pqkvMUP77WU2/tXxWZLSm75SREPiVxngGt8rmb3lvgF1etnUPfKQ
         g/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543124; x=1750147924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=wVc7duD57TTU6+CQRuUJY45UJyxvrFqe6kD85iSGH6i6z+P13OoJ1T/XyRHvSnO0gC
         1cX+wjhfc+fbjh5es4zT3hWENrDHu8H7dxdmzMGr5CUHIKl//wwbfWKusSFu8Z25lh4i
         FJLZYvMG76bRhAIXQjY9oozrdB5zmIxmtTk3+MHLYyudL6iKvR4iYlDTeJ2IeCNmEIYs
         h2lxfjoaSfy76gppYZzbQYPzdd4pf7gamxjn+UATYknqGdJ7kYKRz2ZRP0LZEf68b0Qc
         z4Bw2Dr1S0BKP12P8+DiPCgQ3DkxhSNhxmAjsEkpvNta69BfW05hqZ5ekNlNcLoPv6KD
         u32Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxrA+vRHyQEpT+kIRPu7Bby8rVSkZFrJSym16xb3d/FSO1+FOoHX+g9Y1j/wEEDhlWUid98/tLxrPplvQEUaAR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywewt5bOMEFF3QgJRetJfrIoYvyPP4df7tPMHBdQgGyCXm7eRbW
	7AwRlMmf/JZM3+M22RSvxXJz1uW/ykbvuseendEfqGObr3+M8vpVlEv3OypOa4GWtjY=
X-Gm-Gg: ASbGnct7Bn4sVnJkkeOy54GsrQzo3HOIDAYJFElKcbW2jm+i4XdcKejO4mIugl6TRce
	PH2citx8blR1mqqhAnY8237v/4YoDktap8q+q1au6uyESn3HCatxC+XX4eRC0GY0k7NVWkVr/sX
	09zQfqXrTbw+oNpz68JafybyqQkDzWuPJU0kKhwk0Co8yW/Cw23NIZPB7AoeXCSD3lEPjodtSCO
	XdGtnrgI3WKxDsJBhNrY5mRmhi1bu/KEI3CJRINSPHk/W8/80UlylfF/EvK7xvPq16yKE96Tm29
	OKnA4lpPGOvjc2EKK+hSOKzgotEPNT5Xic5CwK20/QvmMX0yhB038FoHVvKS
X-Google-Smtp-Source: AGHT+IHw7/V7r+W55JJPgOoMHWnb03kXm/kQE97NwVLeZNevpDtk4rbU8g1Mkp4wQwowMYR4Dz0aYg==
X-Received: by 2002:a05:600c:528a:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4530efe68f4mr70110725e9.12.1749543123640;
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
Date: Tue, 10 Jun 2025 10:11:51 +0200
Message-ID: <174954311123.28634.1499230964159731709.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_011205_792744_D964D310 
X-CRM114-Status: GOOD (  10.82  )
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


On Sun, 01 Jun 2025 00:21:37 +0300, Andy Shevchenko wrote:
> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.
> 
> Andy Shevchenko (2):
>   usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
>   gpiolib: Remove unused devm_gpio_request()
> 
> [...]

Applied, thanks!

[1/2] usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
      https://git.kernel.org/brgl/linux/c/32f6d31dc0401e6af7c48e5e2381997b6d957d85
[2/2] gpiolib: Remove unused devm_gpio_request()
      https://git.kernel.org/brgl/linux/c/a5589313383074c48a1b3751d592a6e084ae0573

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

