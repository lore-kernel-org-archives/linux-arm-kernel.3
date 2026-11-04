Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FC1606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y1R06ddb;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=WNCEd79F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=79WIwLXbu2bjW8swwHRNP797G/u9xL70aEW++x9HO6E=; b=y1R06ddbtb47/IYHEYwiXzKJZB
	2NypPUXgG8ltIjL2QoWi317yV3VdG+C8BWeS+sT22QU4Aqqg3/+5umxGlKQ98zXPmblYFS3pCzbVh
	Z0Ne6Doi+NiQf9k8tpNiLeBftnHWzkHyvXFrqxe/RiyOATAE4xpCK1x6GoXboJYCbTr8aBaQHhmIO
	K8KJ/sC1wI5YBzgkzHZTfAB+aazA+NiVkzj+LGDicsnSXde3WzbEkaG+1j7xN/1AWGo4aDC9nCKn9
	V8hAEzSZXyPKfx4JtttB6a5Q/7VhHMnuKIbEVsXQPYQqRZyqmg1OITrCkR0zT0zDJkRpz22UWDbb+
	l0KcuwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa6Z-00000005JSx-2eBJ;
	Wed, 04 Nov 2026 12:28:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOa6W-00000005JQy-3bqy;
	Wed, 04 Nov 2026 12:28:38 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2709C23;
	Wed,  4 Nov 2026 13:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793795175;
	bh=6Wl2UyK1kpAgNBRQWfzDtffs0FWm6Qx1dRsbvMGwqMQ=;
	h=From:Subject:Date:To:Cc:From;
	b=WNCEd79FZOXh2wzkiPMaZlqjD6A/FWINGb6RjWV0FFhffMHLrSR5PZpp7d241trAr
	 mB64VolGy2BzieiZvFxF7d+2kpK/vcQRgRNzN5DvnPolEGKNBaA5yGjtBtbY9MFU5G
	 CQVeOihAPSo++uOYT/P73bCRB1LjdrQXf4kpaxkU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/7] Introduce v4l2-isp reset buffers
Date: Wed, 04 Nov 2026 12:28:15 +0000
Message-Id: <20261104-v4l2-isp-resume-v1-0-06aeb8cf2940@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8k62oC/02OwW6DMBBEfwXtuSt5bQcv/ErFweB1Y6UQYgdUK
 eLfY5UeepjDG2lG7wVFcpICffOCLHsq6b5UoI8GpqtfvgRTqAxa6ZaUUbjbb42prJilbLOgpei
 DMxSiZqirNUtMP7+Pn8PJWR5bPX6eJYy+CE73eU7PvlGKHEvwRl28MToapZk12y5GZ5wNltpuF
 B7hv1DfnDqaMd+qC2HZyipLQF/zJ+aCjYbZd76lficYjuMNhq37D+4AAAA=
X-Change-ID: 20261030-v4l2-isp-resume-41fad731df28
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5075;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=6Wl2UyK1kpAgNBRQWfzDtffs0FWm6Qx1dRsbvMGwqMQ=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6yTo6kKqzSXFZnZJXTbEM5149OvDhfaa+HgPw
 VcjjWnX7g6JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCausk6AAKCRDISVd6bEV1
 Mu3jEACdY3cNuGBqaEpvZKTXz/9399gnvZNi2yJsxS+zWUpLc+VWQI1OMEll+oSPH9am7qGb1NA
 U6feBpua4YQQ3km1sN7Th2NE4fey7jIKtslx/dZq9QfoUJjmf60M0XLhGxa+T+6chcQD1Umqup3
 9joQcylsjc4TSwkY/qjpdU8SDZ6m+FVYADjHQMt7HGW2JpTLAhfdi3gqpZoVUottJnuVbOLraNl
 BSCG6v+YNDLTNTJxyCVOjsuJbu3Q9h1gJpiqBfd+/kprio2vpEX9jlMrnSyAx5MBtpf935hSvTZ
 h6PGO2QSjQkrZ1olrKYn0OSFsGKledzZ1RIhUb1OTYqrAbYYZWcfiRfiNf6C1TsspW6NdUCuwx8
 /wUx+PfWNOv2Bl3j3pB2oyPkYQuXX0wzMcdoyhrS6SvG2OUmJO0093JIAH1sdWcHUHpf3CZ0HQq
 KVJvHkLnOlXzVExhaU34AAJZuaXJ5skiazQ+pnF1iYyyBGbN05Uvnw13Ik5vZa6nu1yixLDJAwS
 jfHyhHTBsDp1tWGP0othUvE09wSfmWRsBoCnJEPmafC00mIALD/KDj/LAQm4ygGU5w/xgOKJ08J
 fJSmpIpBZUje6sb5Egfqptes2f9bglwls9GHzbbgslKolmawOT8Cz6Kxatl4/vDwW2I2NUaZvAp
 SakmlulYQGRQOtQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_042837_061254_3ABC0AC1 
