Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33930C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFgp51xIgtMeesg3xOWTrCmCGlhlNJzM52JiSzpJIP4=; b=tIocfi3y8JG0GpMA5P1mDQv6w1
	5+AfVNM7NygALW3d4CcC1rmmO633UZ/ys6xUwU5dEvr+V7oEKWi7oidW98QBarv6felMLmADukqMJ
	ft+Kj/yQM0FuL7JA1Te8SQ8U53saM4DwCg7ncqjC/JxMtZCV9FkBxLOPhxj19+T1QO3Xt+uo3Rmfp
	Bht78D/sHfNbccztPqLCzNe6ryCT93UIucqbw/p2UaZntNbpEiZ+xXBvNwrDRDj3QL4vCF9BEIvgM
	NMjwYN0cm4rIHzT5VpEqMbmGdD5ArPVqMeiaG1W0YzIcYKI3xrWTQm3XWiGhv7vybl49cYKX7CgI2
	WuB8loXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLAB-0000000Cfuu-1End;
	Tue, 06 May 2025 16:28:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHrE-0000000BzSp-1oHB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746536230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XFgp51xIgtMeesg3xOWTrCmCGlhlNJzM52JiSzpJIP4=;
	b=EkjymPD1a/yrdgYFNxyhLxOqHBR0VXH1uVNqVqWvs3u8s3RVVM7ZYh47AQTja/8bdtDMBY
	takig3SAtpvNNzBMElUkaXgxJtvPzKAUvbSSQ4CKqVRawXpyfAIT7s9n/S1c/t5QTutCw5
	qYBZyfqU57uzsotdcgtGPffwg1taOVA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-tHilXM-WPtKnP92W6H5NVg-1; Tue, 06 May 2025 08:57:09 -0400
X-MC-Unique: tHilXM-WPtKnP92W6H5NVg-1
X-Mimecast-MFC-AGG-ID: tHilXM-WPtKnP92W6H5NVg_1746536228
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912fe32b08so2421564f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536228; x=1747141028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFgp51xIgtMeesg3xOWTrCmCGlhlNJzM52JiSzpJIP4=;
        b=ws/BAa08NuZaQQGfbGS+hRZMyV/wwCBYMn3iiEuKKPa8aXsT0BVMGzkclWHHjrApcm
         w0waOlL/lR0aItTBKlk88otmEStji8FzBR4hJm+OlmCAiQt8dNdg4p3PMnWoli05dJb5
         nWdRAHe629Wopo4w6fHujTasASzYWhSpdtjYyCcSScLFZXxeRfXMh4sSBbCwV97vENgc
         ZxyVHncT9fUu5JuEJI4YGwqKw2ViChGn8f1FJyz3fbAyF5GOXBHgkFOcwZh4r7hv2/gA
         12kDZt2SecrIrmdxVEBYG28PebwJfYAObhB0RkZK41rVH8/5Pmx3vKikXWIWXyjs0ZUS
         56pg==
X-Forwarded-Encrypted: i=1; AJvYcCUpNwrp4dD7zn1tbKHf+7JdBrAI7CYJivKg8CJkh+hc9cO1A/xg+A37yatpj2MTXtWzaUK/gPxaU4k5o/0Ihinj@lists.infradead.org
X-Gm-Message-State: AOJu0YzLt8ixZKCsVTH1CeMUTdzn8l90Ek2voyg4E4r+ClIlV0C+Bb3y
	MUwpA+x5a5xUPYjXz7zYi6MUGJBd7RSJ4jvkAzUI0qwfNMDdzHVEE0k3xRXYqhMrvIfbRJWMa3K
	pL6btk+6WK+9Sfis0OYoD7yCX2MUgcJSOXzDkY6r9I5H1rxFrCVkvGiYTdv21iv0geX9WF48R
X-Gm-Gg: ASbGncuFjbkWKIFlawobvX6LyCvxSFD/wuHyAkZk6CTnKfSYFa4XvoZBw3kaIk+Ummm
	ysdeLZyiPeGM4t2ACNFNVHgm0dn2P/DIt7Yy4Y1SBHhuTNB0ENjy8QUhWl1CGnVRdG8e6UPuQk4
	O2qYdrOJi6yKon5Qj5nmjah6hGzUAqiWSgGbYFSH/glAUBnHgvLZyESs41humelC5jGnFPtfthP
	atIxUJdhUTc8hr7aKX6X2WJMCQOUGTPkryX+5bxOLXXFbcYkYMauN4WlMfOcXNRAPRnp48i8DgB
	888+9t9hCRtM3hfy
