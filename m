Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF4C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 20:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S66fvrfduYGxg6YqgOx1hGk2hmZURv5PfcAAbHmP9eE=; b=uoqcpAJElEZRK6
	rHTsQe5m4yvTB6iXygYc1ScmF4xtVDkPZKdNuA0EEQDP0JOdjv0Z4h/9lsrXCxt2G7xAaqJOCAU2u
	yZKK/I8NpjIIYHRTZ+iwfJ3TA8fQWiawqGLKYUUd8uVdd+NPxIKhVZRaOlZ+0NtphZGL/Ao6hY3k9
	rW9VQbw1HSsVwUTAfRdMXpfpl9CcNiAt0hJd+Hh5dq9hnKGuSunqCYUDwkrmVzkowxUMCKMnbz6Pn
	yXe8Rfo2nJDcPAX+12h4YscBbPoXinpEFiHlv1nFnP/c0ucraDhQaLDhOoRDnxGJ4+GLOMvALNjET
	9tieUJb78Jsks4P1e3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuX8-0000000EAqW-1aEc;
	Wed, 04 Jun 2025 20:16:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuQy-0000000E9pP-2peX;
	Wed, 04 Jun 2025 20:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749067797;
	bh=TvPaiU8NbgI1edZZoqcyPZfKJS3ol0kOtDlVb7mFRpI=;
	h=From:Subject:Date:To:Cc:From;
	b=fP7+jXAV7SvFkstO+ZU4JIGTI0zv+Lu6TEnZt0VXGODsGWCI+DKTvsqQVx7SWQxeZ
	 XqcXxX3m2pdMiA+Ys6Vq03uovlShr+qrg0f3oLfGbqm80wRFCwhqKfH2nYrAXzsFQS
	 7cAAC7CrNTVEDqKvpXqtHQJhJ4k9TZQRzaS/5St9fMspaXE2fHYKVxSb5WM8SmdVns
	 6LnHqNCxgXwX9o1zmjTvPdoHAFHAH+I49Waf86z7wjdNLGOHEYb1X3S0W+kDdUSJ28
	 7FaxOp0ncA54eb40UoeW7zRtGysKsp0FtlvIlYSgvJt+qLpDJ9PQ1WXYE3Htq2x4DY
	 Z/d2BdG4vA4zw==
Received: from [192.168.13.145] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEBB317E0536;
	Wed,  4 Jun 2025 22:09:55 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v3 0/5] Add manual request completion to the MediaTek
 VCodec driver
Date: Wed, 04 Jun 2025 16:09:34 -0400
Message-Id: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6nQGgC/63O3WrDMAwF4Fcpvp6L7fwtvep7jGEURVnEUru1X
 W+j5N3nFMpg1708QtJ3biJSYIrisLuJQJkje1dC9bITOIP7IMljycIo06hKGxlpgJgY3BQYP0l
 m9COhPYG7wmIDXa4Uk0V/Oi+UyjP7xWm2MUGisoQzO5Jt1RrsplcFuhZFOgea+Pve4u295Jlj8
 uHnXirrbfrw66f4WUslGzJdB9XY9s1wRL8sMPgA+3Iptg7Z/Lm1Vs9xzeYOfU+o6kZR+99d1/U
 XIA2GWJIBAAA=
X-Change-ID: 20250312-sebastianfricke-vcodec_manual_request_completion_with_state_machine-6362c7f80a14
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_131000_905945_2CBD2547 
X-CRM114-Status: GOOD (  26.17  )
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

A new state machine for the VCodec driver ensures, that all necessary
processing steps are handled in the correct order depending on the
current step in the execution. This state machine has been added to each
request to ensure that new requests do not alter the state of still
ongoing requests.

Additionally, this series adds a small patch to avoid trying to handle a
scenario, which is not supported by the hardware and thus runs into a
timeout.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
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

 drivers/media/mc/mc-device.c                       |  30 +++++
 drivers/media/mc/mc-devnode.c                      |   5 +
 drivers/media/mc/mc-request.c                      |  44 ++++++-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |   4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  29 ++++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 146 ++++++++++++++++-----
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  21 ++-
 include/media/media-device.h                       |   9 ++
 include/media/media-devnode.h                      |   4 +
 include/media/media-request.h                      |  40 +++++-
 10 files changed, 292 insertions(+), 40 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250312-sebastianfricke-vcodec_manual_request_completion_with_state_machine-6362c7f80a14

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


