Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A93C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJAHC65N3NmwEpZPepKmUhmIemjWL2S4onH5DcmQcg4=; b=taSLW5jObsFC5/zcNcmt+dmXEX
	mDcRIzjWkHrJHKgD0BQElJuSjYTPBRls3HZ2fmCVSKA7w8wdGpsXAaEOyn68h/sDkJLs6VimUNUyT
	Om9ZJ+N4USKtBGvpDMbbvnyfu+I5fYI6YQmxHt1LJ8hXsNxwPFWqZGgif5dJoh5xsZbFz4n4rizEb
	+hiB+HmtH5tSwPevtWsg2gbHjsaHp+PY200obE0pEocSzittLjFvCa/zMnQRUFgcflW5bgWrrvIu1
	K/sR0eDsO6j6PpndekSb8Lpm8mQkEkY0JbTEZ0Cf0S5GLOeKGjvOyDNTOzs+t/h6mj43EBANTxwau
	K7FqWYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUT6W-00000009KBX-0mIj;
	Wed, 25 Jun 2025 16:36:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOp5-00000008ZSd-1r4g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:01:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76539611BD;
	Wed, 25 Jun 2025 12:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C823CC4CEEA;
	Wed, 25 Jun 2025 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750852910;
	bh=YuVPG6sgd2zbeT6W9S8Is5S4byHin6+2b/fHWf5TrGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsYcyYefVKaIkeUGQO2ZN933uQdVB4wX8jUEUPzJvxhcRwedmyLrZHiabY4OrAi9h
	 gekz7dmf/pMfHD790VfTNYU/H4UoLxctIywSk5ERIxa58ih9BWpkxV0x0rE1wPLOEr
	 uNyJTvJdq+S50gIk8GTPrz56vX7F6bS049AcNbgCY8HNRxRTUugmPpHlStZ3aOQxQH
	 BPTI7e2xP6jKmYkebaGsbxuhrcZjJYpfKHmRRPU2F1/bqVHNsquv8nLrIETfRhy3pX
	 2zKzLeO6dRu3IGWY8wo1Sx2qGWRV9BNK11xRW6AM9Z/NvK6Y/89cLyRuHI4DbOLvbK
	 JxpILeeyP2pDQ==
Date: Wed, 25 Jun 2025 15:01:46 +0300
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
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Message-ID: <aFvlKs4Mhtw1AZET@kernel.org>
References: <20250620130810.99069-1-sgarzare@redhat.com>
 <20250620130810.99069-4-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620130810.99069-4-sgarzare@redhat.com>
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

