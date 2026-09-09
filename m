Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377F4C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8S9AI7MuVos4oGOaFeo64Xw5+h+A/2gGgWVTyAi5z6M=; b=vS58yT7+G7V6XTKd/ifDjXBwwu
	nrPBypsBnA2ja77JpxcDqDCikKNpaJoLpzgTJdwkeXNuLDGEK7jVKaHV3fEKrUbTc5L5SKLRieoaX
	xAbQ5vQKkbV2ELuwu/SjH0oXhlj9ukDL2G0tibt78QFMe6+B2q6H7oRj79WNB6f6AvuGTjd0/8HrP
	LyBRCvqQ9k9lEjmPkoGZKNFAWchAYbcbzKYoeiw7ZhNOJjF3x32YNHH8tXcKNJm/otNU7BMPQHuk9
	exMwz78gYWVOAGIupqiAccROW4l6VR2s1GOtIBucn5WgV9yJuTkw5tVuZX+Km62VAdIFSdwAnF3x+
	Y2/PUExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KPv-0000000CCW7-0D1r;
	Wed, 09 Sep 2026 15:40:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KPs-0000000CCUt-3FfY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:40:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-482ea739de2so4157823f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968450; x=1789573250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8S9AI7MuVos4oGOaFeo64Xw5+h+A/2gGgWVTyAi5z6M=;
        b=SsY/Q4nEPaFMUyIVQmzlj31bcli3xlAE4n+7gXbpjYVE5uOWBTfaQSZ3fRSnZfIr6J
         zXrFQw4/3cXVgJ7/NcM7R/9PUG09i7GEh04jAOcsXapQitbiQ2pm889io8QcDLva+IRn
         hAru+qtOFMj2CaWXeEL+y5Qeo/0bI35hQgMw0L2u7EIozZruN+1ZM1mSiFAEgw97Xzbr
         b+yPnPxcgjdCnJC9CbyKKcUb8R9PVmE4yP0YigRf+GH38UR82u+jGIGvEVzv1A1smIos
         /PduiJdVVI8abtxYBA76e4pmJtfVSyD8Sd7vYeEAu9IDAExWiXqCJeJ5ArtCxxw+AoWO
         c2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968450; x=1789573250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S9AI7MuVos4oGOaFeo64Xw5+h+A/2gGgWVTyAi5z6M=;
        b=nS0VKTa0YmOJMziVqp8anN3uCqFg9jcuYSdZPuFQp0f6Py6g+Kk2+WQobygWu8fyLk
         249CB6xLgKYPFTWa84BajLfRM3t9USgZX5FPFQODUQPu/uv8N0n3/fjuidK5AeC69xmR
         UA9tVsizxg2Ev4jXQPbYyk5gLjWHIb3VMHIW1Zm9gDp2YtiuHaYntBmW/4YL5muYOaGW
         9fBhk5EnAwkVbGkklsoG8wdkxMo9ClFyVm1HE/QgJDm1funbAKucKM0BKbF6H/viMKzb
         pi+BDSLpO4iUudDJc+POUK1sO5z+EMlpu6KPUMYtWmON3Yk5HGpJCY5HwgKRatlLpn0C
         mrdg==
X-Forwarded-Encrypted: i=1; AKwUvByruAE/JmEev0tr2sPrLz0Z056QXE8hH2x6n33k92slXUfm3NPzyh4PUmUrwPbr2TJs6DDad7Te9tAm5KcmkirC@lists.infradead.org
X-Gm-Message-State: AFuF++nVZfLL76DQjfnAy+lL74JhiDuFjr14yjD75nyDWsZsTCmo5Kpd
	HodqlGbiiZiKgFfTkGAfU1IpQZoJrK1xHHYojZJ5CeEdpgBU/fY/QTlO
