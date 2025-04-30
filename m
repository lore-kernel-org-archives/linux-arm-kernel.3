Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088D5C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgocyTvxZfhULZGwGvCgXkcqLIHnxY9W7xUsWeiydkY=; b=b+UNisVFbzB0XhmHrKnwVT++M0
	xNmIpdiXz0Q+rcJgi/YL1X2dnBZAGmZ7yj1LYRkxXR6SWvXMPhFRDxEI2ph8tFCZX35UTUYvWRynA
	HIeRITxLuJ92p587i2fpuH78l58Spar8tr3DrWimbeDig8enRS9XCwhabAyTuK/hkq6OrJix/8S/r
	0xQ29HiANsx8qvIrBS9QJRTT4jGqnveKvKgcb0km0A1VeD4h5481hw9o2WeFglhcbEjtI8G456UcU
	EgI1f15kpDK1VyGdO3wQIR3ObxW/p1O/72rsoIqPlWw6kqSYcAyllyw9e4UTAtphKZBrA7KVQdhxj
	vsUwc6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9uh-0000000DMck-1T7F;
	Wed, 30 Apr 2025 16:03:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9gt-0000000DKyB-1HBw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 15:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A83126842A;
	Wed, 30 Apr 2025 15:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB48DC4CEE7;
	Wed, 30 Apr 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746028182;
	bh=jbN75Y77ia3DaPmLil5WAcGzaZgfrTs67v8JYHeLyFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILkRzJmxPdFObsI9MPCYwxX97C4pY7WZMUG69FkF2voL4XquCgdJqXarl/qXSmdsT
	 lIE+AMd4Db+DvmeQIlqNoL1xbfIFeUiYZIWEMhbbxTe6T82fBtJQVkcfuwBWzs9vnZ
	 2v1VvzarKWKk6kHsUF7YLUq8XDSco1Hy7lT0Owon3EWnk74hfL0VsyDxC1CugjAZrz
	 0KhAuvpzMf2pXyQG4H3hQtLNkWpqyEAMtY8aiDijMy3p5zSKqi5zD7Nsuw/CecffIl
	 Y+CFLFQ5Ck/om6P0AA0xzbTrnH45tDY2ptwuSj3T2Ag4pWXq1iPlboUxdMmHpjZus1
	 pT5EdHo2bLaXg==
Date: Wed, 30 Apr 2025 18:49:37 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <aBJGkSil1YAzSXsg@kernel.org>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-5-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414145653.239081-5-sgarzare@redhat.com>
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

On Mon, Apr 14, 2025 at 04:56:53PM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> This driver does not support interrupts, and receiving the response is
> synchronous with sending the command.
> 
> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
> return responses in the same buffer used for commands. This way we
> don't need to implement recv() op.
> 
> Keep using the same pre-allocated buffer to avoid having to allocate
> it for each command. We need the buffer to have the header required by
> the SVSM protocol and the command contiguous in memory.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Similar comments, and a bit redundancy does not matter i.e., they can
have pretty much the same explanation.

> ---
>  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> index d3ca5615b6f7..db1983072345 100644
> --- a/drivers/char/tpm/tpm_svsm.c
> +++ b/drivers/char/tpm/tpm_svsm.c
> @@ -25,38 +25,32 @@ struct tpm_svsm_priv {
>  	void *buffer;
>  };
>  
> -static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>  			 size_t buf_size)
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
> +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, buf_size);
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

BR, Jarkko

