Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4900ECAC581
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sa4pK2HiFVq0V3IW5nFLIvvG4Ckdsl8UUh8ALJALKdQ=; b=h+bwoI4FutwIBE
	i+4r+uLZO0nve2+qUkDZrHVVJO4hIBx7+0uJAqVrW0eeNFy8IzYRAMEpZF21N7Y/Uy3ZdAiWz9wz7
	BMVUouRn8hRf+54yp9XgJE8qeAzt5e8xfWcQXkpWkzByCLpDTpGKTfox+8uK+Am+cZGOZuNp6Eau4
	6++8nth/9iQ0t9STAbxaX6vMQ5N8Wl13Jt6WjatAr/Qsqnv96JB5Kkaz0cQdDd/IWzZw1MPM3oRF6
	ZWX5zmyOfa5Jb3LnBqPh28JX62llKVrsAwczmvgpzpBDPRnZiWjNEXl4zGmy9HFJFddd+R3orEeXo
	gctiZCOxhtITzwyF/77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYEp-00000002hLN-0lvX;
	Fri, 05 Sep 2025 15:20:31 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTbi-000000011ym-1DI1;
	Fri, 05 Sep 2025 10:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757067816; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GybpDjWYrcHzyhe7ld9X+plIzRLFThL2vVRB4HOE39LPhEWo7G76wejJkddedYND5EPpQ9rgJaOp7EXZOdAo/Gx7y6sP/7AwDkDaoIu8oF8/wJL1R3NIuDrBFXJOWn1TFpXNI5Yi2h+ARaHSMJPSUmiP4hecLToZf9uVK06a+sM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757067816; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sa4pK2HiFVq0V3IW5nFLIvvG4Ckdsl8UUh8ALJALKdQ=; 
	b=kKnaR4pJBgM3+SeWyb52P6PTtYt804ke+MagQ44d46HPexHfGUR1TIMbeW5zhYKRPMug4qUTlbF7OVFmGt3sJQskTC+6ywtLpGbnjer9NVl83NuXJXKTRhLPR3KEXbQXQ2nrSHjqD0xhdfqW3OWWuG4qeYEkOO1cAjIGboZcX7I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757067816;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=Sa4pK2HiFVq0V3IW5nFLIvvG4Ckdsl8UUh8ALJALKdQ=;
	b=BvgBdHW4mre870EH86Py7ypKynt0qstx69dUFNQp7WUqIWhAOuSBhGluDwu2/8+D
	oWRANoyyeXRnkSP+vEp0Mrig+Y3UUKyxJO/ChrCHo3JM1spMW0RnOxLDsh6wLJAQRoj
	oT7zANmrPAe6hp2zMBRDn7sPcu6n8cGXUwp/n9HM=
Received: by mx.zohomail.com with SMTPS id 1757067815022812.3069983849073;
	Fri, 5 Sep 2025 03:23:35 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH RFC 00/10] MT8196 GPU Frequency/Power Control Support
Date: Fri, 05 Sep 2025 12:22:56 +0200
Message-Id: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAG6umgC/zWN3QqCMBhAX0W+6ybbTN0kIgh6gG7Di6mfNVBn2
 wxBfPeW1eX5fs5ZwKHV6KCIFrD40k6bIQDbRVA/1HBHopvAwClPqeCS9F4wmZH7OLUWn0Tl2T7
 NctowwSE8jRZbPW/CG1wvZyi/w3A7Bbn/bSrlkNSm77UvogFnT7aApOlH0qNzaksX0eFfppJJl
 sQsYSkXhJFOTVbFgzKn2nSdqkygYDxCua5vazWHD9cAAAA=
X-Change-ID: 20250829-mt8196-gpufreq-a7645670d182
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_032350_369351_403F5A8D 
X-CRM114-Status: GOOD (  16.72  )
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

This series, currently an RFC, introduces two new drivers to accomplish
controlling the frequency and power of the Mali GPU on MediaTek MT8196
SoCs.

It's marked as an RFC as I want feedback on the general approach, and
because there is a clock series I need to send out first but that's
waiting for the other clock series to be accepted first in order to not
create needless confusion and conflicts.

The reason why it's not as straightforward as with other SoCs is that
the MT8196 has quite complex glue logic. There's an additional MCU
running a specialised firmware, which communicates with the application
processor through a mailbox and some SRAM, and is in charge of
controlling the regulators, the PLL clocks, and the power gating of the
GPU, all while also being in charge of any DVFS control.

This set of drivers is enough to communicate desired OPP index limits to
the aforementioned MCU, referred to as "GPUEB" from here on out. The
GPUEB is still free to lower the effective frequency if the GPU has no
jobs going on at all, even when a higher OPP is set. There's also
several more powerful OPPs it seemingly refuses to apply, possibly
because those are boost levels.

The frequency control driver lives in panthor's subdirectory, as it
registers a devfreq device for the panthor GPU device, and needs to
mingle with it somewhat closely. I've kept the tie-in parts generic
enough however to not make this a complete hack; mediatek_mfg (the
frequency control driver) registers itself as a "devfreq provider" with
panthor, and panthor picks it up during its probe function (or defers if
mediatek_mfg is not ready yet, after adding a device link first).

