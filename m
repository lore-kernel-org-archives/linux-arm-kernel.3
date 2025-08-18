Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E79CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7VbbVIH8UFd/ZXRt8tTqoE2DEAgRPhZQ9cL0+DlJjmY=; b=i0h3JEDmgVZoJZmxRk+7GlxCgf
	frJprG3JcZBHTIKmILNsjui2iC5bC8WdEDnlSLQvAmFath49ONhZSY4PBdj2cIkL9pKrsh1Adv5Ps
	OsYptyByhkV41d63rfLBsL+Z9SC/Tf2r9mgc6/ufpQaKKnniyzNZkl2/sHa+7llcRhSbDZhR0Nh6N
	uI06/BWaLsg/4UMqmFnKzHB41oGYpWuo6iCGN1smBuWqZj70+bpDf0p7FtG8L84MF7vwGyDuz9cwE
	Ya8RWyYEIziWICA81mxH396lwTaGFwBNLStA2RNsqw3N6hKDIlFvr+AhwE3B3dQTyoOXacEmfZff+
	UGzOjTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1A0-00000007oCl-1Ua5;
	Mon, 18 Aug 2025 14:48:32 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvZy-00000006yrw-2QDu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:50:59 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55HS397Bz9sW6;
	Mon, 18 Aug 2025 10:20:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMMyCDZPktia; Mon, 18 Aug 2025 10:20:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55HS1ztdz9sW4;
	Mon, 18 Aug 2025 10:20:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F1EB8B765;
	Mon, 18 Aug 2025 10:20:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ymC4Y2tOtNpK; Mon, 18 Aug 2025 10:20:04 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F2BA48B763;
	Mon, 18 Aug 2025 10:20:03 +0200 (CEST)
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
Subject: [PATCH v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of interrupts
Date: Mon, 18 Aug 2025 10:19:59 +0200
Message-ID: <cover.1755504428.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755505199; l=2329; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=pbAuN88+fAvtq6e9c1Cuomlr5CexTJYFwYsjbKKxSv0=; b=kYoKb+1G4M+oBNjPSIblYLyr02FxdpGXktGAtambWltq8gWdILmpYrw9TuWcteLPOJ82HWcGW zHtiikDuJHPBlwm+8sNkaJ/GwOEiXWLXie2LYf+BV8zuMn5tZMMOKBw
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_015058_789863_A4EFC1BD 
X-CRM114-Status: GOOD (  11.97  )
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

Changes in v3:
- Properly check the buffer descriptor is unused (Patch 1, comment from Herve Codina)
- Fixed copy/paste error (patch 2, comment from Herve Codina)
- Fixed build failure (patch 2, comment from Herve Codina and Test robot)

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


