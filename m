Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C557CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=; b=hpQwJhii8Fw2stUETkqUgEDnt6
	jiCvPfqAEX+K44mT84VBT16KF84aPshN24Vc+3HNTBBI1TUJC8AF1pH8ZwM4FooaUAMl+36GMLrS/
	wDabgJo1bHH3r35jluJTrMfcwGOS5lJJlLDka+FF2fzdBVK1yHwjetFOwK/lvdQdlf4riiX+I8FsC
	t1TQRs9JpiWyUduepwyzeQTQEpZHI8GY7mI3Um/gIOyCt35eFiPh2z6aoOIze7JsrrTjpTibqqxeB
	kZph1JrbNFlPFP5qsm4tOVEbz9ZXtC2e8UC4e9Vbke/MXDZhax2q22NIS4ryFMIiIWY7EaH8WDmW5
	VylvXJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4PZ-0000000BMVC-0Hyn;
	Mon, 01 Jun 2026 15:18:41 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4PX-0000000BMTd-0e30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:18:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2be1dd4af34so149283735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327118; x=1780931918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=lQXhk3rlkAgwCpEU3moCkUDBb6ygkiIudACenWoXvGWu+VX+cmjtKJ7zZ4I5t/E0zl
         Z6BNri1bT6P4jqJjhqjnyl0RFKfmB0pP4eVcAvalEbKU0I3Jpk7fZmH392Cw86Zftv3f
         Dvw3SGHeMnTKPFk5rsXVeOcTS/xyG3qgAqmI6a935k1eL4eMUVIUpfyMb+2oBe1Yf3mY
         9fi6+ZPw6f4k9uuDIjtLxcyQ8rDlZqkrT5u4gTOlrm2QVMij4cG6GqvbvNazr7Bw8446
         dfzq2qYW0/pH2b5NrJC86AoD3wWBLPNWfExfJlrbZORbyU52HyD9Mu8O3UNsxawAJAbt
         2Avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327118; x=1780931918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=g9bnAOhuYHENx4ZjShOv88MfNSQGluN4gzxsdgs1qtV/Chl1QIGW3w+I6ifk1SLdW3
         fxF+j4BMuXRycAnWANLn5nv9f9zQdUaPhW/djvUlYNxIa7qJHIYRq1bNJgjA6yQvMBjG
         teMSlJchyxlAwQRsFt5TuwR/KlCJMlYITjpH4oB/Zajd2ab3+qDKDQXgZxnl9xVSFyVE
         SKzFqtc887wHGfvPuw3knpxhCbgqXHufuVav4dZWYnfFFs9SVZyY1kbLHOlQSJKfNqzW
         SEdXSb14JokBG+zZBKuIa01iqxfvxFYKHdJSWw47alLNE3bIKdGCfroCsNQ5eEjLn0mm
         65Eg==
X-Forwarded-Encrypted: i=1; AFNElJ+yzsUYeWnEhBlGq6RH83KizJfTTXHxKRYh83KnEkPwsbBgzLGThJPzLmOzrA6+28sPYHQRU6psv4EbFgwxsVqp@lists.infradead.org
X-Gm-Message-State: AOJu0YzXdPy5UwEuS2MBC/MW7869QvPB5MCNkzSuKBjKiWhswkHDOSN0
	BjcN4HsLn+q+s54QqU0QSMx4e7aojw7DHKcDdLTi/wYAfMChO9hilMtl
X-Gm-Gg: Acq92OGU23WgCHtXnEKolBdtaYQ9mbjUTg6G4Lz2qKwqm92Oq9SMHIv1JkTnr4HG7Qr
	K4yp6dHRPI2kOzY/jI90hX+hBLTFRqo6OWlbRGGO2vPUvy9sKTg2mp/FyZyqh7Cic6MdUvwRAhQ
	MZzTLcOXIfHThwYQT44DzNzQq68MZAoKCmrKHCGWxBq0Hw1iNGcjVVp/uoJhqa+Mp54yft64F47
	DPqee9fm3WbbuEXaXuMb5c5o9et4N/fK77kq4z9KpWQp2mf6Sf/RdrOnJyD/vKOQmnmaIlmb+rP
	/WG107whmonJOGTrTLYYccYSUVwQ9DRuHVR18vvk9ZWaJQsoJcduc3EaOkcJ4FcRybYLipwm++X
	Z2N2Tp2bASS9Zv885dZxvf5cdd6VHAdM+p+zp17ds8jwosnbu1NsbuKa10QFxtLm/wlgDEjY2vb
	Cg7Ooo6YqFp3oP7w3JJ5e8bYqnXLM7+9dh7K3nzIog7Tm+A12fMvM=
X-Received: by 2002:a17:903:fa6:b0:2bc:7d4d:3520 with SMTP id d9443c01a7336-2bf36885897mr130565255ad.40.1780327118190;
        Mon, 01 Jun 2026 08:18:38 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0d727sm106633925ad.59.2026.06.01.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:18:37 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 20:48:09 +0530
Message-ID: <20260601151810.162173-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601151810.162173-1-hrushirajg23@gmail.com>
References: <20260601151810.162173-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_081839_192662_9D5DF933 
X-CRM114-Status: UNSURE (   9.99  )
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

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


