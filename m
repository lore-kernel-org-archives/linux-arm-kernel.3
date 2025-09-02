Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBC6CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zPCllzbZKVVF2KM92LpxrwyKTATB9gAdtcbS8pQ8SHQ=; b=qc+4mq26LFOdtrfsAx7MjZMsc0
	2n2YlwS2OzCDoupExXnh4knYBPJ9mvpQCHQgBhQACMkmek8Cj+DyEA6NKKITNXebCLF7Nqb+HRckD
	8qjXetAOAkCXfwU6ZE695DcFqxWrva8KLrH6216XRiEW7PX4r8JwMI9LJeXm4ZQTikEtiT9d1tUbl
	/iaX2GIzsWdf87MFsEUizXsQdgyg91ZSCEhWL67fJUm+DnihNgdhDx1TPc/EOO7TOy/MXKW90/1t9
	QqETpWot8fHk4KlzKAnROITToJPnYTHUmO2y+BO476FyniCEMs8M/NSeYWOlgIUapK+CISFjaX/vF
	8KRZsBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbeD-00000002spN-1mys;
	Wed, 03 Sep 2025 00:46:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZPx-00000002MKn-1Q4Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 22:23:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3d1bf79d7acso2158958f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 15:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756851835; x=1757456635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPCllzbZKVVF2KM92LpxrwyKTATB9gAdtcbS8pQ8SHQ=;
        b=SGHKAkmXfvybgEAQczc0rsExKOp2yg3eos2ZZLKwJuF7HOFSTwwgnZIGSNtc5wuRR7
         +kKtQJBI9k7jLuEc+YYGdXoXo+GpiXgprSPfLfIV73fgKieouxaiWhmmv50dSOzd71D8
         7rQFHBalWsREZd8JjMMb+SYXOBtuNx0J/H2EgAmxg0faX7JLUJSw0B0IC9XbGDnwveH+
         G+yJG7C0PgHsL0wQ320bXrXj+3Vw/JSt+I5n9C2W4HV+Il0RnhiYRJQZ6IL/P5rRc3Ha
         KkbaKLgMaf1WYtB4FiZQ+ZlziLfF27iY+UEuGuwJpTpgRlszLYg0oWSuFnD7460nsuT4
         LqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756851835; x=1757456635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPCllzbZKVVF2KM92LpxrwyKTATB9gAdtcbS8pQ8SHQ=;
        b=i1yf45bjkBkByRPMusgGpfmautdqF0+EnMZg1bf+VwBeG8nDcrog8ucMqBPizp9rME
         RRFSv0xauPtdpqpPSP3SzDHWN2kC/zcr+Cwmv5bOB5lv+xUB43XEiePF2B2X6zc8b9YU
         kdYieX3mf17uDmP9rwV++Utl4yh5QQXb/fwQt/ntsxEasX2q3MyHTUEskhXqj4fEGixn
         U01MJC84N+bufVokGsl19HvajSNoY9rSrwtkqsNNXAUuVzXdBWdvXfKDJvzWv06F9WDx
         3gN0k7wc0WaMriC2MJ/F5uEqlfK9/pP67K8/8Lvvm342IWBGOHP0HBz8zrHIeZAACZzE
         5Ulg==
X-Forwarded-Encrypted: i=1; AJvYcCWTg+u4Li4RShaYmCAYHrqT2t7XUasMmekecy08nnh8EML8WomHgCUU4aYv720qrkBg0CcHcbIHdA1fePuQ9963@lists.infradead.org
X-Gm-Message-State: AOJu0YwsAeBB03WGNqWKZn8XU5HHIGzhC9Gk243ksqziRLLr4BPhCkzt
	LTVd3mJbcWLDmmeI8ZEO6CBJz+e0ZgAstf4f6/EId/yrbw7RvHaiRL4=
X-Gm-Gg: ASbGnctfurQFis+CSYaU2z7r/DPHU+IWd2bCEX14W4d1wLNvZGxCGSf/qdP9SfL5rOM
	ZX2C2unMrfCWraeYKPk7zykBaFnNemiyDWDkcKaqA7OowLSxjWsrIFYQ1M1WB7PtIQaHf1Q8C+Y
	Eg2GUdP1dnl8iRR7cAMyaE7h+5TTElut4GkZWHeJuJQ9Tuj2m3Bz58yZXRyqU+8ygkSwoYSzXJI
	DokaUyj8PjER0K1eZXc7OPgnRKkLDz222A/y0YEyWhf4Nw6IWfpJmV5wCUfBOGHzs0N+OulKkam
	MD9hH7aIbI+DV5cigffXRN5DTFpiVpDLPjECOcaf5xuZ1bvLsd/GfJFhYPy22m8Jiz00wtld5Rt
	5PzDguSm4+TmuuI46HFg/DqMmRiyRrlv/BcJbHsJrcQ4KXjXoGABf6O1N6ZIyhQ==
X-Google-Smtp-Source: AGHT+IEfJgab8GfiryC5WdSKmZQ9zpYxvPj9Lr1/MRPjNVZKqe+HOaH7VF4ZsQDNtz9cSknuX0R6/A==
X-Received: by 2002:a05:6000:1ace:b0:3cf:a44b:26fd with SMTP id ffacd0b85a97d-3d1dd81c504mr6508443f8f.8.1756851835387;
        Tue, 02 Sep 2025 15:23:55 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:224f:7287:75b3:5214:63cf:2c39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf8a64fce8sm20833683f8f.34.2025.09.02.15.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 15:23:54 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: linux@armlinux.org.uk
Cc: linus.walleij@linaro.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: configs: u8500: Set NFC_SHDLC as built-in
Date: Wed,  3 Sep 2025 00:23:34 +0200
Message-Id: <20250902222334.105236-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_152357_375413_A97F7BBC 
X-CRM114-Status: GOOD (  12.19  )
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

The CONFIG_NFC_SHDLC=m setting in u8500_defconfig causes a Kconfig
warning because the NFC_SHDLC symbol does not support being built
as a module.

Change the selection from 'm' to 'y' to build the driver in-kernel.

Fixes: 344cad0660ea0 ("ARM: configs: Update U8500 defconfig")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/configs/u8500_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 0f55815eecb..9c8dc6dd5fe 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -40,7 +40,7 @@ CONFIG_MAC80211_LEDS=y
 CONFIG_CAIF=y
 CONFIG_NFC=m
 CONFIG_NFC_HCI=m
-CONFIG_NFC_SHDLC=m
+CONFIG_NFC_SHDLC=y
 CONFIG_NFC_PN544_I2C=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-- 
2.39.5


