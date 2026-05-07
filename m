Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02BACD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n/gFcE0bu0rJve9uKyHSH4ubBqFP+IcaKsA+2O0rr/w=; b=PgK7mSV1QjpcCqgtHBHAXIKYrK
	/0vQRXREoIvGhYEduhfUD8vFnMhLoNImngSmKw5VW17gwBT0SwR+akotY9ApvCWIAYAPsHfxM2hbn
	jhUPindB0U1fSaTwpbi8zyrXMCXrAdanSETammkg1TRJVlhhnsn9j5p4d5nedil5Hu9w+8DKI97ZF
	WiUNe/emr7hVbT0JHEO7smw/v7hnPaZVJBzvYon1InrjwTgxujSjUS2Dh35JoyFqcIKm8pj4sBFyY
	/3nfM5Ak0+1CFeT8y1mSY/RRFJBKq6MtM2TrovjDiLn/SWhf/4UYRG+hzUxx+QebuCzg6XezN5nXk
	yn3QKPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvZX-00000003Qsk-344H;
	Thu, 07 May 2026 10:03:11 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvZV-00000003Qs4-1PHa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 10:03:10 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-393925cb1baso6087981fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 03:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778148186; x=1778752986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/gFcE0bu0rJve9uKyHSH4ubBqFP+IcaKsA+2O0rr/w=;
        b=OS5bcEWC3LOy0EuH33+rOIF6jEKKiwaULZTbqMBepSxI6+17TdFLL2cKJEP0d2Brl0
         Z6G++JsQj/RaegbSUcUoRFwK/DAed1NPg2skurOTRleRZzyAx7DX1WbxL/lvA+Qk9egP
         cqenqWZdIJbVNFGb1FFUJ9YjSw2j/JsdyZBA2jQ8gYOv9BSblT4i2ysTgMfV0UlxxmBJ
         j8CCeIQPuXSdCE9QRhCQIZmz/V0C69G5U+NF+6A/v5S/c08wFKuhkFFYJut+c4hDYcVQ
         2cWdp0y/aAjzI5hKyrEMcdygLWPAV+lmI8pa7JFasVUInYk4TVacY7tB20wVGMDkucpa
         jG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148186; x=1778752986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/gFcE0bu0rJve9uKyHSH4ubBqFP+IcaKsA+2O0rr/w=;
        b=Q9FfOfqAownn+Gs64Vqe1T2F/gVXYQ6/S0P8frAT9ltig7n4PfA4Lp43VDd3Ge6hv/
         72Tcd6u/R+tM43LVgfkCiAgnwrTibZQFLsq768kgMe2wudQT0LKWBiSetAxXsZLKCrXG
         v2DLQPvoXN+zb7mXQkS1SEiHQHvA6Iy8aXpnDKB/bPqW7+64vddj7R0ITYDtOkc8jkG7
         4HSFeXPVfohdPD92K3j6LuqEKtLZ2CeB/qK0ktMMGRBQSTTR7CbL3uxC+A2ZzWA0qy1C
         yzcpBIaaxJBum59ydyz2paKQyGVHJ7eRYcih0QPIhSODtlbOpoUPRPfNKLTRUaIjaFT0
         DLYw==
X-Forwarded-Encrypted: i=1; AFNElJ/OCNiyKVmNpCIZipMsXWC7RfVyvHEvdm47oldcRE21YUeWqKUB/FtCLTJTq1PzXYT6XfQ8XUBRQNwbsWkK9jK9@lists.infradead.org
X-Gm-Message-State: AOJu0YznvqamplSEsAl4guF9IP9UQh8GlcRDInxet/NJIX+WhAzs/wk6
	RtKx6Hq7V3M2PxsoLFVjCzp6Wgw9ReGvNHFKny3RAMFESOfB5UJFih2aDNV1B/5LtEA=
X-Gm-Gg: AeBDieuszUsUPzjiR23fXavhW1ahM5MakepW0xObxbzGMpg+WGMOcxGuuB/UKf3RcQF
	mSx0qTOW2WrBrYyGcTPdvCIHpWi3RV9rnHRdnrfki0xxsxosGdn8kjCkZNkzqjHz6HKMSmDKB4I
	7OCf5e+1I2o9+9rFLJenCl6i3QI70tdcr6CMjC+aWh/HCdkoimb15GVdlQyDAlwAZp0hdGRWinM
	FBMUQe7WvWMv+1C0jVTXkiuOOUY/0qAnza14maY/C6XRhsW8lMK/REwJqVR5EwLVhCiDMSVepUN
	tlJE58rJP1LpRBvoV88x9CdYmcwqIrRT2qyfEW3MXzNKgn+Ba+AVTsi7tB1Ln53KCSwTDNzYIY7
	6tqqP4VDHCQv+4DcHp4IrsG+itk8UJtWDVuAW/tJ0OpDf28wXbm+ihYhDjSI7YsqTMckbVAdAnJ
	7W++xtXfcnsElHhe3GWWkn61ZZdjXDHGRQOfmlNOpA5Ktd+jxpfpHoITzSIzdfhRf/t7cke6L1i
	ML/mp2Pg0E=
X-Received: by 2002:a05:6512:3046:b0:5a4:1914:bae3 with SMTP id 2adb3069b0e04-5a887ce5f32mr3013919e87.27.1778148186116;
        Thu, 07 May 2026 03:03:06 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8683ff452sm4587537e87.63.2026.05.07.03.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:03:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v7.1-rc3
Date: Thu,  7 May 2026 12:03:04 +0200
Message-ID: <20260507100304.8170-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_030309_397964_7F622809 
X-CRM114-Status: UNSURE (   8.53  )
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

Hi Linus,

Here's a pull-request with a couple of pmdomain fixes intended for v7.1-rc3.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.1-rc1

for you to fetch changes up to ec1fcddb3117d9452210e838fd37389ee61e10e8:

  pmdomain: mediatek: fix use-after-free in scpsys_get_bus_protection_legacy() (2026-04-27 14:53:30 +0200)

----------------------------------------------------------------
pmdomain core:
 - Fix detach procedure for virtual devices in genpd

pmdomain providers:
 - mediatek: Fix use-after-free in scpsys_get_bus_protection_legacy()

----------------------------------------------------------------
Ulf Hansson (1):
      pmdomain: core: Fix detach procedure for virtual devices in genpd

Wentao Liang (1):
      pmdomain: mediatek: fix use-after-free in scpsys_get_bus_protection_legacy()

 drivers/pmdomain/core.c                    | 10 +++++++++-
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 10 +++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

