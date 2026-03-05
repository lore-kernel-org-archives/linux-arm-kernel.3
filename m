Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30948F30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdQrU4qXjTQ+7Me9O0jc4BQBHlE/G3e5V9tAzTNavKA=; b=Tj2JrTUK6l5V0oTMgBO+tbsdMQ
	x4Tzfm6O6QkKwfV7sZZ1zX4M/zlwaHFJ1la6mGhbPAeQ/rtnTWIABLGpSmARVe2XrI6Sh2CExQtNf
	P0DA4rFhrmLUYJ11h0iBdaMZxcToQzLDy6/Bi7paOrIstqdt7wucvlivQKqi+WyQuGwRNvgf2mXkK
	v8n9ruXEjY12v+tcV9IbwCq0Ilg4rgA9EFsSKxCzsCdtQAlxte++lpFkRwjEPiVJ1IHcDhPPGOWrx
	9E9uOMuay5YMbEXG/C4coxs+X1pR4LlvJ9QKL/SdfRQDYEIjO4pwsxljewRmixxXRwZoy4pXNLOIa
	hB8HUkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4y9-00000001NPL-3Ugc;
	Thu, 05 Mar 2026 09:26:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4y6-00000001NOI-35RO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:26:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0E9F21A2CD7;
	Thu,  5 Mar 2026 09:26:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D42755FDEB;
	Thu,  5 Mar 2026 09:26:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 905521036984E;
	Thu,  5 Mar 2026 10:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772702763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xdQrU4qXjTQ+7Me9O0jc4BQBHlE/G3e5V9tAzTNavKA=;
	b=XEQqk9leLVrIMuzk8bu7Hj6g5wiJ3yEC0RKVMO8iNt9vdNP9G705szS3WVJblHVezb+wqQ
	knRXsgJUpwXDcxt5LoA/+JHO+6D9EEohgAlgfqNL9KkER5FiXq1ZLhrNj5NNw3uTPWnmTs
	t60qOH/4vi76epX0K3q2ieHpmKKQnm1JXDW7+Nk1Nes2tXOJQMB+QeKKFU0TJRnNtVt9Ei
	Cvvb/na82PeG0J8h89D24oR8fTwfpCYmlAEjjUgLcopF/2InzieX8bq104U9VCdgtIGAME
	8//EWQik54BRtDpQ9YeDG8AbFsTMmwqlYzONPvxoMQAEzZY6vxFj1oyLCtavfA==
Message-ID: <2d65c928-8b4e-4224-93db-a1430945d719@bootlin.com>
Date: Thu, 5 Mar 2026 10:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-2-richard.genoud@bootlin.com>
 <5967652.DvuYhMxLoT@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <5967652.DvuYhMxLoT@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_012606_912789_9660789D 
X-CRM114-Status: GOOD (  19.18  )
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

Le 21/02/2026 à 10:13, Jernej Škrabec a écrit :
> Dne petek, 20. februar 2026 ob 17:10:06 Srednjeevropski standardni čas je Richard Genoud napisal(a):
>> The available length is really USER_DATA_LEN - 2 instead of just 2 (the
>> user data length minus the BBM length)
>> That doesn't change anything now, but if USER_DATA_LEN changes, it will.
> 
> s/USER_DATA_LEN/USER_DATA_SZ/
> 
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> 
> If this is really a fix as subject suggest, then Fixes tag is in order. However,
> this looks more like code refactor as end result is the same. So maybe
> reword subject?
Yes, it's more a code clarification, I'll reword that.

Thanks!

> 
> Best regards,
> Jernej
> 
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 9dcdc93734cb..c420909b944b 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -1761,12 +1761,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
>>   
>>   	/*
>>   	 * The first 2 bytes are used for BB markers, hence we
>> -	 * only have 2 bytes available in the first user data
>> +	 * only have USER_DATA_SZ - 2 bytes available in the first user data
>>   	 * section.
>>   	 */
>>   	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
>>   		oobregion->offset = 2;
>> -		oobregion->length = 2;
>> +		oobregion->length = USER_DATA_SZ - 2;
>>   
>>   		return 0;
>>   	}
>>
> 
> 
> 
> 


