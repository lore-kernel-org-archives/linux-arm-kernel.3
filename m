Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE92C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 01:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsGnrEn9gDYqprrXQ+yC+gSzutDgzHnWlYhqJih3kAI=; b=at61QdDHS+9J067k/ik8kOMESn
	zwA7y9qIoAE6Grjediw/DibIjqr6mt5QV0CSuDnwWSSTEInbPWx99VcXh0lNTsL8Bw2Uxhj0wQ9WD
	VV7yriP/lvwojt8BzSUn/wZd8G/byBSJJhGF+YcNn5VO9y9ErxH7Z2VA5gyND2BlfG2EfUYSBwf50
	BH2YfNO2DlVGS+4aMxGaTVa3qqLW6I8KYhMxrXT/+rnph7CqdL8CsjlSUb5OD0qrarzYQbBcrHqJS
	2HQQKrdw1Hd/PdvZTmP6HhHuZONZ7rFQKH/l2L2EtgzjAkWShdRxDtCHOqtuVbqnxY521/M63T0o2
	pOm0IWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFNhQ-0000000GnVA-2ymA;
	Thu, 15 May 2025 01:47:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFNfM-0000000GnJL-0kAA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 01:45:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DB00629E4;
	Thu, 15 May 2025 01:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AEEC4CEE3;
	Thu, 15 May 2025 01:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747273542;
	bh=pnNBST+c9YzDalNQ25GoKXrq/N4ZaCLn+kBAH2QlzYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNc4tPUliPhaLP8MScTBz9lzD/DbFYbrmeQrGDWpJqBK+OQTnINZVdKbioHL6ZlaG
	 7B0bXpM5nFKBFsjTFtIARi8xIxPPdsGvR8QSEjkD0LDsPK7paj3VIDwNhiy8qLmeS2
	 Q4vSfcc1Q/MFQqHCSTZoL1YNd65JA6kq/y1Q4LlKsawjEVMBJatGqzWHgfCc0MW7Zm
	 8aNhLfenXAcGTnLGqlfUzpCqVjZ+e8uT3pusUg7EVriHSdUSomg0SBSri09+p3jmmA
	 eO5c/aiw0dn9R0/3bGlvru/Yo86J8ScWuzWm/R7NXvtQsxml1nU8VoDc2tJu0iKAur
	 xuSFgNziuESLA==
Date: Thu, 15 May 2025 04:45:39 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <aCVHQ-LRqHeEVEAW@kernel.org>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-5-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514134630.137621-5-sgarzare@redhat.com>
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

On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> This driver does not support interrupts, and receiving the response is
> synchronous with sending the command.
> 
> Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> ->send() already fills the provided buffer with a response, and ->recv()
> is not implemented.
> 
> Keep using the same pre-allocated buffer to avoid having to allocate
> it for each command. We need the buffer to have the header required by
> the SVSM protocol and the command contiguous in memory.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v5:
> - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> v4:
> - reworked commit description [Jarkko]
> ---
>  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> index 0847cbf450b4..f5ba0f64850b 100644
> --- a/drivers/char/tpm/tpm_svsm.c
> +++ b/drivers/char/tpm/tpm_svsm.c
> @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
>  };
>  
>  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> -			 size_t len)
> +			 size_t cmd_len)
>  {
>  	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>  	int ret;
>  
> -	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> +	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
>  	if (ret)
>  		return ret;
>  
>  	/*
>  	 * The SVSM call uses the same buffer for the command and for the
> -	 * response, so after this call, the buffer will contain the response
> -	 * that can be used by .recv() op.
> +	 * response, so after this call, the buffer will contain the response.
> +	 *
> +	 * Note: we have to use an internal buffer because the device in SVSM
> +	 * expects the svsm_vtpm header + data to be physically contiguous.
>  	 */
> -	return snp_svsm_vtpm_send_command(priv->buffer);
> -}
> -
> -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> -{
> -	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> +	ret = snp_svsm_vtpm_send_command(priv->buffer);
> +	if (ret)
> +		return ret;
>  
> -	/*
> -	 * The internal buffer contains the response after we send the command
> -	 * to SVSM.
> -	 */
> -	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
>  }
>  
>  static struct tpm_class_ops tpm_chip_ops = {
>  	.flags = TPM_OPS_AUTO_STARTUP,
> -	.recv = tpm_svsm_recv,
>  	.send = tpm_svsm_send,
>  };
>  
> @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(&chip->dev, priv);
>  
> +	chip->flags |= TPM_CHIP_FLAG_SYNC;
>  	err = tpm2_probe(chip);
>  	if (err)
>  		return err;
> -- 
> 2.49.0
> 
> 

I can pick this for 6.16.

BR, Jarkko

BR, Jarkko

