Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA93D5C0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2D/ob5yIVb7qub0SeY7blQIeUFxiZ9h57KLPeQrxZ/w=; b=lDfTE3dfxotMB6XxGnNjks6lQD
	hB1JqTzF8eYxNldWso7zQcPLLhRzVtNTgp1KR7YCELbCNd0viUiu60BVJCiHST67GcgRPd6404umu
	2XVZSJL0Jv2OaaoiSCpd4kivVdG9C0UJFuN6k4U16jayq7jQw3v1eM/wND5BXwP6/Fh3QICxQ/VVl
	wKuwyNDUGOoi6frW3l6780KqoCSK7q43U/XzwXgeoN/eMuYhJB+syxuMapjAvuR7JjhHQZHFWG/0w
	+uyrUgc9QW5ewj0HTdaIJvtFuAC2g/59/1PZqAdrmNzpnmZ61VYQuEOvk1Qnaalu5H1Bx7yjo1Pz4
	QhnND3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWLo-00000005NwY-1HRy;
	Tue, 16 Dec 2025 14:48:32 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWLk-00000005Nsm-1QxM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:48:30 +0000
Message-ID: <540737b2-f155-4c55-ab95-b18f113e0031@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765896492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2D/ob5yIVb7qub0SeY7blQIeUFxiZ9h57KLPeQrxZ/w=;
	b=iy7oveTEd8UA8a5GYnnZLI0WInS4zo1ZY/C3kCe/tTH/iv2V5fGlkFW+cGmKPtvkuIo6tu
	iio2LdBBgg7JjQ+NVZ6MnD2z87Kk+vp4xLR85gMQEHwARVKYb9+8I7JRYkB6ofQMZ7Gu6u
	YhMTfJeHRJ7Y7yv5CQBQMWd2Wsz+liQ=
Date: Tue, 16 Dec 2025 09:48:00 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 1/7] net: axienet: Fix resource release
 ordering
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Simek, Michal" <michal.simek@amd.com>, Leon Romanovsky <leon@kernel.org>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-2-sean.anderson@linux.dev>
 <9572f798-d294-4f24-8acb-c7972c1db247@lunn.ch>
 <SA1PR12MB6798CD01D26F4A68D6F7A214C9AAA@SA1PR12MB6798.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <SA1PR12MB6798CD01D26F4A68D6F7A214C9AAA@SA1PR12MB6798.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064828_872574_2108F3B6 
X-CRM114-Status: GOOD (  13.75  )
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

On 12/16/25 06:53, Gupta, Suraj wrote:
> [Public]
> 
> Hi,
>> -----Original Message-----
>> From: Andrew Lunn <andrew@lunn.ch>
>> Sent: Wednesday, August 6, 2025 2:29 AM
>> To: Sean Anderson <sean.anderson@linux.dev>
>> Cc: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Andrew Lunn
>> <andrew+netdev@lunn.ch>; David S . Miller <davem@davemloft.net>; Eric
>> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
>> Abeni <pabeni@redhat.com>; netdev@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>; Simek, Michal <michal.simek@amd.com>;
>> Leon Romanovsky <leon@kernel.org>; Gupta, Suraj <Suraj.Gupta2@amd.com>
>> Subject: Re: [PATCH net-next v4 1/7] net: axienet: Fix resource release ordering
>>
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>>
>>
>> > +static void axienet_disable_misc(void *clocks) {
>> > +     clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, clocks); }
>> > +
>>
>> ...
>>
>> >       ret = devm_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS,
>> lp->misc_clks);
>> >       if (ret)
>> > -             goto cleanup_clk;
>> > +             return dev_err_probe(&pdev->dev, ret,
>> > +                                  "could not get misc. clocks\n");
>> >
>> >       ret = clk_bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
>> >       if (ret)
>> > -             goto cleanup_clk;
>> > +             return dev_err_probe(&pdev->dev, ret,
>> > +                                  "could not enable misc. clocks\n");
>> > +
>> > +     ret = devm_add_action_or_reset(&pdev->dev, axienet_disable_misc,
>> > +                                    lp->misc_clks);
>>
>> It seems like it would be better to add
>> devm_clk_bulk_get_optional_enable(). There is already an
>> devm_clk_bulk_get_all_enabled() so it does not seem like too big a step.
>>
>>         Andrew
> 
> We are interested in this patch to fix AXI Ethernet probe path and can collaborate on upstreaming it.

Feel free to modify it as suggested by Andrew.

Unfortunately I have not had time to work on this series recently and probably
won't be able to return to it for another few months.

--Sean

