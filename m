Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD30C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZFGj2aWxZgDEAwEKzLQlupr/akFvJ5yEG+vj1Abayc=; b=FEcfm5a7mi0YCbXxxLi0cj786d
	k12sXe1gtaiXOR4a2uuhK/VPhLsQqPQjoxbVY95oaGuHg51CJfs800nX+c6OkpoUzX1yS6d7xscjK
	UOP/+SPQnbRnVhyzkSi3iqNJ9nIAYZnPJN4zedYfUcwZ3ppvYL2yX7LB3ckAqQC0lHlzZjs7nL58q
	iSKyLE+MTqI8wwYQEt6oOmYnnwMhDZc/lS3PsuQ3mw/3Gsz/IpQcPAogcGD5RZDIobGnekKDWV5eG
	1jLQAx9W+DmPKSPgWEGjo196LUtNVRe0E8Fpuo4hzPuMrfRePAfbuJZQIiLJLEOwNwkSmvLZlW24w
	cF6VEOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PDU-00000000kE0-0wjl;
	Fri, 25 Apr 2025 20:00:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P2P-00000000i8v-47F1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:48:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso1744425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610520; x=1746215320; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZFGj2aWxZgDEAwEKzLQlupr/akFvJ5yEG+vj1Abayc=;
        b=WyiFCyLbcsMQdJSE77YflG5O29pNwuMAN1z5f6n4bd/YZNRPr2ztcoOBxJYr5tS3V5
         ABA4CHDHc2Hb8zd6PG6iFHs2KG0sREicRua/tJm/EgMDNa4yQ9E9mbEqtRIz9FVScQQf
         odt1jneh9d948QLJ9olEpdb8fBK2Eqd3v00NWwyopKgnEEXFvf5K2323+veS68IQlDM5
         GcDSnavldFNqeG6VetUDlYVjVCLCHvMlIuxfcDbnISzME4nJyARaSFfQpHGI2cLuQpzm
         KwAdFUBIaFF3AMVaHWOR+ZSpzCZ6qRww7qi7EdP8rUiSI1tsd+cLhfIHX2A+RA6Q8pI6
         3MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610520; x=1746215320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZFGj2aWxZgDEAwEKzLQlupr/akFvJ5yEG+vj1Abayc=;
        b=oXeIJBYmFQyaPOJga/5JfjWieJ1+AinJm+r1hkxKUQG2dBtdVGDHRodwnlefVUq6ga
         gfARmMQRcnAa4AVlICXJjPIrJByiM9GNP5wxBm1102Z2MfPQvTtB8E59IUBMxrsQ8vgk
         ejbc6hW7tNxexGnxt4FhbIvj4aPAXZNcsBDjziMCcprU2qN68MR4dhA1XoXDshqNdZ4x
         Zd0B+U04NMhLkSFxPc/gCdRnj6s3N4KxDV2Qk55Ca/eDPqW+6lvP18yIPRV00KtmWvwk
         0oUBI4aZZj4cPLzm89x6pzV06E8Yl02Gic0mYP0+KaHGBo4/2st4qC/up8UGYGSaLYyd
         Eaqw==
X-Forwarded-Encrypted: i=1; AJvYcCWU7zlNoSHj54FiKmQtPmJq4tsckuzKojot9A6FZ5Qgp0/KTeyIpWHai06iRmgIT3cWCSyl12HeyQQfllreigC+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9svKRJJWkTsnC8bMFnnhYbCApXw3SuIXs4VharYZDLI3zdHHL
	ebfhUWVgISPtlVo7g5Lc5Ci662PCnpVhr1vsH3iLIR/7S5Eievi17nJXPed28aE=
X-Gm-Gg: ASbGncuVFM2lJywzAzheAfe1yDyOdHQfEX/vWg3ysVVzq/0g8iP9LUBPLUppS5KyNpB
	Pr6KXXRwiX7Abm9QZzehQcDtm4KyLr3L+e5t52J08XxIZgCA88Wo/g1BQqOQb38PdSGXL4xgA6N
	YwiTgmjVdXCNg9o0HT5sVmUrpgtB7AwBnuH3MJfrEw60DGEoNt5Zo7uMhYL7Y6HMj/XRQVqgJ2B
	AhYIDa0gwVrOsijrOOgaUqqZsYVlCBqLcsOuRs2ZlEqQG+GFcTcMBN2F9QXbBHlWu2fQlOLHeSP
	FlDoYPPWlRk+71vGqFlr2hf8FXDz2M+6036fGWXDWZJj+4B1qw1h0Gsv6bk=
