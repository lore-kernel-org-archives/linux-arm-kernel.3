Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764BAC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFx+nAgZ8AJsRRvfdecebhXbuJcNn8oWUIIvk2cM8dg=; b=x3bEfVRAItZE2ew5cVCuy19izA
	T9etW7lV0Bw+EcPmTmN20pWtTBz6bzqoUSI0i1p7WJL9Ao08gdXjfsk4YA4kTmByaekwiB8mBiEyS
	bhsLcNfOOybkNFNd0Leh8i98UFWFdLnoL1UhtoOrqKCoZCv5E3r1iRScTeXBeJNkmsm1uogUGI3bg
	QqyxHVxdA+afNCYWhPmq1C0QZ+OdvJsHGljiA3fwghq10YfcFlQStzfELjVquTMBiiq5anRJ6t0n4
	AL44vZ1+Gaw8RT2n9puCV6n9U+PmT0/sgCsDes4Q4ar7O6HTBuk9J19cILYLSliHQyHH/ZYk+nULO
	EMgn2c9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwP7-0000000ApB6-0UB8;
	Wed, 18 Jun 2025 17:16:53 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsRv-0000000ADm9-1OuM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:03:32 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so6838901e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251809; x=1750856609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFx+nAgZ8AJsRRvfdecebhXbuJcNn8oWUIIvk2cM8dg=;
        b=NZBWqAzr1eVsa9W89pQer6kyKoOI1t0R0nXB/mH33ygoTlNSzefZZFEOtmZXRe32gm
         ebrJbzxM4DIjfauGDLX9hO7bj+/W1UWFxDSKTGE9XZUC6kD6+nKERIqvTKzaVNKrUhSl
         xWI3vM7kcH9/rBIW83itKGNXxPM+B7OFtxSMSLwdaEZI9H6BTAXuQmJGaUCTsW2IIoRs
         aLDhsliCJaqFYcKzdHd7Q/0qpOQBwo0jNqLEs64U+zzUJib5RwU4iKJ/9tMVCv7rj4NY
         AWb9vdy/qdY6j4BFM5M/SH8hEJ3xcQAKKTT03VOSDTgXKoi6vewolOaqnIOpncNg43jL
         u9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251809; x=1750856609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFx+nAgZ8AJsRRvfdecebhXbuJcNn8oWUIIvk2cM8dg=;
        b=P5H7wg7P/oz30b4EV7R+hLRNAcwUCqop56sA/RanTracU6GQUwXCZbgH+8NK8/Nj2S
         /0oM0NGMSzBnuujT7CbMPX4cM7qnFy+4rFnaOJYrcNk6b3Z1qkb6Mmz0FtKmQrZmbSyg
         x2/iHRcj6IsDfXaxFHY1o3n/aBWaRekGK/7CAikg690XiTeanQS5GgpM880/WwiSRR7j
         H/z/LgNgIw8N+otJ/lTWN5G8/9EyP58jG7Q6TGnigU9Y0W78ZSYO7I+HZHF8uHCyy6/D
         bFe9lucFw2iseiHKWMqQG6zyvUAzZzACbHGd6j4DoMDxCROth5nAVB/dvP7aFEKnfOAo
         MnpA==
X-Forwarded-Encrypted: i=1; AJvYcCVrgsKj1nLqpHHTS3lh5OGVVNbPkr2buisUbAECjzPSyrWpns66sIq/yxVU3bvBesMTNFMFiSmV5TPUZZ3YhkxO@lists.infradead.org
X-Gm-Message-State: AOJu0YxP3hczvKE7+Tchr5DjurqQtHfTgwiSeUIiC4PNQXbTBDC14jN5
	pDUIK+XUgE5Q3Shlxu0CclejN0RpKFYoYYYnbUhhaPKhfhga9jsEk8KJqigreJ2qEjG4PS6BPRK
	lMgOEPqZcYspt010VUDIhcpoJJ5xpntj/uFMdPWk75g==
X-Gm-Gg: ASbGncvCwqGvRM8cJOpv7u4Ap58YIITN1Mrdds5Qacfr0zah/5MBRtPITjUEEA8ahqC
	/UwH96oq4PlwzD0XbjPEjvNEB7CWXHaQ/Ure3bRBPwwyC1PJoLPkv220kLc7FLf6AHwx5T1cjkw
	KgkvrGYhW9aVVmF08j7cukTMiAOrxBAtx6IoRuBT0mP+6tv/Md5GrjvJ5N9Sftd4g5flY6L0Im8
	9qIbdRL5P6Q
X-Google-Smtp-Source: AGHT+IEq73Sz7VEMckQ6LcsKf9Ah9LwsuMzT2V+DGZ7xnubvjoAkc8Z7a8qWgDSaz5X2ovUTBOfo+akf/lut/OxE/YQ=
X-Received: by 2002:a05:6512:3e14:b0:553:d444:d4c4 with SMTP id
 2adb3069b0e04-553d444d84cmr738304e87.50.1750251808808; Wed, 18 Jun 2025
 06:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org> <20250617-gpiochip-set-rv-gpio-v1-9-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-9-903703881fa2@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:03:17 +0200
X-Gm-Features: AX0GCFt5YjdlIT0r2MYTgVPiMMrWQk90C3yKPcU3IZdAiNWl5mP9-Yr7Xyq2AcM
Message-ID: <CAMRc=Mf-SnaY8-Azv5p3nT9z5YK0-Rtr4Gs90c6B+3+eoJnTJA@mail.gmail.com>
Subject: Re: [PATCH 09/12] gpio: reg: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_060331_369472_4A9A8D68 
X-CRM114-Status: GOOD (  10.29  )
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

On Tue, Jun 17, 2025 at 2:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I missed one instance where the set() callback is called directly via
the function pointer. Will fix in v2.

Bart

