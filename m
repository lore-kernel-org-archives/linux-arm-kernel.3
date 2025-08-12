Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D9FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlCHKdloNnuDlI+3PXr5yZHhGm/T8e4Ko0EuQj8bSa0=; b=xlHLStPNPdndSNcBg5ZsHjuyCU
	M/iAY9u2Ookh7YiCsya6DRQAUVFDelme78VyrhQvZHd5GS3TdtcKpEXkKmKj/jfYbRV1Yq6O8B8dk
	YBCaU80uPy7w4TamUK6SjdDMkl4O5as/PWxDHiI49v22ngP02DN1GnMI6NnrUmBBELFwyyPw45/x7
	e/R/TSXnyUFrSBEv3jlStx64xrhW661k/s/f+fHsrFJ0e07WG1+seKpND6ajvc272BxFVdeI9wuGx
	1fDwIZ+vksBVXQgiENDdNoIv2TLBgdk2PP10EDf6c5rFElbbt+D6dvfGIr9OVvCz69MpvH6YioA6z
	mQvOETXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrk0-0000000BKQv-3eEx;
	Tue, 12 Aug 2025 16:20:48 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln3j-0000000AbAM-1tie
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:20:52 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1Swc0sHyz9sSR;
	Tue, 12 Aug 2025 12:51:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZfLVWQ7jLtD; Tue, 12 Aug 2025 12:51:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1Swb3wGkz9sSK;
	Tue, 12 Aug 2025 12:51:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C8CB8B764;
	Tue, 12 Aug 2025 12:51:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4GfoNMbtMS8g; Tue, 12 Aug 2025 12:51:11 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AB8FE8B765;
	Tue, 12 Aug 2025 12:51:10 +0200 (CEST)
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
Subject: [PATCH v2 3/4] ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
Date: Tue, 12 Aug 2025 12:50:57 +0200
Message-ID: <21eb89cc03a1c2135bdaba6a4dd1d0c2e624ce29.1754993232.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1754993232.git.christophe.leroy@csgroup.eu>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754995860; l=4945; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=4WvVIASI4alTwJrylXkbVq3Sqy6GlVQKoVrURW7O4pc=; b=kK0HMFbQjUGoU9gCyvZ9al1SVU7DiGHBkSIKbM6b3PMB48xoPCApvkWX7TBmhMOhpYNbI3W0n YdaUjFo/BHbD6r+nRb+tGtUznllA2+KDoXIpFTPGrpkXMYtBHP9XA7H
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_042051_670513_BB57B6D8 
X-CRM114-Status: GOOD (  16.61  )
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

In non-interleaved mode, several QMC channels are used in sync.
More details can be found in commit 188d9cae5438 ("ASoC: fsl:
fsl_qmc_audio: Add support for non-interleaved mode.")
At the time being, an interrupt is requested on each channel to
perform capture/playback completion, allthough the completion is
really performed only once all channels have completed their work.

This leads to a lot more interrupts than really needed. Looking at
/proc/interrupts shows ~3800 interrupts per second when using
4 capture and 4 playback devices with 5ms periods while
only 1600 (200 x 4 + 200 x 4) periods are processed during one second.

The QMC channels work in sync, the one started first is the one
finishing first and the one started last is the one finishing last,
so when the last one finishes it is guaranteed that the other ones are
finished as well. Therefore only request completion processing on the
last QMC channel.

On my board with the above exemple, on a kernel started with
'threadirqs' option, the QMC irq thread uses 16% CPU time with this
patch while it uses 26% CPU time without this patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/soc/fsl/fsl_qmc_audio.c | 46 +++++------------------------------
 1 file changed, 6 insertions(+), 40 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 0be29ccc1ff7b..92aa813aa3bee 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -57,7 +57,6 @@ struct qmc_dai_prtd {
 	size_t ch_dma_offset;
 
 	unsigned int channels;
-	DECLARE_BITMAP(chans_pending, 64);
 	struct snd_pcm_substream *substream;
 };
 
@@ -126,17 +125,14 @@ static int qmc_audio_pcm_write_submit(struct qmc_dai_prtd *prtd)
 	int ret;
 
 	for (i = 0; i < prtd->channels; i++) {
-		bitmap_set(prtd->chans_pending, i, 1);
-
 		ret = qmc_chan_write_submit(prtd->qmc_dai->chans[i].qmc_chan,
 					    prtd->ch_dma_addr_current + i * prtd->ch_dma_offset,
 					    prtd->ch_dma_size,
-					    qmc_audio_pcm_write_complete,
-					    &prtd->qmc_dai->chans[i]);
+					    i == prtd->channels - 1 ? qmc_audio_pcm_write_complete :
+								      NULL, prtd);
 		if (ret) {
 			dev_err(prtd->qmc_dai->dev, "write_submit %u failed %d\n",
 				i, ret);
-			bitmap_clear(prtd->chans_pending, i, 1);
 			return ret;
 		}
 	}
