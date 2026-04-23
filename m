Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EDDF589DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+eROZPmLE7RDR7HyOBddBTk7UV5IVzr9QqgC4DMrC14=; b=xCkI7CGu8rEpef
	GtZxY9b+eYgkFXGclH9PWqUkU61QLzAnjSt8Lp9P5nUgfx8TPEoDTTRlLNqj1kyd86M4D2CD+5WEI
	M6NamwHiybA/1td1/r9k1cO2wKllNTyq6KBYyGMPgIyo1y2Cu5Hk8nLZGIgwrmC0zr/E23tKj1rxU
	ecrI3L1kzeyKxLv3AUL5Lu1yBS+ei4wdmYUo0xFK58pJxRJdsbgI/vlelt80AyL4wMl77S5fJwIh9
	DSRP8Fdzt63OczvkMd38Rj2gWyOXj1OPurS/pnyRPborips4bFxwgpkmITBooPlKqw/dp15Tf3lRD
	m9OZ86PFSw0XNigu1sIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuti-0000000BngB-2tUN;
	Thu, 23 Apr 2026 14:19:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuta-0000000Bndc-1cY3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 14:19:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43fe62837baso4096984f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776953948; x=1777558748; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+eROZPmLE7RDR7HyOBddBTk7UV5IVzr9QqgC4DMrC14=;
        b=MqNHkOXlTBWbB0WVVeY+zW6cubfvmQpYtU7JqXHenf/ngqEr7K0to9kmwWY5Y/mNHj
         oiIUO6J222aZIuepYk/mt1BouGJw6tSWlHVn9CHe/1sjSX3Zm3Gq/Le77yIxuf4zNXWZ
         20hE6ZBopUaH4/O8ygZYaAfD9AELEDadtwRj+rNg8tEfDHhOM/pefhcSPj5XSrjtwl9A
         q+o7QD8yj0CQ5TS/Hv85igg4yzeg5GTTDxf+ytbDUl5NoirOyPcyT3LF1AEtyugc+dhy
         Zrz1jo6vWi+Oyy3oMTMTV2bh+Or1lr4dwvZva2rTOqNFYb27lbnS61IpTVTJpvXf/jxo
         PxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953948; x=1777558748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eROZPmLE7RDR7HyOBddBTk7UV5IVzr9QqgC4DMrC14=;
        b=ecC10Ufh9ERWEg/IISBRsXwDKsn8HF3HsNvmx0hFZyZwU4ZJVNUdIozMlqXTLb6sBH
         uAIcqUIflQHgRem45wNXy3teLX8nfs+LiTRiph7P4VBHcqDR+ZloElDISZE5GldSwxyL
         RDH14U6DoNbjR/sBBN0pTmdbFsZ+NLV64Zf+Y8GvJp81TR+GDQ2kDXu/0Sbt6TSNz+nM
         NucfVQCjROOtacs+px5E6hb/FcEEvyNqa4XixVNA44Fk7TSoizd+aZlwv++51t4kRFT1
         MYejFFWnkcXl5l0NCrIeJXXVBxBcHr8X2N5TeovFb3e7X0zWSw7RcnBUyJM1YuP4xQEd
         +57w==
X-Forwarded-Encrypted: i=1; AFNElJ+qtabuPpLCAGqICV6ZK9mmI6RxEuYCohqABoKmnSc4etYEtFXN3GhJ2OgBmodhrvYxRtWiMOB3ul0pELrnla06@lists.infradead.org
X-Gm-Message-State: AOJu0YyV0po3866LEWvSrF393NrG1UWrHkgdUsv1MbapxZRyeOalJGNA
	omL2Gw8GRIFJfzLS/KpbodrDvE2UhviBMCljzjuzZ10+jeVBVGanJZB7o62bQunhgS+uwh2r075
	BbQcqzZw=
X-Gm-Gg: AeBDievyNg8CTWltVV0izsgZG+oG5AnJWpqkIG/hOQInO6V0Sih3moTJ6C5rFooWhzb
	+VHJTFp7wfMhk5ujNIf9eMMZJVswyquJbL3yCHBuLg09Ou4Uq4TESiVK6jMb4qxDqCXodA5NC+r
	XoDd6UrWKGsx/l86+wb7UNqK+8vJ487FWGIpQ/ZAQdOGH1g0XK2DVPcT6nOIaZi7kYWH3B4k3+K
	GUE6OFlSdXrWy2NmdsIFmVHo44tNK13M4RP1VaV55CMmp+BCnPmmHyA6NjoSR4bJDYNxLXoPJSO
	JOwNIW2nyOuEGouAKnNgRBIbnuswKgK7d+b/Az3RH3Yx/3bXhDtKsXWKdC4xjxh0i/BE1DU486d
	Aic9oEIwznk991kgqxPehJdl4iYhnUeUeUivPy+lRF7rFUxRsmAgnkiiuORHafGV0lfEScejEDF
	RXjTw4v5HuShG/ceexZwlcLxHJaDkiYBlUo6r1GoMv/TxuyLEE6tHsUiwXEgJbkm7tfHa1v3rx2
	WkJHWmlCLl+S1GKKg==
X-Received: by 2002:a5d:64e7:0:b0:43d:5ec9:246 with SMTP id ffacd0b85a97d-43fe3db2d0fmr42764796f8f.12.1776953947709;
        Thu, 23 Apr 2026 07:19:07 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm51107483f8f.31.2026.04.23.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:19:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/4] firmware: samsung: acpm: Various fixes for sashiko bug
 reports
Date: Thu, 23 Apr 2026 14:19:04 +0000
Message-Id: <20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgq6mkC/x2MwQqEMAwFf0VyNqBdFfFXxENXnxpEWxKRBfHft
 3gcmJmbDCow6rKbFJeYhCNBmWc0rv5YwDIlJle4pqjch/0Yd57lB2PztsoWWBGDnsYerv02mOq
 6LSkNouIVU98Pz/MHNrxb3WwAAAA=
X-Change-ID: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776953946; l=984;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Alq+UFc8DGGiXf1MTbZh93F2hTozhdw1uQQbLdnroEg=;
 b=5DnC1cyhRATJzyqTxlio1EYxDf1k9YJhfl5xiAUbAVVIwIPmD7bB8J3dqNBJV0meH2h8Ki8ik
 SFDjLBuZFdsAHwNg4R6zvzSOZ/46k36OIzRA7vcVEJFamoTEXFT2y0/
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_071910_463407_F1C1E96C 
X-CRM114-Status: UNSURE (   7.09  )
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

Fixes for bugs that were identified by sashiko when proposing the
GS101 ACPM TMU addition:
https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix sequence number leak and infinite loop
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  3 ++
 drivers/firmware/samsung/exynos-acpm.c             | 32 +++++++++++++++-------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  3 +-
 3 files changed, 27 insertions(+), 11 deletions(-)
---
base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


