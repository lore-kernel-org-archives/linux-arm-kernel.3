Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AA5CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNf5qnROH3zLmofq2B+JFY3WcJC+3yEgDpqycG51sUs=; b=DrR8F9viag1dMoToNCY6dpa3sn
	fQOWynDkECClneLd+4I4EGGuGGH7qazydps5Cs9VdB6Fg+Ulobml8vAUUvDbIGfIP8GgYKshP3Ra7
	+u7UR4BZXaR+4Fm1JKCyQcsZIDjuBHXAqEBCOWTZcjkJvPD8omvy2OmzrP9FifzY/Z7BEuusXUCNo
	fhZ62xY/AxUULTsDhhIYHfIZxJ7MwPsrQA7XNqeF6GtBGTxtz8J8oMbjJJ8rLKSBUWI18aiI+PMLA
	oTp4nD57DuO9V52U79JmderffhdFebt3VzS4xe/UtW25rGB24rpIMeKSnecwAqro3YFVDRc50fg1v
	7RAWMGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz80U-0000000GOw5-424p;
	Thu, 18 Sep 2025 06:20:38 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz80S-0000000GOvc-1FQd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:20:37 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cS4zq5Xdlz9sg0;
	Thu, 18 Sep 2025 08:12:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbE0_hDQWI6h; Thu, 18 Sep 2025 08:12:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cS4zq4ZMvz9sfy;
	Thu, 18 Sep 2025 08:12:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 88BFD8B76C;
	Thu, 18 Sep 2025 08:12:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wUtKhrQoSrmI; Thu, 18 Sep 2025 08:12:23 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C07208B767;
	Thu, 18 Sep 2025 08:12:22 +0200 (CEST)
Message-ID: <3d20d3ec-2f52-4cac-9c5c-fd2141a12a0b@csgroup.eu>
Date: Thu, 18 Sep 2025 08:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of
 interrupts
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-sound@vger.kernel.org,
 Qiang Zhao <qiang.zhao@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <cover.1755504428.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <cover.1755504428.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_232036_499390_70FB51B0 
X-CRM114-Status: GOOD (  21.99  )
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

Hi Mark, Liam,

Le 18/08/2025 à 10:19, Christophe Leroy a écrit :
> This series reduces significantly the amount of interrupts on
> fsl_qmc_audio device.

I can't see this series in linux-next.

I see in patchwork [1] that this series still has status 'NEW' but also 
state 'archived'.

What is the way forward to get it applied for v6.18 ?

Thanks
Christophe

[1] 
https://patchwork.kernel.org/project/alsa-devel/patch/f0c5260651822e8003daf11c7a76921796517152.1755504428.git.christophe.leroy@csgroup.eu/

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


