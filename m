Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAECC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uO86tWyczy+PSJFwu9JeGgAOBATj+coLncLYSH0L/gw=; b=jah3Y0IVCDQzKmioutTR1lRYQe
	cGRVQGnExAmCcngG+oRL7J5N4lMSXO2CbXEIwMGP6pJGQwGWLGdFK7AMDyXbcnZ1npu4VwL14A4BF
	qP3k8m3IQC/ClNLHBPFN76zMpCyTKxGjGa4hjGcOD4Rd2paFRcwU84yaAlG0BCOUoWUL7wKNo5TGH
	sGctRFA67SHCPVY5ElCBVIR8cvr5ukhD0MiwPTMxhQieSOsEx/webP/IUnaQpGvSyhl34Hvn6l/Zx
	vDVH205eN9DKZj6GkUNXqpgdryJQVM5+L8IFSr3lOyXk6qtazRRmsBopCuqRlz9nDJmOb2P7YKLM4
	HbDk8Q7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLHo-0000000ChMZ-1kfn;
	Tue, 06 May 2025 16:36:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI0e-0000000C1fF-2wji
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746536815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uO86tWyczy+PSJFwu9JeGgAOBATj+coLncLYSH0L/gw=;
	b=b9JVcOvVim3ocxUoEd9GGWkozBYb+e2m3yOs/HBL+7Hpi+R6eFfvzveJtTApt2LCPBLgQO
	Nlm+6hs57Hzx8en+AfPvak8QiVkiK0f564oxXW/+Y04uHdyE403etTiAmavQ1zgCW9DZX8
	L0i2Rw5I/ogMeyg7Dcv6/meKTYHkDbI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-PoV6a-8OM_yVWL3TJZhUEQ-1; Tue, 06 May 2025 09:06:54 -0400
X-MC-Unique: PoV6a-8OM_yVWL3TJZhUEQ-1
X-Mimecast-MFC-AGG-ID: PoV6a-8OM_yVWL3TJZhUEQ_1746536813
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so41506085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536813; x=1747141613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uO86tWyczy+PSJFwu9JeGgAOBATj+coLncLYSH0L/gw=;
        b=uVagq3y15CU1leh5dh3JiMQopJUH6bP8GJZ7nYjMHHnBxWyG6RUi4teYZQU8cXGH0g
         ahJ3xDhOhLKz+2SNva4GcWLGl1UnQp9Oxon3oG0ZvVXNnbRdFoZb4daess5kgpoHAYbQ
         ntgB1bX601ZQgH3E759u81raNKW8UXney1fCg/ijDMDbiK/+941cAnFdKVWo1nZbDmEx
         1iGF/p0w/qT1mHoAwt3f9Ted0rFA6QwUsH9r7aTFqK7m6aMr6TFb1vJJujHatBlCZpKv
         CmHZdy6eTR1x50h8LFSQjJOFjwZhxCFxeTaKc7tezE5iUxSDoqeBOVpVHeKYp6doyiFB
         N9fg==
X-Forwarded-Encrypted: i=1; AJvYcCX73ZiJxjcepmMqEpmKGsOxSsv2WbUJ+aGHwlwwW84oOy59rSNB+fViuNUhiUrLXdNWhR48CZ/1xvHmioF+dFeF@lists.infradead.org
X-Gm-Message-State: AOJu0YwEQx0B2sO7/p5E92gTZQTeYzJia7X/xwiFyn9FBiPIOtrierkr
	IuYeviyWsawS4A4h/Bn3s2GE0TumX1xyf3Kt8UOqbiFk44i7bf/YTNTWn34tIgD1t4phfj4xW1M
	bhnlUGhfiicigJxM0dmZcoQagz36V7xUq1p6bskQyB/MvrixIcGVvVoOknx9R1G3B1Sm+LtOh
X-Gm-Gg: ASbGncsNjfcLhfC+6oqAvhDuFTZU3KQpCd+7R9Inhcqyi4YqeVaOoPsnS91ylXTLK1p
	qCqgqZoO/TIcq1Rr+2HjcnVRbJrqz7mFiwGGPScTugIfwZI7J8g8N8eNXX1kuludtQlMP+2llKP
	7t1uuAG7+MdLLrA3gNZ4aWWz84dbmTCVhgST5Fn4qRwCcUJhb7IVr34hoRz2c/kkEc7B6hwpvmH
	Quj3C3mhts672HwIvHo+zO3RP02R8mf+sN5R/6FZElNgU6L7MdLIlwEpW34FZAMxypeMNVlJeJ8
	la+jUpMCWPD1VQJr
