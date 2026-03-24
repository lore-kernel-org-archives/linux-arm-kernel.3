Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40BFFEC0F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y8dxWxemVY09l/RSeGxRpi4JIV8mJaxVcxtXBlCQ2JM=; b=dIvg3FDvOT3GAJ
	9u6tgTrg8IIIVAbl6O0Sp6Oydu26ev85wAWzmCNWhRCFM/ziJgAx7TvgVP5SB+5YjHA/CWaXKxb1u
	lqVawdADEmqKbUeDtenZIBbrlsz+jraBG26hn4qCRRNDpn3k0CsJhzmjKeYDoSNZh29oJ7XdHj7FE
	8QxryqudR08D62OU9JR8U0NHDRI3ElhzUY7xICj0YEUrFN+3RWvqqWMT+3RMQEctTB3t7i1pi4Ne0
	lf1dibJsRph9kL0KWybhvOWewy6yifG3TjCFg4NRm2qtwUsfv3Q4RUV5We6Pf/lEfwZ0Feb9KScL1
	BzE9MaPL1P3rOSBGE1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56TB-0000000241E-2ps7;
	Tue, 24 Mar 2026 18:27:13 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56T9-0000000240t-1ZDf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:27:12 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-356337f058aso3251514a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376830; x=1774981630; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8dxWxemVY09l/RSeGxRpi4JIV8mJaxVcxtXBlCQ2JM=;
        b=jW2b6yU+eOUeWZIGMig68HYJpO0893QTyMu7AJpR4UCrwE8Z79RBfkS6aVPdO3Jyz8
         DCaGwQ37QgKNhi0kZjRVgXlCWl03Y+CzztjrCzrz40GD/A6vRsp5X9p+HByACQuYDcMm
         NwpXM4lnlU+p5GGjG/YsXhRIoMrFlltBDJHkf7b2HtUI0ItsqeORT5cbd+Qs/z/IyHm3
         LQCaTJSdiac8BIffWmj7LIlHpR8M6D3l4DEyHrjOrWI5dd4br2uEQbsiq76vnls+FsCx
         yZJCYUIHAhBOm6wkQD5DdPeQm4AhgWkUjfrSkYrZI2i3jzTUUurXPAInDbHeRJgYDQwD
         iSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376830; x=1774981630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8dxWxemVY09l/RSeGxRpi4JIV8mJaxVcxtXBlCQ2JM=;
        b=jH7aJnQMriI1a5pttbHNkuqwoz/eaX1vaBm8EQ207zBxrjzGpuqKnMPL4pZ/hUc/qL
         mmw0waFYslgrhHUiu4HoYN2+6T+3Ug2Fo/ku8Lyf8xV0KMED5dyFmwcXoRwk09fOO2EG
         BdC+tcIFiyE7d0K/V+Z4XcrIHGXiPCJr0C8sWZFsv+sJL8caukFgzmZcna1/WoRGSUJ9
         2nN3e2o2keObsZ9FsRzbuRRT3Ta/8ZZ/k68kkkefk0+EBX425BBzJezQzHYNjytWrSjZ
         SkGnVTbj7czCH1J8Erf17nWkb/+ud+MnjJiQkeRDK5fcNkG/NVe83ltUETx9+FdTQVRe
         9QbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlLiE29binZ0nrDoqctjnMWPNksNuYh9virETF1uW6H9pYImwo2S4RGsCutSl5SwSnDF5AzJ46MEIGP3pjG2BM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz83X/kIO7Nfonh5IyTZaGMVyks6037cVQLIBguH/H6X+5JjPP1
	FFWihJ2traaj8mDw776uQq8/6KR6n97ulnPUfJhKmy9B2BDvoVfP7L+K
