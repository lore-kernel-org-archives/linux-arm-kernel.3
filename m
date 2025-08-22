Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC08CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JY13I1ssiUctt8v1bMB12KDTurE5UxGKFZq4b8s0vSo=; b=hf+TEMfHFPczaVLfBoEKbNgseT
	RS9LF905igEiSXaD2j3j2GIGMa8qfID55YRiWvV1vULmcYQj+A/22b2OvciKWNRRU2kHCzc4EKiER
	J+M6BNqR2L05bULpdH3+K2g6qOmYan9LRtjUfS2YW5GfevzeGsF2tRPQywpZgvaXZetS0EsaYmj6D
	5WZK+PGDry74Pa9Df5TVz3pd+d/J//Lt4JgKI8J5XAYlybWqFec2wsjF7HZ64JAf4618xkZ6Wowmo
	RDcP7prJLf9YAEeg8gZko3ARItFoHwzdQC5LtJ1eIb1suZc7m6qhSDwsKdRKFdGrFepH4wd1ZkKlw
	ZC7Fb5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphnC-0000000414g-0ceT;
	Sat, 23 Aug 2025 06:31:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSud-00000002rFu-3sHH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 14:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JY13I1ssiUctt8v1bMB12KDTurE5UxGKFZq4b8s0vSo=; b=Dz7BVPw2ogbdLiOF+ZiJPs1vnD
	McB9VwXdTxaGBY5ObZCxZccbKD9yewnHcPNvIkL4tCt/tJmpeG6jNkMtXgPAZvnRUoXw/viZxfKvG
	rmIF43j4B+bsFsWJd117dHjVbNPAiBxvMCDs7zgZs17Bd5CLafzwikCfGGv3uqZi2rB5pL5erEEd/
	A8mCEx2FatBphHmCmyu/5dbTaIzFXWbS63KiEBhaTrHshM1aQiJNZl23dwbYp5b+0oYbHJHJyylee
	CnEgDHHAdLXocmguDFJxEHCLAQQYV4nfcbGQ7ojCVGBRBls16VM0LNVWsKmGMRd4KRvVi/QkTc8fD
	EMw+gTgA==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSua-00000000xAD-3Rff
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:38:38 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCgm3f005067;
	Fri, 22 Aug 2025 16:38:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JY13I1ssiUctt8v1bMB12KDTurE5UxGKFZq4b8s0vSo=; b=tVZMfvjRPD1xED8+
	5oTc+jo0RvTZzFw/gel4ABzmLON0/wUBNsocHLJ5U8tsLUqbkx4s/DJ3jsOU+7C8
	uU2KjE9aE7JpVgXX9VuE69qNNJQjEHxYUO31FRdqgALRcHtCiQa5bzFeAKoMN7MH
	2HhtpjR4b0GXawB0yQOQptZ4ahvpShEmb77J/cZ4YLvsLcwyklxckHPthyraL3qW
	fVg00k2Vuicmwhei++94P5xbP4dKEGGd9DQUxeJYb/Xx7Sg8Vxt2mEbfFgrJxFCM
	23DJlzAeBo6HMkT+UeV7kiCTNHfWbAGk1pPmAh+rbibuHX6aYzJIRY5JxiW5os0i
	yTEauA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nd5xshn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 16:38:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 16D6E4004F;
	Fri, 22 Aug 2025 16:37:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D4A0726F19;
	Fri, 22 Aug 2025 16:35:55 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:35:55 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Fri, 22 Aug 2025 16:34:19 +0200
Subject: [PATCH v5 10/13] arm64: dts: st: add ltdc support on stm32mp255
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-drm-misc-next-v5-10-9c825e28f733@foss.st.com>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_153836_996192_6E098B75 
X-CRM114-Status: GOOD (  11.27  )
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

Add the LTDC node for stm32mp255 SoC and handle its loopback clocks.

ck_ker_ltdc has the CLK_SET_RATE_PARENT flag.  While having this flag is
semantically correct, it for now leads to an improper setting of the
clock rate.  The ck_ker_ltdc parent clock is the flexgen 27, which does
not support changing rates yet.  To overcome this issue, a fixed clock
can be used for the kernel clock.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 6 ++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 372a99d9cc5c3730e8fbeddeb6134a3b18d938b6..b44ff221e0da968be104ff8195f9bef79c90c57a 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -52,6 +52,12 @@ clk_rcbsec: clk-rcbsec {
 			compatible = "fixed-clock";
 			clock-frequency = <64000000>;
 		};
+
+		clk_flexgen_27_fixed: clk-54000000 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <54000000>;
+		};
 	};
 
 	firmware {
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index f689b47c5010033120146cf1954d6624c0270045..48a95af1741c42300195b753b710e714abc60d96 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -5,6 +5,12 @@
  */
 #include "stm32mp253.dtsi"
 
+&ltdc {
+	compatible = "st,stm32mp255-ltdc";
+	clocks = <&clk_flexgen_27_fixed>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
+	clock-names = "lcd", "bus", "ref", "lvds";
+};
+
 &rifsc {
 	vdec: vdec@480d0000 {
 		compatible = "st,stm32mp25-vdec";

-- 
2.25.1


