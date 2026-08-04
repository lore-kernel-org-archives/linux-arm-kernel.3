Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12899C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QHEypZX+49feTAVjHCZcGseNbVTzVI574zRhpWtGRxY=; b=mbXPK9hwfqXoAKFNK1nCwljKql
	oeeR2pvLSQ1b1AyNuzDT5qk8rdnL+dvD7tQwH8EhRui49SfSMHv5tHTsmp3zid7Lt30WPuI50HHth
	fSXa2/SDGa+dQ8f3t5BTojEFbJxK8aDv5iOSlmPc9RAHjE3BiCjNU0K+OWeRK7pq8dn3ImqTP3m67
	1SbNXPzG2HnGnISV+mcD5z6H61FkDgUdzUg71ssGMDmx7hLc6837wC2lXe6w6yHO/bNCUui97Ug58
	20+lM8nD1m3qltUFc07xrNCXyvP/rdNskdxiLPoXDttMkXLsQiRG2swkGwYoihGTg1n3fpIiQqTrq
	MNC9rOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Z2-00000001Ec5-0aWJ;
	Tue, 04 Aug 2026 07:27:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Yz-00000001Eba-3k2M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:27:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-472326ca506so2918088f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785828468; x=1786433268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHEypZX+49feTAVjHCZcGseNbVTzVI574zRhpWtGRxY=;
        b=RHGcLt81jDL6/lHDloz57xZHlBrwA/+oNqmW8Eixq7c2JSgRwffWdu5MYsm5zYqSJK
         uQhaqd685tVTAHFyy9bz8hPzp2TiV2qmuQ2o877cnEseyGnKGsxikX2p9NFJlGonXSZr
         6dhICWrXaIS9h+Sbo0b0zr/LHYNv3NKZqQN/3hNNUfRRomBos94HSJguMysw5mkGj4o2
         fYM//07Ot0An6FHhch9RClfSm3WFuN31SGA7kESP0cxtmXAmLfyyALzR71sgYk+GVNnb
         bwPMcQXBfWH0uB7yOC4HekmYgEOd0TGjT1aHIwPU+DsH4j4IAMxHfE3DO9XiwgIxHCDi
         4Jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785828468; x=1786433268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHEypZX+49feTAVjHCZcGseNbVTzVI574zRhpWtGRxY=;
        b=D/Y4wCM+MAU+VaTsplVyv6l79Awn+HEqXbLwpo10LS3BUruAhGMKnpck1WwrOSyXTJ
         LMR/kxLG7s0mBsUG7uWwpNECJ1G3fwWce5Hfzo5G6GUttrdgNr1EFRykkxlgYDwxvGWg
         NN9KkF+N4K2EAuB0hIZq1CtDYTB+9Hj+5xdu6h05OO+Bc5ESwWASZwZgbD2sGF6qMPDt
         Ij5eQe7pJ1bmrQ6m8SYwYN5rdnBpx7/3Xi/rZj9wMydCMSWIUa31NowVe1Mc2nKpKCRf
         D+Aj/An/YFmYPir+ixTqhL0jK4N0hVclOcspb9fx8nza/K18NilFEU9CHhaeKuTH7ouI
         YQiw==
X-Forwarded-Encrypted: i=1; AHgh+RoU2pe9cvS49nnTscUEJFKeCrqrTqSnyvdtjR7UtNbNdnQisRAtQOQczpO1M8L7oTMhz68+jhGx4C9JR/Rhm24v@lists.infradead.org
X-Gm-Message-State: AOJu0YzPR2EAvMU8XNdRaRKF4exlIFcNRvuNtGiv2h8BTUlJgU3OXDmR
	lqT6LjddPgoLdx+ALephk+c58mrjslrr0yGDg6buESOmz8KftNRnc+o5
X-Gm-Gg: AR+sD12A6m9J0LqpK08xi7bIzwIMN8A51WI2sUExQ3l2YPA1+gG3l7kPNRo1WfZEpwg
	q21qr/LqtqLckoI+x5QxGDILfGBrYTiag9auhToWIN0GCgVyEl2ZtXNlYoreMX4umMoW2E3UFRl
	UFlc5PD9f8wkBJVJytU3jUkN5ASfS8p4pN2xkyWDKgdiG1cM5fhBZCET1yYFn9fKgLlkKYdxaCq
	XnkDRU9BL0CRfdLq/adJ1dSd1FlU+eN/WkUj87d5e3W0x1K93cJLuEMHFxCb+9JUPsso7lTMbR0
	ILdXezMnRYW+QCoyXCquntKK4Pqz78qPCJaPFTSA53Hcs4x32C8oPElOPurVCtARhL67eD4q2iC
	Ai2jHC70mIqMnMFM6P7XUZ7eDxNWD45TqbVGkztlKUbaeBqCS5vnUkJ+TwOyR+LatPDU05QudcS
	/9YqXnPuD7SZDe34+wXqtUvSACYJ52ObbrG3h5aVzlW0Sf2VgEVCH4vG/yRAu3Ro2eNDdh5AFAy
	MqYrAm7V4PrmrBSS4iMHGfyKssg9jl6u/SBrYhL0zcIYGS6JDkaX4LO
X-Received: by 2002:a05:6000:24c7:b0:47f:8fc9:6eaa with SMTP id ffacd0b85a97d-47fd72ba6fcmr34214693f8f.8.1785828467494;
        Tue, 04 Aug 2026 00:27:47 -0700 (PDT)
Received: from thinkpad ([2.176.232.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b05fsm42422253f8f.28.2026.08.04.00.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:27:47 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
Date: Tue,  4 Aug 2026 10:56:27 +0330
Message-Id: <20260804072630.28745-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_002749_932204_E217FBF2 
X-CRM114-Status: GOOD (  10.85  )
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

These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
and sun6i-csi bridge drivers to use the V4L2 subdev active state API.

Each patch has already received review and testing individually in
previous postings (see the changelog and links within each patch for
that history), but none have been picked up and none currently have
a delegate on patchwork. Resending together to make it easier to
review and apply as a group.

No code changes since the last posted version of each patch.

Arash Golgol (3):
  media: sun6i-mipi-csi2: Use V4L2 subdev active state
  media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
  media: sun6i-csi: bridge: Use V4L2 subdev active state

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
 .../sun8i_a83t_mipi_csi2.h                    |   2 -
 7 files changed, 194 insertions(+), 220 deletions(-)

-- 
2.34.1