@@ -146,20 +142,7 @@ static int qmc_audio_pcm_write_submit(struct qmc_dai_prtd *prtd)
 
 static void qmc_audio_pcm_write_complete(void *context)
 {
-	struct qmc_dai_chan *chan = context;
-	struct qmc_dai_prtd *prtd;
-
-	prtd = chan->prtd_tx;
-
-	/* Mark the current channel as completed */
-	bitmap_clear(prtd->chans_pending, chan - prtd->qmc_dai->chans, 1);
-
-	/*
-	 * All QMC channels involved must have completed their transfer before
-	 * submitting a new one.
-	 */
-	if (!bitmap_empty(prtd->chans_pending, 64))
-		return;
+	struct qmc_dai_prtd *prtd = context;
 
 	prtd->buffer_ended += prtd->period_size;
 	if (prtd->buffer_ended >= prtd->buffer_size)
@@ -182,17 +165,14 @@ static int qmc_audio_pcm_read_submit(struct qmc_dai_prtd *prtd)
 	int ret;
 
 	for (i = 0; i < prtd->channels; i++) {
-		bitmap_set(prtd->chans_pending, i, 1);
-
 		ret = qmc_chan_read_submit(prtd->qmc_dai->chans[i].qmc_chan,
 					   prtd->ch_dma_addr_current + i * prtd->ch_dma_offset,
 					   prtd->ch_dma_size,
-					   qmc_audio_pcm_read_complete,
-					   &prtd->qmc_dai->chans[i]);
+					   i == prtd->channels - 1 ? qmc_audio_pcm_read_complete :
+								     NULL, prtd);
 		if (ret) {
 			dev_err(prtd->qmc_dai->dev, "read_submit %u failed %d\n",
 				i, ret);
-			bitmap_clear(prtd->chans_pending, i, 1);
 			return ret;
 		}
 	}
@@ -202,26 +182,13 @@ static int qmc_audio_pcm_read_submit(struct qmc_dai_prtd *prtd)
 
 static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags)
 {
-	struct qmc_dai_chan *chan = context;
-	struct qmc_dai_prtd *prtd;
-
-	prtd = chan->prtd_rx;
-
-	/* Mark the current channel as completed */
-	bitmap_clear(prtd->chans_pending, chan - prtd->qmc_dai->chans, 1);
+	struct qmc_dai_prtd *prtd = context;
 
 	if (length != prtd->ch_dma_size) {
 		dev_err(prtd->qmc_dai->dev, "read complete length = %zu, exp %zu\n",
 			length, prtd->ch_dma_size);
 	}
 
-	/*
-	 * All QMC channels involved must have completed their transfer before
-	 * submitting a new one.
-	 */
-	if (!bitmap_empty(prtd->chans_pending, 64))
-		return;
-
 	prtd->buffer_ended += prtd->period_size;
 	if (prtd->buffer_ended >= prtd->buffer_size)
 		prtd->buffer_ended = 0;
@@ -249,7 +216,6 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		bitmap_zero(prtd->chans_pending, 64);
 		prtd->buffer_ended = 0;
 		prtd->ch_dma_addr_current = prtd->ch_dma_addr_start;
 
-- 
2.49.0


