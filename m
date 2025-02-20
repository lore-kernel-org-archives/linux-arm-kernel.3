Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08553C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSAZDU3AQ1VuBM+5kuWntriYIhfJE92ii0LczQ8TURY=; b=ipp4q0QBz8sEtT3Vt+DQ9crlBU
	kGoUeKkgpJLrE/WZ5KM+1Z5gd+N1XL7pk5T1TRzyvAyAv5q2twidl9HGvWJ0zyyIAXiT4XOGqbTDq
	5zCxToQ6kD2wvKBuoRdV75baUaSL4lhqEjJyUY1ydSRz+F4ClFU3WmsuT32/mXaVJZ1ciGP/v/y0r
	tIkLgMf6x75glUfmYV3ZhRUiwSApzR8+APcRASenf1K7+yY/BPFXea5jM0d+9/Yh+/3l8kaQxCKki
	vWRrD+RgSjp4ZMFUnvPZ/PKzr++xVLeSTnX4Rcd7H1bvLEr5QbBMbz/vjL5FI5F8AbzQx7bl3tIOU
	plAcguJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9vf-000000021Qb-3QgO;
	Thu, 20 Feb 2025 17:01:39 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9sk-000000020Za-266C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:58:39 +0000
Message-ID: <3a6e95ea-cdb0-4239-bb47-b29df45f52cc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740070714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSAZDU3AQ1VuBM+5kuWntriYIhfJE92ii0LczQ8TURY=;
	b=Pb9PmXpWIMKQJkmpnNqDfCGZgWDI5wwWnFau35gLZoTY+H8QCNvPYANLWGC+16l6mTPgFi
	orT1GIthN1+y33Gzcvs4n5kP7IVnIbKjiZ8FmvnzWUm2hlW9eOmfFIq+GnIF0SHefEN/o8
	5VPUYY5vg56awFcSldq+DXTogIDfAig=
Date: Thu, 20 Feb 2025 11:58:30 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: xilinx: axienet: Implement BQL
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
References: <20250214211252.2615573-1-sean.anderson@linux.dev>
 <BL3PR12MB6571A18DA9E284A301FF70FAC9F92@BL3PR12MB6571.namprd12.prod.outlook.com>
 <aa58373c-a4ac-4994-821b-40574e19be3d@linux.dev>
Content-Language: en-US
In-Reply-To: <aa58373c-a4ac-4994-821b-40574e19be3d@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_085838_688125_27E2FB6E 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

On 2/18/25 11:00, Sean Anderson wrote:
> On 2/15/25 06:32, Gupta, Suraj wrote:
>> 
>> 
>>> -----Original Message-----
>>> From: Sean Anderson <sean.anderson@linux.dev>
>>> Sent: Saturday, February 15, 2025 2:43 AM
>>> To: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>;
>>> netdev@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org; Paolo Abeni <pabeni@redhat.com>; David S .
>>> Miller <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>; Simek, Michal
>>> <michal.simek@amd.com>; linux-arm-kernel@lists.infradead.org; Eric Dumazet
>>> <edumazet@google.com>; Andrew Lunn <andrew+netdev@lunn.ch>; Sean
>>> Anderson <sean.anderson@linux.dev>
>>> Subject: [PATCH net-next] net: xilinx: axienet: Implement BQL
>>> 
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>> 
>>> 
>>> Implement byte queue limits to allow queueing disciplines to account for packets
>>> enqueued in the ring buffers but not yet transmitted.
>>> 
>> 
>> Could you please check if BQL can be implemented for DMAengine flow?
> 
> I can have a look, but TBH I do not test the dma engine configuration since it is
> so much slower.

I had a look, and BQL is already implemented for dmaengine.

--Sean

