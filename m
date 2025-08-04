Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4D7CA0EC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLlT+oF+y8eGG+KGSJRAGU5NF1zSKfS78wOa934bYI4=; b=A7jQxwg6jTIE2CYIXaZUUPsRUZ
	GMVfGFl+NilY5rkNRyqCewjeawiDT96IYfzmsLf8eDNsaSK9vMfQxRY6Y7hooOJRNVxVlUto2yQVK
	drK1RYfU7XQ5PXaqtOcbHPqg7qA3qjIDvwpg0r8DnBU0Mvj99BWVoSUE6sk0Kg0bT7K+RQLCR0arp
	VEOmNnyHqB1fHGj1FzrjTYjguCXYRE+W+ufYZtZZUxlO1PB2+psHjjsxhUBO5YCwnU2vvoHq67VGo
	XNrxUm33GWekwGFqlw8baG9zZybieZfaT6i/6m7N0I1O2QP+v/de+KY8Q5Fhn/SiPw67hhrcAyb1V
	4KkROP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiy1Y-0000000AyXj-0eNV;
	Mon, 04 Aug 2025 16:26:56 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixX7-0000000Atwu-1dDM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:55:30 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-615756b1e99so5177096a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322928; x=1754927728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLlT+oF+y8eGG+KGSJRAGU5NF1zSKfS78wOa934bYI4=;
        b=TQ7I8I9TZIfZ/jJHqjGgk/fb/0/g7TweINbwz82nhPkD9Z3xO2+/EvMmuxeBNaQCrK
         dMtBp/kHCc/dBuDYMNcXAp9bDdvUmtTOxu6mpY4P9s5DmBMvanTPLQyJYZ63ZZqSACpp
         f1oYKfbGigJiRXdp5fOAbJ6QVXJwUkPtig1Flvuh9ZvYwmo8pqo5EibV7LLfYUQJU2Bo
         QKmn20/rIGmwssOgpyQcaIlx03+dYMcmrZZDOBXw4sDTcYimguZYsDLLNErxqJV+3yek
         vOhP6Wt4iiHvmzph5v6bZdPBSjhnJsh5Henov9+NhF1rAq1PAfkWHysrmSX8gHmvkdyH
         K9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322928; x=1754927728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLlT+oF+y8eGG+KGSJRAGU5NF1zSKfS78wOa934bYI4=;
        b=ACIdNfGTlej5bSspiEcX6/wtZ0jan1SZQlL5Nx3Qf94JXGCQUiu7jwK0vip+mC6/ZB
         F8VGl24qukV3X8x6ss7qOA8ZZnNVnLOvfaw6SP9d585I5qZPoM1Hby4sg9WEEGqtutgD
         rMZILX1Ba3ydFN27wy+YSbtX2706TcdxcHCK1fObYHUO43NrpVbMn0PrcR/V2hBVa9f9
         6K8DAJ5vJV9g0U7rDtcFpQXzY++A3h03dYZ68Y7aELpPIfBtkMdCArgkNAkBb6SmVO7/
         No2N4VUiTS1GOVHJ/5A6qg/oZYTf2RT0wbXj5x+EcpresGNt2too03k2gifqYaMPbEUO
         JA7w==
X-Forwarded-Encrypted: i=1; AJvYcCV7Vgfrj1Rdc86q0YcJVG1IR04YnuUgOrWlLyOUcwwJPCkrAZ6Q24C7/1HO/fmdeJeOPFy5ZkTn4FpzJ7kz/15B@lists.infradead.org
X-Gm-Message-State: AOJu0YzJnxXwXuKeuhg4AYqA2ed5brH8BgVvI+OjrkR4uL0bYOzafWOZ
	v+Ut6OTXgQQm5u6GQdb7IVdpj0hv9b3ZuCkCg+H+MwEyDZSRSyEyv/Hz
X-Gm-Gg: ASbGnct3mlyGPKdsahwE3ZK7S6lHTemJ10AOF8yB0AluNbkRHEpuKCfRDURZIOr8mzv
	7eEUFsxAHHmKXXar6aQO60QWBfIW+t5n00GYnFXIr+w8p7KshDC3A7Ta15KgRw40Gt/dRBdJj5p
	9c/97LeCkPar7EdSazsFrcm0fx3SB2s7a10QnWKA3LHOAmU392dVXaIeDv6qCQHIfpvanpbOJe1
	HaoGXbFhbms+RLXo5OFCq16wIXD6avjkXbpis412m4DV3B4gMYmgXxJAGkVT+Z8OVY/mWpbagBS
	DItHDDctUCYPLd3lQ/RU8FR2ykIdUcTwshWLROfhpamP3H/gv6fsc+KA4ES+JMvPKwBqJKtp+Y5
	o/1gT/g7OWs1rfa8Skqb5bIKpSrSKbHoiv6MfC+P5dENF4Z5bzvMPQo/erig=
X-Google-Smtp-Source: AGHT+IFkQCoHBvtFXtmc6tn7x2i+nDP+sB5y4q5vfMQOe0tSDU1cK5lDy/Byu6GA2X7xwsf3VhALxw==
X-Received: by 2002:a17:907:97c5:b0:af9:3773:8232 with SMTP id a640c23a62f3a-af94001e6eamr1176790666b.18.1754322927566;
        Mon, 04 Aug 2025 08:55:27 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:27 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 7/7] arm64: dts: imx8ulp: add sim lpav node
Date: Mon,  4 Aug 2025 11:54:07 -0400
Message-Id: <20250804155407.285353-8-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_085529_455459_CD2D68EA 
X-CRM114-Status: GOOD (  11.16  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..d84f50d8ecc0 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,17 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav", "syscon";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "lpav_bus", "hifi_core", "hifi_plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.34.1


