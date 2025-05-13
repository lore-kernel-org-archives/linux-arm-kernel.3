Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC775C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CZBKCEKg6MIgb42M1L3z+fSuwPIFwgQItnKgPnpedw=; b=Omb6Wpp1nvTzaCIgIhJfksyZtK
	I1IfmgLs/5e8a0TunLIBvgXnsovrz1De+v0/leXPB+pDKR0NJEXqPL8K2vgeegqay9UQyisHndGpb
	5a5YAR7X8dqJVSsuoDI7dcHDxVyEIZSRi8EGn43/HWMPM8mXytDF0ceT3d6OpiwXSdHM4ZVIRfYBM
	GzwwWdO+EW8ezj+UQKqvQcycI3Sctz4gL8kSTQCkwrDWlxWhiKyLU9/P/GLDek9Ir7cSb/axolU42
	wZJ1qCiGm4mLW14htIZgPU9WfQ+n4pToU5M1eY2X4dDX8mGDmr03fJDgpECbVTF5wIYzSH0OwHYSb
	jaNpj+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqHO-0000000CZWu-34Lj;
	Tue, 13 May 2025 14:06:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqDy-0000000CZ9l-3hyW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747144991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/CZBKCEKg6MIgb42M1L3z+fSuwPIFwgQItnKgPnpedw=;
	b=eEjydRv5SlKvBg0EvyDtpXuhocqgeqrnCyRzNq3gxEa9kzW5BDRMna9XlltwwhnIqE8vP4
	/Pa43m0GfyI1Aw8i/8b2Uaj1Ezt+DNPlaNDvqrGEp+8D1JAIMdsf0nZubZbKXi8GipOuhU
	NO33JU5o7GejHgIvq1KsWB9uaw8+Pk0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-ONFz31WdNZiSShKcFIjuXA-1; Tue, 13 May 2025 10:03:10 -0400
X-MC-Unique: ONFz31WdNZiSShKcFIjuXA-1
X-Mimecast-MFC-AGG-ID: ONFz31WdNZiSShKcFIjuXA_1747144989
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-440667e7f92so27739805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 07:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144989; x=1747749789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CZBKCEKg6MIgb42M1L3z+fSuwPIFwgQItnKgPnpedw=;
        b=oh701qA3vmWKmuEfy1I/qPf1bOhRkKkG7/M0ddFepOGxgxyHaRbaigYhXCFdzQtmAV
         a5DgrEEXs1WitJGlDTqNAgco3bT4D+ZbDVqe9/milH1Q7z8uBtBkgZisT8Kmz96Afk4p
         HK8SY5V38+hvTm3rLqZ5IW/QYhYDnRs5anVxDYOAMetlK94KyD50b0r3fAk7LERXd24+
         CPAt5DxbEH/xwTnN+2cKd7oQYSpnAhEYsAXUyZuYtdrO4Q5YI2qtUXrVHOzMfImTItkt
         D8oRAinDNueW7lGJj2M1kUM4xA2Wfg2YGkEtiAkdfpXuTD+bzKJ1wXWyXF8jjE/NVzUV
         2r/g==
X-Gm-Message-State: AOJu0Ywo6lM+EvLjfE5MBTrOSqdmJpLXs4a7cVhkx1Az2qSQn/cC3L4S
	Hgogn6GFjC2hqlZAaZdIuzmPAakIgG2ACCY0kwkFHsAoBgGbHzmmEFWN/Ox7E8nK1T12XAgJ2XH
	1Udohj5DIBkBJtORWAiUAdiXdXQAB2u5wxTWLv44DnEylMfbvu/6n1qusFHvrm2ip+VxJ5hYu
X-Gm-Gg: ASbGncvIMTmHVhprXUv202vIfKANx+kC7OunylaC2ajYpaal1eENdFc2u4lppEbvPfB
	uWLKkSl3J8jh3+iHShsbuvqMpcicZG1N18ePKuAtqr/naKHJ5cejsz4zk+KI6HM4P7QFw/Igguq
	bR5FF3r7TJVPzRRh83iWhoMQR4gcgsjTIYhWdzDweGv5ZbMkSefPKuBeQrPTHYKUnF8UEhSjcxT
	NoTg3YwILJrPhSgVt9uhndjJ18fONgsO6lMWhEprDX8ubQogYQbEviqhPneXDAdHghKaJ7zGQm4
	21QG3T/bqUizy78=
X-Received: by 2002:a05:600c:3b0e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d6ddea12mr180192505e9.31.1747144987618;
        Tue, 13 May 2025 07:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8ZEKfjvThnHZ+qakwjJU5Vxx01h+as7nBLYm3yQHV3qHfmOsUVNBWy0KLHWObtc49rSNQEg==
X-Received: by 2002:a05:600c:3b0e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d6ddea12mr180190615e9.31.1747144986468;
        Tue, 13 May 2025 07:03:06 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.148.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f33b5sm16661205f8f.54.2025.05.13.07.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:03:05 -0700 (PDT)
Date: Tue, 13 May 2025 16:02:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Peter Huewe <peterhuewe@gmx.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Naveen N Rao <naveen@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, linux-integrity@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicholas Piggin <npiggin@gmail.com>, Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [PATCH v4 1/4] tpm: add buf_size parameter in the .send callback
Message-ID: <vasgjrd5s3km4vdhyimcqq6etf7rvi2r54zrajrwioebrxl7o5@xyi5h2yxk36z>
References: <20250509085713.76851-1-sgarzare@redhat.com>
 <20250509085713.76851-2-sgarzare@redhat.com>
 <aB8D5syofPSqjzns@kernel.org>
MIME-Version: 1.0
In-Reply-To: <aB8D5syofPSqjzns@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fMEgNK9EEfTNCGE6KV-JDWUKFojZRBHJDNFmNuN54cQ_1747144989
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_070315_017062_11003A10 
X-CRM114-Status: GOOD (  20.45  )
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

On Sat, May 10, 2025 at 10:44:38AM +0300, Jarkko Sakkinen wrote:
>On Fri, May 09, 2025 at 10:57:10AM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Add a new `buf_size` parameter to the `.send` callback in `tpm_class_ops`.
>> This parameter will allow drivers to differentiate between the actual
>> command length to send and the total buffer size. Currently `buf_now` is
>> not used, but it will be used to implement devices with synchronous send()
>> to send the command and receive the response on the same buffer.
>>
>> Also rename the previous parameter `len` to `cmd_len` in the declaration
>> to make it clear that it contains the length in bytes of the command
>> stored in the buffer. The semantics don't change and it can be used as
>> before by drivers. This is an optimization since the drivers could get it
>> from the header, but let's avoid duplicating code.
>>
>> While we are here, resolve a checkpatch warning:
>>   WARNING: Unnecessary space before function pointer arguments
>>   #66: FILE: include/linux/tpm.h:90:
>>   +	int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>>
>> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> v4:
>> - rework the commit description [Jarkko]
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
>> index 9ac9768cc8f7..7ac390ec89ce 100644
>> --- a/include/linux/tpm.h
>> +++ b/include/linux/tpm.h
>> @@ -87,7 +87,8 @@ struct tpm_class_ops {
>>  	const u8 req_complete_val;
>>  	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
>>  	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
>> -	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
>> +	int (*send)(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>> +		    size_t buf_size);
>
>I'm sorry but now that I look at this, just for the sake of consistency:
>
>	int (*send)(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>		    size_t cmd_len);
>
>I.e. match the order and parameter names from tpm_try_transmit().

Ah, I see, makes sense, I'll update and send v5.

Thanks,
Stefano


