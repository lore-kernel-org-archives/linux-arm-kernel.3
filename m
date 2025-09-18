Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ACACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oNy9QkuVfOzMkFgXo7Ye5EoocJCEZK9za4vo0VAhr0=; b=Ek/pFkLG7fc+cuhT/TwO3GuLal
	AfgY8DQ9oskqXiVsOzx7mL4oHycexgOzxJS8ReBDlV4qo0T73qmlVzpeleKcdFdspWc/2zdTvfair
	iXG7Cq73aJ45VQungZYJLj0/Ksj8bc2FqUQhAHcZ4UROPKLmTz3T0272+thZ1dqI2c2sFPLCeuD3a
	hvUQ26VRwfA+X99pIR89spC63XoudxzscOWX9ePgGfQHQPBg9A2N2gKb0CxxC/SFOc0N0ze/Hxkub
	PPlTMtF0Em+7B1urdwJCiUfeNS7TJyqVyG6eyF8GcfjK1MmIRn4DeRIgih4Xc+bFaVUUXOM/DVkGk
	pG3GU3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHqj-00000000gt2-10qV;
	Thu, 18 Sep 2025 16:51:13 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHqg-00000000gqO-3to1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:51:12 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLsR0SvSz9sgS;
	Thu, 18 Sep 2025 18:37:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-Hjp8AA_eSf; Thu, 18 Sep 2025 18:37:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLsQ6Hsnz9sgR;
	Thu, 18 Sep 2025 18:37:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C0B908B776;
	Thu, 18 Sep 2025 18:37:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OohEcxeSfQe1; Thu, 18 Sep 2025 18:37:46 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EFF928B767;
	Thu, 18 Sep 2025 18:37:45 +0200 (CEST)
Message-ID: <bad14e16-0d1c-411a-8b3d-89d8df05b9b5@csgroup.eu>
Date: Thu, 18 Sep 2025 18:37:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of
 interrupts
To: Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <cover.1758209158.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <cover.1758209158.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_095111_153167_338246BD 
X-CRM114-Status: GOOD (  20.77  )
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



Le 18/09/2025 à 17:34, Christophe Leroy a écrit :
> This is a RESEND of v3 sent one month ago, see:
> https://lore.kernel.org/all/cover.1754993232.git.christophe.leroy@csgroup.eu/

Sorry for the noise, v3 was 
https://lore.kernel.org/all/cover.1755504428.git.christophe.leroy@csgroup.eu/
The resent is correct though, only this reference in the cover is wrong.

Christophe

> 
> This series reduces significantly the amount of interrupts on
> fsl_qmc_audio device.
> 
> Patches 1 and 2 are preparatory patches.
> Patch 3 is the main change
> Patch 4 is a cleanup which is enabled by previous patch
> 
> Changes in v3:
> - Properly check the buffer descriptor is unused (Patch 1, comment from Herve Codina)
> - Fixed copy/paste error (patch 2, comment from Herve Codina)
> - Fixed build failure (patch 2, comment from Herve Codina and Test robot)
> 
> Changes in v2:
> - Don't remove UB bit (Patch 1, comment from Herve Codina)
> - Make sure audio channels are ordered on TDM bus (Patch 2, new patch, comment from Herve Codina)
> - Drop struct qmc_dai_chan  (patch 4, new patch)
> 
> Backgroup (copied from patch 3):
> 
> In non-interleaved mode, several QMC channels are used in sync.
> More details can be found in commit 188d9cae5438 ("ASoC: fsl:
> fsl_qmc_audio: Add support for non-interleaved mode.")
> At the time being, an interrupt is requested on each channel to
> perform capture/playback completion, allthough the completion is
> really performed only once all channels have completed their work.
> 
> This leads to a lot more interrupts than really needed. Looking at
> /proc/interrupts shows ~3800 interrupts per second when using
> 4 capture and 4 playback devices with 5ms periods while
> only 1600 (200 x 4 + 200 x 4) periods are processed during one second.
> 
> The QMC channels work in sync, the one started first is the one
> finishing first and the one started last is the one finishing last,
> so when the last one finishes it is guaranteed that the other ones are
> finished as well. Therefore only request completion processing on the
> last QMC channel.
> 
> On my board with the above exemple, on a kernel started with
> 'threadirqs' option, the QMC irq thread uses 16% CPU time with this
> patch while it uses 26% CPU time without this patch.
> 
> Christophe Leroy (4):
>    soc: fsl: qmc: Only set completion interrupt when needed
>    ASoc: fsl: fsl_qmc_audio: Ensure audio channels are ordered in TDM bus
>    ASoC: fsl: fsl_qmc_audio: Only request completion on last channel
>    ASoc: fsl: fsl_qmc_audio: Drop struct qmc_dai_chan
> 
>   drivers/soc/fsl/qe/qmc.c      |  44 +++++++++---
>   sound/soc/fsl/fsl_qmc_audio.c | 125 +++++++++++++++-------------------
>   2 files changed, 87 insertions(+), 82 deletions(-)
> 


