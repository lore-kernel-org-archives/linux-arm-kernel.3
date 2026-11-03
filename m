Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F965606C5BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EmzBtIo9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Su5YfHlkFKwF5IMTLoK4Wp+REOU33DRF84x4yOhnrOs=; b=EmzBtIo98T43FxbkWRCFn7Th/P
	gd+nDUoUcC8oZOw6hs7LwXHH8NS1ACoWTMcmbORx31ZSwCm1zerAykvR/eU/tfFfH59ahRzRbFubL
	9MIftwmRk9RDHCKYOFVCl/263vbehFGmW299b/Y/+qy92qPDAkaEbMqffTcYUkE2S4CWHcdf13ANp
	ImAaPMChJwesenyEkEfTke3TTX29qCsLbX4Mq5dtMxYOZwbXBWNCQMIUb0PUhwjnUTS78RZNmF8ac
	gBrSf9TZzj4D5+YZ4e0F/Cvu2yxiSpJvuetZNwuejTfA60HOHj7SwFguRmie+7kpEB5o7oMia4Qvf
	VkfJw0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1I-000000023xC-1CLW;
	Tue, 03 Nov 2026 10:45:36 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1E-000000023v3-0Ita;
	Tue, 03 Nov 2026 10:45:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC11-0000000031e-18mG;
	Tue, 03 Nov 2026 10:45:19 +0000
Date: Tue, 3 Nov 2026 10:45:12 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] media: rockchip: rkcif: recover from a lost MIPI line
Message-ID: <cover.1793702189.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_024532_114934_65F09659 
X-CRM114-Status: GOOD (  12.60  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VICAP MIPI DMA ends a frame after the configured number of lines
and the sensor frame start does not reset that count. A line dropped on
the CSI-2 link therefore leaves every later buffer composed of the tail
of one frame and the head of the next, with the Bayer phase flipped
when the offset is odd, until the capture is restarted. This was seen
on an RV1126 (same VICAP MIPI block as the RK3568) with an IMX415 after
a night of streaming, and it can be provoked at will by shortening the
D-PHY settle time for a second.

The series makes the capture notice the slip and recover, and makes
the two blocks involved report what they see:

- patch 1 masks the MIPI interrupt sources that come out of reset
  enabled, which otherwise keep the line asserted until the kernel
  disables the interrupt;
- patch 2 replaces the subdev state mutex taken on the stop path, which
  the interrupt handler calls, with a spinlock around the shared
  interrupt registers;
- patch 3 enables and counts the VICAP error interrupts in debugfs;
- patch 4 reads the line counter at every frame start and restarts the
  stream through the existing stop and start paths once two frames in
  a row show an offset, as the runtime suspend in between is what
  resets the counter;
- patch 5 programs the DMA write priority the vendor driver uses;
- patch 6 lets the Synopsys CSI-2 receiver request its err1 and err2
  interrupts and count the error classes in debugfs.

Tested on an RV1126 board (vendor DT, rkcif and dw-mipi-csi2rx with
local RV1126 compatibles) with the fault injection described in patch
4; the RK3568 and RK3588 register layouts for the error bits and the
line counter come from the vendor kernel and are untested here.

Daniel Golle (6):
  media: rockchip: rkcif: mask MIPI interrupts when powered
  media: rockchip: rkcif: fix the MIPI stop path locking
  media: rockchip: rkcif: count the MIPI capture errors
  media: rockchip: rkcif: restart the MIPI DMA when it slips
  media: rockchip: rkcif: raise the MIPI DMA write priority
  media: synopsys: csi2rx: handle the error interrupts

 .../rockchip/rkcif/rkcif-capture-mipi.c       | 210 ++++++++++++++++--
 .../rockchip/rkcif/rkcif-capture-mipi.h       |   2 +
 .../platform/rockchip/rkcif/rkcif-common.h    |  23 ++
 .../media/platform/rockchip/rkcif/rkcif-dev.c |   8 +
 .../platform/rockchip/rkcif/rkcif-regs.h      |   2 +
 .../platform/rockchip/rkcif/rkcif-stream.c    |  64 ++++++
 .../platform/rockchip/rkcif/rkcif-stream.h    |   2 +
 .../media/platform/synopsys/dw-mipi-csi2rx.c  | 125 ++++++++++-
 8 files changed, 409 insertions(+), 27 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0

