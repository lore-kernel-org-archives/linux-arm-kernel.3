Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E109C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3v2u8ip3cqMDDLNIpKhDZO5Hm5vU3p7hzEHmiU+27A=; b=eXQxPTYMga4mGTnilO8R5gZZx3
	CAuVBFqlGQhbOR62BW65MXW7lEcrGt4nksaQHT+awvA9sWoCut3sXkxN+T9/pbGmrIofKdi141QRX
	yMPkjzAStj+/Abi+TTIccZA3YiM52fTeg17wHVHxhclyx45eiVEZuFh+8LFMQXRCIP856I3MrNfhv
	KeMmAKgKZvjv0cbUL8ixSWsClJ0Is/P333XfUKlivkSlmWzZlQaJkCcQ5iuu6i2sNiQ3kAYmAjcZD
	pzV1h4noSehNVzdiaXEjq5KmoFao11/kP0+joapQXT3c+ciy/A1zePHw9NwXeXjsjIBpYy8kBOeTh
	vy63+rlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2AyB-00000004dwd-3y7K;
	Tue, 08 Apr 2025 15:34:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2AvG-00000004dNO-43at
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:31:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4793E5C59B4;
	Tue,  8 Apr 2025 15:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14E9C4CEE5;
	Tue,  8 Apr 2025 15:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126294;
	bh=Uq29KL+ro4IRBo8g5H8MypBCBK0Ooc76QGNcWH4alfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4UJEaCtF61oGuLRw5Uii2z9vVlYo67NwlmwTqICCwpgHdYrc/oIvkhAI0jjnKiYr
	 Foi1EZ+/FfOtwDutvDlZ9IsQ6EaTcYYiD+reVoWqi4tU8zzV1GPixJdCq3xMn5ULof
	 keSD4lGX9dDqatRoGU+M0XVaSjc2nQ2FStY95360gQvs2zoe+wDlgAKASUDQjaYgeZ
	 kQ3WWSvJQ9LkYm40V+PxAHXYZKpuv+S9USOhEty0CogIdTgr+YTMAnmHfwKeorOjfK
	 lEPaV0ygH0+6jINKFxGVxFPjOV4RS3OnCQKWa9pJFTARzwygN4IV07Gvc2xj2sINKa
	 D8jpHP3BSx3cg==
Date: Tue, 8 Apr 2025 18:31:30 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sumit Garg <sumit.garg@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-integrity@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v2 2/4] tpm: support devices with synchronous send()
Message-ID: <Z_VBUozuHvbxdyB3@kernel.org>
References: <20250408083208.43512-1-sgarzare@redhat.com>
 <20250408083208.43512-3-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408083208.43512-3-sgarzare@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_083135_124596_A9F36FFD 
X-CRM114-Status: GOOD (  26.96  )
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

On Tue, Apr 08, 2025 at 10:32:06AM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> Some devices do not support interrupts and provide a single synchronous
> operation to send the command and receive the response on the same buffer.
> 
> Currently, these types of drivers must use an internal buffer where they
> temporarily store the response between .send() and recv() calls.
> 
> Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
> If that flag is set by the driver, tpm_try_transmit() will use the send()
> callback to send the command and receive the response on the same buffer
> synchronously. In that case send() return the number of bytes of the
> response on success, or -errno on failure.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/linux/tpm.h              |  1 +
>  drivers/char/tpm/tpm-interface.c | 18 +++++++++++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
> index 2e38edd5838c..0e9746dc9d30 100644
> --- a/include/linux/tpm.h
> +++ b/include/linux/tpm.h
> @@ -350,6 +350,7 @@ enum tpm_chip_flags {
>  	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
>  	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
>  	TPM_CHIP_FLAG_DISABLE			= BIT(10),
> +	TPM_CHIP_FLAG_SYNC			= BIT(11),
>  };
>  
>  #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
> index 3b6ddcdb4051..9fbe84b5a131 100644
> --- a/drivers/char/tpm/tpm-interface.c
> +++ b/drivers/char/tpm/tpm-interface.c
> @@ -114,8 +114,17 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>  		return rc;
>  	}
>  
> -	/* A sanity check. send() should just return zero on success e.g.
> -	 * not the command length.
> +	/* Synchronous devices return the response directly during the send()
> +	 * call in the same buffer.
> +	 */

Nit:

/*
 * ...

It's wrong in the existing comment.

> +	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
> +		len = rc;
> +		rc = 0;
> +		goto out_send_sync;
> +	}
> +
> +	/* A sanity check. send() of asynchronous devices should just return
> +	 * zero on success e.g. not the command length.
>  	 */
>  	if (rc > 0) {
>  		dev_warn(&chip->dev,
> @@ -151,7 +160,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>  	if (len < 0) {
>  		rc = len;
>  		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
> -	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
> +		return rc;
> +	}
> +out_send_sync:

out_sync would be sufficient

> +	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
>  		rc = -EFAULT;
>  
>  	return rc ? rc : len;
> -- 
> 2.49.0
> 

BR, Jarkko

