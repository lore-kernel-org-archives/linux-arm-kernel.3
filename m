Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0FDC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 22:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ez2C2OAgBeMciXBR/9ziwB88bSx7rB1jiAVUqpft0y0=; b=EVlGdh51pe7pIiyYJBHiIHfzhe
	XXNMZCa52n7zvjqV8ucWr7mVsK+YsSUumvBaqG3vTDx9HchJLoE/WiFS0+PLxwxrNH1hT/G/kupt1
	VlIaD1sbNFnfijn90+w5FLOKv75hLxGtult8dnrKjGt/QqzMBj35/VtuHIry/IutG8THHqPKYTp8S
	Tm5C2lXOucTM3te/PK5uglGAdoHFNFdgYrtfk3vlu0A+6teI7Nckfx7EXtp7m4vOOdVVrOBQMCiec
	qGqI09V4vcdXVTR7g/FVnIBXoBZrgy3fcyFJIxcAapQoyQuGxSzhr9pPzgrh4IcuZfpr58DcFp87f
	eikspBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPmu-0000000DtMv-25e4;
	Tue, 05 Aug 2025 22:05:40 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPkJ-0000000Dt3S-1xmB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 22:03:01 +0000
Message-ID: <3c426447-e2b9-4c81-8fc2-7cf7e36660d2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754431377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ez2C2OAgBeMciXBR/9ziwB88bSx7rB1jiAVUqpft0y0=;
	b=kr7O7WRwZkhdIDqHHSrr6Y8PAQhUdIndp5EkK8M0u59gQIN6aSpVFLbEvW3qqcaTSxaLb3
	82q31ru/fk3dAm7044JYssSMWy/ZmaIh5Bu1pmjmaTrU8CuPuWyBfvgBBtRto8zHOylQEw
	/1YgidHpvsbDWAj1OVOqPv6LngUqQIw=
Date: Tue, 5 Aug 2025 18:02:45 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 7/7] net: axienet: Split into MAC and MDIO
 drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@amd.com>,
 Leon Romanovsky <leon@kernel.org>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-8-sean.anderson@linux.dev>
 <c320da3b-6e55-474a-93d6-666092b70774@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <c320da3b-6e55-474a-93d6-666092b70774@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_150259_812312_1AC617E5 
X-CRM114-Status: GOOD (  13.40  )
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

On 8/5/25 17:40, Andrew Lunn wrote:
>> Fixes: 1a02556086fc ("net: axienet: Properly handle PCS/PMA PHY for 1000BaseX mode")
> 
> If this is for net-next, please don't have a Fixes: tag.

This is a fix. But as explained in the cover letter this is quite an
involved fix for an uncommon bug. I can target net if you like.

>>  struct axienet_common {
>>  	struct platform_device *pdev;
>> +	struct auxiliary_device mac;
>>  
>>  	struct clk *axi_clk;
>>  
>>  	struct mutex reset_lock;
>> -	struct mii_bus *mii_bus;
>> +	struct auxiliary_device mii_bus;
> 
> Keeping the name mii_bus for something which is not an struct mii_bus
> is going to cause confusion. Please give it a different name.

Like mdio?

> This is another patch which needs splitting up.

I don't think it can be split up in any major way. The whole conversion
of the MAC/MDIO portions of the driver has to be done at the same time
as the parent driver is converted to use them.

--Sean

