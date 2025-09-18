Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEFDCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ocD8LP5kPQIQqlpWUmHZIyZiNchzokTrKlUIDulbyIg=; b=RmWZKlfPmPQOKIW/NmGCT5U6gP
	1VJgNDktIMjhkUfDNLBzwEsyIFnDaW57xjitpE9Yws54rOjTZZZiAoPdAo/ssZJKs0SmRFENbhiTj
	blGcOUZKZrtcIFLWfhNRtIzNm3alh9N5Wcb2IDPGgGYzn3xHtjoR8p/hhC6FfdFB+JD3EXtB44mea
	1Hn8V40xeUo8R+WGXE8swFOQfZ4jP9YFPE4OgKn61be596Fwi3LuwWa1ti0+fuVLUqhhFw76NbIeW
	Wo/Bx6N0pXKFp1IzxMvH5ZbjyGk1JrJrh2LZ/qQlFAfepfHMectXgnx9pHEsS7HcOasowuY9lUnEu
	NGkNX84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGuR-00000000V6M-2eyZ;
	Thu, 18 Sep 2025 15:50:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGuQ-00000000V5S-3fKA
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Sep 2025 15:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ocD8LP5kPQIQqlpWUmHZIyZiNchzokTrKlUIDulbyIg=; b=Kva9/l7F/9quRSW2X8Nj2Hyczr
	XFC7IHTVAG84GLj1tOJfc7UEfijYHWrLLiHYYWO2Xc9ECAb9RSxidTbX45f0U0wBsVOfrDUDFdD8k
	8dAlSnnXRQSVR70mc7h6BsJEIYr3+OroFVVc0rgv3yYOICT3aL2oz5euqfmBJfb6FetedM9BkyBfI
	+As7RQgFHbALz9yquVjIRJ86P6KYd2zii2XOMGW8bdEZfjhujFqMDeCAE8QNrLZXu/6rkzx/HKxcK
	R3OT5UtO5inBkkwCfy/cd1ZQr2kaTwsl/jbYDKMZN7yJInhGxqyu5dmlWzhkhB/0P7L4sGU3TlkIr
	diHsYgHQ==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGuN-00000007e39-37JZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:50:57 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSKSP59dCz9sfw;
	Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCoeXJoTf93q; Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSKSP3td4z9sfv;
	Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D0C28B775;
	Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qRoFWfinmY1o; Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B16A98B767;
	Thu, 18 Sep 2025 17:34:28 +0200 (CEST)
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
Subject: [PATCH RESEND v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of interrupts
Date: Thu, 18 Sep 2025 17:34:07 +0200
Message-ID: <cover.1758209158.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758209656; l=2459; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Rw14QDBJonb5u5+cR6dROagBvXa3A1OgDpRn/q0SkpI=; b=2JOfAbtKY5oOgf9Q0u+gokAxci8wOnFAoh+mIaShgDQVavxJparyog9AWj22aslzf1HGZl38O HWCFs/nJPimDCioJkfe41o2WfF9P+cnlWCmlzbTpSKe9iPPewKLyxEu
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_165056_003157_47029A07 
X-CRM114-Status: GOOD (  11.57  )
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

This is a RESEND of v3 sent one month ago, see:
https://lore.kernel.org/all/cover.1754993232.git.christophe.leroy@csgroup.eu/

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


