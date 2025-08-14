Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3D7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5tAIsgzKuRELv1sm6eESXsPqoZSkkSUqkB2pMeL970=; b=z3VqKY07b1297pyU2BUaAi3xEn
	lOv0+sfhbkczLs490u1Uf2rShsMdWaWzv23diBq+Qfrg4Duuqsc1MYoxIesbCpC9TQz/eF8XcTKwK
	TVRcXcsQ3RV4bkylRliBl4Oqq8zSMsizGj+I1eSEM87U9j5rVx8/R8eJW0OWr6UrnWQRBfyxalODF
	VZjZFmqNQ3y9w3Jn2ojKiFBlKXHnJnCMMun6rZRjNewfVDX+TIVaSxvjoPno6pOAWfnrUErYySU0M
	Ilshm80DpvUh7LQQm49MZUH4zKvZPyy2P6k9TAOPifwOs1Rv2riR0L6I20rzzHjvWqhcKumMswyVw
	xLmwOXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSio-0000000G9BT-0MGy;
	Thu, 14 Aug 2025 07:50:02 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSU3-0000000G6Lp-0tO3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 07:34:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0215444500;
	Thu, 14 Aug 2025 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755156884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f5tAIsgzKuRELv1sm6eESXsPqoZSkkSUqkB2pMeL970=;
	b=RnS1aIBf3kPuNafBPr5O0T08jAPqeQ5PpdRcHNBXts4N2l7FzWgxEa6s2MzTJsWNvgoeJD
	rs8+UoZ/6KX/KVJx9TlJiusbzmgArqHlVRGeCLaSbEsBCU2HRcAMZ2Q5Qi8yQ9qqHxhaCY
	NQmY9HLvJ6a0YwkT+bGet4Q8QyI+Aj8y1e8qwovE6YeuPE7LJBJLThkwFB6wDIv/q3vUa2
	Y6BOmIXrewaucYGADm1kHYF/XC7OeNePDcd/Dn60VHLbxJgrXLJgPXdpZzOpr47yx6UAcQ
	3j7sr1Ocv7R9ogaltf0elyZxx3zqzbvSGBpnFIRzpAzDqPD8sZmkYmLXX95ChA==
Date: Thu, 14 Aug 2025 09:34:43 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: fsl: qmc: Only set completion interrupt
 when needed
Message-ID: <20250814093443.1506b49f@bootlin.com>
In-Reply-To: <20250813120651.27dc8467@bootlin.com>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
	<badb68a85910e5e6f1094ef3b01805209ac21854.1754993232.git.christophe.leroy@csgroup.eu>
	<20250813120651.27dc8467@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemtggstdekmeelkeeltgemkedttddtmehfugekudemleehgegvmedvudehrgemfeeluddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtkeemleeklegtmeektddttdemfhgukedumeelheegvgemvdduhegrmeefledutddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhop
 egiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_003447_989600_B525FF32 
X-CRM114-Status: GOOD (  26.36  )
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

On Wed, 13 Aug 2025 12:06:51 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Christophe,
> 
> On Tue, 12 Aug 2025 12:50:55 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
> > When no post-completion processing is expected, don't waste time
> > handling useless interrupts.
> > 
> > Only set QMC_BD_[R/T]X_I when a completion function is passed in,
> > and perform seamless completion on submit for interruptless buffers.
> > 
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> > v2: Keep the UB flag to mark not completed buffers and seamlessly flag them as completed during next submit.
> > ---
> >  drivers/soc/fsl/qe/qmc.c | 44 ++++++++++++++++++++++++++++++----------
> >  1 file changed, 33 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> > index 36c0ccc06151f..8f76b9a5e385d 100644
> > --- a/drivers/soc/fsl/qe/qmc.c
> > +++ b/drivers/soc/fsl/qe/qmc.c
> > @@ -461,9 +461,16 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
> >  
> >  	ctrl = qmc_read16(&bd->cbd_sc);
> >  	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
> > -		/* We are full ... */
> > -		ret = -EBUSY;
> > -		goto end;
> > +		if (!(ctrl & QMC_BD_TX_I) && bd == chan->txbd_done) {
> > +			if (ctrl & QMC_BD_TX_W)
> > +				chan->txbd_done = chan->txbds;
> > +			else
> > +				chan->txbd_done++;
> > +		} else {
> > +			/* We are full ... */
> > +			ret = -EBUSY;
> > +			goto end;
> > +		}
> >  	}
> >  
> >  	qmc_write16(&bd->cbd_datlen, length);
> > @@ -475,6 +482,10 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
> >  
> >  	/* Activate the descriptor */
> >  	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
> > +	if (complete)
> > +		ctrl |= QMC_BD_TX_I;
> > +	else
> > +		ctrl &= ~QMC_BD_TX_I;
> >  	wmb(); /* Be sure to flush the descriptor before control update */
> >  	qmc_write16(&bd->cbd_sc, ctrl);
> >    
> 
> You try to purge one descriptor for which the transfer is done but you do that
> when you have no more free descriptors.
> 
> You end up with all descriptor "used". I think a better way to do that is
> to purge all "done" descriptor configured to work without interrupts until a
> descriptor with interrupt is found.

I have looked again at your code and looking for a free descriptor only when it
is needed is sufficient. You can forget my previous proposal.

Back to your code, I think you need to be sure that the descriptor you want to
re-use is really available and so you need to check the 'R' bit to be sure
that we are not with 'R' = 1 and 'UB' = 1 which means "BD is used, waiting for
a transfer".

For instance:

	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
		if (!(ctrl & (QMC_BD_TX_I | QMC_BD_TX_R) &&
		    bd == chan->txbd_done) {
			if (ctrl & QMC_BD_TX_W)
				chan->txbd_done = chan->txbds;
			else
				chan->txbd_done++;
		} else {
			/* We are full ... */
			ret = -EBUSY;
			goto end;
		}
	}

Best regards,
Hervé

