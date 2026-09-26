Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851FFC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnxpUndPTtMcwTGMAPeAya3Up+u2XyfdmZAXFYObokc=; b=J2u2gkQrGfUlZtz8yJvJEQ3W5X
	PEGFA7zIDTuAXJ2pu5vgHUIfdfEpI5xwdepSWwzXQhB8WDosRytCPtKXlUaifx1nUwiygGRzuyZrH
	UT72oyIyKwMfyB1Lp1TpZ+ZIJINMnO3cFHjoN8hkqbhhz4cmZYeWq79FrY3X1fJiqtqecnLwCsoEy
	kz16G/o/8CvZ6jh2dRbUTomF81HLfJMW/wy9VFnMuIJD0jQ3JdxWwSICXhUMQGeadl04Zfl4qpLjv
	DmrhuroDqJWCvTMZZ82akM2Yv3dChei/U1nRsjOUN7vbfjecGtylCSnEqJ6d4H23VgvnLTVveuECK
	cS4HZbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQTE-0000000FJlc-0G8g;
	Sat, 26 Sep 2026 11:21:32 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQTB-0000000FJlH-35Qt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 11:21:30 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-91058dd77a2so17766206d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421688; x=1791026488; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnxpUndPTtMcwTGMAPeAya3Up+u2XyfdmZAXFYObokc=;
        b=jp6hzcloXyLIlcwUgQPQJBes37Pxia5wJLveFy9Mc3tbyMeZfTNRPjpvhSQG9HucCL
         Wk8nsEvYgdUw/j/LDKqblTmSkffFRTuUXo5spkibslqKzYby7rAxllFSCEzDxESI5RlR
         C+CVnnyFL9Yco/IYeOHw5shbu783YAmp9DA2/I6KK/2HNKBvxIAQGlN3Uby0a+7E10Gd
         qLXYO0dS4PFsFUCVRRJItKLRjs8VJ3hbd0Ki5WEv0wp0pqB0VnaoeN93sh/+9UlrQPGt
         7bdrbE+hGaJoypBiR1DlKO0Ug7Ut3qXHMNz7BvJPKjI13A3T9hCIHwPUe/kE6QZZWmLz
         savQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421688; x=1791026488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnxpUndPTtMcwTGMAPeAya3Up+u2XyfdmZAXFYObokc=;
        b=s2hHUyjImuAR0TMFAeW+knWEeH3qYtCgIQvnBK3swEgCcTR7ua3yNMB/Ii1Q1NK8VP
         /dKhtPFv+hwdWfoPsHzXgCBiGAS5x8k4TksQ+0f5oicyMKJWEQVVcXjxSrPObUK7sGVv
         q34cc18ufuhTSGB4+RrE3p3XFH3UjW7mkSpbn0HyjeGaHMG7N9vyq97iBIf0gchMHP3i
         rPOUy/DJDvgQehnljw+/JOoZYkdh4TNY5T8xIjvpglb/2iQ41hftFjy7yqF2CMNgTchn
         DhJ3YJPlpBnS4BrfU/R2rmVpuqaLskx9fal+YJeMx65+PS/rQ64JjrkTWpMIKyBBfHmq
         a+9A==
X-Forwarded-Encrypted: i=1; AKwUvBxYvmOyZ5RAySrLTrh/rKTGfuTk+Aktua4iNRSpuuczyEgpfcIvdhKjPxQh7Z1Sk7r+JOlQzI/VTdA6oC0X18Du@lists.infradead.org
X-Gm-Message-State: AFq9FYLei4iUNQeazJ1uKwlatKDfZEGthKP1/i6Yt38pxHmqUsU++TRl
	OJVbCaflBkeK4tQR8Ft/nFwsGIlF63UKb4VFcTx/RjWB8D3jaR2ZkIZnk64dNdpL
X-Gm-Gg: AYBFou0xMxZCGNUlSdh3bMjcOIvmOg2+/7pm1fCVz48QO6MwwUVLy7MB0HJTAHz1HCJ
	3GdW72caQIQ0/EIUSevX6ixkzx7XLpavrsLr4XeyXZneOgt2mvbmVezGwqhqyxS/yTwx5DT+u32
	Oq9PBSm3MS1YiYRlCiZOUxldQOQtmSTQe6TETt4enki4ze/ephuoXlj1wlN8R9ZSXmwTUKrB2PH
	xGsWk3RydlaMTPVYagwyrmXja0cmDoDjdNIRUQvHWEMCXZiA3fTbUz9sEivYtIPBGwyEDn6xzLf
	uDKeSYRPh2fQQrli1dii17qWXtsoRnqMpcETK9xsTZ0TfV2h3nUld20JtjO0g78CDYxx6k+Bymg
	nS2YaklgyQzDK8hb/bmFGs5XHh/Wjw+XwQnOaSRRmDvTgjw159/U/f0UGs5De6V+6HCX+peZ2v+
	mCMfC1eS8Knr+DQpgDjCrP8wOxa7cFqSINTCpkeXAwIsBZKDpWf538UEjp2lMuww/AQZZQPQqRC
	U/+93R1KOr2CnK6z+XG
X-Received: by 2002:a17:903:244b:b0:2dd:c100:7cc1 with SMTP id d9443c01a7336-2df7dd6d2c9mr65998225ad.61.1790421269577;
        Sat, 26 Sep 2026 04:14:29 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:29 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 19:14:01 +0800
Subject: [PATCH 3/3] ARM: dts: mediatek: expose the MT7629 TOPRGU reset
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-toprgu-v1-3-c124bf9ac273@gmail.com>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_042129_795671_392CCB74 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

The watchdog block also provides subsystem resets through TOPRGU.
Add #reset-cells so that devices can reference these reset lines.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt7629.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt7629.dtsi b/arch/arm/boot/dts/mediatek/mt7629.dtsi
index acab0883a3bb..465900ce38c0 100644
--- a/arch/arm/boot/dts/mediatek/mt7629.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7629.dtsi
@@ -144,6 +144,7 @@ watchdog: watchdog@10212000 {
 			compatible = "mediatek,mt7629-wdt",
 				     "mediatek,mt6589-wdt";
 			reg = <0x10212000 0x100>;
+			#reset-cells = <1>;
 		};
 
 		pio: pinctrl@10217000 {

-- 
2.55.0


