Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B77D59F6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+5NR2U5/34qqCFR+0XtXIXJvL9i/r1BxuGabzfLAIY=; b=rmuEJfz4SYSBcBhZ74QVMN8ula
	wXx77YqQcMhzjsSJDjL6vWqLXJ2uPnGeCfPY3eTUiVucwR+kuAHaZF9tuHdeiiarjCiaYck22ctaD
	foX1MpsB1GxaXkDTloCySXYKgeGIKee5kx6M6bTs6bBLdUNFG6+TqqNuetv0GG3wVy/m6Nl9NTJKx
	7FIZ8NdhOnihfcYKmGDJZ/viSCBURaUdKr6FjkG0vtoIzbaUIzbwCanKRKIox5lCuxGD+XonIHUcw
	He1QgkbMHKPipCqD6GX1IWuSg+hSWGs2hVVeB5azAa3YExe/rr1940O+i4ryQuhTGbmzp/I3799+w
	b8/8UHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lS8-00000004SiR-1Pys;
	Wed, 06 Nov 2024 19:12:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lLh-00000004Rpi-1Pej
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:05:50 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9ec86a67feso14440266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 11:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730919947; x=1731524747; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+5NR2U5/34qqCFR+0XtXIXJvL9i/r1BxuGabzfLAIY=;
        b=SFpfiyEgFvqMgOsGQsqPVkFKjCdEINLNnXUAGJWsihHCnA+5pT6vUlGxm37xm/Oia3
         k55I7j6f+2BWQSzLRmSwvZpwnlaN5gdAUqdsxqTpNYG9s+szqX8z2qpYezmKSJd5mPUz
         HJYTGA2sLmCk0UqURX59qiUDScBwT95ApL6sr1rKMGnecrv7t0kauA0UiKxS0hN1QBwH
         c3GshAfzA/FR+1NftyRgDZRoRsdhSsHcjaOJAVEZGXtMPyPXI6fXPRmeq2IZDETPf++r
         W6wYw4S8dVHuwQqMcCwtnM5xFHCkNDzfxAu482fjFtwaMrjNXMkcwjTVafR3TO5d6tYx
         9D4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919947; x=1731524747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+5NR2U5/34qqCFR+0XtXIXJvL9i/r1BxuGabzfLAIY=;
        b=A1Yqy43E3PlyLXyKS24MRKepgxZFSoC1xtIjT1sDmkqaEaqXCXJuectckO9Fp2MjmD
         MWkMqrsQ4fOC2cRnudRBWklyh8zn0txUJyRxOX/FOeQnHSewV3ERLOpPXlkLW2/cCpaa
         ZQDbBDF3SnIUa9y8J6ZW9ZryeUx0l9D+h28+Q90VOV4gsXIZXbMH/WJvjpatb4mmFRZA
         8PdLTzch3xU5NzNT9PEcClxgbT3HHR2bHfYTLQRywn352oCZWYDq0ilbh0Npmo300gbQ
         wqrJ5m6UYJd/14KN6H03tJzQgoJxUC5jR+vIQq2moaKLJFoFwVCicBZK9tYMwZqcHg/o
         VDxg==
X-Forwarded-Encrypted: i=1; AJvYcCX1iCUp1WZxjHIwB+Zc0v8Ov5tw+j6h6L3fmo4TNvLgsIMS6ZqSvE47g9QMwT37yWylBZ0IS8JF4oKIO5Y1RlHM@lists.infradead.org
X-Gm-Message-State: AOJu0YxN/YDvPHMpU+Mgsbn8ByP12RRUE/EMoWgLiGNV+lQQJgvMdZYI
	g/xI3+Q67mvpGHecFDjNgNkf40utnwpM7iDSy5jI6fWelAX1/5gO
X-Google-Smtp-Source: AGHT+IHMS38+uM800veYM3G4kYpXl0kTf038ie9RlOC8+llx9LpFwQI7AVl4zPEa8IaSkRK5Oel25A==
X-Received: by 2002:a17:907:e8b:b0:a9a:714:4399 with SMTP id a640c23a62f3a-a9de6167a45mr4002316566b.51.1730919947162;
        Wed, 06 Nov 2024 11:05:47 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d6620sm321092166b.54.2024.11.06.11.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 11:05:46 -0800 (PST)
Date: Wed, 6 Nov 2024 20:05:45 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: sprd: sc2731: move fuel-gauge
 monitored-battery to device DTS
Message-ID: <2959aa8567afbef17337829072adce01158f00bb.1730918663.git.stano.jakubek@gmail.com>
References: <cover.1730918663.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730918663.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_110549_397308_B87DA506 
X-CRM114-Status: GOOD (  15.15  )
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

The monitored-battery property is a property of the board, not the PMIC.
Move this property to the DTS of its only user, sp9860g-1h10.
While at it, disable the fuel-gauge node by default and enable it only
for its users, as it requires board-specific properties to work correctly.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
Changes in V2:
- none

Note that the 'sprd,calib-resistance-micro-ohms' property isn't specified
as I do not have the board or any other source of information about it.

If the SPRD folks could chime in here, that'd be great.

 arch/arm64/boot/dts/sprd/sc2731.dtsi      | 4 ++--
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
index 12136e68dada..2d27427c41a2 100644
--- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
@@ -94,17 +94,17 @@ pmic_adc: adc@480 {
 			nvmem-cells = <&adc_big_scale>, <&adc_small_scale>;
 		};
 
-		fuel-gauge@a00 {
+		pmic_fgu: fuel-gauge@a00 {
 			compatible = "sprd,sc2731-fgu";
 			reg = <0xa00>;
 			bat-detect-gpio = <&pmic_eic 9 GPIO_ACTIVE_HIGH>;
 			io-channels = <&pmic_adc 3>, <&pmic_adc 6>;
 			io-channel-names = "bat-temp", "charge-vol";
-			monitored-battery = <&bat>;
 			nvmem-cell-names = "fgu_calib";
 			nvmem-cells = <&fgu_calib>;
 			interrupt-parent = <&sc2731_pmic>;
 			interrupts = <4>;
+			status = "disabled";
 		};
 
 		vibrator@ec8 {
diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
index 94af7700f3e2..b1fa817ece1e 100644
--- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
+++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
@@ -84,6 +84,11 @@ bat: battery {
 	};
 };
 
+&pmic_fgu {
+	monitored-battery = <&bat>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.43.0


