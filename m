Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D707E65D34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nGyAp1GyhYl2oD3HxN0dzLUQsgdlrr/vXHVyJmj6nM=; b=G8Xo5cCSfzgzkVcMqR9RsTj4Ag
	Ta5Vvak5mXZfzGy8cMj8VJ+3hJ2IdWixF88TiFW75Z9f+dB02ZsqkAhbErWqEYpwU3rILZe+t/62G
	KOVi/LfnwYfK2GhKLM4JM19g6gKGU2JxdhWaG3zptGKRfouwCxOtDErZhK1XP2ndx8lOXlmzzo2dL
	rOjQKkOiFCis1ST/dxMLUrKRsCZ+Czy/z5Tl2CgQz5WkGKXuZ3GvpPQXsGpuW9KNvgZuPGU90GMYj
	FOTgNdMCsYk0VJB/1aCJe9oVTMiTFRMwR8Il0ylMj42kSh9GHdy4Pg4sduQpQByZIePsCfwijM9b6
	v3LEqGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPIM-00000001xv7-2nnj;
	Fri, 22 Nov 2024 08:45:42 +0000
Received: from mail-wm1-x362.google.com ([2a00:1450:4864:20::362])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPEs-00000001x3E-1jBe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:42:08 +0000
Received: by mail-wm1-x362.google.com with SMTP id 5b1f17b1804b1-4314b316495so15824355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264925; x=1732869725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nGyAp1GyhYl2oD3HxN0dzLUQsgdlrr/vXHVyJmj6nM=;
        b=khj8jb8I6LrwXjWABtAxm7IEBGaVbLToJoPicW3uBkAoTwqMEZHb+n66dsZeVkUydT
         THunQDgrzhgjZgAsr4pQSXI61JlKcubO/jAptv8v10MXVbI4b23ZxyR931px6Np63SK4
         87oQdPApjHN/IbcNsLiR1qZqXfqz5Pw0OTC0MOZ867IN+caBciNfUA4qEa8OSmnWyCE5
         wlaP3J0YNrbt/OdmtNTzxuQK63gzqzsZhUpBbYGhNurkGxd1tbKEgqeI3yTdZ3bGyMAi
         mqS/zNVsOrQrOgJ2Yinc7CYF2ia1+mqdZGMx+J93jD+/CtmadrEiFJy82NvCCqsuNiW7
         iUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264925; x=1732869725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nGyAp1GyhYl2oD3HxN0dzLUQsgdlrr/vXHVyJmj6nM=;
        b=IcA4Io9Kb7xlZbdI4i0KHBTjXqgKl050ek1mD4zTWRCn3byL8x/8P++Ngu+TNcRRbX
         czu/XsnYxHwlx2f9ouoKsI8tLvdh2V7nLs4uo7wpnKSwD3h0gGUKMmX0mnyAuXOuYgzN
         q6q25IJ2aVEPSGLMAL5GsK3X9TkSZzexmQaQh8LEdEG4WkKy5E34MJdJ09YDOzpqvRA3
         nQHZteKgpixzvm41sB3ktsMtGfrYbsqlXUcHLeWh4hk57oAEmEHRfk0aRWR87ukBR9QN
         aFNw9ci/QfHn5kZ45GzPSKJ7oaVwKLPqx5ZXA8IUAOyvU5Q/66uQ75W1HoyTqiVDQiCZ
         vAtw==
X-Forwarded-Encrypted: i=1; AJvYcCVLX1n8EpXmBcAMnvtvfkksnSZmhxgm0PeXj9YlvmsTlVMjfVPW7iy4JRn7/YAurtfUnNnUEsXVzFJ7E17mzt1N@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfb31Qr42/Ge5L0M4Siw+wbZDT0X71RhERLRH3/CDvIEFHCGTI
	jmO2xUSeHLU7dPS+gc7XNHDjMUfkfuo9eR8MHo1jixumAilSIC+wTmdDG8fXlnrut/IisHtZ43u
	CiOOrHz8GVe7QkIzv4c/Rf8q42y2CQqU7
X-Gm-Gg: ASbGncvmqylFp595q20lzi4AgwuaHiH30sYeeoyeNmZus26o8/R5GJu9yVZ6c9T+zhb
	KwOR+qz84aVSHdWXhznK11QkDVG3xVEZRoZlBWeJPUKCNGZSHifmjfXJhFqihCpTznSG8z0zvmz
	2ODfO1Y8nByNbYIi+zxJ2Y+LeS2J+T1i1HNdOAgBme10l6nJoXmtS59pL/BYk55NCrTrN8HZrKN
	VQ3JraiY3JDr9b6xY8jmUVd1fcSMuamnxo5O0o+ZW4hxVYnPmUHbADZ5OK08L4/uA==
X-Google-Smtp-Source: AGHT+IGBo4ecTR47OQ69Kg2GI81fRJ/qHdvasgczFr52mJYtJ+jTJ0+xjnYcKX+CiPOYOl/EB0d0tWUhUZ4W
X-Received: by 2002:a05:600c:1c09:b0:42c:bd4d:e8ba with SMTP id 5b1f17b1804b1-433ce4248f6mr14397525e9.8.1732264924627;
        Fri, 22 Nov 2024 00:42:04 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-433b45d1d3fsm3770515e9.25.2024.11.22.00.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:04 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1 2/5] drivers: media: bcm2835-unicam: Allow setting of unpacked formats
Date: Fri, 22 Nov 2024 08:41:49 +0000
Message-Id: <20241122084152.1841419-3-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122084152.1841419-1-naush@raspberrypi.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_004206_444207_088BAA9F 
X-CRM114-Status: GOOD (  11.36  )
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

When matching formats via try_fmt/set_fmt ioctls, test for the unpacked
formats as well as packed formats. This allows userland clients setup
unpacking to 16-bits from the 10/12/14-packed CSI2 formats.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 36fb186a0421..d573d4d89881 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -547,7 +547,8 @@ unicam_find_format_by_fourcc(u32 fourcc, u32 pad)
 	}
 
 	for (i = 0; i < num_formats; ++i) {
-		if (formats[i].fourcc == fourcc)
+		if (formats[i].fourcc == fourcc ||
+		    formats[i].unpacked_fourcc == fourcc)
 			return &formats[i];
 	}
 
-- 
2.34.1


