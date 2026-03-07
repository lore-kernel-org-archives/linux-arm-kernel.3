Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C37CFCB602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W9oa0AHQoPurBACCzWUh4c9uWAceyEmwnMnCZmzmFq8=; b=awMTspkgFDpOxCrOENrRO44Vwz
	gRVKf3GK9glN7aiA5Wj0ZZINMR0Ll9h2jeAP8lEzejwQm77vDKywiGoj7KqFqriMu3o8+kbrqxdA3
	Wpp34o9Tdv4E5KtDHhIfOE1bYgocjSnOdW9jpLdB0IG+LqtJzGZPao8FvFk6W2nJJvdxYyAVBHyjf
	swW1MfKqYTSXluzuYuh3p5RJbwiLtWYdNpPVWSiVg1tiYaGgsQtpVt3viIwysEVTGnUkw5w51ir62
	mNKG/9Ns6bKwyGJ/q2wx5jx5cge82e6o5WxHs5ymW9aT86avICYvKBqGG9BF6/ahQmR2ORi2sy/fi
	vnXhEY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzn-00000005Jxx-17lo;
	Sat, 07 Mar 2026 15:55:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzl-00000005JxM-13fA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-483a233819aso101141245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898911; x=1773503711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W9oa0AHQoPurBACCzWUh4c9uWAceyEmwnMnCZmzmFq8=;
        b=XV1jpoW4jxk3XIYGm9fBxkL9oUypzO3nG3yE88tdIdCS2f6QMF17zbjojlBv0/8tlM
         aOLgXYvtcMPA8wksnuyrZs81osZ99htqWy5vOyFTF7I/D6l1S181R5ejOQR/QNjxe2Of
         DNT0gOYlyU2N8mVgvaW8zFvyObdSx/GUfMbrOcgNMONE1+7xjsbEntzQdgnrKP6GfLFn
         za/9+WdzsweptI4Mly/2izK0FgqMvcAAsEVSq+yw9vdlsOBPO5NVM3mWGgdbhRxn4JwF
         BEZW8X1D2Yv1UVB8o+R3bgVS+PuF5Nzrkn1kjZ79p6uLRcNf6ejKt3LxKt/rNpjVget0
         sNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898911; x=1773503711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9oa0AHQoPurBACCzWUh4c9uWAceyEmwnMnCZmzmFq8=;
        b=BugZWoJvwz3KOonZSA3bw45q4Adil+2IDewL22cffe1zukU6Y7HWkBi7gsrK9WT92M
         wwXbfJnH3wbtGBHxBrQmUIysQdITIIJ6tq9eqypykJtQpVEx2RtyUw5PVj2nEAjMT7Jm
         hab1MADSkoUZYjk8q6MkEKRtzvldNXHDm2X1KMusT1JDWBq1Hpx44H5EoN2mcZq3CHmx
         1/CZ2Hd6bBnm+/Zhpc3kIF9TylVm4gYUlC96p2cyfgEY5MTIFuzvtXEAmgFzqVv02x51
         mGBqnn4zY4SPTOdm9I+Cz/i8KkKb6Oda08WrguMj3PzbFs/dL0wjnKOUBCb6aPD98K++
         z1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPbHz+K59FgAUY79R3HHbbAjtncfOj9GXzlw/T8W9rlop1qF57aS+9ZnkBA1j9ol08q/N5D/YbwXPlDZF6XTB4@lists.infradead.org
X-Gm-Message-State: AOJu0YxdEp9X1T/xrQqcOW+tQjOs4JST+r5rDqH72sWYXHAAq33icR1H
	mjytIjO1f3jdsB9meTFnjBWq3RGZyLkZS7gDOHm/Y0MFSZmRj2atNIFo
X-Gm-Gg: ATEYQzzOcK8EKlvQW6Dhu7iWQl8pwJmdL6hRx4DgmooWaEX+1AxgvmpjiicKLwU+jGn
	JbkcQSsCoYn+MISCvmOXJGYdCX5/6Z7eJqb9Sl4cSexuC5tM1LcUR5qAwbLarRaGGlLxY/NbHTI
	hFKCh+1T6xSavIfanRVGs2PgpHztgNWv6BBI5C7jZMn7Y7P6EQFU0XUOBm6UN3u4zFURhelI8kv
	x2EHtRgITRgns10/6V2ZjRHhXAMsIZ25nn1JdkWlAwHdNu96y9DLnW16d3wI5Hn8mQzSvOp51YN
	Jaxcc/ytFgZlYKEluB5pjSefwzH1pEKl6IF/c/W0sRiY+J1rLzeCza2BkkEK38sXHC3xAVKy/gu
	IKjAphi1Nmh2VPao68HWzB/WYziyrX8+pzYqOO7gtem0h7b+dudJCXlKZoZHkLmhVErs3Zh79MJ
	V/6/qXDVJeL2wd1LKOxC7t3SCkKsOE9Zz0vW66pC9jZ77ED5cdTA0WSAQgaM7qcUj+CLm9GwXy5
	7RJXvBjOEkog+5pfJIW7nA7aw==
X-Received: by 2002:a05:600c:c4a3:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-4852692c943mr101324685e9.14.1772898910962;
        Sat, 07 Mar 2026 07:55:10 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:10 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 00/11] arm64: dts: freescale: imx8mm-var-som: Align SOM and Symphony DTSs
Date: Sat,  7 Mar 2026 16:54:36 +0100
Message-ID: <cover.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075513_328413_6A0BB35D 
X-CRM114-Status: GOOD (  12.33  )
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

v2->v3:
 - Add clock-names porperty along with clocks

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

 .../dts/freescale/imx8mm-var-som-symphony.dts | 225 ++++++++++-
 .../imx8mm-var-som-wifi-brcm-legacy.dtsi      |  12 +
 .../imx8mm-var-som-wifi-bt-iw61x.dtsi         |  45 +++
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 366 ++++++++++++------
 4 files changed, 503 insertions(+), 145 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-som-wifi-bt-iw61x.dtsi


base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
-- 
2.47.3