X-Received: by 2002:a5d:584d:0:b0:3a0:7fd4:2848 with SMTP id ffacd0b85a97d-3a0ac3eb15bmr2544839f8f.52.1746536227906;
        Tue, 06 May 2025 05:57:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESBLa6hkPiOG2btr3qNJwKDWalQ6kHBu+tV3hDT/rTtH40mJeupTlnchUXXZnxabePPxMG5Q==
X-Received: by 2002:a5d:584d:0:b0:3a0:7fd4:2848 with SMTP id ffacd0b85a97d-3a0ac3eb15bmr2544810f8f.52.1746536227166;
        Tue, 06 May 2025 05:57:07 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.145.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0cd6sm13513664f8f.5.2025.05.06.05.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:06 -0700 (PDT)
Date: Tue, 6 May 2025 14:56:54 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Peter Huewe <peterhuewe@gmx.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 1/4] tpm: add buf_size parameter in the .send callback
Message-ID: <o72kb2x2jjxyzgyixeva42sk3lr2wwphnyhkcdbxxgfevoqp3n@ir6rwldztmt7>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-2-sgarzare@redhat.com>
 <aBJETstuSlBUMwj1@kernel.org>
MIME-Version: 1.0
In-Reply-To: <aBJETstuSlBUMwj1@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wOxvWJ5J024WyMUmJJpWi_8hb4_9RYHASAySc-h0UNU_1746536228
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_055712_620663_9FB6B5EF 
X-CRM114-Status: GOOD (  31.97  )
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

On Wed, Apr 30, 2025 at 06:39:58PM +0300, Jarkko Sakkinen wrote:
>On Mon, Apr 14, 2025 at 04:56:50PM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> In preparation for the next commit, add a new `buf_size` parameter to
>> the `.send` callback in `tpm_class_ops` which contains the entire buffer
>> size. In this patch it is pretty much ignored by all drivers, but it will
>> be used in the next patch.
>
>So instead "in preparation for the next commit" just plain say why it
>will be needed. "next commit" is a fuzzy reference :-)
>
>Same goes for "next patch". Neither can be used to query any possible
>information. That sort of makes the whole paragraph useless, once it
>is in the commit log.

Got it! What about somethig like this:

    Add a new `buf_size` parameter to the `.send` callback in
    `tpm_class_ops`. This parameter will allow drivers to differentiate
    between the actual command length to send and the total buffer
    size. Currently `buf_now` is not used, but it will be used to
    support devices with synchronous `.send` callback to send the
    command and receive the response on the same buffer.

Thanks,
Stefano


