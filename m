Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3498D31A33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=raSq7QGEUhVHtaVWgQ9mKoAQ+G0ozyI9AkFxNN8FvA4=; b=l92VdxfvNeFDUDVMCTgti/JbJd
	eDg1hsxiTNqtvvKtvrNtPjTH7a5i72SL36YoiVqAKAmqLata4lncer7dQqJSHr6pSqNcfrkG10ZFA
	wubGnaoPTgR/6TVfzTL7NX4878cFDH0Iqwc+2mY2yFCp5x7apQ6TSBt200Rqq27MgRWJjM/yqfyZ+
	+nbLf3/di98f+EpOaVUL+9jrWIUIonc6bEpoURKa34Jc3yytFhcezgq+PoAzvqjHIZZc7Ap3uwCk2
	LJCqBLvag+FE3F9P017cLD+8JlSGgZgECFKG+mUb+GLipS7iMGtaZSN0X/OHI2qrYSEXtzx14/gyR
	YWEyITTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx8s-00000008XUW-0sTG;
	Wed, 14 Jan 2026 09:26:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx8m-00000008XQn-0DtH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 09:26:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-81f416c0473so3076842b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 01:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768382771; x=1768987571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=raSq7QGEUhVHtaVWgQ9mKoAQ+G0ozyI9AkFxNN8FvA4=;
        b=NG0EsgvKlozywlleFpi9J0Ndw39tgmMY4bxidXocwVqToK7Zoycu4cmjFp27bo5pug
         Z2UBUgRP+3/vRJeFzoFpX0U8798sOpWESD0weO3qC+hDScuHvg7AC45Ml7+fitDAz7I1
         m6q2zmfH9mw2u0LVSSWgUXHmHyjxTnzlGoI7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382771; x=1768987571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raSq7QGEUhVHtaVWgQ9mKoAQ+G0ozyI9AkFxNN8FvA4=;
        b=MrkDs78W2mQhUm2dhXKDUGsBGQKNY/32QrGFlakx+8c19pZOjCX1+nno6wVygl7Wnc
         hYNU8wur5YqloD6/437rEu0TKNk1Gb7o4w0mc1elTYzcX0Lb7I3g/ycBQIrdxMf4bxSo
         G0wTZzIAVN460RvNY57gn+EfxY/sfEiSUPaGAGTUgjgsD0m5NDbUUFC2hsbZwR18PR2I
         28uIQ3ZT/7RSfajHWNnKWV6F4lhMH8n/wbWjD1cTHCWrV1TI66ENSlidPeO22DM0JUzg
         rEryUWhABqb/2UxJXSk99YGqSGYwfOq4+UEUBsQkEeE+BKDQqBgvxUx4HwmUPgSjuTX7
         IqFw==
X-Forwarded-Encrypted: i=1; AJvYcCV6dntbe8RWDJeZo1ZxXIMWeh0czn4QtyTFJB3m0DQqaxqyge06KNjHuMxFBeJXLb+vQXU1LnMzodx3kQuh1lZ0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd4/wyWeer7DevUNxyBRO8AD8ZKTKDQ557t1j0E0/GrPGpN1Ye
	65LAalklOCrSkJUChxmM6PF3EdVC5RvGwn5xKKCNPlI7TfCKBOe/Z+T7+rywg5pSizTheub7ozF
	Pyjc=
X-Gm-Gg: AY/fxX5oOexwZ9SG2aNN6yQxlpIyxIVwgxvv3DWWGNmM2xMOz4QHrrhz0zfyXoYHmH8
	Zg/cWweDGVYdpvLeH3kn/EDZH7zhhPw24i+j5HPPaMxbHo2xpJX8X8xCQJbpGW+FdJI0o+DkNie
	NbzbnNL7NA4xwoJtsISKpXy4CXCHAwlNM46tz+rmca7CFM3n2zwGn789u5aiBf1mOk2dqT9fvHa
	iKn23Te24rkYB7t17HS+9Krp7dJE7bRwhDvSRa+Uw2hmhczs85TRRGXktBf/XqUgsYmrhtJWYSx
	H0sProCUPD3RHQao5aoLiRAhRLZSEeWjd4kdBNLC4R9UuhXd6gArYE+Og3bECxr/OnOIzElqqGc
	ZIHxYM+Wcq3xLyFWLbqfCEyXEyumR5qAj4Bg7lMbPB0eVnUayV1R+4A2+J+bV75l5uiMc9Vccfs
	jAoX0qFiyKMqsGrSv9+7UBFecQBrIOQ/fCzUKCRVoAdZlip3m5IaaiTFuIsMrk0FH6IgWh
X-Received: by 2002:a05:6a20:3c8e:b0:387:5daf:b302 with SMTP id adf61e73a8af0-38bed1f4c9dmr2354200637.65.1768382771115;
        Wed, 14 Jan 2026 01:26:11 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c346:2298:451a:a3f3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b2edsm22131136a12.32.2026.01.14.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:26:10 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui: Clean up IT6505 regulator supply
Date: Wed, 14 Jan 2026 17:26:04 +0800
Message-ID: <20260114092605.3916367-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012612_138475_7D7D9DBB 
X-CRM114-Status: GOOD (  12.08  )
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

Align the name of the regulator with the design schematic. Also fix up
the gpio property to the new "gpios" property name, and add the
GPIO_ACTIVE_HIGH flag. The flag is actively ignored in Linux in favor of
the old "enable-active-high" property; nevertheless it is the correct
description.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Just a small cleanup. Not sure if you want the regulator node name also
fixed?

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 4b87d4940c8c..a8e257b21a88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -44,10 +44,10 @@ clk32k: oscillator1 {
 		clock-output-names = "clk32k";
 	};
 
-	it6505_pp18_reg: regulator0 {
+	pp1800_it6505: regulator0 {
 		compatible = "regulator-fixed";
-		regulator-name = "it6505_pp18";
-		gpio = <&pio 178 0>;
+		regulator-name = "pp1800_it6505";
+		gpios = <&pio 178 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&pp1800_alw>;
 	};
-- 
2.52.0.457.g6b5491de43-goog


