Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3488ED74956
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ffCxZ2nFXFTlfxcGv5zSYTwlGZiMvXvgW6fCFKo5KtA=; b=klt4riqYaxmQob0xSVOcjdI2Jo
	WalrZBfjesJejkuKHTURsVE16OkgpIYcU8V4TcZfYqMzD9xS2hm2au8Az5uMG9OIdUL0CI7lTYhzT
	aJ4Dt5ES5vG5brgLwPxn0FpVXzN7xn1sEZVibDj3zx0rZVmKPk9lmlNyMyAW7ektZghGUGJV2yowj
	4Cce9s5JzA+gpRnOcz464/hcXW0v9hT5f3/QESKS1Lq91iqx9Bnsz8IYXuDyUZaoxBBu+0hh2cipU
	o66mF2uExRKGThYo+uPZsFGs/fkhvI64/8fRPDY6dgyVUJVdwUtRFNVKl21bMVYEN0qbLe77BGYUZ
	l9JVyaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWU21-00000009iAG-065j;
	Fri, 19 Dec 2025 06:32:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWU1y-00000009i9t-26je
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:32:03 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a0d6f647e2so22300755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 22:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766125921; x=1766730721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffCxZ2nFXFTlfxcGv5zSYTwlGZiMvXvgW6fCFKo5KtA=;
        b=U5CPWhsLr5p8E1jDWXGTb71aZev2UIpNt2v3mR+VtOih6FGdU9Adh2arqZSVWSmr00
         4EGNM69eOmHw0zxSdlRTguDoaCve1bi9HzSnAT1h7eMn6Z5FN/MKTov4S/JIOR2/YI8M
         No5F5EAe5fvQEKB43RqIVipYnnDpS40nupPZ99W6Xp08QhkY47sp1+ouB4N/8Hate1Xu
         eipVUmsdnkdw1YXnx0nhuGf0LKmWHppYkn2bneRQycWKAcJtk/BtVFac2BxLOgb1lywa
         M/Pfs7L8d6c3zKuYcUjrY4a2CQwAlgiee2wNNYA2q1DNe7rRcqyi94OjGIxLk8uCtjYg
         R5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766125921; x=1766730721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffCxZ2nFXFTlfxcGv5zSYTwlGZiMvXvgW6fCFKo5KtA=;
        b=vGrzlHfjcwwQL9e8chUFjZotryQkhegBuP5JPKJEOc9SPl3EEhHGDtPKej1oOIBinz
         aqBHQRhWmE5EnqXMTSeVVpf8LLtXcgQTrQC5TPg8uf/lMjwUDCRH8HNgBl1DHjvbgd1f
         XJ8SwtfeRby6HwW2d/1UEb2/3gWjP7av+ZtRnKf/3Ek06nY4n1lpSAbxi9p9UVtS5ryo
         JdvGsC/XS4y2c+LwDSDmbT4AOslZHVeE8Rn9Q0Dq0tluQLrzq5YrCnif0h8URS9Ssx+E
         yfwuLqQ7c/4PWPM8mv9kdy1+RxNqdG8eln3Eps81e5mSgr1GwC5yvxAVFIoU4AGPIdNA
         +ZGg==
X-Forwarded-Encrypted: i=1; AJvYcCUyOqSh7q1lwbgP5FEQyjxPVmmDbG55aZN4AdoLcc+XAryvlZfYuUD+FHWFmXkN08XkB4vuOGe+Pn2Z2QISR0MK@lists.infradead.org
X-Gm-Message-State: AOJu0YxV7ozob3v3+V8lpxcp2j8wABAedk5nNv7UhUCxpfmB/wgxeJiT
	VEGrhlbqibPJ0vd/1WH+67rKKNdLiNXvcAkrkBq4si4v01RgvTVEb3Vr
X-Gm-Gg: AY/fxX71UG79bIn+OPXTiHxNds5fNqvKR3g6qO3701+nHPVX33wUYLvgvMIUp5ZTZ/3
	jK/+Qe+bOcka2ysqvmKxl4M2ITPjJhEBU5OtXqcEyH6OiYeK0vPo66IDcZOWR7UTZzI7k+sXDLo
	Ib2pQK1SM4zBTXcJ3Lbytq1Ay3PpW7gMWgU3MPSm93JOjnFlG0s9AnAqQ5o3xv1U8ObfRQvx9eo
	S4VcaIwBZL72OPBd1y4nMgb1nh6E30e9GSxBDNwgD7zM+jD4AHzw50Vx/8Ec5xZEo0z1YaVMBDz
	ElsQUSBF5vWCfJTurQo3WmKOdi0Eqn1iIWFZwwl7d6bhRVBhsfllEnswKpb60rdY2ugYXzjw6NM
	ibWxGH9TFxTnzW6r/WzJdvJsQWWnN8pDntbaCJwyHyY9paE3ZRB2xtuWUZQ7Y6hCv360n1rqJlt
	VdG3DSOqLnMBRwtVXBBARiStz4Gw8jPtdmYBtowBrDSK+zQhsuuXwXqJckrXkCQX1+CO0Gh2uVA
	qljg0L3esjgUWs=
X-Google-Smtp-Source: AGHT+IGyFhky1G4hqCr+wi/pSF3CrrH4Dip8ZF3rUWremoK9ISMKxqO8TRKZ2xEf6hlUkzi4PRFAIw==
X-Received: by 2002:a17:903:40cb:b0:295:9e4e:4092 with SMTP id d9443c01a7336-2a2f2a41a37mr17259965ad.56.1766125921058;
        Thu, 18 Dec 2025 22:32:01 -0800 (PST)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c74490sm11679335ad.5.2025.12.18.22.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:32:00 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH] ARM: dts: aspeed: bletchley: Remove try-power-role from connectors
Date: Fri, 19 Dec 2025 14:29:48 +0800
Message-ID: <20251219062948.528824-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_223202_546206_EB19EC48 
X-CRM114-Status: UNSURE (   8.51  )
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

Remove the "try-power-role = sink" property from all USB-C connectors.
The try mechanism is unnecessary and wastes time during connection.
Since power-role = "dual" is already configured, standard USB PD
negotiation is sufficient and more efficient.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 7c27bf6bb51d..d1a04b63df9e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -414,7 +414,6 @@ connector {
 			label = "USB-C";
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			try-power-role = "sink";
 			data-role = "dual";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
@@ -501,7 +500,6 @@ connector {
 			label = "USB-C";
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			try-power-role = "sink";
 			data-role = "dual";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
@@ -588,7 +586,6 @@ connector {
 			label = "USB-C";
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			try-power-role = "sink";
 			data-role = "dual";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
@@ -675,7 +672,6 @@ connector {
 			label = "USB-C";
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			try-power-role = "sink";
 			data-role = "dual";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
@@ -762,7 +758,6 @@ connector {
 			label = "USB-C";
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			try-power-role = "sink";
 			data-role = "dual";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
@@ -849,7 +844,6 @@ connector {
 			label = "USB-C";
 			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
 			power-role = "dual";
-			try-power-role = "sink";
 			data-role = "dual";
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-- 
2.43.0


