Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FD2D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6t+LCRF0rb2ejm8/PYlo6K0b0NDm2a6KXXst/8VjOAw=; b=K2d9yZgFCUPi50rRKSQiRc+7gl
	96kcQxEp0jJ1l7Y+0opyRZ2xJM+sLdCFKyNEgyUpN7x4P/N84npRXrl7XLWqnqub0CPnA07Tcvyau
	BqLqZ6wGfa7A8o/X/tcqPMXkWKZSr0sTTFHdG6rX1PN7U7dA3v8ZR4w+p4sbbfCXYeK5957w6V2xu
	7sCoqrYnh/ecOckeJwDjV44YMEyAR3y/sMr6OD8k1Uuecy/IiQIPUy3NQM0meTl32oXMoA7Sr21Ny
	9XWh1Kv8UyJSi0qbrUpcSuwS3syvHD9oydbbFMuCRyZ6b5yL+vw/nxsSoLNDGr1L6M+tBESeW3Gij
	u8KN2sPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHFa-0000000CMsO-0BQR;
	Sun, 21 Dec 2025 11:05:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHFY-0000000CMrI-3GJv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 11:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C629260007;
	Sun, 21 Dec 2025 11:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566F9C116C6;
	Sun, 21 Dec 2025 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766315119;
	bh=Nz3+VHR47YCuwduLdUUzntSPalUFZ+BG9nDzXt1o60E=;
	h=From:To:Cc:Subject:Date:From;
	b=jqr4B5LG5KvlEkHo7eM2Pv4kQhvlIRCRVAi1VmIBEKlRNBZuaRX0XdVXFvrQtZnlT
	 zAUZwyXj/PWWCZKoTr7wILTrzwYrunkKBYSNJVOkv9APCv61PVroCrJiU0eaDSitO1
	 +RL54HIp4tnV1KsBjIVhNgFhLkjVm1JlpzB1hcrJn/Uz3gJo+sjplO/j/HF+cYmN8r
	 e3mjY4CP3vz/NrZ2NcMQrKRjv2TpmS6mE2D7DBY4p7Y3Puk8OvWINp+S9dkdX7ao/p
	 xRn7s6ZnS7AcKxrilXoF4ARoZQw7JGNFgs969J5XyyNW/G6GydJuO/p2DhUJIU7vyn
	 X6eTiJFYIDTfA==
Received: by wens.tw (Postfix, from userid 1000)
	id 3488B5FDFB; Sun, 21 Dec 2025 19:05:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: allwinner: a523: Support SPI controllers
Date: Sun, 21 Dec 2025 19:05:07 +0800
Message-ID: <20251221110513.1850535-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi folks,

This series adds support for the SPI controllers found in the Allwinner
A523 SoC family. The SPI controller is almost the same as the ones in
previous generations, except that it moved the "RX buffer count"
register field to a separate register, and that register now reports
the total count for RX buffer and FIFO.

In practice the driver has never cared about the buffer count, but if
any implementation were to use it, this counts as a non-backward
compatible change.

Also, one of the SPI controllers supports DBI mode, acting as a display
interface. There is no infrastructure for DBI interface controllers in
the kernel, so only a separate compatible is added for it.

Patch 1 adds compatible strings for the new variants.

Patch 2 adds driver support for the new SPI controller variant.

Patch 3 adds device nodes for the SPI controllers to the dtsi file,
along with pinmux settings for spi0 on the PC pins, a common usage for
SPI-NOR flashes to boot from.

Patch 4 enables the SPI-NOR flash found on the Radxa Cubie A5E.


Please take a look and try it out.


Thanks
ChenYu


Chen-Yu Tsai (4):
  spi: dt-bindings: sun6i: Add compatibles for A523's SPI controllers
  spi: sun6i: Support A523's SPI controllers
  arm64: dts: allwinner: sun55i: Add SPI controllers
  arm64: dts: allwinner: t527: orangepi-4a: Enable SPI-NOR flash

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |  4 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 94 +++++++++++++++++++
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 15 +++
 drivers/spi/spi-sun6i.c                       | 11 ++-
 4 files changed, 120 insertions(+), 4 deletions(-)

-- 
2.47.3


