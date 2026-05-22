Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C66CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eiBRTRZTJBLsm6cC7zO439AbTyaUXaT32zIuFaYd3eo=; b=gzoe/vlCFjVX5umcOCbu6sKc3d
	+DRcba3tSnsjHDBdG175j6YiQScWMsaOtwPEpuC9Yjmk+78TllrN6SP7RdRB5Z1MRD6pt97j6bIve
	WPCWW8QI/u7z9z6xVVaxjpUOYPmTDsGv5ChyvXHIyB1txZmOpkOvLTZlo6kZtwFVP/2VWuVZbsBWj
	bcvx675eSEoFVNfm/53IxvBAZxwLIZZMAd4RHXNLvgH1y98JunVhN1pUELi579jqWFpZtSlL2nMe5
	OWAT8rYMyhHHAnyMA5BgK1aIVFo7H0Cf1Ok/KAN/Y4tXWvcS3UCOWYxE1ZPXvH4g4tbibA/mt72sn
	ywwgm1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMjC-0000000AQQk-27FP;
	Fri, 22 May 2026 10:03:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMj9-0000000AQOi-3FaJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:03:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b458ca2296so51367385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444215; x=1780049015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eiBRTRZTJBLsm6cC7zO439AbTyaUXaT32zIuFaYd3eo=;
        b=LsGalFVLpuORJv7j7xne/Jl/v8RqPv5Yk0hs1LwSqIkUupmmn8bssf5ItjQ2pzPz2U
         An3zN+BhoQb4So/IDX/Mf3OFNBEcnlyZj3VmJHoeNG7d76MznHGQuOKMFw/PUyDWO3v3
         eEQcDdMHu4WmPeymj+22S9R7akqUL7qux/NQdPjWgxYXRBzBZ2Apaptb6/PlYhwkY19v
         V+8CFVWualwua3TeYXlEC2I7Wu4fXZhEuWxg565YaMT9G81ZTeC3JjRkzDOWDyuOZG6W
         k3msHB73pvAccFbA2aVha4KF1a6FsB21Uq4DrKroL5nDH+GxxXZhhi5iZS2i2x/GZ2XO
         XjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444215; x=1780049015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiBRTRZTJBLsm6cC7zO439AbTyaUXaT32zIuFaYd3eo=;
        b=BUwGsyh6qz7VTOnSVmx7YNtMek07oEOdwdzjs/OLnJ5jRLEe9RemO18Otoqu7c74l8
         T9QPF2Kv7MgYdeeFpIebptW++43uEZGy9P9IJDU0q2a/O66Tg/rnRABnoCw/A1hyvGJ8
         D/yazme7NA9BRSRBWWCEkd2SwrbhPbsWTdrCZFc9d3mKb5lDBaD6hkY6IBPBg74Ra6bY
         9+G+QhyI8ETaP3sRteKecTmrmQe2dcacDDux/B0IxexCXxxzDaIzMQT1fQd91kFQcB8d
         69qwg9dTeYmlvuyre/CJpVFgLcRmZu+23AKrz++Z4Ag/G7Xt8W5EJLbrEstshiR7w+mG
         XI3g==
X-Forwarded-Encrypted: i=1; AFNElJ9ZKRzxGDmgOvmheWgcArlNxwmTzCRGVnLC77oqY4javD+r0cTtiMxaLXwtskjhrxEGUMmjXsh6rG8SBR/3M8gn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5dk3HsDZJcf0t8QqgbUoAzHHm6U2hZcpckfqtwiKM/Vv7/nFy
	Sz9XaXRDstKaUa890zK/FWntWeMoZNEetCzwqHEJcmci7SNaNw9U98BI
X-Gm-Gg: Acq92OGrVAIDJgNZW0NN0IdkPDp2tsMC1iZ2vpBrXJpXvb2CRxozWTFguPz7T4LiyDL
	rqfU1dwZG4ZCNT5F57N+JDwJc/z7myJLmbbPbu0mWroHumZAM7UHo05Zk/T1FSwZk7RTV7B5iE9
	HZHdM2rmSy2ol8Je5CsgRq6XCgxA3t00+mFzUFSamodhUieWL4PgASqcM4MBEgulMOGUhf0nsd2
	laByw+TdCFTzDKBx1gL+T55ReSdJM/AvSc5jWHEzyoOvKjHBEPeuUa5QAik29B58fF3iLsHgOgI
	AirJddIgOnKxWJQCS0jBkOJMT8vGasCH1/CVghn3qng7U2CzVvwHmFHbHxTCtaUkBOobb60d8I9
	MwWAr2HNN82CqPLwhxAIF17jplBBvt6ybZ9/yCAdITuTXrRI0W7nBETzcDqsliArQBbGfPQ0j4z
	1oVLf6T91KGldyVZRZOalM+sgTSWB1QDzSFicaH6V8j92GxVeIyQNba5mnnw==
X-Received: by 2002:a17:902:fc48:b0:2b0:c45a:bc2 with SMTP id d9443c01a7336-2beb059cebcmr32443895ad.16.1779444214757;
        Fri, 22 May 2026 03:03:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: rockchip: Reorder clock enable sequence
Date: Fri, 22 May 2026 17:03:15 +0700
Message-ID: <20260522100318.73474-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030335_816370_202D4F23 
X-CRM114-Status: UNSURE (   8.64  )
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

This series reorders the runtime resume clock enable
sequence in the Rockchip SPDIF and PDM drivers to enable
the bus clock before the functional controller clock.

It also updates the SPDIF DT binding clock descriptions to
match the actual clock usage in the driver.

Best Regards,
Phuc

bui duc phuc (3):
  ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
  ASoC: rockchip: spdif: Reorder clock enable sequence
  ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence

 .../devicetree/bindings/sound/rockchip-spdif.yaml      |  2 +-
 sound/soc/rockchip/rockchip_pdm.c                      | 10 +++++-----
 sound/soc/rockchip/rockchip_spdif.c                    | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.43.0


