Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63410CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cmUxS4Q9Tzyin8+N6iP92awnxvWebVH+uapUMeaf/ko=; b=hR9WY73gmAAVVrFtCOhfsvMCZA
	UmljlJkxZY0zHynEC/UyZWFFSmNfF5WJ5yqsY9W3/OOj5c3Wnp2as6l/jHZ76j4bGhpXV+MoIaOlh
	OiKuCtDzGg9cBCZN+4PVROGMODccARj74lc+iyyQfeJmQRi65dgX6hn5XEzza2C/Tr15vT97uoBWY
	C2NT+4xT4VLc4Osi9ncUjmzI/kXKfSrB+WCMEanX/lheO2QsUlhASYhGT8ntrtbH4giticUrpPMtt
	pahfqqBsQovXrsRdDhISYOdLG5TZ7IAnjCHzu3tJD/EfQRUBFSBM0zQqRebIqmkul+bgMSrdQ8jri
	w59Q34GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNt6-00000006xyZ-0Wmp;
	Fri, 08 May 2026 16:17:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNt4-00000006xy3-0PL6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:17:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so1795317f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257031; x=1778861831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmUxS4Q9Tzyin8+N6iP92awnxvWebVH+uapUMeaf/ko=;
        b=gYFGBJymGu1AsoCZlkIO+nDs3hhqmWKf1FehQ6DvuRyCnvTlahlcxtBaRO2gkCQXDo
         dSbpA7/B09d38vzbmB4sJT5iaBy8d5/o0LgqzyQ1TnJINEsrdib3xaDAm2D9INtO884p
         zneHexLXfh3u4LVBf6cgo8UJ+igFvv9ehyP+9d4hnXGdMvyce0PqGpgcz5wuv7GnPi9h
         OlAkYXX66JuieL4KfbddP294BOb0aJIoc5r1KjhCNYKaD4xFATav8QujpOljYFvjLhQn
         ziLllAvoDrtuGdX+LZdweSd/18YTxoum7Jb78NTtR4DOgb9lnlL8qzKYiWMXDRaBBVkH
         N53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257031; x=1778861831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmUxS4Q9Tzyin8+N6iP92awnxvWebVH+uapUMeaf/ko=;
        b=Smf3TwKi1B3rwYt2+D3iJVoerB8AXzouovnJu2vVSCpuKFv/4XNLRohWY31LI8MgpF
         xXkxLRHsS4fJWkFKRzVbctOUKgc3xkVdYeujYGwfnbP+RNQzP6+TM8XzmMYx7YamMxM6
         LXrA4DGY6EF7aa2EpENwQw47q1HvxSI7PwP1vA6FKrYxZMqEpIUQKAV7hx0slIbp0k/v
         GdNq4SHLNv/5jZuv2Vmkeh9xHwu89I8dAvf5K1ohMvpBol1Pp9j6enGG+bzhAmJ0UJFq
         2vmFM8Y4Mfdy+qgi7+/Nnu6j9rBh9XfJrwC9poqjuc6PpBc9UhO9Jr9/F8DLoVsf79Hd
         0rYg==
X-Forwarded-Encrypted: i=1; AFNElJ+2UpHFzCcPAtA/REh+WYq32azuQMfY/3CZpeev7+6ScFSkRUZBCUGVjYbhC74+mXJsfcE9lZn+Yc1wlDXKQEnt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6c1x6YimisAzjco1Ehq2mfP+8abBHZstDNbKPRbPDJbXjpxpX
	w576N8kCmzH/Stn0nIzphsYx/gZubPB4d8SfWzOQ3j5VjKbXZlFoCGsh
X-Gm-Gg: Acq92OF6/EeOAe8SBCj+e7h4Rav8MZXy4yptnwuWAMyXmOx6SSg60rXU/k6n/dSfb9Y
	V0Ls55K1KmL0gqgA6fmWDD7Q0sNfHtK0R0Yt9/4KCP3xPNzqdn01trb7Ggvk3IbLrPEtvsPmGn4
	O6ov2vZ4Sm2xDg0iHs6dbP8rSWRfFgTs9mr50pV9ZZN3db069BkC0e7t7ogNt8IGxITbrlvlW7S
	UvQS78k3BZ8iRK92QbTHhUXh4fmgNFRvTdMLLOVs30INgzU/wG914O+K5mkKglmJSRzS5oLxxNR
	7t0koKwokxgitPhzd6LEgPWyKp8rP6Z+Uq5h/mry9FolzJ/i101onokEosd9YPxTuco3yp6Mzwz
	OSTdsLcPsINWtMgwKaOjfdsFjvYA/tLBOr+oRwToJNe2rLPsmfneUMgJ3+3MfWgPDehoyhtZkuw
	CfkdMXBmySrw2FEl6uSmcbyy7JGFgr5Ws3HNmCujnwmfxZ4XvKfAtBlBeNLLaZ+kEqw8XYKoDmz
	5JgtrqCQoS7AuXYs6HU
X-Received: by 2002:a05:6000:4210:b0:43d:73de:abd2 with SMTP id ffacd0b85a97d-4515ce1c4demr20464240f8f.26.1778257028011;
        Fri, 08 May 2026 09:17:08 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491e94c0fsm5500124f8f.32.2026.05.08.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:07 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v2 0/3] media: sun6i-csi: Convert to active state and improve MC support
Date: Fri,  8 May 2026 19:47:18 +0330
Message-Id: <20260508161721.94285-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_091714_150469_5FC7A945 
X-CRM114-Status: GOOD (  10.93  )
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

Hi,

This series modernizes the sun6i-csi driver by aligning the bridge and
capture components with the V4L2 subdev active state API and improving
media controller integration.

The first patch migrates the bridge driver to the V4L2 subdev active
state framework. The private mbus_format field and its associated lock
are removed, with the framework-managed state becoming the single
source of truth. As part of this change, the capture driver no longer
accesses bridge-private data directly and instead resolves the active
format through the subdev pad API. Since the hardware does not perform
format conversion, identical formats are enforced on both pads.

The second patch implements vidioc_enum_framesizes for the capture
device, reporting a stepwise range of even frame sizes within the
hardware limits.

The final patch adds MC-centric format enumeration support by filtering
pixel formats based on the provided mbus code and advertises
V4L2_CAP_IO_MC to reflect the intended usage within a media graph.

Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):

  - Parallel pipeline (csi1):
    ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

  - MIPI pipeline (csi0):
    ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

---
Changes in v2:
  - Fix indentation in link validation path
  - Return pixelformat directly instead of a pointer
  - Link to v1: https://patchwork.kernel.org/project/linux-media/list/?series=1054768


Arash Golgol (3):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes
  media: sun6i-csi: capture: Support MC-centric format enumeration

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  88 ++++++++--
 3 files changed, 143 insertions(+), 108 deletions(-)

-- 
2.34.1


