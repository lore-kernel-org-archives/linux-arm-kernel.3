Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6C7C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xGXQ19jz5gBhAI7zA5nQj//6n0DPmJeqF13kJfmQqo=; b=Kn1Acj2P2wXTgMJlHvjXVB0Wq6
	mB3oif2Vhk04IdpyC2Oiha/1Uv9Hxk3lRunFSXIjt5ss82aeMSrzsUIHtB5A1Pzso0UgjgJFiZx/L
	Tibul5faEvIQFCD/0Yu3/LLghhKqHnz2Z6oZfMXfrRr5KqxtnZ9VE8Er+05FANlu38IbxmcCkKHrM
	NwuRqnsBNHLLfnFHhn3sDHbnXHwW0XoB9ZCQuBuK0M6RPIUgxKcSs0ViA6srjdqzAEqcF+uIIOIZx
	0ezwph9EXP/e7s0uYoEt6zoYhepPPqypyUbKSNVL6QuES3Hqq4N3FhywZ04xIznE2pCDDpIXhqMED
	oNiXQXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVr9-00000009kwH-1OMy;
	Wed, 25 Jun 2025 19:32:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURjQ-000000094L9-1Q4b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 15:08:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CAC9A52B62;
	Wed, 25 Jun 2025 15:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D85C4CEEA;
	Wed, 25 Jun 2025 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864091;
	bh=2gBptdzqxqqhgORGmH4ar6orPA4C1xLI0BROKOAbAXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1rWhMDmtU7pLN+ccNfJuhEK6e5nNYS1fqurneQ5iWjVcl7LJp8AhWo1AbsSBYP/Z
	 alaPl520BQs1yqudvJdaANJeTJlJEoA8VhUE9OLs0irB1mhcbkxDt8O53vJNrVUa6t
	 3VRVyIKCiQyrovz7ApexspI1f3uLTFGYF6fd/p0GaQE/F3Tjm31tzma3OA0uAk0iG1
	 09TOSfa7jDn1DhSt/CrIPICqXqiP02PXTRjanePiTxpMiV2Br7FYAyBRpLJxIfOHaz
	 qAViaEpgY8YGy+I5iQjFyrONfOw7qeZVWzGC8if1BwUyvEAGcR587AC9/7jrDgolhV
	 pHe+0hwHNuz3Q==
Date: Wed, 25 Jun 2025 18:08:07 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Naveen N Rao <naveen@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>, linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v6 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <aFwQ129i_HYzG3aY@kernel.org>
References: <20250620130810.99069-1-sgarzare@redhat.com>
 <20250620130810.99069-5-sgarzare@redhat.com>
 <aFvlaY0BNjaGxU1D@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvlaY0BNjaGxU1D@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_080812_516297_2929DCAA 
X-CRM114-Status: GOOD (  32.44  )
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

On Wed, Jun 25, 2025 at 03:02:54PM +0300, Jarkko Sakkinen wrote:
> On Fri, Jun 20, 2025 at 03:08:10PM +0200, Stefano Garzarella wrote:
> > From: Stefano Garzarella <sgarzare@redhat.com>
> > 
> > This driver does not support interrupts, and receiving the response is
> > synchronous with sending the command.
> > 
> > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > ->send() already fills the provided buffer with a response, and ->recv()
> > is not implemented.
> > 
> > Keep using the same pre-allocated buffer to avoid having to allocate
> > it for each command. We need the buffer to have the header required by
> > the SVSM protocol and the command contiguous in memory.
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > v5:
> > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > v4:
> > - reworked commit description [Jarkko]
> > ---
> >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> >  1 file changed, 11 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > index 0847cbf450b4..f5ba0f64850b 100644
> > --- a/drivers/char/tpm/tpm_svsm.c
> > +++ b/drivers/char/tpm/tpm_svsm.c
> > @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
> >  };
> >  
> >  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> > -			 size_t len)
> > +			 size_t cmd_len)
> >  {
> >  	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> >  	int ret;
> >  
> > -	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > +	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
> >  	if (ret)
> >  		return ret;
> >  
> >  	/*
> >  	 * The SVSM call uses the same buffer for the command and for the
> > -	 * response, so after this call, the buffer will contain the response
> > -	 * that can be used by .recv() op.
> > +	 * response, so after this call, the buffer will contain the response.
> > +	 *
> > +	 * Note: we have to use an internal buffer because the device in SVSM
> > +	 * expects the svsm_vtpm header + data to be physically contiguous.
> >  	 */
> > -	return snp_svsm_vtpm_send_command(priv->buffer);
> > -}
> > -
> > -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > -{
> > -	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > +	ret = snp_svsm_vtpm_send_command(priv->buffer);
> > +	if (ret)
> > +		return ret;
> >  
> > -	/*
> > -	 * The internal buffer contains the response after we send the command
> > -	 * to SVSM.
> > -	 */
> > -	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
> >  }
> >  
> >  static struct tpm_class_ops tpm_chip_ops = {
> >  	.flags = TPM_OPS_AUTO_STARTUP,
> > -	.recv = tpm_svsm_recv,
> >  	.send = tpm_svsm_send,
> >  };
> >  
> > @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
> >  
> >  	dev_set_drvdata(&chip->dev, priv);
> >  
> > +	chip->flags |= TPM_CHIP_FLAG_SYNC;
> >  	err = tpm2_probe(chip);
> >  	if (err)
> >  		return err;
> > -- 
> > 2.49.0
> > 
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied.

BR, Jarkko

