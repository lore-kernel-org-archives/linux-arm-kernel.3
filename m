Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DB5C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qodMBbXsFgPfty36KeQepLijN45E1LZ5eGME17HgdkE=; b=BO9fiBEhTHFhOq/NjTrGE90OvC
	3pHTEdOwfwbX5FVkH2xr3XC/n1tx/RYhKbK45MdAa1Ip+LvOoVxlvgW9O9B9MaDyUP40bQz+yMMp2
	EcHpsDuPpi/bUgu4yNh4CwiM4p4svwQCf++M6WP7ELa7ysH9iFhfvvHrFOPrF7rHxcsshkEzj8vSB
	HH+VNVkaih18O88d5raUzPUbA5mbLECpwDVRzEZUJY/s6c6BPPTUANr79JucbQCEnlEnpk0Mn0X/u
	LTn+s4r1IfsIVOtYXBdVV4aUjvmraoDIK1sK6WBGs+eC6uNSYaQ7WT2P99nsV8qq2+KdRnUu7WZOp
	oO/le8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybhd-0000000FS56-16ap;
	Sat, 29 Mar 2025 19:18:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybWg-0000000FR84-2kfT;
	Sat, 29 Mar 2025 19:07:27 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso6159578a12.3;
        Sat, 29 Mar 2025 12:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743275245; x=1743880045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qodMBbXsFgPfty36KeQepLijN45E1LZ5eGME17HgdkE=;
        b=WWbNzWENgISkTf5BMzrVp5J9UoKRvzD/FPGvJCGZbqF0jIsy3uZJPTdRpDyV4fLyhp
         4ORfgDk8C/dZpO6RvKiVNXzfuyPM89zeXLShUyABTMacnK9w64tYJ5lcHFdtnWGovB8V
         nA3eW0BE9OGG48YgSef8+bD5t2WcKpScHcvcd1wz6xUAupyWNGUekUAFqx1CulM425+y
         qItDQmQL2Hve9yZIFh6ACc6Q/7EJwr7auspCcQdBH0G4x4r6v1+unRrjuYQ80jFX5LF2
         vnQ0UZMTwWwCzKUKv5S7PmD4ZiNNa4sagubL89RpFTxAUXvuKwGScKDMMzYdLAtBCDvz
         uArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743275245; x=1743880045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qodMBbXsFgPfty36KeQepLijN45E1LZ5eGME17HgdkE=;
        b=vs231/zPwvgu8k8wj4ybzvv92x6EfBBPvCBmV84SLtOeLQl2b2zRi5bmFlf7sWOzVK
         fsQMQ41WuSBSrUHhourMsoCNdK4+BJCFxMjxeGtWbXWSlw7Sut3EzM/lFsjDW+TFMHH1
         IdM1Zsx+iwLnDkxWn3b4oSQgun0guGa+HIw+X9Wl86nGSCKJ3qvKf3j+TDBXJx5d+x6e
         cx+KLlHbBGl6Kya9J2c2QcEpv+AZRiZ9JQQYG32yA99zCUwaEjCZJgkgj9xk+ulTO6Sn
         IDM7sET8CwKUy0ay60F3Efx6vVB7IH4MKrMG9G6L0axeChHqTa+QPNCJU6PuxFWRnK65
         s5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTVQPPDTZ70v5fUbDSiPP7bSIceH15LYCUQCwEWZkimw0sjJwgmxcxSu8VgffUZh9RN8FNKfWTbt6i@lists.infradead.org, AJvYcCWyFB3eHjnK5Kcqd9tKdBoWNt09kuorGx+XfR6Hxb9aqyGYLUsoamLncCZNrx1uVqjuVwwyXPBRH0bCS75QDHMM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8WEyORvSPC5hyNsl5DPNtTq6yGbX7qMBeggvxYTj1A3Hodg2d
	K4TB4tT/f/wYIWNcCQOZFGqPlwJGABjqYQnEG4RcJ4gcbZ11HZ/04DpVrg==
X-Gm-Gg: ASbGncvyd6oFQ0cI4dkIxjrE/VzFgG9IcLxQ+ys9EC+RRc3V/ASiKHo5zu26kdGVJ+C
	1ebHNdw3nRhynN94KQOJPcNYZASJICQUZDoQDEo6/9u1ELhLdNW3Lb0MSnsaviKTi4Q1D4hBYoG
	+qiyK3TGkSLpw/cRLlk7U4dpUSxNr5/oC+4Pc3ggEJmg+TSVrjcM/NGqgA+FnJFYPGI3BfCxdbq
	Recr5IYO9SJcjjNFUuBifSlMIUu/ioJyH4vKDa540IchdAGUXaoITFRhBXDvzsOqmzftJ9qzA8x
	XC7bOJQQzMn20SLiXhGzZ4+Y3VWxAidKBp6xp1kn4odUEUx/cR2VGrdLiKh+Iuh6Fi+sybqzOIH
	L9mtKSOyFHocxYWX7xHI9ARXl5Ma5juFs6MgBSo9M3Yv2dVcKSxT3aN00MXDJdcuhpCyQ0w==
X-Google-Smtp-Source: AGHT+IH1KTUC9DJrrlQnXgZ2JHbNiFwezSsNUKf5SUJT51h9qpOBj23TKaz2btvXkEWQPO3v51g2jA==
X-Received: by 2002:a17:907:971f:b0:ac7:41c:748d with SMTP id a640c23a62f3a-ac738bae656mr310740866b.38.1743275244484;
        Sat, 29 Mar 2025 12:07:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aac05sm3275271a12.3.2025.03.29.12.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 12:07:23 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 1/2] phy: amlogic: meson8b-usb2: Use FIELD_PREP instead of _SHIFT macros
Date: Sat, 29 Mar 2025 20:07:11 +0100
Message-ID: <20250329190712.858349-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
References: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_120726_692959_82095B66 
X-CRM114-Status: GOOD (  11.53  )
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

This simplifies the code by re-using the FIELD_PREP helper. No
functional changes inteded.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index d63147c41b8c..d9c761b7c15c 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -39,9 +40,7 @@
 	#define REG_CTRL_TX_BITSTUFF_ENN		BIT(18)
 	#define REG_CTRL_COMMON_ON			BIT(19)
 	#define REG_CTRL_REF_CLK_SEL_MASK		GENMASK(21, 20)
-	#define REG_CTRL_REF_CLK_SEL_SHIFT		20
 	#define REG_CTRL_FSEL_MASK			GENMASK(24, 22)
-	#define REG_CTRL_FSEL_SHIFT			22
 	#define REG_CTRL_PORT_RESET			BIT(25)
 	#define REG_CTRL_THREAD_ID_MASK			GENMASK(31, 26)
 
@@ -170,10 +169,10 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 			   REG_CONFIG_CLK_32k_ALTSEL);
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_REF_CLK_SEL_MASK,
-			   0x2 << REG_CTRL_REF_CLK_SEL_SHIFT);
+			   FIELD_PREP(REG_CTRL_REF_CLK_SEL_MASK, 0x2));
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_FSEL_MASK,
-			   0x5 << REG_CTRL_FSEL_SHIFT);
+			   FIELD_PREP(REG_CTRL_FSEL_MASK, 0x5));
 
 	/* reset the PHY */
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-- 
2.49.0


