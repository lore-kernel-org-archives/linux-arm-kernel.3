Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1495DD32D7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aIvy7sHDIF/P0xKV5ZB06CXppqkV1x6iHD+MoKg51ak=; b=ZB3muI/rwAngq/XULrI5NWphWC
	aaqOoRyc2vnWqbxxCQ3TXuLuzOU1u575/5H0UhAt68Fyb1orfkK0tNof/MZtCyZQ901bVTlxfr/rQ
	qmYPELzPIIlvSAR/jC71oIKD/KZa3JO8Wni+5sPkUw8+0XqA+KlX4reA7QoYW15kNW4GDA83iPlRS
	sPLKl8JRdXChOgG+QdksWAgTZus7aiH0D3uamsboWgx+bsXpw1EeTCKcjx/5N9vFK06GGryVK/YRI
	XL0minTee+Rr5f/4bS405Jgvv9hgpPSyX4xCUn7arqUOYauH7V4xezp6/QBFPwmQ3ktFj2nOMYQN5
	ZWucEQsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnOD-00000002uN1-2S2D;
	Tue, 12 Nov 2024 09:40:49 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnI1-00000002t4r-2WpP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:34:27 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so8368353e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 01:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731404063; x=1732008863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIvy7sHDIF/P0xKV5ZB06CXppqkV1x6iHD+MoKg51ak=;
        b=RvIEM8d+GEg5QxinYwmj6Nov0nNavfJLLFk82WjyksGZPYOXm1+xIXa2uaItFJsRkp
         YF0zjtDuE8MCbe9hGCVlM4v+fSsdTX9WQW/XBuRUzA20Mk4ne6Hcoy054CDuRAAe20p2
         WiUWCB2dppx0f38HTZadAxYC98eJf3EswzeGgUnDmyTtWYUDgPPlh3nMUqJZZOU6fEGo
         qb5tXvjHID4YDlmbwtoyADO+3zI3YIwSqfKbraPI86nVYSIWkgAxUZI6npbQ1YJDS3G/
         6ObI3VTeCQfs2+I41dCsTl44crMs5wXt0cLCq5xwkVBg1q7Z7Z70f+3bTNbs7x8XBMAH
         EuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404063; x=1732008863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIvy7sHDIF/P0xKV5ZB06CXppqkV1x6iHD+MoKg51ak=;
        b=nF/nsuIZSrIw9hcKNqaUKSFn5NjLldUDXzigKUR/+syhULeK/HAIaIRBwA5AOz3aPt
         SX4mwsDwt9RGVUehNMDenocrDixgAK0sAe/k89uiJVl3TvIZoqyzXdzS2KbiUB9Ari6s
         Eplei4sN6o3bNy43H+Mpojc3zzQ8O84eVuf9WdUantVhH2e8A7I9XM6bynoIqFN7OhM+
         5yzimE1eDqYpoISY7nj5kKSV53ZLwC3mKC0L+N2IZ11qSIb7sApuzFQupIgHU87w2T2Z
         wFckpsZl3IpYfVNYTghzrr/0nzmTQBeszU3ze9isc4s54suxqH2UAiG9tU2ko9PTQ3yO
         dqQA==
X-Forwarded-Encrypted: i=1; AJvYcCUcQ8zcYfidSbLn5ePB/C3ZGslV5lKW35vKghWWfuQhvGN7EbizxM30HXe7N0w0QnbcoFZ5YWq9bQMy+3PKogtP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5astCD9omY2Ar5fVp5E4kdP92XH1AAEvBX69PWpSAOmlmmU7l
	MFM4vOilrNI8fxnpq+slED1IRVjg/FVzuW2USnQndjcyNJ3GSMjE
X-Google-Smtp-Source: AGHT+IEpW0kWN4jGRG2H2u9atBg0cacZuFn9Qtzcnuig3NeGX17ybEcw+CsSoFEVQbnsHKCmTB+GnA==
X-Received: by 2002:a05:6512:2809:b0:533:4785:82ab with SMTP id 2adb3069b0e04-53d862bec24mr11091711e87.1.1731404062919;
        Tue, 12 Nov 2024 01:34:22 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4221:c5a8:8273:369b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a18521sm704085866b.20.2024.11.12.01.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:34:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Enable Renesas RZ/V2H(P) Watchdog driver
Date: Tue, 12 Nov 2024 09:34:12 +0000
Message-ID: <20241112093412.20093-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_013425_782167_8D40E67D 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the watchdog driver for the Renesas RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd82ef9d7adc..cb04c7c98a7e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -736,6 +736,7 @@ CONFIG_MESON_WATCHDOG=m
 CONFIG_ARM_SMC_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_RENESAS_RZG2LWDT=y
+CONFIG_RENESAS_RZV2HWDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_PM8916_WATCHDOG=m
 CONFIG_BCM2835_WDT=y
-- 
2.43.0


