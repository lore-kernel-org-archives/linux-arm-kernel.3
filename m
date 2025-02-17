Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDFFC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4wD4WIcZmxg1bV/511uzbm9dEqsTwVeyjkL26ur+v0E=; b=nbm7jSqNZJcMRDHaHw+4RmmghZ
	O4Zz2OwlIhLo8O38U5ySpROfPZikLI6mRkJGznJm4Hx8/riwK/CfLzO/dG9lRU8ZbMZsIXPiex2Pz
	jfnmyPLNBexER9MR4mwjda0QYcswPJQF30mDCjRuwczS3e/GPVg1y0QSkrm4ZwtOZCvrYT16vnS+B
	BoWgWSnnoPTLelp7D0e4FU9ib1NxrQJ3iudteb/3ha8gWljfQHOL3TMPzNEbuHnPgJAQy6FDvgzNk
	RBHuD1Y0yWVug1KlgZAx9kUeigNJjkba3JHv5/sSKkYTUNJ1zKKNLKMlL4JAwZChFDTCDqOqkVn0o
	tA7xj+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0G6-00000004SRg-1CcJ;
	Mon, 17 Feb 2025 12:29:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzYv-00000004MG1-2NzL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 11:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4wD4WIcZmxg1bV/511uzbm9dEqsTwVeyjkL26ur+v0E=; b=Rs1XDXhSuwgYaNd83PzU3lfCNw
	nQrMW/PEvmq5+5xWou+xIfprv6C38ntRTM/0LZXxTE1bdjFQlA+hSf6tP06h1XDNIQn1TXmm/ysgS
	xLCWqe/B1otdSTwsLwUjCib3rM3h6CvAF6P1BLIgY9p2EHe/v3LIPG88OyXC0egz6GYx5cSEmbxO5
	4S7sPL3hPky5QGhPFxMadDGAEB+T9UU8OyLvRUy6z2qTbrIEKPXKM/NHvfznrT49BNPe04hbon9i5
	EoPbUrwE5c7tkztgFSF73AjWBIEH7XFm6ARFsltqQ7b/lrls6V/JA9qbMXdYrz/yAM1NxKjb/11YD
	c7xZ9VFw==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzYs-00000001nzZ-2CYS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:45:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso2074269f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 03:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1739792716; x=1740397516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4wD4WIcZmxg1bV/511uzbm9dEqsTwVeyjkL26ur+v0E=;
        b=eBmrmnUDwAAvkiuyD3YbmJANqCKtjIV24lzxY1MkVfu6fVWXdn0ta4rDhrCkAjzJPU
         YUR3LErze3KedeUlZWThhiUPwb63OXsgc6xJk4/1OyemdfQXR+9z6FvwOya76WNQmxug
         YtFLsczQ3ychaby/osVn0Um7Q+6gE2kGBy+lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739792716; x=1740397516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wD4WIcZmxg1bV/511uzbm9dEqsTwVeyjkL26ur+v0E=;
        b=FeCJdkxECRobMNCCeJGOyyuUOOJ6aNeY1lGVVe0MkkXgrhuajOjfYNVz/l3AElpyQ+
         lHruW9fy3dziFUIbgWvGXY6Dwo6wFYAP3p21WJm+9LsmBWkg7xFox4ORmZ0qoLrncvqh
         Y7UFg6W4whlJI8xUBiNSQKuQXJIoYN/KhLfFLoMLF9LuvArxGNrANCLox3CchdHpxdiU
         p3U70c1IoNkSEj725VpCHj8SXJ3uNIxbFJpU3mwGwt+FZKs1wnf59WhVFcDrKfwIAkcu
         m/eA2YNTCUwVCAnVBB0k8s41QYYzdp2/8Nkk7YpomhomTbrr/rixTmR8DmT88qFbLypZ
         ZyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVJ42XLfBLQhMheq1+anoWvRsoex0TF0MJZeGBOb8Fbts6hWx+4r/BiNzm2tnruBkcB2rqOV7wiAGU/ff9USGd@lists.infradead.org
X-Gm-Message-State: AOJu0YzQcWc2R72/8I/ZrDF8wGcAp2YZ/XCRet1A7Ew8a1rhJxf6R5fB
	lttKy5iPrv89OLQEnyNIerg22pLzvwIEIxGQ+gn53exj0NYtLHS/tQ+ooDqdw2w=
X-Gm-Gg: ASbGncsa2Pk2/3oQXZmFSQTZDrT0q+HE1qwuHnYrJVtP4r4q/AVEU2ngfUAYjNCDDG7
	QBxADbtj0q9fgoi3AcxEtRbjf5uLuM0/TnK/pdKSu7tp2pXyDNrMJpo8oFj1n6DkgmfMIG5SuXd
	9dlq949OUZsq6JUcjfMhpjRx2xZT27RXmfky/2og7Pr5ZZr4Bdt26uTbVp57WIBrE/JrnQ8rdWS
	F6o2u+Cdf/u+tRFV3W02Q3qPRTfMVv+6PvHXoj4KAYwD0ThA6RtI+3mt0oRZar8nDLgRAVTHC8Z
	0MUEpAfE2V1oUMDJNl0UU/5ZpJbByJLdYQuqem6cE/2GK1/o/TbD5aueZlKvDUhGPkw7EIwm7HM
	poEThUDXveTI=
X-Google-Smtp-Source: AGHT+IH4HZR8AI05mEm9pkEq128S5TzlgBTTQQpv9pmG8gm704yEZzj5BkD0hyM6Bc9Lk5oPYaBLNg==
X-Received: by 2002:a5d:470d:0:b0:38f:2a49:f6a5 with SMTP id ffacd0b85a97d-38f33f271c2mr7154894f8f.15.1739792715727;
        Mon, 17 Feb 2025 03:45:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:78d7:ec72:38e9:87de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbe0sm12181637f8f.39.2025.02.17.03.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:45:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/2] ARM: dts: stm32: rename LEDs nodes for stm32f769-disco
Date: Mon, 17 Feb 2025 12:45:08 +0100
Message-ID: <20250217114513.1098844-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_114518_702533_41853945 
X-CRM114-Status: GOOD (  13.29  )
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

Associate the LED node name with the corresponding board silkscreen for
more precise identification. In fact, the board has a total of seven
LEDs, some of which are user-controllable (i. e. usr{1,2,3}), while
others are directly controlled by hardware (e. g. power, overcurrent,
...). All these LEDs are either green or red, so using the names
led-green and led-red for the two LEDs mapped in the DTS does not
simplify their identification on the board.

Moreover, this patch is a prerequisite for adding the usr3 LED, which
has not been included in the DTS.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f769-disco.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 52c5baf58ab9..d52e36aedcfb 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -79,11 +79,11 @@ aliases {
 
 	leds {
 		compatible = "gpio-leds";
-		led-green {
+		led-usr2 {
 			gpios = <&gpioj 5 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
-		led-red {
+		led-usr1 {
 			gpios = <&gpioj 13 GPIO_ACTIVE_HIGH>;
 		};
 	};
-- 
2.43.0


