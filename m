Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1AECD3423
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 05:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x8oi2Y54Hi+TOCHwR4zL5LgXe3sseiIfUSaKMjLYxQ0=; b=CuYyq1snGjNYqiycOUH3/P/lw+
	NkZDMkfoEtsXF4vRPiKA9BaPSBlrX/bgLzC0sF1Z3S6zPt5QXAU5vRfvHQRWeqicsKGq+53vD6Rph
	m8W9o1eQ6vFUzksPJ60q806M6YkdJqYmafCDfLz3yXjDLbmgtnnME/xqq1nXGqL30z7LUORvHD85T
	5dN977E/BzWRTqJurWukeh+yTPGbDQrExsGtS+YgSm8KD/k54v7hYCPr6xDdESc+5ePessj1x9bga
	uy78rBGPumGtXc2iomHjtl45KoFArTwzIMh7m/0CMCf89WcT20qYyin/IFCAMmDlYzhGumfZMKmzb
	7GedxVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJlSd-0000000CNGW-41nG;
	Mon, 04 May 2026 05:03:16 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJlSb-0000000CNG3-1aeb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 05:03:14 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3654ebfd57cso273852a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 22:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777870991; x=1778475791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8oi2Y54Hi+TOCHwR4zL5LgXe3sseiIfUSaKMjLYxQ0=;
        b=qlomYVt5PC1+97rNRTyr6RhsvrvNIakAoBkSwjTc0beieUQ9ZatcyPdmopUCUw+4w3
         R37x8v71NIYf0jvgERtOTEH6BeZ0q2w0kRou5SBdqG9VlRcOrJwStdqxLkKMdpCXGaaX
         EftYME6CfmZncmc6TXqK1rMGL/oysBR6U18C4GCmzyLRD6cvAq0rx8D2hUXapIYktKJ5
         Rw5bYue3kmDgAStRc7lhNVevP79a1WQ1UZQn4wndRYpXlxpXJ4V89IQ5ZwFqSIxZxrbD
         F6ZD5jNFofHDcuAIMQgBCIz94kqAvUfRlHAIpjzEE66t6t/XvgjrD6latP/p22EjmJm0
         1tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777870991; x=1778475791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8oi2Y54Hi+TOCHwR4zL5LgXe3sseiIfUSaKMjLYxQ0=;
        b=hAy79N+bitI83WJJ68odigwzJHh/QtL2RPKGIIykM7QNWqXC+qQ5arLcI+EnAT29ZQ
         qUd5TtRClJpyim1ECCYPyfvCmFMulqEbIPTm7nhu4we2ImwxR+cjsKTwW6TWGRQYwJHN
         0JPT+armi8kuUWQVHjt0cPLSrYOxUmXfqHHtuEAy4PgovNSYs8qtnmqeUgMqtWndrMMH
         fqy4pOf0TtA9ldDAo9iHW6kdtTWVCjYIx3XPugL9y/BujICi+1Wciqik+QVgQ1lpAXd9
         L6muo71JZ4gR0v1zaszklt+gBG6AlHVMIjH+93IgInYzObe03mS+QrV83qEO9F0sg9Me
         Ireg==
X-Forwarded-Encrypted: i=1; AFNElJ825CuPWR0UUGDO+NvV3FRg5MyJwpRNP8OKPVfwt/9k7hHfehh7Yw2ADNZTrqXK0oIdAWaCPVEE8zw6R0dSa9B/@lists.infradead.org
X-Gm-Message-State: AOJu0YzUKttgNNKj+yGUGKDtC4DU8y0oujY4/TNVUWLBUV/9mK8fLn6K
	xAcVJlThlHZUwQbk14FH2n8Hbe4xnIb4zWkQbhWWwrahgF8C+x0fmgSd
X-Gm-Gg: AeBDieu4EsTlNAsiCfAZPj/eHFoNhl3LbyArwrPLe8QM57oluZWCxnLztY5dGB9wm1G
	o6iytWuh4hWn3tjLfSB85dygyZmuvuMXnmUYGf0ta9BQQTX2CZcs7FpGRMXiV1sQdu+dKLs/hVl
	mMg9whKursaQgGTs9uITmGroPlACEUAoPleW7KJiAgiyAjS73+HbV181bAnqEMaTX+99sTFYS0r
	AZbyhk7iF2Xd0+EJ6oBS+/Tc9mZC8qex4RKapV/9mXyifkJfvExhtseNOUtkUVBxHC7ccGrtOZX
	xW7M4E/oVxX83rqMTL/kbM1pSmflpMwGuOtPBV+V2rTYBEJnSTHNpChEy9v0OajFSr5YEieYlcn
	vdEiJrainR0aGi0od+nN7fJb8WE82VmQWz4mwbWk2MlPWLwZQTwB5O60Csvzxe6cqbP5MV1EjkP
	UD4Q==
X-Received: by 2002:a17:90b:35cf:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-3650cec0ce2mr8747896a91.20.1777870991576;
        Sun, 03 May 2026 22:03:11 -0700 (PDT)
Received: from archlinux ([2605:e440:15::152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365437b50b0sm2662908a91.0.2026.05.03.22.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 22:03:11 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Mon,  4 May 2026 13:02:40 +0800
Message-ID: <20260504050245.646078-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_220313_483944_7335392F 
X-CRM114-Status: GOOD (  12.90  )
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

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Based on 7.1-rc1.

Changes v4~v3:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - gpadc replaced to mod clock

x) thermal/drivers/sun8i: add gpadc clock
 - removed

2) thermal/drivers/sun8i: replace devm_reset_control_get to
 - no functional changes

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - no functional changes

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - gpadc replaced to mod clock

5) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - gpadc replaced to mod clock

v3 https://lore.kernel.org/linux-sunxi/20251025043129.160454-1-iuncuim@gmail.com
Changes v3~v2:
x) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - previously accepted, therefore removed from this version

1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added changes as requested by Rob

2) thermal/drivers/sun8i: add gpadc clock
 - removed undescribed changes spaces to tabs

3) thermal/drivers/sun8i: replace devm_reset_control_get to
 - changed the commit description to the version suggested by wens
 - added reviewed-by tag

4) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added spaces in the description block before "*"

5) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - added alignment of functions in compliance with open parenthesis

x) arm64: dts: allwinner: A523: Add SID controller node
 - previously accepted, therefore removed from this version

6) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - no functional changes

Changes v2~v1:
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

Mikhail Kalashnikov (5):
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: replace devm_reset_control_get  to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  Allwinner: A523: add support for A523 THS0/1 controllers

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  54 ++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 154 ++++++++++++
 drivers/thermal/sun8i_thermal.c               | 226 ++++++++++++++----
 3 files changed, 391 insertions(+), 43 deletions(-)

-- 
2.54.0


