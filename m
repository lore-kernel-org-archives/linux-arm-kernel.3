Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA21C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXWzRkiMkta7AXQW3GKZoQIEt3iuhCo3P5z2A+Zulxc=; b=G3d7Kh1BqJd8bsR+1WvNmGQU2j
	3Yz3M8t7N+84aWt/HF2nrPWY2t57IeVKQpkeWfzK3l6+DWG7iH6Vr3xTLVR/NrV4yTyF8QM3dXFNc
	VWzkdFani5korbi+UnlK2nRk17Jpj+qiFEVBMfLh+1UGsdQ9iSi9tGNZ/2oQHPb4sUaKikuJFruhm
	kzdbNB9oBVKWA2WHBl2X3j5oZvlqsVVRFgjjmkSydAE0YUrTzpM8jik4hp/NEZ4b8aN/nyUDHw+w5
	hLhGf0+umY+DVnow0taAQD0xFldyBznPBskX8vyrcEGb1nIyKjjx5VaYzNjSY+4W/awJPjKl8VXyF
	asxCwXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umArr-0000000DfYb-2ZH2;
	Wed, 13 Aug 2025 12:46:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um942-0000000DQrE-20g3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:50:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so58533555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082237; x=1755687037; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gXWzRkiMkta7AXQW3GKZoQIEt3iuhCo3P5z2A+Zulxc=;
        b=gOXw0W+B0IuwkiRSX9oBw1rkZH8u4GLjZwlQ418kMcf8JSVRxkMCsqKWQz7Tlfwvcp
         MDuqXPRqCItO6Qf85a/0v/+ayzuyr2h8DMymLHrwOdy10ixmZkffxCzJcNOzALN6XQGC
         O9f2f7XHZxTS9OV4KRnrXkuLAxQOiXXOD3v0x5Bt2QYFA1KLauSMXD+1EkDZkbyqMdBv
         N/tF+PYpqMlK6o7HeXxXVDneKo88bektgMa+xoLoL2gMDAmYItRlBgN1hWY2AZaj/1mB
         n7QrGLLxuM0IQlpuTVDIoTvQVsX3h8qwtJFsDZQpl3evTjg6Oby6Ct80pnxOOtq74zbZ
         9t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082237; x=1755687037;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXWzRkiMkta7AXQW3GKZoQIEt3iuhCo3P5z2A+Zulxc=;
        b=cpC+e1iUaVhTRJfnkOEGFQESbZjQvAocvOs0egmjg4AOoiXVtuHc8y1enx8MguEux+
         mLMKHOITPsQeCwL06erWeXXxwuX0c41PIiHVz+T6rUuwsEDNRecolSDYHXQjWAQVLEze
         5/7Kq8/IfGlkdWZQ92oIOHox4NRGdp0UB0JtP3sUcO/XU2zmd1ot/NF6yIhKjuB+sOB1
         U8iTNd/0A78uTMZiMDYS7wFcruZ+QhwInROu0ZhfzaKm+X2eSVBmTaOEm1Sks4tO28vv
         ZjBp5sxZxOnmws12QEbHFZdCHnZEz7x0Hh0T75McppoG0eVqD2tdo6/tQS+suwXiTu7J
         3O5w==
X-Forwarded-Encrypted: i=1; AJvYcCUnf216NNMR97vtNEeN93kNYi56G/yWfeEKGc2LL8F5Krq6mLrkDzL9hyjoLA5n2g5XNcr7sKG8bQOuTr4giWpm@lists.infradead.org
X-Gm-Message-State: AOJu0YxIGRVrqC1jmi+HCK1lQlPrzr3taGa1gbElqVS43ILDsDUT6a6V
	+y/Ve0grBjdggWPsHTw2f9MVZKUnwN6EsR9aYvN9ZyGFpa6BWDqzUMqy
X-Gm-Gg: ASbGncuFvITjd9gRQiQe8juvso3W+qGidXvYQ/49GhbuFQF6apsS7NW6UHAc7TXYehz
	UBhr0tASN5pDxCJGt33yJKKQkNxhJJgI8E7OcPt2zFHymLhIpRDlbTcRs9aTaqpPDUQPD5qjgpo
	E2gs9LwwLrIUj9Dxp7z3Wn1rDPXzljQnps5Pn4mh35nen/eK8l8KLXO8yXg3giHyKW2DIXFhH2L
	D2/iJwIgai2qeQBusKu8bhoBwgbJdKt14E/tuYE7sp2vrNNh9QsqP2n6CsSyD3+3tOghsVT3Ud4
	ZsJLtf2bcK8Cj0cpTVON7g5uRJ3YEIAcWCMVQOP0QVd7dMh3auKVHh6+Q0lhnzmcNlxgcPl0TTo
	Zn48oX32NAXaUlo3Jcgw2mNNs+8ZAl+np2S7YXl1oT1vDuIm9YGvDQ8NvcYFVbN849ZsJStRqSA
	==
X-Google-Smtp-Source: AGHT+IFfeNVkXHJUpoFaQ8q/KLnyc90CUdhzECYGMjZz7MgoGX4gYx9MY3J94IfFsD95TsIwFrL/DA==
X-Received: by 2002:a05:600c:4e93:b0:456:19be:5cc with SMTP id 5b1f17b1804b1-45a165ce311mr21270095e9.14.1755082236778;
        Wed, 13 Aug 2025 03:50:36 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c338c7dsm47505136f8f.0.2025.08.13.03.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:50:36 -0700 (PDT)
