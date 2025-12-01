Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BB3D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=97C/Ev0rC6JcGUG0mR7bjVxQO49skG60GnX/roDGMIg=; b=Wa5JYbIMf7s1TRWymjvt4sNUPg
	wZCDw3sPAKuQ3649uqcdOQwRSodoCuSHtrsfdcP0xKmkkkkwWsU32OYWz4ww+Ky4itKvYYgHCiBf3
	wtyWbKtoalcRElobJyNFbLZRr1mSj0BwpbTmrdugpye3ZRaGdpL33Im47r7psL7vSw4D/Y4z4P8NR
	ng8SD7iK5A6K6uOGMRSfb4pxrkhjWi+dX44//0Jir1Ro4cAo2FLjLvLOMtRJJjWy1Db3xn+x/qri0
	Y41QBPp9LycS8ydLut9g87Vp41C/ObTH7mdH3P+PC1uKGvDcnDxzlcv9DR7Ky9CcMM/0ajFX7FKNV
	zV8e2dCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTy-000000038CN-0U7Y;
	Mon, 01 Dec 2025 08:42:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTg-0000000384R-2B9v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47790b080e4so18258565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578504; x=1765183304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97C/Ev0rC6JcGUG0mR7bjVxQO49skG60GnX/roDGMIg=;
        b=XOWMUaux3i4nJLs4PStZ1Qy1v877Yx3Wguf+DvNZE//FRbRSih8hinH7cKsQZQLYa4
         n6kNeWsU1GVLwKWCnddoCR7WhGZbmwMTkpBmuuPR3VfyuDDhSvUnHyk4x81BYa/sQ6FD
         gly3DMIrWbApTQQRNGzAHPnpZf99b6LgIUsip+vE7DAywleknmrMW2hkaYoWBDhVAHRJ
         bFcLxAlKr2Q4x7iqXk+HUTqIP6G9Y+d3K8Ww+umbnt1h+TyPtOxJQLCbFkt73OaDJyXa
         SzVCu5prxSjnwkdsLEaUarUNsl9KSGWZUVkUpT4U4FjBGQT8bsT9uBkNNTuK3EhjQtAY
         FrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578504; x=1765183304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97C/Ev0rC6JcGUG0mR7bjVxQO49skG60GnX/roDGMIg=;
        b=J0ZnUtE83qCB8xncuHrlndCQtZxwOtF1sI7qW6Iuv5T7pDBhISePufhCAjJhYRgsBm
         LLUaplyG0wobiIf40SE2cDyXgj1BGgxmkxJCn31otR95JD6+eQX4t71PqgkAYEl+SnCo
         lbhw7VyWb9nKnoMcQ3SsUeaD8l9vuC+y2MSUItetrfIHjcy9Z7L5UyLHyaslOzcZNyMZ
         E2IKIdoTlhxO7lU7gEwKOx0VmZC25+ER/ihI4kBKj9/CtUuq3tRnS6soJIDM03JUN+G4
         kvshiAjDFEVnMkwRPJLs2G4SdnrS7imkNwL/ymsyIVGH55FaGlmYIWlXaTUriyYEDENM
         UknA==
X-Forwarded-Encrypted: i=1; AJvYcCXqnRa5CKt4MBSs4qbPrpIsAcjZbme2QgMx/2swNdYLbYtkbz4qS1cjAYUMGLxhkHwRunSpjPdcFBvsDsOUilRK@lists.infradead.org
X-Gm-Message-State: AOJu0YwmsO7SPlUh9IYwIT7h/YTSz/2PnwH9gbpAPg25Nmohr8olqdcM
	pnThz8gTJ5+FQ9zQAmbq5tuo6onhfZBI8TxeW9i6UBT2J9AOALUJNm1+
X-Gm-Gg: ASbGncu9YS+vAPiS4JyvhEA+D87/d0v/3aiPQlqTrDHDgf5lWIp56/x4vYHvKBFXmvR
	rTjbwWCMPzSaVX56EN+jsgtDgJCFbXYjw0EBXgF8X9wGc+yFJxEVg+CiHd5fKtdF0QnakbS4hu0
	eKmY+0Vzhlu/nmVcMpqGxNe5eeTsq7wqzA7cGCQZ8LYuPKWAuitYQah6cYmP6zlR0uNSHm3s8UR
	Wel/S4jScND3cXkXo0ng//4FCQe5c7piTDJARhD8jCbR0hQDlu2KQ0ITKQpv3yZ7l38CulSPO+q
	oOub3SgLwiVneSmqsNUjm7KWuQy66yUepYbbZvlnd65Km6I07pGaJUA2wabAzmFR9zq8Pe0GeP/
	eiQvTvtumQiGfNaFnDw8WkVMVL7h62exX5vn0WVP93HfS0JuJNECTuNMkiNTZ23RGLRlabsxoQo
	IOn+v2mfmqTsYbD2ZJnxc=
X-Google-Smtp-Source: AGHT+IEH4NM/QZPkR7gSqqML8vC0a2C+GrElrhCzDKUMsoc7T3w5nfVWTh1hYMq9aVozC1eD1dOZYg==
X-Received: by 2002:a05:600c:3590:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-477c104fc20mr429686755e9.0.1764578504373;
        Mon, 01 Dec 2025 00:41:44 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:43 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH 0/5] Add support for Ezurio MediaTek platforms
Date: Mon,  1 Dec 2025 09:41:35 +0100
Message-ID: <20251201084140.376058-1-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004148_909976_B1239F37 
X-CRM114-Status: UNSURE (   9.96  )
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

This series adds support for Ezurio MediaTek platforms called
"Tungsten". It includes support for MT8370-based Tungsten 510 and
MT8390-based Tungsten 700 SOMs.

Regards,

Gary Bisson (5):
  dt-bindings: vendor-prefixes: Add Ezurio LLC
  dt-bindings: arm: mediatek: Add ezurio,mt8370-tungsten-smarc
  dt-bindings: arm: mediatek: Add ezurio,mt8390-tungsten-smarc
  arm64: dts: mediatek: add device tree for Tungsten 510 board
  arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 +++++++++++++++++
 6 files changed, 1523 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi

-- 
2.43.0