X-Gm-Gg: ATEYQzzLWsT8gdvGHnovOR2YHMNnLSE3SOJ9W7fvZv8PTx/Efkkd5IZdIoIPUHP8qkx
	lM9LKTK+GyuXJD8nGg+V6Ysyf65pY7p9StvQeU5VMdEdd2ttbrpWtEx9dlrN1NzQvD2cS6Rh7qN
	INLvZTJY5fdAWGtcL2WDVj8CclB3sdErRcr3T+d9XcjNakV4dZODEnqgqoM1ntZufS+EQMi4fxz
	FxYXAumTcnhCdRbpn5sHulil0S7p8GrMJ6lro0SVDTCiy7/gsjoxto4plcBOcaZAksdRdil1mJk
	7/e1RCyTorzFtXK+5rh1mGqEMuJQs4gbCNbC40Esruu8d5A1MOwMji3w7KdCnfnNOGgjlzJKOQL
	Dzgfzcgho7Wu9O+zONGuu+38hy60Am69RpKT7QYWSQ8cweW9kYs1KMnsm7roumEUNIdh3Bi80iy
	k/+CWg8+UHVSvKUntvrP2qSLFDgw==
X-Received: by 2002:a17:90a:e705:b0:35a:329:73c6 with SMTP id 98e67ed59e1d1-35c0dc80d99mr378084a91.3.1774376829881;
        Tue, 24 Mar 2026 11:27:09 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:09 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Subject: [PATCH 00/10] i2c: Replace dev_err() with dev_err_probe()
Date: Tue, 24 Mar 2026 23:56:48 +0530
Message-Id: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnXwmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMT3ZTUstSiIl2TJIMkg1RTA0NL02QloOKCotS0zAqwQdGxtbUAXM4
 talgAAAA=
X-Change-ID: 20260324-deverr-4b0b0e50195c
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=1970;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=4eB96+tZs9fT6uON/Cp8K3KPDm65oymtk7Doe5oPZv8=;
 b=JHbyxUnpSIHVtTKhxJxQI2JLJGqRVx4xwS3l4IGQaiBFJ6HmJ/N18C/fndglYd7QgKbDy3Fs5
 kHTwhOvM/fYAd0raQ4P7x22Q0EFLgoDhJRXmkPQQ67kohmHbtFETWXF
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112711_440451_370520AB 
X-CRM114-Status: UNSURE (   8.33  )
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

This patch series replaces dev_err() with dev_err_probe() in the probe() 
functions of each module. 

This simplifies the code and improves logs.

---
This Patch series was intially sent out by Encrio[1],  
this series is an effort to get it reviewed and upstream 
it. 
 
[1]: https://lore.kernel.org/all/20250520194400.341079-3-e.zanda1@gmail.com/t/#u

---
Enrico Zanda (10):
      i2c: tiny-usb: Replace dev_err() with dev_err_probe() in probe function
      i2c: tegra: Replace dev_err() with dev_err_probe() in probe function
      i2c: sun6i-p2wi: Replace dev_err() with dev_err_probe() in probe function
      i2c: stm32f7: Replace dev_err() with dev_err_probe() in probe function
      i2c: stm32f4: Replace dev_err() with dev_err_probe() in probe function
      i2c: stm32: Replace dev_err() with dev_err_probe() in probe function
      i2c: st: Replace dev_err() with dev_err_probe() in probe function
      i2c: sprd: Replace dev_err() with dev_err_probe() in probe function
      i2c: sis96x: Replace dev_err() with dev_err_probe() in probe function
      i2c: sis630: Replace dev_err() with dev_err_probe() in probe function

 drivers/i2c/busses/i2c-sis630.c     | 31 +++++++--------
 drivers/i2c/busses/i2c-sis96x.c     | 30 +++++++-------
 drivers/i2c/busses/i2c-sprd.c       | 13 +++----
 drivers/i2c/busses/i2c-st.c         | 34 +++++++---------
 drivers/i2c/busses/i2c-stm32.c      |  4 +-
 drivers/i2c/busses/i2c-stm32f4.c    | 53 ++++++++++---------------
 drivers/i2c/busses/i2c-stm32f7.c    | 78 ++++++++++++++-----------------------
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 ++++++++++----------------
 drivers/i2c/busses/i2c-tegra.c      | 12 +++---
 drivers/i2c/busses/i2c-tiny-usb.c   |  5 +--
 10 files changed, 127 insertions(+), 188 deletions(-)
---
base-commit: c612261bedd6bbab7109f798715e449c9d20ff2f
change-id: 20260324-deverr-4b0b0e50195c

Best regards,
-- 
Atharv Dubey <atharvd440@gmail.com>