Message-ID: <27906f7b-b137-4af2-aa87-49519495a34d@gmail.com>
Date: Wed, 13 Aug 2025 12:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
 <aJpTHKbLbTz-Z3bo@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJpTHKbLbTz-Z3bo@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_035038_530195_894DE043 
X-CRM114-Status: GOOD (  28.65  )
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

2025. 08. 11. 22:31 keltezéssel, Andy Shevchenko írta:
> On Mon, Aug 11, 2025 at 09:49:57PM +0200, Gabor Juhos wrote:
>> Under some circumstances I2C recovery fails on Armada 3700. At least
>> on the Methode uDPU board, removing and replugging an SFP module fails
>> often, like this:
>>
>>   [   36.953127] sfp sfp-eth1: module removed
>>   [   38.468549] i2c i2c-1: i2c_pxa: timeout waiting for bus free
>>   [   38.486960] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
>>   [   38.496867] mvneta d0040000.ethernet eth1: unsupported SFP module: no common interface modes
>>   [   38.521448] hwmon hwmon2: temp1_input not attached to any thermal zone
>>   [   39.249196] sfp sfp-eth1: module removed
>>   ...
>>   [  292.568799] sfp sfp-eth1: please wait, module slow to respond
>>   ...
>>   [  625.208814] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>>
>> Note that the 'unsupported SFP module' messages are not relevant. The
>> module is used only for testing the I2C recovery funcionality, because
>> the error can be triggered easily with this specific one.
>>
>> Enabling debug in the i2c-pxa driver reveals the following:
>>
>>   [   82.034678] sfp sfp-eth1: module removed
>>   [   90.008654] i2c i2c-1: slave_0x50 error: timeout with active message
>>   [   90.015112] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
>>   [   90.020464] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
>>   [   90.027906] i2c i2c-1: log:
>>   [   90.030787]
>>
>> This continues until the retries are exhausted ...
>>
>>   [  110.192489] i2c i2c-1: slave_0x50 error: exhausted retries
>>   [  110.198012] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
>>   [  110.203323] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
>>   [  110.210810] i2c i2c-1: log:
>>   [  110.213633]
>>
>> ... then the whole sequence starts again ...
>>
>>   [  115.368641] i2c i2c-1: slave_0x50 error: timeout with active message
>>
>> ... while finally the SFP core gives up:
>>
>>   [  671.975258] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>>
>> When we analyze the log, it can be seen that bit 1 and 11 is set in the
>> ISR (Interface Status Register). Bit 1 indicates the ACK/NACK status, but
>> the purpose of bit 11 is not documented in the driver code unfortunately.
>>
>> The 'Functional Specification' document of the Armada 3700 SoCs family
>> however says that this bit indicates an 'Early Bus Busy' condition. The
>> document also notes that whenever this bit is set, it is not possible to
>> initiate a transaction on the I2C bus. The observed behaviour corresponds
>> to this statement.
>>
>> Unfortunately, I2C recovery does not help as it never runs in this
>> special case. Although the driver checks the busyness of the bus at
>> several places, but since it does not consider the A3700 specific bit
>> in these checks it can't determine the actual status of the bus correctly
>> which results in the errors above.
>>
>> In order to fix the problem, add a new member to struct 'i2c_pxa' to
>> store a controller specific bitmask containing the bits indicating the
>> busy status, and use that in the code while checking the actual status
>> of the bus. This ensures that the correct status can be determined on
>> the Armada 3700 based devices without causing functional changes on
>> devices based on other SoCs.
>>
>> With the change applied, the driver detects the busy condition, and runs
>> the recovery process:
>>
>>   [  742.617312] i2c i2c-1: state:i2c_pxa_wait_bus_not_busy:449: ISR=00000802, ICR=000007e0, IBMR=03
>>   [  742.626099] i2c i2c-1: i2c_pxa: timeout waiting for bus free
>>   [  742.631933] i2c i2c-1: recovery: resetting controller, ISR=0x00000802
>>   [  742.638421] i2c i2c-1: recovery: IBMR 0x00000003 ISR 0x00000000
>>
>> This clears the EBB bit in the ISR register, so it makes it possible to
>> initiate transactions on the I2C bus again.
>>
>> After this patch, the SFP module used for testing can be removed and
>> replugged numerous times without causing the error described at the
>> beginning. Previously, the error happened after a few such attempts.
>>
>> The patch has been tested also with the following kernel versions:
>> 5.10.237, 5.15.182, 6.1.138, 6.6.90, 6.12.28, 6.14.6. It improves
>> recoverabilty on all of them.
> 
> ...
> 
>> Note: the patch is included in this series for completeness however
>> it can be applied independently from the preceding patches. On kernels
>> 6.3+, it restores I2C functionality even in itself because it recovers
>> the controller from the bad state described in the previous patch.
> 
> Sounds to me like this one should be applied first independently on the
> discussion / conclusion on the patch 1.

Yes. At least the users would have a working although not optimal solution in
the meantime.

Regards,
Gabor

