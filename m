Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF65CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=; b=Yl5rH1rKAteRagnewCCxvJZfqh
	5NNzBM67aO+h1PqAKXZndvw77GQEIlFDA01ZnpKVsv1XSb7Jo/ekgdkDwuadTISsmHRx7nxwr4fBX
	5LEA6/hfzE9v1/O3Pva8BhHbbNoKap+yrkGGwddCE+P331MiK29CC047GxIHb3vWyi8i1aqi+DnKu
	V7qiZghqMYYsUXrCsVQpVLDbo9AMn9NOsZzYNP5p7i+pkBnhfBihS75CRhSyFCmaSxZdgZ6mOCwgi
	lO4bkrH/BE4r6Id5kmoioFLjFo2TUcaMNkfqOT+EyEuxPqOPBftEp+zz3JNI5AfytLsgYQ1aXNSEK
	nw9xjazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3Q-000000009XA-1Ail;
	Fri, 05 Jun 2026 06:29:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3N-000000009VH-1hwl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45efa80e0afso1208892f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640952; x=1781245752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=WXBCtXGWO2AQ1lxWse2ieUSGE87zG+cgkIv+WzN/22n8Uy6zkv+0b2tYytKd3pXPc3
         vLZx7d7bH4BWv9jVCE3SWkN5BIWB1AB7G0dYKWTaXdHdbOrbT6m7id6XmkwRmbbJUkxQ
         gxv+7N3g2snTGO/c9X4IjBolYJhv9kir7j9rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640952; x=1781245752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=TYgslc2udnBbweCJOuhiau7YxlkYJm9LNcOkUISsPuo8rWzxcBv73isFc01AVendxE
         fyYgP9N9EhKqMNMqXth7D5HECDdtcomlnfhRLa0meQaRswDDqIg0Lpsx7uM7C56FLtR5
         xlDfJMdP8tDeL3gUBn4rveqCIntSGoA2XXg5+fmZgvDRKIbeZH7zFLPj9cv1UYepVBHZ
         DEC+CbPrksRQH4UBS1MJP3yxLpEDEsPgUJt8xy7m4WcTUlpM+PhRTuXX3GoqAFaJMJii
         4taDfn9Zfmc0WLbygc8bNZaaFPN9KAY9KiZ1LAVETVYI0t2udR1zK2qViQmoLs31eJSi
         OAkg==
X-Forwarded-Encrypted: i=1; AFNElJ/w99RBOhhg0bU5x9+FHCwPpb6OJpaLRIperxi1ErkeGArmhhi/eb1WwdNcZuQQ5GXi7wK8yDdheDoLqe4d7iFu@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ5+rx0M6BZmpXrjhi6cyior8WVyoXCzHMFhQRNHMEIUKCnRor
	e1rPjRwV5oe6OVRY/Qfq1dzaexpJ5+J/weHew6XcxcaemXv8mtWHBhYC85bHGvGaicQ=
X-Gm-Gg: Acq92OGuPCjDcIYvpuOHcOdgyEvDkf14NCyYa32T0gTUKDIyMQGBDkPu2vJJD6+lyQ9
	cqJMgPmEjq15WavVz1eeg4YjPwG+qE8/Vs4MNXbkAGoNKjzY4Bl51mPkBv74IEsTM7uJqa7C4Gf
	7VN/NWmiptSX1z/N6WEwXyJf9G6kU8QdreMOSPLvWUZJuKBvwyT+DouWBfWILHnZj9FM1WxZEGV
	l68svBwsvpHLdiBF0YSwsz42XUdHxM8Pwg3QpJe6rmHUvV4IS/DJenKqKxD5rkFJvNd0VAXEYxY
	b0tEdKLVQo5GOHBBgNnJI2fYASd/X9xCb2okgyGyA586nyFc2xqWOSEJ1A5izUd2K4n65etz1UK
	7O68FcN9DCf8oS7UjPvg2pr2cll9kgG+oVeNibs1pNk1k/ZLkW0FG2alLHP2tkzeBEJAH7JqY6f
	a+gI9Yk2rzgqtBvmQTEb73WeWaC4gC/lF21yoaN52wVRbKqPy416UMT5bovYVdWYRUagQw+t6lZ
	a4TItl0uzLlDwmZZD8sbBDRI5Aan328WEtfsAOJ1owA2U2TsivpHOaWRd6Z7cSg1pUFdkWVwXhX
	kXTkQR79+hzBIQwck3rblopLHhP8oR21z50=
X-Received: by 2002:a5d:4384:0:b0:45d:b14b:23fb with SMTP id ffacd0b85a97d-460304fd053mr2454230f8f.11.1780640951753;
        Thu, 04 Jun 2026 23:29:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 03/14] arm64: dts: st: add CAN1 support on stm32mp25
Date: Fri,  5 Jun 2026 08:27:31 +0200
Message-ID: <20260605062900.368376-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232913_475267_A96EC57E 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0


