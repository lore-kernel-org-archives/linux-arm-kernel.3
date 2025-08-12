Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67548C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n/TDNILDuPSlaQFsB23LU5Lh6T1tog/xUO4qkj1maWM=; b=f8MWTm4PXhEz9xAnmDY/91kUmn
	OlrCo37Tfe2hPnrDpYVs7kOdRjNzMcrBgTNPgs9lhH83JuVBtkW79lTRpFep7cgocNMbIeAa3Bl9h
	kVzYmW5H6TH/IAYvkoLsS3m6kCDeEkskZ5uIXE1aK/qA1dtekGxJ3di5fjswtaHvFO10csHLEfzf8
	VXZajVW4QTt1QK7fNwacZlmxY4EPI+HrDLveoI8kiX509gxmOUxs83X3cfQcyXDv4r/CehZnkVQBw
	RGTJxrAV+VTdukO4VU/fF/+uaQGQN+Wl9RhyZChBzYmvws0TjxYFgJHfLhtci8jh/yx+ZFpPDbsj8
	zPojrzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrk6-0000000BKb1-3SHK;
	Tue, 12 Aug 2025 16:20:54 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln45-0000000AbFI-0gUO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:21:14 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1SwY3Ysyz9sSH;
	Tue, 12 Aug 2025 12:51:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJCeT-QG9HUg; Tue, 12 Aug 2025 12:51:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1SwY2hXlz9sSC;
	Tue, 12 Aug 2025 12:51:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 47B638B764;
	Tue, 12 Aug 2025 12:51:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WUmfHuHIqMrh; Tue, 12 Aug 2025 12:51:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9054F8B763;
	Tue, 12 Aug 2025 12:51:08 +0200 (CEST)
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
Subject: [PATCH v2 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of interrupts
Date: Tue, 12 Aug 2025 12:50:54 +0200
Message-ID: <cover.1754993232.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754995860; l=2086; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=FRfbeaR7rhVdJf6odNPziauZN7ICtJBaAc+3BTSFO/Y=; b=m+XoSKxXt1CUMuWUoeYQjJDOTOPfYSKku1zZEwdalbQcCtNlcpJpL1GEWLIcaBA5FsSz9gnF4 VfjUyF3z/dJDj8+4m4MfsQjwe4fr+C5W2bdhOPsRmYVs+5m9nufHJ4m
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_042113_380797_B03331E9 
X-CRM114-Status: GOOD (  12.04  )
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

This series reduces significantly the amount of interrupts on
fsl_qmc_audio device.

Patches 1 and 2 are preparatory patches.
Patch 3 is the main change
Patch 4 is a cleanup which is enabled by previous patch

Changes in v2:
- Don't remove UB bit (Patch 1, comment from Herve Codina)
- Make sure audio channels are ordered on TDM bus (Patch 2, new patch, comment from Herve Codina)
- Drop struct qmc_dai_chan  (patch 4, new patch)

Backgroup (copied from patch 3):

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

Christophe Leroy (4):
  soc: fsl: qmc: Only set completion interrupt when needed
  ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
  ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
  ASoc: fsl: fsl_qmc_audio: Drop struct qmc_dai_chan

 drivers/soc/fsl/qe/qmc.c      |  44 +++++++++---
 sound/soc/fsl/fsl_qmc_audio.c | 125 +++++++++++++++-------------------
 2 files changed, 87 insertions(+), 82 deletions(-)

-- 
2.49.0


