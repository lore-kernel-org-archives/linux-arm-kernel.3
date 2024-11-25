Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AC0D59D71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 21:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LuyvxCn8sD6+TwxrJm30Ftk9S3JBWhdfj1Mgj3Q1Ng0=; b=VjJlDi5SOQ9dvM
	ZHXFAWpby2q7T1i67VphI8vdk/T+8bIICGScy/MF+YE7RMLz3s6ADNbZQ2+2k1r4ii4KDpvn7JBoP
	aLreH9E6KniU7Y9nrufzvHRjjZQrDieYf1ChM5viL2nFAYEWjBo78FkyaR+jhhcjppLzor3NiummJ
	IwAIFeKdwfUdj5SExsC5sv0zXDzsljc/f9iMDwZ0TjmRMPMY6PxMm8NAEvHsgIeMFdY68rJEzAKbx
	eEWNKxba/Wbf5S5yZvQCDCfhXytwHVi+48eQbe1mt5x8nzuPZvPapdzGRvndwvbGFEgarMuZfBTV5
	tQm7hS6+mpvk2yhftkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgWy-000000097S9-47j3;
	Mon, 25 Nov 2024 21:22:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgVx-000000097HF-38zi;
	Mon, 25 Nov 2024 21:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732569657;
	bh=TBn4GCrh/WfYjRfNUoDjtRI7in6N7aD9t1Df+F3kcLg=;
	h=From:Subject:Date:To:Cc:From;
	b=AjJ0mxeCylxaNDYHU0wW1TaOcxTioyLmpbIZsmwJu/sQwutdwY0UokpY1zOxyvymh
	 mMZaKTQ/XgEKCNlQkv5x8U1LFMjbononY8fRsdVlkEU/wLqgq6/XQgSXBnV2uX+wT4
	 JKp/Me7vxcbgJEElBqVdLQ+rpaj0jzPKLc9T3/uEmfVwu4ChFSCwtybzMWmDj0Zzzi
	 MDR0zBfrMU9hliJaZIb7K+xYPgsRvxWcvdlmaBVQ8MH3zhOhk4Ln66tACjAV3lSJEN
	 E792fx+Snp3dYrLZkipEMDaEw+aUJq0axVVtDc8miqfF5JFAjpDQz6rS1OqlBnMRp6
	 a5p6tefZD8DEw==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29EA417E37C8;
	Mon, 25 Nov 2024 22:20:54 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/5] thermal/drivers/mediatek/lvts: Fixes for suspend and
 IRQ storm, and cleanups
Date: Mon, 25 Nov 2024 16:20:27 -0500
Message-Id: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABvqRGcC/x2NwQrCMBAFf6Xs2YXuWqH6K+IhJk9dqLFkYxFK/
 93Q48xhZiVHMThdupUKFnP75AZy6Ci+Qn6CLTUm7XUQUeF3HeWsPC3V+WFTRUFi//qMnJr4cTj
 1R41hRMSdWmYuaHpfXG/b9gfgps9rcgAAAA==
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
X-CRM114-CacheID: sfid-20241125_132102_751586_A60175F7 
X-CRM114-Status: GOOD (  12.32  )
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
Nícolas F. R. A. Prado (5):
      thermal/drivers/mediatek/lvts: Disable monitor mode during suspend
      thermal/drivers/mediatek/lvts: Disable Stage 3 thermal threshold
      thermal/drivers/mediatek/lvts: Disable low offset IRQ for minimum threshold
      thermal/drivers/mediatek/lvts: Start sensor interrupts disabled
      thermal/drivers/mediatek/lvts: Only update IRQ enable for valid sensors

 drivers/thermal/mediatek/lvts_thermal.c | 103 ++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 31 deletions(-)
---
base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
change-id: 20241121-mt8192-lvts-filtered-suspend-fix-a5032ca8eceb

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


