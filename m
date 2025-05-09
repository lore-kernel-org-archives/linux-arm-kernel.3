Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CC9C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOMW9BGxskbhad6mlU+Himy6oHmyXjwahxXAzW3WdCk=; b=FuBqANvDv2p6XC/+Cipxu7zmxS
	ICkELNQQDn6w12H64PrPhtElnvv9a8eBAEakvvXEVVPMl96sBNlg5JaE45RMxrpknOAlPE0tHY2Lw
	zD8vaoqgRQrTvmM3vYTcszPCDEvHKTzW2D2XC8+Gd9yJjOm1gqIwW92mGAuTTZmqBaY+V8WflXN5m
	LRYVo10LN1SCPnurFDYSifP4o4hBgaVwztYXTU7WN6HtkBhKc7KEx8xz7Y2yFR1rfL+F1QcS/6K4O
	l6YBpDw/6XIQwE+0VqKasXsJ2kw4/rooYuC4R41AbPyLs/Jjf61Ztw+dRhWafbXnYJBsgeT74ma3K
	pNTPHP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKX9-00000003Bni-2L25;
	Fri, 09 May 2025 10:00:47 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJpm-000000034El-03DE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:15:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07CAE1FD43;
	Fri,  9 May 2025 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746782155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOMW9BGxskbhad6mlU+Himy6oHmyXjwahxXAzW3WdCk=;
	b=A49+jEYE7WBREA5b6YXFMHfgJgHIHEfZyMK/RNX+suNhPAOLzF5+ZiOY9VjEJNSMYeaD2Y
	MrnyIbfXfo5AU1P/osyUWAzpu3oBNbTlJjbZ/T4DNgoboLXfJnwYLb94aKzyQcE92u7PwO
	MxY7uBU7wLo9mKHJ7ykciVIv9HjzTHlMpHoPSOS+J61W/2Bng8ecZy4/tEJavqMtWveEFm
	pVhdjm1YJzBBVR7R2MpYwhF4mh+Vp7E7Yn9maafTTpzVxqA7CFWvg6+45chPVUEGbF0rfK
	ATf0366ofRqxq3v87RGphfqb8PJX9dkrxtXdpD7U2pbjx/3P5Kp0+w4cAJqQUA==
Date: Fri, 9 May 2025 11:15:54 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: fsl: qmc: Only set completion interrupt when
 needed
Message-ID: <20250509111554.770263b7@bootlin.com>
In-Reply-To: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefflefhieduteegffeifeeggfffvdeuvdeutddvfeduudeukeffleehheffkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhopegiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtv
 ghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_021558_193974_272112D7 
X-CRM114-Status: GOOD (  19.16  )
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

On Fri,  9 May 2025 09:48:44 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> When no post-completion processing is expected, don't waste time
> handling useless interrupts.
> 
> Only set QMC_BD_[R/T]X_I and QMC_BD_[R/T]X_UB when a completion
> function is passed in.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/qmc.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 36c0ccc06151..0a704fd0b1a0 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -474,7 +474,9 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>  	xfer_desc->context = context;
>  
>  	/* Activate the descriptor */
> -	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
> +	ctrl |= QMC_BD_TX_R;
> +	if (complete)
> +		ctrl |= QMC_BD_TX_I | QMC_BD_TX_UB;

Be careful, you don't set the UB bit for all descriptor anymore.
Your goal, is to have interrupts only on some descriptors (those where I
bit is set).

This can lead to issue in the function handling the interrupt.
This function, qmc_chan_write_done(), do the processing according to the
following:
        /*
	 * R bit  UB bit
	 *   0       0  : The BD is free
	 *   1       1  : The BD is in used, waiting for transfer
	 *   0       1  : The BD is in used, waiting for completion
	 *   1       0  : Should not append
	 */
https://elixir.bootlin.com/linux/v6.15-rc5/source/drivers/soc/fsl/qe/qmc.c#L507

It considers R=0 / UB=0 as a free BD and R=1 / UB=0 as a case that should
not happen.

Both cases are no more correct with your modification.

Have the feeling that UB bit still has to be set even if I bit is not set
in order to have qmc_chan_write_done() looking at all descriptors.

Suppose:
 desc 0, no interrupt
 desc 1, no interrupt
 desc 2, interrupt

When the interrupt for desc 2 is handled, desc 0 and desc 1 are seen with
R=0 and UB=0. As desc 0 is considered as free by qmc_chan_write_done(), it
will never look at desc 2.

>  	wmb(); /* Be sure to flush the descriptor before control update */
>  	qmc_write16(&bd->cbd_sc, ctrl);
>  
> @@ -586,7 +588,9 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>  		  QMC_BD_RX_AB | QMC_BD_RX_CR);
>  
>  	/* Activate the descriptor */
> -	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
> +	ctrl |= QMC_BD_RX_E;
> +	if (complete)
> +		ctrl |= QMC_BD_RX_I | QMC_BD_RX_UB;

Exact same comment.


Best regards,
Hervé

