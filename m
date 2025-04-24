Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E531CC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guVd0XqaIuuYiAcIyv3ohr2gNgxdcQXQ26FZ1XVufmo=; b=edqQgZ25FkYLn3dqpWqjoiuiEL
	PVGGTGPBcsfExgSCNDCXfLXwXNmIgJ9P0Wvmj/IJEVd9FEqjAFph76gg+2AVw6MSNfnMjEOhwrLkQ
	fCVshCGUe7buazD0Ytu4ket0jiM/zXRQSaB0JZg0B2WFjzuWTlDAZ1A3xrzmLTU6nPb0Sw8lWwg4V
	QhcxnGRAcX30quchNd3e0mcDFixfgv0bKr4z/16Y1PbvT/BJxKtLKm9dSwmehBuXsQZCez9fMmPwX
	TfeBk3+2WAeEMrEXNcmJBdNT90G8WGi7U9xt2u78LRRuJus14a4YE22MzDIGBFyAE66wtqhonyAja
	Q2Yx0dvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sQm-0000000DR0K-3b36;
	Thu, 24 Apr 2025 08:59:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s3r-0000000DLCX-2WbP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=guVd0XqaIuuYiAcIyv3ohr2gNgxdcQXQ26FZ1XVufmo=; b=dnrEcF30HkMkLGuz0uFwCY16NK
	6JBPwSKC+3793ngmysiv7J7hy8XF2KTwZ9nS0f4i1v86JNQRFSCrW21UdxdDLiN8P0kdwzVmlmhtn
	geXZM38vM2tkR5IDW8LaL82ObXpRdKf+HFWVKH0kCjlPrbUgiHi/yCWVbpF7UK0oLms4Uu8/wJs6H
	RFgqXGguCf05gAZiZAPBt86q6tk+ksswwfx+4wKaGYNDTL9HdYgXYlrbHp2tmmWMlBNrw5tQiTUdL
	sQLRkDJMtfBRHyWoL1XjF8dAQsv07gvyYEoUCbs4Svupc8ZVppArGZ4qBKCrA7HS9I+1A2+KdwCPy
	iv7U2c8A==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7s3o-0000000Bcl3-48mp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:35:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso4380155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 01:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483754; x=1746088554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guVd0XqaIuuYiAcIyv3ohr2gNgxdcQXQ26FZ1XVufmo=;
        b=h+DEahWd7pJ/tWbt0LSFEnBKhimlXC8EhFuSg4mRXX5B0LjTz6AQd18+bwnQFAbCJA
         uKjTfsaxowVg0LEWmpPdugtckBFmFtGJp/BlDxn/AVZOa/pIpwcINtWWizIgW0oUxbOG
         jwVWedhT+D3xx8Z/nCNKcdnuIbw3vGRN9zUhBZXkyfDzUTiNd1rVRs5mG5R2g7klgSir
         Wg/pqSjSy6sYZLEhmUUQ6CBJrndPWVe4wsOoxWtggcm1u/88e1jkZ/ROicbshinX8TAf
         1EnBnwddx0g/DA29VN9gNhscWafONqksn1J77dtsYjPiYcBUunPfYIbeSjqp3jH6xplP
         Ygdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483754; x=1746088554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guVd0XqaIuuYiAcIyv3ohr2gNgxdcQXQ26FZ1XVufmo=;
        b=O58Vpl/O1NVesquflYCQ2IKiwHPZdNalLs6y7s5hIq47i9xmnZqTNEH1clfqZusvZC
         NCUPtZKz+fp8yvxNYN6A1A9zUCDh8TwHb6A8fHy0SV0ClxjbvTPkSgwgMFd3QE13NsrB
         VqS8OjlnbPeuX67S//vojnodJdaQ89oZwUnIF+mkIEbHVKdLHXa/tdiNYMToSxU82XNa
         m/I94+dyU5kVfySVnaFMhxyGd6HXK/aA8Q/bEORBW7oMf0xS2fTiNt+K153Vt2rbZy+J
         pqpFLSzaEietsMqo+JpxwZ+/4BNFerE3vs0nqJTmlAJph5t234U2k0orJQAFYp6EUPyW
         rWZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCOCnJWXVteglqXTDSeuYWeZX7+MYFftQ5OcRYcXK+34/rKNYP+BDQJdizDGsZDbSMngP+bQbrE0PsjoeemqVs@lists.infradead.org
