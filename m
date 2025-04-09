Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A7CC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dT/1hWKYGtk5tJHR2fAw0xNnMbEghxXKOJUzMLmSe3U=; b=INJMiY5qnSOqxGDkQH9zWxYbGL
	qVhtCiu2bSVUVspJjB7ENmu5+eCIIoqokJrc6WiiD758Fxlc2TttjXSBG02wbB8JJ5c85Xi7sn7BR
	GyFKRr2U7bZdBHnCvV5gHeBzXQ98JTcWBoNQXymenIEguXQKRu5Kj6f8DHr7RUX6/kz8mvxtn88G0
	mQ/Wdn6fegjCqfBvRVi0kDOwirYVJKfEZXki2HwS1t3+6NexFi+fklBMpsKY77SJKXqB5e/MZU3IJ
	qZbndQ4rPoSECGaatLvXnfhqtWnHbozfRFDuxi043e09yzJqVmsGYFFDFvUiDHsyCjlrJGjyvJ1h1
	YvV+5iHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QYL-00000006XXj-45R4;
	Wed, 09 Apr 2025 08:12:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QLQ-00000006Uzv-3MTa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:59:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744185575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dT/1hWKYGtk5tJHR2fAw0xNnMbEghxXKOJUzMLmSe3U=;
	b=O++mKewzRp4OfcVuA6/hoouzBp1YlRoVKpYaEQhBu55tuD8y2QvlNo4eovafs/LU4WGZtk
	8deg0ldsD2kaqs59jpeyfLQIwBhM9MK2Z+KyPq/1lmX1MJkYVUtnBBIjiw/KpGtF41oT1K
	ePgpXCrd69I2oUMh7Sq4t6PMrCAA5wg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-u4ERJP5LOM6wiZcHyC_Ghw-1; Wed, 09 Apr 2025 03:59:34 -0400
X-MC-Unique: u4ERJP5LOM6wiZcHyC_Ghw-1
X-Mimecast-MFC-AGG-ID: u4ERJP5LOM6wiZcHyC_Ghw_1744185573
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac804089b99so47250766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 00:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744185573; x=1744790373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT/1hWKYGtk5tJHR2fAw0xNnMbEghxXKOJUzMLmSe3U=;
        b=Vtr8DVve1JO7q9tzUOWhGMgwEE6c87c/ueGMAfHjCPe3O4LFWsTscyLco+f/e/atsg
         GMzbWIP3TDFDLo+/9aBrWZ3RFtFHaWuytibM/M498G2WnSeVMVcR9bP6OQZIb6FA3o9r
         IiSKVAEoGArauAO+LdqNEhO6p1tAxfKLddQ+c1viZ/XZyAvXGyDFwgAMwcvGe5TJ7FJf
         6kXpFWXNERRK/9eaV6h0oJlL6R6zWifGP0CgE+/J3cP7fog1JQW8frUj2RH/MzDJOTn9
         TAZyzW7ORwRGvlsAYF1uC+QJCa7+9HU9Kb8s0ST9c9wFQ3GO23nglstQSa2b+L8QzhOb
         CtLw==
X-Forwarded-Encrypted: i=1; AJvYcCWm9manfnFqsDuYxUnxhwHqog+97U9gT9tH9Tb3UOgXd96LqovxdnrPoSlqHjQbY7opD1wHTCGE5mhn2D89tIH3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh3qg1EdkAkQRHjtqxzXcza97+4ijlKvXMg6buU5CEzwZWTooM
	mvjK29x/9dttgkA9OgSsjC6RXJ6sXhjwotxddg2fHrHlxudh3Th3JQjBdBG6AyiXACOvGfItz93
	2ZxMQ0xcHDYq9E/4444vurwbtbwO+Sdu50VsoXgXxBg7nFWx+Q8iFDi3MNR+gwoUcB75wuBr+
X-Gm-Gg: ASbGncuXpIEJz3tZuSNiLafDvr7TBI9zhtLlQuCzoPZd2hpxYY5AH5YneuccFpUJNs5
	jGDuUUEUrVJ/8OB9uJYCrcI+3w69XQYeUBfbt+dXszS+lLT82sFAoa91kcizcigOPl/T2FN7/3f
	PestH2Za2P4qh8ld5nvBPWBkCAJck3eeJOKhAH+q7otlMLxnHK8phXCL1Ux9VJ2Ijlk5RQm35kl
	M17Ghv0PCHM1hrrDevN6WdxwEr1xG5U+gmkDxxGbqDagSsUWoe/4ldAe/syxHgb71NV3kyGmPyl
	Ei4QuIQ3EcIXbR901R3vqWeOVLb1i7TVAJ8RUfqeEMZ2vwgTUk8Grke9rjET
