Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525C5C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9mUzm0OMaK26vcTcId8UypTlcCR4Q4d++0Ws1yzE8Q=; b=okwLw5kel2Y+f1QeqXz+r4PODy
	AmQHxR11HUB+N7pQKRvaGmDzfifHXThl9Xsn/q4Qm5KPXrLC1sbv5yPkmc0VE30lVt4laInSLmxqG
	rC8KKP/NAymC2sJPxEfc6JIy8b/yWRyLRaoP+ADTVYlOZ30jC9ekEO0+mVdkfmOke3VNZ3SyaTyMg
	Ujg3KrKR2/JEfaabDQoafB7y5NmOVCz2cNKrPuTlJ9dhFoerlQvMfKH4gTtu4WBZ/dvk2gr6b18tP
	QrCq/j7F1ZXP7noe0/+aXnleL/A1OYPNfqpTKaHtcLtkPOa9fIIR916BtBkZI+oOFW9tNSBxkjvoP
	S6tbHveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9ue-0000000DMZX-121b;
	Wed, 30 Apr 2025 16:03:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9ZE-0000000DJuV-3MPP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 15:41:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BEF8A4AA41;
	Wed, 30 Apr 2025 15:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B85AC4CEE7;
	Wed, 30 Apr 2025 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027707;
	bh=t3Uy1BtGwRmWTleefFwzwLEd+DTXVI1qrt1CFuU5vhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYMmM/96Ea5WB/UvivqqMgPKi50QLTkUGDOlUIy8mwSv8AYlnTHcebGdMJlGrm5I6
	 poHKYrdkKnHyAYuUBE7nu1gKhpcHTZbAs1Y1YVsulkzKbrBRtnijB/6VXXw1PYtAzA
	 VnhHz91fh02nYKhlA7IAwQGMLluYkCOJunjViNaP/RcSDb8vEV+RwQcZKG56FgPGwL
	 ZO+FnTUv8Zu59RED36Xj/HRIUw+0S2GL8BAJqk0CO/XglbIgvlCPGyvepALRhEMi01
	 A29hzM7jzpG0WVStsQYbvZtWvcFXpsm9Wes9S3rIStawxDCGKm+Jx+IyXowYzzzPAL
	 yt4MFdxt2J5WA==
Date: Wed, 30 Apr 2025 18:41:43 +0300
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
Subject: Re: [PATCH v3 2/4] tpm: support devices with synchronous send()
Message-ID: <aBJEt41g_T7Thm6s@kernel.org>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-3-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414145653.239081-3-sgarzare@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_084148_966304_2697E6CE 
X-CRM114-Status: GOOD (  27.77  )
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

On Mon, Apr 14, 2025 at 04:56:51PM +0200, Stefano Garzarella wrote:
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
> v3:
> - fixed comment style [Jarkko]
> - renamend `out_send_sync` label to `out_sync` [Jarkko]
> ---
>  include/linux/tpm.h              |  1 +
>  drivers/char/tpm/tpm-interface.c | 20 +++++++++++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
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
> index 3b6ddcdb4051..3dc06836f932 100644
> --- a/drivers/char/tpm/tpm-interface.c
> +++ b/drivers/char/tpm/tpm-interface.c
> @@ -114,8 +114,19 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>  		return rc;
>  	}
>  
> -	/* A sanity check. send() should just return zero on success e.g.
> -	 * not the command length.
> +	/*
> +	 * Synchronous devices return the response directly during the send()
> +	 * call in the same buffer.
> +	 */
> +	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
> +		len = rc;
> +		rc = 0;
> +		goto out_sync;
> +	}
> +
> +	/*
> +	 * A sanity check. send() of asynchronous devices should just return
> +	 * zero on success e.g. not the command length.
>  	 */
>  	if (rc > 0) {
>  		dev_warn(&chip->dev,
> @@ -151,7 +162,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>  	if (len < 0) {
>  		rc = len;
>  		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
> -	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
> +		return rc;
> +	}
> +out_sync:
> +	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
>  		rc = -EFAULT;
>  
>  	return rc ? rc : len;
> -- 
> 2.49.0
> 

I think this is ok.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

