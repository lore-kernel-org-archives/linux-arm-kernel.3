Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA57C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hqSJEtRGvHAaCnRJ3OyhuBvW3qmYyS2JqTii9bOfg5w=; b=XN4oMF+8xFek9yswEfZGVsmo8A
	iXarM82qB7G3MwbSnVz+HiCW5cFgMJcidEu4t4FyMfWht8nZoNielUDUQebSJZ5ZjTR8aHQb72LMC
	BlMieSDXS8zMxr+6EyUXuNwAqikYDrQrnFRvAGV60sW0aQYuvpS5HFd1nPR30807mtjCWfkmmAeA2
	DHauqrSITkS7GIqoirrssHNqV3dkU3AviQ3uMiq9vlv9CasD6umPnMfffZruoex6LyoykDPjMEg5E
	Vqi013AYFWFAOONHASVvkLlW+zqNrA2mL3UpAt0a2HbRbPfi3+b4H9zHojNTWiT22G5ubA/GNhh3r
	YGFmBhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rD8-00000007kcs-3pzI;
	Wed, 16 Apr 2025 01:05:06 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4r9x-00000007jmc-0ej7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:01:50 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-477296dce76so52409101cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765307; x=1745370107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hqSJEtRGvHAaCnRJ3OyhuBvW3qmYyS2JqTii9bOfg5w=;
        b=IGayNYBmr1n8zoDtrelS52uPVWX6treGwWoUuFUfvuQWTN5CRKYam1QK5YXORUhcK/
         TrRVQDSNE8hME0pIhs5gmrcb4dui/tIIotAXoKqcdgFyXlNsubE40r8UQ6x5wBd5smd9
         Zc+FH2Fo51YWJGuGk9YqCu6BVP8Yp1i3hoLYngwNjFOLa2aQdjutPM6QD6UT1cdv9bZJ
         rvPI1jTd0TFhpFeIjaxLKHhG5At28Mzr7fK9tLxquaZXXPnZxRaMCxEWrJpYk0TqVutg
         ZCvpUcLxguVRWvz1Vx29paMI8epxSGPEGVug06vDeTSBoVfjrx38gTNhBOXWdxzvGIHA
         DPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765307; x=1745370107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqSJEtRGvHAaCnRJ3OyhuBvW3qmYyS2JqTii9bOfg5w=;
        b=TdR6oOjzEVsLf6f9H5Vr4SKK3iaIRd9nKDdCG1+m4jZKf9J+V4CtmjydvibVJXBFKH
         esDzRCKOGyq24ViQAVmMT/ENs6/Qf2JI1jc9D6dNPHpmhDJRYA4MfTK7GAKv3b2SqFg2
         u6ekiA/f+FPcdWRjMsNXbGeTTbfjqWyQgyyJcK41kSGEAsvDrXqCFtKTRGiUbGa0i/Bj
         PkKlbDL4mPxUUyhS/mr0QeYBqSffhQndq43ewPnmQdZ8L4Tzslr42g7TjgXSQwd/9YKQ
         AE13ayAHvdCmA67d2LObdiZnCxpPnSVLgvsSGOL3MQb6lOEKfSDPXomnrZ7KkEjGxvsw
         wzxQ==
X-Gm-Message-State: AOJu0Yxev4r/3hO1aaAyxOtjLBh/cpCqvfPy6XCv3HzumNVh7kXTIpU2
	OObSktxVjvatitEdLGm9Qqtgb65B4NSsuZ0eahaSpANkwxHX+rTuF7CtAg==
X-Gm-Gg: ASbGncvZ3sWcyXYsrYNCVAd6h5Or2p0GyeGuj1rtrCwcz8HstDsHVSTmbw+C787+tRB
	Zw4NgxlTV56wAnZwDRkbZzRwYHqE7+qFltEgOHDmlV1ErTdojyMJ5olBVsNCPdg7EvADlNcNqw2
	65sVf+nW8f5KMedKBT+bHIcbKALxIfeUm8I//kyXfBJslabaO0sRLe9FCnkMl+Jwcgylrl2QmNZ
	hR3itoLFiVFcfOq78prB11aPR/DQGWDPGZx/MoiAtkjiATk6CWeyLYwHa4vR3O6r5SccivIxUSL
	6oZltJvTxc2HwsDrfRBb4eU/ZT8PoZtetqbKHr85vOaxys/+ufvkYnUHlGd0y2IdNrbkO8PZ39V
	jw43Fq7BfQlNalEY=
X-Google-Smtp-Source: AGHT+IGokAkNgrA7P1lwPNLJsRHKFiTO0KpKLq4KAvL5j+NC4vnn7iCmOI5qeGOrYu0Jab+XyJo8DA==
X-Received: by 2002:a05:622a:770d:b0:47a:d51b:c7f2 with SMTP id d75a77b69052e-47ad51bccc4mr10217771cf.28.1744765306843;
        Tue, 15 Apr 2025 18:01:46 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:46 -0700 (PDT)
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
Subject: [PATCH V2 01/10] arm64: dts: imx8mm-beacon: Fix RTC capacitive load
Date: Tue, 15 Apr 2025 20:01:27 -0500
Message-ID: <20250416010141.1785841-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180149_210568_144C5F6E 
X-CRM114-Status: GOOD (  10.60  )
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

Although not noticeable when used every day, the RTC appears to drift when
left to sit over time.  This is due to the capacitive load not being
properly set. Fix RTC drift by correcting the capacitive load setting
from 7000 to 12500, which matches the actual hardware configuration.

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 62ed64663f49..9ba0cb89fa24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -233,6 +233,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1


