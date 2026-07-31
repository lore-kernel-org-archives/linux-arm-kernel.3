Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A28C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B01D71Y0rA5zgk1TYOrIFEwTDt7QQ32kG9Mc4Wkc7Jw=; b=cGmPYrjjzYSj16
	n05CpUJSnuujOAAwz04kPjKLGnJYGaZo8D6amKL9xucMjU5EgYu4huEEAWMo/y9EDsNs9xuPPXL1b
	U2byTgMXMtOFQ9gF/XFc8g90IvCiPFc7G9qWlcoEB9b3otdwJ4qi8gdSpfJ++/8yqmmPTrp2TSNyu
	QYOGrC5hfLHvSyKauzb3RfZdohsfVq5GB2iCTjZG1iT00EFmuFgeCaOY1zKYMcyXJktKKpqCePA0c
	7pfFu+2IG5gXQb0Dwh2RSk2yS9jaFpikByaKggMbT6VvsyqIlcL/UzT66NFerYHXARKJz2B3Wgo7j
	bg6nUsyqnXvd5RPbzu8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq8P-0000000D8Iy-121L;
	Fri, 31 Jul 2026 16:30:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq8F-0000000D8Fi-3bSj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:30:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1509692f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785515446; x=1786120246; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B01D71Y0rA5zgk1TYOrIFEwTDt7QQ32kG9Mc4Wkc7Jw=;
        b=KOP8qwE5+i8VKs4pipR5Yt53vDs6JYo3oeMWdEVEVYRF8nkBbqgSl9Fx+si/0Ve7+I
         no8PN57DHLzTF+8XOsNY0zi8GZi3CxuUrvVeNx7tBRwn9tTGdFkw2Ex2y+Yg3c+7Tb92
         iM4rIG91No7kGRI+nRdamCludB/Op8N3V9gLgSbn6yyqfeOc70G7W/9bLVM/mWgYCaOF
         WR7FYEMgESRg4UIJ2SwJ8YA34OsAaBIpbKtkYYglFJxtpEiEGQeInJKLI2hNcems3sss
         K6pvr4sxs62+qzDtOiQzAtMBCfJHnB5xarx71Ua3Dl2Sc5yEr3RkLwjbKqPoWJDhseWu
         hVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515446; x=1786120246;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B01D71Y0rA5zgk1TYOrIFEwTDt7QQ32kG9Mc4Wkc7Jw=;
        b=Va6d2BZBkmLMsVeMPAO9RjGazwqPoyUgaR4UdzUov9zM/EmiEvvWkCh2f5TrwxPZmk
         NcMEhenvXSeT6SY5ukbr79Hbg+RDj8DNZcd5VtyDGmopqWN8CM1ljyFB6ffDykzvSnEj
         iuim/sx2T5VCNWCli/3l2cOO3Uz5ty7e5yn9M/vnF2CZwWAuL8ODoNjWm1MiP8x8OOHk
         r9+ll7gclil6OH3pf02b3869Jth8ooTWy5yIgLtf81z6uVWPAi8hE+nu/tGbZbF5ANwE
         5bwGv4orXFwWAk/8NIwb9AjbWxy3iWxEJ5mL8w3fIPm6VDyUAxmfjzmYL5DgEmOimKmw
         C/HA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6lQAesvuvzPXEEmX4VRrqZyvCmP1CrdiOSM916+0VX0cR1ftVPXqIVBjLuOoFWW6iTtklRoXBzGLQLBthKH/G@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8RV1vVZPK7s3HESMyC9PduQuwKmt5SnEZ1JxUh9eZjdOwRLHy
	uAhatBr07DJPbP92SREBDrovtrNpLrAU6+xCam64NAbTdHer5fhcwjfbQSPZsvOHQvI=
X-Gm-Gg: AR+sD1026wS5hy9/1Yme4wS/cl1LJX2LllYFUkOJ7ifJ8TEF2CQyf+IWHsNrjZt0HgT
	QQom5yhbeH1yiI65VeNsdzt3zx+i+nDImefGmbzffwictmkhOI0l0e9vhTdtNwrxXMZPucM6wG0
	6F7dTKwqa3/iZK5TgfWwb1bZZmng2nrZEqGfSNs1ZLggv4ytbrX2y2VAteTlS7q0YF09YruwsEl
	C/pi08p7Aj5fDzqzFhmSGD/S46OpA7GiTu6K82+9HGB0bwOqhTJnVn2lqZ0LTM07DdSfRSpG752
	36E2LqY2LvdT5w/8uZnV/3MLl9epBfbeScoIb1SMMiXqGHgi8+vWEpUZj/MOT5bOj2emi0UuzV3
	Wu+nGUYoSO+NQ61ZnjdGJRJX3D2PGkwY71ss+pgLkeHnjY8cwL07aIdFUUd/4T4MGveCSnluDN+
	Wo7S5LtYjVv1gDkn6RiSigvzpH+5p8mmzuOI2eKPCyrYmh6VZDudZvbYCo4A==
