Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32448E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YUMYQOIXLWXZ0xu21z8a2F/DBC+sSJEk31/h6id2njo=; b=ICqGYUDtOA6L5Z
	Yx8BD8sXXIDRh0rPlGgP5GgAZDE9ItLwVLq8FslFaBpi6eX8FgOUC1OP6FfqHxgTAR8Mm53XWkCxp
	HLqTixdT8iLqBcJzW/A0qO0/ONj/kiexLq1yqCMEBfwdYF5PRT7wGS2AbiFlIvOE5uBAvTJzHieWc
	ePyvnyjdxsyW7un32/tOsAyvfMLv2cjrT38YCACKLkYQFGyHb3yXTm247vOblVN+yZnVegGUUEJmH
	aXgFZXNfjmzbcSQBUspyAmK+zcRVLhFDeSZj5yC81KDfFYHzqBHO29Ok++r4MD7sHCsib1fg8LZdw
	sBXQB8PiF2TWAIc3SotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh8X-00000008e4C-2od2;
	Mon, 09 Dec 2024 17:01:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh7S-00000008dZL-2xYD;
	Mon, 09 Dec 2024 17:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733763623;
	bh=ysn17uQxkXzPtLZxnOMKYQsJkVa5vH4rdmQv56kQ19U=;
	h=From:Subject:Date:To:Cc:From;
	b=bHOtKjS1103e+9ea300h6Mz17GGWJIWxh41GOfvGOiUUrJ6ghWqieWRAU/xZXPP74
	 DQ/V9z5EC2TUMDPKe9qLaCKTj04sK4F8gGEPgAAEigp0+aMtMGaQpEUPYW1NRhSpTl
	 VtfLSj/k/tZqkldi+PH3AUbGwaTEiXxhpPoV8FvuFPTvps/q5MI5J97Ndjiqyx5yUM
	 r01L6rhobmsLN9olbYcG92sMeXkb+szabyxGDekAkmeBfGrRI5PfifXXfXZXwos3Lo
	 5e6mJlOk3FW/eAoygr9t/+jlEK0v7EYci1d8dsAKr2BgWK56GwzTJsipO2XQe3vZo3
	 failmmYZYK5+A==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A62317E37BF;
	Mon,  9 Dec 2024 18:00:19 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 0/5] thermal/drivers/mediatek/lvts: Fixes for suspend
 and IRQ storm, and cleanups
Date: Mon, 09 Dec 2024 14:00:01 -0300
Message-Id: <20241209-mt8192-lvts-filtered-suspend-fix-v2-0-5b046a99baa9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABEiV2cC/4WNQQ6CMBAAv0J6dk27gEFP/sNwKMsqTQolbW00p
 H+3knj2OHOY2URgbziIS7UJz8kE45YCeKgETXp5MJixsECJjVKoYI6dOiPYFAPcjY3seYTwDCs
 vYxEv0K2skXTHxIMomdVz0fvi1heeTIjOv/djUl/7i7f/40mBhAa5JtliRye6krNWD87rI7lZ9
 DnnD8dyvrHUAAAA
X-Change-ID: 20241121-mt8192-lvts-filtered-suspend-fix-a5032ca8eceb
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_090026_894560_4C5A9FF2 
X-CRM114-Status: GOOD (  12.90  )
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

Patches 1 and 2 of this series fix the issue reported by Hsin-Te Yuan
[1] where MT8192-based Chromebooks are not able to suspend/resume 10
times in a row. Either one of those patches on its own is enough to fix
the issue, but I believe both are desirable, so I've included them both
here.

Patches 3-5 fix unrelated issues that I've noticed while debugging.
Patch 3 fixes IRQ storms when the temperature sensors drop to 20
Celsius. Patches 4 and 5 are cleanups to prevent future issues.

To test this series, I've run 'rtcwake -m mem -d 60' 10 times in a row
on a MT8192-Asurada-Spherion-rev3 Chromebook and checked that the wakeup
happened 60 seconds later (+-5 seconds). I've repeated that test on 10
separate runs. Not once did the chromebook wake up early with the series
applied.

I've also checked that during those runs, the LVTS interrupt didn't
trigger even once, while before the series it would trigger a few times
per run, generally during boot or resume.

Finally, as a sanity check I've verified that the interrupts still work
by lowering the thermal trip point to 45 Celsius and running 'stress -c
8'. Indeed they still do, and the temperature showed by the
thermal_temperature ftrace event matched the expected value.

[1] https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chromium.org/

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Renamed bitmasks for interrupt enable (added "INTEN" to the name)
- Made read-only arrays static const
- Changed sensor_filt_bitmap array from u32 to u8 to save memory
- Rebased on next-20241209
- Link to v1: https://lore.kernel.org/r/20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com

---
Nícolas F. R. A. Prado (5):
      thermal/drivers/mediatek/lvts: Disable monitor mode during suspend
      thermal/drivers/mediatek/lvts: Disable Stage 3 thermal threshold
      thermal/drivers/mediatek/lvts: Disable low offset IRQ for minimum threshold
      thermal/drivers/mediatek/lvts: Start sensor interrupts disabled
      thermal/drivers/mediatek/lvts: Only update IRQ enable for valid sensors

 drivers/thermal/mediatek/lvts_thermal.c | 103 ++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 31 deletions(-)
---
base-commit: d1486dca38afd08ca279ae94eb3a397f10737824
change-id: 20241121-mt8192-lvts-filtered-suspend-fix-a5032ca8eceb

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


