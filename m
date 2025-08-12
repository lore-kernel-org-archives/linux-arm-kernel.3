Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E1DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vogq0glwCCfOjxaKkI+GHTdnKva9YonxR37S/lD4xA=; b=o5nZS9r3AryZh2l8Q41LDAE5H/
	83HsXcYcRxWJ5na0f92YFNk+7NDxyw65MODjxnGbnwrMid44AP9RerlafdoJ18CewXOhV1uwhp5Vx
	/4XbnYa2Ti5BcVkK3sNUtcbavjeXHPHm/SNS48LWt+HKeDZQVxG/MlIkUpyFhGaDcGBEljgF8hq7r
	kstJDkoabCnst3EztDkHOtnTpt/GkwE4gHGLbXRwtQyddOyjxM2otsVYr3rggG4SRDzhQSV+SSeeZ
	ZLlIcNFndKaOe4gNWw5sGpXTpNIn/QGVUEXFAtjr5rldCla+TIJgJOGWmdMCQBAdVtW+TSfLXUb+D
	RVQOfXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjx-0000000BKKL-15Z4;
	Tue, 12 Aug 2025 16:20:45 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln3U-0000000Ab70-1BVd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:20:38 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1Swb2MHyz9sSN;
	Tue, 12 Aug 2025 12:51:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kerTTt7NRZVH; Tue, 12 Aug 2025 12:51:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1SwZ5d91z9sSK;
	Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AA7BA8B764;
	Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ClAnCfTxCmbT; Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 03CA08B763;
	Tue, 12 Aug 2025 12:51:09 +0200 (CEST)
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
Subject: [PATCH v2 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
Date: Tue, 12 Aug 2025 12:50:56 +0200
Message-ID: <8d01cf4599664188c92a515922d68c9834263384.1754993232.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1754993232.git.christophe.leroy@csgroup.eu>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754995860; l=2232; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=XfURbicrtINn/6zsJVAuuKOWunGZaLPhKuyOsIyIZX0=; b=YBxguf9SJ+Iqmj02qL4fBifNH7KDTCcS7hy6Imu81/zBTIa3kKCjuwcO9Knmd63YnJxJKvq/X Q/IvZFe9FcrCZqrymZp7kNatPLd0/qa1D0OzNY8vUMKpguQFswGlVuH
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_042036_492230_6448105A 
X-CRM114-Status: GOOD (  12.82  )
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: New
---
 sound/soc/fsl/fsl_qmc_audio.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 5614a8b909edf..0be29ccc1ff7b 100644
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
+		ret = qmc_chan_get_ts_info(qmc_dai->qmc_chans[i], &ts_info);
+		if (ret) {
+			dev_err(qmc_audio->dev, "dai %d get QMC %d channel TS info failed %d\n",
+				qmc_dai->id, i, ret);
+			return ret;
+		}
+
+		last_rx_ts = fls64(ts_info.rx_ts_mask);
+		last_tx_ts = fls64(ts_info.rx_ts_mask);
+
+		if (prev_last_rx_ts > last_rx_ts) {
+			dev_err(qmc_audio->dev, "dai %d QMC chan %d unordered channels (RX timeslot %lu before %lu)\n",
+				qmc_dai->id, i, prev_last_rx_ts, last_rx_ts);
+			return -EINVAL;
+		}
+		if (prev_last_tx_ts > last_tx_ts) {
+			dev_err(qmc_audio->dev, "dai %d QMC chan %d unordered channels (TX timeslot %lu before %lu)\n",
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


