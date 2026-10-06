Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27DCCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZXccH/uLNX7ZgrQRFa+ieo0ROVdM0e/r75c6TtCZDII=; b=hp9XtBM91nW7m3jY5pUGTuR+8z
	Y7pyQFHdZgk3oEN8M2hpjOjDpgcg/rXdQVRfSRPFXVWMAHWL0siNYUq/l4edinjJSuC1nV3KhRDoz
	xFPnf44mymJtZTq8+ZSHZHdoSC1zzgYEQNuAVKiWRWH/S0s8uyuJIw4DsR9RvueIqdLxc9YJSdCHc
	4Ijv1cSu8qQsEuj+VJ3cZ6zcHCtlBsV9GunES7oDw/RgWYJdmCDqzHo+HmWOGoRp+UIadbqbwa/Bv
	c9GR++w52Bj1nWvwU8GtYoEzg784SUJevLIL25BRUrzlIBXMLRZs1eQlHNCTVY8rF/vAH8ghzQJ29
	0N2vDjtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvJv-0000000HWnc-1DWN;
	Tue, 06 Oct 2026 02:54:23 +0000
Received: from mail.haxxors.com ([85.14.200.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvJt-0000000HWmg-2TTH;
	Tue, 06 Oct 2026 02:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=buechner.me; s=mail;
	t=1791255259; bh=tTOUIlrN6RXi5iGSd9bnj5mNskIjB/wDmRMr+3djGVk=;
	h=From:To:Cc:Subject:Date:From;
	b=suSJjezqeXNCIBcgKZ0GGsLcYFyre/yi20ddEgorXFaffQAAETVqUQUkYZsikL6GM
	 qwtTxFMKaQNVGpFQtONNLaDA06NoGaWYFX4dDGEyrpfMHJ+9xogdQ7FbzeU6rMJmJc
	 9EszNO8S5fR3IHJ7KHwMK0lnOyk1tVd3V0aHkukE=
Received: from localhost (localhost [127.0.0.1])
	by mail.haxxors.com (Postfix) with ESMTP id 5058C530C0;
	Tue, 06 Oct 2026 04:54:19 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mail.haxxors.com
Received: from mail.haxxors.com ([127.0.0.1])
 by localhost (mail.haxxors.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XP-CvpgDBQc0; Tue,  6 Oct 2026 04:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=buechner.me; s=mail;
	t=1791255257; bh=tTOUIlrN6RXi5iGSd9bnj5mNskIjB/wDmRMr+3djGVk=;
	h=From:To:Cc:Subject:Date:From;
	b=XUSX/tNNPDs2rJdDKK7kz4edg5Yx6lMF5KIWCKtEVFjg+UaXry4sWIKZisBvj7FWk
	 0WlgjkpLxHATmtLc1r/RIE5LCMRuKFwff4YPechiAWrlQ/QDJENkoihi2V9AU0epnK
	 UKG+yeOirEA8Rc927TSN+gh/uUFtRlPQDgh8xs4o=
Received: from esports.myloc.de (p200300ee8f09a300264bfefffe4ffb4b.dip0.t-ipconnect.de [IPv6:2003:ee:8f09:a300:264b:feff:fe4f:fb4b])
	(Authenticated sender: nils@buechner.me)
	by mail.haxxors.com (Postfix) with ESMTPSA id 7F9AC530B9;
	Tue, 06 Oct 2026 04:54:17 +0200 (CEST)
From: =?UTF-8?q?Nils=20B=C3=BCchner?= <nils@buechner.me>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Nils=20B=C3=BCchner?= <nils@buechner.me>
Subject: [PATCH 0/2] mediatek: Make SVS work on MT8183
Date: Tue,  6 Oct 2026 04:54:08 +0200
Message-ID: <20261006025410.506443-1-nils@buechner.me>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_195421_767209_E2BDBFCF 
X-CRM114-Status: GOOD (  12.06  )
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

On MT8183 mtk-svs does not probe with mainline, so the SoC never gets
its calibrated voltages and runs at the default OPP voltages. Two
independent problems stand in the way:

1. auxadc_thermal registers only thermal zone 0 (the hottest sensor),
   while mtk-svs looks up the "gpu-thermal" zone that the MT8183
   devicetree describes:

     SVSB_GPU: cannot get "gpu-thermal" thermal zone
     mtk-svs 1100bc00.svs: error -ENODEV: svs bank resource setup fail

   Patch 1 registers every sensor that has a devicetree zone.

2. With that zone available, init01 requires each bank's buck to read
   back vboot immediately after the bank was moved to its vboot OPP.
   The GPU buck follows devfreq, which has not acted yet when the GPU
   is idle, so the whole probe fails with -EPERM:

     SVSB_GPU: buck voltage: 700000uV, expected vboot: 800000uV
     mtk-svs 1100bc00.svs: error -EPERM: svs start fail

   Patch 2 polls for up to 500ms and, failing that, skips only the
   affected bank instead of all of them.

With both applied, all four banks (CPU little, CPU big, CCI, GPU)
calibrate at boot on an Acer Chromebook Spin 311 (juniper), e.g. CPU
little at 1.99 GHz goes from 1050 to 1000 mV and the GPU runs 800 MHz at
775 mV, stable under sustained full load.

Testing: runtime-tested on the device with a 7.0-based kernel (the
hardware is not set up to boot mainline); build-tested on mainline with
W=1. Only MT8183 was available for testing.

The patches touch different subsystems (thermal, MediaTek SoC) and do
not depend on each other to build; patch 2 only matters on MT8183 once
patch 1 provides the zone.

Both patches were developed with an AI coding assistant while debugging
on the hardware (see the Assisted-by tags); I reviewed and tested them.

Nils Büchner (2):
  thermal/drivers/mediatek/auxadc: Register per-sensor thermal zones
  soc: mediatek: mtk-svs: Don't fail init01 on a bank whose buck is not
    at vboot yet

 drivers/soc/mediatek/mtk-svs.c            | 34 ++++++++--
 drivers/thermal/mediatek/auxadc_thermal.c | 80 ++++++++++++++++++++++-
 2 files changed, 106 insertions(+), 8 deletions(-)

-- 
2.53.0


