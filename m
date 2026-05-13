Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660A8CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=; b=FBx+0J8Nfh4cvrBpDHDHYP/Lcv
	/yMgZ9hVMn96ji13QEvy8A+3rumboZD0tFKMrReQSIYC+eJG76fao8bObwOxLi957dL4wUI0Mq7OY
	S1ux+HrCgsdbOOpEPbNaO1uqAPTgwKwNGHc00oj0EfQt4/KjS+bRFdJ9+ZBQe67Esa02BpBPjH1RG
	QXdDZ1Msac1sMb0TkEt2zVbglzLdTJd17fHytDUUDZR+Cl3MU+yayO60Tyv0TOKiYdtsOK8/o5jyx
	NShJ11+4njXDVdL0gkpQIwHZM31Xsdfn4nce81Hv/C30yLGeudQ1ZVyBW3z3NwLOWAwQvbdsZ0Pmb
	BfSUj+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5gA-00000001rwE-1L4b;
	Wed, 13 May 2026 09:14:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g5-00000001rqu-1wv7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 09:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=; b=t7rxF+bEswD+ZgMChWIVMkDalb
	NtcNPIoUYdoshRzUwQLZoZWk1iuBS2RCkaA8sjBPMXBtTAQjuQ0uaFWPOXdrhHpIocLVgZI1UUdJy
	ZEkpmAC7HX2v7G3Sr7yPcxm7rKcn5KCuXp9jmegP5RIq0U4VqW4YuM5lkYSCUEJdpMi2PT1voLOwL
	kW6ZjiNz3t71NdVpax952lnI82YGhNiMXSOyU3b1p50IfctOFqUZDDyrOyAIhASNoQC52ZFzQod8x
	xm+z0oDQMAJDdwrWd6jXWlyC5K9n13NsBbBC1it2SsuHI78QqxXZh+Qy5SBMqUXJ/tlO8JpTqmK6X
	n4I48fLA==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g0-0000000BNn0-1hhh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-45562c41ec7so3029714f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663685; x=1779268485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=EwzzMW+iN019TdXC4az9YXN8CG+e+S5JOHEntyg8y3eQgfvnerwl4Ux/IRmDe7w5Bi
         DIIcWtv7M1hSWbUCeLN9GPS5KMXFg6me9uBBTmHPVz7dy0OEXW87KlOYthvQQMLxNFhU
         kjl1+ENALA2OiVBcgCkJ1bI1aAbqxbrKkYPpbnQ3BhlAehP/Dq9jp2PWTP5Z8crvH+yi
         ebmlhyfT7W7rgI3jdraAzvPOo9SkTtYHjkUne17XE9xpITw8sCpl5H42EelhLxOPvdxj
         m1fDNATwuWcWCAF3nYby0pqkUSXgFHuvT4zo7qMPEkRhCvVEwiO0/6h3W+0qC+b2KmPn
         8ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663685; x=1779268485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=RX5p2lLpSojnDQLemjZHwSm7P1ge83ZbADoODp/f7mCXOMgEfjNg4yGkFjBYsO8VCB
         5f6shyW15PZ9LQBGTP9BS15J5FaVnjDfH0b1ArQ9K5s/Zoww7ldP3El5hngnpy26AmG9
         JTWMCdHTwfHM8DLK5bY9gBpglv8K79pg2he1r7Qx0nTfDRJG3yAksRE4aO9kHu0eFa92
         P/lt72xZj+DHgAxxOCHPkGyhICmnMZLfrEs7Fp9nsfWayo6WlbqiNeYUW/9Cy0jwsTIO
         F1V0yT16mJ7YKrZtQzVEpz7O/X+GsIXTg+eUwK/gl6Uq4Hx1/rE6pZCBgUXaLUPv12Bc
         aLsg==
X-Forwarded-Encrypted: i=1; AFNElJ/bW9QtWiYd6dzePhAy/vO/9bpgTz0GwyHKJ2wqeRkXmQSejeuCdCAgljFiEJUgpBfOhUJIKB56HeVGHEVfd5Zd@lists.infradead.org
X-Gm-Message-State: AOJu0YyrPsB7UyP05eGfwn4zl8Da+E8bwj3hbVV9o0yfd98WH+AyiLTZ
	v+u4TbBEHkhK3e6rGjUZgaOu7FC//2p3vAPQihg4rVRly5RKJj2eN+/eE6pSAcDyZROw1POV0Ai
	ID/qtxQ0=
X-Gm-Gg: Acq92OEapuXa5joJS12TN6mJKTpBZsK5ULHq0TYkYSPiPXE4BzvZQBWt9zxgou7m385
	+mRFFhJjhvz2wLo2bjYa9JOCCCnrJhBSP5KVpUD/2FgPnszBq71HXAwMFWtUczUsADqhoY/BDD2
	pMcrAz3U7hwbniSUal5obOkYfZdCzmTbTJEiAqYskwRC0aNJecIDc9K+IHNVZVuzJeh93im86Me
	uUS7OasNWmPgKulOR/irjgjG/r8H6KRws3Umqp8cgW3L6P2cgqK+Sdya/1RyPDR828xIZengUa1
	2Aqi7HEnr48r4bDtp+abK6ZnWPE2UJQ4SkWvnXBwP3NfR3zTpLpHsleKBLYjrh8ds8ctJodVUjk
	yt4DA8V57XEi02VwneJHajMUpdTN5AW65PRvnhW2QdzhHWpb02yyYUCH7vyD6rbmWIWOT7XM0lV
	8tFCPjFlV2tj0wbt15dSxke/i5xOv7ZoI=
X-Received: by 2002:a05:6000:605:b0:45c:3f0b:be08 with SMTP id ffacd0b85a97d-45c599ebe6fmr3537011f8f.23.1778663684744;
        Wed, 13 May 2026 02:14:44 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:44 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:28 +0200
Subject: [PATCH v2 04/11] m68k: defconfig: update stmark2 defconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-4-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101448_557905_B9415BC2 
X-CRM114-Status: GOOD (  10.87  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/configs/stmark2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index b3fb95f73a95..3941113bc60b 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
 CONFIG_MCF_EDMA=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_MCF54415_DAC=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y

-- 
2.54.0


