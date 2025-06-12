Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065DDC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jJKRD4IePTu10KXLvHxej7LhzJE2E9K7kjr6QynOkYY=; b=lmvQYtNWa7JbcwdKVTVFKEKlTK
	P07GY7D7N/ARZMSqjKMxUY3hb9rMVI364tUTqLEoTxzGM04m3v+vh5zsGQbabDljDP5Hv6kE435bW
	3IRuvp7QZYMflVP4HSm3QMVWlbwILXonic/lSXb4gm3tewxikHQGPfYtieOW3dpVmmUlBCNKjh7VQ
	IzlIgjcGz2NIFK1PitvjvSwjfIJo6qc2OSgOSZO55y1WXDvgTCKzw93QyradS/7NZ1vtaEeIYaBrN
	UT1JLs5ihpnbqEMz0JU76U5kXB/C7i7MXw+m5GkEpSE18WHtyHFBEr7IEwMa7NYOhG1xOsH/d7rRW
	A+mAqnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd4S-0000000CZfh-3nC0;
	Thu, 12 Jun 2025 08:14:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcf0-0000000CVAs-3npE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:47:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso1701515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 00:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1749714460; x=1750319260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJKRD4IePTu10KXLvHxej7LhzJE2E9K7kjr6QynOkYY=;
        b=uCSUzxw9DiOPdAgD3vbZvzqO2m6q7zFWC4jyuZGf2DC0v5G2lUbckBp87Ks1URbUdk
         U/Pt42cNYn0lDr/iMImD+yOjr+M9X4WDH1GXjsJdzKvNUqp2XP+jspChulRvwr6z0TBQ
         PcxGG9x013rrkbHeC3TjRwYbA2RNfl+YJjtPTyblY7KC0tg4YLbPLZg3OeYoCmvfiiQa
         HI0aS/a0PVhmntUVeeouX/hnRKTKrCKoGy/gsKTQHaCi3bPizWccmTlMXMqL38x2x4aU
         x9hZje01hyA+iMDVLcaTgJ7dYJ5KsnU1eL6SYgnk6jqBtkVvwsgeaDzfdvFWgIef1pYi
         fjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714460; x=1750319260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJKRD4IePTu10KXLvHxej7LhzJE2E9K7kjr6QynOkYY=;
        b=ZqM6nx5xVka7RLg24F1sGdlaVLzFV8rSUeTPdqDfC183XJxpmLiiZwJEj3RxySD6n5
         xuPGMWuoPdHuK8OdHBX+MjkNVBlwqjb88mfN5p/ceMRdh0cebIuxGLpo15dQUTgcSeXn
         P7TVS0kqUtRG9eTdMAZUD0+KQ4fM0uNROxAvO6sOtveBR0IcIXUE/aBDLcWqjmRXFrHb
         0gikVeGXeN85MFGUIKGOkqMa5hJkV0ROkGDSB+gARUE0hrspj6KghBfsnNCmvDYGAoCK
         lN3Dse+sW1hVUkmPRQouipbXsYLVOum7IcN40rMEklelxcGvhU8QVXayd0GBIAe6uagc
         1xgg==
X-Gm-Message-State: AOJu0YxgwTcEGXsGOyXOFaU8iRCfnPoNUqtW44FWz9QojF37ZzxNAd1t
	yKX6q/02HneMKp5S/jTfNsG10znVL6L1Ywmn4aaIgsM04E02GURRPEseHwS8GJrJyFaEsne+Mft
	fNs3N
X-Gm-Gg: ASbGncvg/gHA79rFB7sfx0qOOEkYN+lRbEwlanySSvp72F47j7wq1iJUUxTmzHSJUEI
	Mgq9a+O2k/DtPjakd/MIU9qu9YTNwrg0IorNwfruegPIokvKRvRc5z2Zzr2uPQThmrnvP5d/PNn
	Sb22SaDLxB/arCxxDbQgUMU2og86QEeDpd7hH25xpxYHCDGhtMKfFb4+opCDe4WyOHB5Ut1IoYx
	kHYEzw33UR9YveuPfW1yj5BSy+YZ1msw69uPfnBydTqTSUh0vF3wOFkAXV403fT7VVrTM7Au1eF
	EQVGGNUhLQCDhS2CaMD3I8BOdtQHj39dVu7PbwigPm2D2TKNionmS+bV2g2+FeSviMHjcowSiuh
	P0osXwXJQ
X-Google-Smtp-Source: AGHT+IFSkj6qmkZNg+QbLrL9/7Aw6gNVIRZ8TKO8D+Q27noN8R5iYt+bQxJDG5xAEMj4b4uQzbUCaw==
X-Received: by 2002:a05:600c:1c08:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-4532d10857emr18770605e9.24.1749714460176;
        Thu, 12 Jun 2025 00:47:40 -0700 (PDT)
Received: from fraxinus.testlab.hub.hqv.ch ([85.195.220.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c229sm12398025e9.6.2025.06.12.00.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:47:39 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-arm-kernel@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH] ARM: dts: microchip: gardena-smart-gateway: Fix power LED
Date: Thu, 12 Jun 2025 09:47:37 +0200
Message-ID: <20250612074737.311346-1-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004743_178062_9F2C46F6 
X-CRM114-Status: GOOD (  13.52  )
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

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

When starting up, the GARDENA smart Gateway's power LED should be
flashing green. It is unclear why this has not been done earlier.

The LED frequency cannot be configured in the devicetree. Luckily, the
default is 1 Hz, which is what we want.

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
 .../boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dts    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dts b/arch/arm/boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dts
index e0c1e8df81b1..947c011c1b00 100644
--- a/arch/arm/boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dts
+++ b/arch/arm/boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dts
@@ -46,7 +46,7 @@ led-power-blue {
 		led-power-green {
 			label = "smartgw:power:green";
 			gpios = <&pioC 20 GPIO_ACTIVE_HIGH>;
-			default-state = "on";
+			linux,default-trigger = "timer";
 		};
 
 		led-power-red {
-- 
2.43.0


