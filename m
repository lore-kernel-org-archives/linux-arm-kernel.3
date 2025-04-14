Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF01C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiBcwGEvq2PhJfASxrOHAGOy8gVOP2qSKhUxi65Uo4U=; b=CsRbVhN60VheN/R43YfjwrFawE
	CiBgiZUqupkuJW8X2KK3HBT8GjMDPUt0sXy7ukdzLRJrplwwKhOXVLgwTrg5TDojUyZkF7tXHdNkw
	fQfZfeMM2BJwGe9IcgeksSWxJ3ZsXd2+YzKgxvCSVqdqmBI7Th0G53U3G/r//LMFWt3SXnPNNCzNM
	bd/g5aXyusFZbkUmAzGlo52wEPPmuYCZvakNy+oTEGWZWT+p5B4yCYIQVFgfIYjHVLOMX1aNi9EpT
	F6v04B8ABq7TE0nIPSOkeMsGuzuaaV7s6M3KbhnvIX6LMb2ymxP1RNwjmDSDBAZUP2BhRz2506KeZ
	U1DFU1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LcE-00000002bNO-3jvy;
	Mon, 14 Apr 2025 15:20:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LI4-00000002WhV-1Jt1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 15:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PiBcwGEvq2PhJfASxrOHAGOy8gVOP2qSKhUxi65Uo4U=;
	b=YN5hyvkXeeIYtkLt/ulcZkTPOjS+s+PGo+aS8pBDU2RRMY9HcC9Om+y6D6AwYRH6I/bXqI
	HyhWl2NdcK1RiL1gwnrQ6UqohhkLFFgHlOzbEEvB1J3481qmGnuJya4Ng8YsNmAt9NiTA3
	kcCCAUwQjxtl7vHpj28D9mhVxKeGrEg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-Zhyta7U-NjWfieWWUwJYeA-1; Mon, 14 Apr 2025 11:00:02 -0400
X-MC-Unique: Zhyta7U-NjWfieWWUwJYeA-1
X-Mimecast-MFC-AGG-ID: Zhyta7U-NjWfieWWUwJYeA_1744642801
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d3b211d0eso28320475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 08:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642801; x=1745247601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiBcwGEvq2PhJfASxrOHAGOy8gVOP2qSKhUxi65Uo4U=;
        b=Ds1iZPW/JihsvnCQSnrakgwM7PoHk308J7ZOUls8H1Qjaul9r3avD0CjY70vtsNjKt
         ZDWIUwacLgxhtVOCDrn+TqznhCMTapcWkV3hllPmhIWaHRLkH3yBhYknD6rhABUKdjsa
         Lx+c3JUaGHK7WXJ1AN/2af/62KhkeHFRgMnrW30avN3eBcW1q82QOSbxojAp2AyzPPzS
         WxC7bEf2s/wczrv6DFX0tRT5FL/0DaRMYV+7ByVRCpUnL1UNmqaJD+ogks2aWcitjXAi
         2t5c+lRcfXN2kt54X8llnXTOOQN17f0YqJu5umkvGf4fwI9oCupvQboyWPQ7WtJqtvhk
         u0Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWZQEazZEDxzuxXrDweIa3WsnUrkklmkmTNWIbLcvtI4uiCgjMGbuNr0pUf7zArIdwqdCOVrEW+Ok5OVu1ut5se@lists.infradead.org
X-Gm-Message-State: AOJu0YxKgc0pYYFwnojzR65yp7arAuwDBrYs0dWq4N6SCl856BbQ9NQd
	JNQOORrOFPg8iNK9zM4c6Lra0IjuyGKtIMS3y31hPQHyll2s7glwf74JQkMf9IUCkbG2sDnK7ll
	6vmohNxEX74plJIQF1cELNm36GUazEaS/K1Gyf8+WO+k/eiq9CUL9Hh7+pRm+0Gi6Ts94IQbQzw
	8icXePgt2fUWh8os/hk+aZYOZjJnrsmHHgeyoZhk146FDp1aY=
X-Gm-Gg: ASbGncssBFMlw4QljIfTM0QidOf0CJnLd6hMSEr7jNT4IAexVsDT0dlZxFWAH7D87JD
	4ydNKtC9PJQ49WKC9OaUCQYsCS5GebPA8pSXmJgsgMbuWz5Vq2I6bK3wAglGu1nUmJ2NPqg==
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43f2ea651bcmr156859875e9.7.1744642800761;
        Mon, 14 Apr 2025 08:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBw02L0rMKAm8Z+1nOktn69htJsdj/Jz1OK8Cyd/Ml4PZuhztd9KZNvdjVRlhSdTo1NUKpE0xXzvNiaYGSRZU=
X-Received: by 2002:a05:600c:3c84:b0:439:91c7:895a with SMTP id
 5b1f17b1804b1-43f2ea651bcmr156859495e9.7.1744642800128; Mon, 14 Apr 2025
 08:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250414145653.239081-1-sgarzare@redhat.com> <20250414145653.239081-4-sgarzare@redhat.com>
