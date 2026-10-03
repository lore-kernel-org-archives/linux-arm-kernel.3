Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B708CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rrkz7SQZupuPWDT3oGVi7jy5HpE8mbCCyjqfsJLEW24=; b=oyk3gTirjIL5b+ZIv1HhFVO0hS
	rhNidjtlkqRX+ucounw0ECs3nJzVtnr1rfk9WM73i2hzSMC22mY8zvwQNZESiYJp9QqOrwsZN6jPv
	6LfXJ7Yxbqga+90bZ0fKYSqcX1bRPZs3GMNuSwSoonF7oRz6fdODKBYk0mWc3msNbdTCSlKGNV8ff
	qoK57jGOaA5LQ5vEQtmRQ2zvRcwxxRbr/T8gcX8Lh/BK7OsggxRwTdvrBr8jCp3Qf7sEgWLM7Yl8G
	zyzAGQ1lbtwwELehKK/gT6UPNkPBykxrBBqUAakClUbNHC0COrH8ZMqgH+2lvXKEIttKMWOujJgTM
	gzO8mLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fR-0000000DxJq-0aom;
	Sat, 03 Oct 2026 19:45:09 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5fO-0000000DxJ7-3lw9;
	Sat, 03 Oct 2026 19:45:08 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rrkz7SQZupuPWDT3oGVi7jy5HpE8mbCCyjqfsJLEW24=;
	b=tVthf2V9abfZ5t6twtvBHsQD7En5A+RDKeldAQuCEK7IhGrloWOAo97H3qihxQlGPTZ31q
	cmY52nLMqwUL3bG6xUF/jJAibXGQFIWGcBTTOQY55oVmpzxfKhGjRZcnKx9ZCUErDtNB0A
	gwv1oRIaiMe6f3pSofk03qCQJE6/Ccg2zhvFXTPz2a6XJGkSd/jLVvoRQOP2ucSk9kipAx
	49lRx/MeQOpADj89+MwurqOeLUy31kv4ZFM+rdWNiaDGv0tTZq5QUTwXbQzE7/LEsFI/Fl
	jyIFPUkAgIEKJn/Fh7qB3z9Tub5pf7nhxyY3maHwI04rCbhdHEKGUDM7DBe25g==
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 0/4] ASoC: Fixes for the MT8188 sound card
Date: Sat,  3 Oct 2026 21:44:57 +0200
Message-ID: <20261003194501.832558-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_124507_122112_B2896F16 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

These patches fix problems found while bringing up audio with SOF on
the Lenovo Chromebook Duet Gen 9 (Ciri, MT8188) on a mainline kernel.

The first two fix the common MediaTek sound card probe when the card
cannot be bound on the first attempt. A missing component made the
card fail its rebind because the codec references were already
released, and a deferred or failed probe left the static card with a
topology name that devm had freed, so the card registered with a
garbage name and UCM found no profile for it.

The third limits the UL8 front end on MT8188 to what its only back end,
ETDM1_IN, supports, so that userspace can no longer pick a
configuration that fails in hw_params.

The fourth is not MediaTek specific: hdmi-codec parsed the all-zero
ELD that bridges return without a sink, which logged "Unknown ELD
version 0" on every open of a disconnected HDMI/DP PCM.

Tested on Ciri.

Michał Kopeć (4):
  ASoC: mediatek: common: Keep codec references until the card is bound
  ASoC: mediatek: Don't keep a freed topology name in the static card
  ASoC: mediatek: mt8188: Constrain UL8 FE to its back end's
    capabilities
  ASoC: hdmi-codec: Don't parse an empty ELD on startup

 sound/soc/codecs/hdmi-codec.c                 |  8 ++-
 .../mediatek/common/mtk-soundcard-driver.c    | 67 ++++++++++++++++++-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  3 +
 3 files changed, 73 insertions(+), 5 deletions(-)


base-commit: 0d6ef8b530db8dbad6b06309cf2683f1032f8013
-- 
2.55.0


