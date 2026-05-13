Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3370BCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 05:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dkpgyOl0OeakKh0bSkim2LmtFin1UzqZ4Tfpbdh/KSE=; b=uktfY9Wd4Xqpnx7JV/k93yXuSH
	vINiaG82Gke7x0Dn6FfYXkgYL1ekoPDB8LNKwgyXjB+c6DTbqfyKexFaEnO/bMqimF5UzY9DXFM+a
	f96U5Yhi9lO2Kj28LW8BmUKxrsRIKBcZxVFxQGgsiEtJKawfQumYeFTpZCyWovcYWtE8mTEYdoAhW
	/euUWsrbw2vRCfE+qOvfb3XaiFLpURd26FfGlQMtyoYBNDpJWRihtzmYotWFTCwoLpwf33PeIE8ms
	bJMAy2/1KgZyO2jU22giRbPPWg2pcpZQR4XFCS7Yfz9TqmnqqsCdWWkFAeFdp/Cost89HneCIBLsE
	52lwou9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2aN-00000001O1Y-3HTw;
	Wed, 13 May 2026 05:56:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN2aL-00000001O0T-1ePw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 05:56:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so3104511a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 22:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651804; x=1779256604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dkpgyOl0OeakKh0bSkim2LmtFin1UzqZ4Tfpbdh/KSE=;
        b=G/Bdzp6++mwmEg/Mp7Rh3WhY+h8fLWnk4t1zP/vjMM2rb2SnWrSpSL9bW/SlmBc7Jp
         eHGZ89UDu+EexQFm3IBbU4Om6liQUfa/mKfF3JHJJLcqRDdFXrQcyirGp60QTTdP6p07
         nUsN+SiobWhR7je4PrlhMRi0RaPdlRVElhhjS6TumQ60JTAwj5kFqij4aBnHSn9k9z7W
         SWg3vrNGiWwsUkEtqwrjRZjnRcTkbuS+X26tGxNuFf5NkuQayzWTtbtz4m831C59a5t6
         9oBXg+k1EzMADGL6+epJl3du8Gc+zKziWsY2F9x3YjPwinKmy4TGUAo6pVfU8XYvt/46
         8t/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651804; x=1779256604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkpgyOl0OeakKh0bSkim2LmtFin1UzqZ4Tfpbdh/KSE=;
        b=DDIuR7bZaAFam71wX1HNVSOfezxYy02O8+8uoMmtIbxLrM2CtWpqMejPf5Z8B0wtQB
         vc9ivFkx7bRb1LcoeIhKUlgV7oqnYP0dpOv53MIiNEoq13Y0hG5GmmZvGV6r+ukDW3Ib
         VTeNQgAL8ac8Pwcc6zPBa1krx6IhjuRtMECjyT2W+BJdOvngroIR55cKSIODl2ws6Bax
         j7PAiFmtk549f4Ju3ZhXukprjaYpFw0aiGRCbF9Kk7GM5FLIZ1TicMSk5FUbUtk/5/+x
         xKoSY+Zgo8vh/753P/kpUwvRb7h1FB5N6chcW2ifoqxy6pFri4OEZDsWg2aPO+/ZGZeK
         4Aug==
X-Forwarded-Encrypted: i=1; AFNElJ+Uxm2QWdAweHnW9Gprs7Jm2V33yYAyiSnm5/VIzO45WZGMblGfatd/jWVVDk/WxLpFkptzzvRXeapxsIBWss3f@lists.infradead.org
X-Gm-Message-State: AOJu0YzW7T4VyR6Ezr42OFdApRJVcO/oS7GC/It/cujr/igzZ+/sLgTw
	s7uMCLQBu0C9YVrDUvghh4HjxbPsxIH64YjnBbu+NXhlDwl25q6zDJIE
X-Gm-Gg: Acq92OHWOF0A8q7LBoYc7FR9xGvcbS+nmLNaS+QOKp+Od5fhaSLVj53uJYI0Hykltjm
	inQD3THfK7zdNY09evEiKjmxADFYQDPUMKD5MksjR99/Wrt4PUjZS3gJuMzAB+lNp81Hydl+uOC
	WuGLk3EVOVsr1i5nIe31pIz/lW7BtOfvUfvFbp0SeD5qm4WS+KdgXpVR8Oa36N1eGtvcxtdUcV7
	U9CAhuPYhjQMkHn/r4wR/3qEuIw/mp8fL6W8l9nZGhKywa00oDNqiPoV3L3WEK0siwv+UdEaH0y
	YMZeXtW5EsfojEF3UmlvtQ21IXJWwngI1wP75soVSP3ueKAhDEx0t36od2p5jX67h3JOWRPsV/Y
	l1c8JlqlXn12Iz+z1HxReJ11azx/O/KM6e4mpfBBX6Epucjtd+N3ONJhnFq1ZcRNTS7mAoXgmZt
	KdbrVsP7p7oclWUuAQ4aOWt8F7HKkD40lT23eJa9tgteSEwXuXs9bVgkw96NdpKQbQeAogDFWr2
	THZhIRPIwLS
X-Received: by 2002:a17:90b:2541:b0:368:78da:803 with SMTP id 98e67ed59e1d1-368f3ab6bb5mr2401771a91.12.1778651803953;
        Tue, 12 May 2026 22:56:43 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee32822asm1785492a91.12.2026.05.12.22.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:56:43 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 0/3] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Wed, 13 May 2026 13:56:23 +0800
Message-ID: <20260513055626.1070533-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_225645_432563_27E965FA 
X-CRM114-Status: UNSURE (   8.45  )
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

Fix four bugs in the MA35D1 PLL clock driver that cause incorrect
frequency values returned from recalc_rate() and determine_rate().

v1 combined all fixes into a single commit.  At reviewer request,
split into one patch per logical fix:

  1/3 - fix div_u64 return value being discarded (affects both
        ma35d1_calc_smic_pll_freq and ma35d1_calc_pll_freq INT mode)

  2/3 - fix PLL_CTL1_FRAC mask width (8-bit -> 24-bit) and update
        the fractional-mode arithmetic accordingly

  3/3 - fix ma35d1_clk_pll_determine_rate: move find_closest() into
        the configurable-PLL branch; unify read-only PLL handling

Joey Lu (3):
  clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq
    calculation
  clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional
    calc
  clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic

 drivers/clk/nuvoton/clk-ma35d1-pll.c | 38 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0


