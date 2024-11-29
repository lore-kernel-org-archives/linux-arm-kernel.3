Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABEBD6EC05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odMVq21jYY34p1NFSa+jLgipYWytlXeYovRyB88/PmY=; b=A9Bs/VWPhD7BzNDMGdECGg7FSe
	962+NJpIe1/XhkuPwzSqMBs7UsXEdO2lZfrkcQXUUSyMnxntQPx1MXYua47HTNdAMvL4zCroqnyBb
	iUkQAafBVE9KEoagak+dlOuk3NoetzXC7faCmV48qyS52Wp3gfURfXFrpa0MsYQz+1i4NzfXCcIrQ
	IW89lqUxBVtf2atU5Qvw67BAUjGg8NqAVk4snFyUaSMfeZAA3fxurF+QUg7VUNgOt6vFZ+QaI98n6
	PogPL5o+PyIkLHcKP1AueOSHidu6+UHvrVl28lgnyArebIhfSkNWcuUfMN5jpOz3bQeP+VMi6LK7u
	p1dWtZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH0cN-000000008bT-0JFw;
	Fri, 29 Nov 2024 13:01:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH0Zk-000000007r8-2Xel
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 12:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC25F5C5D81;
	Fri, 29 Nov 2024 12:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F656C4CECF;
	Fri, 29 Nov 2024 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732885103;
	bh=sq/YLAb/fB+2vkIJfrLd/Ha67t4otVRZ7+d52cxNFXI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q7kF5xOB27aQnYfMlebD1tv+LucTFpSonUqh4/C42D2KymsHuuuYHJfajqQ2GiK1n
	 HYKcPvcK5X+a/go5MSnR17aKSyiocpm7v74tmP/1DAyX7V5UTiqFxOrXtaoMrHb6Nd
	 epuar4o9D8HJHP8E8N73bMSwpBUwAoljsbuva5MUKbsuHJ8Bsahl5atHbawjX4PbvC
	 kHoMKvDUAb/e/1JvtDMdC3o5e/QJ73hIRYwpxTtoteEowCZZFOq1CT8gCqWfl4BM4E
	 AUdY/pOBO0IX6XJc7oqsuaOm2rrTBMBdPzLDaBjPVGJnWuvnA0GqozwSDmK0ZIHjcJ
	 tq7y5/qjbHmJA==
Message-ID: <5b6cf8f9-fdaf-4719-b1b2-f4745c671263@kernel.org>
Date: Fri, 29 Nov 2024 14:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] net: ti: icssg-prueth: Fix clearing of
 IEP_CMP_CFG registers during iep_init
To: Meghana Malladi <m-malladi@ti.com>, lokeshvutla@ti.com, vigneshr@ti.com,
 javier.carrasco.cruz@gmail.com, diogo.ivo@siemens.com,
 jacob.e.keller@intel.com, horms@kernel.org, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, danishanwar@ti.com
References: <20241128122931.2494446-1-m-malladi@ti.com>
 <20241128122931.2494446-3-m-malladi@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241128122931.2494446-3-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_045824_690436_12CA6F7D 
X-CRM114-Status: GOOD (  11.15  )
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



On 28/11/2024 14:29, Meghana Malladi wrote:
> When ICSSG interfaces are brought down and brought up again, the
> pru cores are shut down and booted again, flushing out all the memories
> and start again in a clean state. Hence it is expected that the
> IEP_CMP_CFG register needs to be flushed during iep_init() to ensure
> that the existing residual configuration doesn't cause any unusual
> behavior. If the register is not cleared, existing IEP_CMP_CFG set for
> CMP1 will result in SYNC0_OUT signal based on the SYNC_OUT register values.
> 
> After bringing the interface up, calling PPS enable doesn't work as
> the driver believes PPS is already enabled, (iep->pps_enabled is not
> cleared during interface bring down) and driver will just return true
> even though there is no signal. Fix this by disabling pps and perout.
> 
> Fixes: c1e0230eeaab ("net: ti: icss-iep: Add IEP driver")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


