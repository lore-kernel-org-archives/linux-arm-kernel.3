Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07572C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 10:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC9ffH/nTNUFv6K8T3S/PFYpK8wABX0lQdic/jOeTiU=; b=nXuCxFzx4DqKSunIU+P8GA5pfC
	xdTJ+c4WWd1xc/EeKN12fee1ObtPTSCvSl1gzQbCRsba9WofaIfALphuij4LSaZ6K/1CK7O2nsZ4n
	cGkJFk8h/FMr8/XdEdSTLRtAYN5rMr6OkpdSuz4oYAcAEEGCZKa8hoWELxVW76N8XxrT85zKNNnWa
	EgjFLLkg36+FPzCurq4dKSmJgSFDpyrZSUZcyl+3ZRYbLPflVGdb/MN2PZ2yL0jHFbrqt/Qc/mEkg
	BVTEQ3OL+e1LdjxMwx7L74M2tvaL+yPPAdplg6ZD/77E7RzONFbb99I/dBmSFnNol0m92Y+CVQbK7
	RGv4RkYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ60l-00000002BRf-1qGu;
	Sat, 18 Jan 2025 10:25:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5yK-00000002B3F-1nBj;
	Sat, 18 Jan 2025 10:22:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43621d27adeso19245055e9.2;
        Sat, 18 Jan 2025 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737195751; x=1737800551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nC9ffH/nTNUFv6K8T3S/PFYpK8wABX0lQdic/jOeTiU=;
        b=WcAwtKEvV6dUw9tOzueX7AuZjhzKPt3fwlk1Rk3wPDbS4co7qpFX5zGakxo5lyo4A7
         zBROxrWxniNx2wHqoF6ReoyoYLvPiEAq6f5bOu8tuPpmTZvzBHz3uNC8H3DQ9ZLOw6qn
         fnDG8oOtii5mDjTKRmoS3FWlMhOsU19zM2zOpcth/h7/tJtkQRwPCGYR7pinoYRfjOjs
         8z5wsE7OjxTqJL+c/nR7skcqRK4RzCUGm7XETuYenO7b+Z1AXglRlVscb9MbEN6vXgD7
         Ge/qvHm9O21XUobMMRr+iZv5rmu0oTF/KEzXxXBLGqa+3YEYYJXp7PvZptTDTk68QneS
         pRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737195751; x=1737800551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC9ffH/nTNUFv6K8T3S/PFYpK8wABX0lQdic/jOeTiU=;
        b=N8+NyYT4kgVkSzcdWNmMfIQAo6QZb0+MBtKe8t70SxbFnkCkRBd4xtljgicWHSkq5u
         At5ItwR8HTZJqQZUg73UIQISfiWDjFPdjlUXfGHRjrpXPx5eZ7OwBMv4zaYspR54DED7
         vhGA4tQPTOe3k31BN1+eddWZGII1NtPuQv39BlsEeySQr/O0rFNUXv7LvWjdk+IUCGFt
         db3QmfYhqWauw2ZFgDeTwHMLYwLKTJRveB/d5xfDHDrIxa65LTOJq01sw1SUQMIiT1yr
         ijcULpD4GIfWxspekTtBbnxKqoQjXjRE5LkSBQ20hdrQsSS3bf30B+TmJE0HsL1KJpY4
         S/eA==
X-Forwarded-Encrypted: i=1; AJvYcCWssA3sDrVBggD79wXTDQMPY1CLWXpxfzJru1qQJriL7VOMA+SwA0JumQbS405yj9GwJ2jMFESPQYZ5hvtMHtWj@lists.infradead.org, AJvYcCXSuXratiZvro2s1Ep2Vz/inhNyNr/x9nmBncUAtf0zWAgd9gE1MSzy1WXH/ZuQ2iTSOmRSEFCwnUe8@lists.infradead.org
X-Gm-Message-State: AOJu0YzUjO2pHSbfHold1AQDZtcuMG/egi1KlkxGVr9T+3i6SgT+PIAj
	XrksdnQgU45B4M+0kgIqttIHyOUwSOl8PkPA0KCGEoXCws1DWdN1
X-Gm-Gg: ASbGncudpJcmHPkuUHh9SntTrzpVje7aRqS8Lkruj9qWT7KO6c2Y1dKQHxvqJ/9byDy
	3Xgrvz5U5y+aN/VixDZ0RgO1hNiezMAwZTQX2r1n7RnePuUODhwcMPJRr5kQ8p/wEZqTzJ/xmuV
	0zj8qE//Jrg66mIK2XQpyVnMdWN27wjJ/UoRlUR5bnS01j48gdn1VsXua7cmpvZuWww2Tl+bIyZ
	qK7YPidyzUG8K6LZ2KNxniBIDNsQR3mRUJbJUQh0Oy5NQpfRCY4vGr7Xf/FsaHYtzn8Xdvd8QqU
	wZSuEQWDc28IrIAEJb2ln0HtRmSPjOV3FwX5DmJDldB2NB1aEoYM3NY5/GoGj3swlY4=
X-Google-Smtp-Source: AGHT+IEzVhZwb9RUCfq/ONUwCHiNJip3Q45A/4YRARL89NaJTkSBtQ24v5vFGO4m8bxs52aAynsUuQ==
X-Received: by 2002:a05:600c:5101:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438913c85e0mr55777645e9.6.1737195750502;
        Sat, 18 Jan 2025 02:22:30 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625f5sm64954515e9.28.2025.01.18.02.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 02:22:30 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH 2/3] phy: override dr_mode for phy0
Date: Sat, 18 Jan 2025 11:22:05 +0100
Message-ID: <20250118102207.9339-2-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250118102207.9339-1-simons.philippe@gmail.com>
References: <20250118102207.9339-1-simons.philippe@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_022232_467403_B9C19DF4 
X-CRM114-Status: GOOD (  11.74  )
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

PHY0 mode is fully determined by the selected mux route.
Ignore changes requests from controllers.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 24fbabe7a..f163b355e 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -544,6 +544,18 @@ static int sun4i_usb_phy_set_mode(struct phy *_phy,
 		return -EINVAL;
 	}
 
+	if (data->cfg->phy0_dual_route) {
+		/*
+		 For SoCs with dual route the PHY mode is fully determined by 
+		 the selected mux route (i.e. USB controller to use).
+		 As both host (EHCI/OHCI) and peripheral (MUSB) controllers uses
+		 the same PHY, both drivers can try to set PHY mode.
+		 We need to ignore this requests, but not report error in case
+		 of valid mode values.
+		*/
+		return 0;
+	}
+
 	if (new_mode != data->dr_mode) {
 		dev_info(&_phy->dev, "Changing dr_mode to %d\n", new_mode);
 		data->dr_mode = new_mode;
-- 
2.47.1


