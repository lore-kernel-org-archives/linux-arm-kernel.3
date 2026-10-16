Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9967DCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9PqAftbpeH+QRKyPz6wwtPDn0fXOorqY8rQmBmMmdYk=; b=w/WX3UMqQ11fiM6D+DJMThZx0S
	sR57vI68mzamXxjFxsNGK5MwweO866/qSZZoFnqGuTz/jkHUlaXJrmsbyaK3ceHJ4ro6nDjYEogJQ
	sNzM8T8cL1BwN+He5ndU0mNxzxQrw6gOaCRibeA18dwCUMmbpMDh+HSq9WCwMUXhYGlLUlkzjtugw
	spUf3n+XLU8fWUjl4bMAEPUVgLc7Db3kzjDQqeim7PIICFJbILQAWVlu7F5lMcZYsxPJG8B1lSHSZ
	Tr9qCMo06bC5CJW/LU83KnOH2PiOGG24z1PtqVtLFGe5K5E9VNrh2Ov/MLaFo/VrXABxjPzBFaymN
	i8quPrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd5J-00000002IwE-0wX0;
	Fri, 16 Oct 2026 08:14:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd5C-00000002Isf-46VH;
	Fri, 16 Oct 2026 08:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1772560008;
	Fri, 16 Oct 2026 08:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B700FC2BCF4;
	Fri, 16 Oct 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792138469;
	bh=TIwHNW4PKjIUENLKJlEq6MQ/g15eZ57FFIrXUXpNPNY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=a2ENNNE9zHptB0vZm6GiiH8pBP4NFrnCeacgqhgWFfZPYeyCjew3310uBW17aPoG9
	 xPrv/hg3w4G4pZjAsb8TYIEX0kbqDcKmh24t8Crdxp9w2wDsZUv6oY00PFlHCB/oo+
	 PEUrUNFswfEfX7YHZr3kAdvLZ02ZEeX2nq6Ko3J74vGeFBrbUANahNPdcq3XM6Myvi
	 1mQnO3vR2pcjJ6+YAmtkSVK14kydPrgJ7CfuFkynS5TfGxybYQjQihhhbItbDRtfIU
	 TW6KX96CUQ+ecI37eXfdybC+gTOMwcJqNG4Dsfl2kcHmtMOmczfSnPZpocBxLGmf+I
	 hbz82jMoONHPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922C7CCA464;
	Fri, 16 Oct 2026 08:14:29 +0000 (UTC)
From: HuskerMinion via B4 Relay <devnull+mocker-mug-unwoven.duck.com@kernel.org>
Subject: [PATCH 0/2] ASoC: mediatek: mt8183: Two AFE fixes
Date: Fri, 16 Oct 2026 02:14:00 -0600
Message-Id: <20261016-mt8183-afe-fixes-v1-0-f0db51e0c073@duck.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjc0WoC/yXM0QqCQBCF4VeRuW5gR7fQXiW60PVsjaDFjkUg+
 +5udflx+M9GhqQwOlcbJbzV9LEUyKGicO+XG1jHYqpdfRInR57XVtqG+wiO+oFx54HOS2ji6Kh
 kz4TfUKrL9W97DRPC+v2hnHfmLnv1dAAAAA==
X-Change-ID: 20261015-mt8183-afe-fixes-94ee941c3fd0
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, HuskerMinion <mocker-mug-unwoven@duck.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792138468; l=1641;
 i=mocker-mug-unwoven@duck.com; s=20261016; h=from:subject:message-id;
 bh=TIwHNW4PKjIUENLKJlEq6MQ/g15eZ57FFIrXUXpNPNY=;
 b=0srufWCkTX4PIs/durVAuh0yWhA93Eqq1o4UAZfY1ZVUtyTvHkL7wVZY/k4qH8l0xfn9SYVb9
 NpxhO4RuS75DMgdhPCeNsf7obXTWW2LoPgWcmwSro8JxE2AezOxRG+u
X-Developer-Key: i=mocker-mug-unwoven@duck.com; a=ed25519;
 pk=Q7l9BnP4XnFimCK28K+NVowcECqTaJNXicdBAInot0k=
X-Endpoint-Received: by B4 Relay for mocker-mug-unwoven@duck.com/20261016
 with auth_id=1206
X-Original-From: HuskerMinion <mocker-mug-unwoven@duck.com>
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
Reply-To: mocker-mug-unwoven@duck.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

These two fixes came up while bringing up mainline Linux on the Amazon
Echo Show 8 (2nd gen), an MT8183 board.

Patch 1 is the important one. On this board the AFE never ran. Runtime
resume enabled the audiosys clock gates while the regmap was still
cache-only, so the gate writes were dropped. With the fix, playback and
capture work on the device.

Patch 2 fixes a wrong register in the UL1_CH2 mixer. I found it while
adding capture routes for the device's microphones. The Echo Show does
not use I2S0, so that path is compile tested only.

I do not know why MT8183 Chromebooks do not seem to hit this. I have no
Chromebook to test on. My guess is that something else keeps the gates
open there, but I have not confirmed it.

Patch 1 was tested on the device with a 6.18 based kernel. Both were
then rebased onto for-next and build tested there.

Runtime suspend has the mirror problem. It goes cache-only before
mt8183_afe_disable_clock(), so those gate writes are dropped as well
and the gates stay open after the first use. I left that alone because
I have not tested a change there. I can send a patch if you want it
handled the same way.

---
HuskerMinion (2):
      ASoC: mediatek: mt8183: Leave cache-only mode before enabling clocks
      ASoC: mediatek: mt8183: Fix UL1_CH2 I2S0_CH2 routing register

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)
---
base-commit: 764db7a068919c9e3d4618731dd854df43070399
change-id: 20261015-mt8183-afe-fixes-94ee941c3fd0

Best regards,
--  
HuskerMinion <mocker-mug-unwoven@duck.com>



