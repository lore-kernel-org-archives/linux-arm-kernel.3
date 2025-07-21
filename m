Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3526CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 02:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4ztzQRM66v4JExnCsu3+Idlgs0P+nNKywN3oZNZuwo=; b=rIeXbYSzN6B1llErMLPIUs2loc
	pG/2tpZUvMRU29GK4/xrII762FCELwKP18/++JBJG/RU0uMN2D2ao1cgkTqreKGfsdMHhwaMZ82oq
	C0O8E6O+9WuJjSyrJdUulDI+KJp00f7VlakOCQl1ZslF0CE71+wuuFDup7fLehrOl0TXuE1a7yf8s
	lO9LJCLQ2CdF4C6kgjJKToC9V2GS/fcuJD4GW+fvRfz9vU5cQiL/3WM5Wp9JXPdHlbsYzEV4+n1kS
	BLEvuLzI4uBq8Inv+uAB1qeWoJg83DnK8YB/qhuOZwLQocVq8YXa0A/SBr00OchkHzNPyqU+3Fw87
	iS8q3tIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgew-0000000G25y-084c;
	Mon, 21 Jul 2025 02:53:46 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgXk-0000000G1L5-0yFJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 02:46:23 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250721024614epoutp035d664458a9451a19405e6162852d4a3a~UJDcjR5bO2083520835epoutp03U
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 02:46:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250721024614epoutp035d664458a9451a19405e6162852d4a3a~UJDcjR5bO2083520835epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753065974;
	bh=l4ztzQRM66v4JExnCsu3+Idlgs0P+nNKywN3oZNZuwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEr6ybwk4ScxLt6udlv/waeNUcQzioQA20HmS1slmQCDObci9YyuQN5ZgN9tsPUHS
	 T3tTPVzQVqFeXuSAlYi7KH6T+XIk+G/RQ/s1+EJRPEcyNgfnqLNCNvPqqVJkgMa+Cg
	 A1aQp3AfyzPu4A7cLaM8/4a1l8rxKiCEYBzldmY4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250721024613epcas2p3ca4d521ac9a807db6c754be729293235~UJDcEZBzp2776427764epcas2p30;
	Mon, 21 Jul 2025 02:46:13 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bllC86pMfz6B9m6; Mon, 21 Jul
	2025 02:46:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epcas2p3da8e99d27a57cf7ad4ed46729e86602f~UJDadSU792776427764epcas2p3q;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
Received: from AProject.dsn.sec.samsung.com (unknown [10.229.9.52]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250721024611epsmtip2b5a19c5bef426ff8357771f040150913~UJDaY3pC-1443514435epsmtip2H;
	Mon, 21 Jul 2025 02:46:11 +0000 (GMT)
From: ew kim <ew.kim@samsung.com>
To: broonie@kernel.org, s.nawrocki@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ew kim
	<ew.kim@samsung.com>
Subject: [PATCH 8/9] arm64: dts: exynosautov920: add PCM playback/capture
Date: Mon, 21 Jul 2025 11:30:51 +0900
Message-Id: <20250721023052.3586000-9-ew.kim@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721023052.3586000-1-ew.kim@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250721024611epcas2p3da8e99d27a57cf7ad4ed46729e86602f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250721024611epcas2p3da8e99d27a57cf7ad4ed46729e86602f
References: <20250721023052.3586000-1-ew.kim@samsung.com>
	<CGME20250721024611epcas2p3da8e99d27a57cf7ad4ed46729e86602f@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_194620_714367_801F0F1C 
X-CRM114-Status: GOOD (  15.38  )
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

This patch adds the PCM playback and capture device nodes as children of
the abox_generic audio controller for ExynosAuto v920.

Each PCM device is defined with a unique ID and an associated IRQ SW number
used for communication with the ADSP. These nodes include information such
as buffer size, ALSA DAI name prefix, and category type(e.g., deep_buffer).

The nodes are initially marked as "disabled" and can be enabled per board
(e.g., in the SADK .dts) as needed.

Signed-off-by: ew kim <ew.kim@samsung.com>
---
 .../boot/dts/exynos/exynosautov920-sadk.dts   |  8 +++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 32 +++++++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
index 2f4cf112675a..f9f717fa95d4 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
@@ -94,3 +94,11 @@ &abox_generic {
 &abox_ipc_generic {
 	status = "okay";
 };
+
+&abox_pcm_playback_0 {
+	status = "okay";
+};
+
+&abox_pcm_capture_0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 21bcbcf7e2b6..094fdec2e6f5 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1133,14 +1133,42 @@ abox_generic: abox_generic {
 		samsung,num-pcm-capture = <32>;
 		samsung,num-i2s-dummy-backend = <5>;
 		status = "disabled";
-		/* #address-cells = <2>; */
-		/* #size-cells = <1>; */
+		#address-cells = <1>;
+		#size-cells = <1>;

 		abox_ipc_generic: abox_ipc_generic {
 			compatible = "samsung,abox_ipc_generic";
 			samsung,num-irq = <64>;
 			status = "disabled";
 		};
+
+		abox_pcm_playback_0: abox_pcm_playback@3fd0000 {
+			compatible = "samsung,abox-pcm-playback";
+			samsung,id = <0>;
+			samsung,irq_id = <0>;
+			samsung,allocate-adsp = <0>;
+			reg = <0x3fd0000 0x10>;
+			reg-names = "pp_pointer_offset";
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "ABOX";
+			samsung,category = "deep_buffer";
+			samsung,buffer_bytes_max = <0x24000>;
+			status = "disabled";
+		};
+
+		abox_pcm_capture_0: abox_pcm_capture@3fd0400 {
+			compatible = "samsung,abox-pcm-capture";
+			samsung,id = <0>;
+			samsung,irq_id = <32>;
+			samsung,allocate-adsp = <0>;
+			reg = <0x3fd0400 0x10>;
+			reg-names = "pp_pointer_offset";
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "ABOX";
+			samsung,category = "deep_buffer";
+			samsung,buffer_bytes_max = <0x24000>;
+			status = "disabled";
+		};
 	};
 };

--
2.25.1