In-Reply-To: <20250414145653.239081-4-sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 14 Apr 2025 16:59:47 +0200
X-Gm-Features: ATxdqUGzkoR7R29rCyZrs6HYZjyVNgh9a1johmj3oUpZ98_9R4aglRHe8KpEBvQ
Message-ID: <CAGxU2F5SJ9nQfAV-D1WKjsUow_01xjGBRXP4d+q4T=5Bw=yaOg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
To: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Peter Huewe <peterhuewe@gmx.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2PThJq5tETK1zj4rXgsB_v4pu7gdp8jp6okqCDbyvpM_1744642801
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_080004_453943_E26553B4 
X-CRM114-Status: GOOD (  30.93  )
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

On Mon, 14 Apr 2025 at 16:57, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> From: Stefano Garzarella <sgarzare@redhat.com>
>
> This driver does not support interrupts, and receiving the response is
> synchronous with sending the command.
>
> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
> return responses in the same buffer used for commands. This way we
> don't need the 4KB internal buffer used to cache the response before
> .send() and .recv(). Also we don't need to implement recv() op.
>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v2:
> - set TPM_CHIP_FLAG_SYNC and support it in the new send()
> - removed Jens' T-b

@Jens @Sumit can you test/review this patch again since from v1 we
changed the core a bit adding TPM_CHIP_FLAG_SYNC instead of
send_recv() op?

Thanks,
Stefano

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
>         struct tpm_chip *chip;
>         u32 session;
> -       size_t resp_len;
> -       u8 resp_buf[MAX_RESPONSE_SIZE];
>         struct tee_context *ctx;
>         struct tee_shm *shm;
>  };
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
> index 637cc8b6599e..b9adc040ca6d 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.c
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -31,46 +31,18 @@ static const uuid_t ftpm_ta_uuid =
>                   0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
>
>  /**
> - * ftpm_tee_tpm_op_recv() - retrieve fTPM response.
> - * @chip:      the tpm_chip description as specified in driver/char/tpm/tpm.h.
> - * @buf:       the buffer to store data.
> - * @count:     the number of bytes to read.
> - *
> - * Return:
> - *     In case of success the number of bytes received.
> - *     On failure, -errno.
> - */
> -static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
> -{
> -       struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> -       size_t len;
> -
> -       len = pvt_data->resp_len;
> -       if (count < len) {
> -               dev_err(&chip->dev,
> -                       "%s: Invalid size in recv: count=%zd, resp_len=%zd\n",
> -                       __func__, count, len);
> -               return -EIO;
> -       }
> -
> -       memcpy(buf, pvt_data->resp_buf, len);
> -       pvt_data->resp_len = 0;
> -
> -       return len;
> -}
> -
> -/**
> - * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory.
> + * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
> + * and retrieve the response.
>   * @chip:      the tpm_chip description as specified in driver/char/tpm/tpm.h
> - * @buf:       the buffer to send.
> - * @len:       the number of bytes to send.
> + * @buf:       the buffer to send and to store the response.
> + * @cmd_len:   the number of bytes to send.
>   * @buf_size:  the size of the buffer.
>   *
>   * Return:
> - *     In case of success, returns 0.
> + *     In case of success, returns the number of bytes received.
>   *     On failure, -errno
>   */
> -static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
> +static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>                                 size_t buf_size)
>  {
>         struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
> @@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>         struct tee_param command_params[4];
>         struct tee_shm *shm = pvt_data->shm;
>
> -       if (len > MAX_COMMAND_SIZE) {
> +       if (cmd_len > MAX_COMMAND_SIZE) {
>                 dev_err(&chip->dev,
>                         "%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
> -                       __func__, len);
> +                       __func__, cmd_len);
>                 return -EIO;
>         }
>
>         memset(&transceive_args, 0, sizeof(transceive_args));
>         memset(command_params, 0, sizeof(command_params));
> -       pvt_data->resp_len = 0;
>
>         /* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
>         transceive_args = (struct tee_ioctl_invoke_arg) {
> @@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>                 .attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
>                 .u.memref = {
>                         .shm = shm,
> -                       .size = len,
> +                       .size = cmd_len,
>                         .shm_offs = 0,
>                 },
>         };
> @@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>                 return PTR_ERR(temp_buf);
>         }
>         memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
> -       memcpy(temp_buf, buf, len);
> +       memcpy(temp_buf, buf, cmd_len);
>
>         command_params[1] = (struct tee_param) {
>                 .attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> @@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>                         __func__, resp_len);
>                 return -EIO;
>         }
> +       if (resp_len > buf_size) {
> +               dev_err(&chip->dev,
> +                       "%s: resp_len=%zd exceeds buf_size=%zd\n",
> +                       __func__, resp_len, buf_size);
> +               return -EIO;
> +       }
>
> -       /* sanity checks look good, cache the response */
> -       memcpy(pvt_data->resp_buf, temp_buf, resp_len);
> -       pvt_data->resp_len = resp_len;
> +       memcpy(buf, temp_buf, resp_len);
>
> -       return 0;
> +       return resp_len;
>  }
>
>  static const struct tpm_class_ops ftpm_tee_tpm_ops = {
>         .flags = TPM_OPS_AUTO_STARTUP,
> -       .recv = ftpm_tee_tpm_op_recv,
>         .send = ftpm_tee_tpm_op_send,
>  };
>
> @@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
>         }
>
>         pvt_data->chip = chip;
> -       pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
> +       pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
>
>         /* Create a character device for the fTPM */
>         rc = tpm_chip_register(pvt_data->chip);
> --
> 2.49.0
>


