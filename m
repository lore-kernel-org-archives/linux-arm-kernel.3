Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2E6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYDNr8z0j6kvzKO3dAyJ0NuELH4gcjDFUxtK8W/MH+0=; b=Op9tCFzCfXODYmGxJz7pHxmPj2
	4wx3csZk7RQarY0YCcdmDstnxJOuEU1hc94cf92Dqf2BBkm/NE8MvqTrzoqZn+wg7w0Usa55s6oll
	kL/682tOM1PfMKD1EKBivrOvifoVbHQfVkNm+tVzyQ4mBiJPoU/JLN+h9wbvxjsqIZ0HtejMNamLP
	Mz7X7zqin9XnhvVfEOrjVtt46etazbkwq5M6tKaIMlL3gM2+LXvc2YacLIbPMV8KrSAV9WR0e4n32
	ZfVUNLjrfDeuhU3q99HQ4tac2k/y1UuE7FhRYzKHGyeCE4h+mO+EWFGd5FHnfWGhP6CeeZD2goS+y
	k6TTk0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rS7-00000007nLw-44iW;
	Wed, 16 Apr 2025 01:20:35 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rAD-00000007jta-0dFS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:02:06 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-47686580529so64836331cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765324; x=1745370124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYDNr8z0j6kvzKO3dAyJ0NuELH4gcjDFUxtK8W/MH+0=;
        b=J03gKrfrln0v9kThoUaZcFEjX7YPx11SwqGooMdXX5aVr8TyDh3JEHUxFDAQSQEKxP
         Seg6V1QMWv/0UOf+0oIH6nocYLdm+UASv1tR0TSkd6We8bCs1QoIliSGx0+cK3GmY77L
         BOIrVwnV1OrvEW8dHOQLEZ6L7KjnZOA1jjdCr/zgl7EQ8pYVZRCwGKxnAQiOj+GmXQ8O
         4V5kefOHbYB2OdlOX2h+FTPPW5/taNEIjBCgvKhxpLkz3iuE9xvLEFRzRC19OdIdrwg8
         CffmmoclgqcsOos/BEXzTiQJNdcr3ypeXblLoKJwcEqfIXfMAqfWK1rm/0AUQQiMxY63
         RwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765324; x=1745370124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYDNr8z0j6kvzKO3dAyJ0NuELH4gcjDFUxtK8W/MH+0=;
        b=Ida9SdALTKEzFlcq3NEgezBHBIcJzyV4B7kF/2Uw8+Rki/p58azU94+M0nLjS6gkIZ
         2CLSMjnGk5p1rVVU1DG4rVodMIvy0Iu+ncKUKWxJf0RdnwaDs7TYmyJODQGgpjOJ6qxU
         cTTvv7RDTlj8gdaDqlNNj+hKpt3ZW7BQHvhRA3+QfKpXCt7QHYMjvehR44rAaogCzgXH
         5k5+qM+LlmBAtUxrDCbdGLCXSzOlLN7dIvuFl9eLxKHpv9niiP3GebJzJir9pzSqo4VQ
         8R4eUXCBXJ47TGinJ9zbsbJgzxCPN8F8f4EguKVpdlKFz64ItIMNL3yFMLmcVPOAkZYn
         XmWQ==
X-Gm-Message-State: AOJu0YzyIiAbMLgCwVqf3TtFZxyarlLAZJiGxYwYoBagxV3w6eo6kuLZ
	j2L/97p3J3J4tq88IKqokpGQMdJxn22wniYCPSOCCNabNKmXMpOiAvGg+A==
X-Gm-Gg: ASbGnctKNRTP/bZkVf2PN/uLHQjwmovRUVpqDR7NYn+iS5y1Hq/JSFumARAuq3ol+Ut
	0+FP74hPR2O+lFWR9R+r3QwNnbdXWM3l1UZyqUw3EKMYyF1UacBzSXuaQmStS75fC2ereXLYq88
	hl5NVz2eqkswizB5Bqk6bg5k5SICw6oQ4EFs3WqCSgPpnjXJ+OJd4ssrDY47FCPzOHyav0Ag80C
	zZX/aSleqL9UEevr9960yXTGymVH9Dlm/Iz1FUPk6dgJ/d0/Whil+AVOFAWbE9RyHlNhQD5P5wE
	JSS+V3GKOU4WhAzXag7lJg7KbaJXOTbm8Eg9L9tabbd3S29b2JcjvrSdHuBqkWEmB6JZX7abl+Q
	W50m6KD8Yi/5iuic=
X-Google-Smtp-Source: AGHT+IEepn+UeOPUMPtQ+Vo5vkRhE7eJ7bdIjEaG8YR8t+Jzk2PtaJNwLyufGdL/vXQbzGFnzLR9Qg==
X-Received: by 2002:a05:622a:18a7:b0:476:a90b:986b with SMTP id d75a77b69052e-47ad3a40319mr23332801cf.28.1744765323709;
        Tue, 15 Apr 2025 18:02:03 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:02:02 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 09/10] arm64: dts: imx8mn-beacon: Enable RTC interrupt and wakeup-source
Date: Tue, 15 Apr 2025 20:01:35 -0500
Message-ID: <20250416010141.1785841-9-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180205_188299_2CC29B9C 
X-CRM114-Status: GOOD (  10.65  )
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

Enable the interrupts and wakeup-source to allow the external RTC to be
used as an alarm.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Update commit message. No active changes

 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index b3692b367a42..987c14d3af9d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -245,7 +245,12 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -365,6 +370,12 @@ MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1


