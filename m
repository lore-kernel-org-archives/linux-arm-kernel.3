Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A775DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZokMrKPeHOXql6MRfjxfjyRJSF/rWwkzlkixJHlCYg=; b=ddl8dDkVEQQLD9mxhEP8ECLjen
	FGd1L6fp3wb/X5ArSuG6iXAwM/nosX6mBlTJ8cT4W6Kx9d62QH3dGDL1CKkjFtw1NRHuQY6/anMTj
	zNI+AoIYS7F5znv9n9TK11DI5dBaJl8Uy25qet47EV/cKdXizc/inp09X2ztzQZ6/TFMyKjjitQ+e
	PvbtrgWZdgyH7faXx+eAb1PzGxgVWcTthyZJTL4Z0XqOh4+0arqwvDmLBQ368h4yYFfYngFbJxABO
	/agHT+J8DWpsgSRAXKg7RDoVIvPsyFsMXgkv6monvY85YJn8ltcHMQ1zc2DJMMKx8682hza18egmS
	BSZXoNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGb6-00000008H82-0pwH;
	Tue, 21 Jan 2025 15:55:24 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taGZn-00000008Gug-2BIW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 15:54:05 +0000
Message-ID: <1f7cb52d-31a4-458c-9b81-b46bf56fd8a8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737474836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZokMrKPeHOXql6MRfjxfjyRJSF/rWwkzlkixJHlCYg=;
	b=ltTGjO+NrkTZGtg6DDswxPOrt10T//WbFgRH7INoiGNS2JmVu/erqpzFMmavJFLS/1mbim
	3jk5NqepV0m767M+qKoffQOtGu4lzfGqM+Zjfp9i35l+HchGxpX9LXKAhtxnPajDBkPiyx
	2LClPhSaD2LptmXdKGcVazYE2C1MUXQ=
Date: Tue, 21 Jan 2025 10:53:53 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] spi: zynqmp-gqspi: Split the bus
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 Mark Brown <broonie@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-6-sean.anderson@linux.dev>
 <DM4PR12MB76932590B9A6BB1CC17AD67FDCE62@DM4PR12MB7693.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <DM4PR12MB76932590B9A6BB1CC17AD67FDCE62@DM4PR12MB7693.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_075403_703929_46707FD6 
X-CRM114-Status: GOOD (  13.34  )
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

On 1/21/25 08:19, Mahapatra, Amit Kumar wrote:
> Hello Andreson,
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@linux.dev>
>> Sent: Friday, January 17, 2025 4:51 AM
>> To: Mark Brown <broonie@kernel.org>; Simek, Michal <michal.simek@amd.com>;
>> linux-spi@vger.kernel.org
>> Cc: Jinjie Ruan <ruanjinjie@huawei.com>; linux-arm-kernel@lists.infradead.org;
>> Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>; linux-
>> kernel@vger.kernel.org; Miquel Raynal <miquel.raynal@bootlin.com>; Sean
>> Anderson <sean.anderson@linux.dev>
>> Subject: [PATCH 5/7] spi: zynqmp-gqspi: Split the bus
>> 
>> This device supports two separate SPI busses: "lower" (SPI0) and "upper"
>> (SPI1). Each SPI bus has separate clock and data lines, as well as a hardware-
>> controlled chip select. The busses may be driven independently, with only one bus
>> active at a time, or in concert, with both busses active. If both busses are driven at
>> once, data may either be duplicated on each bus or striped (bitwise) across both
>> busses.
>> 
>> The current driver does not model this situation. It exposes one bus, where CS 0
>> uses the lower bus and the lower chip select, and CS 1 uses the upper bus and the
>> upper chip select. It is not possible to use the upper chip select with the lower bus
>> (or vice versa). GPIO chip selects are unsupported, and there would be no way to
>> specify which bus to use if they were.
>> 
>> To conserve pins, designers may wish to place multiple devices on a single SPI bus.
>> Add support for this by splitting the "merged" bus into an upper and lower bus. Each
>> bus uses a separate devicetree node and has a single native chipselect 0. If "lower"
> 
> IMHO, restricting users to fixed names is not ideal. A better approach would be to 
> introduce a Device Tree (DT) property for the bus number and select the bus 
> accordingly.

Why? It's not an artificial restriction; it reflects the hardware. And this is how
SPI busses are typically represented. If you have two SPI busses, there should be
two devicetree nodes.

--Sean


