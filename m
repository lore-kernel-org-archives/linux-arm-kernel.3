Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749B1E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6yT7PDGcmb4Uh7Y9LbNOdh/0wSRSH7b4rMO8FJwe4BM=; b=frA5ExOrRAqffn1RMyvKF5Zzzk
	53WuBDLVHxKDeLR01wOrgB7olHm3ZD3VWMOHjpvCHiNlcT4yJg/t4QBddd+KTkkBH4MhmBJ3qfrka
	9fkoCe+M2ZrPl5ZUqTLeSx59iCrMg+NY89o1xrahdxJRieokEw8qM6VoCidQlqkAGOra5+Qdh2MYY
	BMtZn1KQWWmGQq/QeE1xzYSCiRo4HWGVV7NSCGBxDmBb/VUdQXDs1dmFI2UeW0w4d3p+1FRexEcZS
	DIlrLreg8nkB8SoxSiPzg29PB/myAWLNbhwwSv6z17a3MzHLbVvdaYTtC3epB8e8q2PPsB8p1iqoR
	h4JxbQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRXV-00000007aAE-2y1S;
	Wed, 08 Jan 2025 08:35:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRWH-00000007ZfJ-3sxh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:34:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21628b3fe7dso236578225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 00:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736325269; x=1736930069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yT7PDGcmb4Uh7Y9LbNOdh/0wSRSH7b4rMO8FJwe4BM=;
        b=himosNZalKb/f2vEOoDHQDe9eNGE8Y0A1fcb7kcdLoIdfue4sZbhAXmksbvKq2PrC+
         MxVeMOiMx/YW4X6jwuO3vXR/D03dpEERy8IZdqZvolqmqOa/MN0Uvoirt0kQJelxnZS2
         lGV9ylu3I089kiyJ8HZMO4+smmflkcwC9syNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325269; x=1736930069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yT7PDGcmb4Uh7Y9LbNOdh/0wSRSH7b4rMO8FJwe4BM=;
        b=qcNVx4rcGTcVTTWaIcWEv+ELWxSCGHjC3tl4kXc2lbyqzZv0F5BJDXuxnD5nSJrZU6
         cPTx5TEDgWXutZ0faLBWta+zkRe9Me1LcWg6AAJx3D5fcnHatEIaZbsBy5wfdG6hq11Z
         rkhJnwc4XxTlVeP6OR2TvesG1NxrsI9XapefzN/dHLr+/XE94klSPT7z/k8haqzdifZq
         hmcqf2ecBFzZE9gpGIdM3Ovv+cu0wgV9w6bRjURpHhZjiD/cXdk3XbMDO4pHB8XEAsYS
         KRj5rBX3gB3+94OE6eO3qswv3z5ZJgMTQmPKOgsRi3eiIEvuDKintEi6vbeLHH8C7SsM
         pNWg==
X-Forwarded-Encrypted: i=1; AJvYcCXFVch8NE3L+CRZXHR3+B/3z2UYgBvE884RHNl2YywWEV2sGix5w+GURB9ZUflmWKYWSaS/AE0BBQjd3L6Z7kdR@lists.infradead.org
X-Gm-Message-State: AOJu0YxBJkp771W4eWXOIi6fO3hACXOIwHIpxV/YzvespwyKfg3yDkIo
	wUl90uH/OU/EZUs07mVQIKQKuJEJiDezMzFEW46VYyGXkUyobMkWlJODyoutGg==
X-Gm-Gg: ASbGncsSmHuXgnITKUfD74tNEUW0kt0eyWVuTXDlzQkfUcDc7QOr+Eute++TYYHkk/c
	tHVBOG1Xohs9DAdxSzA+KF2UWHsXUvsaXA0Cby/tGNOJ5eZjuhwqpcIyn4OCmAJ283Mr78+w2yr
	6vJGJdhD6oJa5bOWB2BnBl+4fJgle/cuiOKEE98Tg2N1GdyTnMRyatzHvpaQzpa13rj+EdZttIG
	6s/fCThccKiovq2NvwGxXRBIbw6IxaJMTLarF7nfFb/sWKbqnxcKyTpHh06YOsXkd5jIZglxv0=
X-Google-Smtp-Source: AGHT+IEufyJ9Z1gHFaHVltf5vZ4SxHR+JVTg5Ok01+7e6JirHWxkfmRu+e5XrZq2fBo0mVrBTIoNOg==
X-Received: by 2002:a05:6a20:4394:b0:1e1:b8bf:8e80 with SMTP id adf61e73a8af0-1e88d2fc8c4mr3918189637.41.1736325269073;
        Wed, 08 Jan 2025 00:34:29 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:511d:2d5f:1021:f78f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8361b7sm34602275b3a.74.2025.01.08.00.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:34:28 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8173-elm: Drop pmic's #address-cells and #size-cells
Date: Wed,  8 Jan 2025 16:34:21 +0800
Message-ID: <20250108083424.2732375-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_003429_956463_93489DB1 
X-CRM114-Status: GOOD (  11.27  )
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

The PMIC has child nodes for each of its functions. It is not an actual
bus and no addressing is involved.

Dropping the bogus properties fixes a DT validation error:

    arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
            from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412212322.JTFpRD7X-lkp@intel.com/
Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index b5d4b5baf478..0d995b342d46 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -925,8 +925,6 @@ &pwm0 {
 &pwrap {
 	pmic: pmic {
 		compatible = "mediatek,mt6397";
-		#address-cells = <1>;
-		#size-cells = <1>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-- 
2.47.1.613.gc27f4b7a9f-goog


