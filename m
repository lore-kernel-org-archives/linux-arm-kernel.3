Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7D1EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfA/CbhDb6Z2fvP1pbOmphPSTdUHIDS9WPfL/3T4NWg=; b=jFWQG+Aeku6FBR3IC7roex5PD1
	K/W26Nj7kR6QUF6t3evSzN/qzB3++VULYWlLg2/g8NxoqHGjF3SmyPbgJjud/3ZkINP3xmOPiw3As
	yw8UUiT0Yq7je3G86exZWrer/g5Xlm4SEXPWmQGcto008gtksFcsjgqzKlJ24Dxh2YyqWxi0CmbR+
	b3XFmf2EGm79axSf79JoND9MGvnk8Nz7w8bHk/UkilzmnRxqwzoYLo0K9V7Orswj4rGtJYhKfW5Wo
	aLp+Jn7p2923U68G3EV+C8meFS3sJLqfDSF1VzwyyqA2Jo0ynar1jBJ0cal/HxX8eB4g/FoNh3pHt
	dK0xJnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bD-00000006Yqe-0yDM;
	Thu, 01 Jan 2026 03:43:43 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9b7-00000006Yor-3GWI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:43:39 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0d67f1877so145344305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767239017; x=1767843817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfA/CbhDb6Z2fvP1pbOmphPSTdUHIDS9WPfL/3T4NWg=;
        b=iPIOCCqhAqfQX+0k4x2xak/ppM1M+Iahe7NGD87GK7caooH060ZQ+UlUQpo+nFRlC/
         hjRZKdnnLpv580mcl/lStiuOCBX3iX8YD+xuY4UsDBn4OG2v7w44140Iyud79FBrUF0F
         cGT9cFbcWG1LjksC31aE0ddikZKYGnIQm5oJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239017; x=1767843817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CfA/CbhDb6Z2fvP1pbOmphPSTdUHIDS9WPfL/3T4NWg=;
        b=YtuR9uaqoTQjSa5dD4Zi2BIfXcgGpER+4cfiti8/GIdum5trQbykU5yuVIPKbpFhKT
         KSnN7ZrH7zfaVv7fXQD/hdPzsCEzgttBqkSspQ8Ya4pZ0qg0jiFFaHbsFr1SirLKYr0c
         LzuRlDKlzN4mXLpH75zxiDFF3BDnd9EaPuyQDKCvmzKeRKfuH7TlFV06X8MHPxrsbFvp
         ScTBnzcxXa/xypN4FZQRVPC63ralwLIH9x8EHL5RnNwg4iXcuAN96vZMZ3rlJQcsZibl
         x8YTJe2WHd+NwNUKT2uMsMAPuFqwG4JBigho+b2LQTnHsCMFQp8to4pP/si52luxuw16
         70bA==
X-Forwarded-Encrypted: i=1; AJvYcCWxnRdWkO7IZOJFrPXF6joh8JkhDEamf+Gj+0Da07exHnnKLSCHZysRpi64IZiNWHJnB1+jqUyQhJDhfkGzSf6u@lists.infradead.org
X-Gm-Message-State: AOJu0YylvgVKtYWRllsCirQacwK2uCz1DHH3tsbGrsHzQJsDBTG66ueD
	/4FokO1ZEwxR374RvNu7UhMVnwhkEM5NEEUhS+T6erDTHdcVmUVIKC8wyA1kScNBHCQ=
X-Gm-Gg: AY/fxX62r9f6F0aEuSm5s6E4znrhfEOXdEHVpSsUK8UWZwugasy7NaiZQOhSwt4VDzW
	4CDIhuF8l6VMP9d6VpCog+KpyWMRZTog61RYVjW680YZjV0CjGlTdmYer3JI/6T5WcqVL0xcCbW
	zneSd1jPsQrJVG5zFLxa2B0Yfit2ODrLOdW4mDdzEQ6g3oDB0E6xDy7U2z0OMrlkwP3CAhKSxor
	kErJZUcVfakHLU9xsXmglxk6Be/uQtfbpgeucuPLAMU8+PETxAZ12LzdTEPWykntiQzYPK8G7DE
	FWJsQrfEOMfxl91aOUiGgstRrjpgZhlZsym8tQktZqRjG2DHyVlZGNM4YMsuAe8ijMLgy8zYJDF
	yNSa29C26aQ7kEbZWZGDw/jzOib81acrzenQkJtlqcwgE3DFvvhjBdEwjru78v9FlbNyrjJmq7Q
	4o1HVefEj8GGRmSDTYYsGDYaNpaGoN1D61P+pvuDzLsyGDoEb/ac7R
X-Google-Smtp-Source: AGHT+IG5ivYwNnKALjPqDlmOWulO/0XSWhu0KCN2LU+ZvUE01qjlIYvbQDaQH4x2zBE+8o5Ohayqdw==
X-Received: by 2002:a17:903:3c6e:b0:2a0:c1e4:e25 with SMTP id d9443c01a7336-2a2f293bdc3mr356242205ad.54.1767239017029;
        Wed, 31 Dec 2025 19:43:37 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm340437965ad.33.2025.12.31.19.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:43:36 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 4/8] arm: dts: mstar: breadbee: Switch from "activity" led trigger to "cpu"
Date: Thu,  1 Jan 2026 12:43:02 +0900
Message-ID: <20260101034306.1233091-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101034306.1233091-1-daniel@0x0f.com>
References: <20260101034306.1233091-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_194337_821618_7D08B88A 
X-CRM114-Status: GOOD (  15.28  )
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

The activity trigger exists but is not documented in the LED binding.
A patch was sent to document it but wasn't accepted.

The intention of the LED is to show if the system is busy or not
so the cpu trigger is good enough so switch to that to clean up
the warning.

Link: https://lore.kernel.org/all/20210923065500.2284347-4-daniel@0x0f.com/
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
index 71da10d9228f..0f03f471a344 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
@@ -35,7 +35,7 @@ leds {
 		compatible = "gpio-leds";
 		led-red {
 			gpios = <&gpio MSC313_GPIO_SR_IO16 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "activity";
+			linux,default-trigger = "cpu";
 		};
 		led-yellow {
 			gpios = <&gpio MSC313_GPIO_SR_IO17 GPIO_ACTIVE_HIGH>;
-- 
2.51.0


