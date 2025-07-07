Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1826C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKu+RkS0Zdmhr2twn3T0q2HDKxEwF3RB9jkgTUfP94w=; b=v6jclCBxuDgnreRUD8zpQMWrfl
	KCBWreZPvXiVjgVhmSAeQenr1ymrVGhopYV5QzJubalJjy6ePJtt/5dlUkRbt2u5Ibx5tuxqvwjUh
	3hX48Lac+fbNUUoBUeVDvVr59PpUpr1+Bl6s1yG78Mh2Z31tteiP6C+5y8QRKygb71mzF/peFpw19
	LEQKVuf933hltlbXj1cSRnJ63cpyVWWvs8R/HjZt5J4U81cPLKAzE78ihUJTiUfpfZU/6xYuxbC2w
	1xqGQ69xSvR/epDt563AeQBa66KO5qU12E12TFiqRrzgXiXnZf/V7+wBC3JXpfcQOV7bFQZ6Xbe8G
	CEwWNrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhAM-00000001qkC-3SWi;
	Mon, 07 Jul 2025 08:25:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgVA-00000001jD7-1OS6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:43:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-454ac069223so17899475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874179; x=1752478979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKu+RkS0Zdmhr2twn3T0q2HDKxEwF3RB9jkgTUfP94w=;
        b=ssKSx/EyWaPJKD2g5XGI9ajrFw/nihiUX3SvOZukXctWadhC/nUdtbqTLNxNt17gAl
         XlIOa6TjZ8XRhTvZhm4XPhNaCiWUwYxPyQqOhu7OkWQhDnzSsE5shiaTPWs0Fz87AUf2
         gs4VWA4OpCqKqH5Io2S35sFFToQUyAoxNsplx0FzjWNZMjkdwr8nlLXXLR/29byTlOYy
         hzbH4RRybn4ZsACEd1MKUxRk2IAUFHKGkl6tO56FQgHef6v9M3nKfSBwX08gsjSeuu/v
         gQLkjVslu8npMAjbIB0CNwMJ9qnLz9nIgoswDyEzOcOPr9ByI/vJ7zXM2WM4iiZ4tB4l
         lbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874179; x=1752478979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKu+RkS0Zdmhr2twn3T0q2HDKxEwF3RB9jkgTUfP94w=;
        b=mPu2A0fs8LW72QGTlRUVaif6Bgl2X7nCBM2XDm0hiBqRPNOpgMX6Pzucsp/HB+O1b0
         EdGKHMC1E3yKz5JcM5AgmM1HmHPBhyKYyJ/ZwdIWBjeP3MyFrge+QtAk27J1V3DV+m8Y
         xLek1lSchBesXJGQC9mmYRioECsTbJcwi5FGOhjahhi/VG2U/GyRTsPYtD+3oxpYIZxs
         RXPGiRck6qMuLB6rmKl1jG9F2UGM6y6RCYqjii/c3M+Vprp+5Mv/slQoHmXKkrQav0K5
         stU6Llyyr0qsmFbKXfEEJfKw+JIpFWwsJyVUUmp+UZav9zB0dsgrDwRBluKGxURyxe+J
         lKWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUqtEZiaUa6sTRs5TqW0DSoGpdmvNZj9nOXPcbasQePvAGc+o1Ya6QXlBalKLQF9DqugC1jO8VbFM7aCusMh3x@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/cTFMLd+Z7eKRk0BT+Ynj2kpMlYPUaMsYl4121yrmTaWBEdSA
	Xry2HDQWGenccHsUgFpOb8kBQuec2u92ZeU0TRxLlzvZyex9WZdZg06U5clu6wAcWEQ=
X-Gm-Gg: ASbGncvQnHzU/Z8ECvu8LRUPNG627Xm2ANQ5G7ihy7YgSXCYfDfcBbBdbEjJvXFEBxI
	41AsSJ4GAqaxrQCu06gy+NoQxdis0AdlbpSEMGtTLsnMkA4WCNRGfRXqG7jz1PuUau26tZrrgu/
	3NPWVOCJlLFWPIpKBOxEG2L9++JCKdCezrZxubEx1p7WorosUNgUTtEcp0CPoxxCl5zLygy8zFD
	CPgnQ31jefWyDhbbIlNcjrKoSLwWgpeY0Q20Rlx7D+y2nysrEHUM5dJqqylHJw7EsyOjOONK18W
	BTeTN4rSO49BoO7DdE0Dh1KfiVwMn2khOc/c6xXUvrBA58yxbPitk8GXX2VQmww=
X-Google-Smtp-Source: AGHT+IHNExQVGguYaXAKB1aXj/Vuf2MjgUwaU88wZ/Fr9+ouWScx/ZAWPfXjtQAAvi/SLz+JJ7WmDg==
X-Received: by 2002:a5d:5846:0:b0:3a5:7991:fd3 with SMTP id ffacd0b85a97d-3b495b94916mr10412880f8f.11.1751874178826;
        Mon, 07 Jul 2025 00:42:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0941sm9259629f8f.26.2025.07.07.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:42:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH RFT v2 0/6] gpio: mmio: remove struct bgpio_pdata
Date: Mon,  7 Jul 2025 09:42:56 +0200
Message-ID: <175187417000.11224.18185920121696300938.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_004300_370952_196C0B48 
X-CRM114-Status: GOOD (  14.01  )
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


On Tue, 01 Jul 2025 13:49:34 +0200, Bartosz Golaszewski wrote:
> I'm working on removing the fields relevant only to gpio-mmio from
> struct gpio_chip. One of the bits that need addressing before we can do
> this is the removal of struct bgpio_pdata from the kernel. Fortunately
> there are only 3 users left treewide.
> 
> This series adds support for parsing of generic device properties to
> gpio-mmio, converts all users to setting up software nodes containing
> relevant values in their property sets and removes struct bgpio_pdata.
> 
> [...]

Applied, thanks!

[1/6] gpio: mmio: drop the big-endian platform device variant
      https://git.kernel.org/brgl/linux/c/e567269e246809223fafaee7d421ae17a832fae5
[2/6] gpio: mmio: get chip label and GPIO base from device properties
      https://git.kernel.org/brgl/linux/c/c4a834840596c8b9e388d430154959390f9f96e4
[3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      https://git.kernel.org/brgl/linux/c/11cd2e582bf4da87b5fc0f9b07e194daaf212651
[4/6] ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      https://git.kernel.org/brgl/linux/c/094017efe332d411a8d6ac41fd8d0a4f81f72a99
[5/6] ARM: s3c: crag6410: use generic device properties for gpio-mmio
      https://git.kernel.org/brgl/linux/c/bb9c88d5b0fabe05b0ed4b843efe78ac1c4712f0
[6/6] gpio: mmio: remove struct bgpio_pdata
      https://git.kernel.org/brgl/linux/c/9bad4bec5daddbb296481af759f9d56c849ba96f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

