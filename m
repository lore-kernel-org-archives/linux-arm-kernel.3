Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E04CA0FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9hPN9pLek8IF0I+6c6051btbaPlaupVt0kSjMksl9E=; b=EmM6ImbbtTwO+zR0LfV2DrM4B8
	u4AHzAacbKYLvof47s3Gos1CaiF4Uv5CoYxJ+6lUbVjpmplEYXfdFnQCjofmb1Ythm5heUO2U3pzy
	CED9lnSq2xccUb2yc06REgoyLc6C9wZR5r1iKJKZypB397PVKbE5Z8qHLf79s6yp2C5//fzOvSo+h
	TkISHQ9Qrik0Zm5cbbhso8EJrXZEYdBE9Octq+TEosuQYTGSy5Se8hJpdmEcpRX/dyhvYkZRVcG1K
	VhZQbcGcH3JkmCKEfwG+sf2/6TJkazZX4HC9f1/QMCiROSvhVUFwvkF+kZ5fA/W+rzqGNjpvy30k+
	RbA487rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upF1q-00000000xq5-2MP3;
	Thu, 21 Aug 2025 23:49:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up854-0000000HXFk-0XDM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 16:24:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 14A7D1A09D7;
	Thu, 21 Aug 2025 16:24:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1B22606AF;
	Thu, 21 Aug 2025 16:23:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 753641C22D0B6;
	Thu, 21 Aug 2025 18:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755793438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M9hPN9pLek8IF0I+6c6051btbaPlaupVt0kSjMksl9E=;
	b=hZVY7K6ojOU/EEB23DXOQ9t7qzlwW6bkLJqTMKi2mVtd1GtUUl1BUejOK+xIB4Z91hgtIn
	SgPH80PZaW9YtJZQMnECdXUijVG1jBDCy9MAV9GXrOaEnOA+DDJtuPgvbS25FNuHTS9XdF
	t4Z0eMKcJACXWAF7/y5ZOJqJg7yyzw7Y5+arlecpTfuyn70oue82w06Y8OIryYl3IGD93g
	IbCCney2Usa7F7E3Hyb4NjBgEniK6rhr7dQiQOTU1O6RVpGyAU1OgSkCdux0/HzkfD2ZWl
	dRWHJ88JC+1znMkmuSlFA7gbVLml05m/vKvPcMvLYB1OSjnA7wk105HDE+t6Sg==
Date: Thu, 21 Aug 2025 18:23:54 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels
 are ordered in TDM bus
Message-ID: <20250821182354.5c3b0344@bootlin.com>
In-Reply-To: <fad43df132900d7001fea34a2ee563d819c74015.1755504428.git.christophe.leroy@csgroup.eu>
References: <cover.1755504428.git.christophe.leroy@csgroup.eu>
 <fad43df132900d7001fea34a2ee563d819c74015.1755504428.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_092402_308637_AD58F088 
X-CRM114-Status: GOOD (  11.00  )
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

Hi Christophe,

On Mon, 18 Aug 2025 10:20:01 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> To reduce complexity of interrupt handling in following patch, ensure
> audio channels are configured in the same order as timeslots on the
> TDM bus. If we need a given ordering of audio sources in the audio
> frame, it is possible to re-order codecs on the TDM bus, no need to
> mix up timeslots in channels.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  sound/soc/fsl/fsl_qmc_audio.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

