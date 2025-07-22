Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5B1C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=taKJ6RK1sli84vm87fKu0sml3spVNqP5P8ljTY0b4ZE=; b=CQAxRG/aifusQ5PNBEfu9o9xog
	5TwiXCzJJIUaUhYpsWo1KE9YEuqI/NbGZomo8O2pqaMGnKaHHYzHV+sdcXTqdj88MUZ42H7l8u4oL
	sRUhcCGAI95Uephw5B7xzlthmYWnNL3tOYj1dnxMBlGh0Dtp0E6nuxRUrc3DxgdbPZ8RO6HTOPT3V
	ACEw/ggS/q6wxtVoRv9/S64AUNV8ptHMf85+QYJZUy9NEPFWU5ke3WOTwb3jQ4ZAaitcyEZoN3L1u
	qgeGJFOA4i3SP7AtkI+JySVNF5appDL1Jpxv+AjYUdFnXIrt0JZJGcVkuu3IXvJIgmqq3N1sCUEsy
	flhQfOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9XE-0000000239O-2o1N;
	Tue, 22 Jul 2025 09:43:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9GT-000000020ow-3JqA;
	Tue, 22 Jul 2025 09:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFFD45C64F4;
	Tue, 22 Jul 2025 09:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A777C4CEEB;
	Tue, 22 Jul 2025 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753176384;
	bh=5vnNECADTxAOgPhQ4LLy+ss4yNtSv0kIIcuhLrkYt0A=;
	h=From:To:Cc:Subject:Date:From;
	b=NDYDRt077GzA3pfTzc+6kAbMU8jVwXRQrZJp9Ubcq1qnpVvfXUTsJPaRAJBuku+rv
	 YtchbNEhk7ci/wtEK+umbmfvpcOA3hGeq9FAfMmPyJh5/53RLfNyMt0LwBVmuve7te
	 DbvVdXDVtQ16cLoAVDyhxxZ59GgjaEpKxL3Sht/Ie5YiY9rCChsBTUqvHdaoVAKBRG
	 8MMUlBq4qqFWnjThstx3pLV24uwLq0L4UQqIkZp7ZQBQIGOjamqJyTCKm8mDpCA1s5
	 Ah6S7ZVYQEJygY1ozv9d6iYQekThT4gcEpp1+D1Zh4Bl65nOeKVCNmn4BDDbk8s0KS
	 YYnPo+0vhe4KQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1ue9GH-0000000005N-2nDo;
	Tue, 22 Jul 2025 11:26:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH] ASoC: mediatek: common: fix device and OF node leak
Date: Tue, 22 Jul 2025 11:25:42 +0200
Message-ID: <20250722092542.32754-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_022625_869363_FA8C5363 
X-CRM114-Status: UNSURE (   9.59  )
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

Make sure to drop the references to the accdet OF node and platform
device taken by of_parse_phandle() and of_find_device_by_node() after
looking up the sound component during probe.

Fixes: cf536e2622e2 ("ASoC: mediatek: common: Handle mediatek,accdet property")
Cc: stable@vger.kernel.org	# 6.15
Cc: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 713a368f79cf..95a083939f3e 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -262,9 +262,13 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 				soc_card_data->accdet = accdet_comp;
 			else
 				dev_err(&pdev->dev, "No sound component found from mediatek,accdet property\n");
+
+			put_device(&accdet_pdev->dev);
 		} else {
 			dev_err(&pdev->dev, "No device found from mediatek,accdet property\n");
 		}
+
+		of_node_put(accdet_node);
 	}
 
 	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
-- 
2.49.1