X-CRM114-Status: GOOD (  21.92  )
X-Spam-Score: -2.0 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TRACKER_ID,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The V4L2 generic ISP parameters buffers described in
Documentation/driver-api/media/v4l2-isp.rst has a problem in that if
a driver using the parameters format is running a stream and the
device is suspended to RAM and later resumed, userspace will not tend
to reconfigure it with _all_ of the possible parameter blocks. The
format allows only a subset to be populated into the buffer queued to
the driver and this is the common practice in libcamera. The effect
will be that a resumed device will have lost any configuration that
tends to be sent only a single time at the start of a stream, for
example lens shading table settings.

This series performs some preliminary cleanup and then adds the "reset
buffer" concept to v4l2-isp. This is a mechanism through which user
space can flag a struct v4l2_isp_block_header.flags as needing to be
reapplied on device reset, such that the v4l2-isp framework will store
that block into a buffer allocated for the purpose when it validates
the block. 

The last patch in the series updates the rkisp1 driver to use the
v4l2-isp reset buffer to reapply that saved configuration on resume.

An alternative approach might simply be to store the "last seen" copy
of any block in the reset buffer - this would be a simple change.
That implies a lot more processing on the majority of frames, as we'll
then always copy at least something, but it reduces the risk of losing
a setting. That amount of processing each frame seems very undesirable
to me though, particularly given the scene will presumably have changed
after resume and so the settings like AWB gains that are applied for
most frames are probably out of date anyway. On the other hand we may
end up flagging a lot of blocks, as there's parameters that might be
changed mid-stream (like gamma) but would not be so regularly changed
that we could just rely on them being sent naturally on resume, so a
third approach might be to invert the meaning of the flag and store
any block that _isn't_ flagged as _not_ needing to be reapplied.

I'm open to opinions on how best to set the balance!

Please note that the changes for the C3 and Dreamchip are only compile
tested.

Thanks
Dan

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Daniel Scally (7):
      media: rppx1: Drop max_size param from rppx1_params()
      media: v4l2-isp: Hold v4l2-isp data in central struct
      media: v4l2-isp: Update users to initialise and validate new struct
      media: v4l2-isp: Use centrally-held data in framework
      media: v4l2-isp: Add v4l2_isp_params_for_each_block()
      media: v4l2-isp: Introduce "reset buffer" concept
      media: rkisp1: Re-apply v4l2-isp reset buffer on resume

 Documentation/userspace-api/media/v4l/v4l2-isp.rst |  19 ++++
 .../media/platform/amlogic/c3/isp/c3-isp-common.h  |   2 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  28 +++--
 .../media/platform/arm/mali-c55/mali-c55-common.h  |   1 +
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  28 ++---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |  30 +++--
 drivers/media/platform/dreamchip/rppx1/rppx1.c     |   8 ++
 drivers/media/platform/dreamchip/rppx1/rppx1.h     |   5 +
 drivers/media/platform/renesas/rcar-isp/core-io.c  |   3 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   3 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  61 ++++++----
 drivers/media/v4l2-core/v4l2-isp.c                 | 126 +++++++++++++++++++--
 include/media/rppx1.h                              |   2 +-
 include/media/v4l2-isp.h                           | 109 ++++++++++++++----
 include/uapi/linux/media/v4l2-isp.h                |   1 +
 15 files changed, 331 insertions(+), 95 deletions(-)
---
base-commit: 00178eda305a332f302882849ff7374d4169be8b
change-id: 20261030-v4l2-isp-resume-41fad731df28
prerequisite-change-id: 20261028-rkisp1-suspend-and-resume-7d4f388a9a61:v1
prerequisite-patch-id: 8f6b499ef7898229c5b02e987822dd676a0cfd74
prerequisite-patch-id: 56d0852983c6f46537c03ca3bec71e0ce4046431
prerequisite-patch-id: 0b9edd21d24a25c620792dfa692d91346ceccdde
prerequisite-patch-id: 3b9425028cd62b60b3dc3dbd2fc3b5a8912a1fb4
prerequisite-patch-id: 771f986e2754383e7b5a920b25bf1609dc96f0b4
prerequisite-patch-id: 79c95d6375d662a4f75cccd8650b3fab05e4e66c
prerequisite-patch-id: e2ff2463db4934e707afbf0a239270d26dbf8189
prerequisite-patch-id: 5a923b7606f7cc60fd6b75be2d73231470043bcb
prerequisite-patch-id: fb80748a1a24316cdd77481b60936f716fd0aa71
prerequisite-patch-id: 1450f7d1f4b1a41e7ce65ea6d2fbd450d3a198ad
prerequisite-patch-id: d1d2ba9927536b110f7fbc0c68698d08afb74c27
prerequisite-patch-id: c2ae6f91cb9662307f90070523945ee03a79c4c3
prerequisite-patch-id: 87b425bde44fe889367a93302629dc011a3ec88a
prerequisite-patch-id: 25e4c9ee767dc61406adcf1e1463796a79832795
prerequisite-patch-id: 82388f762700dbcf39fdc43e6ba56c1feb55733a
prerequisite-patch-id: a4ad2fb2c7f8659c6d9bdcd9718a7ee69f124838

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


