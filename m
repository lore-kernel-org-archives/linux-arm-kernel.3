Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D9CCD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86A87/9ws/VtdQEI7PHXUYpQ1ohvjyghc4NfnHpdryg=; b=HiUUD381cx0aM+Zf/nUA4OnL73
	hsWB3/8OvKlBaI5lsjvCXgTyoaeYlQQN/gE+JXA8R8zdzWYkakYRlwzwJZubH2w0BIjCD4Gi3VMzz
	oNGuCuxPEVWM1Yxgm3hGG4F2Feyqv5A+IVYkVV9UBHtcJCN+UZCzqoyyX6Kkr8bQJ8sxeOYRIH15o
	X9gXYxc42cPS0hnPzu39jlyvi2A0S8X+e1kogq8rw4nVs/AhTkooI71UShKkKnMFuaIqifNIKnzhw
	NKZmV37MpTs8fwaPkmNApogYsa5nuF8idNBNhe7l5AWn9aIKUQkiLy0Psp6OQ4TCpHnyiVx2LHjaW
	OmkzRKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAf-00000003oRH-3sqh;
	Mon, 08 Jun 2026 14:41:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAX-00000003oDa-1nVj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b7866869so51234015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929695; x=1781534495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86A87/9ws/VtdQEI7PHXUYpQ1ohvjyghc4NfnHpdryg=;
        b=g5pYo923o6awEhMulqQYYlau632IAl7+qZXvSn6yq1igw2KGD0lnGgsIrsbeKLUWHp
         8EAC1JKU8JyDa2KMGZHEp3W/McIMiIQlcLvDZEwfoU2fBBUE1+dENEiI1trQOFoZYEb8
         1HpG1tnp4AhwAusx+z6y14CF7ZelEjxHkKJStl0BJdUyC1r2jcgUPAdycQla/Ppt0oKh
         AM3iUfhzht4bXj36VipZ2eTWixh9Vwe6Cd+VOnVOCB8WSLfLueuz6MYmTVxORSES70WI
         iUdV6w/Wx/hIOxPBqYjVOaX/MqGABs21+Qhr1u9UlDNPx7RRf/ll2vVm0pge0I1MR9y6
         +2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929695; x=1781534495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=86A87/9ws/VtdQEI7PHXUYpQ1ohvjyghc4NfnHpdryg=;
        b=qzZ/fz9BGFQjZqwBKxHoK6u1FatR99QAspG/o+aeERIKqfe5yg8dk4zUdg9JzYOj4e
         KOT7gbuV/FHH82nIInwRkzz3J3sSN0UqmRY1IH7QHx4Sc9fC8XcCRW1GAOlPGd1uUXvR
         bkFOYuYTBNuE2gpo5SiP4p5A162oMz+604Lqt1+MRbdlIi6CnG44saXx8wPxzvoZrEam
         jQbgwHsMEnqx+idV4y2qFQ9ezf1Fq8nb0gHEg0q3t8wOfAB9xR8zjwqUSXAqaodtERKT
         Q8nJlsxoQ1L4XjcuTyVyTsogCCU0NAyM9zlJ7PoDZi4Zuthv0kgt3ZyQVGNnRtrrSfz6
         wwPA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZcheF18YDWx5r31LZ8m+uM2hi9T1MoJeS5f24qKMtJk3/OLiJJT7z6ul7WbvYYkhZ4XJ5tMh6DaNtczv5eD25@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz1wc9aPeixFxsdCn3YprNXfrsT85kTxFLukdy3CZGWYgvI1up
	JJnPyK0zP7iUG210cRm7S8YONkkpK/LDEdKBMFs/2XqXZE6PlGj8jZOm
X-Gm-Gg: Acq92OEvNYYSJCrd3L9xZcykGGy7/rsHWNc5pEkgbtAkiE893I3xFS5TB8fdXK50lcS
	u7euEwdsMWq1xRO9I7hI+oyw2Hm6imM+WEoKl1of72WVOd9Em5YFIlS48QuRteug4YCJsIhsmX7
	6bil8+x1QQ1rI7qH9V0Zo1hEOenXpcecjOTIQMWx8rZNWRoxHOFVoNVuW0deajYnyxs6xE9al9b
	nXoi/NfApdWNlq9/F3Lt61Q6tyOyJLxwdQ2yD358CcvjLjhdu91obY3mdw3g8n+v+Jt0TIgp33U
	gKCUYQuz+ot+6AtTEcH4TFf4PK22Tzro91jAzJa+0U+RzQIvOBv+iPj71Ia/NNxxLZfjkzbrXEX
	usI22GSPdJgjk8M5eQjWctea11T6xnyj1E8++6wRSiNjfXjdJ/VWawFmun/vpyyxwdar92bBp+H
	GGpl0W/mHO3PCJmyPcorP0pXexjpwOfih1P6AepaG28KaTfe08hz6lTgpD2gVa3ol9AA4h/LtFS
	52Vguz7VmIBNENTobgwr0ubzXEYz41fcijJuTcaxrsGyw+oc12FE39FY7Y=
X-Received: by 2002:a05:600c:818c:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490c25b39fdmr290218685e9.2.1780929695456;
        Mon, 08 Jun 2026 07:41:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:35 -0700 (PDT)
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
Subject: [PATCH v5 12/14] arm64: dts: imx8mp-var-som-symphony: enable CAN
Date: Mon,  8 Jun 2026 16:41:13 +0200
Message-ID: <8447a8d766e54ce8daf108caa28cd3546e4f4729.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074137_499836_953228AC 
X-CRM114-Status: GOOD (  11.69  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the FlexCAN2 controller on the Symphony carrier board and add the
corresponding pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - Add FlexCAN2 controller support

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 54cb5725c4bf..93dee9ec0b9b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -106,6 +106,12 @@ &ecspi2 {
 	status = "okay";
 };
 
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -357,6 +363,13 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
+			MX8MP_IOMUXC_UART3_TXD__CAN2_RX					0x154
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3


