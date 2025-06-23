Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58388C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzPqdhEKbFE4WKMT2toUuYysK0Z15a9xzSQs3F9Y55s=; b=SxCkoL6JdE3fD1FJzMqoRCGG+X
	oTfLrXAFqtMhwILwEfy8NFOhBToNrM1rZNWLVp3zarht0g3DqWQFj955UD+IUrMLYHLMOcXMsiPxi
	m7oF1E0s9AEIGkkwt9APQcVoVXlQ/24sAZ2aC80FRPgjqIXCQNMnPM6+kFFAV6v/EScBLWHwCxecR
	X/7Tej6ix3zzhu3LvVlQE0zNg+kHq+tKsu66TXFaP2PwzsUM4G+Qn1BDwuoDJoFUcIQ1mj11RHacK
	TekqhEDo132YwEzhm34jQ2P5vDx1kqx/nYKzB/Q81Xpy9BCRIFP7Qe8zJGlnlClCIYaluLvi9go+t
	sI34aBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbd7-00000001ryo-27p9;
	Mon, 23 Jun 2025 07:30:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbam-00000001ro8-2zf1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:27:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45377776935so3607355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750663666; x=1751268466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzPqdhEKbFE4WKMT2toUuYysK0Z15a9xzSQs3F9Y55s=;
        b=aVrYYhFhHXD09Pqf+60KmiAroSvJly8mR8Zq3RRuO36MpK4gyWxgVDaK2oIDnowX3T
         CN+cxvrVf9XQqfXwWlayhbI9ebKSxc5jh7EC9ErLsWmQx6vasp5gY5Iy1Cxc6U528hX5
         nit9Ih+m5omhJjy74VnWalfG3YPoVKKl+nJSp2f0GT384lgz+KChThIsjqO9hm419dHD
         jf8MWhEO+7Be1Sw4NLtL0nUym2x42IQMZyFLtIEMx3+LLdoVykYR4yHQ0Dk5g4JoqHTG
         WXwqiOwoThZH8fLlAo9akQGOvbwGp+41hieeYANoKmblDjxIkntKOdSr06oYeJNvX41N
         jCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663666; x=1751268466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzPqdhEKbFE4WKMT2toUuYysK0Z15a9xzSQs3F9Y55s=;
        b=lEpx4Js8m6o9Xpua1z224eGOn3hqMMj3W70JNaNr7xNUcTXlTU1Xg4Xj0k5Yt2sxhA
         NY5ExpFJPibHEwLWdMOhDCiNznDo+1gyrB1MgxRQIdeBLW2f+XzBRCVuIWhE+KoM+f8/
         RnXvuC7SjZPh6C3TAEBmaLSv9mQrD5EUSvueyvFkW5XyZJN5FKPWg/+TEhITx/sgjd+n
         1v5I8Sw71cTbNZiNdOpwSm07rogVDisgf+kXSaEZ25tVvaZNhfArSrJF1bxRJnU+uARE
         tzdprzSHT2CfgCatHEENsThxgNSq6Iar8DJYY0IsUevtjSD05TONxr75vHACUWNnAQDH
         yS5w==
X-Forwarded-Encrypted: i=1; AJvYcCX2POC3fTYIQTNGNuAcnrRca/Bhuk7Wc2Zw5A3QgjDtxVVvOnZUrP4dFI1pr8TYCepT+6skjGne5FUSP++ZeHzT@lists.infradead.org
X-Gm-Message-State: AOJu0YxW905CLHtHNZmmDnvRH3sfyZcyCobAFsA5+MHaicy+Y2YjBI0p
	5p6PP7K4vu7gmRnys5ZZ4JDTUc1L53OfXAWQ3Dnk/fMONCYkX7V57nnpu+p2U+Hi2cM=
X-Gm-Gg: ASbGncvGtujCHR2hfSHOuMn5bgr031gphy7+bPKKYKIYnWrVr0VNzwufVAwM/1D0a+P
	BFoqEdsg2PptDSnXEMBpQGvnl08QLrXRKr7J3dn2U3FWQiGWyQImd8qYahXwfRyI2azXu94e840
	k5hug7PL0KOlYj12DBDMmej6DWJc8GNBtZl7JPyoYW0FA3zvM0cDO0Zr/5BaFqfYFfSS8NxusGo
	O+g8OEAk38mTlKIxgXJEa3GElZ8FcRGzjRxuMB3991nJ11UXvdw/ArL6ZPgvHyKQ3Mh8CsPv6p7
	HOFX0Fyrh2RmjV8YRuWfNOsHC5wuaODbHE5ZRFaFnTRUT7iaM+3Rxu/Zgn29yQ==
X-Google-Smtp-Source: AGHT+IH9rEDeNXFSSnMBqu6I5pB5WPT7zqUetHOerVAMMI8lCebpPpqi/qM3evPjb+mgZmc3Iz0qeg==
X-Received: by 2002:a05:600c:3b2a:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-453659b68afmr92295725e9.6.1750663666401;
        Mon, 23 Jun 2025 00:27:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d7fe5sm100018525e9.16.2025.06.23.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:27:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v2 00/12] gpio: use new GPIO line value setter callbacks
Date: Mon, 23 Jun 2025 09:27:44 +0200
Message-ID: <175066365840.13100.13826929521170869175.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_002748_741858_9B133138 
X-CRM114-Status: UNSURE (   9.61  )
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


On Thu, 19 Jun 2025 10:33:13 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: pca9570: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/40b71f1171da13664e9677fbd993d9098315d71e
[02/12] gpio: pcf857x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/4027438be823abdcfb50ee2abed06fa4e6af4b7c
[03/12] gpio: pch: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/74260fb09cc6f6e7bb6741bedca4463079800ead
[04/12] gpio: pl061: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/201e0f24a5b73fa73606ae2261d155f00cb6d577
[05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
        https://git.kernel.org/brgl/linux/c/fecdef830c442e4375a3bbdde26af385583fb05c
[06/12] gpio: pxa: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f1ff31c8ef80f4720ebf7854e6af6204dddd9ce3
[07/12] gpio: rc5t583: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/309ea5811136a06f572c7abbeae2dcf773629a5e
[08/12] gpio: rdc321x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/76033f1f927cd93907c1e9eb3f86e54015e4366d
[10/12] gpio: rockchip: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/6731ad96e8770595d4a6ceb07e587b07d22da110
[11/12] gpio: rtd: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d68ddf651dd2faea5cdc6f6656148b739c38645b
[12/12] gpio: sa1100: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/cb908f3699fb137e28017a8fdf506c35762b3eb6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

