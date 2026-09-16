Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C2CC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WW23/p8j1VrlcRbF/FlA+rOMTRyOj5YVS3I8yZ6IEcE=; b=TsHGNKaUqV37QVbChAFRQtOeCm
	naeGeJd5TqLgcwo8bx/CxE7ybcpKvho/lE+xWGqRzWBUMV4OR/KPYOcYkOw/alJk0iPr5pLywKClN
	XDOFxDumjkPbXeaIIqze7K/YDYaPvteycoYKYDEl4b9fqrNCGGkGhZnRpvDrOrWcIohLa6Pv4Zp7j
	vUxeuDy5IxU1PV0K0soyo3pRLvd+Loqn4N5Kf+9YPul9PMmjd+GrkAMR3kODMLn3Pmg/TcP6vYEGe
	nv85+SBBvE6PWjlji/taysJFPT2QLw/RDuaNyUIodV7UnCdExCEJy4K8hUFnH0kekRtqQ6sKeCc5f
	PN5UxAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gOy-00000008FIn-3jSU;
	Wed, 16 Sep 2026 03:33:40 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6gOw-00000008FI8-2r2z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:33:39 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccc02279so371497a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529617; x=1790134417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WW23/p8j1VrlcRbF/FlA+rOMTRyOj5YVS3I8yZ6IEcE=;
        b=fmbyh/dj8ajhuURsopQizmRVrVt4FbKERmIPnbaHZkyfD5cYNymf41dS4MGuYFXajF
         2HxBOH5lfZ7q4fkQURzjGDGHcVlgePMT+klRFldizt3DaDAkzVzHEHlLdd1eVagW5SzA
         644gtLO3B3Fl4nCA2Lj0E8zbHgpgsZb71djW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529617; x=1790134417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW23/p8j1VrlcRbF/FlA+rOMTRyOj5YVS3I8yZ6IEcE=;
        b=EXn8bXd9m7q+MUauhrzxFZ/EMoTkAdDvkUgea9XnXwUpqNuNzjtYqi1jcZ15pcb2sO
         PtpPIfdeyscFHHuZwVQrOpXikj4Gt6SrSSbiwS08K8SvUHCtSzDD1RVDGelwOBYZGA7G
         AqUO5GGK0LaGS2jWJkCDUNP1jVJnE77A1JpQ4u+YiLcCtuxppGn9zfrF5uUvM++Mmg6G
         miWOUDvNpkOXPS4No3YBToXmePyt558+FuoDQYFDV5gtW26F3JujxdC2ZQFNL9E4mrOr
         15wtpRlfZYn9LdrZPx01zxro0CtRVNPs74GEKDxmc1PH49HYTFZysiVN5VAlEkmdqMlR
         FokQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqD9K89w0iB8xjdxd/RHBdcbXaEc7TVQ7YU48iyBDSQZRQC5NpVduDTJnRc7JBXFblSda2pYNttCdw3uualh6t@lists.infradead.org
X-Gm-Message-State: AFuF++lUTlUpNz7PZ+dt6Mh9oSxIqlf6dn9v7z5/r6FjkC+FhXKEz0Iw
	98xTS6G/P9hPn21nopZ/E0YWllp4LpIaOpoeiqmGmHoNCntw6a5YBssLF0gWBt5xCw==
X-Gm-Gg: AYBFou0+2a7VlQoS6lKRbUP+MDrGJBOhdMDEKK9rS/1X5xo53AfrOJuF6njI2Voh/No
	5u2m5lqdKySguwrF1HIheemUdSIMukvOHAnkF/DelDSmj6AhuOLU2OXlY3efhDZSAsfmv198NNF
	3l40VQb43uMTPshuHSrjon8kdubcp6JYsQUeB0LspS0ZpgtU+PLkJ2cfjI5Z0r+19lWt2LIxr0/
	GA+rv/kC8b8Vg0ZWUCL/h9RaJWtPcDUuFCBPigTSvhPlMdX0bvnu1I0XDDO50+fjmxqVbnbERN+
	bbGNU5EZSAA+u9tnkHCrblPpzFsfKw4Pk31c4Sf5mxD5hBI/mh2cs7Vk21zZS4hu14Kxk6snDli
	v4ICXC/t1X8vCYrUWoBrl2JabPhtwxcMsJK0QuU0epVggF1WOgFQPwjxhULtx6D0PWwOtezEIfo
	mmyP3IxE/dqWlZ8LZ5kEplXDuRymNIcAu4wTX9JaQayUV7ICBrvWip2ztnatn4aSv8GzvhzYhOx
	zJjPIrwf6oT8A5X3hDFds8uTS4n3aE6lxS86+sUYDPlCasgZ6kSKiGFOQ==
X-Received: by 2002:a17:90b:224b:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e1e4246f7mr2337951a91.13.1789529616959;
        Tue, 15 Sep 2026 20:33:36 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Wed, 16 Sep 2026 11:33:21 +0800
Message-ID: <20260916033327.3054126-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_203338_765725_B944A360 
X-CRM114-Status: GOOD (  16.17  )
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

This is v2 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v1:
- Add and use new drm_framebuffer_get_block_offset() helper (Thomas)


This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

While at it, also pull out the offset calculation of drm_fb_dma_get_gem_addr()
into a separate helper in drm_framebuffer.[ch], thereby separating
responsibilities.

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address. Two other drivers were also touched.


Patch 1 adds a new helper to return the byte offset into a framebuffer
for the start of the pixel block of the given pixel coordinates.

Patch 2 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 3 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 4 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 5 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper. Existing behavior, which might be
wrong, is preserved.


Please help test. The series is only compile tested on my end. The sun4i
changes should revert its behavior to before the drm_fb_dma_get_gem_addr()
was adopted. The imx/dcss changes should not have any behavioral
difference.


Thanks
ChenYu

Chen-Yu Tsai (5):
  drm: Split framebuffer pixel offset calculation from
    drm_fb_dma_get_gem_addr()
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++------------
 drivers/gpu/drm/drm_framebuffer.c      | 45 +++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 118 insertions(+), 51 deletions(-)

-- 
2.55.0.1032.g73a4cd73de-goog


