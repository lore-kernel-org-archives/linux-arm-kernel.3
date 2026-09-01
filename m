Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6383C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HRWe/Fv+Rz84H3JecE5KlcPaNAMK2QWGmxyAItSFjmY=; b=0M3QKmx4ks7Ri06h3WCUPptRI6
	3K9Aeq/C++kFoEdFFAGjlI8A7Q3DBALkyCL/oDoD89jxTpEKkWsOh3QbPuBkhs1BIcgTpSfpLCoyL
	yDnJDZVWNt1NP6z/lPWePDUDbyIeB0X++qf7QQjAOEv8wH0+ewhWmb6pnsMc9U0wDxIcuZZYadM8W
	BlGUF3tU+WzPsIm9b8dTmjEq0JXfzC8xJpzGHj7v9Ez52RJbKo/mU39DW5Zqc0J9QHfMfbmg5jg7N
	3meZ1jZQcZZsY2938s2k1H1yb0IGVnY0kmDHh7AvXkSrWRLOJJi256XoEQTxHCmGET+FbxmldF9EJ
	FTOoaUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OPX-0000000CCVR-34Ko;
	Tue, 01 Sep 2026 13:20:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OPV-0000000CCTU-14DY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:20:22 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c2533d83e3bso772231066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268818; x=1788873618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRWe/Fv+Rz84H3JecE5KlcPaNAMK2QWGmxyAItSFjmY=;
        b=q9s4+c1uNM9+XMXHapGlnDlzGYca45q/okX80z8rRB5wzAMHCjWcwgpW/RW75viJVI
         o4hWfeC6yFEKLoCWVD6vAqj/5WWgO6vULCFs5btqMMk8i463CLEY8LqXOyxAquBqAsmv
         8dKkISmZFURX/Wnjk5MFyC02oLm2yo8tBSj2+8UsFOXrTRezF7SjCBQ+7T5O1NNREX3M
         WCCNRGHUOmHYeKM4/58Wgb6JdqW8/LaoepjiaEU0UcMBPk1bQRASntnpqi0iHeOFPPq9
         NZTedAIw3LPilGlmopmYw1dvuBrzgVoPCEKatBZVd3lzqS14GRY2NVpDkBS/5c/+NG7w
         rYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268818; x=1788873618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRWe/Fv+Rz84H3JecE5KlcPaNAMK2QWGmxyAItSFjmY=;
        b=XNANqLv5gpZsLYgpdTaGmEihY1XItJbd86DuBzbkMpZnfrLwhFwHO1077NoGO0BLp3
         2FoaTyk49YQH93GydufqSwaNEdsM8KJs7hoyTu3jUBlYe7XJMOyqnVYEQvP/ImwRCfYB
         5DaUfpgb1/AFEzG8pBPtb0ZPiSFgDQZQKFEIJr/NX0J5BQnb6nGYI27qUxVaJ7EdEaCf
         DS+4Cxht5xoLeyuYslXfMwku9rs5VL7IDX2d3tQcbDtU2eUSwFBi6yZnICj55KlmlQw3
         YKh8WHoO/UNJBc+Wrsd9UO0IJOBB625RUvw+Uy7rmqzv2EPIrZJbA/nz8ITazmunkeSu
         e38Q==
X-Forwarded-Encrypted: i=1; AHgh+RoaQJcTBLe0dE1Hg6lmY9k7mr0c5LK9m0WnVmKpZd+ngXBgeBngY+9BSqA5Oq7zsqAIbpp54vQumepeRTc5RioS@lists.infradead.org
X-Gm-Message-State: AFuF++nj2thedMb3bDVo1Zf53OWzpMHWgz/J5fW7Zw+TvFshSPvNyMyz
	T7CzXilJALVwT/zYvWhJKGd82y8kQH2klPPPXCcNoeFxWcXYRdAeKO1i
X-Gm-Gg: AR+sD13EgE9DTn7rHaW6ahNSx+mf6IeG4+5foA2oPiliR9y42HBZrQc7yFzAQO476Ch
	QmQSVQxOq9mPK3kvYQ1hjftZwJ90439OyVn5QRGZyeQ5oK5EaT7UrkO+yciAHer67JsuCmgLCeV
	DC2OeOCPjjzwRQXuoEoX274fje/mRyV6VrSa4ncUW90MV37QlCQwbUEZOh2Fr8e3UBhGiDBqkak
	De54zxalJoacpOTiwgTaHHfx2lqLqDWbG8+OzE95cLnfMlp54ZQB7mUdjvPs7YmmpAfB6y8/kCN
	v/8tZjVVFHHJuIe6/WWvN1kTi/nCPp+KTbj32bSNC6WWJcSxkUh+r8OGj1gvdS7H7i3XplH7+3Q
	0TYSFVaNNbF/vAIzEPikwrkEANjPWJgXWbyerAhqPu+oEFM821w4xvXKe+mEM1a7yndcGvn8RT7
	t9lvyB9za04wvZaFbYL2Ag8oVHFB3O+4G4CmGPVFPj4P1ZpfiwXcX0jM0m01f22JHTYW46KhTaV
	r91N9wHQjlH9d0=
X-Received: by 2002:a17:907:c78a:b0:c21:752f:c3f7 with SMTP id a640c23a62f3a-c25b3d1f286mr658562766b.18.1788268817805;
        Tue, 01 Sep 2026 06:20:17 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25618430fasm580304366b.22.2026.09.01.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:20:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] Introduce basic support for MR-NAVQ95
Date: Tue,  1 Sep 2026 06:19:16 -0700
Message-ID: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_062021_309162_36F5E6D7 
X-CRM114-Status: GOOD (  17.42  )
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
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 222 ++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0


