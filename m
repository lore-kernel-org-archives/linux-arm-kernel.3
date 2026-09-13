Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E142C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RLxxag6YaoEYXvuMdxlM7z9b6lVW4mPCbnkS4JP7U90=; b=0FbFroo/xBdnhxP1AAXe/hzA1G
	b73QNLpidI+3B4L+YLYrjngqDC/U1crF5yN4jNx9GBz2tqWfalHbu0wd4TSuDjNjKvKs+2y40Buft
	/ckP9I3v8UOH+ABxNKPe/ydfO5S5+81ndewjGi+5jGph7RNLswdRJ7JMRTNVfB/SbF+iy8fz6j1ZH
	7Wh4E1j2mM12RZcZwkPbuDCZfGHXZbhAj33/VWeo5+m5vctypVzQhpH4+eQ4c4+PngqqYvxwYXV50
	1RmwZ5s10WVuRDiG5nMW9GeOn6MrAKtEUOAZNsFOC4U5pFAQUTHaqO0xwyeUvXyA47jh4BXnoS5ZW
	7xtb037w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lcc-00000001jjN-0Nna;
	Sun, 13 Sep 2026 14:55:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lcY-00000001jip-3NSe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:55:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-869ac301739so1978189b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311353; x=1789916153; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLxxag6YaoEYXvuMdxlM7z9b6lVW4mPCbnkS4JP7U90=;
        b=eFL/aD5f3br89UNFhmI+7fn5rMk8YU6iuG/sjzYKBF+/SqakFxBh+R9zXPO7066vC6
         +yWXGkgZQW3XEDO9ON53W0D36AE8feyMTrRrigqEpgge+YsBKXbqqvGJTPRVxMP+ccb9
         mDGCa4F+Znvdha2Hq7RALVNv8euAor+41tM+fhyhtlcr9s1OR76sDCiyzkVMHHlOyj7Z
         MlxgWPAWnnP/w8A0aRry3kEsho8gA//CDy4m4xPvSt66L90uCEIBCtjK2t0/fRxVGiab
         ZuyueZERGYT1mM1GYpGw628x1CFybE+7333ZsvGwNwZmb7xkOwLra0UPaFaYf4cxuB8l
         WxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311353; x=1789916153;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLxxag6YaoEYXvuMdxlM7z9b6lVW4mPCbnkS4JP7U90=;
        b=XoEqaSLwLw+rLwi3KvYRhvw+S9vDm6wFPReFMCn60413l0mWCDsofNhvRJYOOpikIo
         PH5QILHBBtuPO8/3ClID4BsNQTpyUv/A+p0+fRRPZVUixTmbCTzW664g+A13Mika6JzR
         R96Jl89+VHxe9axH9yztmR1V89/oAeEv2hrZmWNA03X2jalE+c/xec3+k85bSaG4JOkr
         1N9kFuMvZSCWlTdpKD1gUTp+DZg+1fwngEXgsxHsIrDUfwxlnXo0/CKLZqFQHMobav4m
         2ZoeEjsH7bZMTlvCpa9Oi27peSGH0uVQDZa2ENA1csCVTQe04yn14R9eFR5eDf9ppGEX
         FR8Q==
X-Forwarded-Encrypted: i=1; AKwUvBylpVZ9r1wBUUWCVca5hRWA2EbCygSlvhfw5YmoBvw6jSvqUtj1TbKyxPX6HbeXrZa4YET+zkMmFQvmdic40ZG6@lists.infradead.org
X-Gm-Message-State: AFuF++kcQZf3ZQLsPgZvyUC7B/7YQP3cclRBuJ1d5h70G/EDcSb6I2C5
	lI0/RTch0ZKCZygQcPLZOnVzcqBKjRpXD8Gh3jzXs4UxlHkVhbcHAnnR
X-Gm-Gg: AYBFou2kvlM0xWCWb9KGq29W4CugZ4XOKZe5Zh0ZufAP4xDjPDVFgZZ6SbFV9Mg70Zb
	7XV6hS9j3/ZyqHdYdU193b68pecOkhHddWH02ird0v8BlylZdssVEXnx0yY3MPV6uJeBU7FxsV6
	3i8lsTMKGyRfThslaSG4zOXpIiXLzz4+KMOJQ198mY3j3DddpaBMzrow4uJBcwfjaDQqy4BZ/3F
	aG9fJiuHng+9nGxmK2qRj+OktX2mYwaXMbV3x3/++0F/a5b144ZZLgH+GqjRpSxtfIQhC7vxG8E
	vNCOE6xXfMexvPL1AYOiisBjEE+qtNRWOguNFH2Bm84lT6YaO15OONdBvpNIJ9ab+sJWPPiRjka
	ZtBWF0o6/Mf2zQmQtkF49aw/CLQEYhkluTrOd8OIEKNCbIp6VLiueVN4ZB5B4I/ORMhb4mGddn6
	R9clbbnGEQ8X2RZSkPcTHtPPrf7QLWybBocbp1IOMro3lwymjwU9MBUvj3dg4MyRsM
X-Received: by 2002:a05:6a21:6f88:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3daed33102emr23944156637.13.1789311353349;
        Sun, 13 Sep 2026 07:55:53 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:55:52 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 0/5] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Sun, 13 Sep 2026 22:55:22 +0800
Message-ID: <20260913145527.18148-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075554_862689_5A5E032C 
X-CRM114-Status: GOOD (  17.74  )
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

Based on 7.3-rc2.

Changes v6~v5:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - removed the redundant clocks constraint for the A523 controllers
 - simplified the else branch to maxItems: 1
 - dropped the extra example node

2) thermal/drivers/sun8i: replace devm_reset_control_get to...
 - no changes

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - skip calibration instead of passing a NULL pointer to the calibration
   callback when no calibration cell is found

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - THS1 has four sensors; added the ths1_3 (NPU) calibration data
 - renamed the scale/offset constants to match the BSP naming
 - check caldata[1] instead of caldata[0] for the factory temperature
 - use SCALE_BELOW as the calibration divisor, as in the BSP
 - documented that the BSP CAL_COM(5000) is applied through ft_deviation
 - updated the commit description

5) arm64: dts: allwinner: sun55i: add thermal sensors
 - put nvmem-cell-names on a single line
 - dropped unused trip labels, kept the ones referenced by the cooling maps
 - renamed the "gpu-trips" container to "trips"
 - added the npu-thermal zone for the fourth THS1 sensor

Changes v5~v4:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added empty line between what and context
 - clarified description
 - added missing period

2) thermal/drivers/sun8i: replace devm_reset_control_get to...
 - updated Reviewed-by tag

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - removed dead IS_ERR(caldata) check
 - replaced NULL/IS_ERR check with IS_ERR_OR_NULL()

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - clarified description
 - added Reviewed-by tag

5) arm64: dts: allwinner: sun55i: add thermal sensors
 - fixed patch subject prefix
 - clarified description
 - sorted thermal-sensor nodes by base address
 - added empty lines between trip nodes (DT coding style)

v4 https://lore.kernel.org/linux-sunxi/20260504050245.646078-1-iuncuim@gmail.com/
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
  thermal/drivers/sun8i: replace devm_reset_control_get to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: sun55i: add thermal sensors

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  34 ++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 172 +++++++++++++
 drivers/thermal/sun8i_thermal.c               | 242 +++++++++++++++---
 3 files changed, 403 insertions(+), 45 deletions(-)

-- 
2.55.0


