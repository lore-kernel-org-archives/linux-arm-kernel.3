Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D4DF30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb47bLopwDRLC5J3uAYZg0LFklpkyKvQunefwmeTams=; b=C3/vPvuUf6KEHaE/uGkzXVeRNI
	G1ivLF9FMipNQqRpoNcZU5X0gM/oQPFTFPbY6hTh14uTcLUdWRVDHSlAXcOHJFLKXaXEX+16w+rrQ
	jfWq1X8P75inHWpFfIb+jA3BoLDJpeCyRgrvj3r6x7/BOsKKWh+f7xdaM8o0CFRWQSPcANAHh7Nrh
	SywMNXAniDwQqOd8KoYURo9xBWHfMJrztXgtqdOz9pZw7AMSChma83JozfzLb9OK9i40VlsGyA6bC
	SHZYLwT+GlYIcb4Xt+cCSI1kJ/TojyyyV5pfVyRDpy/TiJQR63B05PaZPov/ryJB8DBkjSjjxQemm
	i8vKmdjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5F4-00000001Qi2-2ymg;
	Thu, 05 Mar 2026 09:43:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5F2-00000001Qhe-3xFk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=sb47bLopwDRLC5J3uAYZg0LFklpkyKvQunefwmeTams=; b=b8dnDa0q9B3EuURt3CpttxG30z
	bQHzPW18QzbUtLaKWZ7mfccFFNfn7lNjEsV/mQDRlB8ybOuXxcdNh/9XD3Qp8C3Z7Bwbo+QvePj0z
	zLTp2xOd4UCvtVV2DfhGDCdn3hLXwVf/7o6zjsZNdwJ1C9x898PdyukvlntsHrYStLzSdNi/WgTD8
	f41LdbGXOglUulva87EQjRXLEdufNnHEib5qFSILgmjifCtAjqlyybNQKyVBIjTpm4mjlJDkU2B6l
	1O1q9HfKJbSH6gZu5WXv76BWI4T3X44yUSeQeox6hiH1svfwPpvJlX5mKmTPlAKwCGvVr//BekxmE
	xM1ffyjg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Ez-0000000ElZX-2f0V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:43:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E7C1C40414;
	Thu,  5 Mar 2026 09:43:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3A955FDEB;
	Thu,  5 Mar 2026 09:43:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CF8F103697F1;
	Thu,  5 Mar 2026 10:43:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772703808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sb47bLopwDRLC5J3uAYZg0LFklpkyKvQunefwmeTams=;
	b=bXK1gu6J7ay7a68D7nPXR5xQVhLiZacnJbh1I8p2gZN0vPfoA531M2Gbc0LCIezghjQNOW
	H+Ro4ekCByLVmspDgNulHKjWBokdS+IxN+3o2XSFe55qW+xSiGZCCyreXbg89CwlnK50bc
	tX4KHC2uitPqueFNnhdLLJMDXbmgtxGdrWHko5gksW/Z6ghDSJY7eNc/nW2Nk3SwBeqx4q
	IIh2A1U5ybayI80OJ/fk8nElwnvGUdyCP5e7JaljnjNX3foSJ/TFPfR5lN0Wi70qvGKjPY
	6TlESW/0auIYXl7znkgKolv3sYAkQXPIrtD/B38fDX/Ucct6cOespDUAV5QmMw==
Message-ID: <c3676b98-a0d2-402a-8d6e-8eb0325d32ef@bootlin.com>
Date: Thu, 5 Mar 2026 10:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 James Hilliard <j.hilliard@upstreamdata.ca>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-4-richard.genoud@bootlin.com>
 <1947198.tdWV9SEqCh@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <1947198.tdWV9SEqCh@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_094333_736506_10CD93BD 
X-CRM114-Status: GOOD (  21.88  )
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

Le 21/02/2026 à 10:21, Jernej Škrabec a écrit :
> Dne petek, 20. februar 2026 ob 17:10:08 Srednjeevropski standardni čas je Richard Genoud napisal(a):
>> BBM is part of USER_DATA section, so we should remove it twice
>>
>> This was working ok because we are on the safe size, advertising that
>> there was 2 bytes less available than reality.
> 
> Missing "in" before "reality".
ok

> 
>>
>> But we can't change old platforms, since it may lead to a different ECC
>> strength, so, introduce a legacy flag for old platforms, and switch the
>> new platforms to the correct count.
> 
> There aren't any users of H6/H616 driver, right? If it would be, ECC strength
> can't be changed, since it can impact systems, which already use it.
AFAIK, the only users for now would be on whatsminer boards and are not 
impacted by this (the ECC strength won't change from 32 to 40bits on 
those boards).
(Adding James in Cc, as he may know more on the subject)

> 
> Best regards,
> Jernej
> 
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 9c6e0625e34f..99d305bbda53 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -281,6 +281,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
>>    * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
>>    * @has_ecc_clk:	If the controller needs an ECC clock.
>>    * @has_mbus_clk:	If the controller needs a mbus clock.
>> + * @legacy_max_strength:If the maximize strength function was off by 2 bytes
>> + *			NB: this should not be used in new controllers
>>    * @reg_io_data:	I/O data register
>>    * @reg_ecc_err_cnt:	ECC error counter register
>>    * @reg_user_data:	User data register
>> @@ -310,6 +312,7 @@ struct sunxi_nfc_caps {
>>   	bool has_ecc_block_512;
>>   	bool has_ecc_clk;
>>   	bool has_mbus_clk;
>> +	bool legacy_max_strength;
>>   	unsigned int reg_io_data;
>>   	unsigned int reg_ecc_err_cnt;
>>   	unsigned int reg_user_data;
>> @@ -1811,10 +1814,22 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>>   		ecc->size = 1024;
>>   		nsectors = mtd->writesize / ecc->size;
>>   
>> -		/* Reserve 2 bytes for the BBM */
>> -		bytes = (mtd->oobsize - 2) / nsectors;
>> +		/*
>> +		 * The 2 BBM bytes should not be removed from the grand total,
>> +		 * because they are part of the USER_DATA_SZ.
>> +		 * But we can't modify that for older platform since it may
>> +		 * result in a stronger ECC at the end, and break the
>> +		 * compatibility.
>> +		 */
>> +		if (nfc->caps->legacy_max_strength)
>> +			bytes = (mtd->oobsize - 2) / nsectors;
>> +		else
>> +			bytes = mtd->oobsize / nsectors;
>>   
>> -		/* 4 non-ECC bytes are added before each ECC bytes section */
>> +		/*
>> +		 * USER_DATA_SZ non-ECC bytes are added before each ECC bytes
>> +		 * section, they contain the 2 BBM bytes
>> +		 */
>>   		bytes -= USER_DATA_SZ;
>>   
>>   		/* and bytes has to be even. */
>> @@ -2379,6 +2394,7 @@ static const u8 sunxi_user_data_len_h6[] = {
>>   
>>   static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
>>   	.has_ecc_block_512 = true,
>> +	.legacy_max_strength = true,
>>   	.reg_io_data = NFC_REG_A10_IO_DATA,
>>   	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
>>   	.reg_user_data = NFC_REG_A10_USER_DATA,
>> @@ -2400,6 +2416,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
>>   static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
>>   	.has_mdma = true,
>>   	.has_ecc_block_512 = true,
>> +	.legacy_max_strength = true,
>>   	.reg_io_data = NFC_REG_A23_IO_DATA,
>>   	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
>>   	.reg_user_data = NFC_REG_A10_USER_DATA,
>>
> 
> 
> 
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