X-Gm-Gg: AYBFou2hw3LAibDrR27Oq1u72Ckh4it9Tbgmu8Dyqd7E9JwfG1AHOTLvXCp69AfZDJw
	lt6iHwRvn3E2jR+17QWlISmTX1mMofV3j2CWiMGVqEcr0fU5HnZRygfJ4ekKmSg4PnyfPiORH29
	FcWGxx9XCAnSXf8NB4NvzVTI9gu4wUBvzdfnfFZnKhi3FE6iNZzuwraL8WR7L0Rdw6ZBo8i7Uph
	ZefeR/E/IM5ulTy9s0KFatrMvBQpyRL6WjU1WwyTMssq5g7fd5Zpf68yZ4sC2duqddAiMn8au96
	3feb7lvYd9kkimkGootFjFapB40smrLwmuACmGNBSf4J9tt2rTEKXPJ+zr6hyrp/7UT7URZ4P/H
	eVcIWm5GNOy78pEr+rDdRchxu37YbE1siWDKm+oIMxU7lpHxaNcxviO63pCnimkvjBu98YiD+ds
	qGOJK/kNuwXvy5K8KspYSG8/TtNUNkFD3a21An0WFQNatO5YeQR8zMSV++m8KXS7thfMnJnsNRp
	oLlFvGS0FnpYe6NjwUAr0pviw==
X-Received: by 2002:a05:6000:2602:b0:485:8c16:a34a with SMTP id ffacd0b85a97d-4858c16a7ffmr34924854f8f.34.1788968449996;
        Wed, 09 Sep 2026 08:40:49 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm43810943f8f.32.2026.09.09.08.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:40:49 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	consmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/2] Introduce basic support for MR-NAVQ95
Date: Wed,  9 Sep 2026 08:39:41 -0700
Message-ID: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_084052_830370_CC8446B5 
X-CRM114-Status: GOOD (  16.80  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

So, as the title says, this series attempts to introduce basic support for
NXP's MR-NAVQ95 board. The "basic support" refers to introducing a new DTS
and enabling a couple of peripherals so that the board'll be able to boot
from eMMC/SD/NFS.

So, compared to MX95-19x19-EVK, this board has a smaller form factor
(comparable to the MX95-based FRDM boards) and is designed for
robotics-related applications (e.g. drones, rovers, humanoids, etc...).
The board is currently at revision B and is only available internally.
The board should be officially announced around October/November 2026.

Given that the board and its support are fairly new and still under
development, I would expect some (hopefully) small changes to the DTS.
Hopefully, this'll be acceptable.

The schematics, a brief overview and some pictures of the board are
publicly available at [1].

[1]: https://github.com/NXP-Robotics/MR-NAVQ95

---

Changes in v4:

* added missing "memory" node.

* link to v3: https://lore.kernel.org/imx/20260901131918.1189-1-laurentiumihalcea111@gmail.com

Changes in v3:

* use "gpios" instead of the deprecated "gpio" for the "regulator-usdhc2"
node.

* fix issues raised by running "dt-check-style --mode strict". Note that
"dt-check-style" still reports the following issues:

[property-order] property 'compatible' out of canonical order [...]
[line-length] line exceeds 80 columns [...]

these'll be fixed by Krzysztof Kozlowski's on-going patches: [3]. Manually
applied his patches and dt-check-style seems happy with the DTS.

* link to v2: https://lore.kernel.org/imx/20260827150657.1657-1-laurentiumihalcea111@gmail.com/

[3]: https://lore.kernel.org/lkml/20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com/

Changes in v2:

* remove the "pinctrl_usdhc2_100mhz", "pinctrl_usdhc2_200mhz", and
"pinctrl_usdhc1_100mhz" DT nodes as they have the same configuration
as "pinctrl_usdhc2" and "pinctrl_usdhc1", respectively.

* add "bootph-pre-ram" property to all nodes that were included in Elena's
u-boot patches. See [2]. Note that "imx95-u-boot.dtsi" is still required
for the binman node and for the rest of the nodes tagged with
"bootph-pre-ram".

* link to v1: https://lore.kernel.org/imx/20260825120812.2152-1-laurentiumihalcea111@gmail.com/

[2]: https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629002.html

---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add MR-NAVQ95 board
  arm64: dts: freescale: add MR-NAVQ95 basic board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 228 ++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0


