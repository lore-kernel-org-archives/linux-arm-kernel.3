Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CA8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8KIaKaIf8ymEygY/rIs+aRe2fxMAW4DXWCks+G/B7g=; b=xgMWxmFYjVkETGTkI/1cMRnHrs
	fpHizKBbkqR5C1gIMV/XNTPxp1GrAGtwdL+iSiQQApIIBZjg3y+J25Rx1A9aBwmFtzDArZ5ySnryK
	sSpbrpr+Qjfz4nUBK4EWVLdBUdHJMvhnnWvH3wVCItsCWvfcGFJA4+nLHVUePuKSrngGBt+g9ugGw
	/2vcc88p2JZiodBdk3Sjhow5YQF44ntiVyXIlNnOe3wpHOloWZf8ansW16nJPF22TZm0hYF2OG7Nf
	JPQsDBcWZLJ4CcHPRDQK9S7o259/Ex2HSP5lEeSIeXNjW8ylacHtty0YlTf5+4ddXxupj5NnmjCCy
	O9BVgSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGuD-00000000Uww-0WJM;
	Thu, 18 Sep 2025 15:50:45 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGuA-00000000Uur-3HQy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:50:44 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSKSR28vLz9sg1;
	Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7_lta6qXCna; Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSKSR15xZz9sfv;
	Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 15DCD8B767;
	Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dYGLOMvVr6vT; Thu, 18 Sep 2025 17:34:31 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 40FA78B775;
	Thu, 18 Sep 2025 17:34:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH RESEND v3 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
Date: Thu, 18 Sep 2025 17:34:09 +0200
Message-ID: <4ff40afdf3d032b05dd4af6c0f777d4d4b445a76.1758209158.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758209158.git.christophe.leroy@csgroup.eu>
References: <cover.1758209158.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758209657; l=2268; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=PhCdmcBJPdWMbFjoZdGBw3gyDb5r2JgdoYXKwih9mSw=; b=ruBvohcdwTV13JzsoBOhlDufd3DsKpD4cOPOEYuGWSfm6Ozs7idM1/CNZLZUOMe9VBZP4mWZ2 thJrF3KAZaWDljbSlUr+XfoKg14q6ra/HyrJIPSjZZGr0vqZjORgflI
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_085042_994856_CC0D6A9B 
X-CRM114-Status: GOOD (  12.31  )
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

To reduce complexity of interrupt handling in following patch, ensure
audio channels are configured in the same order as timeslots on the
TDM bus. If we need a given ordering of audio sources in the audio
frame, it is possible to re-order codecs on the TDM bus, no need to
mix up timeslots in channels.

Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/soc/fsl/fsl_qmc_audio.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 5614a8b909ed..c0c7ef0a1511 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -791,12 +791,17 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 			       struct qmc_dai *qmc_dai,
 			       struct snd_soc_dai_driver *qmc_soc_dai_driver)
 {
+	struct qmc_chan_ts_info ts_info;
 	struct qmc_chan_info info;
 	unsigned long rx_fs_rate;
 	unsigned long tx_fs_rate;
+	int prev_last_rx_ts = 0;
+	int prev_last_tx_ts = 0;
 	unsigned int nb_tx_ts;
 	unsigned int nb_rx_ts;
 	unsigned int i;
+	int last_rx_ts;
+	int last_tx_ts;
 	int count;
 	u32 val;
 	int ret;
@@ -879,6 +884,30 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
 				return -EINVAL;
 			}
 		}
+
+		ret = qmc_chan_get_ts_info(qmc_dai->chans[i].qmc_chan, &ts_info);
+		if (ret) {
+			dev_err(qmc_audio->dev, "dai %d get QMC %d channel TS info failed %d\n",
+				qmc_dai->id, i, ret);
+			return ret;
+		}
+
+		last_rx_ts = fls64(ts_info.rx_ts_mask);
+		last_tx_ts = fls64(ts_info.tx_ts_mask);
+
+		if (prev_last_rx_ts > last_rx_ts) {
+			dev_err(qmc_audio->dev, "dai %d QMC chan %d unordered channels (RX timeslot %d before %d)\n",
+				qmc_dai->id, i, prev_last_rx_ts, last_rx_ts);
+			return -EINVAL;
+		}
+		if (prev_last_tx_ts > last_tx_ts) {
+			dev_err(qmc_audio->dev, "dai %d QMC chan %d unordered channels (TX timeslot %d before %d)\n",
+				qmc_dai->id, i, prev_last_tx_ts, last_tx_ts);
+			return -EINVAL;
+		}
+
+		prev_last_rx_ts = last_rx_ts;
+		prev_last_tx_ts = last_tx_ts;
 	}
 
 	qmc_dai->nb_chans_avail = count;
-- 
2.49.0


