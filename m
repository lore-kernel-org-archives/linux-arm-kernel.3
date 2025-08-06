Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55C0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2SJZ+WkY9JJeEOIvvNfCty+u80yCMpablRY/xpxidc=; b=Yyw+P6edH+Xx3C0aGJzXtGFJb8
	t7lBBVdira35//D+3b8GHyvmmvj9167tQ2CsQKRxhp9Ybmd+K/QclRKu+uF8zI2iM3dX1Atofwt1Q
	PmmQUXAZufrvxyMmHi0LJRQJGYnVBp/DaATdMSSMdGzaXm+2dZatqiStpQlcuQhbvoSMhtxDGkJ81
	UB/8u29Zp2r+LMhI4qSMP9t/0IZvEI9Wqs+cyY+uFmQguUsptrxBwRbpXzGciKjmbRD4sseBucOGy
	cQ22DJHg0fkCGuPCuAt5r629dViR93c2BSN/IQnl1abJJZGUS83G2o3ZHdACmJy53wFXJXwN/AEHI
	CoOhl+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaEa-0000000Ejxg-3x32;
	Wed, 06 Aug 2025 09:14:56 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uja3p-0000000EhyV-47s5;
	Wed, 06 Aug 2025 09:03:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BC1A42E80;
	Wed,  6 Aug 2025 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754471025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2SJZ+WkY9JJeEOIvvNfCty+u80yCMpablRY/xpxidc=;
	b=m1h55Hf8VZKSJxHXFh9xDevBv211iW+KdfELcDweNdedMwQTyjFCgPBdxYGqo8tRNcQlfR
	81Ub7UJjEPC3WwYXwArokgCufykW4OTShM5w778954lVUssyGkw7XGZ3gmMiauiv+mDvOg
	pGT4fChW9kWLrWG6Mtfdtn3t4cKuK8ahYxRb29T7v0gaO+yHJWWYxfDjICR4JUo8LsaTbL
	2F35PG4l7NzS8EwwWwe14hKyjxQ4ntouLF/5ap4rbNgq5juZwPJ/JcqP/n5SKdKbTE+fHc
	A6vQltP2e0YGTjoYf8Ga5V9B85+7x74zG3ltQasDqI9wWgOLkIwr5fSbUomVfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu
 <ray.liu@airoha.com>,  Mark Brown <broonie@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH 2/4] drivers: mtd: spi-nand: try a regular dirmap if
 creating a dirmap for continuous reading fails
In-Reply-To: <74646064-0c8c-46b9-8ec3-653c4f80b70f@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Tue, 5 Aug 2025 18:35:32 +0300")
References: <20250804192132.1406387-1-mikhail.kshevetskiy@iopsys.eu>
	<20250804192132.1406387-3-mikhail.kshevetskiy@iopsys.eu>
	<87jz3hhjlj.fsf@bootlin.com>
	<74646064-0c8c-46b9-8ec3-653c4f80b70f@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 06 Aug 2025 11:03:43 +0200
Message-ID: <87cy98g6ts.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehmihhkhhgrihhlrdhkshhhvghvvghtshhkihihsehiohhpshihshdrvghupdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlohhrvghniihosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrgihrdhlihhusegrihhrohhhrgdrtghomhdprhgtphhtthhopegsrhhoohhnihgvs
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehmmhhkuhhrsggrnhhovhesshgrlhhuthgvuggvvhhitggvshdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_020350_850771_C03B6584 
X-CRM114-Status: GOOD (  12.70  )
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

Hello,

>>> @@ -1114,11 +1114,32 @@ static int spinand_create_dirmap(struct spinand=
_device *spinand,
>>>=20=20
>>>  	spinand->dirmaps[plane].wdesc =3D desc;
>>>=20=20
>>> -	if (spinand->cont_read_possible)
>>> +	desc =3D NULL;
>>> +	if (spinand->cont_read_possible) {
>>> +		/*
>>> +		 * spi-controllers may return an error if info.length is
>>> +		 * too large
>>> +		 */
>>>  		info.length =3D nanddev_eraseblock_size(nand);
>>> -	info.op_tmpl =3D *spinand->op_templates.read_cache;
>>> -	desc =3D devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
>>> -					  spinand->spimem, &info);
>>> +		info.op_tmpl =3D *spinand->op_templates.read_cache;
>>> +		desc =3D devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
>>> +						  spinand->spimem, &info);
>>> +	}
>>> +
>>> +	if (IS_ERR_OR_NULL(desc)) {
>> Here if the problem is continuous reading, I expect an error and not a
>> NULL pointer.
> NULL is possible if flash does not supports continuous reading
>>
>>> +		/*
>>> +		 * continuous reading is not supported by flash or
>> Not by the flash, here if we get an error, it is the spi controller
>> (still without '-' ;) ) that fails (please fix the comment).
>
> we can go here in 2 cases:

Yes, and that is misleading. It feels like the code is unclear this
way. Could we find a better organization?

> 1) spinand->cont_read_possible is false (flash does not supports
> continuous reading)
>
> 2) spi controller returns an error (spi controller does not like
> continuous reading)

Thanks,
Miqu=C3=A8l

