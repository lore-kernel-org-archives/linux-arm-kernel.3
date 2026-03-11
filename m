Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA93112586B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MutVfPR2cCmBpoNpRIeERLqop6dCiw9BilsvzwhwsaE=; b=uT3I0AYzONO4V35EZL4sQZ2ZNH
	ALzIxQ3zHbVegJABuBs0JndEkV5h2bjC+li2QIj2icPXNs5dGAjyqIgmXH/502dxXYsL2MXQi4jMn
	I/JCfzqZu3gEjXU8xqrBTn8C9++Wmc9og85UszBw3GbICtLk6HFTFPBOhXun40fvXsN+6B7DZhr1R
	kt6ydzt8Th5cakRjP6Fdd8mqFFkrZ5eVKtSDseYq+GGyGGoh1GmP8n4UwiwOObjTnrB9tq7J5kINk
	DPSVFUpZ7kjVKaSbuO+4ijdmafvg0z3ublLV2EQ/4DjXQQLnWwYc83fhO4kF406i8AbffF47DAbx4
	GsBH2qGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OtE-0000000CHPV-3Ozz;
	Wed, 11 Mar 2026 19:06:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OtC-0000000CHOH-1mEX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:06:39 +0000
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9587379;
	Wed, 11 Mar 2026 20:05:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773255928;
	bh=VbsesXy4cGJY3Bz+mG4mbStpBp+srD97jXefZADi4LU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hJD0rGslTeBltubUF4ThwItbJ/P6C8YGmsIVk2i5WDHXG0OAfbUU03ipna04e97Ml
	 N3SygGEPO2B5XQTBgO0c3aNDicaIRwRaXdUbEYcy+z9xWYjW3Fk42MmIhlnn03opMo
	 n2RXlHH2ZEmx/fxSCTtCPVLSTPSAO4MqBdsaGZZA=
Message-ID: <84d1a341-147b-46a6-ba2a-36f905a26d80@ideasonboard.com>
Date: Wed, 11 Mar 2026 19:06:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: imx: Don't recover bus when arbitration lost
To: Frank Li <Frank.li@nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260311-i2c-imx-fixes-v1-0-e625034d8202@ideasonboard.com>
 <20260311-i2c-imx-fixes-v1-1-e625034d8202@ideasonboard.com>
 <abGNjJnf40fqPz4s@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <abGNjJnf40fqPz4s@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_120638_607720_31044B92 
X-CRM114-Status: GOOD (  18.21  )
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

Hi Frank

On 11/03/2026 15:43, Frank Li wrote:
> On Wed, Mar 11, 2026 at 11:47:43AM +0000, Daniel Scally wrote:
>> The i2c-imx driver runs i2c_recover_bus() if i2c_imx_start() fails.
> 
>> One of the failure modes is an arbitration-lost signal from the
>> hardware however, to which bus recovery is not the right response.
>>
> 
> Supposed
> 
> One of the failure modes is an arbitration-lost signal from the second I2C
> master or slave devices, which is expected behavor. Specially two masters
> try to control the bus simultaneously.
> 
> So bus recovery is not the right response for this case. Add check -EAGAIN
> of i2c_recover_bus() to avoid wrong action.
> 
> Fixed tags here!

Ack - thanks, I'll make the changes for v2.
> 
> Frank
> 
>> Do not try to recover the bus if it loses arbitration during start.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/i2c/busses/i2c-imx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>> index 85f554044cf1eec7d28310c3d9e7a7346237afdb..ed2316ab1ba8b6261dabe8af4377136a002e2f0b 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -1539,7 +1539,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>>
>>   	/* Start I2C transfer */
>>   	result = i2c_imx_start(i2c_imx, atomic);
>> -	if (result) {
>> +	if (result && result != -EAGAIN) {
>>   		/*
>>   		 * Bus recovery uses gpiod_get_value_cansleep() which is not
>>   		 * allowed within atomic context.
>>
>> --
>> 2.43.0
>>


