Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28331CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4iUdlkRYd5RVsH+I3fj6Ee7IjYrOIYZyxbLWxbpMgs=; b=DWWb1VDcbOq9v70OZ0iVPwSTk5
	aN6jVc2c6qrTmR47HRE/OfB6W1smLQduCLugV4zPkg+65bsyA1SH7jtG0rrAT96pjki5Od25LdQfl
	MeATOwRvMqH7EbFAoNFu7sE8C22FOPBjGh+hZ2OYOdi81FI0cwnPFSj/fP1FTNLrsEQ821C6GYfqH
	sF0d68vQLcYsJ4qhE9+9N29KJPvlBb+VvUP9fmwa51PY5wCq/78AP+L6Sd6sFFBk+eAlziP2rLFv/
	1OMjiaNTzajzCzDbjB5EBF+sQkQxRNRzbc1q2EOOyHhHyIXtsS8seThODU7usAVdYfkcK01KmLy+p
	30D8RDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvP8-0000000FmPB-3ozh;
	Mon, 17 Nov 2025 09:20:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvP6-0000000FmOX-1bT9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:20:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477563e28a3so27161025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763371206; x=1763976006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4iUdlkRYd5RVsH+I3fj6Ee7IjYrOIYZyxbLWxbpMgs=;
        b=qjd3p8ZOJEi2wf3Zqgt4ywu8OWWn55ShxyVirCZCJ3qE90cDn7czfCx1/yNxH28q9Z
         eQHiIDB4llSTaOse08eIwr093lIlb6b0Op+TlDZDgT8XQvYCZoqoSEx7tUoB/pymSLzC
         wnZJP2Q4at6XyRTi/+bvdfc8LNHBUumFGGiegWfWqwUTB8ucbEK0iTkavbsNvr1NSG8l
         jRTd6FU5EW/ztYZ7TCdzYNBYAn7QcsmYFMPd9T0K5S/zWzWHXPfbIpuBOgXnmVkheV2i
         2ODH2s50dNku3uEp0c9bxsr8E61yw9WOxBek+c6XnuFxwjEOQfefzgBBkb3tDsv9nqRm
         C3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371206; x=1763976006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4iUdlkRYd5RVsH+I3fj6Ee7IjYrOIYZyxbLWxbpMgs=;
        b=vPxMwEu6WsdoVttd3Af1OLUM1g5OKypFkUGlXlw0fev8qWD1OqVfM+iaItRyjbPrHi
         03Qh90oy8DmW5TjXx/IZahbCeVizQFPRq6OjJn7nytu9FOfOQbM+Y4j2BUU/j4+ILvEc
         Ci0RmFDx/yBat+R21SvjD2EXGEjk1x+vExF5xCMIpFvX46t0uhoPN69qu+Y+YaQBmKms
         8QaJD+b5zyiFmaT6gn9NFK8T6nC14utLAp7Uz1IgHKNWhRcK5AhDjYN2mUGVhsgj5whP
         CsWXY3Tzk3jbpWXMVUku6qcLDIrvgtKl8yG40EN/bLfhhb2C+pW3yG5eIC+jXrPEsNiP
         uDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPtoUAxCCabJZGWPMykmzdl4FdCN9qtWfTBgOOKKGMgDSrylakcuOYkZsKqYYaVoubHc0nNmQpIfbkhnEn0jZu@lists.infradead.org
X-Gm-Message-State: AOJu0YytKoVJ1WbA/ozd3Ljo4+2PaExAz82NkcpPvd4xOWkXypl3Ub4K
	ExkGHqU6GP8QueZ6+3sdW8yv/Wh1MMwTg0rGqvcyqpGF1o3Por4fvl/ZyjJPnpvtnKk=
X-Gm-Gg: ASbGncskBihfj4Q7qgKJFE8lMyRjZ+xIBpuntbE4Jt9PRYOnI1l/wSOEKNeHEbYNThe
	xvlIT/HtUNkoRfAzkmjpklrnvi3gB0eiK6acvvOz3GkWlOriv0F5JGY7W77gGsiz0vsQarIaN/2
	DOFufA0CvrSVMalWaHM3VwxjHAfYeCDZwrOjfyXF5uI4EcIKgoxINqzCF20Y8L/iMh2ZRNCwZFO
	OtwSbzI0Kkqrfwi3IuqiLL10+gojvDlRpvjARoZO5BG+1fkD4RMHp0LZj9UthNDreGXPkwIlOrx
	rKSHwe8maMaoJihXGJVYKGfTa/OIoOUFBUTjfe+gHUl9oEmPDus3QnBOqDbe4r1mlSMLUL1ebBt
	MbcZUX/Jq36yOfr0asG61JiQTtKHAej5mCumvOFcQjK+CKZxvUfsKNkuIZlaodZlx+XS3e2JXzm
	B0uLLN2ItAPThexEXF
X-Google-Smtp-Source: AGHT+IFM+sFTyB1K8S2Q7ocXsR+3CIJ4k6ZJKu+eA5woiTh9UsabhucUQnbw+fnLYaZmdpx0QUK3GA==
X-Received: by 2002:a05:600c:190e:b0:471:665:e688 with SMTP id 5b1f17b1804b1-4778fdc3175mr126088235e9.17.1763371204858;
        Mon, 17 Nov 2025 01:20:04 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:36dc:12ef:ca32:1a1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm25365943f8f.10.2025.11.17.01.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:20:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/10] gpio: improve support for shared GPIOs
Date: Mon, 17 Nov 2025 10:20:02 +0100
Message-ID: <176337119246.32319.3276431687296122830.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_012008_687057_0E49A060 
X-CRM114-Status: GOOD (  13.25  )
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


On Wed, 12 Nov 2025 14:55:29 +0100, Bartosz Golaszewski wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
> 
> [...]

Applied, thanks!

[01/10] string: provide strends()
        https://git.kernel.org/brgl/linux/c/197b3f3c70d61ff1c7ca24f66d567e06fe8ed3d9
[02/10] gpiolib: define GPIOD_FLAG_SHARED
        https://git.kernel.org/brgl/linux/c/d4340ff75eaa083f261e16d49f13191236bfad06
[03/10] gpiolib: implement low-level, shared GPIO support
        https://git.kernel.org/brgl/linux/c/a060b8c511abb0997381b397e52149a5e3e5259a
[04/10] gpio: shared-proxy: implement the shared GPIO proxy driver
        https://git.kernel.org/brgl/linux/c/e992d54c6f970b382ffeacd7c88f68b94a3c6caf
[05/10] gpiolib: support shared GPIOs in core subsystem code
        https://git.kernel.org/brgl/linux/c/1e4f6db614a310cc34d07ffbf031c76ea9581bcf
[06/10] gpio: provide gpiod_is_shared()
        https://git.kernel.org/brgl/linux/c/eb374f764a7012eda28019266a6d9191670c4fa5
[07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
        https://git.kernel.org/brgl/linux/c/e511d484cbe44fe48a1b9f621f6a947c72503f9e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

