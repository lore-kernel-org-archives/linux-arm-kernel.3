Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2AEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4TYHjDbbP6M0n9F6tX9dbKAlLVBmbBYfjjSGS7CObkc=; b=jrOvGZx4lh9kDZbUqus2TJQ4Ls
	cvvbpjxgA90ej4HkTQFNqdHDlhEC1Bi9O2msUcaeZzQDmJWidNl6v0CpxaSVsuDGQHNB8A6Hj6rtY
	kJYEHAth/y2LloyfxvUXzLm6q3/H5meq63QH/PS/8XTPS10YYcKa3pg/ZV3fWcH5l1Dv+ZjfzwtXw
	dFgB9vXHEwciT0Qt+TjdUWthP2D+xLfx6pCTKviewYfn5OX7oZ3xjwSqgAsRjqitep0/JWqot8b1U
	tG5yL5046IP7XAxapzRsDKwWSac0pdUk6xhhvzsrSuBN7RaXjk3aRgsDQqwuwB4aZEK7h5xgev6iR
	uJHfQ6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3a-0000000GVLa-1PTK;
	Tue, 30 Jun 2026 09:47:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3X-0000000GVIH-1qco
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:05 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493a5392c60so13135875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782812821; x=1783417621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TYHjDbbP6M0n9F6tX9dbKAlLVBmbBYfjjSGS7CObkc=;
        b=FcJUEKU9bmGvnJvFoa11G6uRL9aR4VnHuqxVNUNYtbcwAxZ59g8E2ZHxNKhGTkLN4z
         ApClUsoG5TemCWBZERPMmcCiM6xJ1g7fJIUrIB7TdqtFpJ0JYb2Dflubuv8y7WEGUtse
         0ZIxL2wyu/vmXU1tzJooUx6OCFF8jphFfRiWKde65c2mXzr7EQUUyPz7ctcq0NQbhgz8
         MEmSPVKbKY9w/EeqT5ph/oVZqRpfvtfZVqt6PSzg226dBqjLDCkqFaSGb0PwwOfQXRhl
         DH1ecxUTAA6LoKJ3/uxP+i91F36qWSzp+9sbqZGtAB9wlbU8uBON2/R8DTEJA3RMZkVb
         jqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812821; x=1783417621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TYHjDbbP6M0n9F6tX9dbKAlLVBmbBYfjjSGS7CObkc=;
        b=OlVa2Io+cm0JVOcHX6XhSo8wvHq+pmTjj4qb1048HDqBMmwweUPxIRNlveYNjsH1AW
         srtqtUGkfw9D4pldsvFSW8ZMlwZud1uTd/J83rdtaZN5lyws0dKKRiRUFYGT0zvZkpJ0
         v65B+1sC3TzUpLjdauODUU4Cq4ELyZuQyzNbbtePzfdRr5n7rZI8soQfqXXd7TZMGqVu
         KWkY8JocGhblC2qAnD/5Ngxg/SVgyK/S5OxfSNThHqoPqh9VgnGJQpjFbA5nmXiGLARM
         dU6TRZqFF325P7cmbgyPpOzJbVjbIo85CTnErF+JzyQ0Adg3c4I2KT6+QxFn4PB/5Mzy
         iEMA==
X-Forwarded-Encrypted: i=1; AFNElJ/G2fmYqss08f6O0Q11My4NIVSWKYMrWNqn1/Y2khH+DiN9HrYkk5QBxuKtJDL73YOfw6nZmMixgZMXk00FFrd3@lists.infradead.org
X-Gm-Message-State: AOJu0YwkeeISsEutoK9YTbZV1gH6qiIVwWVHEH4O+A97nVKqtjDTNcSx
	3ZMdmEIomiFyiq/KW7l4s/1HvZoWEh9D+zQb6Gm/xN7UkB/275XaZjGj
X-Gm-Gg: AfdE7cl17aKPE+S7w5YQ0yruwlpOIcK0WYNrFneRaDEhoR1jRYGaQL+zbwzVWxR/cXG
	HZt6mb+DK0sBJjWEnQfd9nudYJGZWHAfr96lIvWQoUBp9iZC8GvEuzFuC43DKYAq9CW4JsginWq
	XT3K9/Hke3ptsN4N0P/spWVDdwtZgHSj+ZcWTVETs2dp0GFEDeYFDWnMnwqJv929n1Twnn/2mz+
	Ki6EbzzI8H1Y/pzcWC9tzoJmSnfoSgbHIojvpCUwlS3z9J4Bi3U2J2/MuFrPGoksGixAd5gO/E7
	YKEop7x7km2XnKoB3F7+DUZvfSZDSlf0q7faLfePy7LyvB1i22t5QRg4hXVTMwZmZxWrN5cZhdW
	sE7Hv6beClzAGNwrLcb++XWxklECDbwz6/OBdneO4idOhsgFlVyjogYGVKORqrPRWmrQ+Q0JewP
	aP/ZNBfe3VwzIzPDpjDhmJOnLjPQJl/qKfY6Igzx5JRGjRqkT3EG/Knv72g/PekMkIQd04CTn7l
	wvO5EQTUm+x+e3L7i2w6FdLLw==
X-Received: by 2002:a05:600c:a086:b0:493:a607:f3b8 with SMTP id 5b1f17b1804b1-493b8146e9bmr42929345e9.0.1782812821044;
        Tue, 30 Jun 2026 02:47:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778f015sm6552725f8f.31.2026.06.30.02.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX8QM and Symphony board
Date: Tue, 30 Jun 2026 11:46:53 +0200
Message-ID: <cover.1782812572.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024703_498373_27AB364F 
X-CRM114-Status: GOOD (  12.83  )
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

This patch series adds support for the Variscite VAR-SOM-MX8 QuadMax
system on module and the Symphony carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
  arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8qm-var-som-symphony.dts | 488 ++++++++++++++++
 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 529 ++++++++++++++++++
 4 files changed, 1024 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi


base-commit: 6d1a5ede11552f559ac02b31af03bfaa67f1e91f
-- 
2.47.3


