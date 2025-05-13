Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595C9C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPY3rRdUVBrXW+v2nzRIA0l1VDmPMKxlLUGaAoh0kXU=; b=uE9VScQFTrL7+pgv5wsRi2zf4/
	HpnKYW6FTTdlZ0u4VpVKRzAhlzoadliPiksauG85cD+MgsElacCotNEG5GyJCnucsyEjPLX5miS+u
	KLuOrRKUp0owotG6MnyJSQQpxxW5D58tgjnwG89/IQw4EeFKX546hbjuGf6Hc6BJS7A/SpVR8FOBJ
	Gent9Whh07lIeF3ZbN132VX1KtnuNV75lkafqwNzO56i3WQ+32OrwX6GeUiOVQqoxlOXnuS+K1QDA
	uSBr216gBNRLMpjjociNVK5LsGT8RJqhBe2VLYs1vNCOXCJWffpfzGCv7xNnLem2tTut+Aww5ABW2
	jx/vZkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpWK-0000000CT0F-1OlN;
	Tue, 13 May 2025 13:18:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpUC-0000000CShY-04Xh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:15:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so64561975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747142154; x=1747746954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPY3rRdUVBrXW+v2nzRIA0l1VDmPMKxlLUGaAoh0kXU=;
        b=fHWtidU7oUoN5hdb4OUy2gCvV6E9+/ykgV+EYJKPm3awnP+Wx3FEVJ//DDm4YSmqSW
         TKpih3DuVfuSVimg+gwSTQfwQ1plnEqsH08nUwWjn/++t89IHN+z7GRR9QHynUjsChHm
         o8/jvidjzgtGNLua+9MawNhFhrfD7pIOu6qfykxC/OhI+ny3zI+knyUtFdyQuoP9TYKH
         ZAcoKOwwokwv/+aTEVEX00gIRzTfsJL+cFb9oI3+FPJRwxl2uJ+V9bw+JcgV71/qXwM2
         AM4vymkZkAG6eV3Bno3tOnkhGfJPNtYXdpo0fbze/4FEfNXLouB00bEwKplD03dS4cU9
         QXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142154; x=1747746954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPY3rRdUVBrXW+v2nzRIA0l1VDmPMKxlLUGaAoh0kXU=;
        b=feLdXRlns6BAmVEtLqgLPJnvHeKELQWPY3rAcD8ufCZ3cHz+0pjBivfEMhB3pwj3Vn
         dqIH9+VrR6/oicXl3IrZC0GNzJ7+N3d1bcEH1oB1YiFvOpJFVZpJqblFRVdpP6y7qMR4
         MxAubd4xDZNky5nOzpdf4uuj78N9UIrp+kY9CsyDQy8O1QuY8YHzGGVDas6t5dll0A4I
         rUv/tSdrLQUMIoy74MmaL1aK0jSEGBjZIc2pPSqZx0WtODsW8M1KHMVLXwjPu7Kis9qt
         ghs5jePREJhquWsTc8qzaOHc1t1udERYdAG7U07x5KgFYl7m4OBP6tbpEMuter9Lln8s
         cOeA==
X-Forwarded-Encrypted: i=1; AJvYcCVXpr9kQyQGFBzuPpNQAItuBWQx37LyN+fgcDSXc50pZ2wczT+V+zpWP6SCGRBPUsLIrl4Fok5QoiDTfIgBx2Pe@lists.infradead.org
X-Gm-Message-State: AOJu0YwYwCLjr3/IpMcVfQsXFsbRCG9AA6C3Lp7m+qTHzl8ld2GfKIaa
	umS0rrrr99nYueNg+q2ARf4to7Xr5mGoAP25FePPNo3+EITY7xxaJSrLA64peWM=
X-Gm-Gg: ASbGncskJQiEYPT5zAOXOc/1MwHR/n6N40JaYYCUxZy4P0j0Z5/a9J6+MCq6OF9yuJA
	qFZ2rmZayQSjiMTpRVdvKlt5i13sK89/8/hre0viLesAZ7u8opHPTfPhiZflD+IPgsXujkYo2xb
	IgU8Zip3ID3OG2Ipr4CZzZJbmZFoCchyOOKZfCWr6yj5OPmNCcHITGMmaTmtUG4XNUDglM//TIJ
	3uiQEnfVdLLmmvrPSY3N4/OFLZksvZ/TnGtzP9TSN0GhcltrgrRoR+IYDpkQntSZMpYT3fSICtc
	uXX+q6u3wfhnqmJQ/2ZZMTiRHZZhSaKaLV31Cmbyj2dnWUNg0LQB9vdNbeE91bQV7coG98U+vYQ
	FLFTTLXj28ab2i6X1F46+Fof5
X-Google-Smtp-Source: AGHT+IF45Z3/yPJnSPxFe0jDPVCInZwQAAhswNv4Px26NKFArlJLvwKRwbJZn6KBm6BZg6uGp+I+6Q==
X-Received: by 2002:a05:600c:3e0f:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442e1093222mr108939215e9.24.1747142153624;
        Tue, 13 May 2025 06:15:53 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f3c2sm210290765e9.15.2025.05.13.06.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:15:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value setters - part 3 for v6.16
Date: Tue, 13 May 2025 15:15:51 +0200
Message-ID: <174714214927.9467.6551553602169960677.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_061556_062064_5389E641 
X-CRM114-Status: UNSURE (   9.21  )
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


On Tue, 06 May 2025 11:01:43 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO controllers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: lp873x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/30d15b8949828811e9df3dafc12e3d523ed6e154
[02/12] gpio: lp87565: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/978d23c1db9a303f2fab817de28087ada5859a9a
[03/12] gpio: lpc18xx: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/4f71abfef92d9e302c7c62744fa806076b3ba819
[04/12] gpio: lpc32xx: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/1a7b6b536d509203325bccd88ae42499b45f5765
[05/12] gpio: madera: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/2e6b7f5ffe08d42196b31322e6443a9874c79a03
[06/12] gpio: max3191x: remove unused callbacks
        https://git.kernel.org/brgl/linux/c/75e80b69e1367b95a98107fc38351b5b865c568c
[07/12] gpio: max730x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/1938913798082cd284ab59afcdf68c2bb5ba1686
[08/12] gpio: max732x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/66a6d0e5a77889cbec98152dadda70dd79f1678c
[09/12] gpio: max77620: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/8f9da4401b82faa788b663402ea699ccfd756597
[10/12] gpio: mb86s7x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/dff5a31dcbd260eb61f0128876910809f04f1e3b
[11/12] gpio: mc33880: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/51227589e8388b452b4315907d2de5f7d5a06e87
[12/12] gpio: ml-ioh: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d3f960365b8c35449d22b780383dc9b40d96203e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

