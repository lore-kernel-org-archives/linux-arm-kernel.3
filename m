Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617C2C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TKxWTtkSqxwzx6dDc4iUz9ohfHIlpkY7Ca7ccTsz/A=; b=vSc0PaWTfWPhFZq8xtQY0TiZrM
	9mPktmnK7Guc6DP0NfmJ/Wvz3xUtBtWabKanMGwydi2SkhWqbbuSH3UAmnOO7xKg3lXzmTuua2KNU
	9GwxI0Lhm/Z+JGyp7y/IR5OvGXNKKhro/aiWgaLWAOBYtvkEG+AgqIWgDcOCr+TXZ9mijjK7F9nqf
	6tDkbaVYj8kGOeDwyxObRU1VVH6XwZhzGL2jr4nld/vJ3s/yHlunoer1fObrpluSEcugz7kH4tDvT
	yfSR/L5Ery29ZjBxHr0ofzV1DdZMySlD1BOGnsu3HL6nflMCnR13mNY+K+DG8yQscehghSFdsXGCD
	Es5dawOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYgB-00000006eHy-3PVw;
	Fri, 21 Feb 2025 19:27:19 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYZ3-00000006dB2-1L8b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:19:58 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab78e6edb99so348574966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165596; x=1740770396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TKxWTtkSqxwzx6dDc4iUz9ohfHIlpkY7Ca7ccTsz/A=;
        b=IaLp1VD9TsOnrgnVMxAhtvNnAxLXTyaVeKko5naQXKsGZ+Jpp187Nh+AI9YWl8t5+v
         /1GilZ1WZCmF+8RK3QMTea2S0g4GDVAc/IoZIFgaUz4/aQG5qqxFQuDlb4NZMmVUez8o
         PUcZFfH9xSDBXo3t6fSmewqJcVyqTT9ktzPCFe9Y2Mejfi4CvdVau0B+CbiUuhYRMWUK
         9Wvg3BGuEudoSlE4+hQo31kDJ9mWsqENkW6Hy6Tji0yeIasJJdV65UsE8kWqFCjCmy3t
         2zysxejQg3HkRT43JIiHAh2EKzi0vn2SXvIbeyA+TxFFcGSMoYvZRrmRTsPC9ls3ChWs
         uSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165596; x=1740770396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TKxWTtkSqxwzx6dDc4iUz9ohfHIlpkY7Ca7ccTsz/A=;
        b=VWajZ4RGDuC1EF0QkO5lLBoYoJ8u8bZGC5fjWKLAlFsale9a+v06LsBwuM4tQx06h4
         peHqdINSwaZuyf2zAk1u7YKIUKB/MdGb5jY/73klqi1uALnTWHRT/EqzpJFLXvc1YZeK
         5Uu1nlVChFTkdd9F/UIHZtOjTL/YsaDn0dNPaAIc1huQUnaEv4W2MXuIzI1CLlv1t0FO
         zt7Jc+CcSMmm99nnKyxBdMWz2VNnGa+Ryt2M5UyNb+BE2hJ/qxJ0chFve53sCeCLNG8R
         IZAuYTkFePAsGG6XcIP4vCINr06U3NSpsVD41b6cM0CLktp5D3iiyRFTj2m52RD9DeV+
         wwIg==
X-Forwarded-Encrypted: i=1; AJvYcCVLBx6G7cnb6stHnn4uSIKtWBwHEMdaG3UmIB7NyvFmVxDHOjc0J9BTpM8PDcmZx5L0Z2Vr+HtFkNHFnyBFzwyl@lists.infradead.org
X-Gm-Message-State: AOJu0YzY1Nks1oGk8Scs33GdVEJV4ogW9yAX4vB38dyMl4x2HlWhIKGt
	UBjz/UUPyapaX6Qy0CiCVevwHfVBu+3cZMAXRhKFhznyh3iU/m1m
X-Gm-Gg: ASbGnctuGU5hx6Ym3Jo36fSJwIw5pd+7USDRKiItu9dHYtZTzkBEcamvdEJh0LEdzTI
	BvVzceikhTfRc1vnhjrWpEICgTvva26pIAwK2K2xaWoRpDI3mxJK6Ug9w740xZ0YeeYxV5fUWFL
	1M3z2ikLHG3OjvMzTl3JlfOIoV4nQiZo8f+eT/M2XD5aD3OC6m65rdLPTaXYDk3bSNmxtf1Txj6
	mbd0jvHg3+8dL1lqKYo3g9SMmdxdUE4e9SWJv146Gsb5F4K20bwkg3S6JtOS2A15yrJac9fjtm3
	5ibPJQ1vDvuGY2DMw04B6NGE+nXasbcB4XMAJ7KMkizVmfiot2cnKyy6At4=
X-Google-Smtp-Source: AGHT+IFDfbIPVZIMARA0RdhZrJ6UuY0dVTRO1/KxreNJ+xkg/EYBzXyrYM3lqR01Fe4RA0v/JrznqQ==
X-Received: by 2002:a17:907:2d08:b0:ab7:def3:ca1d with SMTP id a640c23a62f3a-abc09e44f67mr482288866b.49.1740165595692;
        Fri, 21 Feb 2025 11:19:55 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:55 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Fri, 21 Feb 2025 14:19:08 -0500
Message-Id: <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111957_361970_1901354D 
X-CRM114-Status: GOOD (  14.53  )
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

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..a1d9b834d2da 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz", "simple-bus";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#access-controller-cells = <0>;
 			ranges;
 
 			spba-bus@30c00000 {
-- 
2.34.1


