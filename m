Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4159FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALPXDBC4VOnQSYjOJhu8mMUA1ahkHYVduSlJiXRjoA0=; b=j162JiaYl7zfmQ+TPs19Y9vPTl
	T6tWPOIXAKlhbIYXmkBgnO5sWp6Cws6RYT8wd/Hfc7sYsdShhIyKG112Ivq4IjjxW1YNMvbLrBKBv
	wRvJnwx2j0hmwIekSiY0YYJB7jBUDZbHWQ/Xz0bvVszMGlAqpiTMjAvAkaqQPaG7kPDJzzT3d9v7i
	EWzypVhShu1Q4cc5J+80u78vIkxn1TOYfYftJkWgedKoL0OIwOMtw+5EG5Lyni+nF7zX3mKHKzcuA
	eV7Aygfer3RFL6q7Tqh58EXLPKa5pf+L7cVMliYo/BUQSwcklAhogpnWa7VOc8fuuicfzUB7VMRM3
	Z4cQOVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlnS-0000000GNK1-0NDP;
	Wed, 21 May 2025 15:55:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlj7-0000000GMEu-2Ry1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 15:51:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so86526935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747842687; x=1748447487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALPXDBC4VOnQSYjOJhu8mMUA1ahkHYVduSlJiXRjoA0=;
        b=lxBJK2ybCoWTqf2nRoN0t3HjV8wQWDW1oNT1AA9vTusTQIK+Ea+EwSRg9RcO96Hu6D
         Vxz0BRkNOpc59v4cBbjvmeS0EBtc46YDdU+z6wXWSp+yYCUscaIIpPGQd4OQcP2j6UeK
         R0olPiRtdk9uBlaZnMxQXdgiyx/ynuyDi6GPkvscCNWgzy7imKXe7uQaOtjt31phJUkI
         Be8g2MbSSbRAzO0VqAEn7vn4V8o9i2K6lwfcILG11vAgRDynmZ+RKFoSaO6YS05Cl3vS
         NHi5FLfBwoPYC93h3Jo3Dn3nGGwoV+lSXKDWOpsPAhJsNuQfyVFejAePLVPSexLL8yBY
         uiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747842687; x=1748447487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALPXDBC4VOnQSYjOJhu8mMUA1ahkHYVduSlJiXRjoA0=;
        b=jHsKDVYoF1OQYljaknHuzEwAD8uRluvE/QX5/P4wCQYY23qX7f98J4ywEgGwpe2sj1
         XvzCbrsgwwzvFC0RHvlarfHI749AAwelxTMjlIpVCR9u2gW/7UBlRes4B4YqGR7Aq1YP
         N9fEsRuZi9dk0suCElGRtcHOa4Aggtr59gz/NLbZifeAQ4FtEari6xs1/XHQggDZKcEU
         T2l4fKarvgwWStoQIO9VCZ717QTkRq4dTGa8kgt4Um/ehGV4fizA8Swz1nBxGvIroK2d
         OKDArwqIathVBS+7JkZXR6eY+o35YkMddcH9iHMP/RXMM/6jj3pgH2xK2rurQTTQcuSH
         NjCg==
X-Forwarded-Encrypted: i=1; AJvYcCUROM+BFkjhbLREvTZRWco742U9tcOuz2onNEhm/MoGAnjf5c3yk7pnKbAOZtKGW3zIbPmitKtbcc1MzBBOdwuE@lists.infradead.org
X-Gm-Message-State: AOJu0YzPgGzZ/H3qdcca5LL9C00XEKiZCRc4RcuiCEbXjfkwIMyTJ1bz
	FTGhg7ioIWRT4jya1Nr2AKWU7b/KL3lt3y1ySDFlJ9xd9f8/GVqyBpTPZ0XseFROTVU=
X-Gm-Gg: ASbGnctct/PBPJr5BX0jaNRdAzs9kBoeTdDlZU7/7BoO2YE26obuxt+BrpbX2pwsVaV
	yqGvpycpM4GPVFcq5s3XBf6p3eUZmjaQVXX3IKYwOTcUeHrcALtjKHD/wWtuch4lbr7pb2pmfU5
	cg3moQC2833cjQcYrN3JN/0ikYh4h2BQv+NUmFqHsYKtIQz3bTXxHC2diL8eXrvTKoKf+iMHfNS
	ksnlxK/68808x8cVeQACYSkAnlh6/112roKnKTC3g6vEaRvWAzcstW/9BP+vqmHVb9gQCXAIyJE
	FFCV7d5mJkbQX0OTkYbgwJXvd8+vc4GJ8WaqBRXLlS670p+7dCVi
X-Google-Smtp-Source: AGHT+IEqZ+pvs2qnbXKikjx3bqPhev0Cos2vwclP7j26sP/JdZ5sUoTbb2O4Vt1gGh0WRqouqxSmSw==
X-Received: by 2002:a05:600c:3b94:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-442fd60a517mr194344195e9.1.1747842687246;
        Wed, 21 May 2025 08:51:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b545:3055:5b24:d6c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f38145eesm72488205e9.26.2025.05.21.08.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:51:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Haibo Chen <haibo.chen@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	peng.fan@nxp.com,
	wahrenst@gmx.net,
	conor@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH v3 0/3] Add 'ngpios' and 'gpio-reserved-ranges' for vf610-gpio driver
Date: Wed, 21 May 2025 17:51:25 +0200
Message-ID: <174784268330.124259.6614015290533617892.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_085129_894708_16EA5FE2 
X-CRM114-Status: GOOD (  11.05  )
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


On Tue, 20 May 2025 11:46:11 +0800, Haibo Chen wrote:
> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
> 
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: gpio: vf610: add ngpios and gpio-reserved-ranges
      https://git.kernel.org/brgl/linux/c/4e9d73034196ac8ab496bb47583197b36ba13327

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

