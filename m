Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF14CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mp5T71lPvUAjJD5COGIsnq0220IphycqvLkiYGEuO38=; b=LcUhqbVWFweiytA8ojUcLw44pB
	ODuPxmA6QN2KJDeoQ0747FUwnPSk92jzEyEY5WtmzVIy/kKn1TLJK/M+FurfhsHPLAuVXl58/fLDu
	ohvpL0I1F4xEHhSlxNDSFeELUtULPAZPPl5sUFWh2bAsEE8QOgJbtzlnDj66YVCNUsMoQwDAA49y4
	yioNuQpYQ5AtN+Yr0EBUv7uZrQ7276p4qa/fyplNkhs1oqLW9LDDwFD8tNDKM9zsZtgxuSQU2K9zG
	HeAIKry2DtgYmT3TiFmi9ttbiXGB3kB7KMmn5P6u4kUaVZz0IjGwMP7pqlRJwo2QZY5uk4JgkdRYp
	jSdNKaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiil-00000005VDn-2Cxt;
	Wed, 03 Sep 2025 08:19:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti52-00000005BAC-3eaG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:38:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3df2f4aecc7so82215f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756885135; x=1757489935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mp5T71lPvUAjJD5COGIsnq0220IphycqvLkiYGEuO38=;
        b=gT5SqCe/SQPdrMWM7i8gpWxcnMKGwGgRp0x05lMCzSUV8skcEZc3mY5M2mJEulfPH+
         8r/SbCBndW37faEkPoN+izIR4QBfbEZrTFsgviC5p+kLkKusdP1eH2Zg74wA9buuhsmN
         s+i/w0hpNv0D+XoFGwXLIzqJZJWFX43Jrdc9JSfavI3S7jTuH/rsrQVFs08zF0pJyFVo
         p5fWzNkMmcE8FPYlWmxwQv73m9PEmalYLiUHjMEH7mSi4zYEBDRPY0hd32QeX0/2h35R
         twLCA7hUe/qF0Of6+ZCImYvwipW7LUpBKs/9eot2CR1aBPSIf5YGOhxNVP3xZHVu2bLp
         BvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756885135; x=1757489935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp5T71lPvUAjJD5COGIsnq0220IphycqvLkiYGEuO38=;
        b=Hcvdxltj8xDKAlYlIF0hKCrpNfNHi4pjhsrD0D9bp4w1I4TuiJp17PXruS5YEXuGdE
         QvqpwyyFfElZ9r2wUwNEHyjZJK9iA+g9c0Eud+Z3ufp47nXCyGOkKcU4tFgo1KbbiReC
         ZjASiVATIN8xaWDBfSAiBKdmY5gQLHE77apzVELLfwINnX6lzWWJWfMbzGWm8juKjTSw
         5noNMcS/mm71OxICnwOvPuoPP8xiB/t5hQ4fiolgDqJp477lVM/9sVxPk4AXyMapfFfX
         pSMHc4Pb21OrlzjDcdOnIHfpWv2HbDckHOGTaXISTupM8QBxZXPZUgqlSxXgDXm4G/U8
         pUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPsDXUlknwRIkBlv09vtgkVPmyEtLCmkzUkNVtz8AbHfUEHNcTNwgpWZd+nsradhFyWfFnHtAdEcqtEXRB5rah@lists.infradead.org
X-Gm-Message-State: AOJu0YxLZz45/bUfQbUrwtMnPfV/yMJMh25kelO3lmHVwAHZrcJYeo2c
	fEdlO9ctdFIDN5WTMxrg6zobA6KporOMx76si1iI9k0KH/uu/wNqPyrSH48GwcjkJm4=
X-Gm-Gg: ASbGncun1WEjT4FQtotkbvC9OXTLV/c+TPBEOyNQ6xVdeHk3COwSJhoOH5rjOLg3byj
	4AyAjzblbDGLJM+MGf6dv4ZbaQYu1gQjx/I5sC/YNDUZsQOQb88cacSWAPe7Iy7qNNvmLBOvqD4
	tfBOUzfVBtD12BV55iArwfP7SVd9KzypotxQlcXWlgFgBKvY5VqV6AVEphqZQEdc8FppeD0dnHw
	zLYrB4x3dRH5bvGIojBtgcfl1LSTmyll4IOV9o+oLy4bOvFTb1FuC9bKMsgU7+ZfP43He3AA4Mi
	qH9tcymyrPM95alkHXC58yqDltn6VxlkirxwFPxw/EVCtSBpWe2Tpj7TY/yMlTTUDuxQ9VwgvK7
	ev3ct5iDc+RpYwaH1ln0SdJw=
X-Google-Smtp-Source: AGHT+IFkZYEPWWCkKse2PQo7g1HVYHPWt9iUadycuLD1iYe9gFsnwRwmTjB2wHvwzo04UWlct/Y1jQ==
X-Received: by 2002:a05:6000:64f:b0:3d3:1ad0:e8b7 with SMTP id ffacd0b85a97d-3d31b2c7c54mr11268847f8f.12.1756885135098;
        Wed, 03 Sep 2025 00:38:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d53fda847dsm13417216f8f.0.2025.09.03.00.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:38:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Yang Shen <shenyang39@huawei.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] gpio: replace legacy bgpio_init() with its modernized alternative - part 2
Date: Wed,  3 Sep 2025 09:38:51 +0200
Message-ID: <175688512868.10115.1073812305846607850.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_003856_911485_87774C58 
X-CRM114-Status: UNSURE (   8.49  )
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


On Tue, 26 Aug 2025 11:35:01 +0200, Bartosz Golaszewski wrote:
> Here's another round of patches converting GPIO drivers to the
> modernized generic GPIO chip API.
> 
> 

Applied, thanks!

[01/12] gpio: xgene-sb: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/38d98a822c143a4a7337d08f50968cbd7b701ca2
[02/12] gpio: mxs: order includes alphabetically
        https://git.kernel.org/brgl/linux/c/d3332dd1f6e2cf82744dbab37d05857e2d028fa0
[03/12] gpio: mxs: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/c7357c8b6703d4bc0db6198782fcbf0cf3033844
[04/12] gpio: mlxbf2: use dev_err_probe() where applicable
        https://git.kernel.org/brgl/linux/c/7cb9086790a0de526ee40508a4deaebfd82a5bca
[05/12] gpio: mlxbf2: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/72fdbf35ec7273bb1c885696680e611c47b261b4
[06/12] gpio: xgs-iproc: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/6821e5d5877ca80b6989dfba2648a7ecbe3d9a64
[07/12] gpio: ftgpio010: order includes alphabetically
        https://git.kernel.org/brgl/linux/c/cf0257d3ce05259a74265fe0a0bd7de063cc6793
[08/12] gpio: ftgpio010: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/3ff7ab070b4804aad5b1d3e3d82a793710ef1f27
[09/12] gpio: realtek-otto: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/b9dac8251e7e6aa433f54a7da45cb05c66627695
[10/12] gpio: hisi: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/c0378e59a6af2efa470a384b69fd24d3f3f3dd97
[11/12] gpio: vf610: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/656dc0c6f725a29c9e48657ae3db78f9016f518c
[12/12] gpio: visconti: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/a6f03347debb7c2c6d04cd4be67ed766e19633ba

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

