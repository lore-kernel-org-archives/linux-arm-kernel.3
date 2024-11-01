Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE318E6B242
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDVeB7Y+VIp/FplukcEJ+LJ4Vz9niC4RyWfPRl3XIfk=; b=w+F3vNMHcOl9slLs0zgwK0SKrI
	Ls+zjFkAItH+gu3JIhi3mPhrAQsTay/GiWJYSt3Azb7W527piyGrnlmNFRdzimcR6sIxnfR6Jq7GS
	bjEETGNyybjI7TdVATeU0JlhZnMdB5Kssg38ZpiC+vjM+GJKtyPBDWCWh/GXP3kHRMRSBsdpV0vXZ
	WccC4T5jvCNTo6LO82iWes3bK5zjWrZks8783qGywPAe2MOp+4dIDVwcVHaann74F0H/dgqdNPjIX
	lp0hWVtxyJc7L9QpaWgceqqhxuLes3vpeedkpxnYy3v5Fz/7viBJ4jLkaVsAISSPbQjtGW879x8On
	xV5ZVRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ogA-00000006WjU-1Ztc;
	Fri, 01 Nov 2024 10:14:54 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oPo-00000006TSM-17mf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:58:01 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso2534517a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455079; x=1731059879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDVeB7Y+VIp/FplukcEJ+LJ4Vz9niC4RyWfPRl3XIfk=;
        b=ScCu+jUv2uhMxc3KkMSEGPOf5Dtbw7Rj8NSA71Il/H3qTka6INei/Rxk3353wA/Rtz
         /uFssPEhfxbJEfLX93qBeZXU4UZwsne9sYK6JxIrMXlOFrNvjgMPOs2eVhgYWgBNXFfZ
         hSwks1pNGFZ3f7LL5bCYDH/kWbAVyQF58AZ8h0PGLrQ7HnpDEOZVzg9+vED5ge7iP8OD
         QbPPOkNYZW+lwlXc3x6vYGD6sX82PNn7OW1wXScUXqEmAwGSh5d84nzWyW3SU0khEDw6
         KBwwJipcIL1kgPLGv4UmTKQwcJUah9uO/iP/lgP6eT8pieLDoM/32ODqmeAhhv8hyb9L
         uAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455079; x=1731059879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDVeB7Y+VIp/FplukcEJ+LJ4Vz9niC4RyWfPRl3XIfk=;
        b=enaX4c3jHQ1KzMDwy5YIxRHR6x1VrohVQ0FlvPaLu50hAn19YZRv02iejUX+lV2eka
         L1PYl2j8Vao+FdWAcFU/7lny9SyjuJshvKPwpSneaIPSPmDXdUOOuAQhsmRrV7s132wb
         Ri8lEDrzdjnyrQ3wiKFYfrhCrWWfBsOPPQUxjYF0IcptcVdxBTk9GU04OAHQEEGxULNr
         d0tyJ01npAbQDGp7QAHWsNE6Zs/6A7PWYjvI2Zbg9fRjh+5k51qShP1aphKTa3gjE6LD
         YTlhn2DU6Szc9X5pBZ9VDx46dQCFzoYXjsmHFn1akGlF4xQd2KO/rvn3Y2Pihl3NNLcB
         e0OA==
X-Forwarded-Encrypted: i=1; AJvYcCWium8PNAq1Ea52ak4z0yDicsh7LwOIoEjVHjoKUBNQY/7WLDkNgyFL7JvUQZwqdiuWKRY27CUEhPGt1fcAh2y5@lists.infradead.org
X-Gm-Message-State: AOJu0YzesfnRUuqRm+KOxr0pKa6zQPtlRkEvsJuY8T2+DnnP2aWub6HK
	HY2aGS8+/HUKk8uuLwgNhHiNKntvc4buJBbcD8qVwyQTa51YCtsAuTQg2KcwqvA=
X-Google-Smtp-Source: AGHT+IFm5mOqj3B/Gyi2brvekA2DF+HNO4SlxfDE0BQcyiDTfbNWcuu/umQTldMEOxZlW5iJz8fSBQ==
X-Received: by 2002:a05:6402:3585:b0:5ce:bb37:c2e1 with SMTP id 4fb4d7f45d1cf-5cebb37c36emr1662850a12.19.1730455078849;
        Fri, 01 Nov 2024 02:57:58 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:57 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 9/9] arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags
Date: Fri,  1 Nov 2024 11:57:20 +0200
Message-Id: <20241101095720.2247815-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_025800_337791_2D3E8A2E 
X-CRM114-Status: GOOD (  10.15  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the Renesas VBATTB clock and RTCA-3 RTC drivers. These are
available on the Renesas RZ/G3S SoC. VBATTB is the clock provider for
the RTC counter.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- enabled as modules
- Geert: I kept your tag, let me know if you consider otherwise

Changes in v5:
- none

Changes in v4:
- squashed w/ patch "arm64: defconfig: Enable Renesas RTCA-3 flag" from v3
- updated patch description
- collected tags

Changes in v3:
- update patch title and description
- dropped CONFIG_MFD_RENESAS_VBATTB

Changes in v2:
- added CONFIG_MFD_RENESAS_VBATTB
- added vendor name in the VBATTB clock flag

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0fad83642034..c62831e61586 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1222,6 +1222,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
@@ -1371,6 +1372,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2