The mailbox driver is a fairly bog-standard common mailbox framework
driver, just specific to the firmware that runs on the GPUEB. Most of
its channels are not known, as they're either not really used apart from
debug references in downstream code, or have indecipherable downstream
code, and I lacked the necessary documentation.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (10):
      dt-bindings: gpu: mali-valhall-csf: add mediatek,mt8196-mali variant
      dt-bindings: devfreq: add mt8196-gpufreq binding
      dt-bindings: sram: Add compatible for mediatek,mt8196-gpufreq-sram
      dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
      mailbox: add MediaTek GPUEB IPI mailbox
      drm/panthor: call into devfreq for current frequency
      drm/panthor: move panthor_devfreq struct to header
      drm/panthor: devfreq: expose get_dev_status and make it more generic
      drm/panthor: devfreq: add pluggable devfreq providers
      drm/panthor: add support for MediaTek MFlexGraphics

 .../bindings/devfreq/mediatek,mt8196-gpufreq.yaml  |  116 +++
 .../bindings/gpu/arm,mali-valhall-csf.yaml         |   36 +-
 .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        |   64 ++
 Documentation/devicetree/bindings/sram/sram.yaml   |    1 +
 drivers/gpu/drm/panthor/Kconfig                    |   13 +
 drivers/gpu/drm/panthor/Makefile                   |    2 +
 drivers/gpu/drm/panthor/mediatek_mfg.c             | 1053 ++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_devfreq.c          |  136 ++-
 drivers/gpu/drm/panthor/panthor_devfreq.h          |   57 +-
 drivers/gpu/drm/panthor/panthor_device.h           |    3 -
 drivers/gpu/drm/panthor/panthor_drv.c              |    4 +-
 drivers/mailbox/Kconfig                            |   10 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/mtk-gpueb-mailbox.c                |  330 ++++++
 14 files changed, 1788 insertions(+), 39 deletions(-)
---
base-commit: 87a9e300217e33b2388b9c1ffe99ec454eb6e983
change-id: 20250829-mt8196-gpufreq-a7645670d182
prerequisite-message-id: <20250829091913.131528-1-laura.nao@collabora.com>
prerequisite-patch-id: 441c4c2e3d22f83a41241a1ab5c9be1a442f742e
prerequisite-patch-id: 852bfc3d13e2bccc4d6f4813a71c42f329dadb0c
prerequisite-patch-id: 0bc5b7bf268e88a6ef22e46c91db7645e2ce6189
prerequisite-patch-id: 442533e316e46ecd47cd0b7fb410b58fad2b3bf9
prerequisite-patch-id: 6d6d70ccb7d718b3bcca6662cdaf1e8b64b6ddc2
prerequisite-patch-id: d61046e2cd2f33024092e96e8a987b9c34c24e73
prerequisite-patch-id: c27ca28bb3df435c98fe02438264188d6fa52b7c
prerequisite-patch-id: 27fadb12ce15099a684c08d4f8c785bedc87cef2
prerequisite-patch-id: 7796ec9a0162ae96b708ea513742016657c69e14
prerequisite-patch-id: f7549078f3702acdf1e6dcd36ddebab0e543b5db
prerequisite-patch-id: b123fb15cb8c97cf0896b826820f4ce33085170c
prerequisite-patch-id: fa96e18eae90efc14e4b9f13534c013b448a3f84
prerequisite-patch-id: 1e53ad7341ddb67c9788252456068cc14ab2f610
prerequisite-patch-id: ffff2977d8f2a3a44c3606f77d38f8745cb3c60a
prerequisite-patch-id: 71d23f4f096e424ae3aa59a23695f5b1e488fab0
prerequisite-patch-id: 3c12631f22a39d6def9340ed840e9e55e1a76304
prerequisite-patch-id: caec6572d5d9a37183601b8e38f50af797df635e
prerequisite-patch-id: d5b3d5719675a1e3be26e028b5596d39e839bc09
prerequisite-patch-id: da7b826d56ac70b3b72be58d64e7c2107445478f
prerequisite-patch-id: f3f789e0d919dd92b7d811a4e11c57bb05f71617
prerequisite-patch-id: 79cca92633ca3d9cc2f1f38b6fc977a8d8543d60
prerequisite-patch-id: f663f8f3bddf198d0cab083bac7ebb88689ffc82
prerequisite-patch-id: a0ffc5b88c5eb88c491f6187672012c621bd520c
prerequisite-patch-id: e6c6d67b034d06b6158a0e0f8299ad28f0e59134
prerequisite-patch-id: 25f658fbd1238bd57e05ff299d0436f942bdcc4d
prerequisite-patch-id: 7be8439e241a320b0eb0a264a8a59a9beef383d6
prerequisite-patch-id: b903714dbe7d6a44fbe18faa02d59862ceadf217

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


