Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82843C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qKN4rcMkZyGCX8XvOvygZxM5y/hTbCtdBvJbeKgTB4=; b=ixUMs0KBH0Ni1fo/ZwB8H9cZuh
	gNJ0dUKxcBYfaPgXAj7jxcjgYwB3tueWMtF9COruQnXQRvcRC3KMnNlj9SUVOskFpviyQHU4N4O77
	LTlDy/8EnCu2FjoWkg8ZGrTkGMmFO0N5UpVrm1VI3PTNO4LyQvOWEVrAwu96D2Y5sCtkZbm+FxZ3P
	V8oplv2VH5j7Hqz5/p88lkl8eV+hGyV5PJGUjlx6xP1cMZuwdADjyz+L67BLgAlSjqOeXDQS01a8v
	YPpOaxQZG+wR4INrIIldi6UQ215GsEShTQgJeUVyj9OEzo8uqblDowXEtv3nQRVthsLGonBGOmFG/
	rtpwe2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJuK-0000000358b-37dD;
	Fri, 09 May 2025 09:20:40 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJMd-00000002yE8-4Ako
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:45:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74B371FD43;
	Fri,  9 May 2025 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746780347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0qKN4rcMkZyGCX8XvOvygZxM5y/hTbCtdBvJbeKgTB4=;
	b=cOHZqeymm9ZgzCZmj58TugZ51D+kzOeMr47BCZpyyd7httlGre+CvkkjTvon4+p64CgU7F
	A4sqSybPbWx8I8K1hMn7kC+HsJT/1DYOuPu8e2siOhsSWvG4TbuwBggpaIu8/T2G3YNEOG
	mJ6sBVwGwb4iPN6en5RkaRTNb5Ms8DCFxyeI9JvMicnAIOufKSUHFmaf8XET0DC3ZxIiAM
	hZS1Tm+QzFGhyOnM02Q0GqrAVawPbZHwvd7GA+pmbx+ZrD1LZYovJaMoFtreV/zhVVHy1f
	3h3YaPrSHWDvIVr/SDMMCmYETVdd7j/Tv3yc/ai04RwPJ12CMNNKiutLhqqtoQ==
Date: Fri, 9 May 2025 10:45:44 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: fsl: fsl_qmc_audio: Only request completion
 on last channel
Message-ID: <20250509104544.5c375f05@bootlin.com>
In-Reply-To: <5cffeb220617584a5e4bc03067cc10e6cdcfc25e.1746776731.git.christophe.leroy@csgroup.eu>
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
	<5cffeb220617584a5e4bc03067cc10e6cdcfc25e.1746776731.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhopegiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhto
 hepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_014552_183552_5F3A006E 
X-CRM114-Status: GOOD (  17.39  )
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

On Fri,  9 May 2025 09:48:45 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

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

How can we be sure about that?

The mapping on the TDM bus has to be taken into account.

chan 0 -> TDM bits 0..8
chan 1 -> TDM bits 16..23
chan 2 -> TDM bits 9..15

In that case chan 1 can finish after chan 2.

qmc_chan_get_ts_info() could be used to get struct qmc_chan_ts_info
and [rx,tx]_ts_mask field in the struct give the mapping information.

The channel that ends last is the one with the highest bit set in the
mask (rx_tx_mask for capture and tx_ts_mask for playback).

Best regards,
Hervé

> so when the last one finishes it is guaranteed that the other ones are
> finished as well. Therefore, only request completion processing on the
> last QMC channel.
> 
> On my board with the above exemple, on a kernel started with
> 'threadirqs' option, the QMC irq thread uses 16% CPU time with this
> patch while it uses 26% CPU time without this patch.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

