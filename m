Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416DDFD4F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 20:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=; b=FQ87M4N9IwOMZP2dGDL7/KmFF2
	j8zJ9hs0SKRxUyJe5+5XR+5P3yLu5flwiJYcAgH4kZXGJDAyoFm3RNZZhrnEo5N2vbDCPfJbn+Kvh
	wRuRRbmCh7Sreopm4OH0uitZW2wFGBPDZ3dsbrDE2Wv7iPtTA+Ou/7j3NK0znXccfqz/NODnYo+0l
	I5jwqYI6jcLUH2nORxwIurjI9h3ilIIF/IiUB0SgPW1j0OSs66kEYMNFA4Lk7ysk/9tfPcwcjqeev
	Y9H8dRDDQq0rSJMCdQDNQNUqFcGFjZCfduil1vzAQjOPuPDzpz2YfCRA8nkABD7Y8QjQP9s4R6Fdv
	ECnFLzKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Ke-0000000ADWi-0GFQ;
	Tue, 10 Mar 2026 20:05:32 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Kb-0000000ADW3-0pJC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 20:05:30 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8296dabef74so6713266b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173128; x=1773777928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=cRFXi11MB1w6zAURIEDMTknvBSGVFtfciyoxq5fqYVHwDNagbnJk5H4ScIzb51ek5E
         hUFgOoOzytOyahS4v4Rk7omBhnxMmbOzQmUP/somGfd4n3SLoSWzok656qvjIZoO/sYS
         dV4+jWiy8hqGyKhqKc3lapJQ71dFmWQjXyrp/bLMhLZZCuM3XRF4NcugKHDLsEIvYGhz
         QwNA9sKtiIRhj9I9WjX0JqVkSTumAsVz8rrzsd/kfxTeOIke4RVH2AZw9gN7vfX/NGls
         qE59CGL/x7PmEXHUfJARuzotUQxg1KUEZMRzfOGDTHRzxQdpsynJnhZkGOtm01TfzSRt
         GITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173128; x=1773777928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJVrvD1HBF3SziwDh/X6OiTy3x6h8raUxjDiyEKbXMI=;
        b=BKVv+DsoqPDbqu7xg+GBME7O+8MgbUmDt5A1jnuALPSkiQGdKtk8PvGLmn83uOSVdb
         5T+8WSZB+qNC3eNRHwwaukNgUR5g1q7jzUv6LcH0RRkjlsNGUB+vIHppaiOiuAOdbetH
         Lmbr0VFB9oiMdhh7z0bKTB397JFEpjXF4aeoD6wKgzH81z5s+C+YdGHlDHHRvKVB45xC
         Kzx5rIWAYcT63EEH+gZxWQQFwt6MaOrYSgRsgx6eM62HtLqfS6cpDbRU6al9JD+DimCs
         SqFkIQDUClaHzlC5BFu0M6HYWiSFs6IRQMTaUHiNc0dAg7FdmVK4HBCTmuWFL/hIq9jN
         v41A==
X-Forwarded-Encrypted: i=1; AJvYcCUYv57bnaw7/D/Aq0kdIBmikpRiTn2aaESrfBq0yaer5vb9svhaIidZKgwfSPbcMsgDvFukXJb6WilgZVQI6SyO@lists.infradead.org
X-Gm-Message-State: AOJu0YysnD/YQ+eUzNiZBldyicfX8Pva/bN8Mo5Nen8TxBuspDcvaHYO
	byNCMIgGM8I+HZ5i9xPay9w5/RgAZR1Cr4cQBocR76HVaxh7aarMXBp1
X-Gm-Gg: ATEYQzzgxyBLoEkb0FtSgCmTJnffIJ0M/T4CjG53DDU1aLBnyG+LyGLfbtJasTv9TtB
	+juJQfADPFkgIdFDxB2gRzCcx3w15gNhMxU4TERdBchw6PD958DphsFi03GdgCfddg7nXJQMGHS
	CG59wE6ozRZm1S5ipNyvI/zVkQvBD90M4u3F6Ejpt4NaJ4h4VZ+yfThYk1FpfeKhFYI13sUDLys
	njb0l8c/QCSk9nZFk7g8kQA+9v/ehnwYC71RqsGFXSe9dPef5eTKcwQL4RG4O3hd0XQWzh8rhZ2
	3cmyQf0vK7yLAEuUlUMrRKpqKEWghDUF531YN9klG2lPmoibrKoBa90YtN9/ixaXERpgBHesyBo
	ukDBe6gtOWPBrv0gRTXyBVU8qURynlnLBjIiVdPf7AQcXZGMXYJ9W+0thkKIjqM3g1t3HltzZBL
	dXDa1Cxu0F03+y80JIVXRRNRj45zcCST60/XPdmKxNTDjdNQw9
X-Received: by 2002:a05:6a00:4fc7:b0:829:8bb4:1030 with SMTP id d2e1a72fcca58-829f7104ca1mr127969b3a.42.1773173128160;
        Tue, 10 Mar 2026 13:05:28 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:27 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 0/7] drivers: Simplify cleanup paths using __free
Date: Wed, 11 Mar 2026 01:35:06 +0530
Message-Id: <20260310200513.2162018-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130529_239604_91B6DA44 
X-CRM114-Status: UNSURE (   8.95  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Hi all,

This patch series replaces manual cleanup and explicit kfree() calls with
the __free attribute from <linux/cleanup.h>. This modernizes the memory
management style and simplifies common error paths without altering any
functional behavior.

The __free attribute provides automatic scope-based cleanup, making
resource management clearer and reducing the chances of missing cleanup
on early returns.

No functional changes are intended in this series.

Testing:
  - Compiled with W=1
  - Build-tested on i86_64

Based on:
  <linux-v7.0-rc2>

Feel free to share your valuable input in context of the cleanup API.

Thanks,
Sanjay Chitroda

Sanjay Chitroda (7):
  staging: greybus: simplify cleanup using __free
  iio: ssp_sensors: simplify cleanup using __free
  iio: st_sensors: simplify cleanup using __free
  media: mediatek: vcodec: simplify cleanup using __free
  media: chips-media: coda: simplify cleanup using __free
  media: allegro: simplify cleanup using __free
  staging: rtl8723bs: simplify cleanup using __free

 drivers/iio/common/ssp_sensors/ssp_spi.c      |  9 +-
 .../iio/common/st_sensors/st_sensors_core.c   |  7 +-
 .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
 .../platform/chips-media/coda/coda-bit.c      |  4 +-
 .../platform/chips-media/coda/coda-jpeg.c     | 39 ++++----
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  3 +-
 drivers/staging/greybus/camera.c              | 27 ++----
 drivers/staging/greybus/loopback.c            | 35 +++-----
 drivers/staging/greybus/raw.c                 |  6 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++------
 11 files changed, 78 insertions(+), 197 deletions(-)

-- 
2.34.1


