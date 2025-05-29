Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05061C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 02:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrkJpe6ONucaIWLjzVtP9QdQqZNebC9xfURfpCjRs7s=; b=uM2RB8Axv4KBzp4ZpApJhRzluI
	1o89gC81jqQA+2S7OBhZNycGiJk9AjLVEcVRMOZoMJa3VQFxF0EeOtFPY2eCMJTdpSnvsp48UpAAC
	E4XTAEDGtB6KkKbew8gdYcy5b5I2gLrJb+gjSVu6BjzeS4HREgC5pwWfNiSTPPHDc1FezkVb3WLoB
	6XE7E7OlibmNdBNzZ4FLyIp82GwJ2YF2j3EyUWlqoSujrRhFsrYoJ/bkXHClkv63CGCN+GPsZI+gX
	MZAfjPP1c6pJvQ9CfxVXD76PweZ+rqml7et0Xf1NTfQWJ0/6M0uG7CTQpPeddVN8n+5+lWPAX/HNX
	yR24D2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKSfx-0000000Einu-2v4L;
	Thu, 29 May 2025 02:07:21 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKSdp-0000000EijZ-2Bdq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 02:05:11 +0000
Received: from loongson.cn (unknown [10.20.42.164])
	by gateway (Coremail) with SMTP id _____8DxzOLNwDdoBjEBAQ--.20398S3;
	Thu, 29 May 2025 10:05:01 +0800 (CST)
Received: from [10.20.42.164] (unknown [10.20.42.164])
	by front1 (Coremail) with SMTP id qMiowMBxXRvHwDdot1z5AA--.27553S2;
	Thu, 29 May 2025 10:04:57 +0800 (CST)
Subject: Re: [PATCH v5 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Peter Huewe <peterhuewe@gmx.de>, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-integrity@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicholas Piggin <npiggin@gmail.com>, Sumit Garg <sumit.garg@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-kernel@vger.kernel.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250514134630.137621-1-sgarzare@redhat.com>
 <20250514134630.137621-4-sgarzare@redhat.com>
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
Message-ID: <3569b41c-123b-4fd4-458d-f7b2d2ec00f7@loongson.cn>
Date: Thu, 29 May 2025 10:03:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20250514134630.137621-4-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qMiowMBxXRvHwDdot1z5AA--.27553S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gw1xZF4rXFyUGry7uFyUJwc_yoWxury5pF
	Z8G39rAFZ3t3WkJr97tFs7ZrWa9w48KFWUJay8Gas3Ar1qkr90gFyqgFy0qFy5trs7Gr1f
	tF4qgFy5Z3WUZrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8TCJPUUUU
	U==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_190509_869834_C848722A 
X-CRM114-Status: GOOD (  29.91  )
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


在 2025/5/14 下午9:46, Stefano Garzarella 写道:
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
>   drivers/char/tpm/tpm_ftpm_tee.h |  4 ---
>   drivers/char/tpm/tpm_ftpm_tee.c | 64 ++++++++++-----------------------
>   2 files changed, 19 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
> index e39903b7ea07..8d5c3f0d2879 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.h
> +++ b/drivers/char/tpm/tpm_ftpm_tee.h
> @@ -22,16 +22,12 @@
>    * struct ftpm_tee_private - fTPM's private data
>    * @chip:     struct tpm_chip instance registered with tpm framework.
>    * @session:  fTPM TA session identifier.
> - * @resp_len: cached response buffer length.
> - * @resp_buf: cached response buffer.
>    * @ctx:      TEE context handler.
>    * @shm:      Memory pool shared with fTPM TA in TEE.
>    */
>   struct ftpm_tee_private {
>   	struct tpm_chip *chip;
>   	u32 session;
> -	size_t resp_len;
> -	u8 resp_buf[MAX_RESPONSE_SIZE];
>   	struct tee_context *ctx;
>   	struct tee_shm *shm;
>   };
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
> index dbad83bf798e..4e63c30aeaf1 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.c
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -31,47 +31,19 @@ static const uuid_t ftpm_ta_uuid =
>   		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
>   
>   /**
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
>    * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
> - * @buf:	the buffer to send.
> + * @buf:	the buffer to send and to store the response.
>    * @bufsiz:	the size of the buffer.
> - * @len:	the number of bytes to send.
> + * @cmd_len:	the number of bytes to send.
>    *
>    * Return:
> - *	In case of success, returns 0.
> + *	In case of success, returns the number of bytes received.
>    *	On failure, -errno
>    */
>   static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> -				size_t len)
> +				size_t cmd_len)
>   {
>   	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
>   	size_t resp_len;
> @@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>   	struct tee_param command_params[4];
>   	struct tee_shm *shm = pvt_data->shm;
>   
> -	if (len > MAX_COMMAND_SIZE) {
> +	if (cmd_len > MAX_COMMAND_SIZE) {
>   		dev_err(&chip->dev,
>   			"%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
> -			__func__, len);
> +			__func__, cmd_len);
>   		return -EIO;
>   	}
>   
>   	memset(&transceive_args, 0, sizeof(transceive_args));
>   	memset(command_params, 0, sizeof(command_params));
> -	pvt_data->resp_len = 0;
>   
>   	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
>   	transceive_args = (struct tee_ioctl_invoke_arg) {
> @@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>   		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
>   		.u.memref = {
>   			.shm = shm,
> -			.size = len,
> +			.size = cmd_len,
>   			.shm_offs = 0,
>   		},
>   	};
> @@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>   		return PTR_ERR(temp_buf);
>   	}
>   	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
> -	memcpy(temp_buf, buf, len);
> +	memcpy(temp_buf, buf, cmd_len);
>   
>   	command_params[1] = (struct tee_param) {
>   		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> @@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>   			__func__, resp_len);
>   		return -EIO;
>   	}
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

We are confusing the callback name.  Prototype of the send function 
should be:

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 6c3125300..063126711 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -87,7 +87,7 @@ struct tpm_class_ops {
         const u8 req_complete_val;
         bool (*req_canceled)(struct tpm_chip *chip, u8 status);
         int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
-       int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
+       int (*send) (struct tpm_chip *chip, const u8 *buf, size_t len);
         void (*cancel) (struct tpm_chip *chip);
         u8 (*status) (struct tpm_chip *chip);
         void (*update_timeouts)(struct tpm_chip *chip,


But if Jarkko insist not use a send_recv callback, everything is fine.

BR, Qunqin

>   
> -	return 0;
> +	return resp_len;
>   }
>   
>   static const struct tpm_class_ops ftpm_tee_tpm_ops = {
>   	.flags = TPM_OPS_AUTO_STARTUP,
> -	.recv = ftpm_tee_tpm_op_recv,
>   	.send = ftpm_tee_tpm_op_send,
>   };
>   
> @@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
>   	}
>   
>   	pvt_data->chip = chip;
> -	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
> +	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
>   
>   	/* Create a character device for the fTPM */
>   	rc = tpm_chip_register(pvt_data->chip);


