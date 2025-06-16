Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F5BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTU9Zax5kLpMeKPmyeLAiww8adzxErGgDJ424AqFWP8=; b=iBm3FC2ReDuXq1q5L5K18ANCKn
	va4GeXU417M+169DvDI+IJ6BSvKoKrewo5yz+HCFFhvGhWybhz3QDUM15Veaxym8F/2ECZQXeT9H7
	Y5B8XI5REu66Q2qwx8gqX2as0E7d6aHIthHSSAHxtmnW1t06WjAiyAXcErlUnJrTClIC9StaB6uCl
	ibROwHCIt+1hmBgAMBniFLTth2mm1qXvTxhSY8G4shCZfGeF1yiNK/QpnGsF+J1Pb1bVM5OFAysyo
	GNy4DO2toq4HsPbNU8/BDel5raIDLQ7BufsU0OU799QtxdrZeSsb6X8v1wH5B8f5HOKTkaXNQ/Y0c
	BZzMT4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4ln-00000003jJZ-185b;
	Mon, 16 Jun 2025 08:00:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4Ug-00000003g6t-1Xiz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:43:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso2776299f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059781; x=1750664581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTU9Zax5kLpMeKPmyeLAiww8adzxErGgDJ424AqFWP8=;
        b=pdLLgA/EBfoO7uIN9aK5hp4vGYQuInYG1/Q0ZATU/ORU1+PX0YZ6L2F4zU7e96mn8C
         h+x+/GOoJo0/AZk2JOjIJcxS96X7c5FX55FgkCaxCZtjX7tf1PZOlt7U3zt4NUcLSUfl
         jsvRuyZGPRFkuZgfFEGOQARZRW2Hmgo0PPXSeOW7zKk/GcDWSsUSJSuF1gtCRLL+64MW
         GY7eFXXe1q7QPbr2G+PUQfSWLIiypG/XaxE8qxfclxAlfxt2EE1fDi7Zs3tYf1e2qpFr
         d35gtStMunWh9Yx3HQNmQAa8feYkv2eTTrWN0dEzSuzO9bLcWu2QDhnyuN3QB6uMU/cg
         RETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059781; x=1750664581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTU9Zax5kLpMeKPmyeLAiww8adzxErGgDJ424AqFWP8=;
        b=lYiX4Jj2noIZ4/ev6h5r/b5Yirq+PVrbjWfCwkD2tg0K6ZjPvs8Ms9RkE/YLN32Tbi
         wCR8RMuWKRDW5sbD16ilQHDo94npu+L/IR26GATYs+MDXNF/IDKuZJbgIOX3Ohd6Umwe
         pGswnuVU3GPihhuTQdyGnNeJDE4NEyFSGdhOJxHaFWF0JdVxWzUO0eQUYf4hoDVGDEAJ
         07P27K1VBvN4OpfP/D6iJuyzwzwV75+M1p8jea2LocPxZnXgV1JxGFbei8OocJ5C7yoq
         sgWkbDzFDEoIv9xTPlrQDMxmoDA/ds3YR7RMCJDWCIlyLW27EtJZy9f+i5Vtm5Q8uQ4F
         wc2A==
X-Forwarded-Encrypted: i=1; AJvYcCWRA32a1MIgxO5wOwW5PWfmN5o9vivf3xyd+msYEJ218zdnNDfJBTxDs3CYuVpzXqAeOS2paZkVLAtDedxDmr2I@lists.infradead.org
X-Gm-Message-State: AOJu0YyqGd6BiRob70Am240eOQmnWNV2efni9ngpieZ7ZeprUnWZeXo2
	reaYzpk0fvDmvY2duO591fHryq3hfFytKxVu7kLDQynfIItDMZUCuwEQtbZ5Mttd9rg=
X-Gm-Gg: ASbGncta7wLtPDst5PiWRzXFYLjxvAGptbL2hEiq8W56DvMNrmQu1jVb6Zrltu4rBM1
	o1zcuo8BqVcOdHtPL2JpihbG3bHEgkLHuhJ64iJm/tJJliZWpMgdQ1xGAPyzc5Ydy/sO+sFwEc9
	hghL614RegkPs6Jlu+vGw4ZuHmXv97heGcCmt+3eF4Uc5E2WiFy0nUfjd6dUGnVTPNcepj3ee+g
	ifsDz5CIpWetuKKhm+oT9sTd+FKG9BsVGidG6p1prHbdW4cyQedpHeohmwRddKSY6TpnAu+4VXJ
	YQtWMKBMeQehIjhWo39eF/bh/XcQUPlB81NrSeE25DiF2cIZ6BdHJaz23DdCOVw=
X-Google-Smtp-Source: AGHT+IGNJS0KEiSwDJqSBbXx8uRkNhJkRtvXE4ajBKXtNWO8NPC5+V6AIpPTIVHjojheL91aJSa8eg==
X-Received: by 2002:a05:6000:25c5:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a572373c7fmr6714675f8f.18.1750059780880;
        Mon, 16 Jun 2025 00:43:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm10151340f8f.2.2025.06.16.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:43:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	tglx@linutronix.de,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Keerthy <j-keerthy@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] gpio: Use dev_fwnode()
Date: Mon, 16 Jun 2025 09:42:58 +0200
Message-ID: <175005977568.15490.4738567496048769972.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250611104348.192092-6-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-6-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_004302_408515_87C96327 
X-CRM114-Status: GOOD (  10.12  )
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


On Wed, 11 Jun 2025 12:43:34 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: Use dev_fwnode()
      https://git.kernel.org/brgl/linux/c/7b2c2f1eb3914f5214a5b2ae966d7d7bb0057582

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

