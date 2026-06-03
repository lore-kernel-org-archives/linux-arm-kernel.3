Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DDECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3USj/+ztE88i2k2s18GnugDmZKrDU3UbbzkTJE6QuT8=; b=RUDeIpRhER1eadZF3/CHl0TCrJ
	vhVcZ/wdjo3DSJ+7K2CdJtaVVXKKYGu73nPkxhcy8wBmNBe3g5+20/r81ltdo+3wNYX21EUlEbA3u
	nwjAnAZo2b3h07g+F7tPfpMtfm4eobqRRQdXZ7IIDvAEGXZj+wncvX4CsC9nKLF0ovGGDVPnBepcB
	gkjcwtUtKk0L2acbWAuxMgJLc/Z40Kap/xlM75mdQYr1LhFNo1diYORa6IAFVJFQqeg0ajx+Lqzh1
	F2P7rqii5Nf1S0Rz2Qec2Gysc+gC2hNwLGSKWd6msgPQMgy2GqKMk6LkT1HMYI8cQUkk7lfk6HBw4
	JBKMQ0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbp8-0000000E8n0-3oR4;
	Wed, 03 Jun 2026 02:59:18 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbp6-0000000E8li-29e4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:59:17 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c168baac83so978715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 19:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455555; x=1781060355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3USj/+ztE88i2k2s18GnugDmZKrDU3UbbzkTJE6QuT8=;
        b=QGlYExju0XN4GYtwvW2OSrITLbop/juz3rpzfM6wfKFpjVACWyHymqz4rFAXryY6Ac
         H7ACPOaIW46cuXXeLn+BZABcC/+i1bMq6D44LufYWEe1KlPBTCyUeRjtPmPGDgTwjoG0
         qzafXLaZf21+/34A/GNvhynWA9mpKX5g8hUkk43Y1zgdaJNJp9fkFMiE+EA01nz5D/Yl
         WtCSYaVNo8MF0AjBdPHQWve0ctKtDUIhSs3kwEQ9wHPYCBZMKzb0QVKSjBZBy66wN12c
         uVEI5WhfTJR8RYe7hzApLThUZbuTrysqmjNCSJLlMxbwe+sxVcGb6rQyEs0W6c8QKYfq
         yzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455555; x=1781060355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3USj/+ztE88i2k2s18GnugDmZKrDU3UbbzkTJE6QuT8=;
        b=bZQPf80WcigxSb57mdGyp2ansK8NRp5/K0NZpyvrSCssr6Xm6bncvEbpn0la5WX79A
         X4IMTBdOsNxLBifuIZrln9X6Y7TUhV/Y1amLW/p6RAxw+EmEzg+2oDexJVpXxFJKMHRe
         K25kS4W0yrarvAfSHHr9LE9Z7sHT4wcWmYoMN4BX+ahVSKQdLAzJpF7X2nVbS3kQ3jbR
         mn0JsEs7VzRYBwvpaS9zQirqzxxuPciAQQCfe2SX+mKZW9zPkg6MT67bGA470LUZXPy+
         roqcInnrhrDR9T/rDcpE7E31yyyhyPrNWVhUHxUKgvrmg22lyvb97P4jKF7fHoC/ApUy
         fYoA==
X-Forwarded-Encrypted: i=1; AFNElJ/xm2LIXQ9yBv0iAKPcXMRHMtnboz7pFewY1lhkbu0OqsowwjmNxQw6hrtvB6g81F5jEW253A4tnCXpXNv/GXPz@lists.infradead.org
X-Gm-Message-State: AOJu0YxiOgb1cxV2D3FmvOBabGy6ukdpuvCt43XCrjNfko81CKuPT/Lp
	c0yVtoLc56zKTXrzVbojvOYzjn4kmXzgtPhC0b+ZbkyzWw2se0OUgblr
X-Gm-Gg: Acq92OEZBz6HdCP0PgBVJw2/HqqamIh3WYdgrwGiYvOSGyKpghTDzqEhQYjit6o5MVP
	4/QpNPRVo8Z2cQtoYfyeUbXY2gIQ2zRpYq7tCh0QJRPSbXi7eS8ClYitVePf6/m1jrfAOUDrA6A
	R70/oIRa0Ksr7mDDfCchhgtUJoQ5IfB1GPyLR1LtOpSa55s/+MgwX3qWcQ/NspdCHe/H8kr25zW
	8ZdXkkmaWKGRMj7Nr2e7s23yfWuPNbck8KbL5D/Rjt8VrzTq2Akd764BrlshqTVXBaa7/t4JdzG
	ve1xFw2y+TG4FksPqDcjWEYXpb07UW+I0DNl4GoGsexYXkarJdB33ZRpMllHN6/BS2KOqrrsMm8
	MuD4lMAMxGWx2COkfdrcIzVRLOq7p6KFyyu1Vww0LGqmgxOcbeGYeuuWW9CJ7AovjMV2z3Wd7LU
	YFmquGy4LowojnMd4ex+7/2PWsK0qa5rbjRgKVFP0Aj4ZcLjE3h356AOdXcruC87Q2l81rWu/V3
	qU++HIPM/ybCHMu0ntcrcJ7SMbDI1ytZZoIL1QZj+HA6Q==
X-Received: by 2002:a17:903:2410:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c163a257e8mr14341345ad.3.1780455555160;
        Tue, 02 Jun 2026 19:59:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm8093805ad.17.2026.06.02.19.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:59:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCH 0/3] serial: mxs-auart: devm conversion, clock rework, and IRQ ordering fixes
Date: Tue,  2 Jun 2026 19:58:54 -0700
Message-ID: <20260603025857.287148-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_195916_553358_D3982979 
X-CRM114-Status: UNSURE (   8.63  )
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

This series cleans up the mxs-auart driver by converting to devm-managed
resources, fixing clock prepare/enable ordering, and addressing IRQ
registration races.

Patch 1 reworks the clock handling to use devm_clk_get_enabled and
reorders clk_prepare_enable after clk_set_rate to avoid
CLK_SET_RATE_GATE failures.

Patch 2 converts iomem mapping and GPIO IRQ requests to devm,
removing the manual cleanup paths.

Patch 3 moves the main UART IRQ registration after uart_add_one_port
so the port state is initialized before the handler can run, and
manages the module clock for console vs non-console ports correctly.

Rosen Penev (3):
  serial: mxs-auart: rework clock handling in mxs_get_clks and probe
  serial: mxs-auart: use devm resources for iomem and GPIO IRQs
  serial: mxs-auart: fix IRQ registration ordering and manage console
    clock

 drivers/tty/serial/mxs-auart.c | 133 ++++++++++++++-------------------
 1 file changed, 55 insertions(+), 78 deletions(-)

-- 
2.54.0


