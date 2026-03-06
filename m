Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353EDFCC062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pygklHzPZCvqH88rpK8Mu6BNLua8aC7oKSSLfM/aNbo=; b=mDs9xTYttL7KWGiAAFwJFWl1AD
	276qpui3GbOwzfCzzHohQAVbqwkHf975ESg2mlzoOvI7wFdlJUlIKN+lUuGjM8JudBA/mfh4Yn2W/
	Qjw/t8STXFG0NV3w2a2NGTdpD2p4tRs9r70kWDX+DaxzRPUa6hXw+l9zhBGKs8nJVSUgpvOwsoxZl
	o69mDLD15DqnNjTlPb/PJbWEbnmiFc2CdJagIjbWErCP6S8juHlzBxuNrqE4K2aOS7vpSjr5YFsgS
	6e0OlNMTluVfGXLTdAWtPa1VtMnBb3G7qxhhIVMUBMjbsxqsUuQXaryeLFtDGg5ewmPQpMdKJVWlt
	7zJh0haA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJp-00000004QZ2-1WsB;
	Fri, 06 Mar 2026 19:58:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJn-00000004QYg-2j4k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso79852685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827117; x=1773431917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pygklHzPZCvqH88rpK8Mu6BNLua8aC7oKSSLfM/aNbo=;
        b=dvWLi/KwTANObI4tmkYx2jgILRrZGKnfREVIS/RavzZqYrBNcdiPgN2M36MB8mHJ9B
         k+p3lZifkMki+zPn9Ez+kmb2mK+7BKo0gwMNG1vcKsZB2WGmcI1fkozkYZm0xhalVek5
         ZaoTuB7hSxV7AjqN0QdKKytkTqR/tBayQFOoejPbYy4THXp6zhpzjpIfaUyQBC+u0rDC
         8Qfn86EJ6M2JYGdANXBNAcJab8aZlPdtkbVSRjSfMLP2TNgYzy9quLZGv8HiHHCj+ESF
         04n8w988pytZVpSFnXybpSegu4TusE5G3TbX63ptpYCAwBGPLb77OWdW+/o4ThWnVMjg
         mjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827117; x=1773431917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pygklHzPZCvqH88rpK8Mu6BNLua8aC7oKSSLfM/aNbo=;
        b=eXn8pgL/dVIPIcSW5Vhi1QfrTYSz57accy5msU8U1c9yiE0ufPnDUNyQqhKZtYHzz0
         qjsCsrZcpw4DE3mK7k0l1amCBKWHDzPrh/AWtaXCi8CzsYcoeWkHO6yinlkNPfRQbzGy
         EpEkSyFy+6JtGCavl4/I2g5OYNA3JTONqbZ/lAY/TXbGGEIcIc4R8Uoqhrxkq4/9eGEh
         d0h9JhN/9x2gyxKMrKqEejaKPw2q1fixi7q+UmCzw0lemb0FGZ9NxHvInmhWjYIKK6Cw
         x28QzRdXoXhRlLP/Asvg1QQgQqFTD9TbrOQEspqQ+cX2QXPo0vl3M5gaub5zf1P7jkpb
         5GCg==
X-Forwarded-Encrypted: i=1; AJvYcCUCXi6v7PXDt25XjFzVhCMVynrbzpPTjqBaiSqAmXE9bgTolPhTKGHowEzrTMmINLFC9yzHltfBZt6iqjbk6G3O@lists.infradead.org
X-Gm-Message-State: AOJu0YxDBY2e2k7cL32Eaia8MrDmEAfRp7A8wv/M3Auci9FU3SqJlbAp
	grxuChZQGvQKOxJw9PGr6L9isJ4jOr0Ba00Ls1+/ndy9C8lfjKqLo9uM
X-Gm-Gg: ATEYQzx6abJ2Nhh9VhjCjbNx5sz7vWBsNklqH3twMtn/RLCSZU4BndG22zgI3/o76W8
	7Sjcfblk2kG59QDuyiAAFbStLahO+uU0OwsmDNFGMZ7EgDx2st+uUZiifIv8y4xG32UdphFJ9ds
	eDMJr0kscy/hqE7X7WCiiSUkZKccTpd9Drq1udQ3pc+k08RgxkkEfm5pbz+ZciYu5XX+9ONkwbL
	JRdvuCc68yenDqyrg4hCG1XVf72IrfcHNF9lCPvQ9+vzHlXGcnYS97Lo3Z3oO/3C1KrQ5M+XZq3
	nrMnhJr8Cmo3J3pkd/RZ5Qq1I97NkKZzAgrT2Q+kn+99yMLWSBC6d3rE612MSpvZgRKM8ba8U4v
	K4/K3XyJpXKx8H+RnMWcH3xMyzMyfdl6QTX5c1qufGT/7FzVrQA3JT2yznyU2QUG5XNe6D1RjiU
	KhQkL8Jl4W6fxZt0POa4NKQWAeMG0wRHk1nbpL6vqA2E31y689oVqEDsPH5ZnvNZLoq9Yc2doH1
	WeMbMuhhAPKPP5BlHBU8L3PQdpdMP9bofIt7gU=
X-Received: by 2002:a05:600c:8b5b:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-48526927a4dmr57513635e9.15.1772827116958;
        Fri, 06 Mar 2026 11:58:36 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:36 -0800 (PST)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 00/11] arm64: dts: freescale: imx8mm-var-som: Align SOM and Symphony DTSs
Date: Fri,  6 Mar 2026 20:58:19 +0100
Message-ID: <cover.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115839_722930_AA81B02B 
X-CRM114-Status: GOOD (  11.97  )
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

This series aligns the i.MX8MM VAR-SOM and VAR-SOM Symphony device
trees with the latest hardware revisions.

The update consolidates the device tree descriptions to better reflect
the actual hardware partitioning between the SOM and the carrier board.
Nodes describing peripherals physically present on the SOM are kept in
the SOM dtsi, while carrier-specific components are described in the
corresponding carrier dts.

The changes were tested on the latest VAR-SOM and Symphony hardware
revision.

v1->v2:
 - Moved phy LED configurations to symphony dts
 - Added Wifi/BT dtsi variants for both iw61x and brcm legacy modules

Stefano Radaelli (11):
  arm64: dts: freescale: imx8mm-var-som: Move UART4 description to
    Symphony
  arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
  arm64: dts: freescale: imx8mm-var-som: Update FEC support with
    MaxLinear PHY
  arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
  arm64: dts: freescale: imx8mm-var-som: Update WiFi/BT with variants
  arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
  arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
  arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
  arm64: dts: imx8mm-var-som-symphony: Enable I2C4
  arm64: dts: imx8mm-var-som-symphony: Enable PCIe

 .../dts/freescale/imx8mm-var-som-symphony.dts | 223 ++++++++++-
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      |  12 +
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         |  45 +++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 366 ++++++++++++------
 4 files changed, 501 insertions(+), 145 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi


base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
-- 
2.47.3