X-Received: by 2002:a05:6000:615:b0:47f:762f:32a9 with SMTP id ffacd0b85a97d-47fd72a8f3fmr672008f8f.12.1785515445887;
        Fri, 31 Jul 2026 09:30:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd456262bsm5900050f8f.17.2026.07.31.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:30:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH RFC/RFT 0/2] net: stmmac: Add support for Allwinner A733
 GMAC210
Date: Fri, 31 Jul 2026 18:30:25 +0200
Message-Id: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHNbGoC/yXMzwqCQBCA8VeROTe0f0iha+ADiLfosK6TTdi67
 GgF4ru31fHjg98KQolJ4FiskOjJwlPIoXcF+JsLAyH3ucEoU6rKanTj+OIQKKGrrMXh4TzKEuO
 UZtSl7XrSyuuDgSzERFd+//QzNPVp39QtXP5Dlu5Ofv7asG0fT1HmGogAAAA=
X-Change-ID: 20260731-allwinner-a733-gmac-support-163bde10c152
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=w35lwaZM5Jhv5tWlfxuQgAkqn1ey5k+A/02M2sV6IqQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbM2wWoLP6AQ9cI4VA8q5m/5+1cKrwSXpM2W6M
 e/cJohJsgKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzNsAAKCRDm/A8cN/La
 hVL6D/4331XwVduIAIJWF+PeOpvRZZDsSD9BtI2hgcNm6X2vDunqVGtocqmr56Jkh2ndnuyheam
 AFy0FMb5r1OfNFGb4MM4mA06458dALYQ1wwTE2cJm2MfDm84tsnEs8wZE6Q+4FJfOalOsTvRJeA
 FnZq8tRRhMa8DwM+lqd8jiRwOrOWoEXqZWh/6GAufDFGT3Kdwsff+h7hBT6D2SYixP9xdOHjaMz
 hEBBm20A+US5YRsSqVpNiplu5yQcPU1yjOoSIead3uK7OW7L/fcfkYraoH+R/8OTrneEMY8l4si
 TobSWyrQJYZU2N9pASoqLqHs0YECoOJ64Ip6U2LAv0t5PzG96h9tVr0bpSUfBcaf39VwIKfA3ys
 dD2ewdOB80Uz4FmanIWRFHcQRlbLFxvcy/4DQzDjIShGbrbo5p5Wrztv0vf2phHY7lDlUtTTLwA
 Tz5u/7zqA0l3ElKWPlugOpTWx3lOmcOcuSY1kKb//Yn5oiv4omwKcMN5PYQZhy6gygtDowA0uVT
 dAcbNSws2YqesuL60imTCz0PgGcWrz3yQV717FFKg7rSdBodLwXwA9D5M0pvaccOmz+SQgzxAMg
 E+7rQnDLEnEiSIGlV+warlyT649gI9lDTHgmDPStcy0IR8EawQlVN+SMzvFSm9XG9AKMlsVxJ24
 Q1BqcpuHSlezGCQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_093047_928926_069B9E31 
X-CRM114-Status: GOOD (  13.19  )
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

The A733 GMAC210 is a DesignWare MAC 5.20 with an Allwinner glue close to
the A523 GMAC200 already supported by dwmac-sun55i, but with a few
significant differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register.
 * That region is inside the controller reset domain, so the reset must be
   released before the configuration is written, and must not be asserted
   again afterwards or the configuration is lost.
 * The DMA channels have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * The controllers do not require a power domain (AFAIK).
 * The TX clock delay value is 5 bits wide instead of 3, split over 2
   register fields.

The DT changes for the A733 and the Cubie A7A board are not part of this
series and will be sent separately through the sunxi tree.

Tested on a Cubie A7A, RGMII with an external PHY on GMAC0.

Full disclosure: at the moment there is a problem with EEE/LPI while
testing on the Cubie A7A. If the device stays in LPI mode long enough, the
link sometimes (but not always) goes down, coming back up when the device
exits LPI mode.

I'm currently working around the problem by adding the following
properties to the PHY node:

	eee-broken-100tx;
	eee-broken-1000t;

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      dt-bindings: net: sun8i-emac: Add A733 GMAC210 compatible
      net: stmmac: Add support for Allwinner A733 GMAC210

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 130 +++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 145 ++++++++++++++++++---
 2 files changed, 242 insertions(+), 33 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260731-allwinner-a733-gmac-support-163bde10c152

Best regards,
--  
Jerome


