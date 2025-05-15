Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611F1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NH01uZvPrEv4ksNpQ1rZoCezrf5Rv1GWIBj36FVw9g0=; b=rD20voWrPGNzmQfuLuczsvNPY7
	uVa/rwKodSiWknw0UydeCiQ2P56zAl++sRiyz7dj2/TP6WQtgCdphhx6lJrc4+OTayMgJm1LNVY26
	9VxBqm/RvPGA/n3XWP/LgC63eon0QIAakSsY9E5rxIE2hKx79m2vN5n0By6lrUyvqXMVHzdS9SSe7
	mUga4ZOrZqPGWCNjn6aGwmlJjWttL4gAp8jjA8GBCfRgxDthxDy2yW+2U+yyfkM9FOyYilY98tFP6
	0Qp362gq0Ak45dA5OIXNyQwH/OunD3D6GJNmSQpYq89cx0NUv7hr8YhXoqJKrIva+/JupODIpp/++
	FJRfD5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaLx-000000011tn-0isf;
	Thu, 15 May 2025 15:18:33 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaJs-000000011Zc-0XuZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:16:25 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-52c65c00a02so341922e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747322182; x=1747926982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NH01uZvPrEv4ksNpQ1rZoCezrf5Rv1GWIBj36FVw9g0=;
        b=K0WkDJOG6xJvzM06sGS6NYHEQ+UEDoxP+q2RL+w2jcIWoOf6c/oHbClH88Oe9FISGv
         A/3Prmjjz592/0pi1fge6fkXMcAUxX+7aFCgl7VG7qwqRNQO83+j4zXyaMddXXtOcFrP
         eqDivtxQ5vEPEhnfhfPh8xc9CuikWME5urgxnOJCuDy5QPTzAIgZDCfeHFfU7Oi/aI2D
         rCdj6xsU1JGUqjaTyfAVNS2Slqjz/ulY0pTNBeqLk9SIs/IwbznxrWKjSuuLd2M3qw8P
         HnUyJw8B82XkGHPzXLBHDcBx8i/aMgzyV2+2gIEvm9r3jLzIwfQPSzJUrtMEoIdQGV0v
         woQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747322182; x=1747926982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NH01uZvPrEv4ksNpQ1rZoCezrf5Rv1GWIBj36FVw9g0=;
        b=TDvOa38F+yWL528CVBq3CEHnoosfOph6I6kLGFWq9HqpfWO3T0E6zO+bOkw7P93ej2
         cYT7TBFabAkx/mcOagv/XVu66oA+ursYzvW4tSbXQvpuSSLdnjMp8NuDb3gfh0ya+X3z
         FukPM2jB1yTUe99FYwYRnyMNg+1HiLpL0PVsHGCmWjQz+kL2/aO1D9+kUSHh5mcQAsau
         iNgbwt30c9deUaXjbKCl/nSsWMHwLY9P8jyCtz21lMPWSGqiT0Nyf5AFF1Y1/DoC+/v0
         6bWzSrSd5UngklBOA1Ebj0WMTQA9y4R7C9ibPD9cwxQlV7QOZj6+Wto2HgY1FlTO7vER
         LJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCW62U+XEBNemQhJeSZn7GBlRnRl5RsQIM1PMcJwF2gTFvBcdI3LzIRWa52RH82i/+lmdKJxFlrRwMHU+MwLm7uM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbm3xb8RsGGcBfSjMsV+L5TEgiuMadgqw1SRwVSRL/si+89Fnk
	sw96VnJOIyfRDu7DMK5dDyDeRYv89fFp2KFHfITdFGw7zTlreJ7sP7r8
X-Gm-Gg: ASbGncvWbofNED/wHSWS44bsC+qaiev3PvuLf8Ut+dLBeVi36QS1aJpfXd/lYb08k6V
	Gal4KU2EcI20GMoiogFyziKYqUU8F2KaoG04QB4UV83dh4vkQrNKIcAfVicicnpHtBTrgE71wT1
	2LOq12ND6tUPIbuY7zU3c+gQua1gV/kDiHQkp++rw7OpyRUjLmaLqQjcIBxMPOFqsOp75+OR0Mq
	nVzSBuY2iSuJ3LN+JXo/VVesI6yL2fuL2cCEAhO/zIiqCopqdZP4Eut/HOAoM+5lNnm82neNr1l
	35BmeE4vHHTE6GAFz/992kXRfTPixeljyp1/ELRDkMEttMCqvCDm32kcODu0+B8+
X-Google-Smtp-Source: AGHT+IFjZ/B4blQ5G/NkSANXPQoCPpd5g+P837PoEVtOgG0rCpvLM7y9f1a7IMgj8beET9AWzS4QzA==
X-Received: by 2002:a05:6122:d82:b0:518:965c:34a with SMTP id 71dfb90a1353d-52dba803331mr48591e0c.2.1747322182377;
        Thu, 15 May 2025 08:16:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:83e:4807:376c:1d4d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5372f0e0sm11537624e0c.19.2025.05.15.08.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:16:21 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: arnd@kernel.org
Cc: herbert@gondor.apana.org.au,
	ebiggers@google.com,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] arm64: defconfig: Ensure CRYPTO_CHACHA20_NEON is selected
Date: Thu, 15 May 2025 12:15:48 -0300
Message-Id: <20250515151548.431853-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_081624_168561_5160B816 
X-CRM114-Status: GOOD (  11.05  )
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

Since commit 17ec3e71ba79 ("crypto: lib/Kconfig - Hide arch options from
user"), the CRYPTO_CHACHA20_NEON option is no longer selected by default
due to changes in how crypto library options are exposed and selected.

To restore the previous behavior and ensure CRYPTO_CHACHA20_NEON is
enabled, explicitly select CONFIG_CRYPTO_CHACHA20 in the defconfig. This
pulls in CRYPTO_LIB_CHACHA_INTERNAL and allows CRYPTO_CHACHA20_NEON to be
selected automatically as before.

Fixes: 17ec3e71ba79 ("crypto: lib/Kconfig - Hide arch options from user")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 04619fe7e22a..7856db7dcfca 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1723,11 +1723,11 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_USER=y
 CONFIG_CRYPTO_BENCHMARK=m
+CONFIG_CRYPTO_CHACHA20=m
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_USER_API_RNG=m
-CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
 CONFIG_CRYPTO_SHA1_ARM64_CE=y
 CONFIG_CRYPTO_SHA512_ARM64_CE=m
-- 
2.34.1