X-Google-Smtp-Source: AGHT+IF5oStNUCQDQK4ELYhXSpBxSOJiVmnisFHwexItUkWhfg7DbrtzoUnP3ThWbKCt20qladK5hA==
X-Received: by 2002:a05:600c:1e02:b0:439:930a:58a6 with SMTP id 5b1f17b1804b1-440a66baaf2mr13261755e9.8.1745610520354;
        Fri, 25 Apr 2025 12:48:40 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm65922335e9.16.2025.04.25.12.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:48:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 21:48:25 +0200
Subject: [PATCH 2/6] arm64: dts: imx8dxl: Move Ethernet aliases out of SoC
 DTSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dts-imx-aliases-ethernet-v1-2-15b9d5cca611@linaro.org>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=y8pnuSypChq+EHUNb5MJcd+jUk2muea59ryDVeSyLLg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoC+cPtesFepKoFEuZUgs/iDcDESYgx2WEgl4L0
 tpj0FAlzHqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAvnDwAKCRDBN2bmhouD
 13AuEACOw+pS/JbW4N9z8UJ37VBYqyjU5djVsxOY7FDNUJuR8WbIaysb0KZ2ENDackm6iQPItmb
 EgkUI+1Fmr8Scea1IcHpXBRwcCNApOIBII2N2VXexT4SKMgyvMxNXIM1rKtnCeA35Md1M38vz2+
 K5rq3ENcolm8Z2JS1FVTz0zjqXgq+4Vge+p6/ctbGccHAZI0u+Ibc/yZaC0ykMuMX29Wfu52IHu
 Ii3qUYj4vtID6KwK9KJZIrvnGICfdPASxEyUKp3jI8wEORVkCepaQeAfP/9WRz0TUX2NdQY/eXX
 zCLoWQg3jGRDOeQWQRELtuut3nXzIP7vdt1Fi5VT5Mcd5BfInoAHADFIlDLY94aKv3mJ5VwHrQs
 9Mst794gjptnEHKGbeSCQ7A+P62uIEQbcD9MC1RfjzKpX/OeFqCr7z7QR1+C5FbxPn2O/C7b4Wg
 jhiz59fnHQaaxyk31Gh/SBAolVOkM1SBhlgSF/yGoa6HEFTpyjTcNk3acWbfQ+t31YT/mrF5K2X
 LUejbJYkQb086rYFZuoRHRWGJJU65qp9VfDMUfLIgGjvpMOhQ2NhyfkCFxsvlmbJd/r2w47jDGK
 ZuCMBblWigCZdk8LghZWWzRUg5fjdouZM5MGwl8fJgg87CRQ8c/C2lAKrDEZVSv7eBJfRxzDIBv
 C4khUlqWqXqKoSw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_124842_021381_6FC2EC03 
X-CRM114-Status: GOOD (  11.06  )
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

Ethernet interface, like other exposed interfaces, aliases depend on
actual board configuration, e.g. its labeling, thus aliases should be
defined per each board or each SoM.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 1 +
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi    | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 5f3b4014e1521eb2e226797c77d15951cfde3187..1e23ed3a3f396f65e11fb0e5f575f35aa3b1728a 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -12,6 +12,7 @@ / {
 	compatible = "fsl,imx8dxl-evk", "fsl,imx8dxl";
 
 	aliases {
+		ethernet0 = &fec1;
 		i2c2 = &i2c2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
index a71d8b32c1920bf9d73020ef48eb98fdbe9adc6f..a14cfcc15cd538c387bbdd325a8b951b00fa712a 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
@@ -19,8 +19,6 @@ / {
 	#size-cells = <2>;
 
 	aliases {
-		ethernet0 = &fec1;
-		ethernet1 = &eqos;
 		gpio0 = &lsio_gpio0;
 		gpio1 = &lsio_gpio1;
 		gpio2 = &lsio_gpio2;

-- 
2.45.2


