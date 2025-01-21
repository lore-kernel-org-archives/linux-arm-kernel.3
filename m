Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CBBC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pohg729KqjlON/Y3qVQcQ7ga5GWM9jcQEdryp7KPBOQ=; b=I5Oib+JYUsQuaKVPpdkPCRCMia
	PJIu1aQxdOpENkJAKFcN9CvyL1CuWP+2FT9MlWzjjhg4sEdE7+qS8cWGzLShBX/SqQAebm1859LjM
	DPq+eYcT5am+hOJcVZeuOVPLy8WzfXgEBQKvotH/hM91gHOAteiokxow7/SNMpFHdJ/UBar7Xu1zd
	rjjZ4GiT13EZJCZ6OQEWulqmi/3zV5pixRIRK2DmZbo4dulRSFSxuWUqbeTr1YqfETd1Yqb6oeSoB
	tQOBon7RgN/gfayqnv0PuuLN/Pclk0piiUp0eVPt8/oo8trRVP8NggVxLve8LBcoh5d3OC9lWLQWf
	f0dpCXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGxa-00000008LDR-0vpy;
	Tue, 21 Jan 2025 16:18:38 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taGwD-00000008KxN-2oE6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 16:17:14 +0000
Message-ID: <0ee72316-11e1-4930-8c49-92db8d148b8a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737476226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pohg729KqjlON/Y3qVQcQ7ga5GWM9jcQEdryp7KPBOQ=;
	b=iCT1BKHxy6GTT5TGP9OPEs5MRsWamD58cdpjuWiozNK06H7Xhzzt6y+XTjQCUiKS2AQ5sI
	sJTZA4n/kv8Q4XFqDqdQK1BdSl+x8ND896elX4zKQGhQxhbTJ4l+j4xvEAiLKm9KFXOhkT
	WFwYDIsCzpvhLGkMqSqqh2ItH2plyB0=
Date: Tue, 21 Jan 2025 11:17:03 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] spi: zynqmp-gqspi: Split the bus
To: Mark Brown <broonie@kernel.org>
Cc: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-6-sean.anderson@linux.dev>
 <DM4PR12MB76932590B9A6BB1CC17AD67FDCE62@DM4PR12MB7693.namprd12.prod.outlook.com>
 <1f7cb52d-31a4-458c-9b81-b46bf56fd8a8@linux.dev>
 <f1310bb6-48ef-4bdf-a359-f34b0d849a4d@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <f1310bb6-48ef-4bdf-a359-f34b0d849a4d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_081713_856970_B74F2B7B 
X-CRM114-Status: GOOD (  13.06  )
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

On 1/21/25 11:01, Mark Brown wrote:
> On Tue, Jan 21, 2025 at 10:53:53AM -0500, Sean Anderson wrote:
>> On 1/21/25 08:19, Mahapatra, Amit Kumar wrote:
> 
>> > IMHO, restricting users to fixed names is not ideal. A better approach would be to 
>> > introduce a Device Tree (DT) property for the bus number and select the bus 
>> > accordingly.
> 
>> Why? It's not an artificial restriction; it reflects the hardware. And this is how
>> SPI busses are typically represented. If you have two SPI busses, there should be
>> two devicetree nodes.
> 
> Perhaps the thing is more that the buses are named instead of numbered?

Well, we could number them, but it's not like they have different
addresses in memory. They use all the same registers except for a bit in
the genfifo. So it doesn't make sense to do address translation (e.g.
with reg/ranges).

As for the names, these are the names used by the documentation, as well
as the exising driver. There are some references to SPI0/SPI1, but there
are more to upper/lower. If you want to bikeshed spi-0/spi-1 instead of
spi-lower/spi-upper, be my guest.

--Sean

