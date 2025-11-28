Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006DED116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 19:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vwZGYJXOmXhcchgRhml2ZzxT/w5W3laWseUX5cEJJYQ=; b=yXj2OD//rb3aMQ
	6WVl7+ohnoiRc1JclUXIH/cJvc88AfkxPndFfUPhkkgKSyxn9btQ1Fggab4HkjDqfzqWu+7OTsz6x
	Gh4xhSUpI7FfFtzgVqg3muUlkbV+o4k5DHMgWWnFkk0VS0pDyNbIUw2jjSfm/WgFe+9aHMpK7oroz
	Amhg9IeRWuja+LExdflZSefynyRgk7zjPOnOdrh+55H1IckL9PwHJenWIyHpKS40r8OeYGyKXWQmS
	8JArNG/HkWroXBPtIIhJw4KImNJukJYFCtu1ghYnZI/rEh6DsIG+osuLQ6L9khvdyZH9thPOrqQcK
	q6OFiHFpEORmnFZdrZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3xm-00000000otU-144k;
	Fri, 28 Nov 2025 19:17:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3xi-00000000orY-3PGa;
	Fri, 28 Nov 2025 19:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764357413;
	bh=AY05pPPYRyIkwHY2jYjGyXB2V1r/E/eXdhrGvfk1BG4=;
	h=From:Subject:Date:To:Cc:From;
	b=B0mXFOiOkXV9DEzAy0vWd31+aQGp54mnkgUvqHZNK9nDQUVDJ5DUH6XGPnP4pg+x3
	 +OWG+TohHiPhZi/ScTQBXYhl6pfGBKx0R721ffngHPfd4scNnQPe7WUwokbEGj3yiA
	 tlvxw7zDd913jIv/AEYRIbXksCpesh1Z7zKYhqW3uSD5H8Ka/ITHpP4Q5EImWuD4tQ
	 KIqgN2aKx/w9ImuEW3zZydjxiXSMeUCdQdF4B0tV8GD3gEhuef3h+ViJ5hWceduPv2
	 y3pK0lR0aB/DZ172BqSAR77o0rWJkvkDRSrdTalDrwmdbzyjZkclPDQiyovjhHgfrY
	 S/sKITOn8Dxrw==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:17:7b4b::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70A3417E0EDB;
	Fri, 28 Nov 2025 20:16:51 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v4 0/5] Add manual request completion to the MediaTek
 VCodec driver
Date: Fri, 28 Nov 2025 14:16:11 -0500
Message-Id: <20251128-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v4-0-c166bdd4625c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPv0KWkC/63P207EIBAG4FfZcC2GU6nsle9hDOEwtcQurMCiZ
 tN3l25iNjFe9vInM3z/XFGBHKCg4+GKMrRQQoo9iIcDcrOJb4CD7xkxwgbCKcMFrCk1mDjl4N4
 BN5c8OH0y8WIWneHjAqVql07nBWr/TH+GOutSTYU+5OYQAUsumRunJ2KoQF06Z5jC163Fy2vPc
 yg15e9bqUa3119f7OI3igkegI2j4V6qwT67tCzGpmwe+ybaOjR2dwUl+7hsc61S4IgYCMj/XH5
 3JdnpXt5dSbi3YhTKK/LXXdf1Bye6daMKAgAA
X-Change-ID: 20250312-sebastianfricke-vcodec_manual_request_completion_with_state_machine-6362c7f80a14
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_111659_162867_230F9F9E 
X-CRM114-Status: GOOD (  23.65  )
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

This set introduces the manual request completion API by the author Hans
Verkuil and implements it within the MediaTek VCodec driver.

Why is this needed?

The VCodec driver supports a hardware containing two separate cores, the
CORE and the LAT, these are working in a serial manner without this
series. This series solves two issues, the first being that the current
code runs into a problem, that occurs when the last request object is
unbound from the request, before the v4l2_ctrl_request_complete function
is called, causing an implicit transition to the COMPLETE state.
This issues has been found in applications which didn't attach the
controls for the very first request (which is supposed to enable the
driver to sniff out the correct formats, etc.).
The second issue is that the VCodec driver can not utilize the full
performance of both cores, when the LAT core has to wait for the CORE
core to finishing processing the decode. Thus by enabling the LAT core
to process the next bitstream, right after processing the last we can
increase the performance of the driver.
With the manual request completion API, we can separate the
completion of the request objects of a request and from the completion
of the request itself, which allows to send a new bitstream after the
LAT core has processed the previous and while the CORE core decodes the
previous bitstream, so both cores can work in a parallel manner, but
while keeping the request alive during both steps.

The request in VCodec have been extended with a kref that allows to
properly delay the completion of the request. This kref was necessary
to handle the re-entrant callbacks that occurs when the core worker
finishes the work before the lat worker function finishes.

Additionally, this series adds a small patch to avoid trying to handle a
scenario, which is not supported by the hardware and thus runs into a
timeout.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes in v4:
- Patch 1&3: Applied the review comments, but ignored the media ref work
- Patch 4: Rewrote the delayed completion around a kref
- Link to v3: https://lore.kernel.org/r/20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com

Changes in v3:
- Patch 1: Applied suggested documentation fixes to the manual completion API
- Patch 4: Moved MTK VCODEC request helper into the decoder driver
- Patch 4: Matched MTK driver namespaces
- Patch 4: Set MTK request to CORE_DONE state if LAT failed
- Patch 4: Dropped Angelo's Rb, its better to review again
- Link to v2: https://lore.kernel.org/r/20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com

Changes in v2:
- The implementation patch for V1 was using an outdated version of the
  "media: vcodec: Implement manual request completion" patch, update it
  to the most recent one which doesn't use the state machine globally
  but instead per request, thus having no conflicts between multiple
  concurrent threads
- The kernel test robot found an issue because a function which I only
  use locally was defined without the static keyword
- Link to v1: https://lore.kernel.org/r/20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com

---
Hans Verkuil (3):
      media: mc: add manual request completion
      media: vicodec: add support for manual completion
      media: mc: add debugfs node to keep track of requests

Nicolas Dufresne (1):
      media: mtk-vcodec: Don't try to decode 422/444 VP9

Sebastian Fricke (1):
      media: vcodec: Implement manual request completion

 drivers/media/mc/mc-device.c                       |  30 ++++++
 drivers/media/mc/mc-devnode.c                      |   5 +
 drivers/media/mc/mc-request.c                      |  47 ++++++++-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |   4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  17 +++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 115 +++++++++++++++------
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  21 +++-
 include/media/media-device.h                       |   9 ++
 include/media/media-devnode.h                      |   4 +
 include/media/media-request.h                      |  40 ++++++-
 10 files changed, 251 insertions(+), 41 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20250312-sebastianfricke-vcodec_manual_request_completion_with_state_machine-6362c7f80a14

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


