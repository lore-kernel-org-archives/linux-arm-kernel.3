Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B451DC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 06:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0RNhMfK3sIBzFbukwC318fh71Ziu5vXXAkpvIWDZxI=; b=Ii7IWh9nrjiK6321klpjAXGh3B
	g9i9euLxZ1ny7MO87x8Em+fhBW9ZEhC/9Ys3VMExlPps5Uc1xr0/yBlH02sxSMRHKNpZ8ewWffpXO
	HUc1oUkI6sIrARLwMAXlMYHI/R/WewDZma8wKa11Yr7lAAfoH+aoeLgFUr+DBhUm/Dx/BMddoN3bp
	RAnF9DEEFq2dgBvcyEXcyybHAGoMRxWomvZ7rhGcicXOyRZYwUvpN3d+r+us2/R1sV9XTESSGWYg2
	+4oCM7G7fFTY8+fkI0+mNdWOIvUTCTa/Hqa+0ggMUIQCVpn8Nq60Rm4M7PmQVxjyCH88Odc0TO9gQ
	G8Lb8aFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAjlt-00000000yWV-2xIl;
	Fri, 02 May 2025 06:21:17 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAjjw-00000000yDX-1GyL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 06:19:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5426IsIj346797
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 01:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746166734;
	bh=K0RNhMfK3sIBzFbukwC318fh71Ziu5vXXAkpvIWDZxI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oPDN5om4VdiNS9FHLM0mQHoXcY1TMVEPLCYYtP4ccAerBHC7wM0LQ3pbfQCwJvMpj
	 1+/FoT5lVgrky8w2nFwSuTeougZmyvZXCLlMgtsoLneMQ66CpZtqHk0rIh/DnP62Of
	 Utwy567detCy+Xg2uBg5MFrj9tBqiUd4CYxcQ4fA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5426IsJO022218
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 01:18:54 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 01:18:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 01:18:53 -0500
Received: from [172.24.30.16] (lt9560gk3.dhcp.ti.com [172.24.30.16])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5426IlMR072250;
	Fri, 2 May 2025 01:18:48 -0500
Message-ID: <64396b06-5ea7-4da9-b854-b3d42f2b9bde@ti.com>
Date: Fri, 2 May 2025 11:48:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/4] net: ti: icssg-prueth: Report BQL before sending
 XDP packets
To: Jakub Kicinski <kuba@kernel.org>
CC: <dan.carpenter@linaro.org>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
        <daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250428120459.244525-1-m-malladi@ti.com>
 <20250428120459.244525-3-m-malladi@ti.com>
 <20250501075357.37f2dc4f@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250501075357.37f2dc4f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_231916_476108_45A2395A 
X-CRM114-Status: GOOD (  16.68  )
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

Hi Jakub,

On 5/1/2025 8:23 PM, Jakub Kicinski wrote:
> On Mon, 28 Apr 2025 17:34:57 +0530 Meghana Malladi wrote:
>> When sending out any kind of traffic, it is essential that the driver
>> keeps reporting BQL of the number of bytes that have been sent so that
>> BQL can track the amount of data in the queue and prevents it from
>> overflowing. If BQL is not reported, the driver may continue sending
>> packets even when the queue is full, leading to packet loss, congestion
>> and decreased network performance. Currently this is missing in
>> emac_xmit_xdp_frame() and this patch fixes it.
> 
> The ordering of patches in the series is a bit off.
> The order should be something like:
> 
>    net: ti: icssg-prueth: Set XDP feature flags for ndev
>    net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue ...
>    net: ti: icssg-prueth: Fix race condition for traffic from different ...
>    net: ti: icssg-prueth: Report BQL before sending XDP packets
> 
> This patch is not correct without the extra locking in place.

Actually the order of bug fixes which I posted, is the order in which I 
fixed the bugs, while running xdp-trafficgen:
1. ndo_xdp_xmit() wasn't getting called because of missing XDP feature 
flags check.
2. kernel crash: kernel BUG at lib/dynamic_queue_limits.c:99! and was 
fixed by reporting BQL for packet transmission.My bad, I forgot  to add 
this in the commit message.
3. kernel crash: kernel BUG at lib/genalloc.c:508! due to memory 
corruption in DMA descriptors and fixed it with spinlock
4. kernel crash: kernel BUG at lib/dynamic_queue_limits.c:99! due to 
race condition in netif_txq and fixed it with __netif_tx_lock()

But yeah I think the order you suggested makes more sense. Let me try 
that and post v2.

-- 
Thanks,
Meghana Malladi


