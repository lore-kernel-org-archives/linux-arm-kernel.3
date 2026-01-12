Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86156CF45BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hwt83uYo3jHD0MLk5KQ56cEnTsquiki/I9cLu6SGSsU=; b=ye7AqG1bIoPSNYssYZF70Z+pUd
	bNK4+6JMeSuf9j8VJsFv2BncWRUmdx5qqtfUWutZIq9d1ShLjRbYHd0WZpUbtCo2gc671aMHxzHIz
	+EAbMfQfbaD5BNmcczMm8yUakJ743IP9+OxxxuCbc4uO5iA/5puIUIGl3Mt1pTTTwt3dbrVyPltnN
	sjOqSsFxs64KR0zo45Xe02QfE3rial6+betmr1pGhfDVL0SHAOX0sc98MgTYQ7DZDKq3Tt38+HeiH
	QMjRChuve0BrucoH/gaC2O57dZpSPwzxmZukOTS/7Va8BD5fFoCdLH4sh4WaTv4Hzu9UZeH2r/ph8
	9wj27tqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfM7Y-00000005tCs-1T2U;
	Mon, 12 Jan 2026 17:54:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfM7V-00000005tAi-2Vgf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:54:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so43159175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768240460; x=1768845260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwt83uYo3jHD0MLk5KQ56cEnTsquiki/I9cLu6SGSsU=;
        b=ObSA+ED5AQpwZEBNivt68b6JJxvqvzZKL8FO1YEI6Lb6mrywli6fVjuqDrb/GnOszC
         NjAZlAxjd+p95EAypsQazCCduKCt8A/RYhYhpiOS7BwZqfJ80/LU4nEsm+hptwp8a8rv
         fuAlwUjMbQFYByXRUnpxYvwFSqT3chUaB7OC5MK0TdQurkpxCehkIsPm6t5mwuJ4QKGW
         2YkKB6DIn5/FrFWeTJ1Zh1+X0FFcVn/ZRP88Y5wQZIqNdB04U8g8WfWKWezPpz8ugQsD
         tw7vom3kr+7H3wwFo3e+CshKSi7xNRLG6YcZOP6tTQ9Ezgl4ju5oj3eynifxq9MWBit8
         6aEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240460; x=1768845260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwt83uYo3jHD0MLk5KQ56cEnTsquiki/I9cLu6SGSsU=;
        b=rTuHvDeVgmKVRzEPMCMaoNSW5lnbwtoV+t9Qt83p8cnoGtI9Ms4O+n+V/AAfWMee2n
         uiVw/pTtIYnJYADtElUnVnaF/ysyEYQQflQ4VrOJytEwuLTzCEUBbx+KZzBFayeV5ZSl
         xNmztao7lPbUg5+Ztjp3NCviM0juDj8McHDpuNQMd0GqzY43/1cfFGdtcQv37ahbhyBL
         Xz9jiD/E8wFSL/y4JLGCtPaqSixjCq6iPSU61j/2LITAYruZ1VVp/XLXd4E5YgzUC6sl
         xTq6seNQRbQ11v5pM7OUGFA3BeY59HHrlPtn7noFhyTUJufqTKlrYCifJB7gOlPLQGs5
         bI5g==
X-Forwarded-Encrypted: i=1; AJvYcCWN20Mb3BJlp4ed8CS0W68YHYK5EfxNapxolJBU7SvJXsoME0FidPJtYu2Clyv0L/4Ku59qpsf31t79ThpdL1gj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3VrZfKzLxzBL7kt1s6cr5fqB/bx+Q/bqwrttM6DXEAOwkTQ3X
	0YOqCoxEEpUkOr3NG4Y5wXTiiyi1RJ2NfT6645svMrtTFaCS/lzmO5xT
X-Gm-Gg: AY/fxX5Hnk7qb5mZQrKa1mLP0LOuVGhXhwL4my9ZWIWuO2zUtt6P5SusqPP7wwwcJkr
	L+ewIAzCr4XQzRqucynjrI/VlNjzBrDVwrO7eC5rQKns5jXKN3q3rq10qpOHN/jt7yE0z0uDJ2m
	wj+CdkJS2oiJyzpFq3KoS0FOscqdrN+2UqJguCjrp7aOsfvyUPLa5CAnqPd6PqIm7vgS3/ivc5X
	bukp8ld7ne8xFLqGSrt8oqIp27j4IWOYzThRybrRlSCSc2EyoB7T0FFe0pgQq59AkfflbWbFvi5
	GReNu2M2OMXxV9Of/vWnRXYddGFKajHVaXFOXnVTWGTVqy0mgwYGieqBDTS/TjLJYR/9lbABaEP
	LI+kuDRZgaI5sJgmwy7eLu8RapN1LJNOAEJodKdHDDF12mEsSNADKuHJ/mG5A66LXbtSOYDS/Yb
	2VeZCBAqoM9xVAJC7wkXlYpXn4tGI=
X-Google-Smtp-Source: AGHT+IHZZmRW3asJRb9210An7qxf7Xkjkxucu7ix4f5SdvZxomR4Tc4LiJ84wmuvqkSQE+xy2czE/g==
X-Received: by 2002:a05:600c:4ed4:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47d84b40ae5mr218621485e9.26.1768240460268;
        Mon, 12 Jan 2026 09:54:20 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719d057sm134047305e9.16.2026.01.12.09.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:54:19 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 0/2] arm64: dts: ti: k3-am69-aquila: fix SPI hardware CS issue
Date: Mon, 12 Jan 2026 17:53:45 +0000
Message-ID: <20260112175350.79270-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_095425_641524_85BDFCBF 
X-CRM114-Status: UNSURE (   9.15  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Hardware chip select does not work correctly on main_spi0 and main_spi2
controllers on the Aquila AM69 module. Testing revealed main_spi2 loses
CS state during runtime PM suspend, while main_spi0 cannot drive CS HIGH
when bus is idle. This series switches both controllers to use GPIO-based
chip select instead.

Vitor Soares (2):
  arm64: dts: ti: k3-am69-aquila: change main_spi0/2 CS to GPIO mode
  arm64: dts: ti: k3-am69-aquila-clover: change main_spi2 CS0 to GPIO
    mode

 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 3 ++-
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi       | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.52.0


