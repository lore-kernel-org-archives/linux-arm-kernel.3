Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96F1C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 04:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=69P3nlnxBw2v6kIwtTKkT8ULduVaYQnRi8mlA610Ew4=; b=ThvqcAZjT8pNXqyTCFlUXSudry
	EPfFfonRxJNQ0QvQx/6p4cTihIPOFE4QiARSyx6t/1coeBD98ZLr6nCdRQtqvSge2mtoLzGTdEBPy
	6Etcv6BdEZE4ZluMjwJt6Hon0+gtzGjeEc4q8q46Sw3Z/5/byrqueluRPVhLftjlrmAsv834EDL3j
	3kh+gLYBQVVtdhQc/806f3HW1VtmGA/6whPlX2phAdHn+9UV9F9YAwpJMW4dHoBy2jqUPv+BUSh1T
	EWRZ4zVDUKEmN1D03939rFrOTaojn3XHgSff7U/24llh96WcGWlLnmP4gS+mJf+rpN9ETNHvd3FI3
	ATt7v8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RNL-00000009AEa-1tWK;
	Wed, 23 Apr 2025 04:06:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RL7-000000099sZ-1fTg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 04:04:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-227c7e57da2so51820365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 21:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745381040; x=1745985840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69P3nlnxBw2v6kIwtTKkT8ULduVaYQnRi8mlA610Ew4=;
        b=Bd7C9U9cusu1too3BdPtHdxvGbH/5Vv2TqC7Rvt6XQYF26GKgghpmJeMiH3qEymtAv
         D9Q4AVrn1h30N6SgHu2tYqsKHi2NHiPI85QlvoPMtAXsMAvDE0647+mYnaCTr+2JjaKe
         0EBTW32RnWPajJD3gevTtmGvtDYjj8C+ysEiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745381040; x=1745985840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69P3nlnxBw2v6kIwtTKkT8ULduVaYQnRi8mlA610Ew4=;
        b=bVq+oqHswXyUcRQdI0AEuiRYYT8B1NOWqdvmI2ZDMoLZ76FX6tKMKzZT0CdGDUVVjn
         uXXLWhfWaUg6bTWAXF0xgYO01qwMPwAt6XRK2bafePmnQTW7DV9HNeNB4TPDPbUdJwWR
         MEAUO2Sun4Khm8cAPV2ty1O2xeWI2akReebfPkcRU8GjS4bqR3xuYPCZIjj/RBbrp+qJ
         rTyWZvPoMVo4uV6h6yCSghLbD569DVUoO3any2yYzLfi02oMK/pnjNuBuCYm8s+HRAMF
         CSb1tlnB+Yndb1347RBwnPPri0YnwkTggTgbCIhoI0ZQd7eA9Uy2873SFiCf0SrGpavX
         vqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2fX7/pL0FD0JeIQVL77vwlyuVifOSyD+F9/O6TIocBj5Bu4EAqPwlGFNKJYoFrd6YoPN40f2aqXiMcSDSKVwO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw86CWR9UnIOkB87MjDqRjvtns8HUOZkSEzFeSzT7nv1XUUOyE7
	oWYiQ9bCKVNqSoT5TXeLDPDS5dZT41X9avWPZyWuOdLGhRn/2cJtJTh7Ob13UQ==
X-Gm-Gg: ASbGncvnNwneRPcX0/tC3vssAa/XAGtQqt2B100CyYHO40Yfrz1MJ9GHYdix+m0OiHC
	01hCoHVOyyLkLxbUHeo+UKDpw+UEY6iY2hxPv3WqTHDIFuWMqkCUz9jC9PCmjAQ6pm53XX1E4Bi
	3okulBCMS/kKnr48hHXsdi0IpOciUUvq+hRWBTcBpkQcVZJKC+Z6NpGHsWahiKC08e89O3LYiZZ
	WrA8UIyffHzBEELxBzx7Vn33yeW7qFtWO88CeKnRHj4Cjl1b0o+ASS3fQWBNZ1FrYT/2xKDXzEf
	TuhqgTU5Ux9Ho/FI6HU4fZqa255xXj16p+Lad2A+a4RrCQVbo8sy4Fi4IGUZovcUtc0LXwOCJPQ
	=
X-Google-Smtp-Source: AGHT+IFs37l1XCtk6TUjNGxDgTahK0TxvEQaxIjTsLH7CENRysCfaJj2nfs1pz+8IvfdUhEasSay/g==
X-Received: by 2002:a17:903:46c8:b0:224:584:6eef with SMTP id d9443c01a7336-22c53606ee5mr301444085ad.41.1745381040103;
        Tue, 22 Apr 2025 21:04:00 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:d4b1:49c5:60dd:89a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa5828esm9512894b3a.112.2025.04.22.21.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 21:03:59 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2] arm64: dts: mt8183: Add port node to mt8183.dtsi
Date: Wed, 23 Apr 2025 12:03:39 +0800
Message-ID: <20250423040354.2847447-1-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_210401_469023_342CE90A 
X-CRM114-Status: GOOD (  12.82  )
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

Add the port node to fix the binding schema check. Also update
mt8183-kukui to reference the new port node.

Fixes: 88ec840270e6 ("arm64: dts: mt8183: Add dsi node")
Fixes: 27eaf34df364 ("arm64: dts: mt8183: config dsi node")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v2:
- Rebase to v6.15-next/dts64

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 10 +++-------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  4 ++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index e1495f1900a7b4..f9ca6b3720e915 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -259,14 +259,10 @@ panel_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port {
-			dsi_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
+&dsi_out {
+	remote-endpoint = <&panel_in>;
 };
 
 &gic {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 0aa34e5bbaaa87..3c1fe80e64b9c5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1836,6 +1836,10 @@ dsi0: dsi@14014000 {
 			phys = <&mipi_tx0>;
 			phy-names = "dphy";
 			status = "disabled";
+
+			port {
+				dsi_out: endpoint { };
+			};
 		};
 
 		dpi0: dpi@14015000 {
-- 
2.49.0.805.g082f7c87e0-goog


