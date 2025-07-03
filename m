Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E8FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=; b=jodo1AjwmdaAsOBfirReYJkoHD
	igfr92/0X19nCjGhwE2ETZQiV/OkZYH0sXeHI0yfwtQ0M+uF+0el2i0W6WB89RdhEyxmG+x5w35SK
	Tf1kzXvztoXD0Bchs9WGCqHv8N0XLrV1grADJrhtXNZRB+7WVpBRHjJ2f89u0d2Vp0GTH7b4JYlfj
	FbPsyuL7ibXpdDNoQ4GIOz/Sk3HaDBFyAiNECZGwUcC5uun50qmt8jJsfyMJUO+AKSc8pPD4s6Ca5
	Bk+g/9InYQtKr3VNkBbOtAx9FMkSFKkQTgfEY1cN0UqlBFZYzhzvCm+P7dK6SbqEqwnE4x+ViIrW1
	mNFjvrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMsC-0000000C0P2-0ZvI;
	Thu, 03 Jul 2025 16:33:20 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKoR-0000000Bdyo-2dg7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:21:20 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5562838ce68so2164429e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751552477; x=1752157277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=;
        b=LkI3/fkAs7ji/98h2ITcTDktIliIXzONrLKOYuggZ9MCprZu3krZfPvhBJV395kP0B
         IX1feTRzJ9bnwX2z7En43VkxCPBy7q0LmYnD6z7LL/xyRI2MzPgCO9jtXYfJi2Kgvbeh
         weyo8rN7/jT/TP6rBgOTAh3h4aB5M1pIz5qjNBw6CBD50wInuuqudPjsYoHFs/z327RI
         BINlllGhU0HpOEkHyd3Pkr3L9Eb7aV/19qwFLA7pkPKb39MgcafaU91KPVgBC88pBeZR
         7acXBkAwwLzfqaVMST7Pc2XO+dlBryjq2nCV9DVmi8mVgZiOr5hqo68QXfbrfKoWURnO
         iEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552477; x=1752157277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FklnJtDo9yeFD4xiZdN1VsVaoDfKdcDRiLzMHURLjos=;
        b=pl+2wErWUXZcMXJ6P+cQebwXr5L1xbr/kNifQ5sF0PMWVrwGD7SpBaJOGe97gp3ca0
         jh9KWVLQxLZYEq7ffJ/j1eBxPoESYN9gBT02F5BEiJKOC3kkDirlms3Uw/tE/IFybjHV
         llEJD7x7B5ibOjTZFhtaYYCfPweiqlE/cxRHbt2cNrRCj0KytFcLj+uLNTYeAMQ9JPe4
         Ec/eRwXirIAIZ7FxEEAkZPJJJQxL/y2nnNqazA+t9I2brQ99mBdZ8l6VBOElsHf43UAZ
         OblOk3YFAZ4hyR0ofUpJHivHY8leE1wK9aOiHYV26HbJz5QAhV7tbRLEcxTjp18ZeTbO
         pMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXD2ax/+Q72d4muoCAXQjmC82qmfGEWMVwx76m7+ZgBed+21ccvFj9nf6FLg0KucoKlk++5GmV6ZBWmnpZaNt1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc72ouPjykRjL5trrInSDIWEB3n/RPv2vtEtXyaHTU2vcjMh5C
	A7a0i+i3TbH++tfOkFJrf46YU6Vwt6FuEnWOOMgwcmFk3LhTLryDK0aa
X-Gm-Gg: ASbGncsgwu7GzI7O6Iv5SF+K5UpWzejOAwMjNFjIw92loUtVHXqu+SDIWRqsO4BLkTL
	uYv085yr/ld4qWXqF+Ku/PL9v6TrU1FA3/E087pBrqdX78E+pDohmpUnyEXFuL+3DChbGM957oV
	gVTW2rqaVvxSnPrkxXNXyIcaEZfsmmwe5c8Au2PnZFPAo41MnzPkdUxB4ri4OhCR8NZXpPD7jd4
	0YC41paosddxCaWbb0dWhOgQfdMZ2i2QN3D5AckcTt366Qq53fGnu/YiD24hHBWY+fWYbiIjY4U
	YZ0wYj8snr+lCyVzQbpGJ90x4V4NoDXGDE/oTfXwSEafTsVwslurgWFb2vY+LFTnltVFKxY=
X-Google-Smtp-Source: AGHT+IFUX1eZbzcysBzHHtBsEBGjLX6NVKG8N8wt7URL6mkGsrdwM/ImOqWq0Nxkz3QPURabSYjy1A==
X-Received: by 2002:a05:6512:2307:b0:553:2868:6355 with SMTP id 2adb3069b0e04-5562ee3f0d8mr1549077e87.18.1751552476789;
        Thu, 03 Jul 2025 07:21:16 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a861esm2483058e87.97.2025.07.03.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:21:16 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/8] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Thu,  3 Jul 2025 22:20:32 +0800
Message-ID: <20250703142040.2639742-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_072119_667460_5E029680 
X-CRM114-Status: GOOD (  12.23  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Changes:
1) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - added new patch

2) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - changed clock order
 - added additional nvmem cell with calibration data
 - added requirements for new controllers
 - added description

3) thermal/drivers/sun8i: add gpadc clock
 - removed unnecessary call to clk_prepare_enable() since
 devm_clk_get_enabled()includes this

4) thermal/drivers/sun8i: replace devm_reset_control_get to
 - original function replaced with devm_reset_control_get_shared_deasserted()
 - removed some of the repetitive code executed by 
 devm_reset_control_get_shared_deasserted()

5) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added possibility to get calibration data from two independent cells

6) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - removed magic digits
 - changed description of calibration data procedure for A523
 - changed numbers of array elements with calibration data

7) arm64: dts: allwinner: A523: Add SID controller node
 - fix typo (sun50i->sun55i)

8) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - cell with calibration data divided into two
 - added passive trips for gpu
 - added information that information obtained from BSP

v1: https://lore.kernel.org/linux-sunxi/20250411003827.782544-1-iuncuim@gmail.com

Mikhail Kalashnikov (8):
  dt-bindings: nvmem: SID: Add binding for A523 SID controller
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: add gpadc clock
  thermal/drivers/sun8i: replace devm_reset_control_get to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: A523: Add SID controller node
  arm64: dts: allwinner: A523: Add thermal sensors and zones

 .../nvmem/allwinner,sun4i-a10-sid.yaml        |   1 +
 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  49 +++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 162 ++++++++++++
 drivers/thermal/sun8i_thermal.c               | 240 ++++++++++++++----
 4 files changed, 406 insertions(+), 46 deletions(-)

-- 
2.49.0


