Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA1DC5B56C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jRVQTm1sZgDLvOMsxv1kNe8cnsmDEnAIJogWvzx1HJU=; b=qi5fQ6iHnUuBBJ
	/cf3XCmNEc8/RKeR8d4seyWF40rImAK9bQUC6OnrdW9vlndrcgvW+k2GvMmkbF57qFObc3m9/aDrd
	hquhMA1e0fGo9qUAC0J7u0SBbmUsR1Y5settQFQaW3UVg+UMpF4NJArTwJj7hW2E+ZdSmbY1jJ/qE
	UxvSrFTC6aG+ozvJdXqWwhkiha4fp8zH2Qgf91hJqHl5Dq9RR9h+zdJz3efaGhObBzDri7g4jZcno
	WtaXKrwDAOFSKIxVOobBbg0x5Ul/1c3mnQdhI8EvCwei3cR8Co6Z/HaimFaEjiBPtpbFxtRkjjNHd
	k2yQoJ7WTXx+en79eI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRpc-0000000CDLf-2jx0;
	Mon, 10 Aug 2026 15:22:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRpZ-0000000CDI3-2k6M;
	Mon, 10 Aug 2026 15:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786375341;
	bh=d+X5GDQs24wp15ngCdEhSn7ILQk6GDzdOiR/b9+G638=;
	h=From:Subject:Date:To:Cc:From;
	b=g33q2kkTUw1CQ9jtfB7XtxdmuB+gcw21rG43az8KL1xRzlpcV2xbOvUKGQsKcI6ab
	 TNG+UGmI+LUBGYdjtUlhd4v+mM1asjazyRESvyRawNYgrwu7Fg/tWYKaP4pogaHf6R
	 Pqp02abp1WPBTx12Y+4BTAEjJh+QluNEWs54hP7bLix823PjjB/LNRXf2JCm9DxSul
	 J0/5XOxVMUNeOrpL2vnCmq7zPGlz9oTciHoM0C66ChdznSve0woO1y4n6mJMcB1CBa
	 iHWY8bYjobMlJAieLNxaC72v3klJ60a5X16O1AhNqkzYLVCyHTtEX1PwG0+6c4aJnP
	 Xt1HmRNGhu6Cw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7669517E0749;
	Mon, 10 Aug 2026 17:22:19 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/5] media: rkvdec: Enable multi-core support
Date: Mon, 10 Aug 2026 11:22:10 -0400
Message-Id: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02O3w6CIBSHX8Wd69jgoIi+SusC4WhUpgG6tta7R
 9lWl9/2+/M9IFLwFKEtHhBo9dFP1wy4K8AezXUg5l1mQI6Kl1yzcF4dWTYul+TtFIg1WkvhTCV
 4jZBrc6De3z+T+8PGcelOZNN755sIdFvyV9pi0JlIzE7j6FNbKFNXJF3ZqxJ11/BeNlpWJQoka
 ZC4qFFXwin4d8zKb0PFkcV5YWEw8qdoSFttTc8FNe0q4PB8vgClQzzM+QAAAA==
X-Change-ID: 20260408-rkvdec-multicore-98831da51072
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082225_863554_B1888CF6 
X-CRM114-Status: GOOD (  16.41  )
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

Since the driver is used for decoding on rk3588 and that the SoC has
2 identical decoding cores, enable support for it.

Instead of exposing 2 v4l2 devices to userspace, the driver will only
expose one and handle the 2 cores transparently.

The 2 cores are able to work in parallel, but only contexts are
parallelized: 1 stream, that uses 1 context, will only be able to use
1 core as it usually needs previous frames already decoded to use as
reference frames.
To avoid complex scheduling, only different streams can use cores at the
same time.

The implementation is based on Sven Püschel's RGA multi-core support[1]
(and this patch set depends on it).
It uses the maximum parallel jobs implementation in v4l2-core and also
uses the same components mechanism to handle core probing.

A fix for the RCB (Row and Cols Buffer) size computation is also provided
as it was causing issues with some fluster tests.

The v4l2 commit is not signed as it should be part of Sven's patch set
v2.

Performance-wise, fluster doesn't seem to run much faster, but I tested
with an HEVC test video from Jellyfin and observed that frames start
dropping with 6 concurrent gstreamer instances, instead of 4 without
multi-core enabled.

[1]: https://lore.kernel.org/all/20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de/

Changes in v2:
 - Remove job_finish/buf_done dance and use Sven's max parallel
   implementation instead.
 - Rework history to have a working driver at each commit.
 - Remove the 2 cores limitation, any number of cores can be used now.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (5):
      media: rkvdec: Keep RCB to the correct size
      media: rkvdec: Remove unused need_reset
      v4l2: export v4l2_m2m_set_max_parallel_jobs
      media: rkvdec: Split into core and master platform drivers
      media: rkvdec: Add multicore support

 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  17 +-
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  16 +-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  77 ++-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |   8 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  26 +-
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  27 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 625 +++++++++++++++------
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  31 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   1 +
 12 files changed, 596 insertions(+), 304 deletions(-)
---
base-commit: 6a75e3d4f6428b90f398354212e3a2e0172851d6
change-id: 20260408-rkvdec-multicore-98831da51072
prerequisite-change-id: 20260602-spu-rga3multicore-ae8c8caf01e9:v1
prerequisite-patch-id: 57496def46f4b8bf13d70a6f73dd9005b59d9ede
prerequisite-patch-id: e89e8a899373aaaa8cd1242d30f86a957b4d7e27
prerequisite-patch-id: d1f2bfc2a3ca3aef12a9678fe15bb93f346caf95
prerequisite-patch-id: f46ff26bb00afaf45122256d30f68464589d9943
prerequisite-patch-id: cd802c9f5c1106d08738f92a0a7c3d74fe2c89c1
prerequisite-patch-id: 1ec6b5db4df41bbe96f4ab8e83feeff1392a622f
prerequisite-patch-id: cb6a14d144c4efa77ad6396b005fa1f97d3a834e
prerequisite-patch-id: f8d48c1836f2287305d93af37a8c2fdb13c8a1d9
prerequisite-patch-id: 125ab4c4cc472f7a47f1ef41182d751b17056bf4
prerequisite-patch-id: eec4c1acdf5754b2faae9c8b18b93b8fb6b3aea3
prerequisite-patch-id: 4b4d935e09abc95aeb7e8aedffd3eb179b36d5a0
prerequisite-patch-id: 01df8a8e2a7d25a098483c03b18b6da425f63361
prerequisite-patch-id: 9a9071eca6bce3f693580756d5077d4bc8968a95
prerequisite-patch-id: e3f5d215b7207701cb331e720aada3fe504a0f8b
prerequisite-patch-id: ec44f51ffb6beb8c2b7854debc1b0b8be127d30a
prerequisite-patch-id: 14dad2504e1293cd4c5dc215ae99b2c6fc5e5877
prerequisite-patch-id: 10c6c977c0f71400931941b42da73adcaf63e810

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


