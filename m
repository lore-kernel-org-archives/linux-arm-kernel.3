Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F21C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxX2EQ/ifCaF8Tj3G7wW7shR3P5CgH/KG2s1rdkQtN0=; b=dZ3C3YlTaGt4Hv5OjiefylXD5z
	lYaIAtGSm5/XRWUlFGUWvE/C6qI2fYTwUkC26AuCzdTuHxGmNx8yPxjQVa+kHdT1oUnzlnhc9wnk/
	QHGLJODnDq6q3vOSSuEd3PLlLg39TfVFcrbfIALINEj62pjswKjglB89+1UX46JJYr+5Qu41nkwvv
	cVZTwjACwFCiD8jFa0lrz73N8Lri+W9nquRJyvaXR1HsSP2XZmXRPdnr6QkkiFrGsC+lmY2oQyzrG
	mamjdN0BgdQ443YJYxWVLPb49cWHwZHJbWFATRbdervASBaHhruU89FITROve4OQw/8yX4ZAvfFyE
	iQJQppxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXnS-00000007fOe-3t9D;
	Tue, 17 Jun 2025 15:00:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWwJ-00000007TiC-1sU5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:05:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-234fcadde3eso73868145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750169127; x=1750773927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxX2EQ/ifCaF8Tj3G7wW7shR3P5CgH/KG2s1rdkQtN0=;
        b=U11xR07O32oCXUvob3DRFTtfpocY/2p6yfqWhb9fo0O72Dk82dEkHYo9daaSPG+JuD
         txJizbhXMR9AtX5uROR/p+yY13uNjJkBGf0dboYZBeaV0Oh8lZ7c9TvM1wVYVn65rwH+
         I9nVmccpDpfJXwsmErPKNVEivuccIdqcPipE0e0VUttUhzZzcNfpsu3aLRIAvBbCQRdz
         VUQ9AwO1Gn44qfMB0Shuy/qMy+G7vF3qLInQBs98MW0tcGJd7ig2nfLnw6dZ3fHL0U62
         ghGOfI3PBuig3oKvgUjSoZg3L1WSAEHCVvmfNyqUYSovM2GNYoYMZQke87NI3WTJDIE9
         K21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169127; x=1750773927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxX2EQ/ifCaF8Tj3G7wW7shR3P5CgH/KG2s1rdkQtN0=;
        b=VY+1DKSgUcHHHb7wiEjq243j3umMS3nhCPa08GVKAmeX2y5HQXY4fvZieRFQVjN7bX
         n3DirqgMUh03aXWbvc3On4S8sJ4C9hFDyZootFeqBdZiPWLBJLXSIMhI9MUCspB30iQG
         oys21Dw299SxV2Nz1Ph50x3BKEwGS91FwTAlpJ85v36ioUxr87HDvMAP00UW8QYwouEl
         b4jrlaV+HU+4qCJhOvWkXy+hNFOR4QOpuF47z9P3GvOL7ngftxw9RC87e4vohXgWhgBt
         E2AXoO/wnBffWPvP7ttpJmMVbmLDkH6/NfxxUE4Zg/vcniAIKKh8nk+MAuwpSz18xiUf
         AzYg==
X-Gm-Message-State: AOJu0YwVAMns8fKwY84u7y23i7FZEi03FVa9PQFoJsXIHxsknlPbFssH
	U6l55EwtWzI80GVQ0OqoITrXsRM8/ZjYjNsUNiNC2jSQoVH76RQbAdm7yb7hAw==
X-Gm-Gg: ASbGnctxPB49/Cf//0Ezun77bbSNa8bwRO2fY3QyFbjD4LfL3fRYwEoel1pcrtSD4ah
	ybWudLEfNN1uxvr5z/7B7BhEwCqN/qMBPP6tvHK8B71AOTCU3pP3D1fsvMjlqKl0N2oSoRH++Y8
	9XjcjSQzgdCIP/nXiybStdcGSsZ64fpXpZLmCfVoYsErjhsrzRD8Sb04HSJyqN7DzegujUXl4y5
	gez0kmYX82OjSQXjD85q0s5DdPWgPgnTW0G6P5MaUnlycnn9MB1ivatBY3XhDtJxuepZ6vXz6Dn
	2MNhelkSZ/mBBXoPugrLHjaSg2wQxhyq9gqEzIOL7ll6A52OH3Qn9IwdxbyIUf7x5zJL
X-Google-Smtp-Source: AGHT+IHajMzqisLRHtxmxLwgUDzyX4LzRsBt6Q8GnG2QttPXlJ6ExUGs+lD0ZpGbhIq4W0UNGTh+3A==
X-Received: by 2002:a17:902:cec4:b0:235:e942:cb9d with SMTP id d9443c01a7336-2366b32a038mr184085865ad.17.1750169126612;
        Tue, 17 Jun 2025 07:05:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61::1000])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe163a0e7sm8906127a12.16.2025.06.17.07.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:05:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: claudiu.beznea@tuxon.dev
Cc: linux-arm-kernel@lists.infradead.org,
	nicolas.ferre@microchip.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/2] ARM: configs: sama5_defconfig: Select CONFIG_WILC1000_SDIO
Date: Tue, 17 Jun 2025 11:05:02 -0300
Message-Id: <20250617140502.1042812-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617140502.1042812-1-festevam@gmail.com>
References: <20250617140502.1042812-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_070527_485359_C49E53FA 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Fabio Estevam <festevam@denx.de>

The at91-sama5d27_wlsom1 SoM has a WILC3000 Wifi chip populated, so select
the CONFIG_WILC1000_SDIO by default.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Make the change in the correct defconfig. (Claudiu)

 arch/arm/configs/sama5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index e447329398d5..2cad045e1d8d 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -95,6 +95,7 @@ CONFIG_LIBERTAS_THINFIRM_USB=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_USB=m
+CONFIG_WILC1000_SDIO=m
 CONFIG_RT2X00=m
 CONFIG_RT2500USB=m
 CONFIG_RT73USB=m
-- 
2.34.1


