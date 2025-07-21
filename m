Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF65C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 03:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYU5OCc+V3vtBHft5oB9RQBUA5vxCkrWFAxrhWuIKY8=; b=IijDJJ1KWGPkuPdfIaJLtHfe8T
	pvixpvdEvD2CSd6QLkujeRYf5Sa9+w/YV5+IsJDBEuC2XDwgneM3xBJrWk4XnkCTlOZ7QvcWYAtPC
	1yPYJCa/FzPZv8hxk3Lvl734J9pLKmby30Z7MvwsGgQ0NBRHVYHfOWuhc0zJ/v3fZbeu3LUig5wze
	YhZd1M7N5MrZ/bFPbtKzSk0VPt/WkpuAwfhb7ZMBogLacrbF8ftDRiN4JfTmrQQUmBLe/4jfFuTNp
	WkaNJGFEVzCv+q3XhEv2X2XhZId4km5wbQeE6E2ZUwfmNSXbxs8AcjgG1GZiDMZBkWQNwKFC9K2NH
	94L/a5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgm5-0000000G2v0-2S0N;
	Mon, 21 Jul 2025 03:01:09 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgXk-0000000G1Kz-0yEv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 02:46:24 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250721024613epoutp0363d90997dcc133c5f00ffe7f0d33489c~UJDcUPYJQ2153721537epoutp038
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250721024613epoutp0363d90997dcc133c5f00ffe7f0d33489c~UJDcUPYJQ2153721537epoutp038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065973;
	bh=kYU5OCc+V3vtBHft5oB9RQBUA5vxCkrWFAxrhWuIKY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=px38nA0L9/Jdec3K65U1ncabUDu/K5ko7/Xz9swY8Y3tN8uXj5I5wW9y/KWuV/jxl
	 uZ6dEincPF7/wQb6bhqGSpUlCYk+7zuZ9gxnuS47wKeD+rCpWzSq4nLckj16FPs+io
	 gpM3SBDYyWIF1vmJGFDfpeXUHS1daCqiW9+MdH5w=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p13c65dd9daeb11c4cd758510423b3f170~UJDbndxm81507915079epcas2p1m;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bllC82jHGz6B9m5; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p375cd5e4b53fcff3b69a39ef19c0825a4~UJDaNgK2g2776427764epcas2p3o;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip28165857b4fff549682123371d52b7574~UJDaI8wbD1347413474epsmtip2j;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 5/9] arm64: dts: exynosautov920: Add ABOX IPC Generic device
 node
Date: Mon, 21 Jul 2025 11:30:48 +0900
Message-Id: <20250721023052.3586000-6-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p375cd5e4b53fcff3b69a39ef19c0825a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p375cd5e4b53fcff3b69a39ef19c0825a4
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p375cd5e4b53fcff3b69a39ef19c0825a4@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_194620_726938_4043CE4D 
X-CRM114-Status: GOOD (  15.66  )
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

This patch adds a new child node `abox_ipc_generic` under the
`abox_generic` node for ExynosAuto v920. The ABOX IPC Generic
driver handles inter-processor communication (IPC) between
the ABOX DSP and host SoC using IRQs.

The node includes configuration for the number of IRQ channels
used for IPC routing. This allows SoC-specific subsystems to
send and receive messages through the ABOX generic audio stack.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |  6 +++++-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 10 ++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index a870c0b6847f..2f4cf112675a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -89,4 +89,8 @@ &xtcxo {
 
 &abox_generic {
 	status = "okay";
-};
\ No newline at end of file
+};
+
+&abox_ipc_generic {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 4f086a7a79c8..21bcbcf7e2b6 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1133,8 +1133,14 @@ abox_generic: abox_generic {
 		samsung,num-pcm-capture = <32>;
 		samsung,num-i2s-dummy-backend = <5>;
 		status = "disabled";
-		#address-cells = <2>;
-		#size-cells = <1>;
+		/* #address-cells = <2>; */
+		/* #size-cells = <1>; */
+
+		abox_ipc_generic: abox_ipc_generic {
+			compatible = "samsung,abox_ipc_generic";
+			samsung,num-irq = <64>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.25.1


