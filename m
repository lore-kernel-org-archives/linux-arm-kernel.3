Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2D0C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9+zrfepUvONfB4EyAxMBrInEBGNeqXHZ4lQ9CmctDXA=; b=PLcjZtPTS3H1Ceu9/Ndil0+bAY
	p693mxdkpDRa3La5ry6Y4zCR5ExPLiK/G5s7Jajmaj+6x4vlxukBKm12Q6nwnSBdhQbLyw4N5NT0t
	wPt3uUdue2OrXYyS+WGtJH/wVhKCs8FPA3TqScapx8svi3V6vih2eal4W8CpL0kZ6HKU+BUV8UiZ8
	1WNzqIJ5o8J88xnvGeB8bh8/kjypfsEWk2hQ7QZvMrcY0TBkL5mMwBZeKaDMVTI+6WDWt+gmgPyQ3
	mOlDhf3KkXPtnCuh7XEj9SB7ogSgkLbCxhyangaI9C67TssUlgiR805lPSPe6QSx7Xa1DYLczFC+x
	c1BLFwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70s-0000000G2DJ-0cQi;
	Wed, 12 Aug 2026 11:20:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu70m-0000000G2Ai-2CVo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:20:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d0407aedd6so11259475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533644; x=1787138444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+zrfepUvONfB4EyAxMBrInEBGNeqXHZ4lQ9CmctDXA=;
        b=llLHo+LtE3pXDQnQUhM51vnnI4P48UXRLumL6GOtO5UgTefh7ctmFbn4YUyQa0GcaU
         oZZokRQIvNMrTOaAD4+CYxBakSFGEcuyJ5Ssd//E9hj0wO8DCJLemfERd8nA9igtU7Ay
         JMo8IXhArKn4WmRVNPl2WZ9i1TEHWDxDhbhLyRJxq11U9OcA1e3EtZnso1ua5e3t1GkU
         7zp7RX29KTEPXNOlMyG2MvQqYSl8BQVXhCHigsxLlOsVTgMgea1GCsqAaNSa6xe1S8Jh
         U372AoU/PpafKT2zVg6b3GF6hBfw1GINa9jPtytGlM5u6dEyGrkd6+arkz0lYJoe/hNt
         jyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533644; x=1787138444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+zrfepUvONfB4EyAxMBrInEBGNeqXHZ4lQ9CmctDXA=;
        b=RXmnjNVkv+hhIXMt691i9ZD3GJT9sXcbNtUSwi3ydNQj3ScvKeFxCuXrzjTgQGLWF+
         sNW27yUd3Rvr+Un0QB5ldDvsfiw0ymgmLudlPJLlp4kLNMyfk8Lhh96pAxyJ0NkPLwYQ
         hoMBFeDjklx/FABV3BxEx/b/8xScK7FxuYcW3XngLR9cr0dGPHJj7N3s7jB2qywyIYBr
         Vg2Ssoky0Kyhco/01h0TqPCcV9wZ4WiJi3E2cDec/ZrxgMYm/FTaHWa0K+tvRpI6J4HC
         tFzKwz5eRzT18fchXYgh1yggw/g4Wr3jrYHYqCae9o/V9XgnfaV/utfhtc39U1yITxus
         fvdg==
X-Forwarded-Encrypted: i=1; AHgh+RorYz5pVjbZq0jDfUup5eNtl+DA5vfbQEH2nZRQlV77d7kosXL7xGyojzpQD3RPHoE5mG0QmdCQ7Eps/aF5ZFSQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyD1O9ol4/xXFIWrhioZU3v6yVv3yUHp7NpMEnwleBK6F+PKkjZ
	4V6ySrD/rW09KhqDh51qbiQUGYHtEcHjuTNlR7ackWdsjTIWvonsWJFS
X-Gm-Gg: AR+sD10GoGX61X87cJ4bxiw57uwsA2HMSKqJl+zp1BJlyokrmtGlD0nZyuNvpqcjlXs
	wUEXdLBPgn89tvcsnVXUj6K3MVJu1OQ5Asr9q6Py+ahzY1uHaj9+alAlDFzcuFa4nYTbeoPn+5c
	gi8XsuMbCdj4vZbkJ5G8Ieplgcka6dO4Km46HJP7Qd/P87XZ2/BlaTE5ZgbB8SDpJxJFy69Hkyv
	4W/FM543Da5l7kDrs/SjXIJmVzXSqGCFUZvvpe/kgWC9jcu+hIu0+rGDOFZXihELdKIsoBle7ia
	SaiZCH8vx32I8NJoJZG4vjUvTcgXhlyvIqZKTwyI2PM9HhB72MbX5KfSqv/y4xCFfAm4mOSCZBe
	TwcT8E/G5CDCW+/PEYXJxHRdBEiTpaH04YmLl+cwx/iDqsHkyuxZkJ4nufDSWtsWhtwFsJZO8Oj
	kfuY4q5KEiBS1jX6NAQhEa3lQqbvLME/i9tJ3u7XiLvrx9hL87lP7orTQFnh0Mx0x5mXGDAbJ1h
	/hPvbbUcm3mMhHSWM+gOMtpDiY+3BxquvtFp1Hi8ct/W/Mox+anRedwpZ3HMDlnzFamwLgE2SWa
	I4ai
X-Received: by 2002:a17:90b:28cf:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-393012af827mr4741095a91.8.1786533643641;
        Wed, 12 Aug 2026 04:20:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f935f5ecsm3193765a91.5.2026.08.12.04.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:20:43 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] mmc: Handle errors from optional IRQ lookup
Date: Wed, 12 Aug 2026 18:20:20 +0700
Message-ID: <20260812112023.42254-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042044_679951_7D8D36D3 
X-CRM114-Status: UNSURE (   9.14  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling for optional IRQ lookups in several
MMC drivers.

I noticed that mmc: litex_mmc handles the return value from
platform_get_irq_optional() correctly, distinguishing the case where an
optional IRQ is not available from other errors. This series follows the
same approach in the affected drivers.

Best regards,
Phuc

bui duc phuc (3):
  mmc: meson-gx: Handle errors from optional IRQ lookup
  mmc: davinci: Handle errors from optional IRQ lookup
  mmc: davinci: Handle optional IRQ return value correctly

 drivers/mmc/host/davinci_mmc.c  | 8 ++++++--
 drivers/mmc/host/meson-gx-mmc.c | 6 +++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.43.0


