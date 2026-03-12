Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA58FED2CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+7pbEDD3bhMWkuiSNGnd0Fi6nBQlzSd8LprMbyKjjA=; b=uRFXUWE7JSOTmjflFpJEwMhBfK
	lbs2VB7u7TmocJ1S6Msjg72k5TkqM4zJgOS2GEsJa30/hKz7KxsQb6wQysu8pSyOcMvzy4VCRbhko
	3jUgvnRKBk+AVVHheXr6Q+56OyaQtfvxT8Y296TamrpMMK0UFC8D9y1xwJCXk9ZnwTK8wu2h4dh2C
	E6O3Hs9qLkD4jbkWNHO4ltzZfAnPC62myNjSDZMdCiOd6EVD7htPB/zgnYGHZM+cnFqJ4VQQ1ocRo
	kysff3bj42wwmDpSG1MqwwUt8q2ADYS4K/M59hZR15i/CE3MGjczQwndNXkseHxuHpu3938fs9nps
	xnunJIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XT5-0000000DEGa-2Vix;
	Thu, 12 Mar 2026 04:16:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XSz-0000000DECb-17ws
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so462353a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288969; x=1773893769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+7pbEDD3bhMWkuiSNGnd0Fi6nBQlzSd8LprMbyKjjA=;
        b=VGPYeigPFX3d0oYHNyjjrlklFJyiuv7uCh5Zopm/BWg2Okr2HcQ7NFRlMHuW2qHkeV
         skhhqwD1wwYi1HtO5evzXABUjRxH4GX+zEPxzVGmq/6dyQTVbWJKeL9J7W3g3g8MSZ6B
         grsB/nSgIccrnfr8A69vCmr61e+seryqI3rQGVT96/bTPkdlyJFfCfYYtQ5m54wkUjFg
         +CwnArtlUrL0Aq7KxEItDPcFKUWTkVPgUzVhsvLuMv0eyGH5nKWUS0dNEhTWMfDuPiVK
         SlCZ1vEcOBSSSFKmCjArqH8F7qK6MTnsuuoRZlhVDs2Vl37Ks4SvkOBwRyNsgk2BCSRx
         0iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288969; x=1773893769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+7pbEDD3bhMWkuiSNGnd0Fi6nBQlzSd8LprMbyKjjA=;
        b=BuMSzTfqnfPqeER/xAurtjXT0w9XjEWWbr15pEdlfyUouA59si4FV+OMppyo7XY0r4
         cHW/zdU1i9aXy6tXKh+jVgAdaueGN4APZlVQ7OWrv72V7oQNGJFk+PE2lZZ0wUgrrLwR
         momtrIisGtUL+qUmcaE9jMlMSVITZJrj6AfJjKGzALYYlQpPyoN8Zs0S+pWDAnAWKkLk
         ZAu8PnWwp5JrU/dudRvhRouLmJ4riJhbissiixxVvGZm8nO5f4/yAIIbeC2CZjlSYv7m
         Og8sVq3YyXU580Ansg7DncHmG5k2X3GpzfaZCLUtWmLOPI/UYpwPXUon+O1HJh2Ptjqk
         qneA==
X-Forwarded-Encrypted: i=1; AJvYcCXpUdYjWR4Z6tPHhqoFLMpa5EVZyVTtAQlIqBCsM84DPLhAxGBKP5xMZ38Oo/V1OOt3s+tAVKACiHDAD29nZ7L0@lists.infradead.org
X-Gm-Message-State: AOJu0YxO4QGt/DZSWNM4awaKK7+I4W4sF08dtEgc6HhGeccWsTYclfPG
	oVxeI4frXtIrmbXSz+SdQ/v+1+n2MFtk43WkDnppCg+e/WAGVEJBWww8
X-Gm-Gg: ATEYQzxLw6rF2bjqDmGCBwKru9JoIfSbqVwWtH3Gs8qC3mvjT/1AnnV494vUeOi9Gtk
	vtTnLmprWF5ew9nEQ7TdIr0fDIl0m4w88Ptl9WoM7wKFpmJjh8QN5rR9XcNWgyX0z7bxyjyZklX
	rpSu3TDnCPe0NBjdOdnZplNK4u/WD4POjTU/ov4n7uSOLArpGv8f3tFEknz2eXrAcgSpLKrjzNR
	BYLjmeneIew7bLHb9Uay52Sa8Dzuh+lNHwdtyqiM8VBjc+/RgN7sI7HbEGM3z4bqeG/RFRBe1HS
	cH4tnDuX0LR8AN3MoID1eFsrC54wXmXfuHvl7JuH+BeUj5FUXtOzxro16Yit+g9S4WC/f0sXlH2
	2SWvF/sJf4u5Be7BlGgGafRz4IQA6EnfjA0TyfXXM2SHw0FIKeZONiB8fyZmFeszQq4AE87jGs+
	2rGXf065JcfqTpNehT4j4fzPaE0E7BQk82fnkVQYNYE8Ub9i3REOGKlUHnQtLg2lG8kgWuGDs82
	8T4X5g=
X-Received: by 2002:a17:90a:ec85:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-35a012cbadfmr4484568a91.28.1773288968665;
        Wed, 11 Mar 2026 21:16:08 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:08 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 1/6] arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
Date: Thu, 12 Mar 2026 13:15:28 +0900
Message-ID: <20260312041533.187553-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211609_312711_E300158A 
X-CRM114-Status: GOOD (  12.38  )
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

The gpio-ranges in the MT6795 pinctrl node were incorrectly defined,
therefore, GPIO196 cannot be used.
Correct the range count to match the driver.

Fixes: b888886a4536 ("arm64: dts: mediatek: mt6795: Add pinctrl controller node")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index ae2aaa51c9ad..134cfa77e3b1 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -371,7 +371,7 @@ pio: pinctrl@10005000 {
 				     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&pio 0 0 196>;
+			gpio-ranges = <&pio 0 0 197>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
-- 
2.53.0


