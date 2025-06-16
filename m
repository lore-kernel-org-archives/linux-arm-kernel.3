Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F814C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GG2mpeuISDpXhdrt6iGw2KiNF6LC3P7QlYizdJ45M+c=; b=GVYSBqBIodLnRexAmAdDgiw4ft
	zKN8ZNi8oep8W0rGut6roFTdQsB8qFx/bUOeaTM7rtFFD4QqFvLZUadYuGQTWvDbyz7Ih4Zpojc0x
	jjmHgnPiGpsHyX2SoAyPDU+PcPDo41F/O9KrRjlFXoPkRrXfQAgl6zy80lwFDOn0I5fHO1bJpmKYh
	grm1nIUVbQfyuJG7ohj1JLyQITkBEgRx3l0PpnzwK6DqVI7qye/SS6yI75wM1EQbCgR1Fhy8ccJkJ
	iEOrviTMOcgVxkXjAeG8B2QlfFEEFeUbxqGmZc28Twl8OA0IZw8Wf2zp232FSgNI3T4eJR39Ei2i7
	qDBV7q3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6XN-00000003ygs-0OMB;
	Mon, 16 Jun 2025 09:53:57 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5sJ-00000003szr-06TF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 09:11:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a52878d37aso815493f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750065089; x=1750669889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG2mpeuISDpXhdrt6iGw2KiNF6LC3P7QlYizdJ45M+c=;
        b=VTKJ9QuXIAKjiwLyk5L9qiSa+bGRjde+pgaWAQj1w68Fx5uFEHOCc+OR7/CjKCW82Z
         zG/LIj7FIqAQQL2qygdTRbATxBbxJh/X1smmOXXLPxIejXq6DvoKyvSzRTSIGk78Q0JD
         XpqXnNSsAU+ZCyJxmzNkoe+VT9mxHkGjcAPTwAZc/BYGjnvQ7Yf5qI9s284XnVIlBA0i
         05FmTksdJDUQXNyEX8paBsd2uTydgLObjs5yQzVjLFOlpJuQAkITHXXsII9rGGBrIrsZ
         Ni/lJRzDdPhGjLxl+SzPLBYkzzQGfjhVlCVm+CAIJfZFAFiBnNyv3FG6srQiB7uv2rWf
         SUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065089; x=1750669889;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG2mpeuISDpXhdrt6iGw2KiNF6LC3P7QlYizdJ45M+c=;
        b=H1TeROW/bjffSJwRW4M947gzOtq/kRgAarqoedJ79T40xJrpzkCbntNmQC3mt1AedW
         La955KQZYeviS/y6f9bn/SSmlsTrdcwv56HWfaCUAEob2kDy0LqhxhfZ61QGY5Kttujm
         4FNDNutS0/NQptW2usRrJ8jOaF2sLlYE8oEUV6eThpsxGz/e6SGpAnRpPs7iJ4wSbbLQ
         parVzQuSmqwNGNuDlFghHjFxOJ31bee/LGe1j/cgq+7BF083Mtf3b0NQBKq16AGs1hn1
         Go5+X+sflmYCwkqUjy3zRCqnUOgzAJxa/NON2xGxXYcGECDXntl9XCJdHItG5VM9t1Vx
         8GIA==
X-Forwarded-Encrypted: i=1; AJvYcCUNBWjKW85UkAT2zwyO1KYZZ8ZFvZjkm3PKrKdmKd0P5x2jrCxx2YRp14ExR+mCnQxPFzRg0dRqtmlCFiJ9PIhC@lists.infradead.org
X-Gm-Message-State: AOJu0YztenHKKmPTIyEI7ITaGuZO/14TmeIoYC/8J6jsKEphPLq1qRZu
	pc1CnUX5qNAP1qkl9btQsVJu8gNQK6PaTrlz3/XHGDIPOPDO7GIDOVJw7K8vYTfQuVA7ckBhh4V
	blq/DtXQW8g==
X-Gm-Gg: ASbGncvIovwjf/B2JzVasz1QQFAXOgcTTJtKUClffO3J/ZncD8sdhzW9JwQMOxJ9fLi
	OkhbgZ1kJbUDec4w1TktAWUacOBUe9o/W3LTdPsCX7NqchX0bgkKTgXe6OSQngkmMYlfBRmIIse
	qxeAKUV5HF2jLpb4AlfcnQBZfalMldMN9W84X8Xu2807Rjb9AhEVkIMiCQE/hSCasEveA+5HlJO
	QPvUZjC/YeI8UanPwtZAAL2lcSGIT3QGWQ7g9EFGVfr/PlXAcE3i5e/Xpjcio6FdTDBCYZIS4/Z
	Tde02jAvEet2muWPku3qY6tWAhKvf4sh0L0rYvjpsfgIG4v1rvPGn5n1o10J9uqFsml+9fEaiN0
	NP1WMp3w=
X-Google-Smtp-Source: AGHT+IH1WB0/sw9sqaChH695gvNYuYsdGilhFE4QGQCFNv0A2lCd1A3eZdG1Rw5dHdNgAoDh7P85qw==
X-Received: by 2002:a05:600c:3f9b:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-4533cab4477mr28464145e9.6.1750065089320;
        Mon, 16 Jun 2025 02:11:29 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1cc5sm142655045e9.16.2025.06.16.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:11:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Message-Id: <175006508796.28664.548838572668518596.b4-ty@linaro.org>
Date: Mon, 16 Jun 2025 11:11:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_021131_083265_B9B1E112 
X-CRM114-Status: UNSURE (   7.94  )
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


On Thu, 12 Jun 2025 15:44:22 +0200, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
> 
>   vmlinux: 152864 kB -> 154528 kB
>   Image: 39391 kB -> 39067 kB
> 
> [...]

Applied, thanks!

[1/2] arm64: defconfig: Switch SOUND to module
      https://git.kernel.org/krzk/linux/c/927f1259c517ec0dc589f5014c4edbdc87591cd8
[2/2] arm64: defconfig: Drop unneeded unselectable sound drivers
      https://git.kernel.org/krzk/linux/c/a8365bfb249907069fb584a535d03c291157ddbb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


