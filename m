Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2D1CA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c8rQgecj5WAhhesRJhsBD8MQuFYaTQXU6UTGWDxYrLM=; b=wMHCUs27ObiJCF121b2+rt94IY
	zedDIpNq/IYKueBOqCDKuhLyVjYK5Cu404193seby//Nuj00q7FmSi24o0zLXwftoe2m036DWSvcw
	pHsb73r4F+A5qzYFDEe3D9wKIFUr1/MBh6sYo4I9s+WGy9sWffClfcn4gCbZmHzOEJOw5gKTTYnIx
	QoAuorw4y7mvC+sPefUWIrolcYGkN0NxDwEn5kwH0WSJIHwZ3Oz7i+c1bsCrie5nwZX9Sw5DCHurE
	sQ6QBQf3zIAk36tDSM6qh2vvXlZ6Rw0iJIp4uWO55Pt/qRsa1/gMt8me/QXzV1p2sSWB7A9w9J42C
	YpPF00uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9YO-00000009jTN-0xAH;
	Mon, 12 Oct 2026 06:30:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9YK-00000009jSi-1stJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:30:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2e8d2574fd9so3786875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 23:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786627; x=1792391427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8rQgecj5WAhhesRJhsBD8MQuFYaTQXU6UTGWDxYrLM=;
        b=mHAFvGqx0QkxUZ5bB8bZQ5sQHdxxIRcdyg09trSo6gtH84oCLUX9y4wyrHdmWaasoY
         7tgTh3iCb6tuA297agQmfFA+a6bepKGAKqrn9LTCvCxZOcsYCTSZKtuElPo3VLamBQLp
         JUZcveTFQfB6/WD2WmjxhvIyY2Fb/KqaHKcMBRt0yZ6WpbAp41epDn29n15dgmNjraHg
         FIWfL3BXuICDuqC3UZlTeRcsLVC6QdfE6hxtnHega/Gi6ImACuapvx8MeXwjm6x59ert
         ElGOkW1TrfGDJjCiohCQfX+MJOMtwgpdgvrn2geDPHtKzlbzZVzqx6xCAa1K8dE8wW1Y
         CUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786627; x=1792391427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8rQgecj5WAhhesRJhsBD8MQuFYaTQXU6UTGWDxYrLM=;
        b=ejsBprpHJJ3d9Qr+LhYSJMHIQJYJBxdhP76gyJl/xSneip0FjgxEcuRgrrVps6fPQu
         Vp3zC5GaJlE8+2lkw5qYO9v5Y+bggR2y6QAT5XD/lmyUE2OqiY1zYCLPkf6fXjfYznu+
         pfnUbb/5HcDDZGo/fuy9GfZ6Si4D4k2qLGgdT6gisn+29gH0/CQqpckklRPXT7VzvcgJ
         Omb3KhQbsgkG0Dg+Csf9zPvw9z0yIzOWqDy02WisHuHYmrUu+FasKQbSNzkU1aUrOBG6
         F+p3og/2SJYSYI3eCxXQTLxbU75pGIiWs1GWHGUoQpJnlwmJ9UWshM8DImjrWgzue6ax
         2Mxg==
X-Forwarded-Encrypted: i=1; AKwUvBzcP6JZ5T+UFdC238A6SK8V4Tw9xoIxzVe6kTPRD9ouD7PWtM4T4b3M7sPpjcgemXwV7M2c64GXnL7UGrTXAH1c@lists.infradead.org
X-Gm-Message-State: AFq9FYIm3BLOghQcA2w6nlOTPoERcLT3WvRZMFPzGY4YI6mYyZmxlu8F
	RKj3X+NvKkhstGIw22AnMRZfaSxSNokXYH9qbmd2SYovuSo7Bmfd86Zk
X-Gm-Gg: AYBFou03bEG8oL2ap+y+1gsLKfgYq1xr1z5ymU+hoTt9NGwjzf+AysOPenFbz3TbFKL
	QfUfT6WCCXnPekB+nGPw3Tv3NdWGZYHU81uz7RpMbQm8wWfZhl0AMupNkC0B0Se4UIMrGFMHfIl
	9fNP/E5k7JWcuEqJdIh75DgWPi4VWpQtVZxuVDYOIRFxm9gsDWlqXnngLHe6iywgrlICgZJ6o7n
	i/+D4RFdNMVwpk1kSOSNcxSbKRd9zh8kacnynaCV/mVlHaDP3Y2pb8o3tbwGfXDdFKSG75o3dCN
	nmEb4W4qw2zlL0uikG8utqcz7puGfpPGWpx9QVsWnxfEcc+yrzI+0BRrAoSSbFP7xawEiLh4Db8
	M2zToKTTpN0YC0dcWv7//QGWjNW2OdPonD4oDGu4o1nJ5/ZcKrC8zMiBSa42dvsfoaSC4TIeyYW
	IGn3B/npQa2oKagHu1MGXD7VzMHq1UPWWRPR8H1B1wvDYp8ZHm5JJcGjAIzHrX7L/mfo/YMbsmo
	Bqi/5krALoczAn5l7z90inuPL1nD+KnUgCt4BLEG7V2sRv+39rnsHkl2xVfM0U/Q3vZzYt5Cw==
X-Received: by 2002:a17:902:fc4e:b0:2dd:c170:2d4d with SMTP id d9443c01a7336-2e842abcb40mr85581395ad.24.1791786626975;
        Sun, 11 Oct 2026 23:30:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm39071745ad.66.2026.10.11.23.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:30:26 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	arnd@arndb.de,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/3] clk: nuvoton: ma35d1: fix parent lookup and use the generic ADC divider
Date: Mon, 12 Oct 2026 14:30:17 +0800
Message-ID: <20261012063020.3331443-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233028_493544_E722FF08 
X-CRM114-Status: UNSURE (   9.25  )
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

The parent tables of the MA35D1 clock controller were converted to
struct clk_parent_data with only .fw_name set, but the controller node
has no clock-names, so the firmware lookup can never succeed and the clk
core only falls back to a global name lookup when .name is set. As a
result sysclk1_mux and everything below it (hclk*, pclk*, and the
peripheral dividers and gates) are orphans with a rate of 0 Hz, and
clk_set_rate() on their consumers returns early without programming the
hardware. This was found while testing the ADC clock, whose divider
register was never written.

Patch 1 fixes the parent lookup. Patches 2 and 3 replace the dedicated
ADC divider driver with the generic clk divider, as suggested in review
of the earlier "use direct formula instead of divider table" series,
which is dropped in favour of this one.

The earlier series:
https://lore.kernel.org/r/20261008064307.2757324-1-a0987203069@gmail.com

Joey Lu (3):
  clk: nuvoton: ma35d1: fix parent lookup for clk_parent_data entries
  clk: nuvoton: ma35d1: use the generic divider for the ADC clock
  clk: nuvoton: ma35d1: remove the unused ADC divider driver

 drivers/clk/nuvoton/Makefile             |   1 -
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 133 -----------
 drivers/clk/nuvoton/clk-ma35d1.c         | 269 ++++++++++++-----------
 drivers/clk/nuvoton/clk-ma35d1.h         |   5 -
 4 files changed, 135 insertions(+), 273 deletions(-)
 delete mode 100644 drivers/clk/nuvoton/clk-ma35d1-divider.c

-- 
2.43.0


