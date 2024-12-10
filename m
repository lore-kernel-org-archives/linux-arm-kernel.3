Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936C8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAzIOGNvVkOkwBb1FvOdH3YrtXy61Q+UrPzyrwYWppg=; b=SVpK2JhvBaU79ACGD7rqGBPnf1
	AvjU+yF7W9OTvrDUk2w3rJfmvVCIVKZYG0OA943UZTetOvEqypUGFJW5BTJJGSQv8hx0l2GC+xvqY
	0Rrv0YnFM1rNabpGNSMXul7VQKsy+g2XiSqv30TUKguCq25AFlbfiQaY5ZznVLsuTnKaTawolV9fI
	UWyD8CkGIaGeRutfBGA8Vs7C9AqJKZSBGwXZ2pb6om9TdK6dw9S+CbJw4QobxciO9FNCwukXPMPBR
	TtiSFQGv4qS+/dTPpu3F2o0IbMigSPX7qHjZvR4w5f/c6LSj7ZUzdshM4yg4DV/nkFmNLR/h2xVd8
	EVWdMw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxzK-0000000BEnc-0vQo;
	Tue, 10 Dec 2024 11:01:10 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxvc-0000000BDtw-24V3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:57:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2161eb95317so34823035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 02:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733828240; x=1734433040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAzIOGNvVkOkwBb1FvOdH3YrtXy61Q+UrPzyrwYWppg=;
        b=DHFxhM6ZYoY1tGnqH8d1hqXr2KUJLaNjNfS164FqsFGYi4P6YbnYcVOZnhyC8E9/c3
         JJM3U8Vpg+z17i8y+DSQZmfm9bIV/fuGYMZjs5vNcKeRXs1t+kQHeukO3seRJWwqPgjQ
         mflY5rD64JL1J0wgGlmVrWQ/EGsy2Oiom7OHRgAqt8/i3K0vjeHvg0C6SeaTLlESHHxc
         WbcZPgjX8SVMRdI58TzyxI89OUZcxidJG3EoT+5epvdMMHjhhSfdJStgyum6rdUI7zSI
         He8laWpJfWguGwVma2etQgJL7e3RrHgvXxzENZFalQelK5YYSQhLIuqt3iViaovWll/2
         L+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828240; x=1734433040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAzIOGNvVkOkwBb1FvOdH3YrtXy61Q+UrPzyrwYWppg=;
        b=uVp1gt5iJx0RBRPro/fAnOy0pFnEwmKN/cD/8rkYWzJtjhXpwO8nKI9V/wDv4O6hF0
         prBtowpckz7tgzvk8Oa8yl/gjuZ2piaiMJaej604PuGyHnlEL4mlkGOSQvXXxxgM/h2C
         GwB2wc1aRoTEzqYKkxXSV5tdpyb57Wcx/rXzL/iUp2NkHPfQp6Iv3sKLgrIhd9ikuMwp
         6+Ib4shFVolzgSHAwwXy8xZJqTE7tUPl3WeVaxomMGl2+SsjgykzsW7WIcNJ5caejmc+
         ksTjxoeRyc3LVQS5vtMWnFR/r1NvoRvb+QSmDRRJ02TLe7qGtPDxAKzvPBjbOBrH8mMO
         zF6A==
X-Forwarded-Encrypted: i=1; AJvYcCV46pvmfP+ao80D4MDStq8/VW2I7YOGH2kfWWN4XEKLzO0SwKhSqpitKKhX4Eb3Mdmi1mQz0ozJ7EC9AeFZXmP0@lists.infradead.org
X-Gm-Message-State: AOJu0YwWjy2F1F4b1QuBWSjai2J4kqbkz1j+P5gktNqgrqeL2BY324Kt
	0fH1wWos/wYonDVeDRgbEc5V8ckCc46Ob9KD62o+oF8qQ+u/JjEn
X-Gm-Gg: ASbGncvHosDOXGtQ8XlENAKURtuEhqcNiLienH4BCHtRRm5m8WOLwyti5MxMN1rUFiq
	J4Ny9A+CUvzA2YNmDh1ClNvvqmSbEB/AEYJmm9hXkV9TrFdwnHl1E5eDjZ02ZK+IjxPYHJKUngc
	+DTAlIw6ZOlw9wdnk2jaDV8/QC/erVWohur90ksjOV4dbogid1VITsuWzNDtHZ19rluBvXb/iuV
	kCa6A9LSHSIbTvm6F+TAI1ZQNwYss/u9gjp4vYalNl2IH0Ycbn8Cu15euVoDUnCJmy1
X-Google-Smtp-Source: AGHT+IHSsGLpcfdmpEL4Mg999asmKbIgDSP7cOPD03IZvcIVz1bYQgiRC4EJz7gHrP9fENJbgq0a8w==
X-Received: by 2002:a17:902:ce88:b0:215:4a31:47d8 with SMTP id d9443c01a7336-21669fa3baamr61082485ad.9.1733828239875;
        Tue, 10 Dec 2024 02:57:19 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:23ed:f795:ef82:746f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21615b1e6d6sm71068955ad.104.2024.12.10.02.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:57:19 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/2] arm64: dts: imx8mm-phg: Add LVDS compatible string
Date: Tue, 10 Dec 2024 07:57:05 -0300
Message-Id: <20241210105705.116116-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210105705.116116-1-festevam@gmail.com>
References: <20241210105705.116116-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_025720_530493_3C686572 
X-CRM114-Status: GOOD (  11.56  )
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

From: Fabio Estevam <festevam@denx.de>

The imx8mm-phg board has an AUO G084SN05 V9 8.4" 800x600 LVDS panel.

Improve the devicetree description by passing the LVDS compatible
string to fix the following dt-schema warning:

imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of
['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05',
'chunghwa,claa070wp03xg','edt,etml0700z9ndha', 'hannstar,hsd101pww2',
'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Added devicetree@vger.kernel.org on Cc.

 arch/arm64/boot/dts/freescale/imx8mm-phg.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
index 75bbedc6164c..a134b1833649 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
@@ -82,7 +82,7 @@ reg_usdhc2_vmmc: regulator-vmmc {
 	};
 
 	panel {
-		compatible = "panel-lvds";
+		compatible = "auo,g084sn05", "panel-lvds";
 		width-mm = <170>;
 		height-mm = <28>;
 		data-mapping = "jeida-18";
-- 
2.34.1


