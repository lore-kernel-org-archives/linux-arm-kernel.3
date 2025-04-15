Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BD7C369B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 23:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UKmbHtX7NVFtRAHnksifnvzo2HzNbVI/Nlz5WzatgyM=; b=hN+yCKSWT5jcpMudX7ixwRwL0B
	LtuJRaxZtM40FH8KCn0AGSr8ZetjgI2kK6uVm0QAV1wmI9Hh8E6/tIFENr/dp3O76I1X0bsAJVFDp
	ZV9PlTxJ5LChsCZEMneIdgJxuLSaVBnwnDE2QRRWBL9cIpFQ2zGqvh9LsyQAZR4Qwnlg+knBvExzj
	rYLZh41CJ5IHhmddcUCWKX0Ci2OaQzumr6SxM1tYiqfB7+jehyYsuoFZaJrVo72RYQEAR391TBhUY
	Y21O86akPnrMPeEjzqbo1ESUzmK44nwaJnB5w2zHnfxLLrt5KbphrenPANLn5WOuvnvJEJ9wGzmT5
	Xpa/U90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4pHj-00000007P4R-3m1I;
	Tue, 15 Apr 2025 23:01:43 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4pFp-00000007Ofl-3spg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 22:59:47 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d45503af24so55016755ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 15:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744757984; x=1745362784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKmbHtX7NVFtRAHnksifnvzo2HzNbVI/Nlz5WzatgyM=;
        b=ZICEe4zxqyvTvvNaiXrRTg0yrOHQsYgXHvpEDdvz9w4gDcP3DsUlDsOcCeEfrGUIc2
         +GMfzHnJXhgLjmP5kIPieVAPgfCbfVgEIKcyyA3arumbsr2MrOcZGtqSyANm4I0U5JLN
         vlLwBUv4URn8D4NgoU25XYFRbiE0Ay81ZqvraSbsa+EOxN8NDEUkaVIUc6TWTFUDx1fA
         bMFmzHz0S7eAasy+PPKPvLD7z8ujq3IF+KtMVji1C4DkgDxy9IgWC0XN8v15TmDL3/7B
         yfGp5SSoR3zkHrQo/QeyEPSuZZ1xqNE1Q5fjKmF9hJ6TGaTtD3iv8iPWPk4IqzfzwUtj
         YKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744757984; x=1745362784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKmbHtX7NVFtRAHnksifnvzo2HzNbVI/Nlz5WzatgyM=;
        b=QpZfaQoZZV/5fmswtoX3Js9iWm7euCSUz73wRIstSWTumxioz8pjg0UuxXAcj500Yq
         8SBGUw50OYL23i+xkP7iWB8saD4KbySRyO+54hz6D6HFm2SLgOfx6dWRpzxWjcFwWPSq
         XoXnrepaU65aTuYFlVLXWcm0+Q1gvZPclna5i6LAU9X8GczvQ2jviv/t5INZf8m7RFFE
         8QkMwbnQMZMu+fEFQsoTzd9QetoOETVTR040n0T4nBTkdPwsdcjkL+3GTjtkH3oLm783
         vWIVKdhGr/YMesiwoc+ECEagMO9JcRBCpFwiStn8ZrZyNAb4MzT+a2t8BVKY8R/eUQap
         Mdhw==
X-Gm-Message-State: AOJu0YwszAV/xoWjdnbinJ1VDu4kD4eUVmvs3B1mrIdGdnqUiOT0XWGG
	KXksFwj4pXsqpfzS4rSGtUBWBFQ1uSLGfOeALFSNWHLtpNIUvFaTN9rdJw==
X-Gm-Gg: ASbGnctnrSinM9lKooziZMJxYCp5reL4WMxRumhMzvVPRWbLfvSxSw6t+4l+KdGNC3G
	9zZpYwH2oTfOqnG4d0pmRdaal5F3niGroacrsyijrzEJZhR9CuAM2nfAZ29lgOROP0dZXuQAG9W
	/O4kfLy1jYQyykh1c/CdOyKHx8VrBPIfATMa+tDOyPC8/MP9dj1OBdoTnCkSB2Qci1TmxZ9rrvd
	ZTgKjb54tg7MCASHwYjCndjrDO/GoQSi0WrlZDNnrAiqtNKZ7Ym30xPLDSfpscNGoPBJLJGa1ZQ
	fv+7/HY2mNDUMrEVZsbfIOOz1E27Q2XHXc3Ryz/ucpl709L+pmanlOYWSqR8FSph8CH6EUhK8Eg
	i
X-Google-Smtp-Source: AGHT+IGG23NkaC44hvHCoI5gZwhtT9feCVmXAKSsDqrMmnnVmSWVZHn4aR1QZTijBERnDX4hw+WvTA==
X-Received: by 2002:a05:6e02:1fc6:b0:3ce:8ed9:ca94 with SMTP id e9e14a558f8ab-3d81256730amr12553735ab.14.1744757984259;
        Tue, 15 Apr 2025 15:59:44 -0700 (PDT)
Received: from hestia.. (24-220-158-153-dynamic.midco.net. [24.220.158.153])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d175edsm3382356173.55.2025.04.15.15.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 15:59:43 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dhruva Gole <d-gole@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: ti: Add PocketBeagle2
Date: Tue, 15 Apr 2025 17:59:39 -0500
Message-ID: <20250415225940.3899486-1-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_155945_962105_3D07C71D 
X-CRM114-Status: UNSURE (   9.04  )
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

This board is based on ti,am625 family using the am6232 and am6254 variations.

https://www.beagleboard.org/boards/pocketbeagle-2
https://openbeagle.org/pocketbeagle/pocketbeagle-2

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
CC: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Andrew Davis <afd@ti.com>
CC: Andrei Aldea <a-aldea@ti.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Deepak Khatri <lorforlinux@beagleboard.org>
CC: Ayush Singh <ayush@beagleboard.org>
---
Changes since v2:
 - Apply Reviewed-by from Dhruva Gole
Changes since v1:
 - Apply acked-by from Conor Dooley
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..b7f6cd8d4b9e 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -46,6 +46,7 @@ properties:
       - description: K3 AM625 SoC
         items:
           - enum:
+              - beagle,am62-pocketbeagle2
               - beagle,am625-beagleplay
               - ti,am625-sk
               - ti,am62-lp-sk
-- 
2.47.2


