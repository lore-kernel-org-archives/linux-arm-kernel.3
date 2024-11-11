Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1082ED2E9D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GX/AmvvLGmgAHR+8d75DNySRXdN/85YH9dV5UHe/s2c=; b=sEbSOpdXDIIYg3SE9jbHQ9ViTF
	B2BOaLZ7gI/vvbHWkvKzmjPo/xvS8DqywzQpuPpKx7mqfBNHTKesDG2k+qmpManmd8ITqIDFmdUH0
	jV6ofqmg9xH3SitbRcDvUvGNxV1XNFJ2M+4lTsWS4LMhNmsSgTVPJVLRuaSAj/DKdnO33YaBglzcx
	quu7h2u5sYu02CHr/Y888V/8aBIIUVk8a7xP2xWSyn6x+Ycu/SfN3hRyVx3T6qEmUGeqgz8vdvRUc
	/+jXWOKKdUtJ/lSjrrmhdqFj1HmzTEVDFBcme9JYlgNhK+P0D00ljzfMEkqnjnqReLpUqC0Pr+Vat
	qvvvkQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARRk-0000000HF1Z-2HJB;
	Mon, 11 Nov 2024 10:15:00 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARPI-0000000HEla-3KlW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 10:12:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ABACGgg049298;
	Mon, 11 Nov 2024 04:12:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731319936;
	bh=GX/AmvvLGmgAHR+8d75DNySRXdN/85YH9dV5UHe/s2c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VApo6Z1IcC1HudRJYq174QMyhUULGZ1XzQXAJio7rsSAnaivS1GzljPFKoWkvlU99
	 RS+6kSBSMAKeItq9fbC+zFufmFxAKIgdtpLlKWhlT8Y+SAYBRi+uSKjLzfnEXGveod
	 7Zo1Ws2YuNJ4Uf8Lwy3t+Rp9e+4/KppW/1zAO5As=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ABACGeP010887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Nov 2024 04:12:16 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Nov 2024 04:12:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Nov 2024 04:12:16 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ABACBIA026399;
	Mon, 11 Nov 2024 04:12:11 -0600
Message-ID: <73f3de15-7cb3-4527-a06b-2a86e73d75cc@ti.com>
Date: Mon, 11 Nov 2024 15:42:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] net: ti: icssg-prueth: Fix 1 PPS sync
To: Jakub Kicinski <kuba@kernel.org>
CC: <vigneshr@ti.com>, <horms@kernel.org>, <jan.kiszka@siemens.com>,
        <diogo.ivo@siemens.com>, <pabeni@redhat.com>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
References: <20241106072314.3361048-1-m-malladi@ti.com>
 <20241107111542.19dc55e2@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <20241107111542.19dc55e2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_021228_913168_7BCC0DCD 
X-CRM114-Status: UNSURE (   7.69  )
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



On 08/11/24 00:45, Jakub Kicinski wrote:
> On Wed, 6 Nov 2024 12:53:14 +0530 Meghana Malladi wrote:
>> +static inline __u64 icssg_readq(const void __iomem *addr)
> 
> two nit picks:
>   - since the function is now fairly special purpose I think a name less
>     generic than readq would be appropriate. Maybe icssg_read_time() ?
>   - __u64 is for uAPI, to avoid type name conflicts, in the kernel
>     please use u64 without the underscores
Yeah sure, I have updated it.

