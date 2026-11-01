Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF52606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DPDD6xRD;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=bqF6uGMh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KoWImiShPPX64endYV2oF0Pegts01lrpoAaRhh6SIUI=; b=DPDD6xRDdc1LTO
	TReHFFfafgyYDAFRIuikO5QgkXot7GVWdtbS7bDqkrnruNNU6tz10wEmQZhBZQ46Dr4VmLIrCODzf
	/ljnO3y2+WQHCWkVBknh/i9oKtmSZx0IsVNGqt2+pLh981hldcrBE5JmOI+DYWhfP/09K8Ctec+Iq
	tmfNCnuys0txpmfdJPd4+TFj8SlbORqRcy9dKobfzqCR+v2vDX6dXk4cwno2MaYoAK7g7P4O5dEgd
	bzvpBAWN+Yf9wDh/crG9X+RjS2mupCFX+Yb4jD8qFXMTGcnWs0KNzyUu+x2OrafhoJhJrT7ktgI0d
	ZBH7rc6aLEe/58AUPRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNNOM-0000000Dsrq-2BFc;
	Sun, 01 Nov 2026 04:42:02 +0000
Received: from mail-m1072.netease.com ([154.81.10.72])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNNOI-0000000DsqI-1l9r;
	Sun, 01 Nov 2026 04:42:00 +0000
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530dcc2c7;
	Sun, 1 Nov 2026 12:41:54 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v2 0/3] RK3308 codec audio sequencing and headphone support
Date: Sun,  1 Nov 2026 12:41:46 +0800
Message-Id: <20261101044149.2018744-1-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101040125.1864141-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19569ff8e03a8kunmda3ed7c8171604
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUtDVkNDQkxLThhPSUNISlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=bqF6uGMhSTBFAbWN5IR16gHZGfMogg7UR6TuV1g89zqcdicAFAH+wfNaI5+fSBa/5I6PVqFNUeREaMS7a0CtofeWp89stdIH/7RrAEUTpnrWPcYqLXkew6gQI0h3JmQfQklt6MADUXOYmu5zGZi/hz6GRHKkuCFzmq/20E1bN5E=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=KoWImiShPPX64endYV2oF0Pegts01lrpoAaRhh6SIUI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_214159_029145_B0A78103 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Restore the full RK3308 codec analog power sequencing and headphone
support from the downstream 6.12 implementation, adapted to the current
ASoC interfaces. Keep the complete codec source and register definitions
in one patch, alongside the binding and SoC detection-resource changes.

The codec change includes revision-specific ADC/DAC supply sequencing,
reference-current and headphone gain ramps, A/B CIC fades, active ADC
resynchronization, MICBIAS restoration, microphone boost controls, ADC
stereo-group routing and B/C headphone detection. Machine drivers retain
ownership of the external amplifier GPIOs.

The SDK-only multicodecs shutdown fix and EVB/VAD routing patch are
outside this series because their target drivers and board files are
not present in the upstream tree.

Patches 1-2 are for the ASoC tree; patch 3 is for the Rockchip DT tree.
The detection resources remain optional for existing device trees.

Changes since v1:
- Restore the full analog sequencing omitted from the initial posting.
- Consolidate all codec C/header changes into a single patch.
- Use the original binding descriptions and legacy IRQ lookup rules.
- Preserve upstream automatic DAI format selection and adapt accessors.
- Use sleepable waits while preserving downstream minimum delay requests.
- Keep the SDK-only machine-driver and EVB/VAD work deferred.

Previous posting:
https://lore.kernel.org/r/20261101040125.1864141-1-zhengxing@rock-chips.com

Validation:
- ARM64 defconfig plus built-in RK3308 codec, Image and all six RK3308
  DTBs build on broonie/for-next and the Linus baseline with GCC 14.3.1.
- Codec W=1 builds, binding/example validation and codec-schema checks
  on the six DTBs pass; strict checkpatch reports no diagnostics.
- The three patches apply to the Linus baseline without 3-way fallback;
  range-diff reports all three patches unchanged.
- Extracted SDK/upstream analog functions match across 11520 modeled
  register traces, including operation order and minimum delay requests,
  under ASan/UBSan. Parameter/error-path probes also pass.

These host models do not verify actual hardware settling time.
No new playback, capture, hotplug, suspend/resume or electrical timing
measurements have been performed on hardware with this upstream series.

Xing Zheng (3):
  ASoC: dt-bindings: rk3308-codec: describe detection and ADC routing
  ASoC: codecs: rk3308: restore audio and headphone support
  arm64: dts: rockchip: restore RK3308 codec detection resources

 .../bindings/sound/rockchip,rk3308-codec.yaml |   55 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      |    4 +
 sound/soc/codecs/rk3308_codec.c               | 1155 ++++++++++++++---
 sound/soc/codecs/rk3308_codec.h               |   18 +-
 4 files changed, 1064 insertions(+), 168 deletions(-)


base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8

