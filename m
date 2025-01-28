Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6856DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XQ+wjSPA5HmHAGefpS6arpoTGAAms/cpN7OEbSeVp1E=; b=UZ8uTBplJ0xGPUIiBWn6EKudTW
	IvFIIlRWZNOqoT3Q/7SK+vYkjeSS2g75vlfK8EKJ2nxllK336STopYqmWpVTFDzPYBl8mTVtwollo
	BM+qNGgOq6EZLVEnAX93Uo8dYN2C2h9ynXp02b2g4AUVCP0p+3WLgRrLiYy3wcFDdNcWO/3ElxC01
	StjLtFVb7Z61DGrZrLt1CbSkZ6umyczH+tFb/EoXHwREXP/IbcjEAvztf5z9hvdq6EN9aRVp79mxJ
	RMQB8SMsAaghP1XMwJhSN4RQ9oBVUhrkDRi4CFzT34WT7i1h45NYLsFscoLHed5hxp4n+RowznPtc
	QS4P+C1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrvC-00000005miY-0Sx0;
	Tue, 28 Jan 2025 20:10:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrq1-00000005mF8-2fv1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jan 2025 20:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=XQ+wjSPA5HmHAGefpS6arpoTGAAms/cpN7OEbSeVp1E=; b=mQPWZhQROr/4ZA9z7cqVrDvpdN
	8aROCV8o45payVU1pVhJl5w1CDZ1ukttbwdeK1xGrNQvlwu54tXIZzEw78QcRKRwgAdvXYYrzBAJx
	fpYOF36Y3FWJTBsXLq6kTef5qV58uftcOwj7vUTYR/PLmjQqGTWXyieBl7LPnzDEXTI36ZLNJJ920
	Chnx95YEEkCKHHQisG6+E5+V4tgI4UEWyXLK7BoLVarvbLeii+V8JopHlC7Cfge8cGAsQYvDWgI/b
	6OJRUHpVtirg4YRXvNqYVfB+rW9Ey6jJ2gSsjChKo3UMnTzrprmi2Jx+hPYYADTi4mY33e2Z5kQCz
	u81LC4hA==;
Received: from mail.netcube.li ([173.249.15.149])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrpy-0000000F0CL-2dyP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 20:05:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=XQ+wjSPA5HmHAGefpS6arpoTGAAms/cpN7OEbSeVp1E=;
	b=vgc9jZ4L8Ru5wwAhOcKLKKG/NtPrylo6pej+ut2x/XrL6dWqF7D3DoYGRmpxMGYt3UicVa06I5cWv5DYOPrz6y70PPhDyhvs1tt4tPyea3ten+5RhQeCp/2p7upfc16VXUh13FscIFW0xX4t6hfoCulzyBt9jyvwcs+yXxMiOas=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Tue, 28 Jan 2025 21:05:10 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/4] Add support for NetCube Systems Kumquat
Date: Tue, 28 Jan 2025 21:03:49 +0100
Message-Id: <20250128200355.1948997-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_200530_883652_35753902 
X-CRM114-Status: GOOD (  17.87  )
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

This series adds dt-bindings and dt's for the NetCube Systems Kumquat board

Changes in v2:
  - Fix the devicetrees according to the "dt-schema" and 
    "make dtbs_check W=1"
  - Fix the License of the devicetree as requested
  - Create a cover letter for the patch series

Changes in v3:
  - Disable rtc inside the SoC again, as the rtc does not work on the board
  - Add the gpio-reserved-ranges property to the pinctrl bindings
  - Reorder the nodes in the devicetree to match the order of the nodes in 
    the sun8i-v3s.dtsi file

Changes in v4:
  - Moved the dtsi change into a sperate patch
  - Update commit messages to include better descriptions
  - Add descriptions to the uarts and mmc nodes in the dts file
  - Add missing newline at the end of the dts file
  - Removed the gpio-reserved-ranges property from the dts and from the
    pinctrl bindings
  - Remove the rtc status property from the dts file

Changes in v5:
  - Remove the unused lradc node and it's regualtor, as they are not used
    on the board
  - Add another alias for the SoC's rtc as 'rtc1'

Changes in v6:
  - Add reason why DS3232+ is preferred over internal rtc
  - Remove redundant pinctrls from mmc0, mmc1 and i2c0
  - Reordered eeprom0 and spi0/flash@0 properties
  - Reordered nodes by their node name alias+

Changes in v7:
  - Disable the external 32kHz crystal oscillator, as it does not work on
    the board

Changes in v8:
  - Update the commit messages and cover letter according to the Linux
    coding style

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (4):
  dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
  dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
  ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
  ARM: dts: sunxi: add support for NetCube Systems Kumquat

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 278 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
 5 files changed, 293 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts

-- 
2.39.5



