Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0F7C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n0F2Pzqq5v5cdo6z+ooVLKEAM4UOF9cFccLrXL8bbvc=; b=MElIn43bBzZS7MugbE0DQ5+207
	OHIlqW0Jf1YnHsCKPXYbOgfOObC/HZravUkiNQdzuoolELuXvRNYOuQHf+DwZz42zXKJgV9NEAujS
	HsgUmB1vtRq9leyN5M8c9qYXLUc1gCVNlFMqyRMqVmNl8+sZhLcHMkIFOA19b/0cf+Bs/zxgeWDRx
	GQOlM8bhmYrED2McEreCU5C/sQrpc7f+H6Fo3IRodi64vtaXXcaKwcHigzDu+KjSYLmh1+bkjQTvg
	+JKlnbS4OIplviC9z5dtlDIhDLBjk+5kyZAgwsDD9nWigcWuXV+PChhPfcA0K6xyDam0QCmH9bSwP
	SZJIYtPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xz-00000003GgT-47mB;
	Mon, 14 Sep 2026 11:35:19 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xp-00000003GWR-3MaY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:35:16 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2157109f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385707; x=1789990507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0F2Pzqq5v5cdo6z+ooVLKEAM4UOF9cFccLrXL8bbvc=;
        b=r9hSGEo821RPNfHpveZCpxSjGRpxiYyGmsslT5CNe7LXFnAFgersklc6+Zw1ZDAJg2
         8wXzV+FmtvVJby7ItSFl3hJ+Hs+NSrQ74euxqje30xetTxsGsBBDdWYON83I38daXRb3
         BonxRoQtB442NMVM3gMVwsl0rN8bSTMFdDFKb3q/TbO4q7AK4XjJRI/GlTyrHXUyRr3g
         Isr/CNtDUt1r73P4mL17Mtxpn0uKxHb3G5jiPpFDZb6K4daP13MWGSrjmolAuI1o4dQq
         FD72+kvg/k9MLAFk2y0MLEW7zsxEtJU4DcaCYZHBBNsoFPRLOliA/SYqKRXZ1AJI5U6J
         7GyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385707; x=1789990507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0F2Pzqq5v5cdo6z+ooVLKEAM4UOF9cFccLrXL8bbvc=;
        b=T2zg0E3s4tL3PRPB5sb5h6g63PLXsSryRLxIJsFjcsEh3PEo5h/UQeFYaxsVc9zsTa
         OCSJJsNYUFtedNFrFJQYfT8q46a09UJCVWZlia1HjEtMHLcKdi+TdHje34JPprAlPMKW
         71bZVo/kX8+4Vig1X3b/rDp435beQkL1zUpfQkp8mARpDPkCqTNfoMGaOdmqYhsB8DJF
         Cmh5t6NvsQq3rWUDEfaqJ1q0Bn599b9XuOQ0igNievd7JwjDo1JFmoK0QK+1/GX47QrN
         ckpA/QwtTlL/qEBG0DGHrV1/sIoyZb/wRsrspvX4X4LqXHRUV8KvmSObbvkdRnXC+D4I
         yPIg==
X-Forwarded-Encrypted: i=1; AKwUvBxmFQFm4eqfDPvDbqHjes9bGBHVp2Awz0SWoDiW5R6pVUqxDs92BXiDadoGzm6vOIGEIBUj2H0UWiyAuxeJsGIG@lists.infradead.org
X-Gm-Message-State: AFuF++mrTyV4zmbLMY9ayXQRsZOT4NspbZl4Zd60zLh5GDNbKGc+/dpR
	o1An/3QyxMm4PV3M0X8PWiSqLQslgeUt962RieRVp1vUl/OaBdrIyCXH
X-Gm-Gg: AYBFou3cfr7L3sMS8EExc1IlSPj08U8dMCYXxf+PvOO4rU0HvYTuez+fQUPJ5Zs2KA6
	sUxT5o8nuqNAZmulrz0nfoMfG3ahKtTbrIVwsV7/wuyEGMukPfYu6R7nNQgm6+ifulZ2MfqsFFd
	wRE7hCGBhtBWW0AgDuVGJ2RQxR7zLiCfXIWKMB+sEjhIelpoiAzqSsXn2C00zo5AjXRECoLz9W+
	SDdQWmYeySBfyQJdhQyBHmS+fdBNstjEkkUbSAflSORDD9WVhE7JyF7eEgIxuvxw4w9Z9xBkW+U
	0B1ikZ6gUTHLsaPnaxUCiYwhfuoaucrj3Xb3N8sPWq4OHOh66wkL+Zr4ODMW2DdDDSbNlygRqLS
	KLTcVzN0m0VEa5+ppTrhB/nsxiFPOt8aHFr2Is5tv7o0kZWSxTeCG4NiKNSKKCABJ8c5ZoMIJ3x
	cv4qG2BMgC6do4lwp30gMRWRQhTfb6FQceM5G6M1Yf9mcdf47GbUYmikvniZw4mv2E7W1v2rXPI
	4hKeUnKTlXwTSZvyWwi5bGfWg==
X-Received: by 2002:a05:600c:548f:b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49e7a67f688mr27341065e9.32.1789385706603;
        Mon, 14 Sep 2026 04:35:06 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm27906531f8f.37.2026.09.14.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:35:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] Introduce basic support for MR-NAVQ95
Date: Mon, 14 Sep 2026 04:30:08 -0700
Message-ID: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043509_872732_0D341FE5 
X-CRM114-Status: GOOD (  18.41  )
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

Changes in v5:

* changed "up to 16GB of LPDDR5 memory" to "16GB of LPDDR5 memory". At the moment,
the board comes with 16GB LPDDR5 memory with no other options available.

* set sdtout-path to "serial0:115200n8" as suggested by Ahmad.

* the size of the memory node was left unchanged since there were no preferences
stated in this regard. The bootloader will set the actual size.

* link to v4: https://lore.kernel.org/imx/20260909153943.1048-1-laurentiumihalcea111@gmail.com/

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