X-Received: by 2002:a17:907:2d89:b0:aca:95ed:b9d1 with SMTP id a640c23a62f3a-aca95edc220mr253162366b.21.1744185572791;
        Wed, 09 Apr 2025 00:59:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDGZE5I848zF3RheNhsp0sylIGxiaPLv5p9KJ9kMUR0mVwOrwhhqxo8Y8n3wVy8ROJPh9oSw==
X-Received: by 2002:a17:907:2d89:b0:aca:95ed:b9d1 with SMTP id a640c23a62f3a-aca95edc220mr253159466b.21.1744185572086;
        Wed, 09 Apr 2025 00:59:32 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7322sm50505266b.164.2025.04.09.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:59:31 -0700 (PDT)
Date: Wed, 9 Apr 2025 09:59:26 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, 
	Jens Wiklander <jens.wiklander@linaro.org>, linuxppc-dev@lists.ozlabs.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Sumit Garg <sumit.garg@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-integrity@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v2 2/4] tpm: support devices with synchronous send()
Message-ID: <uhqvn5w5ziuzvp3u72kztkfbtkrb2g6ieejup4e2ufun4ywtko@4hcytxdrfues>
References: <20250408083208.43512-1-sgarzare@redhat.com>
 <20250408083208.43512-3-sgarzare@redhat.com>
 <Z_VBUozuHvbxdyB3@kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z_VBUozuHvbxdyB3@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 83DsJsMAs7hK_b_dze7IoqfuqHRwC38sr4l4HdS3A7g_1744185573
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_005937_992188_0018DDE8 
X-CRM114-Status: GOOD (  23.59  )
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

On Tue, Apr 08, 2025 at 06:31:30PM +0300, Jarkko Sakkinen wrote:
>On Tue, Apr 08, 2025 at 10:32:06AM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Some devices do not support interrupts and provide a single synchronous
>> operation to send the command and receive the response on the same buffer.
>>
>> Currently, these types of drivers must use an internal buffer where they
>> temporarily store the response between .send() and recv() calls.
>>
>> Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
>> If that flag is set by the driver, tpm_try_transmit() will use the send()
>> callback to send the command and receive the response on the same buffer
>> synchronously. In that case send() return the number of bytes of the
>> response on success, or -errno on failure.
>>
>> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
>> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  include/linux/tpm.h              |  1 +
>>  drivers/char/tpm/tpm-interface.c | 18 +++++++++++++++---
>>  2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>> index 2e38edd5838c..0e9746dc9d30 100644
>> --- a/include/linux/tpm.h
>> +++ b/include/linux/tpm.h
>> @@ -350,6 +350,7 @@ enum tpm_chip_flags {
>>  	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
>>  	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
>>  	TPM_CHIP_FLAG_DISABLE			= BIT(10),
>> +	TPM_CHIP_FLAG_SYNC			= BIT(11),
>>  };
>>
>>  #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
>> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
>> index 3b6ddcdb4051..9fbe84b5a131 100644
>> --- a/drivers/char/tpm/tpm-interface.c
>> +++ b/drivers/char/tpm/tpm-interface.c
>> @@ -114,8 +114,17 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>>  		return rc;
>>  	}
>>
>> -	/* A sanity check. send() should just return zero on success e.g.
>> -	 * not the command length.
>> +	/* Synchronous devices return the response directly during the send()
>> +	 * call in the same buffer.
>> +	 */
>
>Nit:
>
>/*
> * ...
>
>It's wrong in the existing comment.

Yep, I'll fix.

>
>> +	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
>> +		len = rc;
>> +		rc = 0;
>> +		goto out_send_sync;
>> +	}
>> +
>> +	/* A sanity check. send() of asynchronous devices should just return

And I'll fix also this of course.

>> +	 * zero on success e.g. not the command length.
>>  	 */
>>  	if (rc > 0) {
>>  		dev_warn(&chip->dev,
>> @@ -151,7 +160,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>>  	if (len < 0) {
>>  		rc = len;
>>  		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
>> -	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
>> +		return rc;
>> +	}
>> +out_send_sync:
>
>out_sync would be sufficient

sure, I'll fix in v3.

Thanks,
Stefano