>
>>
>> Also rename the previous parameter `len` to `cmd_len` in the
>> declaration to make it clear that it contains the length in bytes of the
>> command stored in the buffer. The semantics don't change and it can be
>> used as before by drivers. This is an optimization since the drivers
>> could get it from the header, but let's avoid duplicating code.
>>
>> While we are here, resolve a checkpatch warning:
>>   WARNING: Unnecessary space before function pointer arguments
>>   #66: FILE: include/linux/tpm.h:90:
>>   +	int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>>
>> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  include/linux/tpm.h                  | 3 ++-
>>  drivers/char/tpm/st33zp24/st33zp24.c | 2 +-
>>  drivers/char/tpm/tpm-interface.c     | 2 +-
>>  drivers/char/tpm/tpm_atmel.c         | 3 ++-
>>  drivers/char/tpm/tpm_crb.c           | 2 +-
>>  drivers/char/tpm/tpm_ftpm_tee.c      | 4 +++-
>>  drivers/char/tpm/tpm_i2c_atmel.c     | 3 ++-
>>  drivers/char/tpm/tpm_i2c_infineon.c  | 3 ++-
>>  drivers/char/tpm/tpm_i2c_nuvoton.c   | 3 ++-
>>  drivers/char/tpm/tpm_ibmvtpm.c       | 6 ++++--
>>  drivers/char/tpm/tpm_infineon.c      | 3 ++-
>>  drivers/char/tpm/tpm_nsc.c           | 3 ++-
>>  drivers/char/tpm/tpm_svsm.c          | 3 ++-
>>  drivers/char/tpm/tpm_tis_core.c      | 3 ++-
>>  drivers/char/tpm/tpm_tis_i2c_cr50.c  | 6 ++++--
>>  drivers/char/tpm/tpm_vtpm_proxy.c    | 4 +++-
>>  drivers/char/tpm/xen-tpmfront.c      | 3 ++-
>>  17 files changed, 37 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>> index 6c3125300c00..2e38edd5838c 100644
>> --- a/include/linux/tpm.h
>> +++ b/include/linux/tpm.h
>> @@ -87,7 +87,8 @@ struct tpm_class_ops {
>>  	const u8 req_complete_val;
>>  	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
>>  	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
>> -	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
>> +	int (*send)(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>> +		    size_t buf_size);
>>  	void (*cancel) (struct tpm_chip *chip);
>>  	u8 (*status) (struct tpm_chip *chip);
>>  	void (*update_timeouts)(struct tpm_chip *chip,
>> diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
>> index c0771980bc2f..3de68bca1740 100644
>> --- a/drivers/char/tpm/st33zp24/st33zp24.c
>> +++ b/drivers/char/tpm/st33zp24/st33zp24.c
>> @@ -300,7 +300,7 @@ static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
>>   * send TPM commands through the I2C bus.
>>   */
>>  static int st33zp24_send(struct tpm_chip *chip, unsigned char *buf,
>> -			 size_t len)
>> +			 size_t len, size_t buf_size)
>>  {
>>  	struct st33zp24_dev *tpm_dev = dev_get_drvdata(&chip->dev);
>>  	u32 status, i, size, ordinal;
>> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
>> index 8d7e4da6ed53..3b6ddcdb4051 100644
>> --- a/drivers/char/tpm/tpm-interface.c
>> +++ b/drivers/char/tpm/tpm-interface.c
>> @@ -106,7 +106,7 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>>  		return -E2BIG;
>>  	}
>>
>> -	rc = chip->ops->send(chip, buf, count);
>> +	rc = chip->ops->send(chip, buf, count, bufsiz);
>>  	if (rc < 0) {
>>  		if (rc != -EPIPE)
>>  			dev_err(&chip->dev,
>> diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tpm_atmel.c
>> index 54a0360a3c95..5733168bfc26 100644
>> --- a/drivers/char/tpm/tpm_atmel.c
>> +++ b/drivers/char/tpm/tpm_atmel.c
>> @@ -148,7 +148,8 @@ static int tpm_atml_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>>  	return size;
>>  }
>>
>> -static int tpm_atml_send(struct tpm_chip *chip, u8 *buf, size_t count)
>> +static int tpm_atml_send(struct tpm_chip *chip, u8 *buf, size_t count,
>> +			 size_t buf_size)
>>  {
>>  	struct tpm_atmel_priv *priv = dev_get_drvdata(&chip->dev);
>>  	int i;
>> diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
>> index 876edf2705ab..38f765a44a97 100644
>> --- a/drivers/char/tpm/tpm_crb.c
>> +++ b/drivers/char/tpm/tpm_crb.c
>> @@ -426,7 +426,7 @@ static int tpm_crb_smc_start(struct device *dev, unsigned long func_id)
>>  }
>>  #endif
>>
>> -static int crb_send(struct tpm_chip *chip, u8 *buf, size_t len)
>> +static int crb_send(struct tpm_chip *chip, u8 *buf, size_t len, size_t buf_size)
>>  {
>>  	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
>>  	int rc = 0;
>> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
>> index 53ba28ccd5d3..637cc8b6599e 100644
>> --- a/drivers/char/tpm/tpm_ftpm_tee.c
>> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
>> @@ -64,12 +64,14 @@ static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>>   * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
>>   * @buf:	the buffer to send.
>>   * @len:	the number of bytes to send.
>> + * @buf_size:	the size of the buffer.
>>   *
>>   * Return:
>>   *	In case of success, returns 0.
>>   *	On failure, -errno
>>   */
>> -static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len)
>> +static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +				size_t buf_size)
>>  {
>>  	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
>>  	size_t resp_len;
>> diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
>> index d1d27fdfe523..572f97cb9e89 100644
>> --- a/drivers/char/tpm/tpm_i2c_atmel.c
>> +++ b/drivers/char/tpm/tpm_i2c_atmel.c
>> @@ -37,7 +37,8 @@ struct priv_data {
>>  	u8 buffer[sizeof(struct tpm_header) + 25];
>>  };
>>
>> -static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t len)
>> +static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +			  size_t buf_size)
>>  {
>>  	struct priv_data *priv = dev_get_drvdata(&chip->dev);
>>  	struct i2c_client *client = to_i2c_client(chip->dev.parent);
>> diff --git a/drivers/char/tpm/tpm_i2c_infineon.c b/drivers/char/tpm/tpm_i2c_infineon.c
>> index 81d8a78dc655..25d6ae3a4cc1 100644
>> --- a/drivers/char/tpm/tpm_i2c_infineon.c
>> +++ b/drivers/char/tpm/tpm_i2c_infineon.c
>> @@ -514,7 +514,8 @@ static int tpm_tis_i2c_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>>  	return size;
>>  }
>>
>> -static int tpm_tis_i2c_send(struct tpm_chip *chip, u8 *buf, size_t len)
>> +static int tpm_tis_i2c_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +			    size_t buf_size)
>>  {
>>  	int rc, status;
>>  	ssize_t burstcnt;
>> diff --git a/drivers/char/tpm/tpm_i2c_nuvoton.c b/drivers/char/tpm/tpm_i2c_nuvoton.c
>> index 3c3ee5f551db..169078ce6ac4 100644
>> --- a/drivers/char/tpm/tpm_i2c_nuvoton.c
>> +++ b/drivers/char/tpm/tpm_i2c_nuvoton.c
>> @@ -350,7 +350,8 @@ static int i2c_nuvoton_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>>   * tpm.c can skip polling for the data to be available as the interrupt is
>>   * waited for here
>>   */
>> -static int i2c_nuvoton_send(struct tpm_chip *chip, u8 *buf, size_t len)
>> +static int i2c_nuvoton_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +			    size_t buf_size)
>>  {
>>  	struct priv_data *priv = dev_get_drvdata(&chip->dev);
>>  	struct device *dev = chip->dev.parent;
>> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
>> index 76d048f63d55..660a7f9da1d8 100644
>> --- a/drivers/char/tpm/tpm_ibmvtpm.c
>> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
>> @@ -191,13 +191,15 @@ static int tpm_ibmvtpm_resume(struct device *dev)
>>   * tpm_ibmvtpm_send() - Send a TPM command
>>   * @chip:	tpm chip struct
>>   * @buf:	buffer contains data to send
>> - * @count:	size of buffer
>> + * @count:	length of the command
>> + * @buf_size:   size of the buffer
>>   *
>>   * Return:
>>   *   0 on success,
>>   *   -errno on error
>>   */
>> -static int tpm_ibmvtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
>> +static int tpm_ibmvtpm_send(struct tpm_chip *chip, u8 *buf, size_t count,
>> +			    size_t buf_size)
>>  {
>>  	struct ibmvtpm_dev *ibmvtpm = dev_get_drvdata(&chip->dev);
>>  	bool retry = true;
>> diff --git a/drivers/char/tpm/tpm_infineon.c b/drivers/char/tpm/tpm_infineon.c
>> index 2d2ae37153ba..7896fdacd156 100644
>> --- a/drivers/char/tpm/tpm_infineon.c
>> +++ b/drivers/char/tpm/tpm_infineon.c
>> @@ -312,7 +312,8 @@ static int tpm_inf_recv(struct tpm_chip *chip, u8 * buf, size_t count)
>>  	return -EIO;
>>  }
>>
>> -static int tpm_inf_send(struct tpm_chip *chip, u8 * buf, size_t count)
>> +static int tpm_inf_send(struct tpm_chip *chip, u8 *buf, size_t count,
>> +			size_t buf_size)
>>  {
>>  	int i;
>>  	int ret;
>> diff --git a/drivers/char/tpm/tpm_nsc.c b/drivers/char/tpm/tpm_nsc.c
>> index 0f62bbc940da..12aedef3c50e 100644
>> --- a/drivers/char/tpm/tpm_nsc.c
>> +++ b/drivers/char/tpm/tpm_nsc.c
>> @@ -178,7 +178,8 @@ static int tpm_nsc_recv(struct tpm_chip *chip, u8 * buf, size_t count)
>>  	return size;
>>  }
>>
>> -static int tpm_nsc_send(struct tpm_chip *chip, u8 * buf, size_t count)
>> +static int tpm_nsc_send(struct tpm_chip *chip, u8 *buf, size_t count,
>> +			size_t buf_size)
>>  {
>>  	struct tpm_nsc_priv *priv = dev_get_drvdata(&chip->dev);
>>  	u8 data;
>> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
>> index 4280edf427d6..d3ca5615b6f7 100644
>> --- a/drivers/char/tpm/tpm_svsm.c
>> +++ b/drivers/char/tpm/tpm_svsm.c
>> @@ -25,7 +25,8 @@ struct tpm_svsm_priv {
>>  	void *buffer;
>>  };
>>
>> -static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
>> +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +			 size_t buf_size)
>>  {
>>  	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>>  	int ret;
>> diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
>> index ed0d3d8449b3..5641a73ce280 100644
>> --- a/drivers/char/tpm/tpm_tis_core.c
>> +++ b/drivers/char/tpm/tpm_tis_core.c
>> @@ -580,7 +580,8 @@ static int tpm_tis_send_main(struct tpm_chip *chip, const u8 *buf, size_t len)
>>  	return rc;
>>  }
>>
>> -static int tpm_tis_send(struct tpm_chip *chip, u8 *buf, size_t len)
>> +static int tpm_tis_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +			size_t buf_size)
>>  {
>>  	int rc, irq;
>>  	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
>> diff --git a/drivers/char/tpm/tpm_tis_i2c_cr50.c b/drivers/char/tpm/tpm_tis_i2c_cr50.c
>> index 3b55a7b05c46..1914b368472d 100644
>> --- a/drivers/char/tpm/tpm_tis_i2c_cr50.c
>> +++ b/drivers/char/tpm/tpm_tis_i2c_cr50.c
>> @@ -546,13 +546,15 @@ static int tpm_cr50_i2c_tis_recv(struct tpm_chip *chip, u8 *buf, size_t buf_len)
>>   * tpm_cr50_i2c_tis_send() - TPM transmission callback.
>>   * @chip:	A TPM chip.
>>   * @buf:	Buffer to send.
>> - * @len:	Buffer length.
>> + * @len:	Command length.
>> + * @buf_size:	Buffer size.
>>   *
>>   * Return:
>>   * - 0:		Success.
>>   * - -errno:	A POSIX error code.
>>   */
>> -static int tpm_cr50_i2c_tis_send(struct tpm_chip *chip, u8 *buf, size_t len)
>> +static int tpm_cr50_i2c_tis_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +				 size_t buf_size)
>>  {
>>  	size_t burstcnt, limit, sent = 0;
>>  	u8 tpm_go[4] = { TPM_STS_GO };
>> diff --git a/drivers/char/tpm/tpm_vtpm_proxy.c b/drivers/char/tpm/tpm_vtpm_proxy.c
>> index 8fe4a01eea12..beaa84428b49 100644
>> --- a/drivers/char/tpm/tpm_vtpm_proxy.c
>> +++ b/drivers/char/tpm/tpm_vtpm_proxy.c
>> @@ -322,11 +322,13 @@ static int vtpm_proxy_is_driver_command(struct tpm_chip *chip,
>>   * @chip: tpm chip to use
>>   * @buf: send buffer
>>   * @count: bytes to send
>> + * @buf_size: size of the buffer
>>   *
>>   * Return:
>>   *      0 in case of success, negative error value otherwise.
>>   */
>> -static int vtpm_proxy_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t count)
>> +static int vtpm_proxy_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t count,
>> +				  size_t buf_size)
>>  {
>>  	struct proxy_dev *proxy_dev = dev_get_drvdata(&chip->dev);
>>
>> diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
>> index 80cca3b83b22..66a4dbb4a4d8 100644
>> --- a/drivers/char/tpm/xen-tpmfront.c
>> +++ b/drivers/char/tpm/xen-tpmfront.c
>> @@ -131,7 +131,8 @@ static size_t shr_data_offset(struct vtpm_shared_page *shr)
>>  	return struct_size(shr, extra_pages, shr->nr_extra_pages);
>>  }
>>
>> -static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
>> +static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count,
>> +		     size_t buf_size)
>>  {
>>  	struct tpm_private *priv = dev_get_drvdata(&chip->dev);
>>  	struct vtpm_shared_page *shr = priv->shr;
>> --
>> 2.49.0
>>
>>
>
>BR, Jarkko
>


