Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50969CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=; b=u8ftYYx+BkAl8GyXknZGIvPVR/
	QF1gxswHhUKrB92N7JU990pRuIEivQP3WUmpW+Y3pE62tCywCI8pmDQT0Y+H635K59UU8anuidLeA
	VWnHknvZYASMiPKfEsGVxmq1oydlB4qhmsnNAa9vgsEMaIu9KUWPoblhPYrEmkH+Spuf0JRBs4d40
	yJqT6gfm3Ij47GdXvNlzMNBWFY7+1TqNtUPwmPUSzZFnPfLpPYuYvRapDM/7x0yDznjyezfELtvg8
	XUrIYiCLTrAuGlGp54aJzq8Nra1slWHivxINxIf70FR0c8/k3PR5UpH8hrHJjs9jUrjAwjKvLWHtR
	oVX4/mHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhHH-00000003c5s-3taj;
	Thu, 08 Oct 2026 06:06:51 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhHF-00000003c3p-27LP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:06:50 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso1933844a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439608; x=1792044408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=Gjb4BdRpjZ4+wDNw/Q1cjOsPMu8BCdgGUy209/ZIkjoxjmV8I17gHUNvFSOmldsxtj
         6q86nivPPEBD6vuXKgfFCwcsCGJNr+xNtZzEb+lGeVECrJ22eMI7A0r3+fzBg7TrpQgT
         psG/SgqX5uyW1Byua8aonXHjV/zD+BczbJCZj2Xk3ly0W86EBqk5NhlZEsqk+C++xRPY
         En3Yrfqdcu8SE/0cv9opQ8faYLu9M3+J2/AgqqoqseuJHjpz+RGKTlwjsyDXnUchlnGz
         702C0okFqJRTpjSmkeruxznnSIMNTLH95OWGScZsdsUWAchInzOF0yn0AougCSt3HExp
         9U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439608; x=1792044408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=AwiZ3pr1DOh9zTGfavlUgf7uENZBfWLFB+vOqV3PEpqfVo9STTqzNb082WFfIlcps8
         oHZvilK7Br9OQ2nSVgC1P4AlxxBKQqXkMCMSG9g0kiZTSj/mYzD52iba8ej+qoRM/gPR
         p2Z6TM8env3rrPCNa9Gao24i0k3z/duie78aeFYGLeGJkcvN3iINwgitdixCc44nf0br
         fELxDzjvGsQ4OEOnzT9ayJpHaYArt/ysYyekOUh3Gr4g4pPYMMxdFzp8niX7/aRi1ej5
         vOxW8vnF2dPcoHV4/HQKNNuJ3KlCVmWgKwyDnnBIxcsUI8XFcY8z0A8wWKoTszkxrhtg
         wNxw==
X-Forwarded-Encrypted: i=1; AKwUvByg63WhtfS8cioD2oZl9aBCmg2jq9YacFXMNhQIGrEpqolBQp0CyX4IZ8w6/SxwpTsgdFNZ4cVbgHo68GfG4iZ6@lists.infradead.org
X-Gm-Message-State: AFq9FYLYbQss8I2pPoqurZ6mvZ03enrLZmhaL065YgONW3A7BXn+BODV
	kQX8mZpD1xWC6azk/8q7gzOZbKY7uxgSV2auTmf+FgQz6c6VMvz+p6nN
X-Gm-Gg: AYBFou2Y90i/gZIcKic2fLmNX93I3zzIaeaVfL0Jov2jvPDe0EzdPDXl/5/J0P4tJel
	mfaHlmWtWpNsnL0rgJy0Fu0Dow77Gohb7Bu38igw+5S6hKCntmne9XH6tiHHxRVjpueANNWmv2V
	xD87pXy5m9PVXyKwkCjo76krra3VgDQS7X/qRsiRypuJ0pUYqfDQUIoCTdzvlrP1x3Ysxf0EA05
	T6ltMUvAB8ZyvB8Bp/GiGb08V2oMlNgIeiY21tmbWxF/lkg1yiQHEDekt+9/3e3WC54W8Wo3z8D
	x2UBTNQFgvRTCdS7gE22V4NPi1L84FTFJ+varo9xWTTS8W/zbA3LB5rt3j5O2q02IlcUWA7quOv
	y2TruJ/ppV07uBAnXLtc4TENnUE0YOc0zopIrA3xjaFgxcm90NYMyOvgx35blASQAjt6kTmIKkX
	7yoF7x+BBBcH67kBAjM4v5oKsLmKvo1KO6zjErTjtWSdKwo8EEwIzQd02FyrtHEn0r5klcYW6uE
	6N7HtSKR8wKzihuJs0TwnA55Uy/n4ivckUq9lwghMy2crJKsmAZBBPUGOIT8qXZ
X-Received: by 2002:a17:90b:3908:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3a8a0b8b75dmr3123041a91.18.1791439608487;
        Wed, 07 Oct 2026 23:06:48 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:48 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 3/4] phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
Date: Thu,  8 Oct 2026 14:06:28 +0800
Message-ID: <20261008060629.2736806-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008060629.2736806-1-a0987203069@gmail.com>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_230649_549087_226442EE 
X-CRM114-Status: GOOD (  11.18  )
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

This driver never performs direct MMIO access (no readl()/writel()/
ioremap()/__iomem); all register access goes through regmap via
syscon_regmap_lookup_by_phandle(). linux/io.h has therefore been
unused since the driver was first added.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..0b9976fb15c1 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -5,7 +5,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0


