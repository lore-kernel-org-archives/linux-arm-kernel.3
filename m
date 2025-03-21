Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBC0C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Axdj0QnFgjxfraWinlzlf+n30BytYhrhTX2isoRR1xs=; b=PfACGH1G60yBAaxRmypESrvYoE
	EV1RpNtEf7Ec6DMiAqRWT8pluFCVMJGFKJqvVrOmiWhqB8LpI6ANXNrUrsu8jGNDtYH9XbqGb0LOY
	cyrp2HgQ0CDN2SBQJqwLBX0cQWRkOaOaBmcpj5GqyqlLazEKiZ2qVxQgvqrVPcN5PclgI0QZRsBas
	TkrkKKhu4C4fk/O7unqjA5ZVYXSjUmYM7sWYkspXkZ8pO1WWWVZ4RLFxfQTmvLlWzRqKtW8jFZDBK
	f9w1TRaZTY3SQR1jLbLplOzNPbgz6mIwv3HcgPASy3WGk7ElMIRLJva0MFwdMJV4zqlFn/1thGKpk
	RLGDc62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXUp-0000000EDMU-2RB7;
	Fri, 21 Mar 2025 08:12:51 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXKN-0000000EBip-33OW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 08:02:05 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52L81aQZ257023
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 03:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742544097;
	bh=Axdj0QnFgjxfraWinlzlf+n30BytYhrhTX2isoRR1xs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CuIyKFbscqKOjmXrH91k9s8t7OXo3P8jAqitsCtKup3PkMQDhDHqpcDl9maXUkTgx
	 LqogDkZUthqCdXKeM530PWhXw85t1MCQgxcer+T2av/4vPKLgZ6TazhqFwcJYPkXef
	 rKQQC8AtMWn100ZzBBD/xytYBaMtGbE/CE93Pd+0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52L81aBj008848
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Mar 2025 03:01:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Mar 2025 03:01:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Mar 2025 03:01:36 -0500
Received: from [172.24.19.92] (lt9560gk3.dhcp.ti.com [172.24.19.92])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52L81UVH114513;
	Fri, 21 Mar 2025 03:01:31 -0500
Message-ID: <48519536-6756-4d3d-9bb1-09197248df36@ti.com>
Date: Fri, 21 Mar 2025 13:31:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: ti: prueth: Fix kernel warning while
 bringing down network interface
To: Simon Horman <horms@kernel.org>
CC: <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kory.maincent@bootlin.com>,
        <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <jacob.e.keller@intel.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250317101551.1005706-1-m-malladi@ti.com>
 <20250317101551.1005706-2-m-malladi@ti.com>
 <20250320125349.GN280585@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250320125349.GN280585@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_010203_932314_6B8F4667 
X-CRM114-Status: GOOD (  21.54  )
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

Hi Simon,
Thanks for reviewing the patch series.

On 3/20/2025 6:23 PM, Simon Horman wrote:
> On Mon, Mar 17, 2025 at 03:45:48PM +0530, Meghana Malladi wrote:
>> During network interface initialization, the NIC driver needs to register
>> its Rx queue with the XDP, to ensure the incoming XDP buffer carries a
>> pointer reference to this info and is stored inside xdp_rxq_info.
>>
>> While this struct isn't tied to XDP prog, if there are any changes in
>> Rx queue, the NIC driver needs to stop the Rx queue by unregistering
>> with XDP before purging and reallocating memory. Drop page_pool destroy
>> during Rx channel reset and this is already handled by XDP during
>> xdp_rxq_info_unreg (Rx queue unregister), failing to do will cause the
>> following warning:
>>
>> [  271.494611] ------------[ cut here ]------------
>> [  271.494629] WARNING: CPU: 0 PID: 2453 at /net/core/page_pool.c:1108 0xffff8000808d5f60
> 
> I think it would be nice to include a bit more of the stack trace here.
> 

Sure, I will attach a link to the warning logs in v2.

>>
>> Fixes: 46eeb90f03e0 ("net: ti: icssg-prueth: Use page_pool API for RX buffer allocation")
>> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> 
> It is a shame that we now have more asymmetry regarding
> the allocation of the pool and unwind on error prueth_prepare_rx_chan().
> 
> But if I see things correctly the freeing of the pool via
> xdp_rxq_info_unreg() is unconditional. And with that in mind
> I agree the approach taken by this patch makes sense.
> 

Agreed on the asymmetry part, but I am not quite convinced on why 
xdp_rxq_info_unreg() is freeing the pool unconditionally, when the 
driver is the one which is allocating the pool. If xdp_rxq_info_unreg() 
is freeing it, then shouldn't xdp_rxq_info_reg() be allocating it ?

> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> ...


