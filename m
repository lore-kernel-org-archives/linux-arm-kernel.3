Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D3AE9271B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 10:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ri0p4U6CFfsvzwsMRp5y6y8qxmA/cHDioM6peECfnxE=; b=iULt3QW709bIsAMf47pxFTST4y
	2q1EdnExivwUfWWAokuHUMwlBxWDzg35/RQyDMnDJLZrWBbp7p74K1gBqJwBD2lMBJ18oSHsGBUWK
	oZX7Nwhuo3sPnkB42xMMbhvRKf00XRo+9XrFMhy0MINQJvNu6yFkSxG+oHyrUj1r5JYq0ldaf5ICf
	MrHkY1d0QV88V/fMV6xu2CrNNLsGS6C4KDDTD45K/7MJvODHxZ0oSAU7srg9KcCp0XXGD4TWExILW
	h3aAGGHInMjFykCSqofDBOkNuMkmi6FoFd+3r+pT2yO7q/Ih1T4cqtxUf4vfYM237ZVsRxw4HrAjb
	4glYYDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEn-00000003Xqi-0dBF;
	Mon, 29 Dec 2025 10:12:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEj-00000003XoF-098e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 10:12:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so10149955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767003143; x=1767607943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ri0p4U6CFfsvzwsMRp5y6y8qxmA/cHDioM6peECfnxE=;
        b=f0lChMLj1A3RdIIXWDt1bjGT9+tLt24YPuHksuNWlGdNc8QC6cvf4j2NZjZmvkXg7Q
         rHsO3li+h+ni960ReeV2wBVFEdankfoAFTxzwz1CA5mEqZgpVHirGXSYk8S4lJ9634fq
         VPhAqjRdQ2cxYHWksulwG4pReIdIFiA9p03YSLRg+CUWGpHT3/QAqvTXH+4Tlo8vCGFw
         AniLPlWO8IFlgCWUbiCJ09BzEtUsOp40exZj+vSJej+D59sgA24RogUxByN04B0zOJdw
         dLKLleLiytjXij5HSfYTQb7g6FDAVoedWAvklymgjaL1YsYpnlStNOh0PGOBzwrMV+H6
         9luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003143; x=1767607943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ri0p4U6CFfsvzwsMRp5y6y8qxmA/cHDioM6peECfnxE=;
        b=QgFgVvA7hPzoh29uXkKtuQMTfq1wwcm/RuFgK9J5B2aX0wn99U5WTgbiXeUob8mNef
         oT+t7/4tfe7AXHTNwvKkJRcy6ds83ZtnVRQGxoJcbUeWDrAUjZZCMt0isHxn34Yt6n3V
         6TWmIPnVnFiuQRLnNnNN4fdzl5V4iHTYP7Q0Bkgkq2Cs31oCkM9NQHAdYY+gYLGzK1Z0
         J2zwnelZJ72hY1xkcjodK+rf/6xg0CsoOZNY7Tfg+a+GTVZ9Lg18mqOC+MBVDoZSRoO/
         8tta+4fDMIR1PZ0lOHbqrK4aoRCung7hP1ryGqXPFZ7/CxsV8TiU7uaTlf5RQ1gWyCpY
         CQbA==
X-Forwarded-Encrypted: i=1; AJvYcCU5cnaTKkJKmV2QaIFSPKtAEG42kJDiP6HgjY9uT7gAoEH9duLrZuaiRNT647tgVKpzS2+xCB+lK4JqyM3PnPzH@lists.infradead.org
X-Gm-Message-State: AOJu0YyiqOZf0TJjFGqx813UaXEsHZ2wCMCSYwknnFsRcIMMUY6bsOv3
	MvBMBbA0ZVHI6tsgmI4UpEL2CnCreB92P9tdMqsfE3S0mA5w6dHtSGyN
X-Gm-Gg: AY/fxX64lTZDRjHL4meSX03vBA6uNEGijlCKyiSJ7nX2A4bIMZWaiv/Go4jLDKCSjO1
	iRdjaHHMvu3Fhtnjfbfp3+t6dMYxy8TDGrkG0gkxR55uiTeWc2zhMfuVpK8woD+dXvQ0eTuGM3L
	zto+3tgJ5Hgmc3YpG3l7VkUfUH7twdqOldtUdAmFkrxnk99MLuhXgKPJfwEP+BtiT2+t7KuyxFu
	WKaFmdhrbJNfnYUWkKAgzGx0Q0sEZjE+Z4AsJhlnffNxSL1vnRQfEy5m30L+i1HA3UwLCKOYMSH
	r7E66qWUWaXpJySNGqiYsoxFBboPzROZ3WUsGzngCvYWU6siI/hS1HfqE+oj/uIrZLK3jqfJ+8v
	GVlVmvnlWogbBB3DUDx5ytiOjXBs4ExYjK9EvAEorIuwxLrirBxhCvTjXpww+IriQ5LkTAM0UaM
	ZjpqrbuOq4z5s1ZOEg7W44VPK61+ZX9D9oq8rcgbIqlSoPifSPdegLpCtr2BIQ
X-Google-Smtp-Source: AGHT+IHJS63lS/dPKoA9lGVZ+ST8crjqL/wpGYOYPkSn4ew0eH8IPo2DWmLK76jUaU+P9S/JFHAnzg==
X-Received: by 2002:a05:600c:468f:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-47d269c7019mr304884895e9.18.1767003143012;
        Mon, 29 Dec 2025 02:12:23 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-45-246.alshamil.net.ae. [94.59.45.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d583f42dasm19840735e9.6.2025.12.29.02.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:12:22 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 29 Dec 2025 14:11:58 +0400
Subject: [PATCH 1/7] arm64: dts: rockchip: Fix headphones widget name on
 NanoPi M5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rk3576-sound-v1-1-2f59ef0d19b1@gmail.com>
References: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
In-Reply-To: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; i=alchark@gmail.com;
 h=from:subject:message-id; bh=iE2CbCdrK0vI0FrVCavjC9uDM/vsBwXeGKRyKumfVTA=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQGhTAyn21XXvnWgbvV1bfrVXb3d+4/09j3Wy6MDfv3f
 HW/jgRLx0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNt0czwv/xx55SdHdc3+vGw/vAK+MT34Y5LeVXqjptBHM8t3W4majMyLO/fV9j
 3R2jz/Z8/lb8YLTwVmbUz5dCkm12qVpMynSIqGQA=
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021225_139444_C771E41C 
X-CRM114-Status: GOOD (  12.16  )
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

Fix the mismatch between the simple-audio-card routing table vs. widget
names, which caused the following error at boot preventing the sound
card from getting added:

[    6.625634] asoc-simple-card sound: ASoC: DAPM unknown pin Headphones
[    6.627247] asoc-simple-card sound: ASoC: Failed to add route HPOL -> Headphones(*)
[    6.627988] asoc-simple-card sound: ASoC: Failed to add route HPOR -> Headphones(*)

Fixes: 96cbdfdd3ac2 ("arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index cce34c541f7c..37184913f918 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -211,7 +211,7 @@ sound {
 			"Headphones", "HPOR",
 			"IN1P", "Microphone Jack";
 		simple-audio-card,widgets =
-			"Headphone", "Headphone Jack",
+			"Headphone", "Headphones",
 			"Microphone", "Microphone Jack";
 
 		simple-audio-card,codec {

-- 
2.51.2


