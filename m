Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09683E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 06:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyTPmfk5nlWT6oblaTqVg0NzyCQ779C0HWVuTXhDcag=; b=UcCgrwkSoCKEeHvrChZ78EkhW8
	dWhTTSaePqU8iZZayjFovByc69QEwxaj/Iefm/KsS/pF01C77Z3dlWU7HYic8k6ac5vbAxa/XMKmJ
	tQJ5KU3rPK98h4QzgUW1BABZHtGB8kgwjyQkX9yc8iTpdtORGTIflUeA+b7FQCOsXG99jcou/hWT6
	slxTgotMAOtLqcVQq6amP2xfdKMRjat0Xa3L/fJ3M3Xlhb84jWJbBtw6VRARXYExUIU2txc5A8Utq
	0lMxEGie+FxFS7OpGegdhqT056dWUzp5zJYVvLbBzGIb0WXh1nYjZsvQDZqGxCp8hPbuuqSc6S1XP
	yTlquwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcdN-0000000H2Mp-0ZYE;
	Thu, 12 Dec 2024 06:25:13 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcZO-0000000H1Zb-17dA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 06:21:07 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2162699e0ccso536485ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 22:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733984466; x=1734589266; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OyTPmfk5nlWT6oblaTqVg0NzyCQ779C0HWVuTXhDcag=;
        b=idngwNE4zv1SUxeoRnim0HiGE2vsTJtL2AUgm8+/MfxgjYxtqDqgZZvtEjDRSxC+dV
         2kTBtXBJi1YrwqcWGrD2adLDRo8GW3Qvsp/zsY9jeO5Flhd8eC0jGJLAFp9Wn4jscWFF
         VrcMhipGh7i1CJcSKTHgNgS7C297TPWd0JAhWIPs/5K+Xutqe1O8HPTXIjWpiUXAL5TK
         rFp/84qm1mUg1tJUKsQUsTgme7FnquVtk0WEeIbEHR8379DP2CzjQEUo5xBEEEcuoHD9
         bJwQmTfFHJGk0hUZkIgncgSEIYBz90BhFSFQtVcHQvGImrm3uqNZhMD5qQhvdR1XNuHA
         q8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984466; x=1734589266;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OyTPmfk5nlWT6oblaTqVg0NzyCQ779C0HWVuTXhDcag=;
        b=eq54sUBCVHYM/u3vseeo0nOyLQYw6f9+8+7o3GIigqTMGil3bBPbX+S1lGkpQresR6
         /OJUPP1pfp6E3fiWvUe2RJ1frkf4DIOFfKmTStReKgWzyfpmCH5BsRPJBs5LaWxPaKe7
         On4IQeM09pGwlxLfksUgo1VI/Geu5gWhQVtkaK9r014w5E1hpaynFU/0SpDLSYr3SivS
         KE/qSE04PWAKxi/ldB0QNDiGuSNBb86cuchSZgZrNtVcJNW1lbFZqhcupMLB+peMIukV
         Ikxjq7sPffbBpJAz97GW61m6S2UNvE8ffEMPiH4ys42QTAX2KorX20k5oPieTlKhqwUH
         ze8A==
X-Forwarded-Encrypted: i=1; AJvYcCVi0W4DrB0807n/HjDF9Z1MV75nMfXib94OjPOPTe+UbalV6vIBhRf8TKAQZofYb80LgMNBR4qGFwWB7R22+WHP@lists.infradead.org
X-Gm-Message-State: AOJu0YwVI5ywi0isUiRnMHFpRYfAaXT8npmYyKcgfPB75ac7EIicWgWs
	oUIJkRFEP0taU+UdJNnnkyEe7USSzLRB6ao2Mh/2HFXzT2p2+oG/lMt1x6bgTfQ=
X-Gm-Gg: ASbGncuROOTfQkI67y/J6lw+Yp+OPHhgGPRuWcxVZ2xiOJ7B95etSPu87pnSpcdi3sR
	4PzeDU1+9hugmsuuP4noAmJlvwsArZQjG3+2deLylwsnp8injMnY8sYYOvX+FLZgKurebr1XDST
	aSHEcLS32Fkfs1VnDsCaZTaPnx1RpJSxYniA7Qpc38EQETaqX1C9s6UeIqPfw0RFJ5ysfJC3VU7
	QJW/fC08l7beHUKv3TOl3V2RVVD7ZA0y4nfHZo9WaWvV2LVsIKFVVYg+vi/XVeT8a80KGrzCkNO
	Wfxj6s3vGq5vnpz5MZYO
X-Google-Smtp-Source: AGHT+IFTcByLcObOG6og87W+8MmWO127PMV4RjfGUn4gbh7uXS5H+igPgK+lk69avI2I3fCZBkEIxg==
X-Received: by 2002:a17:903:186:b0:215:2bfb:3cd7 with SMTP id d9443c01a7336-21778592996mr34393885ad.10.1733984465748;
        Wed, 11 Dec 2024 22:21:05 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c278668sm83579165ad.81.2024.12.11.22.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:21:05 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v5 3/4] arm64: dts: mediatek: Add extcon node for DP bridge
Date: Thu, 12 Dec 2024 14:20:45 +0800
Message-Id: <20241212062046.22509-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_222106_301349_FF7B9017 
X-CRM114-Status: UNSURE (   9.55  )
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

Add extcon node for DP bridge to make the display work properly.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cfcc7909dfe6..e324e3fd347e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -424,6 +424,7 @@
 		ovdd-supply = <&mt6366_vsim2_reg>;
 		pwr18-supply = <&pp1800_dpbrdg_dx>;
 		reset-gpios = <&pio 177 GPIO_ACTIVE_LOW>;
+		extcon = <&usbc_extcon>;
 
 		ports {
 			#address-cells = <1>;
@@ -1656,6 +1657,11 @@
 				try-power-role = "source";
 			};
 		};
+
+		usbc_extcon: extcon0 {
+			compatible = "google,extcon-usbc-cros-ec";
+			google,usb-port-id = <0>;
+		};
 	};
 };
 
-- 
2.17.1