X-Received: by 2002:a05:600c:870b:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-441c494849emr95876035e9.27.1746536813083;
        Tue, 06 May 2025 06:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKiHs9FSOU2le8jbaL7mKTZ2hCbrm+SIQCEe6ODre4sZLo6XvFEwTUhXm7CFs6cxte9EBTOA==
X-Received: by 2002:a05:600c:870b:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-441c494849emr95873295e9.27.1746536810872;
        Tue, 06 May 2025 06:06:50 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.145.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecc89sm213870385e9.9.2025.05.06.06.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:06:50 -0700 (PDT)
Date: Tue, 6 May 2025 15:06:22 +0200
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
Subject: Re: [PATCH v3 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <pxtojuqebtk7pa5vjbhmiulydmgyutsbgxg2j5b6ziyxzqls35@qmmmcn4uwzie>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-5-sgarzare@redhat.com>
 <aBJGkSil1YAzSXsg@kernel.org>
MIME-Version: 1.0
In-Reply-To: <aBJGkSil1YAzSXsg@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YUWAB5L8e782WPWSf5QxiYO8C3nO-o_N114vbzH9ziI_1746536813
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_060656_809966_84BC77A7 
X-CRM114-Status: GOOD (  25.57  )
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

On Wed, Apr 30, 2025 at 06:49:37PM +0300, Jarkko Sakkinen wrote:
>On Mon, Apr 14, 2025 at 04:56:53PM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> This driver does not support interrupts, and receiving the response is
>> synchronous with sending the command.
>>
>> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
>> return responses in the same buffer used for commands. This way we
>> don't need to implement recv() op.
>>
>> Keep using the same pre-allocated buffer to avoid having to allocate
>> it for each command. We need the buffer to have the header required by
>> the SVSM protocol and the command contiguous in memory.
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>
>Similar comments, and a bit redundancy does not matter i.e., they can
>have pretty much the same explanation.

I see, I'll replace the "So we can set..." paragraph with your 
suggestion on the previous patch.

Thanks,
Stefano

>
>> ---
>>  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
>>  1 file changed, 11 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
>> index d3ca5615b6f7..db1983072345 100644
>> --- a/drivers/char/tpm/tpm_svsm.c
>> +++ b/drivers/char/tpm/tpm_svsm.c
>> @@ -25,38 +25,32 @@ struct tpm_svsm_priv {
>>  	void *buffer;
>>  };
>>
>> -static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>>  			 size_t buf_size)
>>  {
>>  	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>>  	int ret;
>>
>> -	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
>> +	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
>>  	if (ret)
>>  		return ret;
>>
>>  	/*
>>  	 * The SVSM call uses the same buffer for the command and for the
>> -	 * response, so after this call, the buffer will contain the response
>> -	 * that can be used by .recv() op.
>> +	 * response, so after this call, the buffer will contain the response.
>> +	 *
>> +	 * Note: we have to use an internal buffer because the device in SVSM
>> +	 * expects the svsm_vtpm header + data to be physically contiguous.
>>  	 */
>> -	return snp_svsm_vtpm_send_command(priv->buffer);
>> -}
>> -
>> -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
>> -{
>> -	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>> +	ret = snp_svsm_vtpm_send_command(priv->buffer);
>> +	if (ret)
>> +		return ret;
>>
>> -	/*
>> -	 * The internal buffer contains the response after we send the command
>> -	 * to SVSM.
>> -	 */
>> -	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
>> +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, buf_size);
>>  }
>>
>>  static struct tpm_class_ops tpm_chip_ops = {
>>  	.flags = TPM_OPS_AUTO_STARTUP,
>> -	.recv = tpm_svsm_recv,
>>  	.send = tpm_svsm_send,
>>  };
>>
>> @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
>>
>>  	dev_set_drvdata(&chip->dev, priv);
>>
>> +	chip->flags |= TPM_CHIP_FLAG_SYNC;
>>  	err = tpm2_probe(chip);
>>  	if (err)
>>  		return err;
>> --
>> 2.49.0
>>
>
>BR, Jarkko
>