X-Gm-Message-State: AOJu0YxS+jRb9ItX+8Wod4bUy7n9gFgGWPkXccmLLROYfhIWNzceHggC
	Kxx3LL+W6jdsBiCZZTF+9N/frzI0HYFBk/GbswVQXLtyW9E+cf9ogQeHyIU8NFo=
X-Gm-Gg: ASbGncsMK6LqomjlLBvX5PmSVE7v5cfHDZNqGa5MNjaoAt6OouL9ZRoh1VX64p18crU
	mKRXq+b1AXhqeto2IJKXLyumA4ltB8KxDzPugja49pk1/g2pBBNwWAQ0LQyRQcklXP1GdPtx08M
	qvZf5T3YRea6Up8+67Xoj3Ju7Q4eqyhR7Z3o3UZ7U9hfMVHV783zJtMM7llnPSfO6JEfOtodS7L
	D0unknDy6PH0VnwuMxikOYx5txYYKAV4vjePzOLXNy3w4RjgxzFizylBa5Jd1iRyuW+tJhusPdN
	8LMoIM2YzG1TbRpjiNg6pdh5oPxQyfjbyA==
X-Google-Smtp-Source: AGHT+IEn/oPv6UnLEvwrRXLxLEBd1A5hnHHfX68c3JV4/tT6U0jLedpQliXkYdl8P+72/kekunTQ+w==
X-Received: by 2002:a05:6000:420b:b0:391:4873:7940 with SMTP id ffacd0b85a97d-3a06cfb22c3mr1086182f8f.54.1745483754307;
        Thu, 24 Apr 2025 01:35:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:31 +0200
Subject: [PATCH 08/12] pinctrl: at91: allow building the module with
 COMPILE_TEST=y
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-8-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JQiHyqG15e1DMj51Mblko1MsHmKlA0nIqnk0NLfFft0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffc0yLOnkqqTE6zwxGGFb4MyEZpSfBDn7daV
 BRxeEOL8NKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 cnfxD/9hl8UZC729fpc39Q9MO+KK6OGwDTHMkxkX0abTk0tnDXvkYVW96eyNIRbMSvdgtxxYhQz
 DRC/3UA5i8zPRD/OwTjEIOsmy2MrIk7jIxOc5WSE9YQ8X7Y9Tm/SL7gxlxkKDhfXIfKk4kfIe1E
 XSwI6rjWj8PbPffzAMsQ27Kvm5wKlmT0jM3leNBQzqu94uViOHB830IfkAsXtoo2s4NWWmp3Xke
 aVgPWgFaZAwaXQnb6e/3UPwpp6qeMaofylNzH4HBO5YvWqtaL4kzYcSztcH4dRWVKwhXPaUQ6wj
 XddUuH4De8auEqWbcs37eMJhLmIPaj1lwGXEuYAAqPMc0aZBFF2k6QtC46GyCGx+TQywYIXaCak
 6Kd2qc8b8NJWREV/UnAq5r95k8EQhYr/GHDpFT2ZlikKn1JAVeDz2zPws30y9RhcvMgC7rHXhEc
 +ZDp3lgSoP0biUU8jtIZdCycINhWD2S9VGI+RRfDLkBZi4mm3DdvH0C2Cn7X6WGdo4rvJuqMwnr
 pHhDbirfJ5xluN72zegSt7BJLSKyLgRDejg/nElrexqqLGINLNl3P1RVsaVavFjwrw8K27FlZN8
 6927UtJgVUgH0EySgq1Dkch7+90ScwITtvN98N452XpCGrslt3WrHTz63//GtPkErNETJABYuBz
 mMIajgtwXO69Q7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_093557_094807_C406AF0A 
X-CRM114-Status: GOOD (  11.33  )
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

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled. We can do this as the driver doesn't depend on any
architecture-specific bits.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 464cc9aca157..db84d80b7e7d 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -103,8 +103,7 @@ config PINCTRL_AS3722
 
 config PINCTRL_AT91
 	bool "AT91 pinctrl driver"
-	depends on OF
-	depends on ARCH_AT91
+	depends on (OF && ARCH_AT91) || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GPIOLIB

-- 
2.45.2