On Fri, Jun 20, 2025 at 03:08:09PM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> This driver does not support interrupts, and receiving the response is
> synchronous with sending the command.
> 
> Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> ->send() already fills the provided buffer with a response, and ->recv()
> is not implemented.
> 
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v5:
> - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> v4:
> - added Sumit's R-b
> - reworked commit description [Jarkko]
> v2:
> - set TPM_CHIP_FLAG_SYNC and support it in the new send()
> - removed Jens' T-b
> v1:
> - added Jens' T-b
> ---
>  drivers/char/tpm/tpm_ftpm_tee.h |  4 ---
>  drivers/char/tpm/tpm_ftpm_tee.c | 64 ++++++++++-----------------------
>  2 files changed, 19 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
> index e39903b7ea07..8d5c3f0d2879 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.h
> +++ b/drivers/char/tpm/tpm_ftpm_tee.h
> @@ -22,16 +22,12 @@
>   * struct ftpm_tee_private - fTPM's private data
>   * @chip:     struct tpm_chip instance registered with tpm framework.
>   * @session:  fTPM TA session identifier.
> - * @resp_len: cached response buffer length.
> - * @resp_buf: cached response buffer.
>   * @ctx:      TEE context handler.
>   * @shm:      Memory pool shared with fTPM TA in TEE.
>   */
>  struct ftpm_tee_private {
>  	struct tpm_chip *chip;
>  	u32 session;
> -	size_t resp_len;
> -	u8 resp_buf[MAX_RESPONSE_SIZE];
>  	struct tee_context *ctx;
>  	struct tee_shm *shm;
>  };
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
> index dbad83bf798e..4e63c30aeaf1 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.c
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -31,47 +31,19 @@ static const uuid_t ftpm_ta_uuid =
>  		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
>  
>  /**
> - * ftpm_tee_tpm_op_recv() - retrieve fTPM response.
> - * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h.
> - * @buf:	the buffer to store data.
> - * @count:	the number of bytes to read.
> - *
> - * Return:
> - *	In case of success the number of bytes received.
> - *	On failure, -errno.
> - */
> -static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
> -{
> -	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> -	size_t len;
> -
> -	len = pvt_data->resp_len;
> -	if (count < len) {
> -		dev_err(&chip->dev,
> -			"%s: Invalid size in recv: count=%zd, resp_len=%zd\n",
> -			__func__, count, len);
> -		return -EIO;
> -	}
> -
> -	memcpy(buf, pvt_data->resp_buf, len);
> -	pvt_data->resp_len = 0;
> -
> -	return len;
> -}
> -
> -/**
> - * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory.
> + * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
> + * and retrieve the response.
>   * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
> - * @buf:	the buffer to send.
> + * @buf:	the buffer to send and to store the response.
>   * @bufsiz:	the size of the buffer.
> - * @len:	the number of bytes to send.
> + * @cmd_len:	the number of bytes to send.
>   *
>   * Return:
> - *	In case of success, returns 0.
> + *	In case of success, returns the number of bytes received.
>   *	On failure, -errno
>   */
>  static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> -				size_t len)
> +				size_t cmd_len)
>  {
>  	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
>  	size_t resp_len;
> @@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>  	struct tee_param command_params[4];
>  	struct tee_shm *shm = pvt_data->shm;
>  
> -	if (len > MAX_COMMAND_SIZE) {
> +	if (cmd_len > MAX_COMMAND_SIZE) {
>  		dev_err(&chip->dev,
>  			"%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
> -			__func__, len);
> +			__func__, cmd_len);
>  		return -EIO;
>  	}
>  
>  	memset(&transceive_args, 0, sizeof(transceive_args));
>  	memset(command_params, 0, sizeof(command_params));
> -	pvt_data->resp_len = 0;
>  
>  	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
>  	transceive_args = (struct tee_ioctl_invoke_arg) {
> @@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>  		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
>  		.u.memref = {
>  			.shm = shm,
> -			.size = len,
> +			.size = cmd_len,
>  			.shm_offs = 0,
>  		},
>  	};
> @@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>  		return PTR_ERR(temp_buf);
>  	}
>  	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
> -	memcpy(temp_buf, buf, len);
> +	memcpy(temp_buf, buf, cmd_len);
>  
>  	command_params[1] = (struct tee_param) {
>  		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> @@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>  			__func__, resp_len);
>  		return -EIO;
>  	}
> +	if (resp_len > bufsiz) {
> +		dev_err(&chip->dev,
> +			"%s: resp_len=%zd exceeds bufsiz=%zd\n",
> +			__func__, resp_len, bufsiz);
> +		return -EIO;
> +	}
>  
> -	/* sanity checks look good, cache the response */
> -	memcpy(pvt_data->resp_buf, temp_buf, resp_len);
> -	pvt_data->resp_len = resp_len;
> +	memcpy(buf, temp_buf, resp_len);
>  
> -	return 0;
> +	return resp_len;
>  }
>  
>  static const struct tpm_class_ops ftpm_tee_tpm_ops = {
>  	.flags = TPM_OPS_AUTO_STARTUP,
> -	.recv = ftpm_tee_tpm_op_recv,
>  	.send = ftpm_tee_tpm_op_send,
>  };
>  
> @@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
>  	}
>  
>  	pvt_data->chip = chip;
> -	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
> +	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
>  
>  	/* Create a character device for the fTPM */
>  	rc = tpm_chip_register(pvt_data->chip);
> -- 
> 2.49.0
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

