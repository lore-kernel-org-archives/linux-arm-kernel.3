Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81AB606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 04:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c4UVQ/8g;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=jm9qjyVJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Is9f9IM8ZVqsLAYH2gcTtPGO/D3u7WqNSOJmOqw4Svc=; b=c4UVQ/8gJ7whrYfaGEEH5+UH9b
	0UV0/VQhIeyYZfW0z9gxbEulB+6l+7B+Hv4fWAgerkXgTNyq53jq4Ai/ZXzjOp0r+5TLFCyAlC7HT
	AtbjQWg2v0pHce420oOfZVQuGKPDZNK+DzQL5Gsxjbw/3+0KPCj+q3ToUbHRJEGeBRIFaspo5bjzK
	Rd67GDxdqxZ9rc2V0gP1P+i3QHfrLcyuMy2rwmh5jVYM7/KpZuxzK7dL6pSH5d5E53OYUb+jlYbWe
	xpVZPVfAYe6YRYePb0ewVXER+D+Qd9nkDybDp+K9H4Ey1Ba+Mbccxobq+nNbzULKxboKLv3CLpmFN
	Mkg9p3YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMlo-0000000Dr9f-25B6;
	Sun, 01 Nov 2026 04:02:12 +0000
Received: from mail-m1018.netease.com ([154.81.10.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNMld-0000000Dr1d-22yu;
	Sun, 01 Nov 2026 04:02:05 +0000
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530d84133;
	Sun, 1 Nov 2026 12:01:50 +0800 (GMT+08:00)
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
Subject: [PATCH v1 0/6] RK3308 codec configuration and headphone detection
Date: Sun,  1 Nov 2026 12:01:19 +0800
Message-Id: <20261101040125.1864141-1-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa195454f6d03a8kunm8fccdc7416d290
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBhJVh5OSksaGBoYQ0pNH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=jm9qjyVJNzMqqBsxtM3O1CG8ZjLapVQucKeEDyYgODahlG3KRTQc+b82Hq/hOi3Xrgc9+7ARuEhUk//8v5ks4OrockuAO/26l8zBVocJ3kxHyq+n/hNWf5jUViufS2oyQPMjeupq7PKi1mQ5nFgdwkikLdZotBsege/MDezYPgw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Is9f9IM8ZVqsLAYH2gcTtPGO/D3u7WqNSOJmOqw4Svc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_210201_763815_3ACD1060 
X-CRM114-Status: UNSURE (   9.59  )
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

This series ports selected RK3308 codec configuration fixes and features
from the Rockchip SDK to current upstream ASoC. It preserves the recently
merged revision-B support (157f7cba77a9) and existing upstream DAPM power
sequences.

The first two patches preserve the configured MICBIAS voltage across the
component reset and expose the separate microphone boost controls. The
remaining codec patches document and configure ADC group routing and
report the B/C headphone detector through set_jack. Output routing stays
with the machine driver and its jack pin associations.

The last patch describes only the SoC detection resources. Mark can take
patches 1-5 through ASoC; Heiko can take patch 6 through the Rockchip tree
once the binding changes are available.

The SDK-only multicodecs driver, VAD sound cards and EVB routing fragments
are not introduced by this series. The larger SDK analogue power-sequence
rewrite also remains outside this first upstream series.

Validation:
- Based on broonie/for-next at
  11ae63bd9030349a0136fb2edd1622a4a029edc8.
- The same six patches apply with git am --no-3way to Linus master at
  36aad21d50d1af3f6954bb0c988257a908202477; range-diff is unchanged.
- Both baselines build an arm64 defconfig Image with
  CONFIG_SND_SOC_RK3308=y using Arm GNU Toolchain 14.3.1.
- W=1 codec object builds pass on both baselines.
- All six RK3308 DTBs listed in each baseline build and pass the codec
  schema checks; dt_binding_check including its example also passes.
- Strict checkpatch reports no errors, warnings or checks for all six
  patches.
- An ASan/UBSan host probe exercises the actual driver functions against
  a property/register model: 24 valid and 601 invalid ADC mappings,
  480 stream configurations, 15 boost settings, 24 MICBIAS/reset cases,
  8 polarity cases and 6 DAPM clock/error-path cases.

No new board playback, capture, headphone hotplug, suspend or analogue
pop measurements have been performed on these upstream kernels. The host
register model does not replace hardware validation.

Xing Zheng (6):
  ASoC: codecs: rk3308: restore MICBIAS voltage after reset
  ASoC: codecs: rk3308: expose per-channel microphone boost
  ASoC: dt-bindings: rk3308-codec: describe ADC routing and jack
    detection
  ASoC: codecs: rk3308: support ADC stereo-group routing
  ASoC: codecs: rk3308: report B/C headphone detection through set_jack
  arm64: dts: rockchip: describe RK3308 codec detection resources

 .../bindings/sound/rockchip,rk3308-codec.yaml |  54 +++
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      |   4 +
 sound/soc/codecs/rk3308_codec.c               | 359 +++++++++++++++++-
 3 files changed, 411 insertions(+), 6 deletions(-)


base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8

